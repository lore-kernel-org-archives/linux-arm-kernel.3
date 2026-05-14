Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162B4CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=; b=NX17rFa/kq+WtRPMgu9JpSQJQM
	P/RD0QCG4dYlFHkDJ1SzKmDmwfQemxaDHiLK2naiahc/ZLxu0kZr392a55Ati+VA3AJKUpM9T5TJb
	ocSBBu63sbjnMWs1Ge2CrAZu7h3zkvgYEpxyIws+ieowerongy4rVOjAy8FWjXcjUn6XCypJ7hASD
	fDMw6uvI0MqSgYqPOZBupe6V2ThusEYiTaEFBobjJwS9BJNxLHic+yq4ym8w9eF9ljtOuwVPXrOks
	Oqmf3UUZYKcYiB5kCoIhxltrIaKJB8FoyghILA1kH5a4tPiZaGTumgHCy+Uh2AWcAzVvPd63nr8YA
	vPQDwnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYog-000000062NU-40g9;
	Thu, 14 May 2026 16:21:42 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYoe-000000062My-1MEm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:21:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcQcQUMm/FDGhhxJuooEcRZrGXjudt9qIBom/qbCu5KRIXAafYNauqwk4Esr6cyyFqftPy97KiIkxcpmXkMso4+GIpJLqJXDh85RUAaVlLNXvL9S85U0Tr4mMS75vUzWDdkfQoAel1AiUwIiyVWye6a6QzjokPrqcbuNQbSdhIwabxUNp3sbbblJObTF4xQ/dHU3DBGO9DxPNPNz31dSRR7SyXTb+TbB2cErqMKqJrSeeCbDJXTm64smq16NxcoJHz1yOxuI/+GBFq50hEZ/KnwcT5Ks6HRc2rdyCBZ5ep4iwua6Gb4xWEu9rcgjd3vtGX5DV3FRhb6e1EzZcpu5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=;
 b=X7o3pUFW78rgTQOuVju5sREn73245o0ECqVQF4xitDN8h1A72l4E4v7WM9woPokS5aVLb76ABE9dUrk8FEnk1eJxwwqwt7nfHlJosW3jlrnmkuj7NYYtN1ZuEgnovlLkaH8NUkX9KT2D6MYg3az4yexmWsQaKbWBMzJ5d0RHN+JLxSyCxuqLRmShV8O/pOL/oEoQGcdiZxh0qiiN3ZnZi/IgbCt6+uWq6K7kSBySPT06k4ayLORx4AyTlLHp5z6780Nh0IWPNzGm4CsVnPrGCPK74C3psPzFTwVHotog00MyZesFKMJJ8k/tJsS7JDXo502S9P6xbMT3i8OQWbpvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=;
 b=gjN60ilolQLl0eUlIYm3TTsWeKo9N1iiKyGILXU6lxATs156FaHl+YTl4xL83sE1l1xVIO+0Nxk/YpmDDcQf1tEKs4po46cjkJ7XXWOY0qihYytPcIGCP0K1wopc+EgBb5+mwrYnMPhrDYqJ2C1vnN1cmFh9varvH/i5eZ2hSnI=
