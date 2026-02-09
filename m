Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45356E7E0AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZO8XtaqsIjWY9aFFiXDcf5tlslBhRgIrrgqUSedHHsQ=; b=MBD5J2rkP/amuakA0p6D1WYa7a
	SZXGxjfd13wAsIbUuUNNZjZip+ams4oAGFracsg3G2asfund4Qzjgw7YEZgWZ1n7J0CkOeQ+KtKh5
	kWagm33h02sfV8dyZvH7gwNcWPeSIVG4+H6UxYDJitHS8rUdKa+41oCbmSfVoMvCCUDPxac9MlBqH
	1XlpjYusSHHkES1ZjexOuOkcnk7eZkQP3e5tGzYPIOp4/OhggN3Vvmm9joUtLFKoEfErCunzlFNYA
	YkJdGeKjCBJxByt63MMB1hAN3XHvsWo/MRPH+R4bXvMakqMx+f396iATX+m8A5aoENdbECDFagXk6
	HTYka/xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNeV-0000000F8to-0ydc;
	Mon, 09 Feb 2026 09:33:55 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNeR-0000000F8sG-2dWD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNgeyJvZd6JURGEuAgNVu2o155F15z+PNhlICQxiftJXC3xT1W7zhuEuJovflfRZzonPzhlSlCIW+LUXwio2n6HhqB5bstfu1jLbOTrCjaYp71fys9fjXS12lsbhd/0lxG2LRkmsMw09FFlsVVY5glf85uuach2VMv95fPWBdgM1WJgyhcjtn9QalJrbwuhWwZm/sNLcd4kRJsYWrXCxK8cGpi/sNvuBBg5h0gExCEY121mnZAtV3ceQXSdqFOvgr4QfsPT15qxgdlDspr+4bB2gcrB7Ma5sBmh7XZ/CXFdU189agf3+1k3WEm24v8AKD5CWS5nZJON0tSpfwMEv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZO8XtaqsIjWY9aFFiXDcf5tlslBhRgIrrgqUSedHHsQ=;
 b=ClvUG4dfQnF3rsmKhwZ3qylomX+Q0E9bVSX2gzAmGxX7ZT9dCGeNrz5NmCY4i14eKkMmeWpBn96CBA/Nv+sjCarcHyiD39v0yj+CaSr6VJTN098y2y6k4rRA5ush1QUOSsw0gIOXzp8466Tt4WtIdl02gyQ9fqJyMISAw8xQFYoH7/FB5yihj5jyo7VRFm+fOhGvreWEqzJkWNyM3ZFNzVGb6xWOvk12ihNKKbgGsjaassq0z0NNFnE3n56ZIS64GfLy0njtvZR0H63Q7ayF43UUnP30eQbnohTOluGuCxpgn+QBSgxRKbAFQApJcFNfR+0wpPmHWUM7xVhOZurpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUZP153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::10)
 by TY0PR06MB5443.apcprd06.prod.outlook.com (2603:1096:400:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 9 Feb
 2026 09:33:46 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:301:c2:cafe::b4) by PUZP153CA0009.outlook.office365.com
 (2603:1096:301:c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.4 via Frontend Transport; Mon, 9
 Feb 2026 09:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 09:33:45 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C272140A5BE6;
	Mon,  9 Feb 2026 17:33:44 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alchark@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v8 3/3] arm64: dts: cix: add support for cix sky1 resets
