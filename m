Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88064CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mSgi5zuM2XAqa42vQT6O2w/3Bh2HnoxcNEP2kmrFSoM=; b=U2FBvLnzoilD+Gf2SfGwF4NzcA
	mV/PWUik1OK0hoTL+NqlgKMcUQ/j/t7aDs1fA2yK45jV2/6NJkuSv7Vo/gOkjMsiuLyRXTVQQzLQd
	5vMMRHNjbL7nvXIstZHnKlZYExpyBI5Sa0qVgaQPOyorX0FgeZ2xmbXSVF68eFF+gGgJj7W9GDj1q
	q5+yYKXkU8KkCKAtyOCETwAvInZXq00B4VchLD++SbzaWg/5DHjcxFmpCKXlGpHFX6qAe5WxuOOtr
	2plqsK/Z0yTBDVCBfUa46GvkZtyAquYVEL7GJsphpWCEByD/dje69IyfbkuN6LbpJXr0N83K6/ox5
	88smuTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2nO-00000000ZLQ-3JzJ;
	Tue, 06 Oct 2026 10:53:18 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2nL-00000000ZKl-2N92
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:53:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sfiMJQhQdUAQj02ApB9G7LoCZLQVa2/lAmrOByVIVucGF1r80TR430bxcMr42w+yC98lQaHe9Tq/kQMeZN1cJ+njN80dl8KVFCosFEzpVbqrT/a4Gdpyon9QJB9dBFgEGGhaJyvx6hpzXASvAc1lNSNxTl7gme8QByQso8Dcvr5fM9/c8pVLjf1sTEidBhAGgDA6I5h9fdFpHg8xAT4axYWGXWHOQJ/Si0kwIOb02zGCc4Nc3J7qJ/QnWpKZWM/aNOeQUhppyRZSmz4qYl7IGlWLvFmXPGXZEDv7yT67kLzHyn5pkMG81UWffQKhGsEbg4G7ymD3S+fhoDsMvoi9IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSgi5zuM2XAqa42vQT6O2w/3Bh2HnoxcNEP2kmrFSoM=;
 b=R1qby2cRLYHNjtw69XhH7C8JOjCaXV20gI8TZtPSEnwOwIePHiwrkYxstJSWaXpyTJs/UZ9sMr7dNmBbK4QpRab2BA4R26FD+UbYZhzupzc5Gg0CpPQ9yG+Ccn7Rmf74XU/fzYg8K283jXYdJayaht8JAGUQak9tU4Stxuuzm1XSY9dm5qX2YU5zuhwjcvaUL9xQqoIw+aihiT+N94EqcnGWSLdkHzUkB12yY9OQvAPp3G/b39OtRnZYaXyePTVO6bxjMfoes6vlK4jpRB2l1aRSoGt09V2nqthzRTC/FS4jpWvBRXK7sIhmgg/sXGRZIGHphcWBPAfHYPHj9JtPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSgi5zuM2XAqa42vQT6O2w/3Bh2HnoxcNEP2kmrFSoM=;
 b=gfM8GgzcuaaTCjdzI2NTgO+cQE4v2XQYBHGHuB2/CqPfuQVEETyV7ZBDaubsnxvESxSpX8DIpLeqWWMJCjoOfO1IasJ0hmPScyVKQltH51KZTtrwHTC44AV/GCmMjc1y9iBGq8ajNEih29hrXx89HXKaKyb3LAUS9BfnD9S/wWlXLGD6UpVIdQei3rUKuf8ix+s2UE3rzXekp2f6NRUvafvpj+D88I89azyWPNzVr3YyIK2uAn5r2/v6xFzNJYu3Qoy5yTw1EgNDkPxQDc88iNSZMOAMoALZ9Xv0VhXc7OMron65rt67okgTmEFou009w1uWE+ntjLlj05PA9v5eiQ==
