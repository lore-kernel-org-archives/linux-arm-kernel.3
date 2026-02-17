Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B356FE81A32
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOIds7w3lwqUCtTKGqShiA5EsnchjolSb77H+Z/MfrY=; b=uxmYRnUQ597IThJS7edHJ7d+ig
	Bdqcdg25gqcju5nEaog5d7O3staOgx0akdHvjAeTPJgZHaOjxP5sdocpCoNRgrOaA8ncgO0XePVPV
	xFgJelGmMCWGbVJ12uhO5CiSDs7bwwFlqMJ6Wudp/ehoUuroqCCtbSZgs5k72AjlAi4B6qxfjg2E6
	uPXgAWXKi/4JTRl/bSz1MijUN+kywH3BN39BicbnLbsnkVqAmeaxexrlkBlifDWImi2h5UMU5tCJE
	gF5yRPEeIy4DlbBFFTBSe5izUVu5na4ZoMrbOX9xeqAwKQ/1PQYqH0mGpMxeuUnrmnk/ve99EgPgb
	joEI5pGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgV-00000008GDs-3bmH;
	Tue, 17 Feb 2026 13:00:11 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsKgQ-00000008G9M-1UbJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzL8t62TuE7JPlU4xa5VtGT1BVdb3zb1y0cQr5k78Ak4V9xv5C5GYUs2fNG1VRZRsrvcj4iRjOhRhneVNUmmZVzM1jzStA/rNDdvMwm59hM+91CGhsu1lTC7+EkCp/ZLxtacgMF5FDzcUaOik1sAGSmk+CFGEqjK8y7mDVorDn341oNMJicl/ZCX6u9PrsIgACo/+sGzGdNhkSXYfrqqJEjJs3IBILCsOv3QEGOygArKa/tOGlgALjtdtuabCl9RNMlmkl3eFFqW1eFCmndmQEa6VFyTJnfjNdhU1yBoii1F23f5y8xd2zpK4xB84pgMRFyFq6YxF3Cguzv9rsNNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eOIds7w3lwqUCtTKGqShiA5EsnchjolSb77H+Z/MfrY=;
 b=VCuZA3AJLoDLYEU9PkcvedpWLzw+rNK6lLDCI6VaSCdUkduYNl2JLSFP240EoG1jBmQfyLdL85MYoQ9FTFQnEDpYMf/90VAzzZM3U+lXrF4ON+3hsJkE4WCc9OEbN2cslZ4j5tB3YQissxyjYP4zG9Nrrvmk9cht3I17KZNZMrdcSO6O/ACcWWBXKgfBAqm6GNs0JI/NzaBDHCYME+WIVEJ0KUUPjmek3sZmPWhZ4qn+NJ7VWNXoMhvoYFqisCI83X09BzPMg8NaVzqGM8Q3Xa5df/VlMFz4Dngp4irVn4F4c8AdQ5vfamgDbXqySKFTaVB7lUbJbyHDqPSAQ6tPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eOIds7w3lwqUCtTKGqShiA5EsnchjolSb77H+Z/MfrY=;
 b=jEBfMPiBabwgWl3MOrUk0GXAuUWSlXdua1WqrLrtEMtXHCkNMwK3XBMxeJQamPor7ULwDpNqPc4m8BG+nJ2FijnNeCkSItsUgq1QFv60dr1Lo630MRVjymZ6rw5PJglJcnQtRrwb507Wf/gZDshYGxDAC6fv2uJUsp2zjYwlAhSmlE+DekBQzJAhKXoKerc3gcGD39OeirO9vUHnYH6yyrimEkl/mLTkm+ckJ7W/nEWrb1DxEkO5Kk5zFS9z6MQPP/ZnwBZhKdG+wXBzJob8qJCwoYYjS9x/qu2FfVM2g/vHTSornN/MoCKC/6eRsVvVTRJ+Ymz+8pjlztx0SuD/qg==
