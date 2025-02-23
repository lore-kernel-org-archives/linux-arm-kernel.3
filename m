Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F1BC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ki/B4ELY4rZob+oGFNIp8+cpQQDcjVNezaRSiDE1TE=; b=xnp1DzxDcS8SHdRin7+YyBySvG
	/QPYVRHPdS6r777kaPh3XPqs3glMlokkSdaZSgdKLvCk214fc91o91W8wMi5uGy9VcnXF0G/NxvV1
	BCls0cIunCe9L5xaN9WSMQqwNolmDDuzclbUaEZp/Ty7HwwIECeM+oB2F4Xg15Ad2IxTyUiJVUbbo
	QeKBp/2oUvsmFEeYVEqdh2xDm+YsvV4E4S33ZFBr/SOP49RPS2CnyUfuvSo4sU5oamCJ12Slv+4/d
	B9tNEmnzRsT+qxQ5yBOArfC8MeDq4W/4A/VNSJS+5obJacII5hG7h45+/aJlbB5nuZxwm4cQ+izTI
	GUyEygqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7OQ-0000000Ag52-2BGi;
	Sun, 23 Feb 2025 08:31:18 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7Mv-0000000AfxR-3tF4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 08:29:47 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4be76fecac5so1257437137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 00:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740299383; x=1740904183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ki/B4ELY4rZob+oGFNIp8+cpQQDcjVNezaRSiDE1TE=;
        b=JH+yaifuPl4NpPZhJiOLYnxfvpcQ8IqgigQQ6Ylymdf0eCefSTWcL19pxGdHiZvdLt
         ZY5iOH8AftC5WRRqK8o1JLZ3JP3Syhyg0bYkQzT4rwDsjRPZbTYJ9turr8D3k98n1H7A
         FIVOqmi5+6t2BpfskWanC+MPmgMdqHf0ZZNQFRZKQ8VspUq7WmzHV7oLDsn27baeXlmF
         D+ZlMg015K+JeF75BxcekovT46zlrSUC4/sEqnigx6ZRadQIk4lAVSm0KO2Dy+tn2od0
         DLpYFpcAC6CGHWhsf9R6p7+uX+kSUdiEEp3MqlPOJkCit+8Jm6DY/jahIzXzcEeRKlDA
         inLw==
X-Forwarded-Encrypted: i=1; AJvYcCWwKFeMdSmgVR7SfldocFRcmf+BPIeYmiGD4wj7ieita43Oug91KSwH66mVH8bH5oKyDj5t7eSTOOtsjgdPzq5d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+XG+oeGtVhbsXEXUvSsp3stRfN/HOQrcdf2BJEh1SOh4WDdw
	/GSvv9dL6pDbVC+n647bh4iLSvCFOQ1YGwEnByzEcr6xvYZDfOy5YchuNbFJ
X-Gm-Gg: ASbGncuGajtFMFHP1paOCQo9BTcaCkMmvD3942BvoTVpER8VZP9wui/QltFEngeHiVQ
	tnsAcFAFWFP9iG+6SfYNdQwTz7jy/H0wa8j8FjiWq4+GZy0URbQ09A5Ny2wc4sZKqdvpl3zoZcQ
	qmeHI0NsK92KYpMYYQXn75wEw82ppD9Sjp35uzkrSvEHMWatqE/aqL73hxHYdv7gQ+OXVoGBED8
	rpXWVIKUNVnFpCEVwL8r5smukRtcXA1UnPzDNx5+xKhcMGuvvgwAaIwt/cEuPvtyqfTHcMueDzN
	jU6cOC5bm6hXC7TbgoF42KGrQ95n0BePCYnsHVY1HLpI9t47khBkrrOTDscrGxV5
X-Google-Smtp-Source: AGHT+IE04l1rfhminJldCW5en+3/FiHjZ29N+zCH5V9vGJyjWiSrOeVZNQ/xpqF5qqPjUj5Z+tIn4w==
X-Received: by 2002:a05:6102:6cc:b0:4bb:c8e5:aa8b with SMTP id ada2fe7eead31-4bfc01c63e9mr4717371137.22.1740299383379;
        Sun, 23 Feb 2025 00:29:43 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4be09ff5aaasm3334257137.6.2025.02.23.00.29.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 00:29:42 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bbbaef28a5so1121871137.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 00:29:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUpVr09hOmrh41pw7BslXyz7royLdr8ko4eEy5dvils8sXpMomOHIG5YCnR44ove3UYtCmLIL0jCSsmBxrS+nTL@lists.infradead.org
X-Received: by 2002:a05:6102:f9a:b0:4bb:eb4a:fa03 with SMTP id
 ada2fe7eead31-4bfc01cf2d4mr5204466137.23.1740299382047; Sun, 23 Feb 2025
 00:29:42 -0800 (PST)
MIME-Version: 1.0
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
 <Z7rMdg7+m6qa0Hft@dragon>
In-Reply-To: <Z7rMdg7+m6qa0Hft@dragon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 23 Feb 2025 09:29:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=ZH7D+m54rh-25nFShCYhRhEjkjaB1LtOrRF5RyrXiQ@mail.gmail.com>
X-Gm-Features: AWEUYZmS7rXgq0ILXCQzgoTNJCt0MsAd5CmZz4lNsRJMvj13mGrXdUP0DGSg_yA
Message-ID: <CAMuHMdW=ZH7D+m54rh-25nFShCYhRhEjkjaB1LtOrRF5RyrXiQ@mail.gmail.com>
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Mark Brown <broonie@kernel.org>, soc@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_002945_967003_19E05484 
X-CRM114-Status: GOOD (  23.32  )
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

Hi Shawn,

On Sun, 23 Feb 2025 at 08:21, Shawn Guo <shawnguo2@yeah.net> wrote:
> On Wed, Feb 05, 2025 at 03:41:43PM +0100, Geert Uytterhoeven wrote:
> > The i.MX System Controller Management Interface firmware is only present
> > on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> > asking the user about this driver when configuring a kernel without
> > Freescale i.MX platform support.
> >
> > Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thanks for the patch, Geert!  But I have just picked up the change from
> Uwe [1].

Thanks, but mine has been upstream since Friday ;-)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=be6686b823b30a69b1f71bde228ce042c78a1941

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

