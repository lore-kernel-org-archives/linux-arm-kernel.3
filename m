Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E86D6B6D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxptXU8oKSlVF2fvRzkZip9fG/KS/MTrvVI6j9ReCRo=; b=gFDA+9ced2EBRHSSXC05VniG1c
	m712CTZNyRuXzIJ8r0DvGH5R/yVtz4g6X2X6d1OQ/mgBnSiXbvvsiHcFx4KxxofEfcJppEC6B+WnQ
	6Exvd0RvTWn+DYz3Pm6zMdQm9FjpElou30IOl0Ch2CU+qebfQmuXIzkK7eBjdPevWDYYgtSYGJ6N3
	VPBX4U2FlGlQUhcKr/rMBEfH/9Fcv7Si0vBkQTOEsHtSyZtb0yMEb+weoV2vipMwW4v6Chv3v2A8b
	wt8HBaWrQUJQNi6jeKjN89tBk4szHhl54yIwRnUsIM3M13dC5Q7c2wNyhkNBDYr33Tk00cigLDDPf
	T+U+Avqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FDT-00000001eQt-3yQg;
	Wed, 30 Oct 2024 20:22:55 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6FBp-00000001eCn-1sbw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 20:21:14 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e31af47681so165104a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 13:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730319672; x=1730924472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxptXU8oKSlVF2fvRzkZip9fG/KS/MTrvVI6j9ReCRo=;
        b=AkBPEttBV2j73XIQxMnRjnFLL/uzhoObvkUPbcuHxPap93ZRl5Lb3Cy05PfIXDbJkZ
         7fuTew+diuCrepLqme6yVMFQSeq20iGgkqCdiG+ASDoxKgKfgRvsNIU9YwQr0+1CST54
         +2V0RAJkAMCFIg8mphfv1ocLlacjRD9+uv/HZ8yQCoGo6KyYr99aCyIEHa3ilGSfbGP0
         U+0hs83O6L4g2crWN7tiy3voJq5kJ6eySHvaRbUuM26GlTZRcuz6r/wBZZdEwPeWtdnL
         UjK4W2I2j6ilSegzexsg+8cpyRCCVrsbz70l5wCppCoMLEEk4MoRzPi6Sio9k18bma0I
         9CxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730319672; x=1730924472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxptXU8oKSlVF2fvRzkZip9fG/KS/MTrvVI6j9ReCRo=;
        b=gSfx8xv8t7tGnwhUUNpfPKBtGI55dLYOOoWwxY/L6K4Zh1xqHbrmbHXQmykKpIulDg
         tfpu0++7/ITA+MzzQ5hmftjSBZznndSjmEzEJU0jDxJELq65W/GYEm/i7K2Klz3IuCvG
         aepLRmne8FrQSKQiMuzMSmbH4DqjLrbEXtLRvtGmbmJXMoE57U2jHoPMcAgdLK4CDiC1
         JmnJY/E8iAdHRedkj28pJb2VUwswoWue0xONvz6lHlMEXxhd5bm6IqN4kLgp0O5wr9Xl
         DYsrx0OVryh/nmbzESFyTJ5hD+BJcQyS0RkOnvjX49kR/U9ahqibaRGktIKM4bjywm02
         CqxA==
X-Forwarded-Encrypted: i=1; AJvYcCWy0Bgoi3hxdDSuAYijuKUxEYXE4TBy58FJKTLQbpLpizUH1J3z65r5cXOo9bMJg2O9zLb2RUYiwzWGuRx2fQb7@lists.infradead.org
X-Gm-Message-State: AOJu0YzTVjSqMCTlkD5jIfv6uJan/bzaOyj9rft+Rou7CsuG8xas0KLq
	mF0GRQITjoeVXAgUvLnRoD3ZRfuE5QcvhFDxHQcpYbq/o+cfKbj/EKa/8bsVFHy7IV8EcqiJdzz
	0SxUlU7srTz2RfTQ+A9TTNF4GylH9Yw2QWSxI
X-Google-Smtp-Source: AGHT+IEP9wXNWXu2pk9j6AVVN/5LTlwN5rgVci/DlwsY/hQHHrt79TYJSPQXM7eBts4e9mwGpTVwOvfM4MoIEhR+9sI=
X-Received: by 2002:a17:90b:1c84:b0:2e2:b6ef:1611 with SMTP id
 98e67ed59e1d1-2e93c1710afmr870053a91.18.1730319671512; Wed, 30 Oct 2024
 13:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com> <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
 <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de> <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
