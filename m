Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16823CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=; b=KW3kL5JNxUSxTZeuqyQUVnZcJi
	cEfBCfvUDwZz7WXQXGIqgkXqwgDr8ctWOUCHT3JhAuu8D2wGZgojBbJIPlnSAHpTa8Xv0QI0+yKrE
	CayLIYYVnnBZC/ijMRxug/mjM1xP5zFC4iFovx5xzAhObQ2koyjoyM7DfgWjsH0LA0E7sFN29uNW4
	wKcmeyQgk2liZd127AIfLMw5eTRyBSwCcUdfqHs23HPWBa2N5m8Qyh42Bbs33guwQ7vOO8260kpCH
	EY+fN4GGsDzOMtzZ3tVrXJFY13XFMcV7RxKXdSu5Nn7tEPNCq/IKbLlZQy0QBE5sncBA0CqBrj4Gp
	WRC7GR/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZrY-0000000CbJL-0aKJ;
	Tue, 13 Oct 2026 10:36:04 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZrV-0000000CbIr-1OVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:36:02 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c315869241fso385612866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 03:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887759; cv=none;
        d=google.com; s=arc-20260327;
        b=WzG2DrcPs9SDnRzCTg9+Txj2QwP/tE8H73CzisCSBSaI/+YZSB1Ggh35CYNudV8/Ir
         H7hV/MGZRcRkjGmRce5MR9OEnUumYv7bIm8wtyYUYoZe9BPwZifqoh7MNsGpzZFUmSto
         UKlJNE/s96gCvotHNXrYCpbTIFQ90zoWWwx6zOlflTV5WQcDGFC3dc8EiOjW2fy8Qlvg
         192NXx7wy6dwdI/OxSP85wGIITHPYKzOVPWD3KM+RjKcD28j3VGc7B81kU0t7b2HfFIM
         T2ITJwXO8H5fG5biHabHuSy2HRRO5FMrP5JggB9BI003SgFF4cyDw2IrvxsMpjnThbFi
         ZE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        fh=vl1TEhxonyBWpOMklpxDBRj9WIz6d6ITllyAuxuvml4=;
        b=I2icwicJ/9uaGvsZ0y/Vy0qM3suxaDjpkrTyj8Te7T6weGx30IdnxBfHeU8Ii1NVAL
         ZDVZd/YOUjIIFppc8Z6M8gcOuWDJUcMosk7obHAkt3yOlgBMEzrO9qoacP7Rpcd2nEiu
         dX+mbi3jzOZpWYPMxdM6WCgVyk1Ki6Afl44Ww29vmT3EXeif0Ia/QI/BiBSF26OpkUnU
         gpetT90NeJU8vWu2zM7TfXO2jJHcdQvbWPq9UyCe2aga0Qs502is4xPVRf9Ed1Kr6cHJ
         OLdcKFzblU3PcsToe6Qe/6zfNt0KyXvPITAORSU47nbzBhnuZkAA62ezFIWt1Zqng92W
         TMXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887759; x=1792492559; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=RRlTDacvUWuCFXMRho3MhbiEWyx4FQf6/Dq80yDGOwDLolb6sy4aLAkurkeDB5G9wl
         cS7oGHEQcMfB9Rjt/DjTlRWusKN09uAYMKrYUrH4VqGBQEtf5DZbzIuzYmfy5ksKmjvO
         jnmO5UrpJcXA4tQ4qrHyaSp3/1++vGhFMxlnUGfGhYnkR4Zb11mhDBR67M1lWGbNy+M6
         ThGW+da8GJmOXjyWNzdTYwz+5fyyQ2MIP4whPGVZqpVGvn7nv8rl7LNcZ0dPpzSeOIJK
         E4ur1VOa4k+weUXy4BOzbKP7Al/QvN2DvmuBfYeVz1C8GcuQLUqInlblZAZ8w749+GhB
         jjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887759; x=1792492559;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I5p7oXXlQx4QmfKm1Q6bW1oyoIsdT3apMQtNWEn4ZXo=;
        b=JMXAitTz68p3zzT70EXVxIZC1YGdDcbYDnjjOMOlkMDgbumRLdePsN+0DBfvhcRUza
         QVyXXxvaLe+3Cac+du9NYTc6lLXpsg+/XexBH7T0H3bS8Xo1FTWRx0isQDnS1jyOWwSX
         BDUR9u7qYePR31RfJaTwBebfguvsiLxc5XaRTf+54CPbyH6strpoSo3gayjBDK/pcVbi
         dXZsJ7lSj6IIhpZPXbHagH/bsXlyPv5LcSyUayHDPZ6CxEUopIBM6Hm5WEiEJQuV358Z
         Lkg3JKWxSLHKvyrJI87Q4NTmqP14stSTYivIlP4akO9O0jnCmAznG0EsoVaXPDvbLevE
         mmHw==
