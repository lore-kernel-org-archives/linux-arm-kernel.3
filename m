Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75771D10395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V7TFeA2mhapyY4i34SERMJ3kAoVwV4GsOPyabz+QyvU=; b=TMopLfy+jUCH1lHCxVS8u8IJQv
	rO2hTrDr+tQ1fAQcZ08GCPFdjsWc132TmumrcwzWuLZFblGTkbVSBXP1hTpW04yrJcCfnvIPal6df
	hFkTB/2kkS1+OsWmtn5mUmNRw45P4NFafwHsrOu0fKNRpUon55fZdUuIgRlctTRNUWglhvILaAp7Z
	ODDXrAuiIH7CywSUMaYDssbdLdueImgWAH1nms47yHVSIRYEVv8RwMVh1npUqZMKhA321hzp468ek
	FWA4cmCR3EvQqUVbPL1Aaxrh9J5mqJMpKlfM7XRKUqZDNe8MleoB/J6GmDEVt71zJzx7qag92TjcZ
	uIoHE3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB8p-0000000EdQ4-1mi9;
	Wed, 26 Nov 2025 08:44:47 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB8l-0000000EdOs-2cvC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:44:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7RrxQrwQmpcNAXO9aQwVje/XVrb1R0RaNWhosFuXK7uSzvOGmA283AE5CbF7srmGO6a/vZkiTy7pk1RmxH0SduHYKp9YrLw9UVbMY/fSdGP1/+IaVlc1eoWCNE7a8NluncyKzeD/s6dpEy4B+b5V2YIj0t4txVqkKeg4AEvMahwLMaTcqt3JQf/OgGCZ6EnbF9x+HSUs2OLBIRI9Dxsz5BUDyt9x62Pm1f9KLXgbTj+MKkU4J+x8/dJM1zZlzMmy/loVwrE9Ezz72pHmzmLNuxUPIEhWiqZSEb3ORmWlmHp1utvmP1991JnVR8eh2y0mk+zVKfJMxtvAWIFHZl5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7TFeA2mhapyY4i34SERMJ3kAoVwV4GsOPyabz+QyvU=;
 b=FlNRI5Du2RcuL8/lnRLnqmS1UZBII3ST5pMA0EJgeBpxanWF+CY5dz5HPEymrfS3mqkBGEBL4pz57jvvBaGJ6SEmQfiMIFWRDygMO9m+3fA4R7/H1BbR5tGlkfM036zZGqW3/fTv4Lvfmk5VLegnEwv0ZMdFLakeC1rXIIps3N5EXRzUhI/8lad+rvYpTIDg2w6xjeQYPs3rrWbEGLw2zYJnAhZNxejCEWMW/JTi47Q5h/b99MZU8QUlx47kbCtwhdRTbjJySgj4Fpouzd0c63j/4G9dEbH252m4ceXn8vdHTs4ZdFalLN6D0YShOYbjGzZXPuKPxhsMgpYo3j9xHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7TFeA2mhapyY4i34SERMJ3kAoVwV4GsOPyabz+QyvU=;
 b=YRopNAwEBt6DJZyIUZe5KKIKi8Ga8Q2jAxRe8x4IRqU6uIx92CmiI1vp7PY/X3mZ7PmRvxlflAdCPm5nsenLqrrERJKAk7La9GQvMOR+ZLy+kQvslYeXTZoO5Ao0F77L1BrDK+8vzXv7baVUxOR76wjlr/6cAuGHnN4brHMdPkZCm5DIKeIy0QiG6gCQ0i/UiAthcQwTN8NLgHtTmnC5PMNolvEVVJCc6mbsQUOwfBRvHPgjAN2yUT9w7Hj2oTz9nxs3OsYsW2ml8QGl3FxGr6TVoVN7p/rFbZ0LPtuol4mwzxJCw6T9m2bwMDRefuTaUaV1zQWA2b8n2Vjat7aAOw==
Received: from CWLP123CA0219.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::20)
 by PA3P195MB2889.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:4b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:44:35 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::fb) by CWLP123CA0219.outlook.office365.com
 (2603:10a6:400:19d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 08:44:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 08:44:34 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 26 Nov
 2025 09:44:34 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 1/3] arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth schema warning
