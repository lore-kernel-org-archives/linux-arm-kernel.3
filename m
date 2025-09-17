Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1021CAC5A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1tLQICJccJfvVZEwWqtn+YGIYSr4fOfl7vSDc9+E8Y=; b=RpAGGl4e2C3EimvbRSVeEzk5cW
	rrDLB3s9zFcNFV/XJqX6d11s6Uf8sGujHghzBBDejJVfU04Li59YuvMJHeYftNXFsaMHQkQ7+w3Cm
	TahX8ZjF4V+0Y7nUi7lTnwi8fx31q5FIQC/vT4MVcIdK8BhZiJ5jWGYD1WvbwXzmyfVDv/MvFbsy4
	aj6E0RA7Y1Du1WnhYb8RrBnj/HGY10Frl+8tv7mUL9p1WneLooRk9xM4tIuAtITqGq0iZeBCQstgv
	pkVvVbfBWAtKTuXSCpqo51HfTK8k07FKjyuBTDiif1xwNYebYV4RqYBVOmi0rS24cDTl4qbzOay18
	kVSkYBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0BJ-0000000F56E-3XVz;
	Wed, 17 Sep 2025 21:59:17 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0B7-0000000F4tM-0uhH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:59:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9AOgf7GCwcY2NU079RGsi0PkpVP3INfKJI6FpqZa63ehAp6cayfNXRmvbNRnSNlNEle/dm8HOAxt5X4j5AY8yNPFYKRpfebAc1ZRPLFMjOw+7+xRAIXpW1Q2zpVhhmK9STb8hBu/0w3eESpOF0ILQX2Y3f5hrFF35U9U3sgNn65VJobwN4zYpnYK14j5y/CIUMusr0UqAT+yOCMT5Qq4teJ/XbSkTRHbf4kvWeMTMkByUsr1j/TBqSrRO+3NRlbdikaRbSJTt42e4ic1Xb8oqQJ3LqqaznP3/cCl/QbIzCGsRGTMDMDO2VwSAliTLOtqNVOTZH3vcVPfRM8AxYRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1tLQICJccJfvVZEwWqtn+YGIYSr4fOfl7vSDc9+E8Y=;
 b=kvUveXc9QQKeKR0ecmogoccd6/deBdwocZ8u5fU7q+vcrb9FzLoCYnaNXx9FyCFyoN+IN1/Fp7k84smIs8Var0gyRDbRWawhM4Wi9l1Sso8op2liDesAJvwWMm2tGXmIIV3t+/VBjTlfPyjA/qyQvGpvot5Ecx1MwfU/U3ml3GLA5hwWk1qCgkJK7fi4y2zzQqxV6AeIfgoLXTLBofojtp5pw0VbkBoMhNF+2wLgpF18MlyW9PsOsecKL3lc8udtsGmyrgKU1OejDgqV78sB+mQ/OXTpY4iZrrsVLX4n9+m2KT63mahFd9nudMJblO1xBsmYJVBEs55YX9OBP6I/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1tLQICJccJfvVZEwWqtn+YGIYSr4fOfl7vSDc9+E8Y=;
 b=0pZnSpJlncpecUquUxp55PH1bCzer81vn977T9P7oQqFyW6RRNoxiDSq4GtyEnzBF2y0Mqs/fa6wjeY2zIrsakMmjMldOYddrG05GRR4PXSI+NsHdj2N/BlRHNdbtjAtzYrHwVjA4/V4X55kVCE8uJXVm/jFoNBI/3ZhELgxMHJKcCyOBuzPq2JTGLnSeE4B31aftm5mBIlVUGqbrTSqVxMiFwryvOOwWjTWlZBafYuJewSddtQ0t7YdFqqEAnbfZdYo3+6ELeJaJJ0DX4kkO2YqsSwjm5LhlpbRUrR2nwyRJeH4izDiWM7tAFHlOm9r4PhfjVzloYb/Cel5Fhgh5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB6322.eurprd08.prod.outlook.com (2603:10a6:20b:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 21:59:01 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.021; Wed, 17 Sep 2025
 21:59:01 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v5 02/13] spi: airoha: remove unnecessary restriction length
