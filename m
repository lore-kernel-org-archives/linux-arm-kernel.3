Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A5AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZ/3VdJhYRpNseu5U9lSFH9HxUE77S8ESF2tbbWAri0=; b=cic8mEbnusbZ7srfDTg8MBVK3i
	Gh5TsHoQj4pL7CA/EyVmX4+CjYIluWskyPSA78TtQk1uFW2LhnT42GjRkBhEz6UxUIGW2vq0qNN6P
	9WFep9ex0D8XrWD40+pX+9zZt5SQy6QXJQEkUQBf7So87Zu8MQZXtxJHbodqbZmHUpJBZ5Xa3Hp+4
	0fQ+TEQ3uqGXvQ9iuDZNO0MXiZCmQKS1wUP/0KXX/tDLXOtozlfD6J7CkbOUxo8frzPyesQjSB8SR
	d+lVYBhgDkWIC5n1DeHGDB33e8S3AvQ8+Yjf07zma61gDfTnEVbM8KBEYoSNnmBchH7uhbYMlYF1j
	4Pl/ob0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMMD-00000003Vjp-3vyr;
	Fri, 09 May 2025 11:57:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZE-00000003Nau-0w4u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:07:01 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso240709f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788819; x=1747393619; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZ/3VdJhYRpNseu5U9lSFH9HxUE77S8ESF2tbbWAri0=;
        b=A37FoBZF4iKLBvTU+w3Oh65WQdEIsUvp5EnNjy42Mc/kBGA1uJHu8FUX+zhJZBklAF
         B5nC3jHis2T2wDuM7ABVoxQJxKTi5IcDgmFN3KdLdMAq7gKkNbKQ1ZLXaIH9BP4e/C1A
         yoYtFznUIwVN1I9lQsDdnxMnD0X8mI+rmgV8YqANtgXKh6kEs7Uuoh8+ytB5m0GYbcY/
         onUTFriGlXjqAank1J6FcN2vdplq+CCGvN0b3lhNSJ3tCnvN1BnCB1N9dIjcdbcJsSCa
         GnxzEdZpIZ5ecULhjKyMZAxWsUHAKCqyEgHRWs7DRHy66idFyH+vY3ZMzCrAC2mCZK/B
         i4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788819; x=1747393619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ/3VdJhYRpNseu5U9lSFH9HxUE77S8ESF2tbbWAri0=;
        b=t2QCvWd2F68IM9JOfasZRaZZuCc2B2HKMiDPFovoNCDygASW9jF7K27ol4/URUxwU0
         vDXvFRYMEbcSuxonKlSUodlXR9UqU+TDEdS0g4L4k8AxN8BWVrDQzlmYLQwUni+koXmv
         NuTlNlNYs6MeMAR6Wm54LMzszYUflv9IakeNlh6pR5Y0RHzNmcmUDpsGwg4WmqAxraMm
         vwgYpbnfsYGkj0nOPxRS4XMp8vxcCWn1xcfLw4qhyTRdO6U4TxxqUgsreco1I541mUOw
         wDUUicme8haDe7fDVTiEQ/VAjcYRrO/EQKgjPfl9n3HccRmtzcrwiGBjR/19LKneSyL3
         UawA==
X-Forwarded-Encrypted: i=1; AJvYcCUJr5tu1CRxTk3oDiFfy31Khwibt/pBxl4Ow3p+NDuHba3+9T/BsgSY+dvrsftsbcQ99hY+hojy3nczQP7SOg8y@lists.infradead.org
X-Gm-Message-State: AOJu0YwieGVg2u2tVwOHe6vwap8qvfO4UYmgcBCbU8ijCcgBzkJna7xA
	fprQnaGmxvjAANQ6XpF/LYOk8nc5i4+n+RX7zYyoM6uY6Nq8TPz8PwvKnM5AyDE=
