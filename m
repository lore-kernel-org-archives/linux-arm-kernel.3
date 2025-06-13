Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37891C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htS13sAk93OFXQuFmwiWcDYWjm6HCqqIN8a0Z5GaOVU=; b=R0bBcjRIBKvqFxTJGfHwTkVYez
	A70bwsipkVcG9vODdfSy1/DGrMROTb5S2XgidPwPbiE1x/ikwGVdUydFC4QmfbkGX8rtnKT2A9vZZ
	gBRZ2vLb4yp7vFRXE30VUnujUyeB5944Q9rqxwbl6wi4bCehfnYlmbGE2TIP0vcp7JxCj9Ircet+5
	Vjwasmbik1hf64o97JMUsAbP04QWuvvgootbzSn9XBAZijiFya3s1j1HG8JL3YqZtUxQpXtjW71is
	ZesZ1KKW1k8O8VQu7t76DE3zZc0JZrtRa4vP1U1QVf7qng+RSAHs74rn2ePUh5xuZ9mZ7cqC+h+L1
	y9yeFteA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2cS-0000000GAhE-0XNP;
	Fri, 13 Jun 2025 11:30:48 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1JP-0000000G1V2-1a6p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 10:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXvdUTIVJjWeRi+8KVCN0r/2b53QZ8q3Zt+8l0HdMhvIv/KOMBKt/lmdRHtjhEoSx6oBM9y+Ul4SBd9mfJGUDUjXcg0NBsQFHqt6ZZgoia4pLQxKUEIk1vZZGIYtVd13d7mfh4Ran2TF6B1m0j99SMgPUccsbJCV7jFL+LDdGe4TcvJd/4WxeMzB9uvwYoSX3yO0vXLyyoq1QJrJmH2ER2TpyXVRBo1g4N4VZJQq0/iKnWevVU+usMAMB4rLmxx01wT7hIzttQ0qpdI0SpSVEcJhErhjHXVEvmTxLwPHSNR9Lzo5TOYh7rqs32Jo+6/fSDAB9o/ANLa8tzF7OdDLsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htS13sAk93OFXQuFmwiWcDYWjm6HCqqIN8a0Z5GaOVU=;
 b=IjZwl2WTnHy2DGIipQaoLknQUKZm8O0nDoQ3Bv9J24wo0iRwQBsucNrw6RR5n+yCPQin2rfqHEqCJ7pwKozg1A8AW+vpPDQN3/kMi+jRBirjCoPQzlMr2iurU3IhjPZYQzIF7TdZBhYf67lElUmAo8jmL3nAekLMWzOOewXvng+BSJCkBbIwMFYJgi7BwtQCt8mvIA3WL1SwWpOo9jh1EkBM0/eXx2O4KrPd2jn2mn/ZyWyb4ia/dWor1ny/Wcoj98jMSNVNBcnMj9gfHIzNF6u2SovFofcqIxU2bDR3mzAg/qoedxd9V7tmGTo3OIGfJ9gYA4Wst3/sw0ue+NTyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htS13sAk93OFXQuFmwiWcDYWjm6HCqqIN8a0Z5GaOVU=;
 b=V5GtXmNtp4ofToYz/uGFUAwuymClfnWNWd06eIghhEhwL/wr/5Twe57yqMr4oCXkTw6YWfHwLy5mAF/oQNFP0W9flvFON9Wb4vms7hFDcuRDrxX1fwAD/dIl6WwFd8ekOZjiOfbXwaVSwpBZ3afyCiSDflJ3RYuxBxKls2z1hNENvHTErxxb4sbyIt1mU4N8G6l/BX3aACGmsx+9PyHKZXBlUlSek+T4+hwl2OaWvKTgPB/3cSCLlxh3jZvVDa0a+c9lprfUi0JWRtCeRT4ic1HOHQZ/l0nJIPgW1c2FZGL/a3mLBPodShalK1n4gZkqZudY+KhwJoxNbxu2+/u4Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by VI0PR04MB10568.eurprd04.prod.outlook.com (2603:10a6:800:26c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Fri, 13 Jun
 2025 10:07:00 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8813.018; Fri, 13 Jun 2025
 10:06:59 +0000
From: Joy Zou <joy.zou@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	catalin.marinas@arm.com,
	will@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	ulf.hansson@linaro.org,
	richardcochran@gmail.com,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-pm@vger.kernel.org,
	frank.li@nxp.com,
	ye.li@nxp.com,
	ping.bai@nxp.com,
	peng.fan@nxp.com,
	aisheng.dong@nxp.com,
	xiaoning.wang@nxp.com
Subject: [PATCH v5 8/9] pmdomain: imx93-blk-ctrl: mask DSI and PXP PD domain register on i.MX91
Date: Fri, 13 Jun 2025 18:02:54 +0800
Message-Id: <20250613100255.2131800-9-joy.zou@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250613100255.2131800-1-joy.zou@nxp.com>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To AS4PR04MB9386.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|VI0PR04MB10568:EE_
X-MS-Office365-Filtering-Correlation-Id: baefc07b-21b1-41dd-1410-08ddaa620944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z2Z5HTj8t2n+KJumu3wJ8ruxyz5GzZS5UbvlhMIb04k1nmdFtQsTqzvSGfZS?=
 =?us-ascii?Q?GlFXVNTXfXNfxdXf2gzbKLASrMLegp7aseKgf6UIZ79UyFdtTTsBvifAmgK8?=
 =?us-ascii?Q?UjulfmKfsSG4S14itJhV75oqF2V3fNFtvyicuK5nK3oj8HvHICe+uJyIii73?=
 =?us-ascii?Q?7cGCeP2sf20HhPJR3dZHn3v0wJh7PUvWPe5GyiKsmantppvSPCQkX71nRMIM?=
 =?us-ascii?Q?OBLKyFyElczh2yqf3PzYGC9yq5pSEAseawvFIRbXbBhytqAbOm1U1rNtVCP0?=
 =?us-ascii?Q?rdWMynnRH1JBt8lkUYeotGVOVN55TmR6r/mWsJ8F8zsUNV9IJ2BAIS/tbhYU?=
 =?us-ascii?Q?nnbj3j0wJpe3/5Mc4UVUq76AByd2TBoOl7Pv7GRDv8fs12IFV4687dmjzqDE?=
 =?us-ascii?Q?FVESmFPKjzXQ6G/Yt/nviDBFjr6FI9PXszAOj0imavc5yX4zw+Lz9s9GvjmD?=
 =?us-ascii?Q?tkIIBYJQhK1XgK/cxGoB+DrO1DlTqCkNnpHERWZmRFP/6oEF3I78NKsxlInl?=
 =?us-ascii?Q?gjJKHS3saewnJPUmZGbir1zdXpPnCkOF+aaUWioknihh2TN7nJzsvhC3/xaf?=
 =?us-ascii?Q?lKyO8HZMsNYUldVReiiVCJso94wgw8v0Q3cpG7B/RvCQUZuhl0g6ys6xLi8Q?=
 =?us-ascii?Q?He/osBaqizVhpPVl91iYSBwSFWBYDtDn3eLbK1fmPj5Ettl5i7STNuZW5vgq?=
 =?us-ascii?Q?Ot5346RCVhrZWrtPBJuCrqYZo2iMC3SnRFENzQjYtlZcRwCWME8RTqlbJBWx?=
 =?us-ascii?Q?YrQwFqPulTBnC4X4NxOvJ+xOEyybyZ+yzqG7TBSL1p9wT2qKsNxd7/jx/uzn?=
 =?us-ascii?Q?8SlYw54aFULX32gvQuWM80ANe9I07JK4fsZho56/g8GYooNW/sTY535cb5OC?=
 =?us-ascii?Q?d9PdxgKUa//KbnjJl+SVuIdla8f7ib4aYPF2kzTsyH3H5e7h7TGodArHMUX4?=
 =?us-ascii?Q?vmckJvDv9IiyB0Qq9AcFqhCrSK4G+dOEKZWQWftLgpIv70Y9G+M1445nOU2Q?=
 =?us-ascii?Q?kdxrz/Nx2A7F3INpmmXXUrhhNPzLJlZrhOt+vs3qZbzium+nbv/NMDe7FHMK?=
 =?us-ascii?Q?L5KeFVvbnSu56GTJhiJIL7YFndg05u9ZbROiPFnU4Z7HtNWCTuvrVkRZ6mH8?=
 =?us-ascii?Q?oFR6ZJ7MpZTc6oQtgx6vu40+lWWMNqAHqC6f68KPbgWW9fSGPS3P+whfNQOx?=
 =?us-ascii?Q?POqRcizTHORn+RSoPjqXGdCs17rDG9X018t2jw07JwrmrKsG5WAvJC20Rksr?=
 =?us-ascii?Q?K9yW3d2qYMngTbY62i0HIdebzq+8W0y784nShVximo8wixjnhr2k9+/Ureeb?=
 =?us-ascii?Q?xvNNnlU7ZtCyTSH/xCIZm2ETXIYEJhLuKOn6aZ024VWR751XPT0FaOaXQ/FV?=
 =?us-ascii?Q?zoyLKQxuqHnQaycZLX051NagIFQX0gS6DK7UoiIFGvN+6T7Xf6CIdqcu2ddc?=
 =?us-ascii?Q?gGsK5mDjNd74bsn8pCtC5b8dSFHoRGb6AJgPTc8RBwV+VYe2ZFg8sMSpaZgf?=
 =?us-ascii?Q?vuZr6dh5AoyvU8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UywQ3qRQ3YxMbCfTTeveatxkKkFaMfFw9Sr/xADTUBjzhRBoOAafnvdNhdTg?=
 =?us-ascii?Q?UGRajeKCHhFkVIPSS9/JqtqRO8bOeHnJu8qE/UE5ljeyKgo3qRRMrk8EfhMV?=
 =?us-ascii?Q?5Kgkee9b2eF0I50B22Zi+A62iAsXQsyoaokuhk4qE9NRmfntfTo/vNXMxvv2?=
 =?us-ascii?Q?y7WRQrRrIdeq8HXGvBInyJAKVbAtUS6XCg1nrI3lNDGz5cmTCH8yOc0wV9or?=
 =?us-ascii?Q?EFwq9ZzqApMvkPauLS7uE9wuJwgosfwAF0ymimD+B96CjCwAP/GDHBHu7SrX?=
 =?us-ascii?Q?UHhfqjKkwANfDiJVsZJvaVn6q75wDs0SfWL+JzFE+h9eGWmTug+sOM+5knEo?=
 =?us-ascii?Q?qSwtXzawnRUSF9S98vmrnI1M/ZpWizJG0ddgtSS3c/nKCZxBQUf9kghZ3lOy?=
 =?us-ascii?Q?9pfM3ce9EBjgO2RB3qe26ypA+02ABVLqCSp4QjBuGD3j0TC1gY+HY0cwhzsH?=
 =?us-ascii?Q?uBu2aNr9AneO8Uk9x5twoe6GL5ZTAe3zFhmSaHME14w6m3QPx8WSqwBCjdbm?=
 =?us-ascii?Q?vJXqw9iBSnk9Td2M4CJX3Ml0dsVic9HcyOKt9wWIV0FIK45dhLXc51CS/6aB?=
 =?us-ascii?Q?lUDrQIzVNb59qpOgMpvQzWlrMyKkjSEIexEPzy60pg2izlA/cqb0oA+Qsh0F?=
 =?us-ascii?Q?ySHma/2IQx1guRqcj5ZNIVsKhrxNLnZ/cL3avLjjT82XqwA5xZEJupxGTB5A?=
 =?us-ascii?Q?XHK8SwoWH7MpT4ijmxuxtOHXKcsoXymmBvLpRM1E581OBuX92bTXDds1Wpfx?=
 =?us-ascii?Q?q/LMmKjEr6DmV4wFEARxxSvY4DSC+2gGxJ6yQck48wa0i8TsLLNjpiDuIgzL?=
 =?us-ascii?Q?D4s1/uCbyP6aQ5UnBHoRn54XfDf15hsv+WpM0rw1n69Me9SbIHW1eNlsMnef?=
 =?us-ascii?Q?4Ub4fvfALTATDioa06vdBCzW0xcsnF2xfYSkg4IoQ4JLA22SsLVWDVDia/1J?=
 =?us-ascii?Q?yIipMiUVxdZ3yujsrkF+oA0DiJmeOQeh+lbAgZwFJ9uKZrp6GdomDkP8nu28?=
 =?us-ascii?Q?ZlliQ89QU8+BhyEGhdVOE+1pDfJOflPg2qJgiKDCesoHN6Wg2gGck+6M9Fhj?=
 =?us-ascii?Q?MpV/rDy+5Q987pSyYz4UxqIMMP2nvuvmZPci7TgrDYcU2a8oBHiQv3S5Kv+a?=
 =?us-ascii?Q?Ad6FAKg3RiXCEYL/PGU2jeYvpfIIasiZVln3huwTYtxOLZRdN3nhg8iMVnOB?=
 =?us-ascii?Q?ptk7FASG2cBGSPMDCTSTFsGt7wg2BwGUTW2kqM/uHKYqjQtppITDT+PVqdXL?=
 =?us-ascii?Q?BFshykYY+Fc3Hnt5huPaNthz1Caq0AGGJ2pJbzt0hgDGDMjVTzzudZgRwZdG?=
 =?us-ascii?Q?Ne/w2rAdWVrxJFIUNT4oq/Z8PElTpMXX1BQRjSBi4v9i9FCuqWSGt+YOgm2X?=
 =?us-ascii?Q?nbYPQ8Dn3Rk2c0u3ExipgFx69un+Iha+UwqXzfqeBZksaTx28JKzvX9kL3jo?=
 =?us-ascii?Q?XqtUtSN4JQrKrwCMNKzbO9/Di+q8WOjrV1rnwG0ABlGOZlms1ougZaPiBY6X?=
 =?us-ascii?Q?MoPidDf7hPp7YHPv5W7wuvm41hrXDiSUf5Msvo75atzOBE6QN95afn9kVP6W?=
 =?us-ascii?Q?GEXEO0PaJim6EsdtRoAODnM8biQukbcwf0rzULwb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baefc07b-21b1-41dd-1410-08ddaa620944
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 10:06:59.8846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqlwGXhDk8x8nm2r8OE5bIucvSOr9OS+SvE5Wqy+nOsLIpq8JOCHACXpiSVDmLma
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10568
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_030703_424655_BE12DB95 
X-CRM114-Status: GOOD (  13.29  )
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

The i.MX91 is derived from i.MX93, but there is no DSI and PXP in i.MX91,
so mask these.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 0e2ba8ec55d7..04014dd5bd84 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -86,6 +86,7 @@ struct imx93_blk_ctrl_domain {
 
 struct imx93_blk_ctrl_data {
 	const struct imx93_blk_ctrl_domain_data *domains;
+	u32 skip_mask;
 	int num_domains;
 	const char * const *clk_names;
 	int num_clks;
@@ -250,6 +251,8 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 		int j;
 
 		domain->data = data;
+		if (bc_data->skip_mask & BIT(i))
+			continue;
 
 		for (j = 0; j < data->num_clks; j++)
 			domain->clks[j].id = data->clk_names[j];
@@ -418,6 +421,15 @@ static const struct regmap_access_table imx93_media_blk_ctl_access_table = {
 	.n_yes_ranges = ARRAY_SIZE(imx93_media_blk_ctl_yes_ranges),
 };
 
+static const struct imx93_blk_ctrl_data imx91_media_blk_ctl_dev_data = {
+	.domains = imx93_media_blk_ctl_domain_data,
+	.skip_mask = BIT(IMX93_MEDIABLK_PD_MIPI_DSI) | BIT(IMX93_MEDIABLK_PD_PXP),
+	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
+	.clk_names = (const char *[]){ "axi", "apb", "nic", },
+	.num_clks = 3,
+	.reg_access_table = &imx93_media_blk_ctl_access_table,
+};
+
 static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
 	.domains = imx93_media_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx93_media_blk_ctl_domain_data),
@@ -428,6 +440,9 @@ static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
 
 static const struct of_device_id imx93_blk_ctrl_of_match[] = {
 	{
+		.compatible = "fsl,imx91-media-blk-ctrl",
+		.data = &imx91_media_blk_ctl_dev_data
+	}, {
 		.compatible = "fsl,imx93-media-blk-ctrl",
 		.data = &imx93_media_blk_ctl_dev_data
 	}, {
-- 
2.37.1


