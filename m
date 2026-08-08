Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E03C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 10:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2KLTVN1wsWNe+E8uRUEshEKDgyFtFtDRIVpXgpfgow=; b=PNGpP9S6WTUVuDbLgDVaUuYB2z
	gn+JGWyQefAlFX7qblotZH/qJ5nXLNBu24h+V9wVfqq/B9TD1toB+AoSckvo30kmMxRoZ2cXDty1F
	jAsVhJRqsytTqfgnHmgurkSQF8swUkimVeUSH1aBYY86lNrakSaTQ0e+WoAGnJmWexnxfD1qjXb9E
	7Ky6vf2PhGnz+ZcJJchnvS6EMBNl+ZLOip7yHjYHxLVArKUlP1cniHX9+A/SHwGpCMSzKeceF3koG
	HWGe52aiBQ7r9sTiDeCse4/Bex6nSbcL57jj9G+/aLQHKapjP6Ju7KMq0fGDpTKkk2VPRLcsXpwgJ
	/CVLV7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wse4G-00000009GTC-14Cc;
	Sat, 08 Aug 2026 10:14:16 +0000
Received: from mail-australiaeastazlp170120004.outbound.protection.outlook.com ([2a01:111:f403:c40d::4] helo=SY5PR01CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wse4E-00000009GSa-41Na
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 10:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYOhYqmyfOKy4Rxn/0VaoUN2ZciLDmcZBoHTGgRPWgmhlcwVI8q/YYNrJIr1igmy5ubHlP02C4sPHhGFyOjBNQG37Gs9hQW5LhwyDPjaKKh4YLha+glNNofyciDJ1B31osU8fiaMwPWXF79Fh7I4C4d2NOSaPBlncJWqUCtLEERrhOKV0r1qNS+kd0dL5D0ZSNWWVujoHVicsIwR02RdFHkqnh3NjaeYFFkl9ZcJ0Y9HiZG0DZ8awMPrdBlj9Cy5ued7sXdbrL+wuhO1vySO1eXSfpJDXXyh3zPNc1/HBCHLXsEyhcaAww4O2VnQxpGXg4Ahgf0j7Xco5MKnNZBdSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2KLTVN1wsWNe+E8uRUEshEKDgyFtFtDRIVpXgpfgow=;
 b=GvGYXMTD/LDKG8rBspbxqNOLWDNhRNzhjyZYlO6fPLzE1z8RtovUw9SRyWZzaRePKlwt9KLFl9K0W/b9ACgnnYXkmzZ1SaQtu2c88RPy1H3yw1vhcxK+Q5waGP8Vj52BeQeUOzNvQuSfdUxe5MNUdHC9crXv+/zSzr/QMKv9XeiKyze9qiE2rQVippgpLlbRnKMc1Qve7mmx6Rn0f8bAhA/Bv5+GHreiHj0oy6o6cSLXJiZpvwOkRmiXaPmHts83/MjFU/5GjxgojmHTQQkh1wW8BUfz4qdfDijha8HHsQDOZHstipNxm8teB9Nw2w0zbB6sZuyQgzpYEhNM/HEJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heitbaum.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2KLTVN1wsWNe+E8uRUEshEKDgyFtFtDRIVpXgpfgow=;
 b=b/3zONUPVSShObKuDFGxU86axKD24eDxV5RFyZS6AiraB43NJB+PSXrDEWqDCQaUqYxj6q8JtiYJs0V/6CqgEC5b6vFdVNjM1cuLqQUEb/4W59D017ubbI4cSVzMvawSTcbVfymsHOPuBW/qEWPo4WG1SQswdHLtpSqo4BZDPDuzgN9UpYwAqtBVYDF2G2INCgEXE5vF91wqQDu9Qr4fza3QTboonWkpLA2d46iXvuDEBfjhx7ZdmKnSbGaXPYCB1xSkU3KyyYhnLzm+nf3fOcbABjNMTEDt2gnn/PBtqzBT+zb3D/PVVT87CBzpSgvBw+912GL60v4ZO0KeyFAitQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:279::22)
 by SYBP282MB4053.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 8 Aug
 2026 10:14:05 +0000
Received: from SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd]) by SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 ([fe80::21b6:91f8:614d:1fdd%4]) with mapi id 15.21.0292.024; Sat, 8 Aug 2026
 10:14:05 +0000
