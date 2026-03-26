Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D4109E542
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 03:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C8VNFYuzB8d0zDzFtWZhnA54IwaaeyKQrTjIqpWlorE=; b=cgTrYIPZg62Sq+BSwTXS6MGPZ0
	nXOPOFK37pKEfCtcVXEoh0YM90Q+9MSGOEc/Nyqc6omBY/TzegcIagrSAPH3/K1dxosXzfSz6XOmH
	xCkGAVQ7aoUpsuRYxdMTOmLcuf6DsrV+6LxmeXTa9q2pxks3fd8aaaqP9exhuLBTOnvr0QzygY2H/
	HMbA+UbjXtN6PnD+NR0s/tfqaO+/VayoD0kUznIHQcZ41axQVIcfDv8Nkyr1Q6egL+mCPhJQGINI0
	QfpWLYOD+ZoRhCH6bny3Oz19Hx6RPj/Xlaz4wMKTAC5iNF+GvI7XV4FgIGi+13/yhHFjFBxSTXh+w
	xi/JgIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bZd-00000004dfN-2qmg;
	Thu, 26 Mar 2026 03:39:57 +0000
Received: from mail-japaneastazon11023072.outbound.protection.outlook.com ([52.101.127.72] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5bZZ-00000004dex-3iSm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 03:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5ygdFA3U5loI3+rWpf4iM+Rj+1T5wQisqz8us2WoSfyF7OBCQcIGf3jt8YFam9U6IOEf1g9NP8nNFs3z7f5zVPkD3TTUW1+qSdegAy63VvRwAx4ApiUfkZrXrq78NQfs6VpQrOxVS4Sr8psH/XX1j6Cw91S9V1iAG0AmWuqbr9k5AUeIGOat5nA3mn3i54wWYg3EYTHJQho6Xk7hSxvwXbx9AwqM2BMLhW257GwOPjZqTLtRFnULB+EAYVHtP1GzsJw/xFDsoQUUtB47x4PBU73M2J+jkhiki/wsTe3NavSBAfeuft+2SQ1afGphJAjKfavKil1pDvU7q0ZRnRTyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8VNFYuzB8d0zDzFtWZhnA54IwaaeyKQrTjIqpWlorE=;
 b=jvPAUowTSehMlXPIWezwrvOHiRK2QhgdXb9q/6FZKvT+IA2bfFCL6Xq18H59JSqTiV2eHT/OAbyBl8lMzu6eBTuHimFVnX1sXX7A+NZDPdoQ3xbOEOOrGb14fl96UoHIGXyzsdj9DKX0x5ODlVEkIl2DZ/lUX7k+35fqGxPDOMvK/pp5iq5ivjT8xHCXZH36uPd2QK8F2XT9Sz/CGjgDdIGyjTVs8mq6pnaPJIQ4Sxj3fS7AyV/HaW7/KOziIj//038W/fMAhf5hqRIXvvqxrPCKRsGuFm7amvbpG5yPb+qRuQcJd6rl7i7927ZXWxrZGD7N7fI4+gZb+5SmxxusUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:4:195::8) by
 TYSPR06MB6576.apcprd06.prod.outlook.com (2603:1096:400:47b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 03:39:43 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::dd) by SI2PR02CA0028.outlook.office365.com
 (2603:1096:4:195::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Thu,
 26 Mar 2026 03:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 03:39:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5BBC24126F86;
	Thu, 26 Mar 2026 11:39:39 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: arnd@arndb.de
Cc: krzysztof.kozlowski@oss.qualcomm.com,
	geert+renesas@glider.be,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Chen <peter.chen@cixtech.com>,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH 1/1] arm64: defconfig: Enable options for CIX Sky1 SoC
Date: Thu, 26 Mar 2026 11:39:39 +0800
Message-ID: <20260326033939.3789800-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|TYSPR06MB6576:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: caf7f58b-b620-4bf8-8ca0-08de8ae95010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: b19gpj4+NUGTihaCKDg4zz/XHYQqgIE1NiHzxzQjnYSABXa93wUy8+B0OvwdGtDfrOlhGQON5hnWgKOxGOHma2nQ9IpbXKR/EeTLVgq1LeMEFozQ1RuKdKQ80QxX4tmRdDAR/D4na3FtNR/wEMn0QBLQGbOSjZrqKRkOGX0LLBcNcYE8tJ4LgUl69TNis89OBvXCGz74G5HSBrPCRMULtHxVG+AFfEXvIgVrnV09046UXeGYlldwmuIaWBgod6xM3LltmHuefe78pzVnLEqdykzXWaXeJqnMUeHwWfc9u/rh5pEfh4cP9rxOaWvWl/172DTT0USTaPqMRMslYZH1cy9LarjAMExfb3Kp+RnKrI+KRZxZSsUUT+OjWOsO3YvGeBcYoZuaiP2hxCfkSUFCEXnMrDkcH9+eC052s+4r8MhmEZkiUhKObcVSln9RpGtEzzRhP9JwVIBu3VW8XsFYxzbyloaaT5uhi4wUda/041DFTUnqqrCG7tD52vg6dKyFp45O2ug8o0CpgMVRo8xhrKEDjAjN7AShEZ5MwR2h6buTg5wAST7Mmjf8xi3E0SFSKrE0VXHE1/mVNv2PKlJWAxQU1sBQ4hKkNAcGb0ecJW5F9teCRIraJCBOCC/nGus9g4w3dUH5V+Lph6+8bFBtyApTD8LQPrjMnKpSA5SxCPuYo54XHNDw/P8Ti9rCOtSd2LIT9wdfOSqmq6MZwY8rkV1mt1x7EnP1RU/g18pYlm9VXSpuSt0uL2uVK/eGF0yHwDwvBG1kMJ6wwaLvBkblMw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +czIHq3+BtI9K0YAbY8zHO0P93EmqSv2mw+URNizuqLsdZV228rFk19ZkreJZGSeTs/gc3ww/2JZzwZopqzIECeYlMTx2mQsJxcFCJdInPMcKugrM4iBXeD+M2i19UnefrfQCkNEcmJU2oiqdMLhM3019m4AGlpebPgbIOLh4Ee9eC2iPAiqg6O0q3YiFpwtaYctrY7cslqKkH3VgxqXKcyWw+1syPraEl+s2f1nNMP5C01+FYwnQORZT57YY50ijaSWSDIA27Onpot/0iHH7/m+96ieFtmJrRpmWfEyJptZD8KyLJGkhiq0SBkAXYil8MFXOFVg4ZMuYBFCjb42k6MFabhLUCeKAIeDiW7tkmIGIAFH95FmNDo0Xu4VudLQfHYedPcfPds8QCAvwdrYP+cqsvxMnRtvMKugpEZcIKaPmD1+GEwgq7XQ99trKSnx
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 03:39:40.6172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caf7f58b-b620-4bf8-8ca0-08de8ae95010
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_203953_950817_66E59220 
X-CRM114-Status: UNSURE (   7.30  )
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

Enable pinctrl, gpio, pcie and hda audio support.

Cc: Yunseong Kim <ysk@kzalloc.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..85151adc7d65 100644
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
@@ -1060,6 +1063,7 @@ CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
+CONFIG_SND_HDA_CIX_IPBLOQ=m
 CONFIG_SND_HDA_CODEC_HDMI=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_USB_AUDIO_QMI=m
-- 
2.50.1


