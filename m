Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF1FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 16:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fMW+8mF8pvnbexBgvysKwbG8e79W6UJjJ1b8LbHilU=; b=voy9STC0g88/i+IePX1lsutlYh
	BxGO4Ev5u8O6ltBn+4DO3mzHTGjm3jOG/7J66Axeb2MpwZ8kjgbUcxOJMkwkWaX0f3y0rzDDDplof
	Ylww1TtGJ/nsNfO4mTio9g3H/cW1xnq/sZrToli/szZ3YizsydHcQHAdt2WIm2b4rmXURfYvh1AkC
	2LHx2c31VmkUARAdpPa7pVJ6+X8gSEcoUeRbbPJgQeCvT9gYK8uoVgkET2JcGSYzmf6R2VHt83cTv
	Y2GjljZNByW6Pivl2HFUyZyckqj2KsbMR5k1Z2kn04tBYSggoCiCZN2nLMPdYJE0aVK1MTL8LzDlk
	9Z5SwI4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFbCl-00000001DJ3-1DGy;
	Thu, 15 May 2025 16:13:07 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaxF-000000019lQ-4BcN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:57:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEoI2L0pja7oGbWJBKZhfaQlt25II42uEDcVNWcVnuHrDGxyydM1Mg3R4ReQU0/LEeQnZrlEPP5xMjr42Hvg3udTj9ogTJb4diZC3avY1yh1cvpIpw3jlRACvisKKIiUuwrFesA6NyMAkAmocdNnulyadAACj78zGGLhnZprfcn3T+r7AWgiNXp3q4DaxL9HlCQ+qUq4rhK5alMWVSGIdip2GAFn7zDPE8D5HuF+r1xmJlkwYys2Vy+OBHxmTPIUyVNAz3uVVXiK7m0+ZWFlLUPu+MpxPophQ1CfGj3bpCRDO716tPuZBDDXEun6PQqMPsus+1n2pAt1ohHFMMWRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fMW+8mF8pvnbexBgvysKwbG8e79W6UJjJ1b8LbHilU=;
 b=x6JpnpMvQUVokDqmXVzLyR3blkE9NHDsewvV6yFOpfYabIzW2F0NpEpvLKRKMOG+AZE5h5JWYQhEZHBsx80Cak3wQIadnLL579M2WBdw7hRYYZ3QI1PNLdfpHpcFpuXW64wbQ38pwa3NPY1A7qRFUuZ9F+20VGg5WHwMCRQBnsAWqld4vDd1TSqIkrN9gFr7+0bxFuzyaRB/j5VhOpelh703yYeUWnUC7N2RzHK32z3TUxw3JVo6FfH9qD4y/PgoUASz7MW4fNu8Y50pdK47pzWA5pp8xZ9LseLXLYbggDXFr7o4FyrjTU5VbhCDVxfi42WvMaJwOdnZ/qW+hEQeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fMW+8mF8pvnbexBgvysKwbG8e79W6UJjJ1b8LbHilU=;
 b=B/mIIaBfIJmiUO3RJmmZG4MNslzoenbd5XuvAwfJadXtv1mQgc/fvDe6c6E7c78o0Z2iMRMcxBIMNY2POAktavPCm7EhhhbxjNFdtX1k7n2yMPsdfk/Uuo4B/e9a84RQ80lBiNdAGRZ2xKFgsXYIz4eneeQBPWTvlb5PH4wO0Y9r8A75aeO4By0pZHz2thE/vrRyNnEoven0t/UFtN0PtfDu2mmz8Nm3KHXTEeit5oFXq878Kv8/8WlwmCT6qDYD60rMhKw0M8QWirlonbpB0xlmbLrkSdA4KP1gp3WlRGbkydgPAVi4pSOMLkBo6cVo4Gs2ElYy+DPXxDCg6Lufxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GV1PR04MB10197.eurprd04.prod.outlook.com (2603:10a6:150:1a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:56:56 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:56:56 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	vladimir.oltean@nxp.com
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 6/6] arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
Date: Thu, 15 May 2025 18:56:28 +0300
Message-Id: <20250515155628.233007-7-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515155628.233007-1-ioana.ciornei@nxp.com>
References: <20250515155628.233007-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:205::15)
 To AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GV1PR04MB10197:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e91b49-3dfa-4684-8696-08dd93c91e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rBBuJJTpiTtQyN4dIiDb5CSKbsvVAfDcMb3TqaW5u/NbDnGFZvJc0/2JGgqH?=
 =?us-ascii?Q?ohoh0b7EKWtRIPeI8IMZGaZqoF9DRLPdifxzSfPp0PixBmA/3I1Hwv7sSddq?=
 =?us-ascii?Q?FxjHJUQB7LkHysA3hsIjnthCdPrEDzaY3cKpNeJGYmWv4odjOdhfHunv5f3H?=
 =?us-ascii?Q?SKQQucI9DLQIpXdNJHJkry2Llhqgh+85th+pn9B66lVsHGJBOefExKaNnG3+?=
 =?us-ascii?Q?haSFvskGzDQ+HXUWXsqPQPZaPS846jc2f8q+0YSz08IhIDj2jXqBJpgy9oIw?=
 =?us-ascii?Q?z0pJFswVolrKC8hJ7PvpfqqfKFPYuy3J31E9GJUmRczRWVAWDTY6q5a2xODf?=
 =?us-ascii?Q?xZ9VAV4P5+eFjE6+RIHz7nCTB6RDOnW37sGWGMTz1IgUP10IQh5sMbgU4CMN?=
 =?us-ascii?Q?q9UsphrSuHWZEPRYLqCg6R2O7/Zb51poDrwxxwxfJNUQ+ed0IUAz7GWPnWzD?=
 =?us-ascii?Q?FrHgfDe9U6woGkEMkE41Xf2h3GvjpnRIrNkNKEPvt02eiqdUMwJw9A9eL/dc?=
 =?us-ascii?Q?lMehDrerT3Bsn/k96w4ETpwSjzv+nvpI9zDSg7Vq47nrrGs7Sf2f7ycPbSDs?=
 =?us-ascii?Q?60tlMB8cAoLVrl9DGcYIy4vAbRKdOXfrTl+QP9Zeq9WH3aZnQTlkYxFPxoSH?=
 =?us-ascii?Q?MI6pJ+PYbXXz1vfzba9IQGD3EVU1xZYJVFunnCc5fvNlyYNtjTqOEMM6GW3Q?=
 =?us-ascii?Q?ex0PUPRg8n9mcrvOE4Vi2Su9RHVXKMQyqS0dWwpgKRxjsTiJX++mPcgdipKe?=
 =?us-ascii?Q?VijuLO7UbHcXS9h7kVIIk7Sl64u5z83+ALbXZEEM+H1E544HnIE23bsuXkkz?=
 =?us-ascii?Q?LLmDJnu+o74GugeDemntzr1E9o4+hQKKyLuYvZ2G2A/wnmufhgtmpHxcRQ1e?=
 =?us-ascii?Q?5HegoqxuYTufupsFtkXi8C9aB4wz+FWJIfrSEF7oUEGyhc7Ut3wKG+Uk6pZq?=
 =?us-ascii?Q?zkAnFMq6UiDzAlCBugHG9iQ0Zm7gHMYreEBynuHZeuQrYCMEheXTMVNJtjrY?=
 =?us-ascii?Q?S9xiONSgoyI0G4taJGQd0w2OH51Z5rSRFTF1gheXT03+wu66ElXa70vrE6Eq?=
 =?us-ascii?Q?2EThsNQ816ntEGcEQ3DvEx28ZkhnsKIEY1Y2K0uLpYbsRHq90WiDUv+Qgd5v?=
 =?us-ascii?Q?kzBGJCBLPRrkquh9XNxOt0kY575MOOMJdztM7h4ynxoTBbKuk5ga3mh8Typi?=
 =?us-ascii?Q?zrAETVanu6eVyEHF5czwXGz4/KZQDYF3Kk5PURQYfQstbsYVaVWfNz0ZkhA5?=
 =?us-ascii?Q?IFmCAqloYQMbz7kLGvd5UzDEGGC9oxZrKoyD/s9aNceAIyDVMvFv105ShDLy?=
 =?us-ascii?Q?L6TKyTLSJDKqdI2y96FxWOXSaLGurKcewboW9HBdMwqX8OPwDHmBJWCGe8hj?=
 =?us-ascii?Q?7SXHQJLmDSmEG9Nfp7w/kZFSpZenMwneuaij4ipvB65bgHSPIgLmaEwDT39A?=
 =?us-ascii?Q?jxeawD/RQPs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n2lnb2dKIyeF81oRJlt9CD/+XktpUAz9TsTL81ftOKY5P86kLbMw7ZTGWBoO?=
 =?us-ascii?Q?kmuo6o17ZdA7zR2J0IXxhYI5ChWu9dueELDWqd1CDOM6HBSUCOaWogb7jlF4?=
 =?us-ascii?Q?nI3ji++gzKnhlsdgg/92evc1MZao5Ik6bLaHCDwwdkDvbhpBCayUd7XreG2F?=
 =?us-ascii?Q?WOR8L/U4Q90fg7GctGvpkDlG5WOy4jQ3cWJ6UvdQ07FtA2Ql21m4vHmbWKLU?=
 =?us-ascii?Q?p12yI7Z46NKz6gz+MuKuKTwXvuWb8MMhzGe0SKlcDxagcsnbSkvPV+Ci0IcS?=
 =?us-ascii?Q?WNjAFmL2IHVLQiyJuS3Hfnm6d2BMyQBD2oCzh6V47gM88BzVOo54s13QT+8z?=
 =?us-ascii?Q?Ja5R/oUvRnbRR6z9mmP7UcvsukF2yxWpLKU9juRO6O/TWD8MjeHIOXt013jL?=
 =?us-ascii?Q?+AOn/FiJ0Bt8hYdqPoCUxcLwNfb+bm94v/XArgwVtWdYJm/d8qE+R/V1aOtg?=
 =?us-ascii?Q?Zd22lky5+x4EgmsJKTXJlyGWFxhOQPBwdWSEXhrDkW8Wj6WeWECSxBv71rAL?=
 =?us-ascii?Q?X1FkBHBwc1638p7YaUKFAkptlsW5mHUHloM9R9gzR8aGCgbshjg/wuPkDgsF?=
 =?us-ascii?Q?XflN+hHEUS1Q7rjGZdPy13EYStnmYcLWLR9budamu/cNC1RCMuNFTbobU6VH?=
 =?us-ascii?Q?uUGsfEzRXAgBIilbWG+vJ8GjHvsmVyvNy7WTbkPJKxAOvH/Mqvw0pn1NbXk7?=
 =?us-ascii?Q?yH1akUNEcg6nWDfrDitZQOSa/9kdmLZUIcj7E/pBQGEuApcjMnADaLUivKPr?=
 =?us-ascii?Q?O80ZwPk3k1QPQU9ETD8AbRQAYwFo9L91PG7xKAxXASOVNmQd9GqM+lXDGpxW?=
 =?us-ascii?Q?LM7dfNxIviZeSv+cqBqniMuaY/6HqaNTWoQVXjayOrDXXLy6OHVR81N14qtm?=
 =?us-ascii?Q?jOdDR3V3CGy8uzL4ZdX8TYQNUQxGLHtX51Q/Yt7fKS5O91Pjrnjbh08FHMBe?=
 =?us-ascii?Q?Q/B2dxonBz/u16zPAwlQCYCoavez8cvxJns7jNNEKgjHX2N3fRJSxq1U3M4R?=
 =?us-ascii?Q?crbkfwOP3Uw/p+u1HGHKmBRVJwge7GtdUZr66WIG5BsItV7TQBirzX/i1q4p?=
 =?us-ascii?Q?CPZtX31DqJcSBg4q0OP/pqSOsp5DzgCRPoNbREWraxhCNX6NnulPcbpCbwgB?=
 =?us-ascii?Q?R69kFqD4R9dybDg6RYEdlyXMTgnJqr5WKb2uSRUwFoHEt2TvJ14m1gmrPsj4?=
 =?us-ascii?Q?q3Zocqh0bOyZ9XgDnYNXJb8SqY4FPCOflPHtVNdBpmbZDEuLcdVEB56Dh1o6?=
 =?us-ascii?Q?Q2f+3RmL2E7Eqa82t4Wo5Y/peXqwBcq5lf3z7WHzTGstFC2JMnewyNTeRmbb?=
 =?us-ascii?Q?Cv6772xLdDH9r+jq779VAvIbvVSWnpLs5DjC+o+5BmqmnVrATrXIqyv/SrKu?=
 =?us-ascii?Q?rqFB++n6pmgbPqt/nJ5/6PMlA3Seop6Ii2cNMXyO+rKxuFc5rq/AjvWFcm3z?=
 =?us-ascii?Q?p1roae1XOeHSpszAQNS/5gxFgHKrBEPfs69jpiLdhvgkqLMrhy8CgPDIu4J4?=
 =?us-ascii?Q?53cwZCyay5KwjGnHp1V3yrmcLLM2QiXovDsqGrBZAhyFvKCMzAnpk+j5ctuE?=
 =?us-ascii?Q?lSQLMFwFz4OYM7LnjHPzehNDoKSNX4dqGU2yP2F+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e91b49-3dfa-4684-8696-08dd93c91e74
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:56:56.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/WP+FKLTGW60h51TNxx0dnzkIWU/RAEC5JOYiDN4wyfhiAD9Oumt1xMqPX29/64crz6s9r/cGxe3wir9COjTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_085706_036275_0C55DD74 
X-CRM114-Status: UNSURE (   9.69  )
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

Describe the two LX2160AQDS on-board RGMII PHYs on their respective MDIO
buses behind the MDIO multiplexer.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- none
Changes in v2:
- none

 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
index 426fb4c39ab8..be65fb559107 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts
@@ -43,12 +43,22 @@ mdio@0 { /* On-board PHY #1 RGMI1*/
 			reg = <0x00>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy1: ethernet-phy@1 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x1>;
+			};
 		};
 
 		mdio@8 { /* On-board PHY #2 RGMI2*/
 			reg = <0x8>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			rgmii_phy2: ethernet-phy@2 {
+				compatible = "ethernet-phy-id001c.c916";
+				reg = <0x2>;
+			};
 		};
 
 		mdio@18 { /* Slot #1 */
@@ -169,6 +179,16 @@ &crypto {
 	status = "okay";
 };
 
+&dpmac17 {
+	phy-handle = <&rgmii_phy1>;
+	phy-connection-type = "rgmii-id";
+};
+
+&dpmac18 {
+	phy-handle = <&rgmii_phy2>;
+	phy-connection-type = "rgmii-id";
+};
+
 &dspi0 {
 	status = "okay";
 
-- 
2.25.1


