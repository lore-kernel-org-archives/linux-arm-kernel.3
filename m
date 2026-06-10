Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B9ACD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/7g0bnPaLAzgS2EGBG9zFiU+UFGCncCZ+lGW6n8Ub4=; b=G1Ge5rbhVCvaawGe6vzbL3JozS
	HZCPSdkn5/u79o8AiVny5lI0Bt1mt5XPVuBgpN1X/C6emnY1hsHrvTSAtms4/2y9bkS8BktwLD23h
	qiH0oWiMqzOprltfBf3ue3ccq11sH65pIHDdKx8NuD/mG867PJEh4ak0bVmI5+Whs1XZ+blbRvrSW
	utfTfvqNRxJ7sShReYmOugyZEcnI5fLBwIlhflH6NVRZLq4OlIPSQJ1Z7NW+uwFlf2u6gB/rPmH+Z
	v8iXq5m4+LHemrOqDCOTZjZEi6GhLicQNnk96OkOFw08AhBNcZl9M1vdDna0hIiVjuqvWSu8FRN6G
	ELwcWmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIsq-00000007lLc-1wMN;
	Wed, 10 Jun 2026 13:22:16 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIsm-00000007lFm-3tOj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 13:22:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9bp/iw8A3xIXUGRiPi1K6uPYu5dBfnbX+eeAAnePh+3yKcmYytw3ixeLRgk+LGMncXv+48NJaNnqdjFh/nv7OfZNSNwWecil4/k8NAddC+0hoHLcP3294PYq772vuZtW7X/0rtnXLffxsznB4JAZumO01YuCPW/WgOeWSz0904nHIUKoDsKXbuR/c/9bNuOqzcYYJuWjFLEk2g7NMFatTJVzTEZBcH01YoV2PuYU84HHAnBJSh+MBImzpjuhMRqd/s3jItVeK/97FjA4Fzo0zpX6vUzZbXnG6Zl47Tx7vjvR7fi6m2T2N+hLhUMCwkAp2i5arD7odT5INDh4dhF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/7g0bnPaLAzgS2EGBG9zFiU+UFGCncCZ+lGW6n8Ub4=;
 b=V5J+svneWUl/ufD0mV2rl+uV27xyrGwmUA/beW+B1GbQgMNpxCXCRpiRqsHiCFGGQA0koYKzzvnk/LDUre8V8B0RbWzLzkcfeIt8aXfHqY6Pl3JKXlYdcxda+a8D89NYpDOJAznijlQf/oYtL4CrHzO/vDzBMVNbOX9aRg05QyQBIXa++qW/mG/G65KNK9je4xw0nFbacXNQ28GipV56lJ8HiLCbHCfQ57RYZXNloeREKX0/5DyjwPRHsDJyQxWRc6TZ9TIRcYYwaNBHbpHIV4cx8amy2KfVkc0l99jL2e9JHCsZDVUeE91mIFVW9VkRlnmilDQ3ImctBNmc6rC5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/7g0bnPaLAzgS2EGBG9zFiU+UFGCncCZ+lGW6n8Ub4=;
 b=JZHGTGZAFXliWkY93l3xYpTApZ3dJ0STCNbZKFOOk2tEHRvL63ZMmXX+4XiVs+VM9gmCmLPZ/ZSy3m+atoXEWDdiLUSYdniYQ5O0p0GP4q34HSghpiUGxu9eOejAoE09KjiksDzOxp+n3zZJfd8CFpUqChCu3kuwAxYS2t7HQrE7ffv5hhLAx/5ZS6Oxp7bRRaXdFp0d4p1y6wK9eN26guetqmllazhlr4XqK+ksz9kpmeSUsASSw7Mk4Qe0Lr/zomvI4pOp6bjx3vJvBOyBx+z0J4UdFEM1Rj2OuE4MtbHQTrMGs9C0/d6ceHQg4AIp5a/KoZOgk5kGm8wC8cJnpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by DU0PR04MB9658.eurprd04.prod.outlook.com (2603:10a6:10:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 13:22:08 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:22:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 10 Jun 2026 22:39:10 +0800
Subject: [PATCH v4 1/2] pmdomain: imx: Fix i.MX8MP power notifier
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-1-ea58ce929c84@nxp.com>
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
In-Reply-To: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com>
To: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::12) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|DU0PR04MB9658:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fd18c7-8b5f-40b0-6239-08dec6f344fb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|52116014|1800799024|38350700014|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: e8s61IQrktMFtmM3L62T4QROsC3d4seigfx63hqzMkSZ+vvKBzKn7biWTjzmlAvMbdReGRssQoL9jeesq2mp1kcWaF7KFx0e40zU6DqzoJwmOvnXtQxFsQIYXwRAznqY3oMUrC1mPonEATlVC/BACB2QZcqSNGkFQdoST4dX/KKzMwcOw/NnOO6kie3Q3o+D7GOg+s5NsQyhA7NT8t2Xa5uCgKg/mGy5za7AyDF6fwUMW/zxC23U2haosyxJmfPPMvAOzugxmXKIvvEYbHBmh4xd+L8cizCVqXWRuno9doEhZY1BV/Rtt/x3lzFbDjMr3dXiYMPV88ZXgYOILnltAPyfcs4Is0wAVlLkFPFmnRGJIZj+kjqVLMiSb0qQdv+aaXv/pgJ/sfWjQBo1IRN9eFUcP0BonP+544dUx1P+A8LBn+I2/ZCX03E3AxLoEBAZDch8Ww2MnVECeHymVr3lwcKFko3ChppKnodFzhx7NY41FbDm7K96eFX2HISz41Ht5uP7jJYhRqHSaLr2RDznaWp0QZyj3oLxM6EZXxHlOiaaKxZyLcpoOmTgLVwMv7O/tNJv9uBncYTeTr1HcEyg62N9zDGq16ghWKS3yo793FYFLkFRcPUog1aW5BRum7qAl+nNooW/1GDXetBMBxU1bLOdOady8AYYdipoofLmMVa5MiJdsXS4e8hub5Z/hAsOGmSh98a7WCbImJkrDvXaAugOFvAEBrvFNooyiLdYZM7gABp7xsBaEj/QJ4Gl12RF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjBiUXR6dHo2dTFQQXRlcGs0bXVKRDhsS21hMFBZNGlNMXRVb044cHdFSndR?=
 =?utf-8?B?NTBXcUhOZTJKTE9sYTgxUW5XWWo4elVsN0dDWW1OYlpYcGtGR0VHZW5KSmRZ?=
 =?utf-8?B?eElad0hGSFlSR0I4MXg5WmFXVzkwUVkyejlwZFcrZzAzUkxzQmFrREVCZ1lq?=
 =?utf-8?B?WWwwdThES2xMNk9Nb2R5ZjdpSTlRS1V3OTc2cVFvY2FGcFNuMFdxekl1RkFq?=
 =?utf-8?B?aDZ5WG1KdkdPY3BPMzU5SytuaTNUTUV2dWlvVmkydWZRRisxYjd2Mk5lQ1U0?=
 =?utf-8?B?VHpsdHpHdDBpdWFkMEQ4bDVhdjl2MTIyK3B3NFNxK1F4MWUrSFQ3WlhqRUpl?=
 =?utf-8?B?YWI4OTdtUzdWVVZWZDlmKzV4OU1XMDNGNDd5TVQrcEZsQy9UMytacXF4OTFK?=
 =?utf-8?B?QzEzVGs4T0hTMTdzRHg2elZFOUtPVmJRenRBZCs5MEpKSDYzZktBMXdwR25v?=
 =?utf-8?B?ZDM2aGNoaVJzNUFERy9jZUVpNXB2b29ETWlXK3dtVlpSbk9UT1hFVTcyNEdH?=
 =?utf-8?B?ZHh0SFpZUEZRYmxvc0tLRXpKZXlwYUNQNzVyeEIxMzhKWlVBMUVFNzVrUHR5?=
 =?utf-8?B?MWxjRWJYTWZoNkE5VXZaWUg1THArU3ovU3VCeUZSdW8zYXRkK05neURDdjBD?=
 =?utf-8?B?dGtabEcwb2JDek9LRHNrT2NScUZjNUhoK3RkNTJNL0U2K1JmUVo4aG5Bbzlz?=
 =?utf-8?B?QWhIaW01emM1K0RPeVYySVpPUHIzVEN5bDJza0JyYmZDdnU0U1lmWkNKcDN4?=
 =?utf-8?B?Y00xV0NUKzVmd3lJSmRXUmRSQkJuNG5VeUlQbHFBbTExK0drMUUveTd3K2Ir?=
 =?utf-8?B?dWZ6bENEUC8yaG5XTWhBZW1ETXZnNkFRdHZXUWtsbFRZcmU2OXhHc0x6dSs3?=
 =?utf-8?B?eklMRkNPM1hheU52N09nd2NvNy9CekxJa3NvYUtnMTZ4VXF3S3Jza2Z6WnhE?=
 =?utf-8?B?WWhyd0l4VktReUEwUXhhalFKNnNLTTBlcnEyaEdpYXZ2cllKYklIQkkvdEhk?=
 =?utf-8?B?WWgrdVpGNjNWQnlwSjJ2Vk1LejVYWFdLdXpCZUJrdDIxRHh4cWdOaWs2YUpi?=
 =?utf-8?B?dWRXcnJNeW4yUitHK1BLYjIzSXdvSVZNcnBXQ0I1bVd2RzQ1cnVzSTFDQlA1?=
 =?utf-8?B?cUJOWmdaV3AzR3R2QjgrUWNmRExrWG12MDFQWHJQdnEwVmNZdkMxSGpBbWV0?=
 =?utf-8?B?VFVsUEhVL3UyQThBT2Jub3JhVXpkd28rSDRnYkdPK0hZZ3pHdWpKRHZYK0pQ?=
 =?utf-8?B?U1FvTFREUDR5eTNSdnl1Q2VpOUcrdk10ZUkycjRuUHA3UXJUTVQ5c0hLVzIv?=
 =?utf-8?B?VUlnTk5LZS9LYmV2VzR4c01IS0Y3NHhTWWMxNWlVSGg0d1ZKZ05pb1JqdEVl?=
 =?utf-8?B?UHAva2Q1am1nOTh4QWhyVG8vMkdVakdCR2VTRHhMTjlRckJxdnVQQXRBaGwv?=
 =?utf-8?B?eHZNdGpQSmRiWHBrb2x0d3h5Q2FEQURMZGR4aXVYN1pwbUE4bHFoUDg5YkxN?=
 =?utf-8?B?dnRWekljbTNwQ0g1R3dtSWVHb3JzRkJqU1JMVEEyZDNoWUpVR3ZEKzV2Ym9K?=
 =?utf-8?B?NFNxVjNrNDNDUmRWL1RqeVVKMTFqU1V4RDRHNjEyalhvUXQ3NEp1S2RPeXha?=
 =?utf-8?B?dzM5ei9GSnVYK1FNU1JFc3Z1UnJnaXQvbndKUTgrWU9wRXR6T29BTW5ZV3Zp?=
 =?utf-8?B?c054c3Y4RFMzQnhXeUhCZC9SVC9EYlFTcUlmWmtHOTlIWis1VGJJMXQvM2xG?=
 =?utf-8?B?Qk9PTjhSeWJSVE9kcEFERWlPZDJWT2xjemQ0Vmd3L0dHNVBwSVBCY0FJN21y?=
 =?utf-8?B?cVBnYXN0bkkwTzFYUGlxcUxCeHZPYTNtTzF6b052WXMvSU55WmJlM1B1WnN2?=
 =?utf-8?B?cTlESS92TDBBYkpRY0NhQUpyNkRPMjlOSzRhOUdsdXZPUmVudjlKK0N4U0VJ?=
 =?utf-8?B?cmtBV2ZmY0VMZkdSZGllQnBvcFZ5RENMbisxVGp6NHErcWdueXVEcWlRc0t1?=
 =?utf-8?B?NGJSN01rQ09BWjMvb3pNUEZPcDV5MXlFNHR0NGtIcFM3K0pDSlgyTVBMODls?=
 =?utf-8?B?ekdhREpYekErem1DbmN2bEt1TzNCNUpLNHJCN0VmRktXZFgxdHFHK0xzNzNV?=
 =?utf-8?B?Z295UTZOZGVJdlBuZjhNSlNPbisxQ1BYa1F5L05raktrbUpqZFlYT0FmMzAx?=
 =?utf-8?B?a3JWT1hZeXN6cGRoc1JvMEp2UitKOHM2U0IwS2dOdmxBRWFIWk1sVFBPWFNo?=
 =?utf-8?B?TytLTWtDMkFjUk5kdjU4SkRsY2lnMm9NSisyYUkzWWFnR210a3drS28zdFV3?=
 =?utf-8?B?MmdSUmhheWJmaEZ3L1JtOTM5R25DakUwZEJLOVJRb3pzMHZiY3ZHZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fd18c7-8b5f-40b0-6239-08dec6f344fb
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:22:07.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NDl4jqR+VBfIe1Bj75dIy9p2In3VoxIBoskm7NlG+i0Uf6xG+TpFpP3PaotxX4rgeZyG1VinTAahdh1neGNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_062212_974854_F79B0E9B 
X-CRM114-Status: GOOD (  15.84  )
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