Received: from BN9P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::28)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:21:33 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::11) by BN9P223CA0023.outlook.office365.com
 (2603:10b6:408:10b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 16:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 11:21:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 11:21:31 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 14 May 2026 11:21:30 -0500
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
Subject: [PATCH v2 1/5] remoteproc: add common wc-ioremap carveout callbacks
Date: Thu, 14 May 2026 09:21:25 -0700
Message-ID: <20260514162129.1504162-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DM6PR12MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0c7210-ca67-46be-4485-08deb1d4dcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: 5StWfwwZ300GB5CUWeeU2PHNpIxBRCZglgtjnESscZtUojviK5X9D2N/dN6tq4lJSf/z3dnn3pIcaRhciCaKOceAmwI3HJh7GV6xHdILYNf4FYFx07YU9nehOrlqceqmhFWr+PA09Me0uwsxmZUFTlInkbLUgMxP3EMcpP0K4CpHEccSB07WOk23vpdIuuTNMLNpC2enpqehkXvUkM41bcH++UymeefA+RG6Hqer7QvcLSYTGUq+TINUx8AkQktNGEQcJj5fZGm6Yk62roPqiHbtiXHT9gTMKTGXxuBiWDqWkkkGtYXpk5RhSxuVJT31tEmprfW9sBdNty1gtmStkwphBGE6f5MJMMSIt9AtvazFPr8K1h7CiN1ws+J3dpiC1G4lNHJgjsfTuY9tty7pa3Y4w6tlIGApBrGU5MwrY4byBeefUWKQt1VevF3mbvclkudhX8q9U3NUk5+m6YE3QFhOKHZDHKRUHAw8gIFEQyhbVAJo8gEUx/3gbUByuYtLQ+7LqP0PMDxxkFXr9+2X0RZk23lsq02exTlGPV7D51mJOUuSI2b4fJDLH7403ec/vStNnotLidVsTqiEOJG4RsDTgnRMaIEcJZjsL//3jhNSQPZqOvsci79EJSqUlmzy/+kkBuFhT6Qu6iKQZJW2f1gGlAyxAfzhXtj/LFQf49JCEpiBlwXiXOIrsbtzhuUQXv3Y9R/qmEqpBMxlYSua03kfwlC+mn17u6t4jDFOT5g=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jsf6j40qEBgZdBvDTbeLT5fWqbHcLEOOWOd4oDksEedUxwm5xiQBjWWljdFExcl2eEvrB+q50RQbC68GjzVf1qoXO5Hu3FawAQ+5Wyc8MOIViMd8VHGtiMEmjn4AZQGUILB/7iBJONjp4uZ6Elk+Qpd1NcXO7jMSp4E25X5/ENnzsw3BxEX8abY85Z8h6mQkUDpdIJnLLpe7UpMPE+zLFEiFR09549wG3BI0SNT/tI65dQoO8cqZ7JY1IHqKG+7m1Ug8qUUbRYjB7JURodTeG3pm60Lyj6Skn31JOZMnR9eo/YGFEJwENoDluAtLHwz/q6jVz94Wk094qYSXb/MKlF6aHBgxOXUGt9Nk4L1VRgSA4yksSD7YI8/8izMXZ1paxmvBg7TO2M0OhnWW5zj6m3+klORV5JBDotLzff3RYor9SXcPVniGvknTDrp6ahFn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:32.8776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0c7210-ca67-46be-4485-08deb1d4dcd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_092140_364901_3656A5CD 
X-CRM114-Status: GOOD (  14.24  )
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

Several remoteproc drivers open-code the same ioremap_wc() and
iounmap() callbacks for carveout mappings. Add subsystem-private
helpers in remoteproc_internal.h so those drivers can share the same
implementation.

Keep this change behavior-neutral. The helper now emits a common error
message on ioremap_wc() failure, but leaves mem->is_iomem handling to a
follow-on patch so that the behavioral change can be justified
separately.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 28 +++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0a5e15744b1d..f5b34aabed5b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -12,8 +12,9 @@
 #ifndef REMOTEPROC_INTERNAL_H
 #define REMOTEPROC_INTERNAL_H
 
-#include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/irqreturn.h>
 
 struct rproc;
 
@@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
 void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
+static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
+					     struct rproc_mem_entry *mem)
+{
+	void __iomem *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va) {
+		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	mem->va = (__force void *)va;
+
+	return 0;
+}
+
+static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
+					  struct rproc_mem_entry *mem)
+{
+	iounmap((__force __iomem void *)mem->va);
+
+	return 0;
+}
+
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
 	if (rproc->ops->prepare)
-- 
2.34.1


