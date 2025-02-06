Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F049C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=; b=OrW5swC/TB2SHIyuffd50D3n2K
	+VMaZ+w2y2b+X3SHdV+1wUvYWzBf4mTzlE7FruqZgNnTQMdJSe4MtwyVJPlip6GUFQUjF/91309OE
	nkPkF07VUDLOxAOt06dGUQ/j9FyhTkXeRHcAHI+/4I5FqHNRJQ8wnRnD0ABPmEjuOy2RadGLD/0Ls
	GFWHOP5bEU1bUhtfBTHrpKsBJedBjsx+6OW1auehUbFNlI8JK1bJt5quILKlva030QOvEomlQ+ERv
	6lZ5EkFMN+I3WS4w/R7P2uL0VC8DEPWdSJt+FxtL5ghi5gBV+b4SDc7GdXsAvvtLcuam0s3f65GMG
	CEggpiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Rc-00000006CqX-2F6M;
	Thu, 06 Feb 2025 11:53:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg06P-000000068tN-3R6A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:31:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4363ae65100so8735825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 03:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738841483; x=1739446283; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=u5K05ntfgQvWEVh0tiJXGCCAeYSHVI/jomquprIMfTJQPnKFGyM3Eqm6xVl747GSzT
         FtqSYPJ+lILdFVr3pwr1t1Jdwp1epHOnWzvfWXo88sUbNZO0ZO3P9EnkfTpH01L612/a
         c2I3xl5hDGJy0ohIAgf1k5fbNiecvcrOZhKiSjH+aGAipc3grusXX6xKwUuQbpX9XiqR
         juge3IqLwZXaf0mY2WNT1aBrPRl1PQBBKs7G52mnYzPkBR3bphGkxQLasluJh51pOiFk
         oAckqz64i4TQbCRX8mnNZ2LK0FN1KzOmLZ6Ab3gYeg6TL23IQP7bVi3l+j+ZrK9vFyfS
         mkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841483; x=1739446283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCI1ZBTo4CXvGl9Bx83X1jcDkmWE56kdXG7He5kgffs=;
        b=PKuEJinVBKfwdGsZDZDVsIGZBDRDXPd0uRfvVUGfWiR1pR0jmKmEnVEL8uBdu3pf5P
         3oGSWOQfhwJBDIWV4+1+rIF13/EXmcdD7pCnCKZ0GmLIdnbo5YfagZmWDV7C2usMi7Yi
         kPgscyUJhvrIWsrnHSzQ3OF4H0V7GwBrfwDs2gmDcr+uW7F+OkYp7RWrRufqKvqu1QZk
         cIz5cAn172jIDOnJEbhK66zB8mrBfe6giIZp4rRtmnzEixkgxehtNyATmdS61+SrNybE
         0vtAeFBA+EaCiAwKJ85JtaLgURdGqlsTd4TchHeJDb5bcDxrbND6j+L1yN8YKClnInvD
         nR0g==
X-Forwarded-Encrypted: i=1; AJvYcCUPfjLezrJ0BUQUlAUI+gMpGFMHDPj33+7vpFBbtryxy5Vdoc+IzxSKFbTdM5T5FirXVjXTVRVEhMvLHud+QD8W@lists.infradead.org
X-Gm-Message-State: AOJu0YzO5EUUMG0fW7VlSDs0po0+3sYy/qE819Txee9RZScMhPkkmI4i
	oFOUad/HW/B0LZuzxpK6GS3eGPJ4VqpfugphHKRqzsOlVgJ/mbofa7+vt56qCu4=
X-Gm-Gg: ASbGncuis4IM6NPyKQZy10HBiqFORRFM+JCvM1+5j+yRFG43IvKvkVRI8ig6h3+eqxa
	SSKDCHBoejrcT2HG80sRQgjpyZ+iMHyS1h28rUwTWLAvBz67o16qB38n228hQHPdh4dhr2e11hl
	oKgxDNdaex2w6ORNl/e2443YyLtRIgWRjSZcUaGsEZ0szaLks9g7aPkhKb2aJ6vTmcBGM97eSng
	eh6nveTwKHqg/4jdU9SCPbg2xtHcF7A0ME9qiX2R4vMfbAMXRUugDPoOh0NMxPVJevkCm16Xfa3
	21O/K5HbDTcKI4abqEp0
X-Google-Smtp-Source: AGHT+IH7D8euabfcrwCOQjtY+IXcdW/axRayM6NaqPRFSLZQPDH+rc/cv5/qoeqeWWI69RXkq3ju1g==
X-Received: by 2002:a05:600c:1d1e:b0:434:f5c0:329f with SMTP id 5b1f17b1804b1-4390d43e471mr72311885e9.14.1738841483532;
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d96517dsm52528035e9.20.2025.02.06.03.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:31:23 -0800 (PST)
Date: Thu, 6 Feb 2025 14:31:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206105218.GA22527@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_033125_879600_47B13B65 
X-CRM114-Status: GOOD (  20.54  )
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

On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> >> --- a/drivers/firmware/arm_scmi/bus.c
> >> +++ b/drivers/firmware/arm_scmi/bus.c
> >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> >>  	device_unregister(&scmi_dev->dev);
> >>  }
> >>  
> >> +static int
> >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> >> +		       int protocol, const char *name)
> >> +{
> >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> >
> >I don't love this...  It seems like an hack.  Could we put a flag
> >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> >because that's what we're passing to this function).
> 
> This means when creating scmi_device, a flag needs to be set which requires
> to extend scmi_device_id to include a flag entry or else.
> 
> As below in scmi-cpufreq.c
> { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> 

Yeah, I like that.

-	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
+	if (scmi_dev->flags & SCMI_FWNODE_NO) {

Or we could do something like "if (scmi_dev->no_fwnode) {"

regards,
dan carpenter