From: Peng Fan <peng.fan@nxp.com>

Using imx8mm_vpu_power_notifier() for i.MX8MP is wrong, as it ungates
the VPU clocks to provide the ADB clock, which is necessary on i.MX8MM,
but on i.MX8MP there is a separate gate (bit 3) for the NoC. So add
imx8mp_vpu_power_notifier() for i.MX8MP.

Fixes: a1a5f15f7f6cb ("soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 19e992d2ee3b..e13a47eeed75 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -514,9 +514,34 @@ static const struct imx8m_blk_ctrl_domain_data imx8mp_vpu_blk_ctl_domain_data[]
 	},
 };
 
+static int imx8mp_vpu_power_notifier(struct notifier_block *nb,
+				     unsigned long action, void *data)
+{
+	struct imx8m_blk_ctrl *bc = container_of(nb, struct imx8m_blk_ctrl,
+						 power_nb);
+
+	if (action == GENPD_NOTIFY_ON) {
+		/*
+		 * On power up we have no software backchannel to the GPC to
+		 * wait for the ADB handshake to happen, so we just delay for a
+		 * bit. On power down the GPC driver waits for the handshake.
+		 */
+
+		udelay(5);
+
+		/* set "fuse" bits to enable the VPUs */
+		regmap_set_bits(bc->regmap, 0x8, 0xffffffff);
+		regmap_set_bits(bc->regmap, 0xc, 0xffffffff);
+		regmap_set_bits(bc->regmap, 0x10, 0xffffffff);
+		regmap_set_bits(bc->regmap, 0x14, 0xffffffff);
+	}
+
+	return NOTIFY_OK;
+}
+
 static const struct imx8m_blk_ctrl_data imx8mp_vpu_blk_ctl_dev_data = {
 	.max_reg = 0x18,
-	.power_notifier_fn = imx8mm_vpu_power_notifier,
+	.power_notifier_fn = imx8mp_vpu_power_notifier,
 	.domains = imx8mp_vpu_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx8mp_vpu_blk_ctl_domain_data),
 };

-- 
2.51.0