Received: from BN9PR03CA0392.namprd03.prod.outlook.com (2603:10b6:408:111::7)
 by LV3PR22MB4557.namprd22.prod.outlook.com (2603:10b6:408:1a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:53:06 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::8a) by BN9PR03CA0392.outlook.office365.com
 (2603:10b6:408:111::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 10:53:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 10:53:06 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 4BEBB1A2D0;
	Tue,  6 Oct 2026 13:53:03 +0300 (EEST)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Haibo Chen <haibo.chen@nxp.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	stable@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mmc@vger.kernel.org,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mmc: sdhci-esdhc-imx: map unsupported driver type to Type B
Date: Tue,  6 Oct 2026 13:53:00 +0300
Message-ID: <20261006105301.996-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|LV3PR22MB4557:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 32a4acda-3f2e-46a8-8bb2-08df239800e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: f8yBEOnooassvYhp4MaX95te3PjY/MRZp8Ltu71/tOGaNbQoLmdHTgzDxdYjsHjyYaWK9EHte6RzkWCuJalG2wolJwiRVT1tlvnEaHwm6R+8aMjrhWCg+AZDRlWkIMC0LH+ozmNfiPDC/bf3RZ8v7odkXSu4qwPA4UvyPFINccDAsXjwc1sH9UBOYc4pvAckGsxJPiPXMx1HRuU2DNtOiFGOlP0w1KKHSRMP/3Kg3z8lZuP+cVPR3ifLJYzel2ek4TVIFzY5anfP9ZQMyIDQisi2sumpn52MbcX0ENgyVyaOFZAqJ5CRjcx7psLb114cWOyCslpwjTAfNf5iMFQmH1hAWQ3epsBVbjf3W5POzF4Ic2GGGncs3FOBP0Xo9rk0rc7kdlYNst3yX43IBlXC3R9ZZcn80VteV/xYXZNJpPeVUNaz2V31RS7U7WV0oDFmOjXgqRaFhpfp0aE4X1g9tZc0O7q64uqu2hzCdQ6ulETQ7++QyhRp9OuLh9zmg3BvehJBJBltR3nsHoSoq7vkZEwdHNcFA5AGYSGFnRH+pUV12wSfnygL2XiQssmq2WjLOmQwAKz3xgEOREYt6+ztAsYwvjKMGLy2yhCZTKti3EGCD4/unfLv43KotMsXpGBQDeiDzsnb9He8zvqUX+KKbVnj1/LR/2zwxbkb6CzxzgVNN2Nkkzo8jEzG/1SxG054TriyH0UWffbWRGkbzyJypw==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h1qvtcV/xl3I2qbAksRJj4HlgPfnnYrIbi7YO8bJa7B2prLB7TEFxbhlPOK8k58TRKn2gYQpxroFuepFnWRl94S3PsaKr+ktZUouj0mRGetwrtuvz8AxBdYNIVhzyuT1tPwFRnGFWjkZuUMvc3J0nhklGspzB+geVf6f3mffdhicZoG3ndEdCnEvuX697Cwnk1PgBmUOG0nuq9NR9pe+AR8uV+vcRAWOmen/mhTl3VWdeSXu6574yCUDfLRtVT7vNY7YHYMf29XT8Ey1Xw3ASQ0Ur5tRm/E+J/UvRV1gD6LLNh17ihrgmd06fj9PJJdxDWBYimsRfYmUV/rOt2co4MHlv/XdHjbdiIkclhH5r9t2xZKHRefDXpGqBo0RBIC9tGQbkYwhHcJ6rqQ+Cw/y2iMQW/cJ9wGaAebfiWgkPCElveVs2296/ffQJiyGqZiq
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:53:06.5259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a4acda-3f2e-46a8-8bb2-08df239800e6
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB4557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_035315_611648_1D78C546 
X-CRM114-Status: GOOD (  13.23  )
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
all the way to sdhci_set_ios().  For 40 Ohm driver strength [1], SDHCI
correctly warns:

  mmc2: invalid driver type, default to driver type B

Hook ->set_ios() to map any driver type value outside of the SD-defined
range to default Type B, so that SDHCI always receives a valid value.

Tested on i.MX8MP (usdhc3, eMMC in HS400) with
`fixed-emmc-driver-type = <4>`: the warning is gone and the HS_TIMING
register contains 0x43 as expected.

[1] 'fixed-emmc-driver-type', see JESD84-B51 Table 206 and
    Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml

Fixes: 5a52c5701a67 ("mmc: core: Fix host controller programming for fixed driver type")
Link: https://lore.kernel.org/all/20260926122908.866-1-ian.ray@gehealthcare.com/
Cc: stable@vger.kernel.org
Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
v1 -> v2: Move fix from mmc core to sdhci-esdhc-imx driver per
          review (see "Link:" above);
          always provide a valid host driver type.

 drivers/mmc/host/sdhci-esdhc-imx.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 6ab59d3e346f..33f63c6dc8ce 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1142,6 +1142,14 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
 	}
 }
 
+static void sdhci_esdhc_imx_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
+{
+	if (ios->drv_type > MMC_SET_DRIVER_TYPE_D)
+		ios->drv_type = MMC_SET_DRIVER_TYPE_B;
+
+	sdhci_set_ios(mmc, ios);
+}
+
 static void usdhc_init_card(struct mmc_host *mmc, struct mmc_card *card)
 {
 	struct sdhci_host *host = mmc_priv(mmc);
@@ -1949,6 +1957,11 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
 		 */
 		host->mmc_host_ops.init_card = usdhc_init_card;
 
+		/*
+		 * Validate host driver type.
+		 */
+		host->mmc_host_ops.set_ios = sdhci_esdhc_imx_set_ios;
+
 		host->max_timeout_count = 0xF;
 	}
 
-- 
2.47.3