Date: Thu, 18 Sep 2025 00:58:38 +0300
Message-ID: <20250917215849.19720-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917215849.19720-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250917215849.19720-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: fae06336-d3a6-4c58-1a87-08ddf635693d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ndGN/Kn+U3l3FAI4t1MetnHkgxZxy0w8pz2rPt/zPMsec7uLs3YPDtJPZokJ?=
 =?us-ascii?Q?iTj6MK+G10zrATRQcwT9Lo2cTZ2VS9oFzgkL5dGqUIOfQma2LJuMo7fzwmh9?=
 =?us-ascii?Q?D/i71qOcBYr5C0pRzztHWxsKnL3Tksf46/zLuhPCB7uWLHctvaCBSoubx62w?=
 =?us-ascii?Q?lZNdnbcVIh1Wi2d3hUb3NhVbr2ghEJZ82zdpel0ECBeku80pO1O+jG1dlF1g?=
 =?us-ascii?Q?/mnLuce+5Hr7MdF0wwOCwMx5x53Du1rhHLbyxbLPr1MNIsAKNuAKB5TuFO4+?=
 =?us-ascii?Q?kT4SS1vgcCvgUejnC4Z1w7Z2DdCPZQVmeu+xCSGT3Uy+BfAu6sD0E1SDxR+9?=
 =?us-ascii?Q?lf6Rvdq3W6mDsH5lLRRlDZwhmWLsq5PQxpJq0QBFKwte8OcDtjm4pvFBlhk2?=
 =?us-ascii?Q?mgQBev/AfAXdOm9UqpM/do239GnKhqiqcuqm+9p6ZKpQCntpJUkUxTC1lQaQ?=
 =?us-ascii?Q?XLhawu57bxu3iWqwfNrO4fWXeHLyjIMu7m901ncA07Fg74mCDnaNsUjs9zs1?=
 =?us-ascii?Q?oT9trWkqTYZPvVRdL+sANFPJQayEbDnVyHjaHrhtg+UWsDdPdeSsg3Mq8q23?=
 =?us-ascii?Q?66vhoJEujJyrdR1S2wPFY3lp4pd6ermcb1nqDqwUU3+JxtoVCBxtIZ9YDt+S?=
 =?us-ascii?Q?yHfVKv84RIF+Wci6k2w+0pfq1OukIsOcB6DnE9H6VwcwexOdAdQqKHQB0Rn6?=
 =?us-ascii?Q?5PYw1g1S38fQJQ9GNA1HjRgLVWud3axEBG5yQ0Ls6iVbdmelqd9pjIExtFhw?=
 =?us-ascii?Q?+wcYogH1K+KPNr0Er3k8+HUjZMqVBhs+sV5OkRlAXRqvNIMY/wneKCqcQPly?=
 =?us-ascii?Q?QTsLJEp5N6LoN+Hj0Xf4BXm8RNcO3CC+txAsr6v3IDynGrTMIMn2gb2Tl+gh?=
 =?us-ascii?Q?UQR7jdFpBX53rAPvg1/ALxbdyUixJnDlmnFitIAIbv4nLTS/z7oiKkgXXyDD?=
 =?us-ascii?Q?VPCYNMke0WSdd/aMGNRCtrN9tqaR8t7flCkHe7gdj6xamBDKXfuOsCtwpkMS?=
 =?us-ascii?Q?SbHM1gN2yqA0rXNGlSZv+PnIl01aBaV1IUeM4iIHy/gKxzG0/94OW1inuOKe?=
 =?us-ascii?Q?IOnkx1qIv/DhRRHJLxGTcTWXmKbb+WXmB4q0Rgd7GwqMPo4mVv/VkhqUuRkf?=
 =?us-ascii?Q?V7fQKRK3TbLV0bDAdb/xIh/xMYuKXfT41hEeGShlqH5sSxYN/eUPtES0gxkR?=
 =?us-ascii?Q?JepctPSb8fB7xutuREr9TKhPW/HYZi6csW1X2jb2lylc5dWfz0U0vSqHWvvT?=
 =?us-ascii?Q?i1bEsKFcKohoP2MBftL8Fk58UWCYfzu8R0WPxyvegpFHKO1xssCUs4hlEBqw?=
 =?us-ascii?Q?CUehgMcDl34ha/V/0ON85TAMI4Dn/TDdsz/MSvA+tsqp4+WOwmh/SFW7NVQU?=
 =?us-ascii?Q?AWyfIu2iriwj5H372UnWUl+FC7eRdOwNnxlxooey34zd0r/ziGnh5NzucTeo?=
 =?us-ascii?Q?cvDxiiDWempI0CZLF23OYV8wDVV+FGTdEbhBQNRZA1/2vJTSbv1+yw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?612XZqeWDyoBnzjT0cMS3PBLfTZ//ufCYQLcwmYM324dgw77eBhqoH6tahB5?=
 =?us-ascii?Q?VdwtP03m2ciYUlPhP7tKee/0dVZetAevVgH4+wM0ViuRs2H1VyLTBTIV0DeI?=
 =?us-ascii?Q?TE2cursFaKOhfdaWnKya1qoOb1jktmc/gf8xYrjuaGzas7d01Nj5h9nxagvA?=
 =?us-ascii?Q?uKkxmwI4xL1DPyownYx5Dz50KLNiQnvdxJBZ3JLbX34P3VnCyyNLyFYdzcV5?=
 =?us-ascii?Q?oAI8Z715KZN6aeZ4/riy7tjaTivB98u/5oNR4kXBV0dHfR+o6naQpL9EJNCt?=
 =?us-ascii?Q?EeBq0mdsHhl5kUBjikeMS1tqNSLGWhuEzohFuxCko7KYCS5NDkQFmtcGto+U?=
 =?us-ascii?Q?+z5aDDKdIKOR7xMdhYDUh/G63Cl4Hb2AT8snobU6QMVcL5WD8zsPZ2iJQPbG?=
 =?us-ascii?Q?V+I4qVq9E3FL8M6gKlODsi2DgjwFYmgjf2kzFmVWGKAA+K3TxSAcariDAtCp?=
 =?us-ascii?Q?ccAuTgAiBlFIj4ZkX3QsOqSL92CMSay84xDDT1YZUvooUZSGGH0X3K6zHcKW?=
 =?us-ascii?Q?YycgJy1IfU2I5ovqUPgQC2tcQpgU4NtwbySsuFTkAPedi5x4WRnR68TA3Iju?=
 =?us-ascii?Q?8JvL/qkd2oMWy1/wXuDT2EHMQYC4wFcZF+LWBoyPLOM22/RSrobEyJFFE3KO?=
 =?us-ascii?Q?m6RsHA9mKMxEMW4LVvzt/jVkmFax09eQzW8pCzIZDPGOiEcH+pEITasvUad0?=
 =?us-ascii?Q?0+jA49Bco8YPiQQoiIOcaaLkf/Iac/cz6cGpc9vyBB74a+7ZZmJifq1mEGYN?=
 =?us-ascii?Q?vqCmSL/uK/dF0WxDutEMQfYCmjSB1lElH4nd+sMnaifSmfGnr+wuNn9c5OLM?=
 =?us-ascii?Q?vtfoefDlMyiOL4/K1gFGDA/cpILMTOXxO9aTyM1HDk/WXJFJAMIof8xMBtVA?=
 =?us-ascii?Q?M6j9/8NSRe5y9HpA46RenZ7/+no/fpl0Gk80DmrOo51wiUZmrydrZskqWECN?=
 =?us-ascii?Q?5ew4Hul2bVytlzjC9JWXecPqzIJMUL3xvioLz2mXe1AyOa3Bf51Ke9JjCHzI?=
 =?us-ascii?Q?dJ4pyytO6jh9S4VFWdHnwj0Ou7ouSZ+e52rCe3a4aBxIARXZT45utD77914X?=
 =?us-ascii?Q?t08s1LbycyhbKoTky3vdbSSw/aKiX5WiGNiHx63k7Lc2isHSCID3lkUJrhYJ?=
 =?us-ascii?Q?0Y4edh4hVuvJp+ghO0TICP3wuPrJy7XBPwT4o2Nf9a4LsZTRjftSoXTjttqM?=
 =?us-ascii?Q?M45yQ2ZNyPCln8jUvDcJYzYBU6A4sa1TjAO8PUS23385o0/xwDVu6ytb58m+?=
 =?us-ascii?Q?RBTshe+CtaZY1dUG+zWcXoSb0zNEtAmMzuTpBRAvAHHfAraM/gKu0vqpVqxA?=
 =?us-ascii?Q?TOx4eNNBSnHaFz+54VA/otH7zpyayorcJR5tC+wwa+DW3TSZb0Dq3JWqVn/z?=
 =?us-ascii?Q?m9M1utVqoo644rqSzN0HYe2Gbc6CWqoxXXsNTLJtna2f9hK81xWZSt+RjI3o?=
 =?us-ascii?Q?ulN/kxb/c4ifuDg+jw45qm5seotcjqqxvRtxQefuFFtvA9/X3B/sBHb5Opkm?=
 =?us-ascii?Q?Uh/MPtHuDjCrfHR/Dh5CJxycYKQcQnR7Ex64fQU3jPRZ9BmPVMapjaDHUUIu?=
 =?us-ascii?Q?Vp+jzp2Xh/A8S4R56i7X+f91GEszqvcy8EMutoYPB+54XNtlTBHUcB8iGIGg?=
 =?us-ascii?Q?ZWSIOVwQmtBFVXCJqElqHWw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: fae06336-d3a6-4c58-1a87-08ddf635693d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 21:59:01.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+grMH/0rdRcdFWfDFGzsuLjZ2aV29g01X6IP4byaRPAKXOABi9vqjQ73uDXmHNtRHw6P561KRQ13xIhXwFpo4aeeMsLJtKRs7UfV58kqnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_145905_273957_AB93D0D1 
X-CRM114-Status: UNSURE (   9.09  )
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

The "length < 160" restriction is not needed because airoha_snand_write_data()
and airoha_snand_read_data() will properly handle data transfers above
SPI_MAX_TRANSFER_SIZE.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/spi/spi-airoha-snfi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
index 043a03cd90a1..bcc464ec9c61 100644
--- a/drivers/spi/spi-airoha-snfi.c
+++ b/drivers/spi/spi-airoha-snfi.c
@@ -579,13 +579,6 @@ static int airoha_snand_adjust_op_size(struct spi_mem *mem,
 
 		if (op->data.nbytes > max_len)
 			op->data.nbytes = max_len;
-	} else {
-		max_len = 1 + op->addr.nbytes + op->dummy.nbytes;
-		if (max_len >= 160)
-			return -EOPNOTSUPP;
-
-		if (op->data.nbytes > 160 - max_len)
-			op->data.nbytes = 160 - max_len;
 	}
 
 	return 0;
-- 
2.51.0


