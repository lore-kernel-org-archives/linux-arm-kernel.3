Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08459CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wunUM6Fkbf+Qu+V1F4mAU5/fFxB/rdya5QEnEzfWZBA=; b=TlZRkPRt+QHWcI
	uzxrKBCmr9O1n3XaN6HSRwap5UerjwK0oauC8C5jeKqNmR3frSVw5bCnOsbm3gwS/DyjsqkAEIJGq
	DKIdwo47xqSAzAdmSS7YbHBWGmqIsSDvdVeaVLf9OIYV5dEUZ1HuUtUY4T2R5GrBO1tS79wdO9+w+
	n7SfMvSGnMRCJrvapCJOKLXmE9gtx6NhJgJrGTaVpidAgubQSemIwlCCemPMtbdtpYmNk90j2A6yh
	ZMX9Dx+NdJyeyIDFmLc5QeM57Cs9uj3Wy+0mz0ONSglTaf0cGQxjPoBaftblXmdiFUkZd13E9T2Bn
	jWC/WO/E/F0Hz6ts/x3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbro-000000098e5-1Ofc;
	Thu, 11 Jun 2026 09:38:28 +0000
Received: from mail-southcentralusazon11023084.outbound.protection.outlook.com ([40.93.196.84] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbrl-000000098cs-04T6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:38:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Prz8r0ql6aqnruOZqMeGjLmAISHW9YP25KdgZGkchw/yzuBBqfayjqbLDkpNnWN814aNJyvU/3UMCkd/Ebd+DRo2Q9UvZ2/2unXs811Kwevf1NqkigerB3qLCndlPcgPYXUM163lvHn3HaYFOtJIRjGZRe1FbsTHrQdfaSUOpsH9FSVr3hXeVkH+cNHkRFiqVCaXSIbJXWLjgmnf8HalPy/UpjstQ0MQAMdMJHQQ4R4/hAW8TQ4ALr9BwFDet0WJOcyh6P14VJRik2XaXCNwsnsrc8Ys4E1QrlOVS3Yj1sQUmR21PVUMUiasglWcVT9MuneYywi1shARHMNU1A9IIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wunUM6Fkbf+Qu+V1F4mAU5/fFxB/rdya5QEnEzfWZBA=;
 b=dxNWjm4DdAIGWRSvuPmqPNoG8Gg2Thr7hTYZ9VB1+lU65j5Ee1kffr3Vcv759KPbO/olGbfQrq0LKxY3732L5UsZgQ1Qr6fcg0w27WSfR8OJJhJIzCwrHCXzQePaNT1qW+1nOs7c8Jg3jp9IqLxbsLkXliDUqSqfDalFOAHGEhW0XUi7+qTmCW6nhW7j70jJ2lXakb3/Er33X77pXpkUWnUDJnuKWj973Yzom7rbfMQ8T5YCjhaPib0j3JNiHXct9wA4P74JqIsOHMML57pEHnot3UQzlKsghpLct0CwP8ZJKHJ3v/itOhj9FVkPr9DZ1rEWOgAxH4WSPaMYBg+6Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=analog.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wunUM6Fkbf+Qu+V1F4mAU5/fFxB/rdya5QEnEzfWZBA=;
 b=O/sPrIoXOhz2NdeKJsqeV60zAERRpysrJFE0pnac3B3hrCEYBBFs70XjAIYR/Viu6kNqL17r4HbYt8HppeedtrN8VG6CfcTfRKwqHBCwI4I72Np09gwQKti+Pa98fR9lgqo4HQs6GDO82/yRJWpUQGRVlR2zQQZ5V5NViOEBT/NYu7Xk7OvGX0Tu8Ek29z8lPzt0TVCcFaizR8NJTEx4kYtu77T1YbIIWLdlWqaSoPLwJBjSBbhEf31i/NRq6cmCc0WVAs2w6/ZzG67zkvAs8SfLWrkRPT6fc8msCsgBwm2rkhTZkM4mkfFIV7y3chWgX4LBXMc1iUF9Rs9h9HCGVw==
Received: from BLAPR03CA0077.namprd03.prod.outlook.com (2603:10b6:208:329::22)
 by IA0PPF36477A5DF.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 09:38:17 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:329:cafe::3b) by BLAPR03CA0077.outlook.office365.com
 (2603:10b6:208:329::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Thu,
 11 Jun 2026 09:38:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 09:38:16 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id A87054186B51;
	Thu, 11 Jun 2026 02:35:42 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Subject: [PATCH v2 0/2] iio: adc: Add Axiado SARADC driver
Date: Thu, 11 Jun 2026 02:37:42 -0700
Message-Id: <20260611-axiado-ax3000-ax3005-saradc-v2-0-913c9de7c64c@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaBKmoC/32NwQ6CMBBEf4Xs2ZptcQnx5H8YDhu2yB6kpiUNh
 vDvVvDsafImkzcrJB/VJ7hWK0SfNWmYCrhTBf3I08MblcLg0DVI2BpelCWUqBHxCDKJI0tvLFn
 2QuJIGIrhFf2gy26/d4VHTXOI7/0s22/787r/3mwNmvpCIjQ0DbZ8O9bnPjyh27btA3Jzk73HA
 AAA
X-Change-ID: 20260508-axiado-ax3000-ax3005-saradc-151aed5d25da
To: Akhila Kavi <akavi@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Petar Stepanovic <pstepanovic@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781170695; l=3252;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=5B7FN/ip48t3KTM3C9Oc9muHE4rqtNX52TzjMUN6xDA=;
 b=eo83u9tYA/31j2WU0Tf8okCmwglq8SPM4+PAApvJh1quA6iV7t6/YHZkCiHVARLiZYs0r4b55
 8yrFI4h5t5VBNwurKsyjFarYvUYSSWpXj1b1WlAFnbYGCMPn3R2o+wy
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|IA0PPF36477A5DF:EE_
X-MS-Office365-Filtering-Correlation-Id: a5630d5f-5ee4-4cae-116b-08dec79d2a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|82310400026|1800799024|921020|56012099006|13003099007|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: fzG5hRtiftqDOD/2Y8yQeQfZUfssRr97V7w66abPZc2DekxucLTwJmEy62ZOMxCb9FLwjHp1kAujihAahT250gFCVnV5wv3ueyAVQYxZFy90SQhQLPeGg0ylvl/p0ioM2wn81wouZJCXaDq1ppFP9ZSjy4JlrllcG+KqZFkbfKfKj1+c3Sfzyq1v7nL4gbo3Bt4NdtYcAYzG1JUYYuS+JBSL9I+XW6DNnJCO0RbGckYMUNQrrdjwmzNRiUR+gbgrD094kXTE/RnY4QCGAYQR6eBkPSVrUkq1Y9gTBqjjJ9NT+m07gQtFI014oDk4nunxtVmewhHhK+vDnncQeB7Nz3jjieLUjNl1S0LyrwmCoHcMNsFu7mZDzzdB2NfuPUoqRXF52iq2K1+PC7MvfIoUKNHz4UKAEKssDMwF7301Mi79avA6/eONzc6wb0RzzXqSPmmEdWP/wKgpKZyIaXJ09l/Rsk3ceDGHno2MRRCDXuPv6U6RYLeQk2dKkbgOG/EjxMUlfKR42POWEuxuyGbM03NG22NiCZ8vbLcopuxT0lq9P5SRx6Lig4ouI2LgAtlQMJYmJW991cdAQpBrdi+lYJyWbKcdA6cEmboDkl6Gz0f9P0SWj39LSUh72D8qNcnl4haRe/AUC6qISLtMmgk05QZ5DC51cV/GEQ14YqK3SNWR1vDZe1CZYxn5O+nr47QNa+y7NqwN78CJnXbgNwGRh0VXu8EA7eZvkxBhY5U/x+8=
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(82310400026)(1800799024)(921020)(56012099006)(13003099007)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CrLRegugaiFNV88d1OCtmcf6lj+M03HrKfGQB70g51356o1QciAk1motSpDV5kK2sd3UcS2895XwBowWYH4RqumPH8vvkB4pEuCkJa5hfdtB6IQmTqzHyyvl8zORRnnxPKAy4AjtV7pdaI1L5jWMWvnJJhcAr5ODCI2KDaTcSaakfVymMGwbXunp+A9e8AwtZhzy6Kyhhn0isfshfKZ0/HL5nzTwdqumWtPObjH4GJCdkjiqgBQU8pQtUU53rODYfe6aSFXfyaxSmDX4icsYzpNoFQLJybkxtyWileFtgNkGY+MmYI24p8t/jINZMvGPk49v4RE0J3+izvs1EhXg16r6xsjxGxVKh4S1J6Tphh1e8d94e6+haR6DLXTTBvWlUpdAye5o6wrHgWl9i9xg+fWr80AiLoE+oZDaEBiRNllD8ekWEq61TGQx7KdVPNXA
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:38:16.7368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5630d5f-5ee4-4cae-116b-08dec79d2a71
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF36477A5DF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_023825_060538_CFE7466F 
X-CRM114-Status: GOOD (  13.49  )
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

This series adds support for the SAR ADC controller found on Axiado
AX3000 and AX3005 SoCs.

A new driver is needed because this SAR ADC controller is a SoC-specific
hardware block used on Axiado SoCs. It has its own register layout,
channel enable handling, conversion control, and data readout sequence,
and it does not match any existing upstream IIO ADC driver.

AX3000 provides sixteen input channels, while AX3005 provides eight
input channels. The driver uses SoC match data to select the number of
available channels for each compatible.

The driver supports single-shot voltage reads through the IIO subsystem
and uses the reference voltage regulator for scale calculation.

The datasheet is not publicly available. Public high-level product
information is available at:

  https://axiado.com/products/#AX3080

The register definitions and programming sequence used by this driver
are based on Axiado internal SoC documentation.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
Changes in v2:
- Fixed the devicetree example node name to use the generic ADC node name.
- Removed the explicit `depends on OF` from Kconfig.
- Cleaned up and reordered header includes.
- Added missing includes for `bits.h`, `clk.h`, `cleanup.h`, and `err.h`.
- Removed unused `linux/kernel.h` include.
- Renamed register offset macros to use the `_REG` suffix.
- Renamed register bitfield macros to include the register name prefix.
- Added separate macros for `GLOBAL_CTRL` and `MANUAL_CTRL` register
  fields and values.
- Replaced `iowrite32()` / `ioread32()` with `writel()` / `readl()`.
- Moved ADC conversion locking into `axiado_saradc_conversion()` using
  `guard(mutex)`.
- Replaced `usleep_range()` with `fsleep()`.
- Renamed `vref_uv` to `vref_uV`.
- Added SoC-specific device names in `axiado_saradc_soc_data`.
- Used the fixed SoC-specific name for `indio_dev->name`.
- Removed unused buffered scan configuration from IIO channels.
- Added a managed cleanup action to disable the SARADC hardware on driver
  unbind or probe failure.
- Switched to a local `struct device *dev` helper in probe.
- Used `devm_mutex_init()` for mutex initialization.
- Simplified error handling by using `dev_err_probe()`.
- Updated probe variable declarations to follow reverse Christmas tree
  order.
- Fixed the `of_device_id` terminator style.
- Replaced `KBUILD_MODNAME` with a fixed driver name string.
- Link to v1: https://lore.kernel.org/r/20260528-axiado-ax3000-ax3005-saradc-v1-0-345dd5f6608a@axiado.com

---
Petar Stepanovic (2):
      dt-bindings: iio: adc: add Axiado AX3000/AX3005 SARADC
      iio: adc: add Axiado SARADC driver

 .../bindings/iio/adc/axiado,ax3000-saradc.yaml     |  63 ++++++
 MAINTAINERS                                        |   8 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/axiado_saradc.c                    | 244 +++++++++++++++++++++
 5 files changed, 326 insertions(+)
---
base-commit: 51f0c0b8545b23963afd5d43a8f56ee05bfa54da
change-id: 20260508-axiado-ax3000-ax3005-saradc-151aed5d25da

Best regards,
-- 
Petar Stepanovic <pstepanovic@axiado.com>


