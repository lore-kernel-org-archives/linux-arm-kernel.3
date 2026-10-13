Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF513CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 10:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e/YWC5GU+iDxE92YoOekJT+1e2v750KWewJ2AZK7Woc=; b=LIwuaA9AGWBiTRDvFDYT9iapsu
	Cn8rEHGN8tCaXPJS4/oSCAjeYOrwYZprEMKED3oRnTMrFCeSm/Wk9O/B8bTMv5xfk8q3uT31WSVL4
	GLUaED93fFTWJw3jmvgNHZiBCPBMGoQoaDVIcaezOOclyjGSVfu/2PekXWzmdgVOLgrl91jE7HA/h
	k4904P1dD88SeWAsWySf7170VjxbWCzaihQowro2ZBJL9nEPYPSmN7sHaQ3DoXUAc8NomighcSoLO
	XxT9pha+b1yWkXDPAoIrFSA7YFGmNQRBIOKUf6KiiqIV1yvHaoHLdoNxtj63TzKpiI9LfXfZRAv0q
	QWvQm3Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaCd-0000000CdrO-3kpX;
	Tue, 13 Oct 2026 10:57:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGaCa-0000000Cdr7-3c2L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 10:57:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E7F9E60A52;
	Tue, 13 Oct 2026 10:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49DC1F000FF;
	Tue, 13 Oct 2026 10:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791889067;
	bh=e/YWC5GU+iDxE92YoOekJT+1e2v750KWewJ2AZK7Woc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iX4pQWPbbLr5xGqP+MCgCgUdG00ojrL7a5bhRrM1T6oiyLJ95hpI331mrdTw77znq
	 A1k/16Gya67mGxhTNroc9WX1ImIPdGz5LGyqb40ixaZEPptfHT4vI8dOx9/CuM/cfW
	 YxHzopeCWEgubO7tCPwJgsq91zJZXO8CZLFrftGAKdX7Kg+TPK4Ic200LyBZSc0EOF
	 4lnMrW/nW2VLcuwhaUyYzYysNAwfTRcwug+sJoukghvs2jRUneZOFXHf95MuzBFs4q
	 jjjf+cupjCgVIvZwPZtxM43fcfjfDLWDBV1+b3zN5S7RvVPuROmlnWTAz1JXkTVgLT
	 T3Bk598VpNRrw==
Date: Tue, 13 Oct 2026 12:57:44 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Mika Westerberg <westeri@kernel.org>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Elie Morisse <syniurge@gmail.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Devyn Liu <liudingyuan@h-partners.com>, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Hu <hanshu@zhaoxin.com>, George Cherian <gcherian@marvell.com>, linux-i2c@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: use designated initializers for acpi_device_id
Message-ID: <as4OldgC6mnGe-r8@zenone.zhora.eu>
References: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
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

Hi Pawel,

> Pawel Zalewski (2):
>       i2c: i2c-core-acpi: use named initializers for acpi_device_id
>       i2c: busses: use named initializers for acpi_device_id

pushed to i2c/i2c.

Thanks,
Andi