X-Forwarded-Encrypted: i=1; AKwUvBz/+jWejUlBxg6lbK9YgklIM9GYL+4oTFH+44w6p0LgHFVcbRYWUSBZ/x7QYXXkVpwE5rs1+Am3iSRS9znpepc6@lists.infradead.org
X-Gm-Message-State: AFq9FYJwaezZxbLh/AoN+OAM/ZixV6g1Y44+6PZwzX5DRgMrO35I5/KD
	tI1/ficA4lUgh2qCNFxyIxvk8Ow8o/P0fODTB+CvxzWTa0mWJABWiZ/U4DFvqFJZ96S37VbZ+lF
	rXsLCu7pBGX3YIG32V01Tnv5Z/E5XBKk=
X-Gm-Gg: AYBFou0JDpTnEBq6CVuvsfRSeYfKZhj4wdwYcAnXJEikujiChFPeEtPGlKch1N3QZ37
	1Y1VG3Ocm8XldMdJJ6xrP8Wj5DVVTtlq1qSxdg/wPpQFPq98WYetznY+yi1Bu0rOCod5Pm+s12v
	KxcmQ4f1JFvkn7yURiEpgOnYnZx23bUDVKSHaNOP7MGU8bMX65xKedMZMuwa4ipQNfOdylbXFyM
	yFyagcttVTqsJLSMC5WIZx5u62wmRn1qOmN3NYP3DMEcc1R46rGPt9F1NDwxZAwB1Hv+Y3ja1Lv
	OZOHelWnPgEUNzxIwBvuUoIRXCk4Q2baJhDhBRwKde11OHVTRjQe7L+MHS84X9ozoja2jsrK5D/
	DxBFBMSwrEAzQKaMnAssOAioHtUZlb1Yr+IT0nTzwRtBnvMzPDOEHVeWERDjxRQePBeJ8M87Z0Z
	J40Y805G/LT0/GgOrTlC4Iv4vwZhzPLUlfJqtsScGBVHa2gT0Eoic=
X-Received: by 2002:a17:907:7246:b0:c26:19de:9adb with SMTP id
 a640c23a62f3a-c31a9d56575mr1092545066b.26.1791887759359; Tue, 13 Oct 2026
 03:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 13 Oct 2026 13:35:22 +0300
X-Gm-Features: AclHuK_etHkgfHNMFVBnkCMnseRcVeyJYO7O0Oj_IyfMyFzvQ7RtNYlt2MPQbFQ
Message-ID: <CAHp75VdaDyfDL=34kOV0u_nHnJ+XXNwJU4=33v_Q8Eq=tHrYng@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] gpio: mxc: misc bug fixes
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_033601_443066_F22D6C4B 
X-CRM114-Status: GOOD (  15.28  )
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

On Tue, Oct 13, 2026 at 9:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> This is a subset focusing on bug fixes, that separated from thread [1]
>
>   1. Fix a race where the chained IRQ handler is installed before the IRQ
>      domain, generic IRQ chip, and port list entry are ready.  An interru=
pt
>      arriving in that window dereferences port->domain while still NULL
>      (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
>      install after all dependencies are set up.
>
>   2. Fix non-atomic read-modify-write on both_edges.  gpio_set_irq_type()
>      can run concurrently for different pins on the same port (different
>      irq descriptors =3D different locks), so the old |=3D/&=3D on a u32 =
is a
>      data race on SMP.  Switch to set_bit()/clear_bit()/test_bit() on
>      unsigned long.
>
>   3. Fix non-atomic read-modify-write on wakeup_pads, same class of bug
>      as both_edges.  Switch to assign_bit() on unsigned long.  Also fix
>      the bit being updated unconditionally even when irq_set_irq_wake()
>      fails.
>
>   4. Fix a race where devm_gpiochip_add_data() makes the chip visible
>      to consumers before the IRQ domain and generic irq chip are set up.
>      A to_irq() call in that window hits a NULL port->domain.  Move
>      gpiochip registration after IRQ setup is complete.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
(no need to resend for that small issue in the commit message in one
of the patches)

> [1] https://lore.kernel.org/linux-gpio/20261011-gpio-mxc-cleanup-v6-0-cb4=
7ce2ad758@nxp.com/T/#m49d6a5a14a64774eda299bb711c8d316681e652b



--=20
With Best Regards,
Andy Shevchenko