X-Gm-Gg: ASbGncs/C7klNuSnJ/LLX9Lc/cUenAGIt6pz4ckHC0mMILFgmC83FMI3mY8BH4KnEnA
	KTPKEQvZIXSD1hQaiDV/SjF1Wd/zOn2DM7LgM+KdS1lqXn12nVjae1lUqU0t6wJZ4qkZyVEG78c
	VRkedOnuMolBZghvIYK3rLxfkzfJ0uam6QLu5uWschL0SBwVc8puSbKBpsVh2qH3rSF8gPYA1OH
	ASqmHuksnRgTJRFUTfkfJEQsS9Q2cNkDPxzDBA+quID9lgS6EyYvtSNFA4B9rkH7VG2VGN61Eg7
	aoEJLpq3PWDxLoTbLFoD0mQtYvRKhYFWUu8ABbKLfKInN5Y=
X-Google-Smtp-Source: AGHT+IFbRxA53PsQ6WEpfLOqgfTczthdryRGHNyvPGYt33prnCWmvz5n1DMnzXDap0L0ElCdAiEfKQ==
X-Received: by 2002:a05:6000:2905:b0:3a0:b9a8:b94c with SMTP id ffacd0b85a97d-3a1f64b5c83mr2393167f8f.50.1746788818691;
        Fri, 09 May 2025 04:06:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:50 +0100
Subject: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Xulin Sun <xulin.sun@windriver.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040700_268415_7F863ABE 
X-CRM114-Status: GOOD (  13.80  )
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

From: Larisa Grigore <larisa.grigore@nxp.com>

DSPI registers are NOT continuous, some registers are reserved and
accessing them from userspace will trigger external abort, add regmap
register access table to avoid below abort:

Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
Hardware name: Freescale S32G275 (DT)
pstate: 20000085 (nzCv daIf -PAN -UAO)
pc : regmap_mmio_read32le+0x24/0x48
lr : regmap_mmio_read+0x48/0x70
sp : ffffff801123bb70
x29: ffffff801123bb70 x28: ffffffc873b5c000
x27: ffffff8010b408f0 x26: 0000000000000001
x25: 000000000000013c x24: ffffff801123be40
x23: 00000000000003ff x22: ffffff801123bcfc
x21: ffffff801123bcfc x20: ffffffc873a9e500
x19: 0000000000000024 x18: 0000000000000020
x17: 0000000000000000 x16: 0000000000000000
x15: ffffffc876189160 x14: 0000000000000003
x13: ffffffc873bf73ff x12: ffffffc873bf707e
x11: 0000000000000000 x10: 0000000000000000
x9 : 0000000000000000 x8 : ffffffc83fca4e00
x7 : 000000000000000f x6 : ffffffc873bf7083
x5 : 00000000fffffff9 x4 : 0000000000000002
x3 : ffffff801061f058 x2 : ffffff801061ee18
x1 : 0000000000000024 x0 : ffffff8011490024
Call trace:
regmap_mmio_read32le+0x24/0x48
regmap_mmio_read+0x48/0x70
_regmap_bus_reg_read+0x38/0x48
_regmap_read+0x68/0x1b0
regmap_read+0x50/0x78
regmap_read_debugfs+0x120/0x338
regmap_map_read_file+0x44/0x58
full_proxy_read+0x68/0x98
__vfs_read+0x48/0x90
vfs_read+0xb0/0x130
ksys_read+0x7c/0x108
__arm64_sys_read+0x24/0x30
el0_svc_common.constprop.0+0x74/0x168
el0_svc_handler+0x70/0x90
el0_svc+0x8/0xc

Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index cb0e55a49eea..701cf56d28e7 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
 // Copyright 2013 Freescale Semiconductor, Inc.
-// Copyright 2020 NXP
+// Copyright 2020-2025 NXP
 //
 // Freescale DSPI driver
 // This file contains a driver for the Freescale DSPI
@@ -137,6 +137,20 @@ enum {
 	VF610,
 };
 
+static const struct regmap_range dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
+	regmap_reg_range(SPI_SR, SPI_TXFR3),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_access_table = {
+	.yes_ranges	= dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
+};
+
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
@@ -161,14 +175,18 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x88,
-		.volatile_table	= &dspi_volatile_table
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &dspi_access_table,
+		.rd_table	= &dspi_access_table
 	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
-		.volatile_table	= &dspi_volatile_table
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &dspi_access_table,
+		.rd_table	= &dspi_access_table
 	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",

-- 
2.34.1


