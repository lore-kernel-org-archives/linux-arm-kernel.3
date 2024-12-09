Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787C5E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=; b=snovtAr2rn7KmnvuPvhSLg+hvQ
	KnI8RzSN7yFWrlU4bAu+2MvnsSVXxVhM/qxsbxiNKHzPpimm9VhsX9KLGh7FTmCpaUWmK/cXaYEoH
	DruXj4SBOP68S9xZKggA651uNuEjtFY4bn57x0xoOVsPKI7lBB6MR7IMW9Hp7alVpAW+Eb+/V6flp
	ThkxTsEwrxya/JjxYYBVeeePqnSdEPwaajHq5hLOobknRMVOMv8Vnt7DKexAYyinhAT8tVNuBElyV
	KFDyrGql3HCk17a2795J/noKB7qQHQwpEQp21nk/HmqttehXbFUJV8ckqWe0EZOE1nivzX+qn9U9m
	c8ZqBS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZpv-000000073M5-1iFJ;
	Mon, 09 Dec 2024 09:13:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZoF-0000000732Y-3srL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:12:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so2301833f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 01:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733735526; x=1734340326; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=;
        b=Ff4OoeFD1SIYR9JFYWB/lcQxRMP6T3j7h2CpZ2BwgIYi8Nee9eoHAkjOlBt+bbH5gV
         gZSTG5buYc/IgVG5jpkK0Q5vG7OA2iOLxQ9waQI17soXBBxjQcqQxpmafNdsS5E7X1uH
         ntS58+WJRwlRoFwTQHtFZ1wn30psJzdYonb0gRqHx7dS/SAhFJhdnxt3itYZtlfvpqus
         UnsZ8lt+wmBmQDHG1gUmDOu3EQTMLzqvsBl/BBhEmHh9gaJ4k2tjCg1gLrhgI24cj8al
         aw4EdycfiyQlOhZ5J7Sg1ePHqi6GIMzZ10oxZT4xdvPfysoJ2mLDeLcCemasG2D0ewnb
         DX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733735526; x=1734340326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHbMlbgWO3bzBNNeHS2sHD9CC6+WaWdJ9GK1c1w2/jU=;
        b=UtZPMFmmMDwvqfXOFtcWgCd4BMAVj7O9XsD3GdtYxfyZgKLCJLxYIfyopFbwUcly19
         0gwWIBrR2ewFoUje7p9u+IH57vhVeyvYcoapPXkYJQOE8zFkYEtjWUjZGjDsGcujDI4T
         +7zNQXodeJ6qNRCbXPKjVBa80m4BTU3uMoB+aCj/auzM6ECrVMNXzxlxKKC6RslsDEg3
         TMLVkBO4iOtGLxtrL+h1d6lQHSoFyY5/yDibFqKQ74dh/500kivWytk1PrG7661s+WFR
         QxJWI0XFrTxrZkZCTYJXjE9snoetOVz6SlBhEe29E2FZgGRYWM0dvq+YW7M6imiYmVMs
         LKBg==
X-Forwarded-Encrypted: i=1; AJvYcCXHyB0UPj4oG2RjZveDo7KC0qUldQ/LGdSyiazGcmqeC6rsUo+Now70LRD23hXVVbmabmgMtosRkRiu2T9D76Wp@lists.infradead.org
X-Gm-Message-State: AOJu0YxuM/NJCRi98/8kk1EUSdH1vWIY/JZ2gBIunvbAZOFF+erHF9fz
	9pEQ99c0kRoGKwGIZx+CbGSo2vId31wKzF3jMInL1G0CSWzzZR1te+fP79AwR0A=
X-Gm-Gg: ASbGncv6LOK5yvtRmQmQKzpcKK/2fIwdflgL2cxVwh+vlbyZPXChlCFdHMejVxhh/x+
	eLrYiu2O3KTS/fW46bcNX5vhcEo5oqkCuqqwNz4C//cRAqaBFYDriwZxSxGcZxZCF0beEidcwsI
	utQ/VDRvHcC4iu4XmxwO85eZQ+CX+YwltGkYdxlEgJguCeWB+vzKhyNe0SmQz7/JJF851NaMJhL
	yja8C7F/SM+6Egfm87AiPKEvILZe28wNKazqP2Z6nkiVfkm1urNfCY=
X-Google-Smtp-Source: AGHT+IHhPb22PMaOGlccXXjnxqHxj7jC1Q4B6r+s69ZPmdovPN8G0ra4/yZH2uddmSFXwQMRXgGvAw==
X-Received: by 2002:a05:6000:470a:b0:385:dfab:1643 with SMTP id ffacd0b85a97d-3862b378d0emr7400128f8f.27.1733735526245;
        Mon, 09 Dec 2024 01:12:06 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf4045sm12708923f8f.8.2024.12.09.01.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 01:12:05 -0800 (PST)
Date: Mon, 9 Dec 2024 12:12:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <e75495ca-7cc4-48eb-ba27-607de6951181@stanley.mountain>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
 <7fe840af-d56d-4cb6-8d82-d42631409b2a@stanley.mountain>
 <4c39a5a437fa42d483d1f704ec7ab4ac@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c39a5a437fa42d483d1f704ec7ab4ac@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_011207_968191_BC33D5B7 
X-CRM114-Status: GOOD (  26.42  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Dec 09, 2024 at 08:16:24AM +0000, Etienne CARRIERE - foss wrote:
> Hello Dan,
> 
> Thanks for looking at this change.
> 
> On Friday, December 6, 2024, Dan Carpenter wrote:
> > 
> > On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> > > diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > > index 09ccd6cea7f2..7bbb2ee55f4f 100644
> > > --- a/drivers/clk/clk-scmi.c
> > > +++ b/drivers/clk/clk-scmi.c
> > > @@ -61,13 +61,20 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > >       struct scmi_clk *clk = to_scmi_clk(hw);
> > >
> > >       /*
> > > -      * We can't figure out what rate it will be, so just return the
> > > +      * In case we can't figure out what rate it will be when the clock
> > > +      * describes a list of discrete rates, then just return the
> > >        * rate back to the caller. scmi_clk_recalc_rate() will be called
> > >        * after the rate is set and we'll know what rate the clock is
> > >        * running at then.
> > >        */
> > > -     if (clk->info->rate_discrete)
> > > +     if (clk->info->rate_discrete) {
> > > +             ftmp = rate;
> > 
> > No need for this assignment.
> 
> It is needed. The round_rate handler in scmi clock protocol driver 
> I added in drivers/firmware/arm_scmi/clock.c expects the argument
> to carry the target rate as input value and provide the closest reachable
> rate as output value, hence initializing @ftmp above. I needed to preserve
> the value @rate since used if this round_rate handle is not available
> or returns with an error.
> 
> Note that I could have changed scmi_proto_clk_ops->round_rate() 
> function ABI to split input target rate and output rounded rate into
> 2 separated explicit arguments.

No, no.  Leave it.  Sorry.  I wasn't paying attention.

regards,
dan carpenter


