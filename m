Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A67C44538
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 23:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoQOtTW3FtlA8mww2f4TSbIuazq3KdLl8+erw+Wwn+M=; b=l79Ll1yZrLKUaAgpwzTLNwArak
	UG172Kf7A92+uT6gJTOfWtRMjz8lHRfucuxXL1s9GjwvNeZHqjbA5KDWM+eLiBEa+DMf2Uo9RSTWp
	nsv5YTmVClt1FgYmIExXD8sXdGyjj73F1oFt0UNtjEBmExV+imOWg6mSTtUSRyVk4i68YYk5CTfUP
	dm+Dgy5FlBOZYnSRJL+dbXStc8z1AyhDnCaOyOnRddRaGVCYuhNK/xWiwQXb2jtXU/nA3OTf/q1Vd
	Y+yTuRnB64Gn6plWPMwmJPf6Bn1scuQsCqeSsvniUUulokZ5fNgOKxkOjIvvSINBGbUBYKYJvD9kT
	x4XSV0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJhQ-0000000AYlw-1iPc;
	Tue, 21 Jul 2026 23:16:32 +0000
Received: from mail-westeuropeazon11010001.outbound.protection.outlook.com ([52.101.69.1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJhK-0000000AYh4-0peo;
	Tue, 21 Jul 2026 23:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDm7JyYrzM9FJKOooTW9sKm3kKvfw1eI9vTRSRMJALr3ACVHIY18mWZ65l2wdgFqEopgruCycgEbeV+65iIDruE8Dct6wwGzdoQnwugttL3bX8cBPt6w3aD2CO7rQNF7weLQRxjL8YXnMfB76cv2Ft30N0pEbteiWshqUMpxNy96nSE/Qt9XuMFMLai3LXmhLZvvBGEarM27mprFr+RT5h9SZ6U/B/UDr9uqMo5oskitq8cUOg58DffjnizesJ2jc4ZqCE0H0UXU+cflfzepGyNXsP4len2eOWDu1Ixo7Lz/VfqPeZIMUPTCtpkCEGVM/t8yfh21AkRLgWVBVv7iKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoQOtTW3FtlA8mww2f4TSbIuazq3KdLl8+erw+Wwn+M=;
 b=sx0sUTA3beiv+FwG5h4U6fOs6LvP7HqfgBZ7a8YQjmquuaOV4zhHyarSgfBNCQZncOewBNSSVH93qI7QZ1XTSOhc2wZ8jIjeXrsrrpPx6sGru/4ZOuIQtkdG5WDvjnYwrQms6qNWkM1kyAGKMgRW2cveSdva5gBRG4htIRLYXDnyDNbtxyhR0/P5qHewvkqps+agjL4FAkaGLTymlEegcBN8W4+HfKrMXTAAJjct8YnWKTIo6lb3Mml6ua4LmpiF/Agt/t/po/0I8x+ZNsE5+cfKCvINTo3eTAZa1C9S/vpl3lrg+8K7qBCNPVYV4o4a+36Hh9e0iGo8+GUQDkejMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoQOtTW3FtlA8mww2f4TSbIuazq3KdLl8+erw+Wwn+M=;
 b=Ft4/HPYlw6eVrqXW0ro+2WA4Y2lYCLT2d93bTOJolQFMWbt55RYQFoqJkIi/5uMj3eGlq+LOhqxNmmTXQXvSLoZgt3zPiHNw86Rdw3p790KJftcVq0857RZ6zJrNyLMci0ltymrZlmMGLvSfr4+UPB0w64o6BzmB5iLtL3iWxKy5Z2OfuYHMfqJGUCZsRMaxA3ibw5r38v9pPkbW1QJ2u8Q2oMN2unLNW2hH6rvoordFGD1eAqyMydSKt5tmU6Mg0pXqoNOPlHj8ciIvknlPIDHne0l/MuXRhRoWEG6ID2rmVAbXYznsmO6IxhXU+9Urt/nC5b25JMlazDa0HrEFiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by VI0PR04MB11817.eurprd04.prod.outlook.com (2603:10a6:800:2ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 23:16:17 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%5]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 23:16:17 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tanjeff Moos <tanjeff.moos@westermo.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 phy-next 2/9] soc: fsl: guts: use a macro to encode the DCFG CCSR space
Date: Wed, 22 Jul 2026 02:15:56 +0300
Message-Id: <20260721231603.67865-3-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721231603.67865-1-vladimir.oltean@nxp.com>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P251CA0008.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::16) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|VI0PR04MB11817:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ccd43a9-f82e-44a1-49b2-08dee77e10f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|19092799006|1800799024|366016|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KqMie4706PgoXw27QSQoMFpOdnMEd28Tt+oWZJajSUkXq+2P2kXrTJ9Ag8Fe1iwirscVd0cFn0G52T4D0h4uEqGj9mJ2tGA2jco7Wb9kcV+wLzHisWCJzOv8zsXvGKgAjmOeBwAvBWYlYzQtlIB7CllWef1G09RGHKYqX74UlvFxRLGOFSJ6L/0qwdagZD0QDSEPNTB/HXOnTV9H/bQFELXyQhdpIxSKf3YEcgk3dWjze5MePgVw1bX8Wy18m8hpKwYUw2Ep8oWelbbQNXQaS661x/dWqPupbAkfLlYR50y60sKQ8KYDyUFVxjP9SizH1AICi90Xnzt155R/z39J6n+mdP24XKKvfXWxC931P/xIQxxANWrmYjj1r8nvxBxw0kB3ncnM0Z7fzoy1adLHjw8+m/HDjX/08n11nsXFz8SqkYmdicxzNAi8VMdr2bMeg9BeCCRiBYBAv6ojZZtm0UA2EvsM11yndGX1TDhyzRYoCBS9OpG3mlAFeuFZZehwYsE3Wfae+QNoaU33I7ZNQpJpT20uyVuBSOuvGM+RbzZUMM2EEPN8VCLG4EYyT8Bif5Axnsy9Ec18i0J5jxu26jENwTKDMLn/KwJpu+JnfbISMKd2ynvlJMYvm9BHF92tkmfTXnvMbU8j9B2NRYFHzHhMJbbO9GhF6FH/1+N6RvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(19092799006)(1800799024)(366016)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1XhSAqjxJTRkVenHDZD8NQ3ib7t/M37ACcbvGmtxfK3a8K64uONf7yp1Z1he?=
 =?us-ascii?Q?5bq+2FULjpSVFdqAoiAxl6sANYmwYsv3R416JxsaZx6X5hvJfI3XtfjlGAa0?=
 =?us-ascii?Q?q1z1C968mWtoiC1Fke+Fwmay6UxQcKYpVmp+C+pw4ZTmTq7qJe73ZJN2msSI?=
 =?us-ascii?Q?0JfFXoPgoKa5FBhyyPM8PY7/mCBnmYFcQCyJx8L6u30DmGXzrNPLNuE14E0I?=
 =?us-ascii?Q?Zw92mJUJ/Do/1amNrEa+13uYFKiloIQbmzycLIYuY342wtGmKlGXJEZTxoVd?=
 =?us-ascii?Q?bKo2pugaWGME8TC6c9DLnFMSms6ZzWEYqaF/+olNbP+8XsN5RCB/1gPdC2WU?=
 =?us-ascii?Q?ZJ4/MMqO95KZfGMvMFlt4Ia0GNqxMHKTgwCVvIAbkbN+0UphqEyOrXuM3K3y?=
 =?us-ascii?Q?blCDCnXim8O4qho8Ybr3C6WJtyvEQe+EH4LhTmZg5hhqLJqOGeH3hVvUbuZ3?=
 =?us-ascii?Q?ZP3OQ3fjSoF4ZeNrL2fEpSGpA2gw+C9BldmvFXYpQysx+XuqpcbmwrUGjWxD?=
 =?us-ascii?Q?etGg46U/nyOUhRbt7fcRKjQ/BzV0BBo7dEYAg7PLgmcgXf/vDP2sttJIOg7m?=
 =?us-ascii?Q?B2rQ/LAOMKAX/QrceCm9OQV+rOJIK1umS4zN0GXQoTorKash5Xu8Ii33er41?=
 =?us-ascii?Q?OH6rFM9o2IyoZn1YPoQA8KitJ5KFUTQ3fTR7eNFojVQrkddzjkZz9htRVpTU?=
 =?us-ascii?Q?ydDg9TObNMa9SCTeqz2hWOLhkCjx4sIOYqVsQX9bTO0e9jwHCrAA1/EftHB7?=
 =?us-ascii?Q?bNJo19xIcL3hRibCW1KM7K1pXfE3njwP9s+0sjzAroXs0Vs5bAZ8uuHKDUkU?=
 =?us-ascii?Q?MmQByT/fwNH6x87q+f3BEDv4cXlJhoLqrcdheW0f9OO0ux36VWFn1qeOKEnt?=
 =?us-ascii?Q?ZG+TNhFCPFzHErmVKLuTS1qpUmciGX3jfvx98rfPli8xldbGkW+reo0+MCA+?=
 =?us-ascii?Q?jQGAs0B5ETDqx9GBk1v9L7vZwToZAbBrBFDPkKYUNcFzY4ptMeeHluImgBOh?=
 =?us-ascii?Q?7kUyjHR9/S+CmBiScLWgY/vfkdZcwAexCw6Kp+u0Tp3W2XcP3s6mY1UCIYsL?=
 =?us-ascii?Q?3E3F33UirWJsi5F5oAI+UBNFDmv/0LEQkOj06Jppo6viN9CDIaO7qwogiq+2?=
 =?us-ascii?Q?cIFdcE2/0LRQyMODyOKoEXS/gQkd5l4dUitdtrzOzHZSnKGcsxju/H9bq79a?=
 =?us-ascii?Q?l1VMcSSrZ1QefC28lQADLGPKShB8DQKGfO8teOv6JffSTHSeV2P1IXXdrAGQ?=
 =?us-ascii?Q?bPqxHixA/9ddUtibPGGTVELipkxIKML4S4yEjUrxDMMz9kjlSvidWuSK4UFL?=
 =?us-ascii?Q?pfKfo5G7PAbgmGfCWozgpxmPkmg49AS/KjV0OClXt1gBdy3d/N7MRNeAgXST?=
 =?us-ascii?Q?9S0qIZnjP25rnGqR6HEeIVRvTjvNXysPJGgrg2nT1iAaL+3x+RT8cf3K6rRc?=
 =?us-ascii?Q?UJ0bnIUGo8U3Lxgv7ra5MpFJ5a04S9I3Avitko3nuVz7oiCMYqFsof/BG2hg?=
 =?us-ascii?Q?5UQJKruZBXVjGh0PsgeaP6ERCdekYRzc0CQ2/4UDWjKidXqH0BZ5ofzRpbo7?=
 =?us-ascii?Q?KobsQfitXcMT9mM7HbsdZEcAFTqI4PWz+IWlgq+pCbFtfoHUQKug9un/EW7K?=
 =?us-ascii?Q?9DPCc9ZnzKyQx08J1tPMC/sIDv0/JIMwkwJRjXx8pPJffvsnRLC74gbLDdJJ?=
 =?us-ascii?Q?mwrIrKiuyumuxkI2Kv5sfNkXGfm2ntZeuiyKVvE5fu6oAuNLzn5FbEvvL0Oz?=
 =?us-ascii?Q?9UABp5EXXQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccd43a9-f82e-44a1-49b2-08dee77e10f4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 23:16:17.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKoRkKXOWeOUXtdJ02vzbF9+0TGArJRHOz/xRAzQUbkHc5Le0wdYBR54j8eMSoiUXu1ipcQbGixZzqfGfs5z/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_161626_331658_D38FC9F3 
X-CRM114-Status: GOOD (  14.52  )
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

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Instead of using a hardcoded value when iomapping the DCFG CCSR space,
add a new macro for it. The code will be easier to follow this way,
especially when we add support for the DCFG DCSR space as well.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
v1->v4: none
---
 drivers/soc/fsl/guts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 453456f31800..b97eb80cea95 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -14,6 +14,8 @@
 #include <linux/platform_device.h>
 #include <linux/fsl/guts.h>
 
+#define DCFG_CCSR	0
+
 struct fsl_soc_die_attr {
 	char	*die;
 	u32	svr;
@@ -197,7 +199,7 @@ static int __init fsl_guts_init(void)
 		return 0;
 	soc_data = match->data;
 
-	regs = of_iomap(np, 0);
+	regs = of_iomap(np, DCFG_CCSR);
 	if (!regs) {
 		of_node_put(np);
 		return -ENOMEM;
-- 
2.34.1


