Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E087E9A777
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWWYCFNj3Zlidx+/Ni8noLymGVAiUD1w5Es+iD96Ye4=; b=3PXXn/6mHUzQRw7kF4TGL90iEr
	84mHUWYtFImE6a5+X7Ct0tCYROaZZj4XfGxALYTK1bA24pz/Bz5oEvthxJzn3lURU1rqGDBtaVxF/
	saf22D0tmWaS2Z5QDpWKyKrO68tVzW4rzDTNOyM/3etwmFnquOzYRdxFBXY115L0UEABhZxn3gs3/
	1XoDAb1o6Ulcyrb2OoWaR0q32PJyrpFLcY4tTV6ixbBj875hhY5nNmHTynt00iPdFxNk/s1qn3f5L
	AsssIkId+U5/asMLSoL7hR4NLaChwP6Vur4s9XYRo7A1hta/2e+iGpykBdhFUViw8cToRBgmcSXSE
	2QlJ2ONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Rz-00000001L1y-1JNg;
	Tue, 24 Mar 2026 12:01:35 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Rp-00000001KzF-00Zu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:01:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWMn6h0jVYZYg7psgTl5Lr7N1TgrzV/lq32lObUJhwN/Q02U2WS4EPgOborsA5VQCm+6K/gGSNvASFMhZw7Z3AguK5UpaOY6l1dl6/drMrJ7gcKfhgGWHSHTTKtbSGGZHfzzfonhU+WWfM6kCwRM1GYJEsl52TIonsGJvU7s94yVjaPQBvbGym1icWkPbqjycwkUCJBDxkr5o7FglkcwGc6UNeAAp41v3C0VHYXFyXbjIIN02l+oHYp7sJolrLPyF5hTD5/ZFAhWM5gRcSI6WMF+/IY9VMBdYyZzkBofcNeQxMBeREDxx6/HddK5jXTw007R3L+FVS1tiVaDcM0piQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWWYCFNj3Zlidx+/Ni8noLymGVAiUD1w5Es+iD96Ye4=;
 b=E2O5trhsriFdLCky1QoYF6KCPtz+1vyPqaOZRgJimnq6UKewDEKPx3ha9Lfa7TkuUkw8Z0WIwkmpJ607tLZc+k9UDbt/wfYRpDS2DyVuwGR/SIkvvy7+dLEWbcvPgsLe9STx4eU5R11esDSD+04yT/DKeJ28R46nE8BhK37tW1KdonjpY6hkMbHVUHglvgseQykW9xS4d41zCASRqhM7v+0FOBtSrN4Agnn8hwFCtDEdzdfY4HQd3xhLMeeRSfbGLANBLTJJ9+LWTeQsvyjGlQrz9cMGIZltKlvMB2+Ww4CfjQD6Ri+rRGU2dmGDl3S+8QKIeMk22WXu9Cl5H7ep/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0089.apcprd02.prod.outlook.com (2603:1096:300:5c::29)
 by JH0PR06MB6918.apcprd06.prod.outlook.com (2603:1096:990:65::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 12:01:16 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:300:5c:cafe::f) by PS2PR02CA0089.outlook.office365.com
 (2603:1096:300:5c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 12:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 12:01:16 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E92234126F9C;
	Tue, 24 Mar 2026 20:01:14 +0800 (CST)
From: Jun Guo <jun.guo@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	robin.murphy@arm.com,
	Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	Jun Guo <jun.guo@cixtech.com>
Subject: [PATCH v5 3/3] arm64: dts: cix: add DT nodes for DMA
Date: Tue, 24 Mar 2026 20:01:13 +0800
Message-Id: <20260324120113.3681830-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324120113.3681830-1-jun.guo@cixtech.com>
References: <20260324120113.3681830-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|JH0PR06MB6918:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 38f0ea97-5934-4217-2dd9-08de899d0d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: K42PWuQuvq6bXJE/20NtZAs7Jsesy81jHv89v0t/2/Qtj2BzCvfT7GMm7s5Y10bi/nXPC4dWACrkxNNujXb4AR4iCB1xx5XwY2ik2kv+D21W+JGSKGG0IyXaKnef1LTnuuBjsEngHx+iYdxZX6+cBE5Nsp7/D/uS1igGSBoiglJLntTDJdFjijrVZ3Ie5AKEJvyO8NKvDVc1B1Fp7iTyzdGIVtBYLoDaU7AQussxGZ8qfCUnYJlRPgMDKOmbEXq4c1s+0pcuQh+KOL7oj+xRhmE7T9ypmMy7Ygy4F4y5lHajDRjiyYS26W0187pMuaErTNO364aBkrLU719GR6tdgLp+LoNq4r5h5jrl665qAma634/7RsUi5z5L4VP5dfzU1AAV8W0W32K7hMXW8KNGSITq1TyGJoa3UJLK4NYKCbQXPgCPM2SQap2YSCVHK3bfN+aSS2xilTm5+dxV1LbRFvMSU2gRtkO+6Eu/o0w3Exj/gdHvUdNV/bVVRi6qC/QZ7HQQXBJf0PdI+9G2yCr1eQ6bqbt/G4KqogJ/gq8rD5tAxYvkpBoxH5J2sld7FeNeV3/8bjUwbDmVDaD45tzXgOeHNXjS/jNGH6v/MJ4b0bZzXbklyhSEtBlhdtf9u4tq3B/HKN0wXRfxINtbrLsCfQ0bMp1tdWRESrdymE+f+TxHGcKmEy3aylwz3fl0Ps5FixMGSH9wdziV+8Sz7PlETewhqRutD1wiJQ8LEoLPgHSrC6KshjiqqOZKTojtqc0wYetUD74GjZcbcGTyz1ptJtBh7nctmV95WHC5hENHY2Gn6vyUZqml3bfuf4sGFbA2
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bQIc2DcuCBQw74f3bB5epBywbsq1IPKZWPUVfSD2kyLXP0sIbWzDkEiT0gBPmlgvneVGRE4wnQ20ybhwPEfBIH8/duPCzvigwuBQ2cmOlgSWXjicUfqwHjsed7lkQQ9i55upy7aDXbqSX6kPggHR3xhmK9FK0j0dj+iACpHlS+U38BwF+Qfo/DY3GjPvFHjJu+rKOBzmUIz+Q3lvTtQnFmxt06lDHOa6tuDtPVhN3fCJ9WhHfpd1yJGNXIRMGv5DmRfq8xjqsmTGJvKiNSeQFIJnHCF76Z68X6yBxMDpSH3uXj7or04Ilre0tz7mTs0byVeZYiV0pJU+RdY2DBscShzBqV2/MKIr4J7jYW19g3i5XVGi/Y3HcbiEx0LUFt+gbL87qRoeV/EdSuJGBhUDcz0RDrNU/HSKdjqCjYD5fABntZcI371Rv7nS14A/aqqF
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:01:16.0988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f0ea97-5934-4217-2dd9-08de899d0d88
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_050125_066325_B1ED4C05 
X-CRM114-Status: UNSURE (   8.86  )
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

Add the device tree node for the dma controller of the CIX SKY1 SoC.

Signed-off-by: Jun Guo <jun.guo@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 210739beac6d..124a29147c6c 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -480,6 +480,13 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
+		fch_dmac: dma-controller@4190000 {
+			compatible = "arm,dma-350";
+			reg = <0x0 0x4190000 0x0 0x10000>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
+			#dma-cells = <1>;
+		};
+
 		mbox_ap2se: mailbox@5060000 {
 			compatible = "cix,sky1-mbox";
 			reg = <0x0 0x05060000 0x0 0x10000>;
-- 
2.34.1


