Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71972C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRbGA5hfKNQNoBMn6E9hxMPXAsQYQxuMoAfdDX+Ku3E=; b=RSSah/UiiUjmvc60EJZPPsyEzV
	muwBr+ExFZfxCy3Uksaz8wkPq0am33Hj5jtfzMLs48vCbGadt9Px6lFu0iDpkcWHX3yhJzUwAc5/r
	ltV/lSvJvIUtBwpEnmy5XIXzDo6SI1oeZfe9qBh4IypR+HNwC6pOsTdtuflDffQfDtyhoOodcG0Lt
	uGIVADfGSSeB4O5aoYEOCvBlafvKSFDHz/gyGY9j0WCRf9jifrbs/LKcC0smGCN6lVBW5s4hCYySj
	YBdrJim8Fhk0L3yO5pWEIRDZN5JgyipQVQCWDCrvT0hQ/BcBO/dUv6QCh+mf34/9ca/7XpI6Lc0qw
	hIRl6tuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyrW-0000000B74Z-2mGJ;
	Wed, 15 Jan 2025 08:34:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXyqG-0000000B6ir-1nWj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 08:33:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-436a39e4891so44243385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 00:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736930015; x=1737534815; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jRbGA5hfKNQNoBMn6E9hxMPXAsQYQxuMoAfdDX+Ku3E=;
        b=hCMp0CBT9UyTa6OP9ynZ/RIk6QLRBGtofCUZNVifSmirnwfSoYejUiB08zvhI4xHAM
         2d3aOvN1hzX8q/oiQGhTyYSi8qSFspDYGoctxlV+tt9OCo+i8jVU20iuPc1MQpGkcnty
         /gxgOv/fFHUNpCAZ5r6Q0OKNTT7/L+KI76mwYHKNjiUy4fuPp6KGdqJVeW/gPqFyTYg9
         HKrzcvyy45mVO4fYDS8BB28nqh/4BZjOtpD8mU1fmbE8uKI0yeN1JO61LuXS10A31zbG
         udNoQqMev+Se2MIr18Lg+D/D48wrnCK0pMuarvFi8PdCEP4sm5jUG4uM6XOFiTpH6qTc
         QBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736930015; x=1737534815;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRbGA5hfKNQNoBMn6E9hxMPXAsQYQxuMoAfdDX+Ku3E=;
        b=NdzDB1ukGqxFITISIS0h5Ut+w5rfs2V/FdtYxx0YhAcIO5R2eppbZgx1IBjus1mNpP
         3eY+wM04ddIc1e17XIa3THOj58GY38e4G44lu2EGClHPpUOG2wl0eFwg4T+AxfNxnm2S
         Cdv/osCdhsE+dxtcLixplUHHYNToOeyJDaaK3gUrqDCquVFCOMCbxPi7HT6GWf+SQmc9
         2lSom9KQDFwOA1jMWh07TQuQ+KAGz6cZ39vfVtytqy7QAAxOR5tLrLBAAPAWIqujLN/1
         w1Ph/Lyp/Zoj42O9HaqxeEbc1uYWuwgr6scrHmLa6ZGsmtbCVnvjG3avz/vVkN4kVhPF
         +yAg==
X-Forwarded-Encrypted: i=1; AJvYcCW5oI1078PW6ick4TcYxAtNPrrUdLD6vUMmmX4aB5xhesaYaLpfj9rCO4BSphfC3f5yn5mDkaiW8HSzJ7gBfdHT@lists.infradead.org
X-Gm-Message-State: AOJu0YyotieCYTvMpQhhsmnCE4oj57HyX7TsA8VLgvyHV8JCgZJzV0L9
	PLRDSj04nb5K64UW1Ncg4El4E53+uURUUw1jJjeZ3DZBaJ+35L0A
X-Gm-Gg: ASbGncunw2jz4ZUa+BCP0cKOKCnHiIVSb/6x+5KQL1y6oZ+CSpa68+Mjcgu1TK+NHBc
	GkQuu9oz0+yAj/LPEeghpCoHEDQGiMv5Qw6zKoFmsxx3qCMy791jSh0fL4nrb89gYRuCXyeKj/Y
	6E54IDEGzU9LgVEZlw2w6yN6bQPMP1DwkUnC61uDYikoob3jOgCgvcCtUlS7OWJVhaWVBI0kJhz
	3Dsb76h3Dn2NROT4YH1U6+aimRUjHmRFoh1clklKAyx9YAXbE9lcr502jXtvL3n4Gqfop2m9jYG
	l1YftdEX
