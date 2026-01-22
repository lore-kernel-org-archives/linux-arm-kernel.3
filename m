Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0160D3EE9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yBuxPGDCpEphM/KZt/cMvZHfJnkc1tQPoLWsiBEtpw=; b=2RlmDKaBPeWaXj3PRDrEG3OaDw
	srGIhk3WMNsRL844zmiUGWUQRJ9dAd0QPe3UODshCAV+PXPa4ysIm9M+oPxv2zZo4MYLhcga0PJNX
	MomiWNncdpV+AuvMpUVw14gg0fKntCGNNgA7LbAuGqrLs3oM49z/YIfo79j4t62F7xUtH5yfzuRXc
	iQw8tVVVMjyjnKtotlX7O916iH1DXHjPZJe699015fd7s/Pu/TYPRT7J9eodUvA97rh9DIKV0zRQF
	BYJbwgo1PRKGxoSNjrA6yAxxNGs1AF0BVtFcMNJlmc5GOt/eAXnvN34Fuus1RdN/xd7gYBvH+5gXS
	WUDfEN0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLo-00000007YZ9-123y;
	Thu, 22 Jan 2026 17:20:08 +0000
Received: from mail-eastusazon11011070.outbound.protection.outlook.com ([52.101.52.70] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLh-00000007YVj-0HPv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:20:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQ7yv3N6wfnJyLTfrChrKsfVhAP9qEFLXMVyVKAm+i0JpSlr0N7Cofjw3m90GPBxsfQWv6HACy6oQ/uCIBQOT4GKjJSw2JxFi93E7oYxHx71yDpTJHq/9qXc1dAh+rAwd1220r1U8y3P90gKmOf/rhuTj/xnSUWAvRXRJ1tHPhoukSJTX6KYOdamL0d1XcoeuhSr/OyOoqc8iN6xwNURleM684NlxObvyNdJNgnZPluLbyI3A6KwpC4zidvVPHlQy2AR5Wtqr2r+O2oxJE13SmRrIoLVHjfZM15G3QnGYg9y2zv+7u5cWemSNgpydw6J7p6LNoZA+UDjt0uGxCCRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yBuxPGDCpEphM/KZt/cMvZHfJnkc1tQPoLWsiBEtpw=;
 b=n6/4lGMnOuMZFFRo50r0dzi113yLRcvvkc0LxxYuIcFd6vtx3eWS7EezKUOinB9uLQ5zw4wrN28QI9u9WWdrcZ0bmwXPFbu3Oh/I8cTKsmYK59Ppr0p3527tDW3q7Cn5B2XX2Az2vv+sx/sZ/jMeM6lGKNamn3QLGCXxO0ZUMZ0MDq8ALY5kZJc9xj5oBuuUthsIkmqb0+m9rtASKpxINqI9CpPXUYpheLhluW0arkcV2KB2wo1pfUPIZ5lSwE0gCQ9m9qPxwRYoKVPL1VEZ/fbf2vUqwJsscxB0Pw1W/zW8HpKWPC3BK8ao/qrQuyLsVIBHj0ucqPPBinIt9tL9ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yBuxPGDCpEphM/KZt/cMvZHfJnkc1tQPoLWsiBEtpw=;
 b=gZRKmy+1xvJs6HesYsAvMtnq4RuPIs3korfDYe3uzgtTrVzMcUcnJuc+DfuyEbZJ+/WNUI9EwJGr3cJaCGequ4XRrHJk0UkbDlvUrOFN/L0/z3N0qy61lpgt4/UaPfOexRBRdtH+EDgSfEeKDzFVxw06Yq2CTK/ecnZmQZ72s/U=
Received: from BY1P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::12)
 by IA3PR10MB8164.namprd10.prod.outlook.com (2603:10b6:208:514::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 17:19:56 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::e9) by BY1P220CA0025.outlook.office365.com
 (2603:10b6:a03:5c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:19:55 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:19:50 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:19:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:19:50 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHJcoP912039;
	Thu, 22 Jan 2026 11:19:46 -0600
From: Aniket Limaye <a-limaye@ti.com>
Date: Thu, 22 Jan 2026 22:49:14 +0530
Subject: [PATCH v3 2/2] irqchip/ti-sci-intr: Allow parsing interrupt-types
 per-line
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260122-ul-driver-i2c-j722s-v3-2-4ec3478f3866@ti.com>
References: <20260122-ul-driver-i2c-j722s-v3-0-4ec3478f3866@ti.com>
In-Reply-To: <20260122-ul-driver-i2c-j722s-v3-0-4ec3478f3866@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|IA3PR10MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: df893655-3f3d-445e-f59a-08de59da7618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THpwYWMzSU9HK1RLT0NGOGt2NmQrUjdBTHEyVkJJeEl3Qmd6S0VOZUxWcjI1?=
 =?utf-8?B?M1pFbTB3S3lYVkk5bnhiSVBEZ0xyNklrNEdsYk9uYWlxZEdpMWpsaG9HR0x6?=
 =?utf-8?B?MHF1Ulc0bmZvcnJkUTZvdGVMQXBrSmViVkdyUU1sYjM1c2ZobC9EZnhGczdZ?=
 =?utf-8?B?R01KaGMwWDJtdXJzanAzUnpOZ1lHM1ZqNDNuby9UY2ExaVliNDQ3eURqTERn?=
 =?utf-8?B?MnNJbVFlbFBMY2Q0cS9HZkgzVzlsdGtoeVVnVTlQbWZBSnErSC9tQ1RJekVo?=
 =?utf-8?B?ZUg5WWxXL25XRS90VWNjRGNPY3ZaemJVb0dUWjAxRlVtTloxbmphMjZrWGdX?=
 =?utf-8?B?MklMR0xuOUVEdWEzUHFXTzgvV0hqN1ExQytlK1BYNXA4U01SWHBPN25OUnVq?=
 =?utf-8?B?dTV5bVpZN2tCK1RWUkgza1A4cVlwMVhSV05UeFlVS29JSWZUSUsvek5Gbngr?=
 =?utf-8?B?NVV3K2UwbExsN2VLZndZSnpmeXFFWXVRWXNvNjRHQlZOdDVNVEpKVmgvTHFE?=
 =?utf-8?B?WEZSNXNtVHVjaStqMnVlb0pjZGJxNHpWcW9nUEU2dTlKaEtwRkNQY1BxZllJ?=
 =?utf-8?B?UHlkUklZK09MTVZFUk12Y3ZkNWlhcUpxTkN1bmxMSEM1d0MxUlVxSnBxRmJN?=
 =?utf-8?B?ZTJhbXgyRzgvTFllVXRuSnlFdEFIYmRsVk1MVFVtM0NXY1pzenY2WFNIZ0Jh?=
 =?utf-8?B?SU94OE9oM2Z5a2RuK2JHZEZMK1FCcmFqcHEzREJrMTlXSTlUb2J4QWtXZzU0?=
 =?utf-8?B?V0oxZ2ZBVXVZdHlkQW9zYnBHSDFqUVBiSndYVFRORFM0WG9TMHhlb0tnY0lo?=
 =?utf-8?B?VFhsY29TVzdYNmpFUUZFTG9HbERIVk9rTmFsZzZNc25lbHBTV0RydWxnNkdS?=
 =?utf-8?B?eW5ZN3hoQkRJTllDSFRuVnlab2h4QWxlQnZhUG5rQjdXaDdhWmZYVW40Ymxh?=
 =?utf-8?B?ZTVOdVdZdFpEQUNuYnZ3ZzB3OHUwc3BSTjVWZ2VsbmY3bGJtNE1xT3FIbkhx?=
 =?utf-8?B?dUFvdTBmZnpCWUcveW9VU21xeUt0OGdmSUhCOHZzLzFFTE1WTkFYaGRUV0lV?=
 =?utf-8?B?eVBpdXR2cFlJWHBWS3BKYm93bHhvQk04bGswdEwwWkxrSFo5M1dwa1VJTkJC?=
 =?utf-8?B?QkVHWTJVWUI2d1hhaE9BK0Q0UFhRVUdNejdUdEJxSzVaZVNwRnNtL3g4d1pE?=
 =?utf-8?B?QVVPSjlrZnVWTDhNMjl4R29kZ2pCQUxmcm5RSjZ5NTZQWVZEYWZrUkUvMmRn?=
 =?utf-8?B?V0dTODVNWURjbzFzd1NqSkRyMHVDdDVrV3J6SDRuSTcyK3crdnJTeFZucWxh?=
 =?utf-8?B?aWFjYzdKUnFWZ0Fib1Zzb2crV2czbjMyMk1oZ2NxVm15ZmZ6bllUdXRTTkMr?=
 =?utf-8?B?OThhdjR1Tkg0T1BhdSsxbU92aDY0bFFNaUxGaUprQy9HM25XLzVzK0hUQmdq?=
 =?utf-8?B?RUZsMGFpb0FPL1FYMFJwbi9nb1VuYjdOUlB0M2orRTdmalFEdU9BMlBxSW5U?=
 =?utf-8?B?ZHErV2MyUWFsM0xoc3hDZzlmSWpjNHNYNm0zVTJjdDlvNVluUVZSMDNJRGl6?=
 =?utf-8?B?U0tSUlhBbko3bnZ2V3Q5TVhPOWtxTnNjanV6YXJwSVMyL2lLUFVzUlJrRE1v?=
 =?utf-8?B?L1B4QldLQkRxQkNNblhaM2U1dkZPRWxmT0hqRFNZYWdhZ0lpNHE5ZHovQ2NH?=
 =?utf-8?B?UzBrVklpeE80S0NMdDZ4eXpFc2d5aGc0YjdtYmtHLzdOQVUyZnNnYVNkclVM?=
 =?utf-8?B?MG5GUUpzNzF1bldjV0JndWdTaTE3ZU5odE1YUm5JeGJWNTNKcUxGM0NtdUxS?=
 =?utf-8?B?RC9BNDRQTmdpTWRxRktONElYNTJlTHR0anlkeElsbXRkU1NMMHZMQ2lFQ1Fx?=
 =?utf-8?B?K3N1eUR3SDNEZy9BK3M0R2NDY01lWUxOMS9iaVVNUm5uUnRuNVpkNFdqY2l0?=
 =?utf-8?B?bGtqNDh5cXplU2NVcFJMbnExbjNsVHpSRUZFbER0U2VEVWdSQkREZkhuc2t3?=
 =?utf-8?B?R2kxT3pkM1JVSTRTeU9jU2IxQ1ZrSDRTREVKRnovdklzaEFidytDQUJ5aWRs?=
 =?utf-8?B?RXZzVDkrTFZXVEorcExNbGJJemppZVFBZm8vV01OR1lDaHQ2Z2UzYlBzTUpq?=
 =?utf-8?B?NHZHNFJHQ2VoamJ3MzBPdjlpbkFHOHp3a05ldlR0M3ZiWVNYOHVNdG4zdW9i?=
 =?utf-8?B?WDBjQ05vcHBnVW9abGpjdTNBTlFaK3pZN0xRZzZ1N01VbFdYdURqQ1dtTkRz?=
 =?utf-8?Q?79LA35jkMwwYMxSBPtVHzFnVT8HyU//g0mEtgTNOog=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:19:55.0885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df893655-3f3d-445e-f59a-08de59da7618
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_092001_119234_F2AFB2DD 
X-CRM114-Status: GOOD (  20.59  )
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
source interrupt type unchanged at the output line, rather than
converting all interrupts to a fixed type.

When interrupt sources are not homogeneous with respect to trigger type,
the driver needs to read each source's interrupt type from DT and pass
it unchanged to its interrupt parent.

Add support to check for absence of "ti,intr-trigger-type" to indicate
passthrough mode. When this property is absent, parse interrupt type
per-line from the DT fwspec provided by the interrupt source. Else, use
the global setting for all interrupt lines.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v3:
- Avoid new redundant value IRQ_TYPE_DEFAULT for "ti,intr-trigger-type"
  when "#interrupt-cells"==2. Instead, make this property optional and
  check for its absence to use the per-line interrupt-type setting.
- Link to v2:
https://lore.kernel.org/r/20260120-ul-driver-i2c-j722s-v2-2-832097c6b64f@ti.com

Changes in v2:
- Use correct Patch Subject prefix
- Reword Commit msg to better describe the patch
- Fix function argument alignment as per coding style
- Fix variable declaration ordering as per coding style
- Link to v1:
https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-2-c28e8ba38a9e@ti.com
---
 drivers/irqchip/irq-ti-sci-intr.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 354613e74ad0..0c6065e66e6a 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -61,11 +61,22 @@ static int ti_sci_intr_irq_domain_translate(struct irq_domain *domain,
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
 
-	if (fwspec->param_count != 1)
-		return -EINVAL;
 
-	*hwirq = fwspec->param[0];
-	*type = intr->type;
+	if (intr->type) {
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
@@ -156,11 +168,23 @@ static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
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
+		if (!of_property_read_u32(parent_node,
+					  "ti,intr-trigger-type",
+					  &parent_trigger_type)) {
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
@@ -196,15 +220,15 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
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
 
@@ -250,8 +274,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 	ret = of_property_read_u32(dev_of_node(dev), "ti,intr-trigger-type",
 				   &intr->type);
 	if (ret) {
-		dev_err(dev, "missing ti,intr-trigger-type property\n");
-		return -EINVAL;
+		intr->type = IRQ_TYPE_NONE;
 	}
 
 	intr->sci = devm_ti_sci_get_by_phandle(dev, "ti,sci");

-- 
2.52.0


