Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDF1108E1CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6f+sfGJtGMAJL4D/I6yB+G0Bp/5QHjdEYrU9z9hHaE=; b=Di2wHZEnI3T7tGnY5cO/WQ0AsP
	w6vOREYgvYhPzRO27YEcqcRNr+V2MjnDZl604sZmXrdwtgvAstrZ6DqprTm8vyMNNj/8Xb2Bd+5O0
	1qIuEdY/1PuI8HGl+ntdogmUHF4Us2c3/HoaZwO+AMTK7VHzcEZo+bdZ+YhczYSV1wXSMOLTd030D
	nUMrJz8Q+C+4QDH02ECQXSjOl9PlHHu1kb6bhl5IGnI3kfrVM9AksCGbIgPp9dZT3GPfJdxLhZXI9
	kHVeLXCDtMOrDuLb4G97WeaPLqxYCTxYNFj+L6FSLnTB3ACz+UIZPF1pa68KZGqUoinjQmtI7bWBF
	9wv5kdVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ARj-0000000AOh8-0Dm3;
	Thu, 19 Mar 2026 10:17:43 +0000
Received: from mail-japaneastazon11022079.outbound.protection.outlook.com ([52.101.126.79] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ARc-0000000AOf8-00Zk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 10:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPK5TJSdr1cvEs1ME+IN2s8C2PI1yTfiF2ue/pLXj15BVbOVcGJxbKDXFEUMwuViL7uwwUDX0Dak0xZxvQ9OP5Y7IaysECnpdzk+cENzyLxnxckJkw/UNSSSEtfYBByowelHlYpudueWVZaMBhyAQWKwoRkd3tB7dFs1buyyJG5jmpvHiwUrgf76Ipg+W48HJmWS7Za11ixhQ55hHtxl1lFwNdzzs32AQFn/OkxIX7/JWRc1CpDt7fNzm3g+BR9BS3DoDZf3OkqNv/niCTzqUNnbtSnMkxIhhTBUdyC//BdDJMveOoVI2B0yH7voFh2qpYIAah2MpZZ1zjgnFY2X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6f+sfGJtGMAJL4D/I6yB+G0Bp/5QHjdEYrU9z9hHaE=;
 b=PadKfzE4RRLlQ2Qv0sT0mY4AvPfAERCzq+IQ66z5dugDtuMMrj8d0PCi9BnW33nUX7rlybH9HliqwLUk5wcELpL+JtnQuGssna8Udk4QdyKhfNlUWGFZb3k+ewtNEUNfWr9Otui+hFK3Jwyrdsqou5zAnvJoyQ9N5imrJleV7QE6qmc5UMOJT2wXlSGyRb/4LXYUQHFnHBH5oNbOI93C9jIZOdAYVsaZdnuHuEmcm/sXioSWRLHk8tBbZ/hbnvswiiR+tV/kfho17Ou3Y8ZFMmjreFcxGzFWeLf7ACXThL6YVznhqCF7u0fr/80a26fZsw2wISD5M0uJj+ezK8QyeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS0P286CA0059.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9f::10)
 by KUXPR06MB8008.apcprd06.prod.outlook.com (2603:1096:d10:4e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:17:28 +0000
Received: from OSA0EPF000000CC.apcprd02.prod.outlook.com
 (2603:1096:604:9f:cafe::60) by OS0P286CA0059.outlook.office365.com
 (2603:1096:604:9f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 10:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CC.mail.protection.outlook.com (10.167.240.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:17:27 +0000
Received: from guoo-System-Product-Name.. (unknown [172.20.64.188])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 45C674126F92;
	Thu, 19 Mar 2026 18:17:26 +0800 (CST)
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
Subject: [PATCH v3 3/3] arm64: dts: cix: add DT nodes for DMA
Date: Thu, 19 Mar 2026 18:17:23 +0800
Message-Id: <20260319101723.246539-4-jun.guo@cixtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319101723.246539-1-jun.guo@cixtech.com>
References: <20260319101723.246539-1-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CC:EE_|KUXPR06MB8008:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f4610684-c8fd-498c-c963-08de85a0b8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|7416014|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: OC8VFPAwIy117ZjG5uqWzrqbKOpMFfI05hnz4bF6WXyzy+ZXidMbLwJdICe8WErYh0sXOTjNmHmFkf4eyKkBiimePZ9CVBS4yE+UrlbCV6FUiyw23kjpJjQ9t3wE5vmQNz7WFgbANO2I5BN0VZgs95E+gGweojsNazYczs0DdmKJxBUWNipC6yheduSk0EkJ1zAq4TNOAKJifLL7skYEGmbqMd0dXHTUo/gTU6/UIKahqxp4bDRAPysJ7whWILa3fnFgswlWgmFbFeugt7SH5fndY+j9sssBNqL/nNERJ7B52HFec+tA7FjnBvLIkq5ou0vH3kxXH1ZU68ZwcNmbltfMPt+e1xndhrE+FtD6edI8yLwdb5LL+kM4LZgzHTVrb9BAc1bQsFnQSAl5j5/JObEb5x8aprRMbv4Uvy+nn3H0/Ub1qCknbuZXJdvDZrOv0Yq3VmdSMvJNA8n7DrXROJgRn7V1tr3PZOUvelOCSh9usiytEQKCDWHMTsAf+E4nxGqwtORM2WMRG4+Cs/mvt9VVcaLBLWWND57D4RE1bPFOhsC8b9QvMV6/e/lWGXc/P7zSm7ixucYEZXBiDdR1Xok5Uo3IbSUCibqXj9t3TS2pxyBqt6fJEDvNPdM5uRucHuhFrHsGGzOzP2B7wzPV4+Q2ezi+89wuYfhFUX3MIUa+qlJ6mZJF8lLwXfgT9pM3v0EO/x6yOPqGlwbRpOHPvhQgoxEyBSI3p9W4F50UsN+RRipgct7hHSlmK19THlKOOABAbPCSlK99zuOxaOc1orGsMGpj7gXfxfafxkdcole4fvFniWb7i1ezlRpNPicy
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(7416014)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cgz2nTyihN7Pg2P6yluiLK3zcHTyd7/7JzEpK+BBXUqK3SPIMm4ssVsfuIZn/gRxU6yrw5VePBBR+RGlR8KA/dVHI9rTnodXbGn/xIhW5bLcHzk6fU8a380Mn9d0fyoZrQ6BsRHPAMK3Q/9aChDnliP3cq4nNV6HXOgpwZhbjVAminNZemjyOYS6NpyXb7LVHlqDxALueXVRrbvWI8VTmWFL/RWOQYg1HmGmPuoxkEPK00uaa97FXonggq3GhOkxwvoLkkuf1uhohGppnN5x6eyQEdNJPCFowd6BZ9xc5pXeWqKRTG41JoFRxSjAcXyGd/cZUNdWpYNxsWQbPhwb+Hk97MIwz6bop5enUrB4MXINU9uNkOvn8kbaq7br8IaXS/BSoZiQukYpy/Cs5n9LP6MQg3U2qUz3WkwxyCDHSrGRzqiJ3SgQlTIFUcTN4s7A
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:17:27.3475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4610684-c8fd-498c-c963-08de85a0b8d6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CC.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_031736_048316_99D9F9C1 
X-CRM114-Status: UNSURE (   9.25  )
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
Link: https://lore.kernel.org/r/20251216123026.3519923-4-jun.guo@cixtech.com
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 210739beac6d..1185c99d8d9d 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -480,6 +480,13 @@ iomuxc: pinctrl@4170000 {
 			reg = <0x0 0x04170000 0x0 0x1000>;
 		};
 
+		fch_dmac: dma-controller@4190000 {
+			compatible = "cix,sky1-dma-350", "arm,dma-350";
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