Date: Sat, 8 Aug 2026 10:13:51 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: imx@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rudi@heitbaum.com
Subject: [PATCH v2 4/5] arm64: dts: imx8mq-phanbell: Mux the 32 kHz reference
 clock pad
Message-ID: <53e03c00c4c03c2f73d8012a602fca6031a52dfe.1786177290.git.rudi@heitbaum.com>
References: <cover.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: ME3P282CA0014.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:80::24) To SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:279::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SY7P282MB4909:EE_|SYBP282MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1612f6-dc8d-4e4b-4c20-08def535c709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: QAqpRy/PyfyCpUy9agSQLn5TC9ATqwDj1EydQolhpepffzsMQZta3EcfBPquV8qGcFYAZV/EwvNTlqgkNGz7qw9h8IecPQxkGO4j76j3T9t04GhOTUxWzs3WxQQFs0Eli6pY+MrGi6PnjLoERkQHvAjRxVDODHVsLNPlBoi3ki6YxEV6x2aah/Yzvb15VoTQeYa7iuNl//8DJs/8OxkO1UObFG+uZHhTVfrZr4kbESPy4K3tp/qXwbBfa3/hPY66T78HQpmAT0p95sYV0vU8q78L5L+hvlYEiJAgMIIZArk2EgtJB3x3wrfAVGA/A+BQpcAAR9I8Y8DBLUWbex5Rop3nvD1N0nC7SzZCLarLUp9dChjFzcVgcidSOaGcsM9TDagOYAq5X5E3gTO9VGRPSM62aPIKJ3PnLwHLQDmJ5/lqI6Ka/2XPXtbsyzDAawdqGKu82ZyL5YiT+dD8qGziEMGl4HdYdq7WJI/l7TEDVgfiFrggWuDqUpz5q4HX33sbb38LJLQdrOdEemLbUIH1c/qUfxUtPTHw/M9IMnmJdwM+1RE9juoS/vkhiGWjw4G1/jg67d6EIfXH6B5rxX05BdeMIsZ7C4118oRb9JaJTFBWY2LacU6qllQvxTj+c1t5IGsZ0H/sXtD6VEmOUWdDCyJfeiQ1TmcO63XgmP+wr5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(5023799004)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K7/SVmDMWvU7OUoOhvw8e+89WjxHZopX8YZbuftydZhxwkp72wsUq19X1ky7?=
 =?us-ascii?Q?OevO/mKnmoo09FzYa1WRVOXneyM8qRAR6ueaapCZiDOfuQxbmeE43QPeiH6e?=
 =?us-ascii?Q?8VDjgutmYquI1SQP+5If3VD1Hi7QPG4dPU1RjlIJTjaG/X8wB5buUMmy82Io?=
 =?us-ascii?Q?Xr7TAkIC86iOdJWeXhEKAuXfgnNdBZVi4TsZ/ljsiK0NwpGre77ISBRUd9VD?=
 =?us-ascii?Q?CDvpMW/dR9cjDU/v9iFDBr6EjTitw26FUepzrFZ5++DWy5sKwgefDxMa08cI?=
 =?us-ascii?Q?KzqZ7dueyNaDJIocgg2+rEANi3bnq/fhybwiWeqOzk5mupjiT/YIHqxAjStt?=
 =?us-ascii?Q?JKVhik7+9ZA/GqPS6q7LoZKrOvI14CcnaU+JLFdyPOHfLqdvRFDsXCjhbhjE?=
 =?us-ascii?Q?rZtxPk7OGcplpfH8Q+fDynTQK4kxj2sqmzXx3BotTjhW+TGvbzng+dW3cWSk?=
 =?us-ascii?Q?YJt6c3sOaNobxTtUAK6UiOHrFZ5HOg2BARhMpCwrxFt4JWOXOsyHSgnoLAD+?=
 =?us-ascii?Q?X+Zx2Ihq6srtvuWThAjuarVYLgbZ4xhjV+Gq/CCiqryqp9iUnvzrS/j3+TKy?=
 =?us-ascii?Q?SkrnZTkQoAesWVXd3vqlAUw6Jy2WW2Cq2ecZcx7MLQnVsYyfpSvcNpQ3hKFw?=
 =?us-ascii?Q?lcn0zaX0HYw4dF8apM71RlG+nI9RnI9AZG3sl2/kOyMDeiwjnaAJa++HlWRH?=
 =?us-ascii?Q?MZZMaN6fAfNuxeF+DygxVJvSOxRdHOb2FOTVrd4oUNinAhGNZJbIDV0XgGsn?=
 =?us-ascii?Q?2vAozY6zAf3YQ3eRYwAnUPqpmPseFNUXOYAi4e2DxwJ76KZL6/U7mWRzQ5Eu?=
 =?us-ascii?Q?yVdLhWoTJAFmZUXWGD/2MYL1RXHha8MRhLqWg6m1UWVPQDUbE5tT2wlgSrWO?=
 =?us-ascii?Q?X9nii6bvo4qkfmgbNF+4RB8BGcdCUB+xqWf5DqKGuHRMGOEUFkiYjNVNxfo2?=
 =?us-ascii?Q?7uiRz2RpS4JirZRdNHuAu7P7pBQ0TgCKpmQasTyArC1x5uYkNsTzhbvCLMN8?=
 =?us-ascii?Q?54JfNE19DJHfRE5LblkM8zPQVMCJRRpoQz4WI1N96RQotp6T6X/R1A5AUBVq?=
 =?us-ascii?Q?eQkEoyAyzIxCOA/vDMo4soPrQEHtAThMrk8BEGyCFFqnpNTqNc7qreGSFiE0?=
 =?us-ascii?Q?4jRVFiZN92dhs0zpFNCdY9ugtym1tBpNuFYtEp7S49/YKuz+2edK/f6ZzquD?=
 =?us-ascii?Q?Irfxb+tC7/0oRh9xbGE2XzHMqpR5/4Nb0Zi1LIEDfrkN5DhfXmWw+gc21sV4?=
 =?us-ascii?Q?HM9vRGiumWtffruPE7JYaOfTI+IroSG+sNKgfE2E1moXP0N9TFM4iTrCg20z?=
 =?us-ascii?Q?iu7jIUPVo7qtnucJsOGp4N+a4KU9Yq9c6jefhcVIqK2bzVH22yiaOsag0h6p?=
 =?us-ascii?Q?BKp0btQ07F3Kwf6q2Dr0ug9uRsASW7RQJFwLIrkmA/aaPPNsZvfUaLdWW4FX?=
 =?us-ascii?Q?7TDrHGfdEu4ClCj9+R3dQ8B3GlVUc4yj/JVp/sP8pLeycIM4Iuf1QdGZdTOn?=
 =?us-ascii?Q?Gir+802KxqAhBpmZGUllAEElE6ysqAdubBXVj6DFGk7KuQ9aDzBootRqeG/c?=
 =?us-ascii?Q?uJpDy3U+EsbbrqAYfG2GEY/6Bw79jkMGMRzk03XUYSyWn334jMMnz4HqcdNe?=
 =?us-ascii?Q?IiiwOmatg4+f02xjzw/ZtdHh4FIE7BeLJEOKacoFDK2OWNUYg5PfTzdpcS83?=
 =?us-ascii?Q?U1i3VO7P03J5t0nFExNNA31l4yTp6b5+M/JQ0adDmxX4LRoMpHVIHob1IGMC?=
 =?us-ascii?Q?otamN5AwgQ=3D=3D?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1612f6-dc8d-4e4b-4c20-08def535c709
X-MS-Exchange-CrossTenant-AuthSource: SY7P282MB4909.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 10:14:05.5191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Og5ThacPf0cN/yYqhj1ZJD+25ELu8PWXk6xvLcEAubTkGKrQ++BPldQmo8094LKsS8b44L59hlRxqrAjpN1bRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYBP282MB4053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_031414_991853_AF95A1BE 
X-CRM114-Status: UNSURE (   9.79  )
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

Mux GPIO1_IO00 as the ANAMIX 32.768 kHz reference input rather than leave
it in its GPIO reset function. Nothing claims the pad as a consumer, so it
goes in a hog group.

The vendor devicetree hogs ten further pins alongside it, none of which has
a consumer anywhere in the tree. Those only set pad configuration on pins
the kernel does not otherwise touch, so they are left out.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
index 58f7276eb557..2d134eefb765 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
@@ -348,6 +348,9 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
 	pinctrl_fec1: fec1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -374,6 +377,12 @@ MX8MQ_IOMUXC_NAND_CLE_GPIO3_IO5			0x16
 		>;
 	};
 
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x05
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
-- 
2.53.0


