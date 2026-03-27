Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372E110ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wdp5nUgWvt8hsZfGhBpQszBeoqXpqoN6gx8kL4Z6ndg=; b=1gIU26cq7ZwGA5jAMtBN5Dtxau
	Zmi4tgotysygqGM8JKjjti2fpSahNQKO6C8Q5neM1Z+oUuOHpL+AJZGf0uj1/WYKqpdRq5v5JqVgM
	2FbnYE/1HUNlEDxa8d8xgdaibOcaYAmN6Ygam5ToKTYENPOc7E4sXbxCduB0T2UcT4odpgHb7bbol
	GfCURlAQ5nsBQBBNQgI/gUgk43ytQ7qQK5Eys+Msm7mlT5KHao0t4W9skw42973oJOFPl9sE3qC6C
	7dE5s0ufMsNkJe9WI749WbbVX2+g4HptydRdI0njwp+7YKNGowwKFocZZ3cFySHYnPXMkVcQRu/D9
	GucFpuPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65eD-00000007IfY-07uH;
	Fri, 27 Mar 2026 11:46:41 +0000
Received: from mail-japaneastazon11022091.outbound.protection.outlook.com ([52.101.126.91] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65e8-00000007Ieo-2aHo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:46:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdFUnj5jeBZ+eVBbKP0vHzusI4sROuw+VLhMy+lMRac6gs/hPWDKCre+rtgWuoZLyBkQkkytpjCr2/pRSt9N4JtFWsb9b+sG1okMpnV19kVo5hJ5iOaH5e/GcRp+7nJ6flW1Ftg7GJ3F5xC9pmKKcisEXxuYYS8oQ/0trRp/4iY79RTaoFQty0ozPwXIklQ1E4pmj31g6QHb6BTSJ1DItYFeIvvtcM8AgfIM+/05HLlY9+jC646QUoNBnyivRRgimehMpAWjbnTqqdrSY/UpwlqCtPt+Rfa26OumPPbzRqc7o0rQxmXRNhb5yIOtauufMNrNOW9mJhBM3Sbo7bzoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdp5nUgWvt8hsZfGhBpQszBeoqXpqoN6gx8kL4Z6ndg=;
 b=xHBCFoCN94vO9eNOf+N0zxf5cNr2hGMyfor4z1eTJBuDG1Mbq1BwmmhfoN2FYe13K/wnQF61nhflpgJCdA9+KGfja5HLNIxQKwYi0VffP+J+HEju2IAMzNXduHW2QxPHSoAcRtZoaX1eRqCTWMSwGiyYV+bp5hSagvJbNUiEpOXn9eDjYPq54i/ZRglmixCy4gtptqt6R/rPeC96Qqcou3+IHIwulXJ57V+HwPS3Vu7Xt2EZ1N2I2sISRlYjVPVespaiK+QwTKA4ghuxIGgS9zUh2eN7f7FHdgpYC2w0xniLlByVOu20O5GPl9qeSlPRid8QPylQx2g14+FYQo1rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30) by
 SE1PPFAB5ABB47F.apcprd06.prod.outlook.com (2603:1096:108:1::426) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 11:46:30 +0000