In-Reply-To: <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 30 Oct 2024 13:20:32 -0700
Message-ID: <CAGETcx-LGZ1k-seh4LkvCobsxUk67QK40swiQvH6Wrzs0Log0A@mail.gmail.com>
Subject: Re: imx8mp: HDMI display blank/black problems
To: Adam Ford <aford173@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, mailinglist1@johanneskirchmair.de, 
	johannes.kirchmair@skidata.com, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com, 
	catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	festevam@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kernel@pengutronix.de, kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, marex@denx.de, mripard@kernel.org, 
	neil.armstrong@linaro.org, p.zabel@pengutronix.de, rfoss@kernel.org, 
	robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	tzimmermann@suse.de, ulf.hansson@linaro.org, victor.liu@nxp.com, 
	vkoul@kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_132113_496830_E1C30CA8 
X-CRM114-Status: GOOD (  30.94  )
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

On Wed, Oct 30, 2024 at 10:28=E2=80=AFAM Adam Ford <aford173@gmail.com> wro=
te:
>
> On Wed, Oct 30, 2024 at 4:01=E2=80=AFAM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
> >
> > Hi Johannes,
> >
> > On 25.10.24 10:05 AM, mailinglist1@johanneskirchmair.de wrote:
> > > [Sie erhalten nicht h=C3=A4ufig E-Mails von mailinglist1@johanneskirc=
hmair.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter h=
ttps://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Hey,
> > > We had some problems with the hdmi on the imx8mp and wanted to leave,=
 what we found out about it, somewhere for others to find it.
> > >
> > > The problem was that our hdmi display sometimes stayed blank after ho=
t plugging and sometimes at startup. On older kernel versions 6.6 we did no=
t have the problem with the not mainlined hdmi patches.
> > > We tracked the commit down that introduced the problem for us. It was=
 the following =E2=80=9Cdriver core: Enable fw_devlink=3Drpm by default=E2=
=80=9D  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@googl=
e.com/
> > > So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don=
=E2=80=99t really understand what the problem with RPM is.
> > >
> > > So, this information is just for reference. Maybe someone has an idea=
 what is going on here. And how to fix the problem in a more proper way.
> >
> > Thanks for investigating and sharing your results!
> >
> > I'm seeing the same symptoms and previously found out that this is
> > related to LCDIF underrun errors. See [1] for more information.
> >
> > Adam has also started this thread: [2].
> >
> > Anyway, knowing that this is related to fw_devlink=3Drpm is really
> > helpful. I just tried with fw_devlink=3Don and wasn't able to see any
> > issues anymore. So this confirms your findings.
>
> I was off in the weeds thinking there was something wrong in timing
> and/or a race condition around the PLL or something.  This is good
> news.
> Please forgive my ignorance, what does fw_devlink do?  Is there
> something we can do in the driver itself to force its behavior?

fw_devlink figures out supplier/consumer dependencies between devices
and creates device links between them. This ensures proper
probe/suspend/resume/shutdown/runtime PM ordering.

fw_devlink=3Drpm vs on means "enforce all of these" vs "enforce all of
these except runtime PM".

> adam
> >
> > I hope that some of the driver framework and runtime PM experts can hel=
p
> > to find out what is actually wrong and how the correct fix might look l=
ike.
> >
> > I'm also CC-ing Saravana who authored the change from fw_devlink=3Don t=
o
> > fw_devlink=3Drpm to see if they have anything to add.

When fw_devlink=3Drpm, you'll have device links created between
consumers and suppliers with the DL_FLAG_PM_RUNTIME flag set. So
before your device is runtime resumed, it'll make sure all your
suppliers are resumed first.

My guess is that there is some issue in the runtime PM handling in
these drivers. I don't have enough context to provide further insight.

-Saravana

> >
> > Thanks
> > Frieder
> >
> > [1]
> > https://patchwork.kernel.org/project/linux-phy/cover/20240904233100.114=
611-1-aford173@gmail.com/#26014057
> > [2]
> > https://lore.kernel.org/imx/8cfd3052-c85a-4235-b9b8-6d2929e9e455@kontro=
n.de/T/

