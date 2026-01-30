Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B74D49C92
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 11:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK1RKibOrAlSnktHFkKhVaoTWG0e46NBA7RaDk5ckns=; b=hAccIyq6v8rW3hKd0MCE/zP1qm
	V7CTte+cFq8W4ClbJ62P/bmI3Wjebhtt65ilwQgpJSKPgf4lXWhJ2fVX3stU2r6U6rQe4auudG4Mw
	8iqGhxMAAhFoxmcjFjoWPwWg/Dw3OaokK12KVsTfdvFx7MW8ucFn8lAr7fuiPxwsIIEdgw8v9/+iD
	CsCI3BeWVbhkX8DUMKpGk8ENdhM6LYMGgMVA2WokbEFzezj9SwtFEwYZUFVZ7HcqgrD5MuKQY18kx
	DPwT9PDrcGrXTW6HUAqHGM1sBDb37wZKvIAqdLiHDQYm/5ekKXrKyYwVtZMrP62nf9eEqbTwiRxsL
	iayfiXrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmIC-00000001Nws-3WW0;
	Fri, 30 Jan 2026 11:04:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmI3-00000001Np8-10bu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 30 Jan 2026 11:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FK1RKibOrAlSnktHFkKhVaoTWG0e46NBA7RaDk5ckns=; b=acvdQ1T/bFyR86/PjbgulJ79yc
	fCXTlO/nvbKUjoGazRA0QSU//h3MwEj8P+ZFwcS5MQ43kDYMvHlE+v7zdmnI0Kk0SrniU4/Bz0Jf8
	8rEBcb4w21kkDrn4IJaNLsHeLqqzRU/tbnU102IP6Z7YMNew0O42qD9JOLpnes728GZvN6a67qSpl
	MKsoNZfBHDq+cYkDNvB7NBAih7l/myd/ZpMq0SmV0tA9nClkT0tcg9G3BsIyzpcAmelnINSjfUKh/
	RUKLxNOuoJQWFVNV5KHg+snsDRJ4sHnyvFhk+hPoejt8Sk861v/SH/i7O0tcbrXD9AWWF3+MLDxGY
	c/RKlKVg==;
