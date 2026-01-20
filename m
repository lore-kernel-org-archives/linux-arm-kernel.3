Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B514AD2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/wDrTMrloWcpAtmoHHYEJjHQ198tLVwM5z/i3Sx7S4=; b=H95IVmG6ogmZe0VRI17NEuT1s7
	iO4/7Pf8ngBB1GwB+gfG2YDAweMHT5xSWYqlvnfhJa3UxJdEMHTcn5SDoeqKmLIAgG6kl3XLzTHha
	DHD3oHJNHQSfnn6iFgKKWxRuvislCrjbzHRcMJLQ709TyoEQPoCRnHWJmVKxLNgqKqA2Ozx7iYCfR
	YRTtpLCVyAETZYihAyRbLHSCqBSW5DJq30VDP0oWFeldL1ylguRQNELvPQVdtuEW7Z2Fs4UcVbQZJ
	qkWom7wbotlyljpQpBBJCwoCt1aDJL7s7vc63TE8353qEQ3pPl+fhjiJqg9rc+f+1kxy2Vk73EZkP
	JfQ32GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9E1-00000003e1I-2PdC;
	Tue, 20 Jan 2026 10:44:41 +0000
Received: from mail-westcentralusazon11013038.outbound.protection.outlook.com ([40.93.201.38] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9Dy-00000003e0F-43no
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYCKgp4WGgR2H0DbIv/ET5fPThWHVQhz7ZbHJYmzHTD7BgzCVyoYYq+GH2LZrNmM3YpowrxigKay5rNjZav2e5m3A+Kfl/eu6+oaqBodRh3DHaIImkL7TyBZhGEZPR1f+ejNqDp1iSiH8qIULVt1VPrT7ufay8EonhYhIsZeaZBGl0o6ow3b62o/pDp7z11a2eJQgpvvSkvPpohMqzT7l1TF11WJ+ba6Hq+kMH7Qb/aEgkT5IsrOXUhVN9AM64mhlsoLtUZ5fA1Mr3+oGfMa22yHvVQlcx5/FJlqk1uMMRWM5t0M0QCdvCwoGdd2+b2TNlH4Ve4HH3a/befsukdOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/wDrTMrloWcpAtmoHHYEJjHQ198tLVwM5z/i3Sx7S4=;
 b=rwaCIItX8WCqBHbCpnyYcu94b7w64gQK2YcmyeJDe+LYd0I2MTWo6HY17J7W2xn9Icc9i1Hsm0x0iA3R0LBUNzaVHODaygHFPQu6bsHL1KaUc4edSeJ34jJCqZQJRaES3iaydiTKFUWLZWEtzL2nZxNw7jAH18JwKuDRvSaC4VPh1rxE9t9F78h+jEz7pXPG4Zq1mLpgW2nH26yUOkNwlmw8FeR/oBbIX/0N7tRewB2LHNQIHGdGKK/1wZAla7NJSAcQAHwFarg3A3ZfIciJOBTNta4vIDwF9tJNhC570rW+BHl68TM8VeabIcep7YK2J+fN5Wh+3DRbIlsfeLwe8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/wDrTMrloWcpAtmoHHYEJjHQ198tLVwM5z/i3Sx7S4=;
 b=tLWyiH71P0snkhAMEjDQD8xM1A6qa+6SxtinwHsgTgSsg4D3PayPOqVvRQNRuNRf/9HWF85MVOH2mH/h4Dr0BP2C0eUmzKusBkVb3OlYy9JSFd+rT/X7fdAsapUBVgXedabX6ZgqJrghG0pcdV9IkVfdF6DewQf0ARacp+ag7lo=
Received: from BN9PR03CA0705.namprd03.prod.outlook.com (2603:10b6:408:ef::20)
 by SJ0PR10MB5719.namprd10.prod.outlook.com (2603:10b6:a03:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:44:35 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:408:ef:cafe::2f) by BN9PR03CA0705.outlook.office365.com
 (2603:10b6:408:ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 10:44:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 10:44:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 04:44:31 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 04:44:31 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 04:44:31 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KAiIEh939676;
	Tue, 20 Jan 2026 04:44:27 -0600
From: Aniket Limaye <a-limaye@ti.com>
Date: Tue, 20 Jan 2026 16:13:47 +0530
Subject: [PATCH v2 2/2] irqchip/ti-sci-intr: Allow parsing interrupt-types
 per-line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260120-ul-driver-i2c-j722s-v2-2-832097c6b64f@ti.com>
References: <20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com>
In-Reply-To: <20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Aniket Limaye
	<a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|SJ0PR10MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 50021586-ec26-46ba-b6a9-08de5810e654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V01sYkp0clVETi9YVHhqOFA4eXJsRzZvMjh5OU9FeGRPV1hJNzJvZ04vc2Z0?=
 =?utf-8?B?OGY2ZzluUHVsdm5Pa00yZE5rNEVOTmREWnRRSlFkbkxSd0NCMUtQbWFJT3VL?=
 =?utf-8?B?anBMYi9zZHRyRjU3RkdJaHlOYlg4VWZ1RXd0cFlpTTFsRTdDUElHMHNraG92?=
 =?utf-8?B?Tk91dzY4ZGpIcHVleXVkWEIySjR1OVFjdXY2NWhGRnZKWTc5UjFkQzVHL2cz?=
 =?utf-8?B?aHNUWlZRZGN6Qi9hUlAyMS9pclRmdlVjMFdRbFUxSG9XcVM3cEs0UTRhenZR?=
 =?utf-8?B?dXc1Sjg4NDhSeTJ4WEY0a2U1TnBCOWhEMEV5eXJJamtUdXFubW9mNmwwUXpj?=
 =?utf-8?B?Vmcwb1hxeDdFZGRteG92Q3YwVDRDaGhMMHlXY0NIQkV4NmpWQWhTa2FUU0d3?=
 =?utf-8?B?RE9IVy8vLzQ1RElheWRnRTNpT092Q0VSNCsyU2VuenQ2ekdZODdDMTFoRDVG?=
 =?utf-8?B?TU5qNzN2Q1I0ajltOUJTamdiSmpScDV3UU4vZmoxNC9nSHFCSmcwZGpsWTgx?=
 =?utf-8?B?QzBxdzJZdHhjZm14QU1CUXdNcFpYeHZ4bGNheTM0Skd0cDljLzVXcmZVL2ZS?=
 =?utf-8?B?bDgrQjBQMzZFa1czZzJrNk93ZUNmREQvK1lTVHNncjlJSnBJRzA0VER5Nmt1?=
 =?utf-8?B?VFpBU1lzdTJNQ0NBZnRrVzVDUnMwbXZJRUNzZVdNMndiblY4VTBtSkV1QW50?=
 =?utf-8?B?aGxOK2FlRTVock5GR3JLZ050cm1BVWU1aTlxYkkycy8ySm9FRHJjQUpaRjIw?=
 =?utf-8?B?ZDhsaEFuUXBiWCtPbHpjVWd0T2hiMGc1VU9aaU5FVDYxcVhjNW1MMXRwOE5L?=
 =?utf-8?B?N1NCWWVRdXg5Qkh2b2pKMGVKTUxhakNqUGhnWE5DRmVpR3pKUjhFczMzSjhw?=
 =?utf-8?B?b29EcjdCZWNoUVVOTEtoVk4yTXV1dENTcElHbUhzSzlCNXcyMzhmNW80M3Yw?=
 =?utf-8?B?Y3lxbFdPN0hKWnQ2bUF2cFEraGhTZ3VTaS91Vnl3eklaY2JvNW1aUUwzTFZi?=
 =?utf-8?B?cW8vZWNFZWZLOUQ5V0RFd0Y4L2Q5RUNKeE15c2N2UzYwTmxIdzVCSTczY2pR?=
 =?utf-8?B?cXdMTUVJNWs0Z3VLYkJraGRHd2ZSbUxUQk9aWWdnWEJuZThtQ0pnWTlXbG51?=
 =?utf-8?B?OERMWnQ4eHdOWSt0NG9uVTB1Z3NNeTg0M1RZVjJIeUhPWVhTZ2F3MWxPRzFo?=
 =?utf-8?B?Z0tIUnlCYzM5dHlHN3ZrTy95U3JsemdrbEVEa01xMnBUdVJlUjIwd1NmUnlH?=
 =?utf-8?B?ZENjN1ZVT0p6bVlLaFEreWttRDB3UmpoZkhnbVBhamtUSVZkbk1EeUZlM2F4?=
 =?utf-8?B?K1NWdmJnQ1hISlBRbnBmUlpQczh4bG5RQm9jb3NRbXpLSWN6NU85OGRzVUFE?=
 =?utf-8?B?TFVmSjNmcXNRVGFsN1VNcW1IMVRqVFMvbjZQaTV6RDR1YXlzR1ZRdThYb254?=
 =?utf-8?B?S0NTNEdGRVh2NFdtemVpZE1UNUZGM29wNktBMHI0dUhmUGg3MEtuNE0xalBi?=
 =?utf-8?B?NWZLQ21hdCtBMysycE04TjRVOS9hL1lSa0ZsaHVEeGgzM09EUDh6UDlaQmdx?=
 =?utf-8?B?RVFVcFBMTmQ3R2NBWGJ4MU45NElkWkgrZE1jNFVnbGNLWTlCT3FncTZOY01W?=
 =?utf-8?B?SWtxT2VnYUNzK2d5WW9jekFNczJkMWRDQ3VCbk5XMmpoMzJXVzhwc25iZ0l4?=
 =?utf-8?B?R3ZkT1U2UCtTN3huQWpsczFXRTM3NjMrZVI4WnBzUGFKS1JEaG9hdXpmeWFJ?=
 =?utf-8?B?eTUxNkpHOW0wcHNWNGE3TU1VYUxXTUkxTkpjc0diSlNtUklVR3JnZ204YitV?=
 =?utf-8?B?aVBIRjdLdFp6QUhwd3BCSjBQV3k0enRNWXU1M3lzcVlSUEYvNG1vZkMySkJl?=
 =?utf-8?B?TlBGU21qRXhHVG5TcnMvL25UTDB2SW9YMENnUzNBN2dlbmp2a3lzWHhoZmNj?=
 =?utf-8?B?VGdBQnh3SlhhQllGK2lUV2FsVndmMjNNRmsydlNKMSt3Rk5XeXpoc0VMNTNK?=
 =?utf-8?B?ZHBCTlRsWTlhZ0lQRmF4Zy9tNzN0MXc5MGh5M3d3WDV5aFdLaE5Za3NxRjA0?=
 =?utf-8?B?WEtOZ2JmRW13ZWdOUGVJUk94LytsT0dITGZEYVFkS3k1V2pVR0s4RnkrM1RN?=
 =?utf-8?B?a1QwWERMVUhZK3Uvc0J4azVpT3Z3b0RGUGcxb3RJR0xnOEtsL1pFZnJFcGxW?=
 =?utf-8?B?TThtVWlvQ1ZYSk5OSytmcURjS0pxNzVuQ3JLMlp5TURXblNRVjlJRlNwcDBj?=
 =?utf-8?B?d25yc0NNdmZOQ2dLUlUwVTVLZnZRPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:44:33.8984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50021586-ec26-46ba-b6a9-08de5810e654
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5719
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_024439_017399_1A11BE03 
X-CRM114-Status: GOOD (  18.99  )
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

Some INTR router instances act as simple passthroughs that preserve the
source interrupt type unchanged at the output line, rather than converting
all interrupts to a fixed type.

When interrupt sources are not homogeneous with respect to trigger type,
the driver needs to read each source's interrupt type from DT and pass it
unchanged to its interrupt parent.

Add support for "ti,intr-trigger-type" = 15 (IRQ_TYPE_DEFAULT) to
indicate passthrough mode. When set to 15, parse interrupt type per-line
from the DT fwspec provided by the interrupt source. Else, use the
global setting for all interrupt lines.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>

---
Changes in v2:
- Use correct Patch Subject prefix
- Reword Commit msg to better describe the patch
- Fix function argument alignment as per coding style
- Fix variable declaration ordering as per coding style
- Link to v1: https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-2-c28e8ba38a9e@ti.com
---
 drivers/irqchip/irq-ti-sci-intr.c | 49 ++++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 354613e74ad0..e0b06796c86e 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -61,11 +61,22 @@ static int ti_sci_intr_irq_domain_translate(struct irq_domain *domain,
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
 
-	if (fwspec->param_count != 1)
-		return -EINVAL;
 
-	*hwirq = fwspec->param[0];
-	*type = intr->type;
+	if (intr->type != IRQ_TYPE_DEFAULT) {
+		/* Global interrupt-type */
+		if (fwspec->param_count != 1)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[0];
+		*type = intr->type;
+	} else {
+		/* Per-Line interrupt-type */
+		if (fwspec->param_count != 2)
+			return -EINVAL;
+
+		*hwirq = fwspec->param[0];
+		*type = fwspec->param[1];
+	}
 
 	return 0;
 }
@@ -128,11 +139,12 @@ static void ti_sci_intr_irq_domain_free(struct irq_domain *domain,
  * @domain:	Pointer to the interrupt router IRQ domain
  * @virq:	Corresponding Linux virtual IRQ number
  * @hwirq:	Corresponding hwirq for the IRQ within this IRQ domain
+ * @hwirq_type:	Corresponding hwirq trigger type for the IRQ within this IRQ domain
  *
  * Returns intr output irq if all went well else appropriate error pointer.
  */
 static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
-					unsigned int virq, u32 hwirq)
+					unsigned int virq, u32 hwirq, u32 hwirq_type)
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
 	struct device_node *parent_node;
@@ -156,11 +168,26 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
 		fwspec.param_count = 3;
 		fwspec.param[0] = 0;	/* SPI */
 		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
-		fwspec.param[2] = intr->type;
+		fwspec.param[2] = hwirq_type;
 	} else {
 		/* Parent is Interrupt Router */
-		fwspec.param_count = 1;
-		fwspec.param[0] = p_hwirq;
+		u32 parent_trigger_type;
+
+		err = of_property_read_u32(parent_node, "ti,intr-trigger-type",
+					   &parent_trigger_type);
+		if (err)
+			goto err_irqs;
+
+		if (parent_trigger_type != IRQ_TYPE_DEFAULT) {
+			/* Parent has global trigger type */
+			fwspec.param_count = 1;
+			fwspec.param[0] = p_hwirq;
+		} else {
+			/* Parent supports per-line trigger types */
+			fwspec.param_count = 2;
+			fwspec.param[0] = p_hwirq;
+			fwspec.param[1] = hwirq_type;
+		}
 	}
 
 	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
@@ -196,15 +223,15 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
 					void *data)
 {
 	struct irq_fwspec *fwspec = data;
+	unsigned int hwirq_type;
 	unsigned long hwirq;
-	unsigned int flags;
 	int err, out_irq;
 
-	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &flags);
+	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &hwirq_type);
 	if (err)
 		return err;
 
-	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq);
+	out_irq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq, hwirq_type);
 	if (out_irq < 0)
 		return out_irq;
 

-- 
2.52.0


