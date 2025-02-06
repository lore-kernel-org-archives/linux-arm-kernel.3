Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78ECCC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=; b=BIowGqUwc1HkJAilXbypHwynWH
	MwlzYEP/p7s2IpC/Cdhin3l/uKzc+0g/6b50u84eLgvf2rY55JRbvfI0J3TC9U+ry4GLOfzh3jIrL
	QPfl282EAnLY3P4vBB/EV0gANmEW7fVSiTdo0OPvFt1VScAouxU53PT9iQFVJLdDd3KBc6BeO79e9
	SXd0Y0MTHYp9yZc+oyI1GuA9LhCBY7AbSu3xR5QLAuHPnV36Qo7HeY/aIgqm1QYAncogHIEAJPyQE
	ZSkZByTw/QNl31toGHSRcmXuzyPjUc9xmD2LR4n+1Jlz6S8hP1ygf6roVR5WD4U5pE3xUecF3K58U
	uUcBqjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0nZ-00000006Eef-1JtF;
	Thu, 06 Feb 2025 12:16:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Nu-00000006CBU-0KB6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:49:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso5447795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 03:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738842568; x=1739447368; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=;
        b=ECpOOr9m0ho9ALyzXRgDbX4pWYdmAWKW+4hXbSc2ShlFHU5qoEydLNGry8HWha9Wqt
         284mSGsbwGVExxnkhBq/dDr7ZYZf/95PPDdFtuyQ8WjgTGJ9QsqQHR3Vif+7/EQXHy+8
         6Y/ynZWvxa3FmD/1Gx+g0HfYhdHZbXOe9RYUG0Cd/6DB43Xv7s7qwDxqGrC1k09Rip21
         otVwcpUg73fB59TtowILnHX3oSYCoAnFfiMZK/wYK73L5R32egoYbuGe/r9jSkHN8r1C
         jks/PdbPRkvYdmdjfedDtxklDSa81WEqAEZdNfCgAXzNKJoclHaLu1ueT4w1axseMbie
         enQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738842568; x=1739447368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX9ms/4I8NC6zrc1aMCv7TAeR5qd6HJ58Z3muKUA91A=;
        b=IaBMlGBEwqlY2uwRb4uGazwRiZldqUv6xBV5up8zqeAqBso/JVN/W/8dWTE8M/jpuq
         16P5L+i0PpHF5uSD8Ce5/7+5ATF+SxYni5x3NAPsjAKLKHRNnElKnHHQTYseqvGOPpwG
         FhzhYh99HDKbbnRBIrntUV3czsZnLcNVhZuM5aP+w88XRTq3tm6aMGW9RqWDyovAL5b3
         62M4RCRsfzoJwGaNxWNZlUnuuuiiGs6t1nhR6psczxA6sXMF3WaKZvHUqWfuwBzoKxYQ
         D8DpysuzvG+Ex+ZIzu1xnD4ZCsqNl8Z+Ghgi2DgzPEXrHcFSWOKpL7258Fxa7JQxjCHb
         LiRg==
X-Forwarded-Encrypted: i=1; AJvYcCVHh7Xcwe5vTTXYx8FAGS6H5/prdzUpqHUB6yCBBViXfeCZYEMKJs1VR/kbsRLS7gPEkFKT0b7xHZ1IQieYLxug@lists.infradead.org
X-Gm-Message-State: AOJu0YzNTqUKUsxB7ypCGEIgYofEYnrKqdRFtMIhGXpNl1RguMr9392L
	qyHArwQLD4c+elZ20axadeM70l/Bq2eeSCt7hDI8XJ0/6wsqUxqGMzIz7nTWdKo=
X-Gm-Gg: ASbGnct9bD67tTeCf5PZDGEaQM841L27DwJWU1x/3QP3x2fIWzaE3cbbXouh5jXwb3q
	i8boe+ADTg9ZF1yzUrAAHARj+XTE6aBWLs+3fDViXn09cLmDXiJvum2y9Tb7KqFtgX73/OyLjd2
	+1ECRpymv5j/8E13cOLmM0dgK0we5ycdNIqcySO98CHL4itHHs6Y2N+AZOLKUNvR4Ry322ir6b/
	HXg1MQwOYd22/l4hZSKHcB/tb2eo65tlx0WVPRDYdAz1qXYgmJ4YjRYvx73PNlg5jPSDPdx7/xQ
	vvPBka/4kCjHG30Wmrux
X-Google-Smtp-Source: AGHT+IGBjV9LowhqFquW+OEjP5fmaVEQ40WZqgqqY5aomaJpQL2ZwcJcaosKDFlLLto2p8sEGWzZkQ==
X-Received: by 2002:a05:600c:46d4:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-4390d42ccb9mr56959955e9.5.1738842568525;
        Thu, 06 Feb 2025 03:49:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4390d94d685sm52793145e9.13.2025.02.06.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:49:28 -0800 (PST)
Date: Thu, 6 Feb 2025 14:49:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <1a420172-de2f-4602-a181-be79bff0bb2b@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_034930_118369_FB02BF17 
X-CRM114-Status: GOOD (  26.23  )
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

On Thu, Feb 06, 2025 at 11:42:12AM +0000, Cristian Marussi wrote:
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > > >>  	device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>  
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > > >> +		       int protocol, const char *name)
> > > >> +{
> > > >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> > > >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > > 
> > > This means when creating scmi_device, a flag needs to be set which requires
> > > to extend scmi_device_id to include a flag entry or else.
> > > 
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > > 
> > 
> > Yeah, I like that.
> > 
> > -	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > +	if (scmi_dev->flags & SCMI_FWNODE_NO) {
> > 
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
> 
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Great.  I think we're on the same page then.

regards,
dan carpenter