Date: Mon,  9 Feb 2026 17:33:44 +0800
Message-ID: <20260209093344.2013693-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260209093344.2013693-1-gary.yang@cixtech.com>
References: <20260209093344.2013693-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TY0PR06MB5443:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3cab4565-5fdb-458e-bb4f-08de67be5289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|32650700017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EhPsgHayXOLCkMhZ8E6ws/9C8a/ma0CwJ7fCFxnIwaYNw2K+C2nbFZoMZBf2?=
 =?us-ascii?Q?XTGSHF/unUsBnqB/H1ScOn3xef8mL1LBry3o2s8VbO1Ih9Chu31HfTyMBl9p?=
 =?us-ascii?Q?44AIz77TdYjLc9BPBRszQt9Au/XlQwWISTMa6bMZIWn23Sy4TrQlpCrCCU/a?=
 =?us-ascii?Q?WEpNejL3aKpzsEBtQX6ie+JXJjpSUTpJ0ctD4AvI22t7ZfQIi+x5oyf10nOJ?=
 =?us-ascii?Q?HAiiBGmreutJbyxJ3MoyJa+7EzXWqnJVLZ/6GCi09IFt9BGj9u7Yh3qYjtKj?=
 =?us-ascii?Q?USW8pdhY4e85a/bqi4Sb4BeThqdkMsyLa87rtKGFygBYQSN5Amw9JXvbydvA?=
 =?us-ascii?Q?+/VqoxrkALy20x+Vafm5o2wiHIEpLfjeeDpc4RIp47kFUuVLGN+HPSPrdXWR?=
 =?us-ascii?Q?igwAQtK+nG+FhoE2qIB71gTdDYqQC99KHJEaUUQhmzI0dIWZpuWp2Ks4vOXy?=
 =?us-ascii?Q?yszd590C0r6fzqVnMXFjj7kKOCgSdcan55yA8QxRv3tM4dF2F6Z7lAa/ZmKt?=
 =?us-ascii?Q?weqxdClXRkm7C/pmZQVl5Pg5IHmKtcpNZbP9bGkhNe0VMDa7KDMNEOGFuEE+?=
 =?us-ascii?Q?O39aWPQIP3bqPv4PJ5GXwwyFiH1SCjIAIiZ/Yh93G8FhKWNY2TXr3rRUKPFs?=
 =?us-ascii?Q?Q6Vdcx6uOHST9i1uWhJzTv3T0pV6J6IFEu82nw9oQbtThgdvCLrIcXU8o3rQ?=
 =?us-ascii?Q?RgmOjzxF/Y7GZXRLX/QKAeQvHOurrhA2daMLobEiL7ddkdCGZyEr7lABkvG7?=
 =?us-ascii?Q?cJ86pJBl5GhAZvu5JiryvjmQXQINj2VjkWnkRBB2HzGgZ0/cRXTRgp1y9+DU?=
 =?us-ascii?Q?engjK/+dNvSf0MZruUwM2v027CHBpTTfWacHHkr6DVChG6kDM6E85bgoU8kT?=
 =?us-ascii?Q?ruMFNw/o6bfrXBspmWFqYTjW9MuIQ/3ihjSk/BDCbwS6rxy7AvIJgR7w35xQ?=
 =?us-ascii?Q?4A0U/qzJTHAMCDe60aTCCy7G+451Qt2QA6A+kOaCTRQHUsd1SG53H4ib0gvC?=
 =?us-ascii?Q?/DBRte8wmKoEAc6diF9lzPig75ok03MOieedx8E6TUrnByvjZVw9InBQgqUe?=
 =?us-ascii?Q?1V6mniUU3YsUtJuiKfRmGMQ4IlLrm9d4z9Vkv06g2DEbhk5BevgVTDjW5qz1?=
 =?us-ascii?Q?0uu5eBvH+ZLniViCviwSacgHwzdl7wugAyC2zXfu5asrLgFa9EkiYXWjlPym?=
 =?us-ascii?Q?YIazvArehdQmvcyXmqxGr610BGoGpfa6LXh0WmXeEWJedb0WdjF7CALEgE+i?=
 =?us-ascii?Q?9MXSUFU2auFgoKHUb73w1kyvu01rzkbxRGXpuJlOgNw3t48ajduTpQ8123Hi?=
 =?us-ascii?Q?2GTK2UT531YURLjrK1Q54g29Vi9NKhD7fRPeu/MABYskiS+kJHNdRIC1BJq7?=
 =?us-ascii?Q?IKXyin3cpueKa8tNsjCutYIrt7rOUP1ml2ENWVgJSobQ/G0p5MVa7VMiEY3b?=
 =?us-ascii?Q?cN+HOMMwuzUG6iQlQpm1TxbDQ2Aw0bxz23r5786xHw0WKg3T5Yxm9B+3Ag/w?=
 =?us-ascii?Q?uKc3cZXnusoMZC4SB57tQdF+le1cs4b++u+TTRxD1EXCnDlVLvYeCT34w6yy?=
 =?us-ascii?Q?YYjlX3hoQO2doH7LTwyjGLkYYohGfWDpbTvL+U69IGV0/desoiZQkDf9EA2Y?=
 =?us-ascii?Q?LeYB0vB/5hVe86reY7rZa8KF2pcpapfk8t1X3pcEU6lS?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(32650700017);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rSvc+vUy0/XsCT/cYbyaAq7mLTsE5BhbxOqhnR39vIR8nNjdpmYwP1QXrPTmiejq3y9tQzNUmqCT9She3a+cghZBHTQcOcnG6jIK4WK7Gtb6Q8KDiIbB7MZV1jiT8EFX7Y4sCh9JIOEVkiWtNFUUfJFTeKqXJ7m0HxAbEYspCTt3yl+H7oyWgAfLx1vcDHhE3ba7kZ0Hr4GP7x5BLd63h/Rh58phtdTrrSivpbCstYzYE9Mr/b2CDk3bMXgxwUSSn+n7U5NwUD3921gENu7VK/R8FWvpKfQbAXrv1zKPZNNht6C6LK0MYOZ1LqTbjFI9OKV1qdgDQ4u3tyW0sZsq63vjuuul/hwp1yjYG4KXtzLE7pYiOrweOERLRFDN4HTHUGLxi+FZyjamdH+3nNqYyKhEzALP6uxP3c5nX5/fFyYLMau7KwSmundlPKf2RvCm
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 09:33:45.6958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cab4565-5fdb-458e-bb4f-08de67be5289
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_013351_671768_CB3B6ADE 
X-CRM114-Status: UNSURE (   8.98  )
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

There are two reset conctrollers on Cix Sky1 Soc. One is located in S0
domain, and the other is located in S0 and S5 domain.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 64b76905cbff..a28b877cced2 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -348,6 +348,12 @@ i3c1: i3c@4100000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@4160000 {
+			compatible = "cix,sky1-system-control", "syscon";
+			reg = <0x0 0x4160000 0x0 0x100>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc: pinctrl@4170000 {
 			compatible = "cix,sky1-pinctrl";
 			reg = <0x0 0x04170000 0x0 0x1000>;
@@ -568,6 +574,12 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		s5_syscon: syscon@16000000 {
+			compatible = "cix,sky1-s5-system-control", "syscon";
+			reg = <0x0 0x16000000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		iomuxc_s5: pinctrl@16007000 {
 			compatible = "cix,sky1-pinctrl-s5";
 			reg = <0x0 0x16007000 0x0 0x1000>;
-- 
2.49.0


