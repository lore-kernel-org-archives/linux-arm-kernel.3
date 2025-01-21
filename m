Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D515C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 15:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=; b=gLuX9jXZl1TAS8r6NrWKQBmWjk
	6KEs2QQ/JeewNkCM0j2nubSDUpOLJqkpuU/LJnVkHRjRnUWuE2Thk+rXTwc3rsYhFUaWvjDvKndX9
	IpPHrGwa5MlErzaIOo4xUBW5rT4C/zFnLbmO5Io5lDDiDV9hN1m9ziDx8S3X6B9kRqR9p81crQ6uc
	xkIbQg50FQzOlyAo4Zxv6/sUoEalzDw4PnimEhuAwKIjcaCF86b7vA4pZT7ioaUsenk8P6PgJdhgf
	fnbQD56ixoYgjV+zblRExnS94ltoRtPNp3wy7d9leuiQOMBcY18OsqXO/NqN7DMq2YMkfvg+nyvMn
	GKrUhXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taG5N-00000008Cq5-2A0L;
	Tue, 21 Jan 2025 15:22:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFym-00000008Biw-2FSa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 15:15:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436202dd730so42062205e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737472546; x=1738077346; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=;
        b=lc+CPhCPDVjcGGLT3ErxbI6xTE4mlZzWWFrKiX8Hiu20INpHEY9NTSxcPGF5o3vNFq
         EtR0Iz5uM42gwgGZUmxQ+uWdjvN9XMCw7KseA5UfC8auLSysYFLsRUcvjrg4IFxMJHJQ
         +0Sn2uL2HmuG2Wyf5wotpV/aTEOexnbGKvd1GkP8K9/AisKhuctARpQS2jccZBul4shc
         cozzIWzoqrN3TuWvy7cyiZFYChWUK8uCGJHfi82ITvO0Vp+Dhpsv8vYQN+71FXx6l95z
         hUPBkfepAwXYsNu6dWNCJ+SSsLPz3/6Dqb8wLGFT4rJybr5JsODLz0Owx5d82RsDAQJw
         M2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737472546; x=1738077346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=;
        b=CDZSGBm7TO7oM+k9fEZTZ2c8pc/p+mbw8cvfG7IZJu+fJ7s5205V22oeNcofgzy1Cn
         2fnSuimo2TbZdGcrWOGV6FQycnTAtbeyzDOQppakljFJjw9ykd/7UYLCr2hnhitLE2of
         LiT7ELI3b+X3ZLf7YMLbryzW1v6nDnmpBkIX43w4tFmkbgEv6tfGHyEC2yXzo8+k3Heo
         U+RlCajEz+FJmWm/oYKMa+7vkErbXXKZY8Scd6SFOshsCKJGvpPOKylL2sz0VW1JVBwM
         +2F56efUUEhB4B4r9QiSbT4N74Hcrew4W5XHaoDynE8Sc5BI6j9qzDmsOSXdHs6mGjYW
         70/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx0khJjkcDtO6aZ8dSHrRt1cL92Gu8OvLfzMjDAl8qWWQ9mrbSXYZMGFAfzj77q49NBndgwTbwUDSRsYCySNpZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyRbfVNsz21IdArWOZJIWTgLFSNQTc84nGcHWeToTB8/hqlgdHZ
	JLFs8r2xakGQUDn9BNEEY7m3KLE8c9AhiLHqreNqamAIQP4Y2h/aiNhuEjPaPoc=
X-Gm-Gg: ASbGncv16HYth3NL4vcMy8eTzuizjpVLv0UK9guESI/F8yxuB7r6A46N0d7PBClu94L
	ptcsJ6fiP3ocxCp57ok/4cOLRYmNqlwMi/0F62YGiS1sqgfkiEr2vbb6eBmtqIiOkVSRKSN3l/v
	j2jVq70hIfadKunjlqIiK5IGXnaXnWetj5K5C3vrnoaiOMUjc7w8/vIcV0sMhzmTXi8i78LDFqK
	KzUzo40RkquL2c6CnI/ZRypzZmwjuaaJ2N3szJ8JnFH0m7iTGLOnycdFlR8r60lEQPJZc5/bKI=
X-Google-Smtp-Source: AGHT+IGmWQgLP0oShFNos3lRgIKGS81KPZyyyfYAl5Ap+K5h/aBJR8EY+XcHucmV4GzqhIiM28AjlQ==
X-Received: by 2002:a05:600c:524c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-4389143a66dmr152559035e9.22.1737472546502;
        Tue, 21 Jan 2025 07:15:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm182318395e9.0.2025.01.21.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:15:46 -0800 (PST)
Date: Tue, 21 Jan 2025 18:15:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <bf81200d-4a08-4ed3-b67b-d2cb1c1df2dd@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
 <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
 <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_071548_572243_2D22E3DA 
X-CRM114-Status: GOOD (  23.69  )
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

On Tue, Jan 21, 2025 at 02:35:59PM +0000, Peng Fan wrote:
> Hi Dan,
> 
> > Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
> > 
> > On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
> > >  int __devm_rtc_register_device(struct module *owner, struct
> > > rtc_device *rtc) diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> > > index
> > >
> > c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d
> > 7c9453490d6c
> > > dba510cc5db5 100644
> > > --- a/drivers/rtc/dev.c
> > > +++ b/drivers/rtc/dev.c
> > > @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
> > >  		}
> > >  		default:
> > >  			if (rtc->ops->param_get)
> > > -				err = rtc->ops->param_get(rtc-
> > >dev.parent, &param);
> > > +				err = rtc->ops->param_get(rtc->priv ?
> > > +							  &rtc->dev :
> > rtc->dev.parent, &param);
> > 
> > This seems kind of horrible...  I can't think of anywhere else which does
> > something like this.
> > 
> > It would almost be better to do something like:
> > 
> > 	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc-
> > >dev.parent, &param);
> > 
> > The advatange of this is that it looks totally horrible from the get go
> > instead of only subtly wrong.  And it would immediately crash if you
> > got it wrong implementing the ->param_get() function pointer.
> 
> Thanks for help improving the code. I will include this in V2 and post
> out after we reach a goal on how to support the 2nd RTC on i.MX95.

Don't do what I said actually...  Let's find a better way.  I don't
know why rtc_class_ops function pointers take a device pointer instead
of an rtc_device pointer.  Or if they did take a device pointer why
not the &rtc->dev like you suggested?  But let's not do both like this.

Migrating all the function pointers is a lot of work but not impossible.

regards,
dan carpenter

