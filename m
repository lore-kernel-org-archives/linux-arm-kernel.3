Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41291D63954
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3WUI05p9TvqDlu3Cn9xiJPAQuOoCL9gCqNmjnerwEI=; b=eFCgQcWEYDbELOVn+iDfj6JyCt
	IfgQwiaD+lVMgDtSwShRYMzSx/2tliesd5/7j1reLgDHjxwIUGJMh647iBOGC8R1ueLeAZg9b654i
	2Ex7toC5d/pDlukAZQdeAReHA88ThIoUpBD+Mc/Kl3VCj5Cn5XfuGFuNdh7NV4+lMOUx4iO0c6BSB
	9wczUdWaMMfiKDJEoRfgbSubeqwKq1mtsZk/1EKf1dvqmi8uJuOv5aNXUHOwFE32ZpowHWcH9ajyD
	bsriP9sl1dY9Aq6of7kCZnDEx+c2zcpCOKrjKJT85ZGSuLhcdbmHuTZgh4EXVacPHOpHzaFX6fU7B
	/lA26JUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlFN-0000000FT0c-3cij;
	Wed, 20 Nov 2024 13:59:57 +0000
Received: from mail-vi1eur05on2062d.outbound.protection.outlook.com ([2a01:111:f403:2613::62d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDlDY-0000000FSay-40vh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 13:58:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksOjBPzsxjvjXry6WCvrGo7ScjXpdKVkKEhbz5QWKM5lkREiYRT2A36xh4wIGg1pD9L0EA3aC5jNIgXXtrv5qvNaRQeyQPpn8nGSbWW8e86dRJzJnqCxHpjcf0jV5WCGSknQuu9dq8wzLngECqTD20AyEwxnt8ZwqGnUzjkoI9fJl0LOLM/iuxvCg1fEG+nPCt1/yxCmZCxYVd1LTRNweRN/FgJGPQK5rpbVF8hWLxV60rskheKYiNeKCu4tluQn1lrGV9lj3xJS7nIrCuSdSxSri+/Y8yMESY2JxeE7lRTr6FQ71C8DGV+9aV0eZfZsps01C0yqkVmVpUA68upNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3WUI05p9TvqDlu3Cn9xiJPAQuOoCL9gCqNmjnerwEI=;
 b=mmCTKsSEPPFcB18vSJEuHGmFoDjeBD4Sqwpt+93YahY1JKYQkzAeI2pv4ArhbrYopDWnrZ7f69zZJA6sn9IPq422MtkN3unsoGLTnhDMkx5P31H6HYeiQPHiCRXAkGBb2UkNk42erpJDku7MRL65UKTR4MZQK69sciFNMI066L+trVvXRzb3zT6PLwqYrmFfBKPZGcky4UxxJ5ZN68Vi4iB8iwdi6NR2gDkG4BlZMD5vcLQOjg9saQyhATKN0j3t/MND0zl7fAFbl+M+POgWiq2txpjLs2b1usmoeWcIjcpwTQRY/VSpAOPHpQWURSWNXfek8TvRsF9bRj+YbpimBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3WUI05p9TvqDlu3Cn9xiJPAQuOoCL9gCqNmjnerwEI=;
 b=FWu7P8dH3aB6rwcm+M7yFoDB7vkmy9TThMB3MiSvK+NlVMo3mnsBu+0a5AP5cKpCkUPMNaVgVpu3G8xlY6mWW6OXkgQ67NhSWRhYgjEzdDDXjd+9VjuwxguUikXdcSUizbqarEGHIhFRlbPf5n6xYfvxm6eY5P4M0pdSVe/3pJYKIrlZjGx+i6eN7rjvLeMa1HcOddIDAKi3iYXC2ahYaCopohwu7BhdP8H9BrHi7oXRhz94VXxLVJ7R2oaYoYynH34aWdF/0dTYhgmESU+wE28nTcVRGvIqBg/ke7txK7ZrYA1TAs/Oa1y8EE70WsIvGK/z1IAgbqjnxbtcrId9HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DB8PR04MB6825.eurprd04.prod.outlook.com (2603:10a6:10:112::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 13:57:58 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 13:57:58 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH 1/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Wed, 20 Nov 2024 15:58:54 +0200
Message-ID: <20241120135859.3133984-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120135859.3133984-1-daniel.baluta@nxp.com>
References: <20241120135859.3133984-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::7) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DB8PR04MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a66bb7-53bc-41ed-d6ca-08dd096b56de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BYGxzVJJKv20jNEqs1iQip5gADbP7zUGrHCzvD5HxAQKl9KipdVfySF8Gm2z?=
 =?us-ascii?Q?u0DzYkZ1qH0Bw+PkeKNq2/xt5azLonnozmnjIcMPRJnoKpVwlMUM7ytRCVc2?=
 =?us-ascii?Q?Dk0eIEc0sDszjRDtyCxDNwEVPydUTTt6SRG9nHNnXeZyb0FJEs9uTJBjxGBl?=
 =?us-ascii?Q?pKSKy3+RuGuSU8M+4Jx9M51jigv1h/XKyIeQ2YxV4qbbaf7jtIRN29zrtVOH?=
 =?us-ascii?Q?OS2pbuJeA/crA+ARhZd6AixzQLNqm3hJH+zT4MLg1tYDJVmL2AG7Y5VQxGVz?=
 =?us-ascii?Q?kLxQAIz8YcS6UnxJLmZxvvneldvHpKnkeI9mdfRp4B6vv6CLymCZwEuY8T+C?=
 =?us-ascii?Q?bY8IZ2028dqOUG8p5FfB+agiHuAjMBuh5vxu/b2grgs/3/RXAItg1paSPCri?=
 =?us-ascii?Q?7otFg/PLr01Z5wdzTIsuu1EyCcQLVilR0QWCQP5sPgV/0POmuspfRimptdsf?=
 =?us-ascii?Q?k41OcyxOpeWC3ilI68RY3oFMjnlBmxhGgCvpWl2ls4YL14xc11iI3Dr9an8d?=
 =?us-ascii?Q?61l+FSUDeDcyEtCy0l5PWV6eCA7YK4ePGZqkOwNiSrsAADm+WFkAArCL6F1q?=
 =?us-ascii?Q?j0DXGsWXwN57oH+CksiVGZoLyzrnzBIbGLhlywNrqVkEJB8/50inRVDmfF7V?=
 =?us-ascii?Q?Mhjj4mFWZB0RCpJu8how6VV1Yd3s368361RrI3nQoIqF2Yrxj09S2YUDbY4m?=
 =?us-ascii?Q?bgkFCKgqdCmg83tgF2YgU6nTdkj3OB0yem7v4WRYf29F5CYqji41+ySL/kPf?=
 =?us-ascii?Q?r0YLItVMh+I/ybkquxkThct1uyaP5yQCkbUMSmt/ApLYctSS2mDZSY2UafLo?=
 =?us-ascii?Q?Ry5kjOyHjGixh5sDY71MKjkvbcUxjGciyDDuAx2XjjdgupWguPqOMBrbRW21?=
 =?us-ascii?Q?CXCkI6+H1ZJdQSz+5YuZdFf9Q3ryPNdF53JcAD/NQxNc21HrNo6wD+WYOiCC?=
 =?us-ascii?Q?uWLTaEKK0kuAtNcDJq3/0/LvAehlP9183F+psJx2/8rIa+eGMbM3DNy9yBaH?=
 =?us-ascii?Q?KA5VaZEfyvSFDJ3ibF4va3CuUsJU07cJiHvleXCNQgbE/OpMRdRvB0durWD9?=
 =?us-ascii?Q?J5Hee/dJVrE7X9NL+2o7G0EShfxkysL/turjHdblqbOHxXw9UHfu5VkrxRI4?=
 =?us-ascii?Q?2y4HLyu9EKe58yWd8aeRrIzoEeiXfjmJjCOJpP9HuanBWsS8ZkzDCA2PykvT?=
 =?us-ascii?Q?dQ1ZRx9TSoKkEyVu7J1LivOV5c4IXvGW7v6lefq4TTdVu+P3Am5HqhYwM1sk?=
 =?us-ascii?Q?BRbJ6ctf1icGqN+jlqnk71rjXuFSkRbgLMvraBq4FlCJ5tl6Q/V9RSw2K33e?=
 =?us-ascii?Q?SBxMmMcaSuiOzhLdgAGYKxuftbCj+URt6IiaebLUuEtXeL4QoUpI2A7d20Y8?=
 =?us-ascii?Q?HsooPnI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O1aIc044XH09yqATC6d2Tn+/VW7knH1ORjVL1dyKXOwBLubk6xZdvFjv1JMP?=
 =?us-ascii?Q?24br+EGdJM7yfqIAzJCDVeJjLA66zumiDFrbp7/3zXUrQcDfz5ihRxYikMOS?=
 =?us-ascii?Q?lMFEbFjr5xdrw1EsJJVSsd5iODbV+T9P+FjtCF/kYxDeLmhgurdpM1vWqE4x?=
 =?us-ascii?Q?G7pJtZ5ij4pFoGtco3O07T/CwpAyV/WyXJBe3b/zbC/lgvxHk07R0yNa+WPQ?=
 =?us-ascii?Q?Xdjsx8DULs/8Er2MZeOnkrk+fs7pd+++RHtSLh5TMZXdAdKxrJi8b90F1QQF?=
 =?us-ascii?Q?e/R8b5xUcuBRwbcm9V6mm1Bc4g8Q1my8JrhSwN5juR3a40OlPEufDZhz6TAw?=
 =?us-ascii?Q?rFef/KXgL1Y9PdmFrCQpAzMIFchy10v/DTjzXan+uATpJiYv0rcwAlTGuXuA?=
 =?us-ascii?Q?dvh0tNskkqgKP+BUdiYI+a/WQ4qzYGs3B+dOULTs8O6WINya5PIuEG86g84k?=
 =?us-ascii?Q?N3lxW/Lfskb1++K3H0HhWrmpAdA7ZRZwvisYPB6FzTjYffHfuuwpHiQ//NzJ?=
 =?us-ascii?Q?24WzOYqeMept5bCW7H0ZjUht1mnE9rguVNBssf0uXmLl9C97TLGuF00rTpx9?=
 =?us-ascii?Q?H+7Jb6dUM6WZIWHlbv4mriHxr+wzX+sHGLnjGm27w5uNP1SW0FiViU8MIOI0?=
 =?us-ascii?Q?pzeaoVqbkDqI0/W9pCbMUWOtxmndevVFIPiJXaOXR9acKfdgvPpz/4sg7Pro?=
 =?us-ascii?Q?QCbc3zZlnonDado80YG16nkLHc7NXqllyTRwtUnweFaMV8EuwNYNs7ocMbL4?=
 =?us-ascii?Q?pejtMiqnWBT3ot9jr+YlfCVEt/qkhrnpEKA3ahS+68G92h5lGCHDCJhvqG8x?=
 =?us-ascii?Q?KAR7SSebYlERForyzGQ2hH8n+MXV9RjnyLZ7XxJYdLun/AB88BBb66AffKz3?=
 =?us-ascii?Q?7tBLLYu9SHrRU6mdK8NB/kIQhWTJvLe15lfss+ADHI2kjslWXRM+ixdo73aI?=
 =?us-ascii?Q?tceDzQCM1XxDba2uy9FKJcTBaynJ8zRXFnIJdQcTt2g0iXUKeiwc9tuGb1J8?=
 =?us-ascii?Q?2ahD+4jEbVnKojmAs3ZrnOVQ1MM+qbBFP3vNC1ij4tM819ub22JhepZSh9tz?=
 =?us-ascii?Q?O7p/fp/sXBjnK1YbHDWLKXqAJQC+lw7aPWxtSybuYvkXBaQDtlqNnSLlENUT?=
 =?us-ascii?Q?jR85h7iBSyAo3rAnQZ4rH9tyiwp6sipsLYUpmyy7Q59WEIr/hr16wKK3dxIo?=
 =?us-ascii?Q?LFWFAW+PXTJvSAyPpBByHkCpgJRj5LeWRauOaOH7kMsFAk0STME0guUr2zTN?=
 =?us-ascii?Q?OddFZUM31dyx4jvQYOGN9+XK1Wig/pzs/IiS+RVRCs8YUceOnfrqGmETRJcB?=
 =?us-ascii?Q?P0WsgDg54r5roPa4gXxEFxIpz55svSRBpMC39H/uB/6QL19INLcpSllxUKIw?=
 =?us-ascii?Q?ryYCQu0RBG2AaLP5CrDUO81w+aisl+aRNTXcXcOQkFRF/R7WZc2KRXVAkGs/?=
 =?us-ascii?Q?uaov3oloo7wZGML8//WM+ZTV4gQTy4ktMCB1urGg237YH3HNiILTBRxpP+Tp?=
 =?us-ascii?Q?5oOoBUaHnUgOvMUWQXJ8HaFE8c3b13Vc/ypOIbNRA0VBmQR5iqYgHeRndkCN?=
 =?us-ascii?Q?9NBZ7MATDzJsd69UyjPB8Px0iitSnSVoZVKCsw/1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a66bb7-53bc-41ed-d6ca-08dd096b56de
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 13:57:58.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTVm5BATGoI+7BKEi/PDeTYYplXz00eq9OXO4bprCsPBRRoPaABQXQvbXr2xCrl/3HEx9PPVDZi5qLbBSWkuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_055804_997090_87E2ADD2 
X-CRM114-Status: GOOD (  12.09  )
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

Enable MU2 node and add mu2 root clock.
MU2 is used to communicate with DSP core.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 7775f5f58036..9173deafdd74 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1252,7 +1252,7 @@ mu2: mailbox@30e60000 {
 				reg = <0x30e60000 0x10000>;
 				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 				#mbox-cells = <2>;
-				status = "disabled";
+				clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;
 			};
 
 			i2c5: i2c@30ad0000 {
-- 
2.43.0