Received: from mail-southcentralusazon11013065.outbound.protection.outlook.com ([40.93.196.65] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlmHx-0000000Bfbb-0A6Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 11:03:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZ6OZXLbvi2oTdXrUU6FxuARbUi9MeMMYsMqf82NAZhWWn7TAVAoMTq6L0T8G01vONiAty6o6PkzpWa7bexWsLDFt/q2tG+ncVC9L/ejqS3sDCKiD7+zX9/Qe1ZRM+CBLciuUM8AvgHZ7ERgua0YEId8OIRBoMBOd2YDUKJx9OB7zY/yaoRweA+gmJftLpGHSpVg1RGviTBVmSUSVl2bH/TaQZNfLb/QKMjbTgCTZG3FyXiNlPnNw3spdfcMLWJKCrx8dOqgMowc0M3bgWAnydGOiLFK7FkbdenMRcApj5nDLErqBKAaDDOZj5Hs6jPMS7PhpjBDYUbqmd3jxISXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FK1RKibOrAlSnktHFkKhVaoTWG0e46NBA7RaDk5ckns=;
 b=xKvMk54oAsbh076XfAyjbw9NF4TQSrmPyYsFMEc6Ak8c2v7vlRTEVN56LUkvjsOZEStwho1DwnG+3wTRN9MAl/s2Q+PJ+rI+e9RhA/XicF8P6U8i2TEU9nzTthG2fAGVo8CTJveNQQ+WYVzk+0IJQxhma4TIK1m4rneUI0hYqtBIRs2y5wZKSMTT7zdIWyh8oFREyVr7QlI/d3tQRYQFcfUsUUwcVo35kNbyhL6Nv8e4u0SqkKvifujF4uRZSBkoQtdcnRsRctHhy5qBjk8yqpBX6Pg8S4di8jo126FDmWaKCdcr5IPv0SFBRgqCmrWwocfm0Ma8WPRkXTBMpmSWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FK1RKibOrAlSnktHFkKhVaoTWG0e46NBA7RaDk5ckns=;
 b=OywLyHMBb6/lDtmZhKa7HvqNrMchuJopp3fSpPb5S7v7G+mJGfnuXLvPjq86c7vlGpEgWPDG0svZpyMv50xiWBXg2ff0B6meqZVlteufK9lqAZAeHh0tHOCat0BnPT733rkABIHpi4CfY6DMaKXNbvRezHXVmodwLfQ0lPVihik=
Received: from BYAPR11CA0097.namprd11.prod.outlook.com (2603:10b6:a03:f4::38)
 by PH7PR10MB6202.namprd10.prod.outlook.com (2603:10b6:510:1f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 11:03:36 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:a03:f4:cafe::23) by BYAPR11CA0097.outlook.office365.com
 (2603:10b6:a03:f4::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.10 via Frontend Transport; Fri,
 30 Jan 2026 11:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 11:03:34 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:03:18 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 05:03:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 05:03:18 -0600
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UB2HBq1204392;
	Fri, 30 Jan 2026 05:03:14 -0600
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v4 13/19] dt-bindings: dma: ti: Add K3 PKTDMA V2
Date: Fri, 30 Jan 2026 16:31:53 +0530
Message-ID: <20260130110159.359501-14-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260130110159.359501-1-s-adivi@ti.com>
References: <20260130110159.359501-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|PH7PR10MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f60bad-f12d-4947-48ae-08de5fef365a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TLmTct0GeAW8WhwX52c1uE7E/s//c39dT5dl++O01bJAvdvibZ0xjF3oI5E4?=
 =?us-ascii?Q?0BqLQchHFh23olP+dgG/cY+T5IAKiaMLaZYFWLbZ8TqWihdMaDMG2/zYfnPw?=
 =?us-ascii?Q?Gy8eY9hpvFuDnwdDSTQZ369RD7Bij0iBT/yT137Cl1XpV7Wa5N2tWOEedDpt?=
 =?us-ascii?Q?KyGIxIAHfCW4/0VFn0pvzFi4d+Yjd9rZDxkIYLakYWvAvQ2HPkOjJrLb2S4e?=
 =?us-ascii?Q?YRO0AUtLCDz0PItZTiU90DjAy35njUafsgKoz6vGFPYC16TQYReVegpEmvHr?=
 =?us-ascii?Q?1sQaYAcDEf3iA2zxT9qDvAXvA8mARJhZ+5pcnhW9Aj6T1ijdcOpTw/NtPv1J?=
 =?us-ascii?Q?3MDw/qTB697KWYbIYrxmt3OGV7tDDDUihRFgWFtqZhp1TPIWJWFnS66+KriD?=
 =?us-ascii?Q?g25B0BbuP0srTtqY+tSiOGGudol5GKVNNUBEtShsdXVQhXjWjI/fxMsazb6c?=
 =?us-ascii?Q?shaXsofAwJ19q5U1olPbrQwEe5MbcwruZqO1KcLqnBO3pY9KIKmmOnNDZW6r?=
 =?us-ascii?Q?85cbqsISAuSSKeMhQLq4KotldnIvjoq9t8LXhWsLNIVOXaZK4+ogbhCSa+2z?=
 =?us-ascii?Q?ynLOJYrhe290CQ5Geoq53xr8S4i+fzW5knFC9Cmqz/QFkBr+V3F7JqHCaBD4?=
 =?us-ascii?Q?blyrJ/Di0aab92uCcJdr6xIii5DsXLebWdOaQUacIn0dHLxDhk5BHAioORlw?=
 =?us-ascii?Q?h7ER8DsA1FE0hdyBPnxLRYqsfeDABd1Hgs1jTe9ytPK4yY1EYSJMA/vIkxxF?=
 =?us-ascii?Q?Xx4h6o9+xTiXPfGRuiBhPL1KaPlBAu7r+1Vvn7lc/3tctgrqbN7+Ym/reKcD?=
 =?us-ascii?Q?S7f4pYU7MC7ROA9z2yurcl/VHrQe+misiHkBSrOPGPkXnTqrHdVH+fn8GTd8?=
 =?us-ascii?Q?ik6mquBZM/YQO9bXU1XDC+jwItt48rib3fk89OrglM/T4eE3eHjBJ5FHYltG?=
 =?us-ascii?Q?p4AtHarm2AhANAbbpn8xtFKTN99ZkMHm+wbC0PwIkRgkKTrjzHuzWXaGImCo?=
 =?us-ascii?Q?xSuURQ2jcegSNA+8jDg36IOAqDs7TEXQ3OhibiwFhg7ThkOF9iSvM9Igi/Ow?=
 =?us-ascii?Q?amc6u4sPn6cgnL1yz+a6jDmrU5Ng2hd6S/PHakpXRwP2ByOpJQ6BxQoWxXIF?=
 =?us-ascii?Q?nha4yabSaEhhZ9N+3aGK+XSIPZDzkiw6DXiYg8liGpDfopWzpDCy5WdaFafk?=
 =?us-ascii?Q?UIw9HKTIVPdpXV4Vd9yy+0NcMsIvgbE5U5g7kwwZpZau7hIWoNzkSPLpA4Ow?=
 =?us-ascii?Q?cfZY3m79yHRvqdSTJwrgzQM1lE0/TH/AduY5a9IM16SP5el9ZOvs05GSgv0N?=
 =?us-ascii?Q?k2Yhcc9JubVVXPb/eGy3z0XiRG2lFaOcandTqz600R3MkGkVHhhu9LvDXswB?=
 =?us-ascii?Q?98Pa4uAkJ4X+XY0zlnQGKaXDrZo2+MtGxH6f0Lh+q3/dJ231hXbLtC26gqSC?=
 =?us-ascii?Q?P6fi4QI5ixItyJJpUyVmvaJpSgqJXN5DZUK2hWZeTyA1BAPeuM1kZOlJLD9Z?=
 =?us-ascii?Q?OAS/TozFSs0gtm60pHOHjZgzk0bLIRiU/isojb92MvcoHnagzjB9ZYHc0FQD?=
 =?us-ascii?Q?7gftRYPzu8QHyQBx7pXeGRw/E040S9pEmO2VW948Zoq1hMtBqJAwUgezQa9Q?=
 =?us-ascii?Q?T9XlPUmqoTciEm3zbAmMYxI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4d85vTGLh8K11DUByE+LjNWncUDYaeuj167y/TMfTrnu+M4IJQOiMCeVmPmPcs9Y3FmflakrKnlafQZY8sePCQmxrxaciw7nyqXfHJjKsHqchpk19ZCQn2OPnMRlVXVFLvJ7cNHH5ZuyAzjfNSVx7Aoz7r08YICsi+LdQsxwG8JAGbi1K8mnyxZwwGpKJ/9UL4Vvq4O0F6DePdMNEKwcZpuheFWR3VR4OinHpxN9BtxJTxLhnTwSxPHrmDtxjd7kCkw7qrknHe+kmITr+rlzDqeKPBJmCJkoQokbL7bEWPVVZ7Lzv9iwAzyl6YrPygdSibjvxLN9/1uhKVpKEm3ob9PUZ2rhvxx8dMjYSzB4Mn2kWnstXRpMhftz4wdOFjec87IbWNYWPEyFpjAMBLj38tfNuXbB021dtiBg763N3KK/5n0mxmNKyDsaF5RKRr+b
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 11:03:34.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f60bad-f12d-4947-48ae-08de5fef365a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_110345_303406_730EA295 
X-CRM114-Status: GOOD (  14.68  )
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

New binding document for
Texas Instruments K3 Packet DMA (PKTDMA) V2.

PKTDMA V2 is introduced as part of AM62L.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../bindings/dma/ti/ti,k3-pktdma-v2.yaml      | 90 +++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml

diff --git a/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml b/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
new file mode 100644
index 0000000000000..e8afa6f6738b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/ti/ti,k3-pktdma-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments K3 DMSS PKTDMA V2
+
+maintainers:
+  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
+
+description: |
+  The PKTDMA V2 is intended to perform similar functions as the packet mode
+  channels of K3 UDMA-P. PKTDMA V2 only includes Split channels to service
+  PSI-L based peripherals.
+
+  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
+  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
+  legacy peripheral.
+
+allOf:
+  - $ref: /schemas/dma/dma-controller.yaml#
+
+properties:
+  compatible:
+    const: ti,am62l-dmss-pktdma
+
+  reg:
+    items:
+      - description: Packet DMA Control /Status
+      - description: Channel Realtime
+      - description: Ring Realtime
+
+  reg-names:
+    items:
+      - const: gcfg
+      - const: chanrt
+      - const: ringrt
+
+  "#dma-cells":
+    const: 2
+    description: |
+      cell 1: Channel identification for the peripheral
+        PSI-L thread ID of the remote (to BCDMA) end.
+        Valid ranges for thread ID depends on the data movement direction:
+        for source thread IDs (rx): 0 - 0x7fff
+        for destination thread IDs (tx): 0x8000 - 0xffff
+
+        Please refer to the device documentation for the PSI-L thread map and
+        also the PSI-L peripheral chapter for the correct thread ID.
+
+      cell 2: ASEL value for the channel
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#dma-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    main {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        main_pktdma: dma-controller@485c0000 {
+            compatible = "ti,am62l-dmss-pktdma";
+            reg = <0x00 0x485c0000 0x00 0x4000>,
+                  <0x00 0x48900000 0x00 0x80000>,
+                  <0x00 0x47200000 0x00 0x100000>;
+            reg-names = "gcfg", "chanrt", "ringrt";
+            #dma-cells = <2>;
+        };
+
+        serial@2800000 {
+            compatible = "ti,am64-uart", "ti,am654-uart";
+            reg = <0x00 0x02800000 0x00 0x100>;
+            power-domains = <&scmi_pds 89>;
+            clocks = <&scmi_clk 358>;
+            clock-names = "fclk";
+            dmas = <&main_pktdma 0xc400 0>,
+                   /* tx: PSI-L thread ID, ASEL value */
+                   <&main_pktdma 0x4400 0>;
+                   /* rx: PSI-L thread ID, ASEL value */
+            dma-names = "tx", "rx";
+        };
+    };
-- 
2.34.1


