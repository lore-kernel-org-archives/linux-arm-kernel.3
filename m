Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC11CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 02:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7R+TwnqfNwcWaFnIlcP1I3F5g/RyYTVRWjrRoNPbQfk=; b=TS6RRm/4XMNCPrnVVU/W8bE4tQ
	ep4IiZb1AGa1G6QugXCvybxAWQGYXv1N+xETRQe55+kwmWHzuX8KZDJWe52AyP6LQrBLtPCDW/sBa
	9XRbEUWUplajjGGfOqRSDPQ3BEVPjQegCdIqGdIaJSs3LEqoE+Wo67frYWLvDgKAliUSq1WukrcKc
	QUlc7GeuW8dAdppvx2ARIRSSw7p8UHKjbjE73AW695Ci5GzNkObrPQ5KTeldMbvEUFr/CrlFf1+D7
	RU6TOFiCrlChKHjFPILhMrzCdcbdUMJ+8FPkPQnnibhafKalb01uDbyzsuYeIG0B6g/+sh2sY4SXI
	W/+alO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSmmY-00000006dX7-1Cn1;
	Fri, 29 May 2026 02:17:06 +0000
Received: from mail-eastusazon11012061.outbound.protection.outlook.com ([52.101.53.61] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSmmS-00000006dVc-49BT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 02:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXhVujV8KAH+3nUy2XXuAbmWthWJ4hgOHSBfUsclRjZsNqmRcpArxlmEFTqCX3w6zaZcz+cjjqU2lfE7ZlKh8sPlOJGn6IQtQQe97QW+OEWEhKOPgWOETlevZDCJclDoAvz2apLQ/Tk47OPrvLdyo44ssQYFAwJW9mPqYb7v58B/R7u//vvG7i+BQD0qwyvelWJHM5Bgf4o4cj3VCt1RkGMaO15f+BpRJjHGPQB6KS+Scu4fqRu6VAVj2EUF6tKDHfOKKRtwnBXoQKb+bZkh6hd5DsO4Z+83hIyju1/kixlWzhhcCprI9ruuST3XhTNmBECcgBmP2JbSP6t9Gq6beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R+TwnqfNwcWaFnIlcP1I3F5g/RyYTVRWjrRoNPbQfk=;
 b=a+lu1w+4vsvL/znwyINErO9kvib/0MREweY3Y/DWhWyrHcv+FVWABu3jzfJE53RAqcAiMRgq39V0m6ZLn2L3S+77YAG/kMezjNrsYs0Ff96UicVUk6XByrar57yEfqwFIocmxVQNdphUnHmfVekV3feoXA/T7xhxWoVwrTjPBhMIfQFCWGx6+o1fC/4XiuZVdIA4djA2+6KoAAUkDTSnyZHjG4Dc7YdrUeozX7SC3r+geIydiPglrImwWd8HR2Sew/assu7bJwq8M1u6Th8ahpt5LNPpyE9m1os+HCzYvV5IX7bTFdf0d7BsECkrVpZqgN9hAGjrxAWEUjrFEEQM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R+TwnqfNwcWaFnIlcP1I3F5g/RyYTVRWjrRoNPbQfk=;
 b=J/34ZbU/TQIXdFgvNgCLry1qaG6T2oMPrBU34PJB+GDdJk9EGTW54Z3Isf1C0U6LkznMGOb+E+gYbl6QGVVQo2nLX9gMD7g+B9ISvSVt4Ho6jdren7P97+Q7jY/OSM/gYaaIzNI5U/1fBW/Ur1P74D6DFsKy8p5YF1ROx5zQBgo=
Received: from DS7PR03CA0309.namprd03.prod.outlook.com (2603:10b6:8:2b::7) by
 DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.14; Fri, 29 May 2026 02:16:54 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::8d) by DS7PR03CA0309.outlook.office365.com
 (2603:10b6:8:2b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 02:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:53 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 28 May 2026 21:16:51 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
	<ben.levinsky@amd.com>
CC: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, "Magnus
 Damm" <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Tanmay Shah" <tanmay.shah@amd.com>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v3 1/5] remoteproc: add common wc-ioremap carveout callbacks
Date: Thu, 28 May 2026 19:16:33 -0700
Message-ID: <20260529021637.2077602-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f72477-1078-4460-849a-08debd2859c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: eEaiDSguLcO+DiiYsUPMvgYmnm27V8nDPI4Om2CGF2yDtgn5GKI9niW1QIwLeBeuq8RcrGXeLEf5NEH4r+GbyMs6VYcsPgGYdxA9myXxhRGn24MIS3MaJZloXeyvuChgMy/zL52Edjtgl1rt8th5xO6HrWvGi0drWl76LDyWQr4dwbgQjDrVM/jcoHiQmqilKNklKl5NGQEU4CBi6b3gtgXxawPEkIh86pbnG4TdMGYHFYX/uRcFk/bqmXONI1XDi6LlhyxfVhvRqo1kIBdqSiMYkXnmfuX7SRnS2/vUXsa4/kyLyJvlSWTGrXrRC5Vbo9O95Qvk2Olx9m+0eeu55zm66xzGd4w8NOO2FPAgCKzp1p3X5WanlRz3cuY5FC4fJmz7CmHTqGIanjELw2X/tIvYI2v77oFmwzucjJes1xqrsMLocNUdXOehz18FspKgDYDOA95peBxElG2KqT5qDJRVG+wKilCpgbhRqdaNZISvVlvJKtGOc6N6u+ordfKvGdB4r5bUr8cxFEB2Xk9HJdE7dBUFpFu7/CS6HqzCXYA2X/MdZYl46iZCor58pDZfkH9IcCnJE7nQnr/uZGXjl65SMTGiI9d80Al6pqWXLRFpXUoLnr0WJNesOsgFnDbBNTjC9sHDTwmnXVNCdCyOwyGN75vOx6SD1hT5/pA2P63+32RZeaeiETAhFkbBT8jHvdNlaSTKH77K2CU6bma2c+Yg3vUmh2nldBIRLeU7wRs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h1eL7KSekFgBIJY43bTD6Y8KDANxlwytNPtglng2g0VzpPzZMD2sr/0mm89DOlfO2NxHFu2iEjLaaDShV03iqaLnrzbI/w1nM7SyoYTNFRPZy5Hiy2r3El3fXCeKcstPG6YnJZYfekSQhKo1BHp8Bp8/EoyNSjue+72ZKKFi9vgoq6+OaWnTsfbNyW4QSx/6kCgRNrEx0Og7QWn59f8Imc+uVoKyxejAmIaNwMdsQ9pzpXQpB2OQqqGUJjCaR1UbO4yQA5rsXIejXPyC2VlWExm+h3MzlfrvLZBJOk0yob6HjLDTdTs0lvTkwWxkiq2fmuXi1mlE1uG5w0Vb+tBWu4LvHcSDJKNVVBaUV2SEHEjWU6MBdnd/v4TVmgMSUaBr4ujmwKxMLUle7CcWcWyz8QxT1S/iPD/2E2/r6Hg8ibMSszc3AQmphvNOAHZWIIsi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:53.5227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f72477-1078-4460-849a-08debd2859c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_191701_036618_4CE3201B 
X-CRM114-Status: GOOD (  13.43  )
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
 drivers/remoteproc/remoteproc_internal.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0a5e15744b1d..46080c1c030e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -14,6 +14,7 @@
 
 #include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
 
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


