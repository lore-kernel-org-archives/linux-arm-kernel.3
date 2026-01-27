Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0DFD25931
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5tRYiCZhPJsvWOlkTTg3PRVVKQuQ8t8E/qc5ck9C+U=; b=agFstH4Z2rAZfkj8HVJroj36MA
	xslqlotYbNXfYSzQZ7IQTlIXrAFp/W60xAnLbofBbf1/BjXxhkn08lzswVy22okDSustNSHPP1iGI
	XsoPgDtFa7W3rVMuqNLBbzWbW1qo2PePlvglmXYPsVpxP487L2OBUvpUNo8P6S3k2AnNIqW6lhnVg
	cyURwrSyJ5DQR3+uEGp07GhTfpi1BRsh2iw3XZ72icBvC3Lq9wRxTTOmDx3GyrNEJtJxd/NVX+FKn
	HpM7JjKTCxhIVNHmyWsg7bLyzkq/VaMeZaIYCCaHkSakDfNoZiaSFu+ovjIukJPzyS5H/FSgSMKmo
	2kSVb29Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfZi-0000000DyHO-2iEG;
	Tue, 27 Jan 2026 09:41:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfZg-0000000DyG4-1kLi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A84544399
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC069C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506888;
	bh=o5tRYiCZhPJsvWOlkTTg3PRVVKQuQ8t8E/qc5ck9C+U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nzaT4wyUWQxI1dv0wnlJVhEnDZKpPOdFJ+SnFiOxgW6jKxL7z0EaYc//PMBupDWC9
	 pHer/77KxXBLkwPdztfuqpcAa6KKVYFK7ktljwdwdDjFxxe7yUOr041ClbhL8vc30x
	 aIYUgUfIyRzLPI7Jqw6x1UChRwd+RrF9PdvCNSZYT9T18DhryerXcTrWJebknYcBfg
	 o2rWeHU3Yy4XT5olAC/Lp7tJGUkUPAosF3cQna4/KyiqiDeX4+EG2Hj1s+JdV8xodL
	 cCB+ZBtN0boFGgzlmlwHQ2I9pXPYSA6SG9whCw5ZFhIxM5j+ec+gjZ900Um3uWB1ng
	 deJchx+7sh35w==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-793fdbb8d3aso48334757b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:41:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhyfCq9MD1HMBhImEMzTRuLlg2TjBhzergweFAr/WBcE0ROwUPHEPOjtK4+/eT+YaPGKfTdFjKGl+YBpsyluoq@lists.infradead.org
X-Gm-Message-State: AOJu0YyaeOxnSCmbdhYrC4gUjCPhALvPJHAsUMe6X14NgE7mgBaDy0LB
	Nm543PlhlS/xmsU3V4+0TeJ4fzAc7uPT47dgDrJxBS1C8l26puK88Ai0OjVbEbHQg7K9jeV47zX
	20sffBjf/MFfJvN1og/TuHulZ7GB86zY=
X-Received: by 2002:a05:690e:408c:b0:63d:bfad:6c7 with SMTP id
 956f58d0204a3-6498fc3ff38mr681563d50.58.1769506887301; Tue, 27 Jan 2026
 01:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com> <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-4-9f4c00bfb5cb@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:41:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnar=EgaaqfLDRBgic6NGPY30M1kzf=8Ps9j7Z4kAme+w@mail.gmail.com>
X-Gm-Features: AZwV_QgLmP7BaRH9fF1BxEIrjgPtkrDiEeJYWc9U8rpAiPtk6YcoXHb2cAV8Lbc
Message-ID: <CAD++jLnar=EgaaqfLDRBgic6NGPY30M1kzf=8Ps9j7Z4kAme+w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_014128_494572_C2AD6418 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, Jan 23, 2026 at 10:55=E2=80=AFAM Thomas Perrot (Schneider Electric)
<thomas.perrot@bootlin.com> wrote:

> Add GPIO driver for the Aaeon SRG-IMX8PL embedded controller. This
> driver supports 7 GPO (General Purpose Output) pins and 12 GPIO pins
> that can be configured as inputs or outputs.
>
> The driver implements proper state management for GPO pins (which are
> output-only) and full direction control for GPIO pins. During probe,
> all pins are reset to a known state (GPOs low, GPIOs as inputs) to
> prevent undefined behavior across system reboots, as the MCU does not
> reset GPIO states on soft reboot.
>
> Co-developed-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>

Looks Good to Me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

