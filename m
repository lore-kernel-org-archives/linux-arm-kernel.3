Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569DAE9536D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 10:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XATEAMeBs1Zx9E6NM3rF6bKiyOXGWYkJI4E2lACtlM=; b=YPw9A7+wqDVTYn+YBy/zLffeZq
	OPlSdSs/5npijdv5snKBeqF/q9o3OmJz+g+UZx3EYDj1dq+4PahMv7GI+u/biB8D0kFOnZV2msznX
	/9aCQu2V+rQnR82I1WzPrWigoueDTDpNGJHcL1yMZ+czjezBm9bZZ26ZAsqyD1DBZVwojAydCTnNQ
	7eB+tllMh9XvG0jGA2jJH2e8Tj1d/vzNQT15UTyGSpmOUyBNpsRzyXGoiXFjPDY5ZIdQnVmxCsX46
	bwFGzBiIFJBhnRNEAK3H1VOL2F2b5eYPkpGY9ATQda0rlUUdrXT85MUuY3TkpMC40iGn09LeXVcb4
	rNKgGehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna1m-00000008HUM-3oYM;
	Wed, 04 Feb 2026 10:22:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna1k-00000008HTx-1qbD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 10:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 411E8441F9
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 10:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8A8C19422
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Feb 2026 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770200547;
	bh=0XATEAMeBs1Zx9E6NM3rF6bKiyOXGWYkJI4E2lACtlM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=BnG4lkqEu9ed95d/Iqb3Nrs2IS6pjVNwtvK3qgeFjCTSmrcs5EZgnuRF9r1qhiLUC
	 OczPvUWzUlPHiy2qRX4Z0nJqrLstH/rlFHjjd8PEHgrDE3Ymu4xQsDn4ic+Zc9gi4n
	 4uZ3nkyJXVNvozNQXz1nDpgDB7tn45GHVzjx1AeT1hwfiCX+MwC7+jV3+lloAgwXiV
	 Qs/BgKG/Vmeh6Vi/DNBVfX4MJZhSjHIb/kt3ou1lyTY51OrHPGysYHw6QWMESh6Wub
	 KyrAnWjb2M8I1XcOdOr+AHPO59ROoTMLVtqkC4SpscCLEOcKNaCOY81SQtzVo918rL
	 vecauk9B2LD9A==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e17afd2d5so6370195e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 02:22:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWK9Py9oP/kTtH+/NxkCgBQYvejO4Dv0yHOS5U9+ne9/CIKyhDr+CNdoqRoCGoAPPawpjq0HoSueEHxTv38FdIW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa22g0+zklFvNcpWn9RnYH08Jb3on9viEmlxEN/NeLbmmr47Ct
	zxuIOr7/+ikfUvGlBiX6NnkzZ+0YM1BlVCLRrIc3lN6j8L6j5bsKefuYu9ktQpubeZbTb4jESUu
	DpkeSdp6fhQoz2lvuV3akos+c9xmUjdS1hc6/5bHQgQ==
X-Received: by 2002:a05:6512:3991:b0:59d:fe49:7f6d with SMTP id
 2adb3069b0e04-59e38c023cbmr1138987e87.5.1770200545799; Wed, 04 Feb 2026
 02:22:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 05:22:24 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Feb 2026 05:22:24 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
MIME-Version: 1.0
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com> <20260203-dev-b4-aaeon-mcu-driver-v3-4-0a19432076ac@bootlin.com>
Date: Wed, 4 Feb 2026 05:22:24 -0500
X-Gmail-Original-Message-ID: <CAMRc=Me5WfdQPhW8MSMTRZ=6wm+hKAKEOr_aPLyf=PAKA6_0Qw@mail.gmail.com>
X-Gm-Features: AZwV_QjA-Mb0Chvn876wYAP45YJOzVMz5MdgG_VnrHm1s9EwIRwKYyInNCPAbPM
Message-ID: <CAMRc=Me5WfdQPhW8MSMTRZ=6wm+hKAKEOr_aPLyf=PAKA6_0Qw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	=?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_022228_514149_F6F6360C 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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

On Tue, 3 Feb 2026 17:21:13 +0100, "Thomas Perrot (Schneider
Electric)" <thomas.perrot@bootlin.com> said:
> Add GPIO driver for the Aaeon SRG-IMX8P embedded controller. This
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
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