Date: Wed, 26 Nov 2025 09:44:01 +0100
Message-ID: <20251126084403.24146-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|PA3P195MB2889:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fb738d-c9af-41b8-250b-08de2cc80686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pJ6e29fV732X/y4ytzdqoDgsY0rUfXePn+VMx8tjEoqahCXpRs/H+zzKZXMS?=
 =?us-ascii?Q?QRYPVYWpLOAyv9UFMgYZZYCXQ+U2ilI5h1fLMUdKy0twgG+zTk3TskRPs8Dt?=
 =?us-ascii?Q?Z4emAqWCJ6jVuTnaW3UlpD2vhy0kvXeu/PlX+8rxPhatERnel/sKBCnqiKXr?=
 =?us-ascii?Q?IF3ky7WJazASVr3BIYZ0hURMGsijH8cAAV0Zg4d2uXU4bNaEvGWo5j5xfrEo?=
 =?us-ascii?Q?aG6TmygV47+pgZuen0/yEpEinKDi4wIlRUko5a/pUpWPBBKDMSBvmthukyAl?=
 =?us-ascii?Q?bUrfCxjaMp9hG3rGkxLRzCStcOE6GnwHyWls8YEiy6s2AwJ45HukwphV4W/v?=
 =?us-ascii?Q?F20ZSKAZmBs/53rRjn4wpHQVr53bDxDE6kgdNE58LC9q1rfhoTmG1ZmMCqkw?=
 =?us-ascii?Q?EKEq7ULgStNrQr1HyQQd8w86Ug+KwvqxiTyxAA3DvS2FZX2VUQDWi2KyOn+j?=
 =?us-ascii?Q?Ni8/7Wb1ycuJ/L9BGVLjREcpzVB9AZ7/WgmRjRobZmLS+nLm4638pzYva8DN?=
 =?us-ascii?Q?r2AYpnJGqgzR7xGQm5YC52xF9jg5px8F4gj8qW5KTd8srIwnePLKWMEjNOci?=
 =?us-ascii?Q?exNAK1xFsxazU0bysa8N2ju2CALBQF3yLHBrr42leW3myHa29n+2yW8yWwP7?=
 =?us-ascii?Q?tqed/HeS5Olp66c3vJQcKTppD2MqLig9TctMMPfIGawDeEmV0Zx4IWyQQN1S?=
 =?us-ascii?Q?DfGgB/g6SB7LFUkfU5Af0gDUX+pgI+Jt5TNyd8VfRrqm2OQoOR2EHLj2LzNs?=
 =?us-ascii?Q?+SLDxfHJ3ExRfyeY/uFMqD2wq1tK9WKe8KoNNWHnMFjWoU+hGAmV3N5SKltm?=
 =?us-ascii?Q?6JZh7SVemUrSPXqxGkcB50TqqwiMCLz7jlStxpM32Z85U4FGXadL/0F7dFV/?=
 =?us-ascii?Q?08Yuu8KpTF0Eu1ruOb8mw4MYBUGiJv3qvTxzr/+DGaI8MBVtt4e+tvptEu/B?=
 =?us-ascii?Q?oY5+XVoskPxVIcGJd2lCfF+tcgb2epzOzJmYP8tXdkRI9fx5Hv99VQfA+d21?=
 =?us-ascii?Q?mlwFu6nocXSFQajOM46adUhoUvy40hCb4qjlD3+lTOn/L/lkv/AikX5xmVQE?=
 =?us-ascii?Q?ue/y0Ofc2kK2U+Dhit+2vwpPt3pAujUcwOogFaZcBaoGETgG8cWGjJqEsQEF?=
 =?us-ascii?Q?il2VSeX2bQkXjlDGOwlbghW/5OFVqzDheRtJzuY5Kl1AFYSZcdvldCj+cPJv?=
 =?us-ascii?Q?APhKMVDbWNNBHY3/ahUPG96S1WR6YLNRAu8Z3CHV94OAi4dNypUH4y2GHpoh?=
 =?us-ascii?Q?hVCTTZZASb80nVx34mVMD3FWCpY8Ofq171uI6rmYsxbjfUUSlcxdaClo1FuR?=
 =?us-ascii?Q?nOdBOp/y6cYguaIGN84KXZN2ueBkS98SDfnFQj3Sttsu2DRK0oHC/4sYhQq9?=
 =?us-ascii?Q?w3fqL04p+8F+ZKpZ3FZqhLIPcxPMpM17z1YLWA9JeTfKMGeNknmw4zxPvgbM?=
 =?us-ascii?Q?hAdwUbyKdpucxRJSvcSBO/kpfkp20gA6eGhStkKuGDShQ2Zl3QvxawPedr1L?=
 =?us-ascii?Q?lLVTbubqrtkCX4neNeEdtW1vlQbR0PqtvFu9/EpMMpKF4FgoIlwBqd+A+ZiY?=
 =?us-ascii?Q?UCzBnG8ab3i9F+TwLjk=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:44:34.6089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fb738d-c9af-41b8-250b-08de2cc80686
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P195MB2889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_004443_976156_6AB997B9 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Reduce length of dma-names and dmas properties for icssg1-ethernet
node to comply with ti,icssg-prueth schema constraints. The previous
entries exceeded the allowed count and triggered dtschema warnings
during validation.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 .../boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
index 7fc73cfacadb..1176a52d560b 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
@@ -30,13 +30,10 @@ icssg1-ethernet {
 				<&main_pktdma 0xc206 15>, /* egress slice 1 */
 				<&main_pktdma 0xc207 15>, /* egress slice 1 */
 				<&main_pktdma 0x4200 15>, /* ingress slice 0 */
-				<&main_pktdma 0x4201 15>, /* ingress slice 1 */
-				<&main_pktdma 0x4202 0>, /* mgmnt rsp slice 0 */
-				<&main_pktdma 0x4203 0>; /* mgmnt rsp slice 1 */
+				<&main_pktdma 0x4201 15>; /* ingress slice 1 */
 		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
 					"tx1-0", "tx1-1", "tx1-2", "tx1-3",
-					"rx0", "rx1",
-					"rxmgm0", "rxmgm1";
+					"rx0", "rx1";
 
 		firmware-name = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
 				"ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
-- 
2.48.1