Received: from SJ0PR13CA0047.namprd13.prod.outlook.com (2603:10b6:a03:2c2::22)
 by EA2PR22MB5116.namprd22.prod.outlook.com (2603:10b6:303:257::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 12:59:59 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a0) by SJ0PR13CA0047.outlook.office365.com
 (2603:10b6:a03:2c2::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 12:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 12:59:58 +0000
Received: from zeus.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2EF13FD2FB;
	Tue, 17 Feb 2026 14:59:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Date: Tue, 17 Feb 2026 14:59:49 +0200
Message-ID: <20260217125952.53997-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260217125952.53997-1-ian.ray@gehealthcare.com>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|EA2PR22MB5116:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cd3a4113-dd23-4c72-f941-08de6e247494
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DWVk8+LMkuNdY6piGb2XLiyCRvAh9FeLL65eF5cJu3Bsfl6HzHHyU7R+OYJt?=
 =?us-ascii?Q?atwiIYYPBwvRsqeNhwcVl7PkTlytCMORDPAodTPEMlTH4CcooaIqrk3QoVZq?=
 =?us-ascii?Q?2tDJbVICFdNpSc3JnrIanvXxzxTCL2qMci5EIHBaJl2mLhpx9VtbdifRQi3k?=
 =?us-ascii?Q?dT20daMKpsc+ygYsx2cY/rHlDyZvC8nx0wd4875r66KTK8G1ASy3lwpjjAqu?=
 =?us-ascii?Q?5L72yWW41G1Yic+xTPPk/hI9Az5HxKmv1FxpaQm7aoXSnCvqfXsmFW76+MoF?=
 =?us-ascii?Q?+8XYYXDba/42vslq+w3cW4DaL5KfGX1qLE1PJroH5lcYOgosPgJaR7AFqUUO?=
 =?us-ascii?Q?Fl1uv0kHsmSQrQoZgC62aazSYwi20xuy4CT+4ugw1qiKVaA44coDg51xni/W?=
 =?us-ascii?Q?wAqmj5sc/s/lYh3SSMnrssc+A6QInRHXdxsfqXQdlFzFVKXw2aC21CNjEa6O?=
 =?us-ascii?Q?UnkY6JjJ2i17jN1zn5t7WfhDWvXnKOQWovjHreRtJ55QPCq3MLGRSsurUx6U?=
 =?us-ascii?Q?vRwe61nqWorfDo2jRJp1K5uoAZImEpD4LslTAkxoSicHlFGJh3nmnUE0/cPM?=
 =?us-ascii?Q?yDlSSBEjLp707ibU05nOqwHzRDtzZX6HgHwa/tNIr8D/Wyu3dzxKi+zXsXHf?=
 =?us-ascii?Q?zr63V6QsrAjrzxsa+ilVIdIUDf85M4z2v274L+4mlPu2vqUJiO5j7mmqC5cv?=
 =?us-ascii?Q?KUkFnGbCVmcFoBs2tbPTaaWFIoL213iwv/9S88qOUf0nkmCJZ7GTJnnD0OAf?=
 =?us-ascii?Q?/UF+sh6iJtNfESFwf6RXtwbHMUexCAPGFTI8/FiF7PFGSeML3kZQXiOQ435d?=
 =?us-ascii?Q?cDKhBWVyLI1kSX73qXVVXv3c3NDCm8buJaqyiM+DTRhT1qEGEc4wkKwM/Wsg?=
 =?us-ascii?Q?kGgceUqD0HAJa+Wj4uEGGBTxP6kDiMNa9TtFfNWOg7He+MsvtetWYgdQ/JSD?=
 =?us-ascii?Q?8RHPWHx5nKVz+kxUp5gp7J2yCQ0KstyNpGycIZ6FkmLuZtXwm/V3Xq4qaB5L?=
 =?us-ascii?Q?U0MLsj+f8yPp1P5vvuBNwthXdOBRMVrJTRuiRtJh3AMoZfpS44wWGrlzbuLn?=
 =?us-ascii?Q?uOHPNfYMwJZrBRKMeDmyZbc4mWcNSBoI9h5JJMezCBYNqzsUXTB41aX2QErj?=
 =?us-ascii?Q?xnPRr9e0GZDyJc105ylKs/j5R7jNkmNrt04O330UrVZbCeQbRqJ4WWr1u5zQ?=
 =?us-ascii?Q?aKBSp0Yhyyr6xqUteBl9atiJr71Ta9oeDxSyt6qwu3fdH1vndMSwcxZifjFe?=
 =?us-ascii?Q?QctccBJCdk4JMD+rk9ZFnFh6h+1Iwb6AVPbdik4dRIYrLt5SCWMdka2DLqHb?=
 =?us-ascii?Q?NTiCfcR2QLpusDvXdzFNMJKm21Y1hEFCxi0CgUTismPh42FliGBPkXpjkWj2?=
 =?us-ascii?Q?F814foCq94x87Mpfu7DxjeFMhBx7VPVC7rwrnAIk57m2Br9IuRi1G8oyqoPJ?=
 =?us-ascii?Q?XKBOx5xTtEda9i8A+Dk+EfYIQpoy453J+t5JdsRigtXDCQ6n1TmO0Z/VLcil?=
 =?us-ascii?Q?kF37f3tKSRMU3J2M4CcRnw47vsxkuwzr9Tz09TWgKVL5qt2wVSyqfWuMmpnJ?=
 =?us-ascii?Q?6CWq3oQ31VdUmGkkr9+XrR4X+QcLdwtxIgL28Rk6B43ETvZXntMfniSk/Xc+?=
 =?us-ascii?Q?/qKcXJ3eIqdG1EFLavpd7DtS2dnTsDBtSWWqQSU9EKnpqO4gQGrPxFJpDlbV?=
 =?us-ascii?Q?bKdX2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VNtjCWpWDIkK7TEcsbwqElOSRDwWTZKKXvzvBfe+vvZvolVtqhZ62aZWHE3+RNxEzdffFNgw1fN6aor9vUKokMIXMQLK2YDO7DfEjEPoRlaFNfkOnaQTh3tQxxiVYg+HLraVLXkOGEZ2oHfV1HdsanFSWxGjKTp+BUAYEvhIIP8M63/XzNNiBPwkyfw3cjETfjLwHwrodgNqEm/dqogLAMZAwWbUamSU5nJ8VlOPiv916A0GDmXcEJhiS7Hj1IyXuFkUrtFRICZZDOqx5tL81FOcItisufpdIeuypBkgOY5a8fQttNhFWVI0JcM/6Xr6+dgsQ58N8JCok3n+ZqH9Bi0xIwnpZFTnCl3mU0TvNA3R6xMr/vtKY9/1GL9Wh6kfRJAfXOcU+VxkpcIJnUmlYhfv5TVcRwMSHo/uNhau2K5STZ8GtCP+xYnr/s15BB/e
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 12:59:58.4561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3a4113-dd23-4c72-f941-08de6e247494
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_050006_397951_4C942DD9 
X-CRM114-Status: UNSURE (   9.01  )
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

Set `phy-mode' on network switch CPU ports to eliminate a warning.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
index d994b32ad825..7326b8ad08cb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
@@ -140,6 +140,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
index b0d345f5d071..9a43935be11c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts
@@ -139,6 +139,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
index cad112e05475..e7ccdcba2d5c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts
@@ -286,6 +286,7 @@ port@3 {
 	port@4 {
 		reg = <4>;
 		label = "cpu";
+		phy-mode = "gmii";
 		ethernet = <&switch_nic>;
 		phy-handle = <&switchphy4>;
 	};
-- 
2.49.0


