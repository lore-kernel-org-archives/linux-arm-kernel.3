Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1C1CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsNqc4AecoOaUFL6Z91tZwjtZrzHyfnWRGcLNeO+X20=; b=NpbxyTMH5vW8yMM0bocjp4Mezz
	llcnFg7ICO1/QZRs5XjAqYnxSWanBIyoba4lFIP9XNFs+3B16zhSSYvAjwBYpBwPJJpjiExxOlIdT
	ukLSnqOc4n08bnqYusdQtDTkB+nDJRMaq6tL0oG4uH+Rtm5NnB3hHllzScfHXdS/2V69PwsqRsuRJ
	xz7IuGpQjE3QR+mIkDmHPkfy1FY4nWkr0GgFbcGYlUZyZzEd5bKO+2Fh7ZiQvbo+XXxQ6+i3WE51y
	m73vK1c2imMcC5ehjrFEgjiUa+JFPvk8TuGCsxamlf7mez/aGeMtiRTPPAcEkzdgqrZgKei7HN1RO
	hPa2RTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYow-000000062ZT-48f6;
	Thu, 14 May 2026 16:21:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYoq-000000062UW-2JGc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 16:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MsNqc4AecoOaUFL6Z91tZwjtZrzHyfnWRGcLNeO+X20=; b=A95tqlvRohHh2szspCXoy21XrR
	ZO2DeRqcxg77MP9G/338IjcUFqzSd1cdizb3HHXs9KNb0noYvcjVdAbm2ocMA7y7C5AdObf3hNUt4
	rlOrXZZi0aZlPVhQoyRRjxswffpyz2UHyAFLQqrEqnYbKLWVS6Iwmd6L730xby5PC3xLnvqYNNNPu
	K6UKU6Ut4oFtMMIpNMdzqXioBazfSYD6et+MHfDXBY+y1qGtS/OnMnR/KD7W5WYd6rENUTX3wihOi
	K27ovbyQA37Gx27R6iuet42OwlAHSM8Z8nMVPCg3m48w+g3AxJ1oVelowU5dbRYyRdZVTGF/uzomL
	U77fdaJA==;
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYom-00000003NTt-44gZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWjCdrEnFjkdlZzKMVimyYA/ZJK1M2mteHNwjfhhQXwEwANojWRbOTH/cak9w6X1RAHgZvdZ5mycwFmZxtpexL6bwkFM1av70IntCcDJxm98gDip5mOKWDWBoT3h68s7I4z590oV4EXNavWaHwNmxofl06C6mJL2oNHRVppd1RRBb0fniWiQvNRTOAHF0F5SrjNCz9zNwAtqiaK4J+frw26h/4UnaIMROubpw9Y/FsWvJTnqhJ1hszjxI2t4Kl3kIVtM5Dv/mBGU73vmJNAknR/F657Yk8OCm7NgLcf4hQeunO3pSo6OihQRRdgpvy0lvZIUGgEkXQpKjZGE3xppCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsNqc4AecoOaUFL6Z91tZwjtZrzHyfnWRGcLNeO+X20=;
 b=wd3SAkzVqfE4UfulqcYeI3FH2Epwk65QXVfvF+jSoNOtHOfRF/Bor3Zc2mUMLqfDNilk9OwvBRaDeUPWMngyqH1n7xEV0WM5BzWEXSNOHOGwod/ge9vzEi38lgAAtnTjr6dZSj27C2tX4ZOZTaqD2wmeRK0/NW4VZBs4gWPx240bAmdOT52bFphD/bXb33fAMvvGnOm3xHnHVKqtGLlpcq9I0t1Qyjs/HZdPrl2rYonk8KEPmPY6op4iulowTBfvfAEIZlQdvCZJCfw240n7nTFsCVg+MTysGBDKYGhNUOp03sHEQsRO0705PyA2pfWMN7TUns75blpFSeNjod1V0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsNqc4AecoOaUFL6Z91tZwjtZrzHyfnWRGcLNeO+X20=;
 b=lA6nWlnR4TNPHM8+aITj36Wp7+QNVccU+xty9h6EUyZQybFDwPm8cPz+XajeMmy6KmNIUoUCGlh7Y1iSJhGQiCw7zd53lPUB4qlwPtXVw5qUO4sfeB54GOkaqYbBsq7r3/g/WzS8rsJBwGcLE/LUBIINLa4KhbesqY7S9tXEg3g=
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:21:38 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::4f) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Thu,
 14 May 2026 16:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:37 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:35 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<linux-remoteproc@vger.kernel.org>
CC: <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
	<patrice.chotard@foss.st.com>, <mcoquelin.stm32@gmail.com>,
	<alexandre.torgue@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
	<daniel.baluta@nxp.com>, <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v2 5/5] remoteproc: switch drivers to optional resource-table helper
