Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4511FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vCfeFUvEWFsFQbJJAvy676NPr2jpNes6HbaKyexJK64=; b=TPr52wzZTyIggf
	wfYwoJ4SnJHy0KjxgcXIY0UQRbXWW2CfWdA1G5sEMKzB/fKSCw/OfC2qfJY8OpUZEx6rTb4m5xOtW
	QYbQwaoS4iC6QiGEK2nZNyKftoWwngKOlO2/WChnmbHht3shvmntEDGXtR8zDnWrbzedkbJpkxT4t
	pJnMhDgO3bA5vnPlooQJCbFZ+Vm/1UOgoTEA+IgIaXTrTH5l1xpNdKVaEXzjY+47nZy694Mdj0cKp
	GXXD0f+08IWi06bK4+QYIogvMoz5zGA786piHrfS3DYVFU6pWplcF5+GG9Y3Erybs8pMDp0RaObKK
	XIQMKvWyi74VFccJ1hFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgczM-0000000Bdni-38Yn;
	Mon, 06 Jul 2026 06:39:32 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgczI-0000000Bdl1-0REf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:39:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls8gszQeO2DumK8L85Vi4s0KofeDvs9Bb94xruXjCqow4UI/8PuLGfNu1COtipr4PDEuR3nxqA5EUuGZMjlNq80u8fQLgSOTOGHo7NQoX/0QC4waWd0c0bNp5egRxQjw61Rjb+mKgi4vHoCAzb1dldPyJaoLiys8smDvhVWAdQosgxka4MdmjFS59FqoKhTyecEMOaji8nXz5PzQ0rN1aDW8KGID9dNJgjvcnFTHmd5YLOZgCqY9C4Xmgr5exmNt1pff2Jc66nXVVudfAF0VAi8Ho2mFG3vNUuok+7T9I8+5GsjPIv2mPlc2a9sH31QoZ5LLUslKcq4UImxbFzMQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCfeFUvEWFsFQbJJAvy676NPr2jpNes6HbaKyexJK64=;
 b=bd5xFr23hYEdt2FMBXZYT5Qc28bIb59+BGYQG2IxSz0QhZ/VvwAH5AmG4I47xrNflZ/ttBNOFVzN9LyGqAo6WcoRe2DcaJfwXpEoc7SYwxgKdnkGwtO93+ucYW+NNAchDjZoj5G23AD3ld6W3THQ0scGQcPjWnLwd+CQ5i5ZIoq3x39GDgsCRt7MJB91efaa5dYBrv0unQhg/XNURKx4XOTz3JqdEJ93dmw7YbkLgqyZQ7IBMfh8Z5HgRFwXExPNx+39z6jtgH2RrC9AR5lvHzK2zM78qO250Sp5Tvyw8lDKoVZmJq7PzfU9Ro85D6XFdEm66h+7XRvduZt5oWwogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCfeFUvEWFsFQbJJAvy676NPr2jpNes6HbaKyexJK64=;
 b=ZzFh9dPSLrJLHfjht2BPPm5GTGUgXs8dLtAX6aS3euXrKCjvVvPDuRchokCTzBsFecMI00d9anIsuyf5joDkVlCNvls9nKOMzhfLqohugmvP6vc1XLyapiiwfACO40+QTveSbuXHvgGtp/zEmHUAAdkjakJqQVzlS12xRhqZv9dyJG8LxTVIapolaMm66BlEpiItSn65HiV9c35e5vo22UbWp8iWlA48U+D6B90t6x371/2+Nxl4H0s9jErEv/R4/zjTaXVR9oY0gu2mUikSHnOOJMKqJyt6S4ogUTbiK7UsaHR1uC+M3imoL7pK9NHQ3XqRAnd8eGCKMwjYQpZAgw==
