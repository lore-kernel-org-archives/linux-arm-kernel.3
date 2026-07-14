Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D6FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMnrfBxGrTSpLdAKhg3oz5KStx3R4q+8S0MNBZ2CR84=; b=2ynXKQHnI1mwpx/qzXfkiuz5Fi
	AdSI1J+usM3xzqkJBKbH1UF7/5BYeR1uQSlIE67BrIlk/NNEnbf6tbQysZ5nwvGgM/Ohi7kKYk+Ko
	13XRhhQP8GWOT9GNwoWwwoWsx8yS/SkvHO8VHSjbfzBTejeSqg57YMpgjuKH6WVhUvrAU7MZ1gFAf
	r8YJ2yHend9e5G7AVyn9XopJw6WevqLL4cOettERdy85MAxSrNNTbbU6RbGb1OJ5CpZnu2V9sh+TK
	JBdwBc8YibjY10OfOhfiBSrvWxWXtHwdZCs1ruFmlVuiYnKl6/gXXZ1AVQKJfvH1W9JhaCJ5R0dW3
	kkbyzaVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdGB-0000000CBeg-2NrE;
	Tue, 14 Jul 2026 13:33:19 +0000
Received: from mail-japaneastazon11012052.outbound.protection.outlook.com ([52.101.126.52] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdG9-0000000CBdu-1AAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:33:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXR9pCMonwOvNuvb5A9c/QPcqn/MSaOwgg1xDyV3P2FVCh1SONb+TTCd0fqOaG2FOHR44HwVLIyUY0Fk7BgXIkeXcUiptFZZbBdWt2QbNTqo09WdCc/bW7ko0++fc/k8dpvDkN8w78BjnaiuLmKJ7OAElwxfauhmlMnxjb4FTckRxk7ezCl5uWwdNq+gSDtwHlZf0fM3QdFqRYjiqlMZVa4aPgcFxOH4mTbGmHsX/1nueKW062tx3DX/I1AX7sUUBMmfsP9q1+0JBQkMowDO27qYaBGc2AUt/XUNRNrBr68AyhxMrLWudLbcmNmejS8m/JXHGxaE16EoKQRU/+y7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMnrfBxGrTSpLdAKhg3oz5KStx3R4q+8S0MNBZ2CR84=;
 b=Cxse+sr3Deeb4AKPJjNtH/ali7cYIb5SXKsTye8G7WEaE9tWkNvKazDSZT9PFmrjyPPBOXx325iOn7sz942CrZ89UwlHmRL0v73joHhFQvC4ZOb8X2mrvPyyqI2a9g1z+kyKwEN9UA4CM7oVBFoXYw0IpehI9YGTK/po3SpNPf1Kl5oaIORurlWozUtM7arygFPpc20gr2NbMbb1sCNztXq6Ua5uZO5qyKWSeZNqrPaiBRrMm7Bh7fQ04ChbaYjqgfVzhZq6JjYTLb1hSfb5yymStfAN3nTpmlMRFzL/tsMgQWudMNW1LsK2dxLIpd1cVzI3V1vbXUWyjG1piqF09g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMnrfBxGrTSpLdAKhg3oz5KStx3R4q+8S0MNBZ2CR84=;
 b=d5L7eRsuM774bfDgAfhD/7U5MDcDWFuyxaWZ/J920LTCJtFHPcDZwqmS3BTKC8wltF1W409YXRh6uyKZNQAW6D2ibCerih2a1L7fKwmp2eqckTatqLen+dPCzuRQqwLqDdGsE8cGZBMB9jml08YH6c6mRR1425PDE4bxxawvUyBb4QvIiNHFp5Y6Ypgjaq+bA9hF30x2VQbsZJTtJ5514SB+OepllgysBJtOEkTMuIrFFM44uEWsijKLl505oqrlzVDkU9p+PXxLUcVYhmLhlY/jz86QuQcbISAHVRD7l4TkD9iNEPs+hmW5Vkm+7LD0a/p1GVRBBebTjMUxuaqrpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY0PR06MB5235.apcprd06.prod.outlook.com (2603:1096:400:204::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 13:33:00 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 13:33:00 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Pan Chuang <panchuang@vivo.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Kees Cook <kees@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
	iommu@lists.linux.dev (open list:IOMMU SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM IOMMU)
Subject: [PATCH] iommu: arm: Remove redundant dev_err()/dev_err_probe()
Date: Tue, 14 Jul 2026 21:32:43 +0800
Message-Id: <20260714133246.575556-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY0PR06MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: d3290236-1321-4ecf-55ed-08dee1ac6bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|23010399003|38350700014|921020|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: W+Gq5gL10bcREUiLaY9x9dJUlkd42frY2RSv7/pFxVnattzX3w1HqSbsb/4BL8B2wSc3t8VvmTlu3QcsKmShCn6BbTq1GdIw2p/xID0F7jYUhaP7IeR9FqdzL7axo0kThjox3MgFX7n+Wpt6v2HenSXjilC45cZWhA6+r5ifWNAE9F4K034fBBE2/SJ7WnxAsQXqSDRFphK3FGKpY11Xz2yIIZQmO4jOIN4qPFIVWMlkOSshPJ0c7tlFM1Hh2PAStg9cKQ2yV9sPOn10/YShsf3Xb44YSjzxkcgtkEtI5bRk5KD9adWV7Omnn7yiHAxk15Dt5w0Pn7pFj0s0KI3wNcedeod51/gglukvk3S3LR28WosCiKVOHMLf3dJCMQ8GkBRx71qIWNsBaEiCPkIX2aNIT5G2LMwCIfd6J1fIqdfnw8srZg6Ntkd9aZBgUVZJZAlp2uuRGLeb0vmBn82y9XovPZNkqmAp8EExjPe0c5SHk8e7RVBFJhinCjpcGqvZ8UVrjmNKK2K4PTxCd99As8Yyv1ARiDLzQ30WNN8SOcv8yMuo76C3rBfOnWc2tOD8bevi3EwEED3Jc5GsvOheorJLEp+yq1h+LkRg7nN0mLQBpF3xql1e+/1MitdBgLuvkKNT+tGIMmG8SU7I25yMW9W1MBkRCbZ3NUwweO2bZWSAdGbAkLLJy2TziGKTbi7/LR2EacjVBWeolZ44V0uYqOxE9UhrPF9Zns3MesApX54no/hrPkLbyiLi4Yh+sb69
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(23010399003)(38350700014)(921020)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jFdYSm6qw6U7nRu7jtJJEPhgTKuF9I155qjWKUUT5C4XaEJ3+3OyVJv5SJOw?=
 =?us-ascii?Q?Ph8T1FwgIf1fMmIOZlqWU13tp2jEfeUMDahHfM8kbPxwh/iU6Mrmgi9IrfGE?=
 =?us-ascii?Q?zlAmGk913WLo4OSxbjaY7Eak5quvnMLVqRJojPXds1sOu238Od9iQK0+6WTI?=
 =?us-ascii?Q?eRkwRXrVSHraIkbZowbcXxTI2qSUKah8ylgU6CQ9dQcm1fNUUZfiAjA3BDSx?=
 =?us-ascii?Q?czFBuetXzi8LXw7LMN9yGNL/bbxVatosMA8Kq52iRO9kwY8UJOpEv/9kqnQh?=
 =?us-ascii?Q?MO3jymxyuqaDx2M8F8HyI4ln4zE6WcLrceVjM8x6H8VsB8UsdU99O70QMSZB?=
 =?us-ascii?Q?JcD3v97Ob05GbFN6ShjUBRq1ZIps8gYyRPW6ZfI0Q4WLraDc/j+x0MdssdxX?=
 =?us-ascii?Q?HZEp4T/nYPzC9dU9jBF1/rVbdojqUKw2U/TQWXiVxMHKZ8Cp08xz75orles7?=
 =?us-ascii?Q?zf0BA7YxMC9OISKtLINFYv5gnCweggWiE4noUlUweVjxDCHRQ9giHpuqmkzA?=
 =?us-ascii?Q?0wTuNst67Wd2owxW21LPRZJ31xEQl2ZsxHwasLIHiIhSRedrdTla8NfNjyQq?=
 =?us-ascii?Q?sOCoWNGQr/8rqjRfTmw0ukSNCAIQQYOG2O+CWjrfTsb2wf9ZfFNRgRGUVtts?=
 =?us-ascii?Q?QYop+8+TYgYmlum9MoS2krCxZOMAhTAq761eBCHvNUKIy2gf10EvWBAX42zL?=
 =?us-ascii?Q?tRvvEDaY/b+s5wTkeuP1MsB0iOV5zdYs3DvKK3n9iGcavoRmnv/XcdkQD9u3?=
 =?us-ascii?Q?yRfocvwSlT91UpI3IuEgVlXeuduFimheFMr9V5Fl3dCjUfog9EPUtpZDXF+7?=
 =?us-ascii?Q?2L4/j8YrIpeYbwwTqMtVP9HeQwypFm3pr1N9YLcylYPXxQxa//d9TRnoZX+4?=
 =?us-ascii?Q?fPwBC61y6YAVgWuRUvONi+R1RjjqqXcgo3oA45VuursNSL4/1Ci8EdLbaSOX?=
 =?us-ascii?Q?dosv86wYZRxX8tQmZzTwLuYJEk4tFP/3JBl70bnzVQWMsq9AePvPCecC3/2w?=
 =?us-ascii?Q?e8CkXEHpZsMDQebRgwYTqWhU4fNbLKlsDGeBXoB0NkssJND4vXmpc6kn60HC?=
 =?us-ascii?Q?7XpgKb9HHu59o7lyTrhWzjfkNCRRgWjCVk4j/qwfPV216kgojbTLwJzbtNIY?=
 =?us-ascii?Q?uGD5bJBxoRT2/PMSxrPZysmRxgGv1pkJ82m0zRWUZ1zJZqf0RP050QNManvS?=
 =?us-ascii?Q?xprUAwA/iqXRCtLLo3ZE7sf9CD/Go9RPk3zC1MJzeVGsP2ts+mGOxJfdDymH?=
 =?us-ascii?Q?XvXFslijgp3BtKfsxOHzR53OGWr7LMoAHkwZUpkLbyNUoZtYXzBo2E0ztERd?=
 =?us-ascii?Q?IKoPFTqSaSqZxc+35Tqei4tvlhlPswpw879ZqOiBNv6RgEKXPTDXvgvMnwW0?=
 =?us-ascii?Q?RqpRkddiNW793LE4GHYvfBltrQEl4RjxAN57pTTIhtFxNxK2EI0ssOQ1PyvH?=
 =?us-ascii?Q?ipBubC0zZmoVf+AuuKxIp5JniOd9MoJuN239sITqxtq520NuuVhn/U5nbC98?=
 =?us-ascii?Q?FBPRzd3B1X7RtxgFEEaa9zD6UrXXLcgLElBbuBdEMZ+uKuSR4eMTnNwMOBX4?=
 =?us-ascii?Q?IJu7oka7BQtF9cUs3iBP432E2q7A5myu8HuUalo0tmS7Sl7ep5i642d1+3N6?=
 =?us-ascii?Q?BVGrc0wJqr4WT1Xs6aiJaRAfG/tFFfcQD6xEZNC9A3zExRvES6v20vx9KpYO?=
 =?us-ascii?Q?uw2nt6Ei/1WU0q1/04Gkh2/nUjU4VORXqcS6jG4eSeTBvTqwM4I9ygxsidBr?=
 =?us-ascii?Q?lJPBLywDfw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3290236-1321-4ecf-55ed-08dee1ac6bf4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:32:59.7595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8oxja4EAVBacF87Q3KKvrNkIWIDtiwCt5F8L+CeD5lxQIbSt0viYTyk5bWEkBSthc5zgAPKzyIyp4U+KgRkag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_063317_322403_986E3049 
X-CRM114-Status: GOOD (  10.24  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() and devm_request_threaded_irq()
automatically log detailed error messages on failure. Remove
the now-redundant driver-specific dev_err() and dev_err_probe() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c   | 9 ++-------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 4 +---
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..889a0966d36c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -865,11 +865,8 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
 				       "arm-smmu-context-fault", smmu_domain);
 
-	if (ret < 0) {
-		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
-			cfg->irptndx, irq);
+	if (ret < 0)
 		cfg->irptndx = ARM_SMMU_INVALID_IRPTNDX;
-	}
 
 	mutex_unlock(&smmu_domain->init_mutex);
 
@@ -2219,9 +2216,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
 				       "arm-smmu global fault", smmu);
 		if (err)
-			return dev_err_probe(dev, err,
-					"failed to request global IRQ %d (%u)\n",
-					i, irq);
+			return err;
 	}
 
 	platform_set_drvdata(pdev, smmu);
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a1e8cf29f594..2b57262b076f 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -712,10 +712,8 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 			       IRQF_SHARED,
 			       "qcom-iommu-fault",
 			       ctx);
-	if (ret) {
-		dev_err(dev, "failed to request IRQ %u\n", irq);
+	if (ret)
 		return ret;
-	}
 
 	ret = get_asid(dev->of_node);
 	if (ret < 0) {
-- 
2.34.1


