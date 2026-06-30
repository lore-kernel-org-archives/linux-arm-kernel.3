Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B61C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OG08D5wrtCfIOhsP3U7mCptg2oJxI4aSDnlba/3MQlU=; b=0YEcgbX113onIr4TmUiRsVaQZG
	UFEogqTd8tZf4z4zZswVSY3hIrCwkqxOL7KCmahxtqb1yQk3Pz0VO+oUXYjhCmtzuXj6WABXlRUXK
	2tTGjrXVNs2OT8FYgaWUn2XXUH2Idw6fI+6oeeBy+JuofWDd7JzYbClXkUZIpozvMwKTfoRtqyGaV
	BnTvs0twtaPUXZZhScwn1K5FjtPPor9IVXzTutFofQ6VRrtqUcOW/BgLRPKThLsW0mwpAV5f3GIvb
	h7n8oWGDycvi5aZ1IXKUsoIYBjMiao4L7/G8qRRsZRdIdZkkmKgm4mkoJ+P05tr7abq5/t1+qvAj4
	tr9tI3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVOZ-0000000Ga00-0YaI;
	Tue, 30 Jun 2026 10:08:47 +0000
Received: from mail-swedencentralazon11013061.outbound.protection.outlook.com ([52.101.83.61] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVOP-0000000GZvN-3KlY;
	Tue, 30 Jun 2026 10:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/FCf8q+MjybvsJ4rIwvuHj5TAmNdUKSLaDLUahkk8vms+t8osYWuaEgugh1zDp/yFQCRIR2Wl4bYHoDPsKVxSYmIj1vXeCLnf7XZx4XVU1oL4AnvLxqyBDfK3t4PZ0UOriEr1yEq3euzTA5Ou19KNp9y8vwWv9gqQLmtzTfxFNfHuTyFFzt0hXZgUtuTKvskZI6TVFDf+b4yAUv2QAHJhWOb+NzZBDDXPx6XF/5WLsqaVHtLmeQ8YStrxtO55cZLIXdiSHy0MQChPcbBqzWXzkUinigGjHuvzGY6RId8feyI2n1JSEqnhK3EqdFnKyC4o6s2DAj2mWRdulg/MBCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OG08D5wrtCfIOhsP3U7mCptg2oJxI4aSDnlba/3MQlU=;
 b=AIF6rFc5c876f0hulZ2g3wGpaLpE1ZBs8dpC1d4d78H9BrELTCyEaOgitrWUZWiChMSOCx7uz+JeGy+z2+YzRJkLg3V3JLc2/2zHgcQOskiZenPA3aGk8skD4kqEyjpIW8Mvw3o9fbULyaJ02ypHyW4sI7H/zmLi8nGDXQErFpAf49BDdMGRIxoKo62bJnXQkmlN+GqqZvplzYvgvcF7jfSa3rxm8miudcZbIvQwrdIDfu1bULl+MWIKSddoCy1KMtXWifd08O42OEpvopnY+Ge+05OEiTojeeMEIYHDYuXXGxZVkRpXcUaC3gkHdqfxNRmZPKTlMGDRRHBJeUjrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OG08D5wrtCfIOhsP3U7mCptg2oJxI4aSDnlba/3MQlU=;
 b=SvXHNiQel/k6tYcpcejRKKhbme15HsoVEK7Dq7w5gah8BkeacxmUHbYljKom/ucQhRQKXK9qp0w9lu7IcYkePJ14caHx9VZwDDLHnq7jmEicvbTODsjbDVC3comn90z1EK+EcIyc6z778hv8JiUfyY26iv8hl4HmbodNaiegeDG9qhj+ra9M5TGZsWoDXGw0+cUmP8ouhCa1FOS+1shuO4iyCXlByjE3SjHzMMAwMxWGXR2jjGJTUFEr8cXEzy+BRAZXmhrCH3iBE5s+PFbPsLfewERSGG1USnN6gVs5OJv3S3Vi6u/DmkOsgQKck68EBw64WvCFocLZ1cEV9ri+zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB10991.eurprd04.prod.outlook.com (2603:10a6:150:206::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:08:33 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:08:32 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Tue, 30 Jun 2026 18:11:29 +0800
Subject: [PATCH v5 2/5] phy: fsl-imx8mq-usb: set usb phy to be wakeup
 capable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-imx8mp-usb-phy-improvement-v5-2-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782814305; l=920;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=uqLwqH0bDp6s2Tpup29dEj1L0kBLIppvUQXYTYwJB6k=;
 b=NtLcXE12imSdvfJ4Fbw8GZgfwMBpUCvExUTcGvf9iWKf8kGqsXxvxLs/+FAqK3k5+IaQlCU4k
 nU6GPOEsCjdBHjTfOVuEgDEB9PZC1rqoaZVDm6QOcZy4Kt/68epD6Rd
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB10991:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a81215-48ba-4dfe-33d6-08ded68f89f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|22082099003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: 6Bbjvs7qr/StNDU/LDq0u6VY/6zIhpnqytUakYz1pxeApvw0wXT06LUUs5SpaI3lPWr93HqXj9rb/m71AdRI4EOu9004BewyLm789NqtYnUNBroHI6akAnQ2pT/YiCCersX+p3Y1twL6kNpZMFjUicbwgZr3yARIqVbWbp8r0vIAvD25SuSSRNMb+3Ys/QERZCJ9bwFdL+g3+BPROVxsN0pssYRFhiFkTbWZmdjLqVwgyrbrayn148hJahLAzGIuwY7wJBVKbJ3LHluepkbNXIF2SouO3tqld0dWdpqOgJFQBQfBFbW95aEBx1oGsVfOodpe30gm+PvKlejQZEw6or6rW7F5vlLqrvQpG5z8oGyTvKfDTLcy490fCnxFuZy79dj5rR/wqr1QZp7HfeEeEMxHkgnvJg5RoyQOlvPTVBFEhmjihw40RTmU21gtxTs5r9BdX9UsgDtwRkTmqf8tS0Ue+cUyLwWwWurR+4W+xMxjSRZnmMyAa97z8jEvfoQ/3USkt5d3+KpPWji18TiAzC5l9JwTu1a/NitZg+kEMaMNZNra9Tgcn4/OLHX4KFXn5JJ9k6Aak2bFDW7dGSACIy04gwPQMya8L9DPwUrR1MJ32fwfPWuYOutQfgRWJPgra7SprZvSlg739LqhgA6siDxNgZ7nu3pqKu30A+DJAqQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjlhWmR1RFNNejFpZFgxY0dZK2JsUnVSUDM5TENXa0tzTDZmZHhiRVZwZ1Fk?=
 =?utf-8?B?NGp6c05HWURnV2FTekpkSVNSUkV5QjlJWmRsRXJjeUhORFV4TDFqWjFVUDUx?=
 =?utf-8?B?L3c4akJjV2lSQ1JPbmhFS1BYVWRYNGg5eUJsdlpHcnhuUlA2NzBPQ3J1Qm1L?=
 =?utf-8?B?bmdsLzVFanlzUVFVRTNTOStQalJYaXpMZGthaFd2WFl0Vm5ia0pFaVJhMVNL?=
 =?utf-8?B?ZnAwaVVDbElqYkVoME9MR1JjRXErUDQrQU9zVEphODJBMkRhNG1FdUFxdmp4?=
 =?utf-8?B?M0tQcUlQcGt0N256b2RXaHJIc2hVNWVnOUdpc3RkaGoySmo3V3dESzladHJM?=
 =?utf-8?B?cGVIclNWK2l0VkVvS2NoOFhZRCtza2JNZWRBNzVNU3lIblpxUWc0TG1xZEdm?=
 =?utf-8?B?eWg2SE1wOVphRGJuSEplcE8yL0lvWHgySmRzdlVaSWE4VUZiZCt2cy8vZEhG?=
 =?utf-8?B?anNQRCtwUE1KYkRHVS9EM2QxcXdFVmxOV1dKRXlFQTRGOFNrVUFDVFF4OFY4?=
 =?utf-8?B?ZWUwSEZJQ2VoeDBQQ3l0U3NCYjNWajhoVEI1d3pPemlaMkF4Z2dZTHpIZ3JN?=
 =?utf-8?B?UWY3Njlrc05EMGNHeFNram5ZdDdDODJLOVFWZ0ZURUE1YW1BOGlwZmZQYktH?=
 =?utf-8?B?Q0wveXoxeTIwdkhPSW83cFBONW16Wi9KcHVLUUVBRmdzUStTYm1qNytjaXZz?=
 =?utf-8?B?TnNrOHMxQmp2RU9Wb1U1Q24vckpta3ZkRnk5S09LTVNDQmplTXAxcFFqVllE?=
 =?utf-8?B?OGhlR0pkbFhLVnZDM2ZVdG0vR2pzYTVpbklQU0VmVTRlcnRqVXEyUXlTWDZj?=
 =?utf-8?B?ZWJPSVlwbXdmWkkyZTBlcXF4WWIvZkhHTldScDRYQjhNZ200NHRadk95aENz?=
 =?utf-8?B?T1BlRWx1TjFGT2RhRTNkMlRCd0xBSC9TQXdVRkVPblZYSTZYemNUb0l2c3hl?=
 =?utf-8?B?SFRqMFRDTEtpVlJuNys4akNTUXZXeExMV0hSZjRtYlh6M29KTFlDTzRHWTRR?=
 =?utf-8?B?emZsTUhudUFLVlNXaFJrN0lzL1c1cFRyQ21KTEZsd29zRlptRjN4ckRaMEJD?=
 =?utf-8?B?YXRkbEZBTHZyeHRLMmNORi9BeVNrVm1hcDJWdmlWVmZhZXVOZ3V0dVBIazl3?=
 =?utf-8?B?ZFR1d2lwSXFpd1k2eVVqV0RGaXovbi84MDkrRllCbGRSSk9tT1k4cFgweGQr?=
 =?utf-8?B?dUdnaUxaa2J4T2RhQ3JKVVR0Z3dsZHhFMi9sS1ArdjlOTGd5ZVY4L2JXWFJU?=
 =?utf-8?B?WVdtUVdEc2VDeGQrelJoZE1tQkJSQzN5S1l6ZDNTOEF3KzlKamFHdlNRQmQr?=
 =?utf-8?B?bmkzMU0zSG9HV3IvQ2JuZlAwQlRqRmlrWElpVUxXeXU2Qi8rMXUvQlRSdnEx?=
 =?utf-8?B?Q2ZQUW03WnNzbDc0WVBQZ0JKZm1jT0p2ZFRpTXZ6TkZxU1dzTm9YVVUxQVdm?=
 =?utf-8?B?SDZRcXBwazQ5MEs3dXBld3VNL09MZEplRnRhZmNxMHhHWldBREFlNjhKaFpZ?=
 =?utf-8?B?bTJQRlQ5KytIdElvbnpQOEkvVERDdzZQaHBWK2pJZWVZbDZFYVZ2U2ZhTHhj?=
 =?utf-8?B?bjBUYVhyMUJEbXQyRmkwWnZJR3RjT2pTZmJRU1dKbnhCdWFxYVdQUzhpS1ZB?=
 =?utf-8?B?YjlDREZLak5PbnFkb2Z3U1hLeVQ5NFRkMEtxeWZXL2xmYXlNTnozYld6SkNv?=
 =?utf-8?B?K1dTd1I1bmd5K1NZR1VoVE5ickd3K04vYXd1dHBZOHNTeFJsMVpHSURBTnZB?=
 =?utf-8?B?Z1p6WmdoNkVHbEV2ZGd3Rk9IZTRqVlgyeUNwdjVUcnBIMWQ3dzl1NU1lbWhO?=
 =?utf-8?B?cyswdzRGVENMM1liQkhzN3kzZDcxajhyK0tpZXVCOTJ0TGREajBseDVacGpH?=
 =?utf-8?B?VWJ2V2cvMXJWdTc5MFJjOU44Y0NEWUJMSXNJWUZyMkdFQUtFaUUyZ0tCTHhm?=
 =?utf-8?B?YTN3ZzM4RjZqaFJUUkJyQ0srdmpEUVBGS0lMS0x1bm5GZnRoMlNyUVVvVGhz?=
 =?utf-8?B?cTRYb0pXdDdKMjZ5RURVWW9qOGo5NUo3b3BqTUJad2tVazZoRG0zeENGa1Ex?=
 =?utf-8?B?SjRVempZYkQ1MTdKTE5OY212VjFpcFFGQ3ZobkF0WlZIdUk5SUE4eVBPWldq?=
 =?utf-8?B?TUNkcC81ZnU0cGRQbGZKMXVwcWIvWFdVd3hld214NGs0RzZYc0d0dXRGdkg2?=
 =?utf-8?B?Tkk5cjBBK3Z6eEtjUzVBR3VMSE5jWnExa1hnaGpERHBOMWNGcU1HOHZPek1T?=
 =?utf-8?B?MllWYjZCVVRzZjh1RlJmS0pCTlgzM2d5TXJaMm9XOTU3NkxRL0NSeTFSQlJV?=
 =?utf-8?B?KzVKNDZsZTdUZjQ5dWNSMHhUY2t2dkhZT3BsMXcrK0F0NVBwN012RDFQY2hn?=
 =?utf-8?Q?dN1LqfJvS+qUSAoiH1JUsp9iGGdaQyZULiN9d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a81215-48ba-4dfe-33d6-08ded68f89f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:08:32.1282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMnp7hdvEVtPoW8OUAJPABy32RsIJB9dzbk2pKXColWT5jzJ3vzPTnSO6FdpgYvL1oy5fiA3JenviTj1MqlKimXaEUiw0q2D/qYNEk+xUd2wqh3GO3XVfQg/Ug1zOuJ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_030841_384996_F42965C7 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Xu Yang <xu.yang_2@nxp.com>

Set PHY wakeup capable because this PHY supports remote wakeup function.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - no changes
Changes in v4:
 - add Rb tag
Changes in v3:
 - no changes
Changes in v2:
 - no changes
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 9a33c06d6fc3..3a5788c609e1 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -728,6 +728,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	device_set_wakeup_capable(dev, true);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 

-- 
2.34.1