Date: Thu, 14 May 2026 09:21:29 -0700
Message-ID: <20260514162129.1504162-6-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cdd243-27bb-4d84-ccca-08deb1d4df8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: j1op7q2qwbiYvwTwBmilgbnNixGxbftuRGniOrPGehpBhuvmKFSaIU3YzUO5BGlZKWztUheJwk9ak3vV7NM+u9/q3rgDRT0vXBQYKbM1KuR6/nem8FG5lhJq0JKBHG837U2OqVLd8tq26BTXKU5O00m4kvClISNcQAyQ3LJp0/k64MhEX4Xa8S0ZOY1t8WnMMADDxV7E6PT7S1Dj96xqNq2uIkC9HSOTviF3lFzJtK9CLjWBcGRek5vHkGDALsOpDN+i2l80SEnfKMsARHMh4tYdEqsk8RghwnhAPsj3w1JIZKRxDuudaMENMiH+vUS318QQ5hTu7w71uv294bCirUp9UR/cDIxdo+zrjAl3Dfr5cLl2EJ0sBocZ2e6jgBFQ31Q/Lm9iD3tFoz1SGa49O0ftq3hEY2pYiQOyvIVnUvNr0Iqk8QaCYUn07isNV9LJ8Bh+pZArGbE72rA5G+d9Abi3ydiegJuK4IW4NHRhdkM15zwa+8qf3XNCGvmQv8nXYhM/SE/1C0z/EbVfAcujlcpgoFQfk/7r1I3/FVUcwT1SznmxnYgk1676QOy1SkxYp7CWrZAK0lUTLJnasiiBkoYcqwU8FAB5KcCDGoEIZcsxl1glWbziwhmsid3CPmfxMRbjlkNkQg8gyRWcTrKU+wazKsQG1x9d0k8xbWqZXLYNttPdseXTMPZItQPs2FjdXeyghNeuAGwbrce83ml/+ra6EInIqEsG+oz3sI+/6fQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NL74qGUjVlQ0HkZhDN4TUTRqHAl7NDO4BXPBfvFbTFV4FgPiXjp2saUlK3ME8PHQKAR43OstJsfx4Y97rGijVzfV118EotN8ctHeH9XC8wYLqqNd7mcEgQ3oVETxh/5xSW0zef8OYIMcWZl6VcGREQmv+QNb3qmJg7cSxJDM27SAoY7iZdU37zvH9MwOp5Uo3+H/CKIyS9TPPY4rNGeUHmzkxDUpL/ernLXgPMDwGuMXlONxLXeFnVsencJaqk6VJak9uphmXIVsrj5LNcmHvYYeQEdc/XYaccfLL49UxM0O0HGawPBlVoTTLGsa6QxRjtRa5NT0E/iZt+g68ZEQGJASmvRmcSNAaKpv9y2R3iMdR/DCVrcyDwHM2T2FS1BZWoBOd7/ObBBtxFgCDv/mQpGXEXVtYfBCV3IAJ4a9EjhSRrwEzwtB0k+LmlGCC7OS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:37.4373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cdd243-27bb-4d84-ccca-08deb1d4df8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_172149_522285_4DD9142F 
X-CRM114-Status: GOOD (  17.87  )
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

Use the shared optional resource-table helper in the remoteproc
drivers that already treat a missing resource table as non-fatal:
xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
imx_dsp_rproc.

Keep thin local parse_fw() wrappers in each driver so the helper only
centralizes the return-value handling. That lets each platform retain
control over whether the missing-table case is logged and at what
severity, while other parsing failures continue to propagate to the
caller.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/imx_dsp_rproc.c      | 24 ++++++++++-----
 drivers/remoteproc/imx_rproc.c          | 25 ++++++++-------
 drivers/remoteproc/rcar_rproc.c         | 25 ++++++++-------
 drivers/remoteproc/stm32_rproc.c        | 23 +++++++++-----
 drivers/remoteproc/xlnx_r5_remoteproc.c | 41 +++++++++----------------
 5 files changed, 73 insertions(+), 65 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 2d9f14fbef1d..2ff74f7938f6 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
 	return ret;
 }
 
-static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
 static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -990,6 +982,22 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_warn(&rproc->dev,
+			 "no resource table found for this firmware\n");
+
+	return 0;
+}
+
 static const struct rproc_ops imx_dsp_rproc_ops = {
 	.prepare	= imx_dsp_rproc_prepare,
 	.unprepare	= imx_dsp_rproc_unprepare,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6249815b54d8..58c63f97ebf7 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
-	return 0;
-}
-
 static void imx_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -768,6 +757,20 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 	return rproc_elf_find_loaded_rsc_table(rproc, fw);
 }
 
+static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index e3121fadd292..b7a39014b6bb 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 	}
 }
 
-static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
-	return 0;
-}
-
 static int rcar_rproc_start(struct rproc *rproc)
 {
 	struct rcar_rproc *priv = rproc->priv;
@@ -99,6 +88,20 @@ static int rcar_rproc_stop(struct rproc *rproc)
 	return err;
 }
 
+static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
 static struct rproc_ops rcar_rproc_ops = {
 	.prepare	= rcar_rproc_prepare,
 	.start		= rcar_rproc_start,
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7ac8265b60ac..a4d42b755c74 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 	}
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -623,6 +615,21 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 	return (__force struct resource_table *)ddata->rsc_va;
 }
 
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_warn(&rproc->dev,
+			 "no resource table found for this firmware\n");
+
+	return 0;
+}
+
 static const struct rproc_ops st_rproc_ops = {
 	.prepare	= stm32_rproc_prepare,
 	.start		= stm32_rproc_start,
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index e5d1903c9636..9b9f07d152e6 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * zynqmp_r5_parse_fw()
- * @rproc: single R5 core's corresponding rproc instance
- * @fw: ptr to firmware to be loaded onto r5 core
- *
- * get resource table if available
- *
- * return 0 on success, otherwise non-zero value on failure
- */
-static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret == -EINVAL) {
-		/*
-		 * resource table only required for IPC.
-		 * if not present, this is not necessarily an error;
-		 * for example, loading r5 hello world application
-		 * so simply inform user and keep going.
-		 */
-		dev_info(&rproc->dev, "no resource table found.\n");
-		ret = 0;
-	}
-	return ret;
-}
-
 /**
  * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
  * adds carveouts for TCM bank and reserved memory regions
@@ -843,6 +816,20 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_info(&rproc->dev, "no resource table found.\n");
+
+	return 0;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
-- 
2.34.1


