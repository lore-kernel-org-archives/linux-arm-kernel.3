Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D120D3B7E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 22:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/gXv2TGUP1+OTf9LSdSxi93VgRiZLptH+WeThyxnoA=; b=PuWSyEYUJUU+ELK0c+Pwoc60Lk
	g4CS5Od8rCY8+YLBPsUFHbueo6+ECoDjYvuQdBJLNyfOUzb2fQ3hHG4ydDt7q1UgOMi8wB6MtYOuD
	JdUsdEysQtblw/2VmRSQJU7HhVnf5fM05chKyzqfFh++4PFL59bELYlNN9Ca3o2XgMTaMtHdoqdyl
	lmVOUriZ/N51sp/R2pBR85G/v1NpjDTTNMLE7ZthGj1sKuVk+O8r0vQJUK8m56x3oL1FcAZflTJks
	YKsyHAbDTKXRXdKffHe5HCrWYiXJmEndJdAEsEEmE1YJNTCB52Hcb69Vgv1VbTcuk1fwIF2ySOrl2
	lpWZm3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjV3-0000000DZx3-0PE1;
	Mon, 08 Dec 2025 22:14:33 +0000
Received: from mail-southcentralusazon11012028.outbound.protection.outlook.com ([40.93.195.28] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSjUz-0000000DZuy-41DH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 22:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dP5k+iFgkvum9/dXtCUxDEMTpPfwxXckjv8kliBnDLJMJxhQxn3TlwiYAGoZP1VgeO3tGrLI0jgllDTiSLZKaj6v3+r9aABAloEH5Q4CQ2rYordDvd+zCIPfF1OEnq+dmCET4byHsFLHMVeT1nYrJ4FdfLFBnMIdUW9k9K0Wc0MFaXuGCb/eFbaPV993NB+wt8fuzxhIUB/I/tH9UPVIzR07zgQl/MHzjGb8cbPvWR5ejGGzMSw59pWR9dHdpIqMjpQSvV4lAGzy/I2wMZj/SsFiRHkpQPl4TQQpo1q4rKxCsM4F53uuU5lojHob9ZEXx/EacgIIVImKKRlHJ84a4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/gXv2TGUP1+OTf9LSdSxi93VgRiZLptH+WeThyxnoA=;
 b=Jh6IVfK66gmra/8Ue1eex8lXqSBHamFaeeNX4XJVDqiHB1/zdKyXHaptLGK3+y4Of/EVYOszr7oYvmu6EO1zTkXSLX+j2xfYEXVypKRDPGDy1a3e+6rMDPyhAAo/qVrxnglkH1j5X29UEG+tkCbfNc1s9Hq/KybqlYKdDyBH84LtpqMb962PpzxdxB7HPxMeCRbXJKdS+ZMtbjkNWF7N7ePOMb1PFV37vJ+kFc89hcthGuIfQROdWp3udMg6qqtFxmNZJCRZEF9MxL30kb738uwGP3lOPePDk7W/v5SwbPGRpxHwz1MyxwJ674MGEu7uyAlK1+Qc5qI6agPXsd7wDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/gXv2TGUP1+OTf9LSdSxi93VgRiZLptH+WeThyxnoA=;
 b=eNQUvwY++lcrflOhPjxXtLBVBt1Jr9/GEWg4FAQS6TMKB1GVKy0XWd7OaB4M5yjSuWBjKt32JwfTvR1vQjtRVUgOxdF5XvrfCxngYlo4tpOrLwLPuDRmAUOYtzTDZHNo9DTXozry8aMDZKt8pUpYN3kQs9pdFEwHzCdNdY7xZmw2xWwUlhxrNTf6eG130tEhpyR3rUxbFmkvOABVDkiPkkwKg5Ppznu2UzdLVoRdEuLPp3KyvivdwjmmxS8WoYHnbhKk4MgszbdwiNgKwRanIZChc0AJ892bAz1COeZ0uS79WMKXMEX9l5zRBab9NKb9m9H8DtVB00RJv3G83xPCNA==
Received: from BY5PR04CA0027.namprd04.prod.outlook.com (2603:10b6:a03:1d0::37)
 by CH1PR12MB9624.namprd12.prod.outlook.com (2603:10b6:610:2b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 22:14:21 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::46) by BY5PR04CA0027.outlook.office365.com
 (2603:10b6:a03:1d0::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 22:14:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 22:14:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 14:14:09 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 8 Dec 2025 14:14:08 -0800
Received: from build-vvidwans-noble-20250617.internal (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 8 Dec 2025 14:14:08 -0800
From: Vedashree Vidwans <vvidwans@nvidia.com>
To: <salman.nabi@arm.com>, <sudeep.holla@arm.com>, <andre.przywara@arm.com>,
	<lpieralisi@kernel.org>, <mark.rutland@arm.com>
Subject: [RFC PATCH 3/5] firmware: smccc: add timeout, touch wdt
Date: Mon, 8 Dec 2025 22:13:13 +0000
Message-ID: <20251208221319.1524888-4-vvidwans@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208221319.1524888-1-vvidwans@nvidia.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|CH1PR12MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ffd333-6450-4bf6-6e9f-08de36a72338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2AuNIwGQHmsCf2h5WdeYZKAkI1Ge6yqXvCXrcvb6Ho+aivNepdTma4wPs0Je?=
 =?us-ascii?Q?eFqzu31thHnqlpu6zLJP0aRKVnFaZnPysBoPuenqgvVTa5W4UssvircMkdpD?=
 =?us-ascii?Q?bmQFP9km/S6Zb131dfxhB+Htr1n/QJZvpfX+nQWTV4M4zXGixZsWr2Zlh/5S?=
 =?us-ascii?Q?F0LqYTVRGQuGIevv/zNPsIjKKYkUWvRhJvEPjvv2/VncxAoW30g7Q75jX1BR?=
 =?us-ascii?Q?PtKa6p4bQ/I06HqJKgiQushDHRat4/aCH5nquf4OZ66uoDY8H0uDQHwKQ+Cz?=
 =?us-ascii?Q?s3EK0XpEgiRtfEBzfrcjY7TSJQgQTOP/jOg+sxwXfvHyj1t9te4J53w+xE/w?=
 =?us-ascii?Q?xgf64z2Fxo1aPIegFsNQEHrdejXJGl/ocSXcfH4NyWiKNpspRqUwa5nLhbPb?=
 =?us-ascii?Q?OU4xzHXaj0PTtnZ0nYM0xfN/CpKB/2gfrew6bl0bPyYUiLb+Qn8wCUf5hJ5P?=
 =?us-ascii?Q?M/U0xPEhKDiJumrqSmtKlyUUFHQjl+h+FEo8VCIed5KKZ63ys0Ppc8sd9bg8?=
 =?us-ascii?Q?A/fMGiLj4e5UjZemAjQxNp/1RFf5bsbxfeJfmMT4JuU3SKGWTU9DrPYfg+4a?=
 =?us-ascii?Q?XDv14D+60T6uuuSPLzySE3m8JTpsNocuMuIheIWfyA3q/JiNFAnDmA0/vrWR?=
 =?us-ascii?Q?CesZr7Y2rq0egtif3KS/46HcMYTi853zqYp9SAYLLf2jTeh+pgIWntMiq5xw?=
 =?us-ascii?Q?XBGy0p/kby5GUa1OvZITskX3Itc9NRW1YaFkbaOJt8WmpNOU2crv1B3GvaqP?=
 =?us-ascii?Q?NfCd6C+EMfR3ZHEqcJHH9ngJMdy1j8s9WEkwSh7I3VspPWTgbSwjv721Xpcp?=
 =?us-ascii?Q?znAWFe9kf1uY/ZrjG/X2BlDY5zb9fTkkat+dHe4MhXdDXJq1hYox/8kkDD5/?=
 =?us-ascii?Q?pyKetAg+jSAPr5uvjnT0z/AvMpqkzXuAEahfEV9QillXsCEdHFK7trxtI8Ho?=
 =?us-ascii?Q?g7QVjS/2JpAjaDeUkE+cre93WyFQj7xh5E0dO34icsT4LxvhJoqh2YDuc2nK?=
 =?us-ascii?Q?hhNqmzm2AXTYt4gwNXuc9E3YYOxX9S7NMRG76fDpi+N+U7x6ObGENav1mAhr?=
 =?us-ascii?Q?XZJXhyWWca4dMM4z+lIZDCazpsA2mBBKg7e6uu1PefAdMMyD4ug9lqekMvRb?=
 =?us-ascii?Q?UKhjY7efL+BXx27/mxva1I2dO3kgGGOBVyMAofQ7nJ69ZCsntnBAb3t5QUrm?=
 =?us-ascii?Q?x2vScoxSRgythm1jNlxep41vCRRPA+q7Fv6AN3a3LgKPQKSTrOLxJX09GJ90?=
 =?us-ascii?Q?fS1AdyK2gb6uiKntd0teMkYySobkqX8W93Ka/VW/fUVtkfgez+34/m7KXufQ?=
 =?us-ascii?Q?XUwsk68VHKeO4DHtO3vAuqV2H/OPDkoT597f7M5fO4vrrZtctM/D19TEC60U?=
 =?us-ascii?Q?pkGkPWcLmOlTqD0pqKRg1vPlNWTBEAZwkUC2DMpRdUDrfkGYpgU2HM8WPM2K?=
 =?us-ascii?Q?BD14Eo6l4t/gKDvXy7lSJsnsB6g42fXBPEpEszjdGjDXemox/GXpUzCjdLLu?=
 =?us-ascii?Q?PxGrrNO/p5ruhLhSeIA0XOSzIRCc0lzcZ6GUt3szJkSDXjg+jHTha9F8K94l?=
 =?us-ascii?Q?oUX3y6CtjbjLL4eH/zg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 22:14:21.0678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ffd333-6450-4bf6-6e9f-08de36a72338
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_141430_022799_A0BAD956 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: linux-kernel@vger.kernel.org, vwadekar@nvidia.com, sdonthineni@nvidia.com, vsethi@nvidia.com, linux-coco@lists.linux.dev, ardb@kernel.org, linux-arm-kernel@lists.infradead.org, chao.gao@intel.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Enhance PRIME/ACTIVATION functions to touch watchdog and implement
timeout mechanism. This update ensures that any potential hangs are
detected promptly and that the LFA process is allocated sufficient
execution time before the watchdog timer expires. These changes improve
overall system reliability by reducing the risk of undetected process
stalls and unexpected watchdog resets.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
---
 drivers/firmware/smccc/lfa_fw.c | 74 +++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index df8b65324413..0e420cefa260 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -16,6 +16,9 @@
 #include <linux/uuid.h>
 #include <linux/array_size.h>
 #include <linux/list.h>
+#include <linux/nmi.h>
+#include <linux/ktime.h>
+#include <linux/delay.h>
 
 #define LFA_ERROR_STRING(name) \
 	[name] = #name
@@ -34,6 +37,18 @@
 #define LFA_1_0_FN_ACTIVATE		LFA_1_0_FN(5)
 #define LFA_1_0_FN_CANCEL		LFA_1_0_FN(6)
 
+/* CALL_AGAIN flags (returned by SMC) */
+#define LFA_PRIME_CALL_AGAIN		BIT(0)
+#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
+
+/* Prime loop limits, TODO: tune after testing */
+#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
+#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */
+
+/* Activation loop limits, TODO: tune after testing */
+#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
+#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
+
 /* LFA return values */
 #define LFA_SUCCESS			0
 #define LFA_NOT_SUPPORTED		1
@@ -159,6 +174,8 @@ static int call_lfa_activate(void *data)
 	struct image_props *attrs = data;
 	struct arm_smccc_1_2_regs args = { 0 };
 	struct arm_smccc_1_2_regs res = { 0 };
+	ktime_t end = ktime_add_us(ktime_get(), LFA_ACTIVATE_BUDGET_US);
+	int ret;
 
 	args.a0 = LFA_1_0_FN_ACTIVATE;
 	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
@@ -172,9 +189,34 @@ static int call_lfa_activate(void *data)
 	 */
 	args.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
 
-	do {
+	for (;;) {
+		/* Touch watchdog, ACTIVATE shouldn't take longer than watchdog_thresh */
+		touch_nmi_watchdog();
 		arm_smccc_1_2_invoke(&args, &res);
-	} while (res.a0 == 0 && res.a1 == 1);
+
+		if ((long)res.a0 < 0) {
+			pr_err("ACTIVATE for image %s failed: %s",
+				attrs->image_name, lfa_error_strings[-res.a0]);
+			return res.a0;
+		}
+
+		/* SMC returned with success */
+		if (!(res.a1 & LFA_ACTIVATE_CALL_AGAIN))
+			break; /* ACTIVATE successful */
+
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			udelay(LFA_ACTIVATE_POLL_DELAY_US);
+			continue;
+		}
+
+		pr_err("ACTIVATE timed out for image %s", attrs->image_name);
+		ret = lfa_cancel(attrs);
+		if (ret == 0)
+			return -ETIMEDOUT;
+		else
+			return ret;
+	}
 
 	return res.a0;
 }
@@ -183,6 +225,7 @@ static int activate_fw_image(struct image_props *attrs)
 {
 	struct arm_smccc_1_2_regs args = { 0 };
 	struct arm_smccc_1_2_regs res = { 0 };
+	ktime_t end = ktime_add_us(ktime_get(), LFA_PRIME_BUDGET_US);
 	int ret;
 
 	if (attrs->may_reset_cpu) {
@@ -198,15 +241,32 @@ static int activate_fw_image(struct image_props *attrs)
 	 */
 	args.a0 = LFA_1_0_FN_PRIME;
 	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
-	do {
+	for (;;) {
+		/* Touch watchdog, PRIME shouldn't take longer than watchdog_thresh */
+		touch_nmi_watchdog();
 		arm_smccc_1_2_invoke(&args, &res);
-		if (res.a0 != LFA_SUCCESS) {
-			pr_err("LFA_PRIME failed: %s\n",
-				lfa_error_strings[-res.a0]);
 
+		if ((long)res.a0 < 0) {
+			pr_err("LFA_PRIME for image %s failed: %s\n",
+				attrs->image_name, lfa_error_strings[-res.a0]);
 			return res.a0;
 		}
-	} while (res.a1 == 1);
+		if (!(res.a1 & LFA_PRIME_CALL_AGAIN))
+			break; /* PRIME successful */
+
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			udelay(LFA_PRIME_POLL_DELAY_US);
+			continue;
+		}
+
+		pr_err("PRIME timed out for image %s", attrs->image_name);
+		ret = lfa_cancel(attrs);
+		if (ret == 0)
+			return -ETIMEDOUT;
+		else
+			return ret;
+	}
 
 	if (attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous)
 		ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
-- 
2.43.0


