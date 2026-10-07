Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E5DCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txmoDk/ds2V4BjTKqJdf0tNY0fBbXynWMop4yiCdJ5U=; b=VBhCCwTmhfFMvVpBNkKl/KX/b8
	p+0kWEy9e3Q2+4BoBMw4Q0GyQAO77hOYp1lT16LTLq8Br9xVTOwViKoP62qW2WWtGIs1zxXOcSiB7
	BeqR4r4LoGGUVqJXTAAmlHXzEvCZ4ajhBYLvwEf8k+QJ4+eE7DkIJ1knbMDWZaX5PETWS64W0dUtP
	WgAHnOpPLdzVOMBXG7/0+hLm83rfYnjoAmRuNL9soS33xA1K5cV/s1djwFQbYri9mgFDYWQOMiZYb
	EraMXBfPrHN1FAzdSpZsjK8WLI/fXotP1HAwyOVbVRz2GZBXJ1Pra6O/9OSFdWNlLrPFjDRg8nmBK
	WL1bGIvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELgh-00000001ozI-06ga;
	Wed, 07 Oct 2026 07:03:39 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELge-00000001oyw-2SOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:03:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCwmtc84SBdrvszSRvoLEIwdVixNkEoaagNWJdf8ZFXLyxJxOWBZBwi3aZyMkKB2M1XHAOITbc/VCNsJ90qMSqc/YfU57UaId3gUAVbSoC+raEuzorobr7W2dNiHDAnJhwzrPsY9DKpZXbhMi6u2SjJ9/i6hUCG0GwbVbtvbRThJ/GC506I5XkJQ+4j/K4TPacykG0Fh5kbMb4aND4aL8Biq+gp12QvJ+AGA16jjgkya3NUnN/gD8JA732vXSa0mmE7cOHZ0TMO2AHzZNWZWfTQe4HUadjDr2dzLAhrFssKi7F+xqq8NOJlBO8Vi5gF1+BxxkEtaEbtvk8aC6zOlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=txmoDk/ds2V4BjTKqJdf0tNY0fBbXynWMop4yiCdJ5U=;
 b=ldOQOfUt5vGfZvLulXQaehQg7IBZ22xtRYbT+PdrWiVsQf3xgzPYEDFur0eICnHeLlSG3UMAIW3MsSTdRn4dtLGr+AV9NFYgZbKb2AlxKBg1rBWzkBmAaO8oVabEthgh/1Cs8d6kPquv3xhXCnszJopF7675Ws/R/8XCax+L3MdcGGc4Mbw8on1jX5nzmwG4xS8diOEKhog6qTSiXvVrLWwdnOiDA20Sb6OWLBqv0JzTRqmwZYAf1zF03SJzFwtWixwE3aOlLnojHIuhfUt7RJ4zYhZiPStlGXAaupeaLwtDukbr/vkmudx/WT3U434EVosoiRg/kDhzuxzhewe+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=txmoDk/ds2V4BjTKqJdf0tNY0fBbXynWMop4yiCdJ5U=;
 b=T55Z3AzW8yOTfiyHR3lUiObU+qaSZfEdEDuoBGylWREqHSV2EZafMAl2u+CHszy2fDI+paUZzWb18P/tutmm5miWEUpjbXhJHL0rVrrQqUMa3oNSaMT1jeM+9dtE9Vcb8dA2vBTqUVwXhsfHHJov+OY4oW3BRAB2GF3dptag1VCh98X7jZHQ2rr/f5QABmZIN0+LBfWxNd0y55U+c4D24z1nzecdzYZOyXVTtkwGZvvAxH6aIr6Kwmn2U4ZZ0t2R1Le/Rt5fghPdPpZ3ZV8I852Iv1ozT6EGG4yCd207ux8m1I3CXvjhdEfqP7MEGAjLYyO5tsYoAF5MESh/xBAybA==
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by SA1PR22MB3003.namprd22.prod.outlook.com (2603:10b6:806:236::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 07:03:20 +0000
Received: from CO1PEPF00018869.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::59) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed, 7
 Oct 2026 07:03:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF00018869.mail.protection.outlook.com (10.167.249.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 07:03:19 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id EDC311A2D0;
	Wed,  7 Oct 2026 10:03:15 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	stable@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mmc: sdhci-esdhc-imx: map unsupported driver type to Type B
Date: Wed,  7 Oct 2026 10:03:12 +0300
Message-ID: <20261007070313.863-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018869:EE_|SA1PR22MB3003:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 91ee78f6-d691-44d4-8e37-08df2441119e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|56012099006|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: YOH7VvRIMDn2OqWRywaGbdrTcOY2zR6HeU2UOYCvOC0xT7MVPP6cWUcdickX5FJsl8KtmTj4BOzFVzA8hwVV8Ozas3bWHsJkqACGvAMMiUFPcuzfRk/74xtI6dWYl9ecmOXK3AC+IOSSVLxRD8WdQGs+StMwwyGeOEj9nVz/+jUQe/7T+vX1I1b0PU/NAB1nt87af3j5N6lfur1PoHbERDC9ZmxbGTXYt7MewOQ4isQbL6Ayhqcyf/6DtFdujsxOLekeTdWaeKq1J9iVLTIR5SPCDZ2BCa52/udgzsukDOg22s6owZt/zF7liIadr4GNGj5QB5t3HTjnvt5F6ylBNHkApmIdGSQLc5VbHHy6/n00h493rluehdVx0jjnHMRzbxaCzvbtJvCHJMeOwnD4fd6gGa2joag2966xMspm+/BF5wSkT85YbFZRq5ujnVDX8FIhgqru2nN4JQMwP/iV45umObaJM4Z6A+TovPwkK+DjAQmLPQWaNPFbkMKXMGGvuIH75jA9wfAT6Eztbrl6Id35PTx0Qg38csnsdd/TTKbYy2ckGwcODwAAQARICNCZL2XWVBt2worOHxEl6wZ6RFw81vj9bVqPoDZ5CWWTFu7z22+cZ+iOD+cvSuLwD/SK+MuFZhdMpfmL7EOThaSTmKxCDfmwjdJnwPncu4CUVKOjz1deLDVftDCU1HU4UDQ+t7qUSo7Y0El0Zo2VmY85JQ==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3kf3soetsR0XuuyDS+9nBKdJvl6TnxMIU/78Gq7hUhFbEuL1PRuv3odFRXDrIABb2Y2ynCCuNUxUoc+VgelhMH7enbJVQn0Opy5ECnv4bF3vU8HAzAVHioXzOQFEXZ6P8wdvscUbiY1HG3G6l6woYIKbkj2DvxmWrwlcJua/ev8+wW7K/RMhtmRD+4dijeV5EQvr7TkqV+3BasOypQ/UYH2yTHvB/hcwxLNFmukAgGNz9R1XTWybW7jffiq07lJhveoAKXGZAFvYCmG207FsdjmmfWcWpqAWoMo1CSi2s1vbTq5p+nYLDR7hbod0SU18z1dfvQ6PiCytG6DOvlIsF+aVuQhqlR/Xrqdl63vKjzbK24mwZiE8y0OPv6yyJLVVrpCU9Us3d573rrCoaHDBnPf1vmZo8lWgZ7WVf2bzt45WchxOC7Z3viuMwTP4WMFA
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 07:03:19.4719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ee78f6-d691-44d4-8e37-08df2441119e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF00018869.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR22MB3003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_000336_641740_F95942E4 
X-CRM114-Status: GOOD (  14.31  )
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

Since commit 5a52c5701a67 ("mmc: core: Fix host controller programming
for fixed driver type"), the eMMC driver strength is passed directly to
mmc_set_driver_type(), which propagates the value through ios.drv_type
all the way to sdhci_set_ios().  For value 4, SDHCI correctly warns:

  mmc2: invalid driver type, default to driver type B

The host driver type has no effect on this controller: esdhc_writew_le()
never programs the driver-type field of SDHCI_HOST_CONTROL2.  Hook
set_ios() and force drv_type to the always-valid Type B, so that SDHCI
never sees an unsupported value.

Tested on i.MX8MP (usdhc3, eMMC in HS400) with
`fixed-emmc-driver-type = <4>`: the warning is gone and the HS_TIMING
register contains 0x43 as expected.

Fixes: 5a52c5701a67 ("mmc: core: Fix host controller programming for fixed driver type")
Link: https://lore.kernel.org/all/20260926122908.866-1-ian.ray@gehealthcare.com/
Cc: stable@vger.kernel.org
Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
v2 -> v3: Force drv_type to Type B unconditionally;
          hook set_ios() for all esdhc variants, not only usdhc (since
          the driver-type field is ignored in all variants);
          reword comments.

v1 -> v2: Move fix from mmc core to sdhci-esdhc-imx driver per review
          (see "Link:" above); always provide a valid host driver type.

 drivers/mmc/host/sdhci-esdhc-imx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 6ab59d3e346f..931e383748a9 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1142,6 +1142,20 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
 	}
 }
 
+static void sdhci_esdhc_imx_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
+{
+	/*
+	 * This controller has no driver-type control: esdhc_writew_le()
+	 * discards the driver-type field when writing SDHCI_HOST_CONTROL2.
+	 * The programmed value is therefore irrelevant, but SDHCI rejects
+	 * non-SD values such as 4 (eMMC 40 ohm, from fixed-emmc-driver-type).
+	 * Force an always-valid Type B.
+	 */
+	ios->drv_type = MMC_SET_DRIVER_TYPE_B;
+
+	sdhci_set_ios(mmc, ios);
+}
+
 static void usdhc_init_card(struct mmc_host *mmc, struct mmc_card *card)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -1952,6 +1966,9 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 		host->max_timeout_count = 0xF;
 	}
 
+	/* No SDHCI driver type control */
+	host->mmc_host_ops.set_ios = sdhci_esdhc_imx_set_ios;
+
 	if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
 		sdhci_esdhc_ops.platform_execute_tuning =
 					esdhc_executing_tuning;
-- 
2.47.3