X-Google-Smtp-Source: AGHT+IF7Dra5d6ki8O3COk+SLqWcJq2xaGIUHP116tcbjhTFS3reuK1GgRmhqIcUq60sOxi9rfERQw==
X-Received: by 2002:a05:600c:3b99:b0:434:f925:f5c9 with SMTP id 5b1f17b1804b1-436e266dfe9mr223940145e9.6.1736930014457;
        Wed, 15 Jan 2025 00:33:34 -0800 (PST)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c749a127sm15360785e9.7.2025.01.15.00.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:33:34 -0800 (PST)
Date: Wed, 15 Jan 2025 09:33:32 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shengjiu.wang@nxp.com,
	francesco.dolcini@toradex.com, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] clk: imx: imx8-acm: fix flags for acm clocks
Message-ID: <Z4dy3LiEAQ_gkQGG@eichest-laptop>
References: <20250113094654.12998-1-eichest@gmail.com>
 <CAA+D8ANvKQKJhn6qKbPhQeXPD5kxUo3Hg-FBLkDMOaWLTA8vVg@mail.gmail.com>
 <Z4ZRYMf_uJW4poW9@eichest-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4ZRYMf_uJW4poW9@eichest-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_003336_471296_2739C5ED 
X-CRM114-Status: GOOD (  35.88  )
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

Hi Shengjiu Wang,

On Tue, Jan 14, 2025 at 12:58:24PM +0100, Stefan Eichenberger wrote:
> Hi Shengjiu Wang,
> 
> On Tue, Jan 14, 2025 at 03:49:10PM +0800, Shengjiu Wang wrote:
> > On Mon, Jan 13, 2025 at 5:54 PM Stefan Eichenberger <eichest@gmail.com> wrote:
> > >
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >
> > > Currently, the flags for the ACM clocks are set to 0. This configuration
> > > causes the fsl-sai audio driver to fail when attempting to set the
> > > sysclk, returning an EINVAL error. The following error messages
> > > highlight the issue:
> > > fsl-sai 59090000.sai: ASoC: error at snd_soc_dai_set_sysclk on 59090000.sai: -22
> > > imx-hdmi sound-hdmi: failed to set cpu sysclk: -22
> > 
> > The reason for this error is that the current clock parent can't
> > support the rate
> > you require (I think you want 11289600).
> > 
> > We can configure the dts to provide such source, for example:
> > 
> >  &sai5 {
> > +       assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
> > +                       <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > +                       <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > +                       <&sai5_lpcg 0>;
> > +       assigned-clock-parents = <&aud_pll_div0_lpcg 0>, <&aud_rec1_lpcg 0>;
> > +       assigned-clock-rates = <0>, <0>, <786432000>, <49152000>, <12288000>,
> > +                                <722534400>, <45158400>, <11289600>,
> > +                               <49152000>;
> >         status = "okay";
> >  };
> > 
> > Then your case should work.
> > 
> > >
> > > By setting the flag CLK_SET_RATE_NO_REPARENT, we signal that the ACM
> > 
> > I don't think CLK_SET_RATE_NO_REPARENT is a good choice. which will cause
> > the driver don't get an error from clk_set_rate().
> 
> Thanks for the proposal, I will try it out tomorrow. Isn't this a
> problem if other SAIs use the same clock source but with different
> rates? 
> 
> If we have to define fixed rates in the DTS or else the clock driver
> will return an error, isn't that a problem? Maybe I should change the
> sai driver so that it ignores the failure and just takes the rate
> configured? In the end audio works, even if it can't set the requested
> rate.

The following clock tree change would allow the driver to work
in our scenario:
&sai5 {
	assigned-clocks = <&acm IMX_ADMA_ACM_SAI5_MCLK_SEL>,
			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>;
	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
	assigned-clock-rates = <0>, <11289600>;
};

However, this means we have to switch the parent clock to the audio pll
1. For the simple setup with two SAIs, one for analog audio and one for
HDMI this wouldn't be a problem. But I'm not sure if this is a good
solution if a customer would add a third SAI which requires again a
different parent clock rate.

One potential solution could be that the SAI driver tries to first
derive the clock from the current parent and only if this fails it tries
to modify its parent clock. What do you think about this solution?

Regards,
Stefan


