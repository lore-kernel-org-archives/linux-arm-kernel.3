Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440F1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=; b=PeJTaWH7BDllY2SO9IoysErOkX
	1V5ffkJ4GZgEvXV5NOUv1oNqGpifA7fIcNP37kC6uS8LEDKVxV5z95/ibZ13MmH5pRQNU6yeLH2sa
	9JXXC2O5qdt7l01BkPJcyoDG0ANdpH7pT7moGfngD7nQ81NaLqKqrvpodoVCyYb6o5yn+fSfWmjuT
	9r4XXIHQDzq/KvKDLv1hYtsPUr6aF3d99FnRNtlgLnY6mpWOCYhYicqm2BeyHxenBk6yZnqLdlmms
	AXq1/VSys3fGeMb68RHjr6Qi46qA0cGxxnpMsl0i4QCAkixaPlo4YcHCj4p3XHminmQgwQen2n2gi
	YmyyzJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUab-0000000AHBn-2IM6;
	Thu, 13 Feb 2025 08:28:53 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiUPo-0000000AFIH-3TW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 08:17:46 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5450abbdce0so567354e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 00:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739434663; x=1740039463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=ZTZv2A8XM0jw2Vc3b+CTw6IwDWKMKbWpFnc/Vo45mYUtiBPlIrEkfmqiuu/rAZ8QpY
         s0Jo3IjrTjB6aQ6jHKaOQLKgiMpGIpDXrgU7FjHDMJ93rCT7l2aDheF7G750rUh1D3DH
         nCYJMaTo8sKA4gywKjHjSOSWKfQuxWxNIC0gLD7cTYmFvyNpUyrGaURhca6Q+iNqQwbN
         ULGSIWJteGxD+vfvJfX3rkiDHEHFAI5xhZXYmRkFC0WMdE3Ttrl6oBNeZQjhTfxZnLkt
         tYpCfN+MO+4f0AEzdUuuw2XRYZVPQMF9HSn2GbSsQJSCmlbenZaAjooF7mHgeLn+Y0n0
         zSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739434663; x=1740039463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fEfu8GLWbh9oVDTAIcK1Jbp7CxeZowSLouxzJ5V5kc=;
        b=VnXQbnKBY+3G4AoCKFD14xfFJQ6rjAuUoYyje2LWZpcfssExY2OSTh4TfKxH1S5R/F
         q/I+jbm2z8GgopcDwL20zGfDCQIDkNZVw5OgUbrPGW6moX0+81E4y5NTvQOWnTUoxuYi
         VNhNiKXgaGMCnVGJi5iM9tSJeT1LJez1Q6gUCQbCpBa2ML6CmBwif5VceHUNzsoS5ofb
         VOzzrC1QSXqeEQX29VljM15skjioWOij0YnvPgK3bQXZzbHnxRC/POEj/btUk+oXN4Dp
         Yda+nGIFmPjcZ0YwzyRYFpVrS9zgnKJYP8hu46mCQ94pWpaB/gBAD3hg+fD7oksHTfGq
         IhAw==
X-Forwarded-Encrypted: i=1; AJvYcCXZyQheB6utGBVErAoUKBzqkc5a6VBhs5l+A/YqJrMtMdu7DMLQNVzsdzBbK727RcDy9zFgfzzPf7kW6Wzbf4uY@lists.infradead.org
X-Gm-Message-State: AOJu0YzbGmKbOuXNNKVDIN4pF7VqnOBTRE+QojE4IsHvJl6JOEbCcDZt
	VBXDO4GKMqgrsChqQK1ny63TRP7PBkEH8I/8w5SzXHR1B/UjXJDjAGnMYI/oCE9tSZ9cf7kXyMI
	BqldU2droJo3cAexEfO2F/O48axujhMY7HVQ72Fw+y+xmPQ8RE/NX
X-Gm-Gg: ASbGncs+vjlKXFBNd9mHQ7b+eu49bZUYhPTGujl81DlrniIZ+e03aYejAflpXGbLddm
	unpHeM7sYk8FJhUk3Rp7LflKL8/PZSvfiTxXErW0HTBt0lrdpHyljyDFhqcyXOFTAYqcTO5Q=
X-Google-Smtp-Source: AGHT+IF69eZEtmq/bytiQvp5QhXzQAgT59awT8Yvq0oySfRGAni/tuvturEoI284/LivbVgt7JWAcyiW719+mfChwik=
X-Received: by 2002:a05:6512:1324:b0:545:c92:271f with SMTP id
 2adb3069b0e04-5451826ea10mr1946789e87.10.1739434662716; Thu, 13 Feb 2025
 00:17:42 -0800 (PST)
MIME-Version: 1.0
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com> <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain> <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
In-Reply-To: <Z6SgFGb4Z88v783c@pluto>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 13 Feb 2025 00:17:06 -0800
X-Gm-Features: AWEUYZmIzWqZe4wj2qpsKpM0Mnm6z_-a0UXdGuXwQ-oMTHKT5ieIi6a9LqYyhk0
Message-ID: <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for scmi cpufreq
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_001744_894993_6865D23C 
X-CRM114-Status: GOOD (  25.52  )
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

On Thu, Feb 6, 2025 at 3:42=E2=80=AFAM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/ar=
m_scmi/bus.c
> > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d=
32aebf5d99df63db8bfa26 100644
> > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi=
_device *scmi_dev)
> > > >>          device_unregister(&scmi_dev->dev);
> > > >>  }
> > > >>
> > > >> +static int
> > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct devic=
e_node *np,
> > > >> +                       int protocol, const char *name)
> > > >> +{
> > > >> +        /* cpufreq device does not need to be supplier from devli=
nk perspective */
> > > >> +        if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name,=
 "cpufreq")) {
> > > >
> > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > >because that's what we're passing to this function).
> > >
> > > This means when creating scmi_device, a flag needs to be set which re=
quires
> > > to extend scmi_device_id to include a flag entry or else.
> > >
> > > As below in scmi-cpufreq.c
> > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > >
> >
> > Yeah, I like that.
> >
> > -     if ((protocol =3D=3D SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufre=
q")) {
> > +     if (scmi_dev->flags & SCMI_FWNODE_NO) {
> >
> > Or we could do something like "if (scmi_dev->no_fwnode) {"
>
> I proposed a flag a few review ago about this, it shoule come somehow
> from the device_table above like Peng was proposing, so that a driver
> can just declare that does NOT need fw_devlink.

Sorry, looks I replied to v1 series. Can you take a look at that
response please?
https://lore.kernel.org/lkml/CAGETcx87Stfkru9gJrc1sf=3DPtFGLY7=3DjrfFaCzK5Z=
4hq+2TCzg@mail.gmail.com/

If that suggestion I gave there would work, then that's the cleanest
approach. This patch series is just kicking the can down the road (or
down an inch).

-Saravana