Received: from SG2PEPF000B66CD.apcprd03.prod.outlook.com
 (2603:1096:4:be:cafe::9d) by SG3P274CA0018.outlook.office365.com
 (2603:1096:4:be::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 11:46:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CD.mail.protection.outlook.com (10.167.240.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 11:46:29 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E2E1440A5BD7;
	Fri, 27 Mar 2026 19:46:28 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: arnd@arndb.de
Cc: krzysztof.kozlowski@oss.qualcomm.com,
	geert+renesas@glider.be,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Peter Chen <peter.chen@cixtech.com>,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH v3 1/1] arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO
Date: Fri, 27 Mar 2026 19:46:28 +0800
Message-ID: <20260327114628.3800886-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CD:EE_|SE1PPFAB5ABB47F:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a924d436-d5e4-440e-5185-08de8bf67c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 11RP1iPCv8K7a9wy4sSC5xR6crRFZ2e9dq43TybMTPnaxmnEftaz5sm+AL0k37na6AJ8UFj2dbaXmXtZg/hfrHd9s3ZNuJoYW6tpNugepknNLdSqDyvCaG0h6u3+F8zbSpB1DqTR5I81piOd7Xn+gFEDB+Dxyb0+gulgBFGgSSbh5IST1MEXT4zJWoL/38KxjdfgPthPyesZqViTGvipPMDt+Gw0XS1mKfkVNQtUZmMzOEZgyjbPOyC2i7O6Qpinjuz+u345vz1wrTa1HakhOYx4a+mbURRxef7BjrUZmIag0m2+AIkeSeWYu8CyuYJ0ANVQt5/GgXEnFKb52z40A11qWl86Q732b+Efviot4hD0YKdRlMIjG/oBic93bn3rLtqULNvRqsCnoxL9BRb91jPPuIvd4M77FkRqT8e/PzgPVxPi7uxP238eXXaWWUykw9bVQoaeZOAOfvqcGAHWxshn1gkk1x6SbYjtecsEjmw4jNil8DIfq91wX3fQe7sS0bcl+CqvZm5h99IQbAHi8Ei8A3mJqx2WzARD9YE/A4MMTSQh6AxI6KSTka3oeg1fHgjE6m+3HjZ7WWwChbhVgMDvTH64WGdJrLHUXDXT79gwGyY9Ucbeo5ubq1OXQFpWwJW0gtxk0tAmTbWODpf/dHrK2FvnGeQ0zOkIGITtDrFcyANGyl/bc3fAJPZdTiJT/TcZs0/unyoHPk2t1LXIpT1EVJmTOi843sG2ZcgiUCUJY1PrOiFscy6D12WooEhOZxtVAqVF565AZmw3m+S/kw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8ygj0EYORYegXXsGF0vDJioPgbwHSMYQ7TbkP5REt8Py5A9hHKAQ13C7VUWd9xPRv6pxv/ooAmngLsTWaWSzgZjvcv2lAYSnxPDwpucBsAqj0dMSKitrRnsr/ZdPGmn/XzBQly2bKOTrFVfjAfXVVQjfd37ActoQzeUjqdY7oPHwPXFvyJG7nPVT9xDXKrC8DQL8s84BtdNQQXteaqsZ0f/QivVtEfQnr4RSLKTwrJUGRLlFa1NHxv67COBKEy8DsYgOFFdib5yottUpD61vgl2kBXrkHFZJYBf1v82szCHsmxSEe+NJRc+zBvIjdiHuXKyWrKYmTvZkP1hBRL/A2HK9D1O8t2oVSzXZosD3Lu0ZY24s7aJ9DOZJeHOv/j/mMuacy8eYgBlLW+POxLNa9nbXUZKGAD2NlUFpXB9DGGeGKODFcZ5H0kvTfxJEnGMi
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:46:29.7932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a924d436-d5e4-440e-5185-08de8bf67c79
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CD.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFAB5ABB47F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044636_676953_49BB4D0E 
X-CRM114-Status: GOOD (  10.33  )
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

Enable the CIX Sky1 pinctrl driver (PINCTRL_SKY1), CIX Sky1 PCIe host
controller (PCI_SKY1_HOST), and Cadence GPIO controller (GPIO_CADENCE)
for the Radxa Orion O6 board which uses the CIX Sky1 SoC.

The pinctrl driver is a dependency for other on-SoC peripherals. The
Cadence-based PCIe host controller enables use of PCIe peripherals on
the board. The Cadence GPIO controller provides GPIO support for the
SoC.

Cc: Yunseong Kim <ysk@kzalloc.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v3:
- Use specific driver names (CIX Sky1 pinctrl, CIX Sky1 PCIe host
  controller, Cadence GPIO) in subject and commit message instead of
  generic terms.
- Remove external Debian bug reference; explain rationale directly.
- Remove NVMe mention since only PCIe host controller is enabled.

Changes for v2:
- Delete CIX HDA configurations due to it is not used at current
  Orion O6 board device tree.

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..f9be52484008 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -241,6 +241,7 @@ CONFIG_PCIE_XILINX_DMA_PL=y
 CONFIG_PCIE_XILINX_NWL=y
 CONFIG_PCIE_XILINX_CPM=y
 CONFIG_PCI_J721E_HOST=m
+CONFIG_PCI_SKY1_HOST=m
 CONFIG_PCI_IMX6_HOST=y
 CONFIG_PCI_LAYERSCAPE=y
 CONFIG_PCI_HISI=y
@@ -676,6 +677,7 @@ CONFIG_PINCTRL_SDM660=y
 CONFIG_PINCTRL_SDM670=y
 CONFIG_PINCTRL_SDM845=y
 CONFIG_PINCTRL_SDX75=y
+CONFIG_PINCTRL_SKY1=y
 CONFIG_PINCTRL_SM4450=y
 CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM6125=y
@@ -701,6 +703,7 @@ CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
+CONFIG_GPIO_CADENCE=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_MB86S7X=y
-- 
2.50.1


