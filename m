Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB12D72379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u6klDEegI2rxfEJIiHp/d0Fjdi4gSg49mfHVxoiJv1Y=; b=k/tPNQlegEKsrhVthrZeszybnU
	3P7ZtQB8r/1o/1UFg1iAHCbKPTeQYouUsGkXd/76h/ISUiMtijkIS4emi4z9n9DqTC4aQ6s7a8cFF
	OYIdnR++PxgxjI+mfkHGSJBUhqWeyLDhZ6TaU1IH2HUAEJ3flQaIJcBz0T3gK1NTmwhU4g/H5dYQA
	+2hDQtBYyqa1zctc7ka1EiK6lABmra4voDuOZ3PiJ1CkkoezB6+Ou7vR13BA+C5DrHS6cObXyJ2mx
	m2tk0TYzIsHemU0tAMmN4jFHPQkIltRd3a9QXLOUZTxtXycZI3SqCnwZ7HuXnBegLnrcawD3gZcJZ
	quWWOmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFUQ-00000008rMH-0LwK;
	Fri, 23 Jan 2026 11:38:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFUO-00000008rLe-1k4v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 11:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 84C2160010;
	Fri, 23 Jan 2026 11:38:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1606EC19422;
	Fri, 23 Jan 2026 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769168287;
	bh=6AsOP4H1gPx88LFV+WRcrIxpnKRWhNEYhBcF0D/GriM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hE9mGaxfuFAvwhvqFlfTyugmXbwz4VSiW0dixHmngkIHl3Xt3fGK/CdYOoUJs8KkO
	 Gf4Ygs+GP1wC6jFJ2m8FVuie8OHaUqgBbc0DcT7G6dNmELd9Fh4PRvIbTJyXQ0NLgm
	 ulZcVGtmCZoJ3IWZJQj9q2345NSHi1zlEWZa5051o144g3C+w6S6Nampm6mA6xGL6C
	 asbLHM0iUvyrj4iM8HwW+NBsuVgXV1Fdr9I60Ky0dBNlPXopXIh2RKL2/59pCHD7Q8
	 3DLmovcKV7K2qoHRZUbSJQ9x50s42ajC5bFxfQP3HocAryXYwPkM9wWBSpal/Mp4yA
	 i+NdBW2k7xPnw==
Date: Fri, 23 Jan 2026 05:38:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
 <20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com>
Message-Id: <176916828626.1389324.17938615184098184972.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: Add AAEON embedded controller
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


On Fri, 23 Jan 2026 10:54:31 +0100, Thomas Perrot (Schneider Electric) wrote:
> Add device tree binding documentation for the AAEON embedded controller
> (MCU). This microcontroller is found on AAEON embedded boards, it is
> connected via I2C and  and provides a GPIO control and watchdog timer.
> 
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         | 56 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 62 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.example.dtb: embedded-controller@62 (aaeon,srg-imx8pl-mcu): '#gpio-cells', 'gpio-controller', 'gpio-line-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8pl-mcu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


