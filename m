Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6ABCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWoQa8RFTTk84aEoAC07qJog4uQPcmRTcxfNGLNDxJg=; b=QGedskken3Q9yy74x7y05E8/j0
	Pxz/MbqYvzPIdrD+eT5hxb9F/StL1VCqj/xP74ZnX8Xuyp8TGnAniGvlM9NAxmNBapVP8i3TaR+z6
	8kUh/T/rY//OEsY1k1fGBcjr8bzjz5AttTFJKB0yVFYGITM4jPuohxrxJPXazHXl5s+ToU/kxy25A
	pgtb9BA+iDcJb05ypmjKJCAozlPWIBX91omg6pNtHwI26AJoqWvY2Y4RC6/CHYeVYHF+cyFohiPqD
	XP/7P6TM1G0eZ4ZqK4C4+kMmVrZGbg+iCGN+dV/InMNOrQSvP91R6PP4HK+PR8BuoItpI3PijD3yY
	RBdjXdbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepiF-00000000xAV-2oym;
	Wed, 01 Jul 2026 07:50:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepiE-00000000xA5-1RJd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9F8043D95
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 07:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB9CB1F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892225;
	bh=xWoQa8RFTTk84aEoAC07qJog4uQPcmRTcxfNGLNDxJg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DczjMUBvKfp5CMbsOROhYOGCOLsZpYRnR4v/M3FcrVtZ7ab5uweJIGfIFRAulsUab
	 RQyOOY9042JI8cfD+xhwBMIrVwgaBGnKuFFEiapdo11rUNdUrRqaRmffpzzfxieieI
	 T/0aqk0CcKZjuzJTm6sbYauBENXBRGY1J8L3MfLT06EoG8bIya0xqXHaeiMrDG4LLF
	 xrtfqYoz2mUp/RMDIxrUwEZMdoaPLaT4/4z9gVNtlYguLbrghReud4/Ano4SYiJ4pb
	 qJM7A0Nz8PrS5WA1ceOhrWNQoO0p6gPnjjQgD0YxRt0AWSQA9wQsBDEMNZUwVXRDpY
	 t+ceRvuSwytlg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39b2be45e8cso3076791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqOVo+cEEAYitctBFb6cYk8rNfDxRpG1++GR1YkRRMYWMDpZTV1LxZ/w/261yVagnJ3kvNzcnOYR21luOoUdj4e@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9fEImEcjHRmubzp6HoXxR4eIaqCRLgc1aABK5JGpuLH/PexVA
	lhNDzMS4hQcb/ogoKz9qD9SjAW3HFaPOQ4THIFPM0HL+5JC8FSfIL4rMBunY+FP9UGT+XfDJ+A0
	2FZuuoC2UmrvmMQ65tZoFRiaBgjY9LorVyFxFwGWk1g==
X-Received: by 2002:a2e:864f:0:b0:393:6934:6104 with SMTP id
 38308e7fff4ca-39b340ed172mr905801fa.19.1782892224586; Wed, 01 Jul 2026
 00:50:24 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:50:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:50:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-7-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 03:50:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfQDX7qNzmYP99RqvYtwVa9KsxKu4qq+8TD5Vz5FvrKOg@mail.gmail.com>
X-Gm-Features: AVVi8Cf_I55n91eLuPB2Yr4k-M3SBY1DoYVILdNZ89grAvuz-pPqlnv6xDy3sRA
Message-ID: <CAMRc=MfQDX7qNzmYP99RqvYtwVa9KsxKu4qq+8TD5Vz5FvrKOg@mail.gmail.com>
Subject: Re: [PATCH v12 6/6] arm64: dts: s32g: describe GPIO and EIRQ
 resources in SIUL2 pinctrl node
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 30 Jun 2026 14:54:03 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Update the SIUL2 pinctrl node to describe the additional register
> ranges and DT properties used by the updated SIUL2 driver.
>
> Besides the MSCR and IMCR ranges used for pinmux and pin
> configuration, the SIUL2 block also provides PGPDO and
> PGPDI registers for GPIO output and input operations,
> as well as an EIRQ register window for external interrupt configuration.
>
> The driver supports both legacy pinctrl-only DTs and
> extended DTs with GPIO and IRQ.
>
> Reflect these resources in the SIUL2 pinctrl node by adding:
>   - the PGPDO and PGPDI register ranges
>   - the EIRQ register range
>   - gpio-controller, #gpio-cells and gpio-ranges
>   - interrupt-controller, #interrupt-cells and interrupts
>
> Keep the hardware description aligned with the updated SIUL2
> driver, where pinctrl, GPIO data access and the EIRQ register
> block are described under the same device node.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