Received: from BN0PR02CA0007.namprd02.prod.outlook.com (2603:10b6:408:e4::12)
 by DM4PR18MB5050.namprd18.prod.outlook.com (2603:10b6:8:42::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 06:39:15 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::9e) by BN0PR02CA0007.outlook.office365.com
 (2603:10b6:408:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 06:39:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Mon, 6 Jul 2026 06:39:15 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 406884186B5A;
	Sun,  5 Jul 2026 23:36:14 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Subject: [PATCH v2 0/2] arm64: Add Axiado AX3005 SoC and EVK support
Date: Sun, 05 Jul 2026 23:39:04 -0700
Message-Id: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIlNS2oC/4WNyw6CMBREf4XctTW3lYe48j8Miz7lLqCkxQZD+
 Hcrmrh0NTmTyZkVog1kI1yKFYJNFMmPGcShAN3L8W4ZmcwgUNRY84Y9pjgHKwcmF5LG5zghVr9
 aKWybM0rhjINsmYJ1tOwPty5zT3H24bkfJv5uv25R/nUnzpBprJRBpVsuyutneNR+gG7bthdIi
 1tEzwAAAA==
X-Change-ID: 20260617-upstream-axiado-ax3005-upstream-bb09780a2fdf
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Swark Yang <syang@axiado.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=syang@axiado.com;
 h=from:subject:message-id; bh=pbi28mgBeJSMn3R4hMryCfFHE7F/uMDj72dPnR8Z6tg=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhixv327uVzn8/yuuHYjxm3haRDbLq6QrZwWfYfVpmWMlt
 hX+Tt87SlkYxDgYZMUUWb7qfMs/mat9r3PvylKYOaxMIEMYuDgFYCKrtjL8lQrbp5Wm9iN1LfOE
 3mJXBYcn9zYu1VXp6PmnOufEV678fYwMh3c7XNjeti3/gZ2n5cf4c4c2FWVNWO6Q4BnXoud6ybK
 UBQA=
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|DM4PR18MB5050:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fcda9b3-3b1d-4688-a4fe-08dedb294c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|13003099007|3023799007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: rfyydrjbWazisFXgBYM+sCoWS5C298HUppvpJWRFWSa0ExcpbE83gJRJ7CZClm+6gtkUlTX7i4AFTkumQnjFWJeUpARO3XZPDz7VAaGBUOtKU+uhWnDEDzHBKyYlKFpiatZcxg2urrN7P8juIuQ4vWUwYm7PyhznDs5mspqF3JweqYyZoQUWh57WV79u+PfYMD8zoWuu2aPrhLSl/bEfDlhEWpr3LZ/4CCL2XxyWJWmzv+k50OYCMwTqsn8gZek5VQPk0RlwoukZx5o7cBuGMXcB8V9PeKIBp2CqRzMGY5STV3G00504FgU5c7VmbeD1fdfuFPTLjQ1laZ73Lwc/MGJJAD1IjIPcCZD6dHydJr10pBsAvdVBtzrAHqIDRkc5X9jH9z54q77aLFvovv2iWx1JVCVXIq2dOr1YJtpF5JA95y6OnqJeOUvCT93UVa5mb1HILiNx5p/234gXdU2s3h5V96js0ZWvhmkgpal2+D5CLSHiI/jYq/NKMNLZuNYodlAUhgflMgR0D/S34YNlDjTiBfJjnHgCFksL9UpUIrGOkAdeO1OpI8Arst1kbqiwWDW9aqZPziW6QXd7YZFTtuILqt7FkDnPhHQMKebopz7k99rlH7DUQjdiaI+xTYAf287a6xi+grv0c44o1f6hI28JvRjP0sWyeCL/FEwa5FFr65KugtsaWwttr+DgJYDw24SDXQjZm2so7KJVhC9z9g==
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(13003099007)(3023799007)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3zIqLHtA7vV+Ub7FIp4N2vUkd1om/uqFKIt7P/EI4NEER4H9JbYeYTEFzayna62hk9sNuqkTSg53c3xSR9sA/EAbRzCsL7qtdigJquxyof5aOTWAS0x8uqMfQEW8p21HTq4MrRnVDQtWXvIxY8qtMz3DOMFUeT6TbULhrkHwFXLdiuwd0S9jE4ULisjT9dFH+OxiLHn2Pvswmm65rkIk1VKXgqnamTGH3qD3XarL9UHB8cn1+/ZLXoB55RwkpvIcEtQWdH7cbeiKmMQlQX+VTACi5/jeWXS429QnDfgLHjp30Ks1PNCF7vsYk9owoHR3e4d0403KEtg3wJgR3PVSvzBSN4nPIFLWs+NEYflr48JYpSQrJIgtUSmtoCd1nX5X8KQhkW1/JWy5JPBUO+OpSSQA2Lqg2roKfGAjGF0rejP7WtsJg6nFdIXgTX8XW00S
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:39:15.2915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fcda9b3-3b1d-4688-a4fe-08dedb294c5f
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_233929_335740_19689D5E 
X-CRM114-Status: GOOD (  10.60  )
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

This series adds initial device tree support for the Axiado AX3005 SoC
and its evaluation board (EVK).

The AX3005 uses Cadence-derived UART/I2C/I3C/GPIO and Synopsys
DesignWare SPI IP blocks. These are already described by 
existing bindings, so the device tree reuses the "axiado,ax3000-*",
"cdns,*" and "snps,*" compatible strings; only a new SoC/board 
level compatible is added.

Patch 1 adds the AX3005 board/SoC compatible strings to the Axiado
platform binding.
Patch 2 adds the AX3005 SoC dtsi, the EVK board dts, and the Makefile
entry. The EVK enables the CPUs, timer, GPIO, UART, I2C, I3C, SPI and
USB controllers.

Validated with:
- make CHECK_DTBS=y axiado/ax3005-evk.dtb
- make dt_binding_check DT_SCHEMA_FILES=axiado.yaml
- boot-tested on the AX3005 EVK (to init CLI via ramfs)

Signed-off-by: Swark Yang <syang@axiado.com>
---
Changes in v2:
- Confirmed with internal team that AX3005 BootROM multiplexes the
  single release address for SMP bring-up.
- Corrected architectural timer PPIs and VGIC maintenance interrupt
  polarity to active-low.
- Aligned memory node unit-address with reg base address
  (@81000000).
- Removed 'arm,cpu-registers-not-fw-configured' property from the
  timer node.
- Collected Conor Dooley's Acked-by for the dt-binding patch.
- Link to v1: https://lore.kernel.org/r/20260624-upstream-axiado-ax3005-upstream-v1-0-c05bd0bc9124@axiado.com

---
Swark Yang (2):
      dt-bindings: arm: axiado: add AX3005 EVK
      arm64: dts: axiado: Add initial support for AX3005 SoC and eval board

 Documentation/devicetree/bindings/arm/axiado.yaml |   6 +
 arch/arm64/boot/dts/axiado/Makefile               |   1 +
 arch/arm64/boot/dts/axiado/ax3005-evk.dts         | 327 +++++++++
 arch/arm64/boot/dts/axiado/ax3005.dtsi            | 842 ++++++++++++++++++++++
 4 files changed, 1176 insertions(+)
---
base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
change-id: 20260617-upstream-axiado-ax3005-upstream-bb09780a2fdf

Best regards,
-- 
Swark Yang <syang@axiado.com>


