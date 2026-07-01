Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHD2yVEHzdy8DLtJ2/nbdi1VySk42Z1vfw6pJpAFCkI=; b=ZZyCoMhz4x+Xnh14cOOMF4RIcV
	KkJFlgDlXxdT+TFK3pLd6b+D23g815N5DNRaYu5MOWBmg851xkaUbLhv2WS3gX3W1VHMhylQ8PV9U
	hEA0RJJskFyoXp3GDNJUTImo4Gkng9iVSrq6Quxst/I2o3mLNu1RTjKynD4lMZrNiKLTUfFrssHPr
	jlT1tmwsBVbMN9sCjkPgyl2fwsl6KYIVxw43Ut+mJhhvVIJwh+mxdwmt1AW+2bDoBm+/QzC4YtR1E
	GtEs84+8PPpQGR/YhvfYChUJ5jgQynyqpQlYxRdxynEHA4usVTG8EoZ7QJgUdBXxsHInOS06ShOCw
	vOIbupsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepfP-00000000wfn-39Cg;
	Wed, 01 Jul 2026 07:47:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepfO-00000000wfV-27YQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:47:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B7EEE601D6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 07:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCD31F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  1 Jul 2026 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782892049;
	bh=tHD2yVEHzdy8DLtJ2/nbdi1VySk42Z1vfw6pJpAFCkI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=h82x9az808hfj76bX1Jwefwe1HGwMiLTYRyd6c4VCcLZHxsTgSb+wcy89/cSftH9D
	 dciBvozWO+CyVd16PUmy6KIJaiEBSDtu6CBHhe0aYZ/OWUgsCujdYPf6NK9OVl/BzA
	 EpwIgaCpgceo7sPvfk8znHmJ+7h87SdcxACsx9GV9R7DtWljXBsfYObqkX/cpL+CEZ
	 qnNewlfLC/P6seXHIACHaIcArCSlVN7mHLnTWQbWYy36WQdLYV1W8ue8VG0CoP0xSw
	 ETFdSNLQQ5vqcnrJgndEE1aqB69xkWjAGIKHZdubQyNhiOCsPH0bncOCuYX9DH7/H/
	 FeaCxWjbDSYFw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39b26e2ad5eso3316771fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 00:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqdRu9+nFqqBhNsoaALVE7PLWAc3VaSXYhJ3FkLc+JNvHbOEUb+PVZvbRKh+++4+K+uqncexTn/gn7+tGFxkvCB@lists.infradead.org
X-Gm-Message-State: AOJu0Yypm3grhfTS1p1RDXZnuAwyxrR377VVASJt8QP5B5KWPRbnnI9D
	axEFgFFJPCV8TCVZJdi29iPlXtfqG4BUJJgJObs58gE1eSmHmwqxRd0Q19cRbsPoScnLpcHkYCU
	eAE9mTcnWSmKu7l1FdwNdz/gzBCg6kmDiwMgjbG9MOw==
X-Received: by 2002:a2e:9a91:0:b0:396:7026:ad8d with SMTP id
 38308e7fff4ca-39b33fc828bmr866001fa.13.1782892048227; Wed, 01 Jul 2026
 00:47:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:47:26 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jul 2026 03:47:26 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630125403.546375-5-khristineandreea.barbulescu@oss.nxp.com>
MIME-Version: 1.0
References: <20260630125403.546375-1-khristineandreea.barbulescu@oss.nxp.com> <20260630125403.546375-5-khristineandreea.barbulescu@oss.nxp.com>
Date: Wed, 1 Jul 2026 03:47:26 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdknO+isf8BJGZG+VBiJZPC3J99DHcvdevQS5B1f1WHuQ@mail.gmail.com>
X-Gm-Features: AVVi8Ceyeil22X60y3yZsNCxMt7k2roX0DVloL4hTxIC87YuEmy8U3T4_KiZNnI
Message-ID: <CAMRc=MdknO+isf8BJGZG+VBiJZPC3J99DHcvdevQS5B1f1WHuQ@mail.gmail.com>
Subject: Re: [PATCH v12 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
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

On Tue, 30 Jun 2026 14:54:01 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
> external interrupt resources present in the same SIUL2 hardware block.
>
> Besides the MSCR and IMCR registers used for pin multiplexing and pad
> configuration, SIUL2 also contains PGPDO and PGPDI registers
> for GPIO data and EIRQ registers for external interrupt control.
>
> Add GPIO controller properties because the SIUL2 block also provides
> GPIO functionality, and gpio-ranges are needed to describe the
> mapping between GPIO lines and pin controller pins.
>
> Document the interrupt controller properties. The SIUL2 block
> contains EIRQ hardware as part of the same register space. IRQ support
> itself will be added in a follow-up patch series.
>
> Update the example accordingly to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

