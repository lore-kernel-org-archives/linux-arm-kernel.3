Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9393C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYbOiPMd6kuXdYGvH7OGR9KaXu8e+jeF9RlTl4sV3eM=; b=yDi9ndp3CyOM7+cH9ifgRjP0ZD
	hLT/BREebcZF0l1XGZTLXhKNGV+Jl46sjtdJ0fldWE5csPODFQz5wN1wAMZa/Jt7HOEgiRTvPsYAq
	YKmWrkiGh5UtQNpu57mK6079tLFJjddT7SRpE/LBsdLOBpqX5rBXahrcxArei0a7GmKS05YQUBhMn
	2jMVjYemwWdbPXEtOV8i2IPlDL04arabezy58Gv2Jt314eP3m2AY9Ytccbk8AtC02p/SXUg9OV6R+
	MayjVMz2ADmX+1E5rts3XIP5YguxAzr14RDX7j+5NlpJMbGBWc5qmayRnVMJcr7gaMwQF4sX7PCIZ
	bXKc/8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUiZ-0000000CuKW-3Zrg;
	Mon, 24 Feb 2025 09:25:39 +0000
Received: from mail-am6eur05on20628.outbound.protection.outlook.com ([2a01:111:f403:2612::628] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUP5-0000000CoVs-1umA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:05:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwU1Ro5Y4r08ZdsGXiwWSLjPT3T5wN0XuJyen+9zkHE+eZfcqs66tTN2zb2WyOI7dDVwypqAXM1C23lt9BnSRG1A0djlwrpVJch3KYxAmGVz/iANMlG0KdNAqZK0gtUxlAAXDQ7LTUf/qYVNIFhTxLy2ivaiWLv35hcyT9/or+4JtRdvyr6/jIgaEKwG9+aat+HPZbJyGgRpj4a9Ta+Da1SDTWTfd5IDrKcbKGrTv+SI10fll/0KbVvSPP/ia4ZzcaJk4QqPI+HRMGePO3Ii3n8L5aJ+6Sgcwz2Ms0Gi/uZdvcknNl/jhd06zHiExLX2AjGerveCsDAqV15ck3+1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYbOiPMd6kuXdYGvH7OGR9KaXu8e+jeF9RlTl4sV3eM=;
 b=Q6KoQZtyticLtNeTL+dGtVAIJZ9ocv3NFIZ/6Fzga96/IX+soYN+/YF71z1dtiIqsMst+PZF7oxwBQzoksTYCxfoUxv0MQj4wJEv0Ax3uehlaLaFlDV8HJunY1/VBE78zugkBMXD9VxG3XZ6L5CaPZL10slMuF3t9WKOQG0GB9pI5GQChvOWaISsWrIMm60Yfk5NJju0E2JHZ0YaYhBRqOm+MMxluFl57UkMMKuc+9kXVfGAI0HKbKy3icnScIGn7mXxXgmx/YWrkZBTsJuwkCykgZfR6SL/VrVBzuxZY2mtL5T14oLxUeKXJNt7/S/jfr7VI4BRSKtiW1wxVKkUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYbOiPMd6kuXdYGvH7OGR9KaXu8e+jeF9RlTl4sV3eM=;
 b=GvPrVNqxlJCAbRZp6jsowZTY5r9dpwtrNxG4ZEvBZzsQBD6TODrHwwoedpMmC5tKdBmkiSriWO3RFEhuNZLli8b9BfZg44r5tSFugcn1PJrhEGz+tba6pd3yD+FTEHZ4HwA+WryY90cYPL9CWPr4Fh1DVGF+tP8sKQjkqJo2d1/iDCVm5pg6una4rLKp0/HogtZhBp04IJK4/RFfjBKLQnT9+/0/4/AN92ikJREK9mikQzuIugK1q/gqqSwOfJcFd/jnujXpYZLLFJgRQKzhDoIWtRjp6bsoaFoylI22a4phietlYorvghMQKjmb7hbqlr/3JUMY1UASwHdF1HYlkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GVXPR04MB10706.eurprd04.prod.outlook.com (2603:10a6:150:219::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 09:05:28 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%3]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 09:05:28 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl,imx-asrc: Reference common DAI properties
Date: Mon, 24 Feb 2025 17:04:13 +0800
Message-Id: <20250224090413.727911-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20250224090413.727911-1-shengjiu.wang@nxp.com>
References: <20250224090413.727911-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::10) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GVXPR04MB10706:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b1d5db-9596-488c-6246-08dd54b26222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RsIDVfmmp0euYJLJ0epq7levS8G2R7E/7FXaIf6z9X18kiCHBm1cmYQ/75o9?=
 =?us-ascii?Q?zYxnXb/13JYJw7KjtHz48/9bgrOkq9nqAROrBNW/sMZZegONxxv1Vvd4Cpbf?=
 =?us-ascii?Q?OiroQNifaXPaHxFYrvaosyoMF6oBbr7Hd2pAtZnVCJWibL6N1Nkwb3efH/5c?=
 =?us-ascii?Q?07jVOpv7l6/roYjCNIorB9bqm3EUClcutiXCnkR7zQfIvEjyFwnvNFIFBMKK?=
 =?us-ascii?Q?VyN2NTLqQ9Z7ABnjM7BB8qUh4wR2SA7UstS+/WHBYx6sfaX2WiAQU/QeQk43?=
 =?us-ascii?Q?mLzFwHCVo18Lvi3iOyYqIzwlPVcWUkVECrw+LPd+zxGvANNiVHZmbln0MaDY?=
 =?us-ascii?Q?gAyypypvw8aD5tKMvRmlO/cbok0mJeWymDcetXEeffDuwtxb42WhcgpWcYF7?=
 =?us-ascii?Q?qke1YRItzn0YjUo6yeQl+OjWmPkHXc4Oi5C9+MZHrhL1KXuAe40qiBBgafMB?=
 =?us-ascii?Q?IzMG5Z5l1q+oK14sWl88PKzrmLIj9k0I29Z4P4rozJcWnkLsZk+qOtC0udKR?=
 =?us-ascii?Q?fKr8uz30uTIIDBqM+S6eyCLe4PYRf3n1C1EWLsDwzInxp4oYidpU++r1tvLf?=
 =?us-ascii?Q?u5zUXOUxOW0UzO5xvAgwF1X5cN4s/kiSoVHvb8XLeF4qb77dYfA7AAQg4rw+?=
 =?us-ascii?Q?pqVvz5cRdxS2DRFIb5HE6BVikVaZZvfZnX6f0eTTS5w66t891CUj2Mx9J9L+?=
 =?us-ascii?Q?mmsJGQUKVlzGbxOu/Sg4M/sW/8T1D77cUfo+klYXKFl8FX0qBCVnWiYdN87h?=
 =?us-ascii?Q?+ydax0KFbdFm0Z5PocFEGIheIn/n7f1vMPTRwXhah7aEb9umvMlURa1+W7Zb?=
 =?us-ascii?Q?rPdHYWgHqLfJl93jNlTR9wlQRsBQkVexrd5VG5u5SfHu87Ca6ggHvG9J1N8O?=
 =?us-ascii?Q?TfEP2AOMqhJ0sPTlvEp5S5l6us99nL7gQR8uJsZ3daey+IfVfwo9N1mQITFs?=
 =?us-ascii?Q?e1BdbbP9uDsvVLmBkUI4mexqsdTfh9SnvEtXA28yhnIsseoBWHqhavvX3RFT?=
 =?us-ascii?Q?gowjewuEP0W+NS8/arQUzV10i00t/LI/URaBqEE396sb/hRakYHlt8Opzgez?=
 =?us-ascii?Q?JpTaKq7xhBUHyOozxHuJtvwf5ELwlbnf4mHcrQ0KE/GrOprm1wpNwcbhoB60?=
 =?us-ascii?Q?V5ffhLmSqR3hAVi/UnXuwE5N0V1hwbWBiWvKQNIyoTY2dY5guD32wv36fzOK?=
 =?us-ascii?Q?LkYX9CEsAXQDYKkr25c3+6hYD3P9v46s0sfvZXOSIlPbclshSbLZvkjsnKbs?=
 =?us-ascii?Q?PuxYmnDbN0iqX8fhVhBHo3YyNU8MUDxdCFzqVUGroe/2wZd1jZt8o/1UtYLA?=
 =?us-ascii?Q?nNc1+U2bhyeKnbvQ2Er/9S3PNQYMZDCnYakpN9a/M2uxeeODXdbyPHPs36yx?=
 =?us-ascii?Q?M+XHXQU64R3+EhAU7q8FWi2CFnJRbRFs+khfgW/m6RzAJk7tqR0yfG3Ar1uE?=
 =?us-ascii?Q?bkHpNR7YAZ/JYK8L737orgQViw4clmjp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JASDeHcWLo4Kic+37P09xzcXvuGawmwGM+/bAkvYl2M212I148mT+o0xkiYc?=
 =?us-ascii?Q?g6Jat77tc+1hZ23UWEfNT0xe94d9JOOIdCEh6Q8i3mpmGWlNXNebSzaRwftY?=
 =?us-ascii?Q?Rlbn3XXuJnfFxV3MrBImtRN3bTUDJ1d9CsW4qCR3VSWpacLP3xBZcxfQyfyI?=
 =?us-ascii?Q?h5infGYjlnBwP3ZFBotMPXkDz/xEOr9cv2XgFCk7wPdHD9RtxMyVn9BzpiXw?=
 =?us-ascii?Q?LIQEIbU3r5uILPKK4hurCpwMxxymlv/rJi+3hb0JyOjG9DXAXxK4TpVMjq/h?=
 =?us-ascii?Q?qpZhtcYFL9T4YpDIJzf9KLVEKkCxLfHiy9OU+ruoultmuANGw9vyCyarMld3?=
 =?us-ascii?Q?TfxoCJv3TLDu0/2S8zVL81Zt+P9l+PrgUfFtY8NlWbesI5JYLdPMJrk2/AX9?=
 =?us-ascii?Q?m9iqh5m5kBlW7h+WsqwdB+OsFTlo6dBf27GciHyRRlxlvF4oX9GMbN8ClkAx?=
 =?us-ascii?Q?lY7RJwq4ufky/VihQAKDagU2DBIo8/jGP5kNfQNZPuN2wV1c2riRCatkTT6a?=
 =?us-ascii?Q?fp0Ugb4OE+dkl5AVgjQ10zoWcAw8A1sbiyB3r6S+h+r2z2qGJJ2x78u4/nhf?=
 =?us-ascii?Q?eZJSVaifmgpXy885Forx8+rZD9TIX6SVAh5/NvmR1b8z0X9Nz1XGN14qgQhh?=
 =?us-ascii?Q?4EPXv/b46VTq+ziyDp5obuHUQ8DCOasvVn54GTq+2vUpUg0AUASbia41HySZ?=
 =?us-ascii?Q?huGekEV9BNQVhpc0WzXbGWBMgM02PmYtX8M8++NzEgA8JDs1GqdLEzetw9fM?=
 =?us-ascii?Q?ZaxMR3eV/uCuH0NjuoMdDaIoy9NpDsyW09FpOpFffczBRjyQFQsK4rUVbskP?=
 =?us-ascii?Q?eVvpSqsk6EhTNjPiUGklaTTG3qGJSHSQhEjaA6dXL7paK5ajFp+BZsEgXsYx?=
 =?us-ascii?Q?urjMfHghhQboaw3GfwtGS8FRip1AkR2ZExZwqB7dm6+8QH+pr5qTlJk67320?=
 =?us-ascii?Q?k/ftt6t56qL895DkUHiMpRXZuA4hxMGpuJSqBRfC+0bu18P8QEhKX9oICJE3?=
 =?us-ascii?Q?kGlMoKPXGWFGXLknWEk/+KZts+mf5R40mAqtdMOOs0Z2K1IIFHcJUEVs7Y9h?=
 =?us-ascii?Q?4Pe/eJ/q4uUllq4MVH3NKECUPQOynEDlHQS3zmlyrLS4WmPeTTDKsTxu/BoK?=
 =?us-ascii?Q?O/XZICwakD/Vo1TdM6EqWnxVkTw48/sKENf/L+rf2iwEAGBrBbsE+mxzFZFh?=
 =?us-ascii?Q?Kypx2v3ZZMU+Nac2XNEXuwz23NeDoCHDEMK6G41QdkRELIwOUfVP23AUPuDh?=
 =?us-ascii?Q?m30wto5idEEr3nR/gHGSXGSW9NFpBDHEX7cAZpf+MCAJKK2Y7zrVhaNIg1F6?=
 =?us-ascii?Q?JisGvZ8U0aGQ3bF2sO+NcVRhWxtLKrySutgENp68oDHfVXTzIcCra4NOxs07?=
 =?us-ascii?Q?s7kFZnG0oMUK3b+0Efl0JaJJJ+9Wr9XVVueLCJWknIMj6YNdp+/QW+V0/Jir?=
 =?us-ascii?Q?PDb7+4ziKUTcmGd0zZbYs+vYP7aHdw+sJwdZrvBFBPMVOa30/vduA8w/j4IE?=
 =?us-ascii?Q?yrfEv7NMuMd3ArELeagQ5XaVe+ml9Nm1A1k+uU2oV3CgrAwtn+SGQdBEqMZH?=
 =?us-ascii?Q?nLQF+29Yrn1djYnmXZ53D0MfExf7Squu1yb1iwBn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b1d5db-9596-488c-6246-08dd54b26222
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 09:05:28.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW9I1CSv9ScXkKLJCtB3spm1Z8S5H3ueG1WgERSTRdi+9tqOmuR0TDQpFLVv3Hoyk1WfFVVaAu32zRy1HKG0sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10706
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_010531_493673_81A0DAE1 
X-CRM114-Status: UNSURE (   9.56  )
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

Reference the dai-common.yaml schema to allow '#sound-dai-cells' and
"sound-name-prefix' to be used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index 76aa1f248488..abac5084d63b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -120,6 +120,7 @@ required:
   - fsl,asrc-width
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -145,7 +146,7 @@ allOf:
       required:
         - power-domains
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


