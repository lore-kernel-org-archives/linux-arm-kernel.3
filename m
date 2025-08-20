Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D7CCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 12:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dARcHoCM4HyMpVSyowxjeXYn0ojHi6T9vKH/YSmCFB4=; b=ALKS6VN1/DCQQFaEMbtH3IVGkC
	mu7YdJgVWmET4uuIXKv2qod/u0U57zBIp6zNDnGhOLe97qCLRUGLyMrX2gaHjA0Zp76GPEp04MMs5
	cqQG22PK5ZZcLaBjWOFmgjxgUcWOTIeJeIN4Y9ffrc6IVRzE/+MIemAlJ+N/qtDvc9jGzVQ1iR51o
	WvD2VbOOtVQvAquQbBZqEAgw3A8udqtNybLSxHBIJ0xnXiTG0ezOIm0zDE/sHBUjBn2WQbhpgK8cX
	qWt6Z3IcDxPQl7Yrbq9zVBEBARBslYfVNF3WXw/vZswHJXsh13kpz1WbSNCpzfolJrAmRCy23we+L
	8skQjkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoi8b-0000000DcRJ-26XJ;
	Wed, 20 Aug 2025 12:41:57 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoi0T-0000000DZwd-2Zzu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 12:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bth/NFN7SeJ9Mr20yIIARrtXB2N2bQRP3jmVBzzsPCvHRU22oLIltb1jBnC+irG+KiYxPZVkyWJFK9apiow8EEJjwm/8fKYQarlTcHbkS6Q+crLvVJqhTOu/XYf7p7h8OBCOjj6SYBkRlJLmh2KLyHUnsnXc1dDPzQH4ZIIcPq5QHp36C69Ibp7np888C6KIhsKNoyPoPu09rww8ZtzlAPbFoduLRS1fIVP5L+RR/694SWa93zIxhysNlLxKZ4GthKWP/vK737mftPmR00SGqvKdMna8RW7RcKdtopSCSz/c7+OdtoEk0CNO5p9zZZ0Xj9ebLrqUIOeniuj/y793uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dARcHoCM4HyMpVSyowxjeXYn0ojHi6T9vKH/YSmCFB4=;
 b=Cmu9pmfC5xMdW9a0y/dkkMPv8+6u4COuu7L9szidchkFblMRN3NPX4ipRY8icJm8xD6ReMyKOSGHoRUkOP6GRU+7Mzi3QgNtlPIPNbof3rErxbMrajkUzarfYm/EJeG/fmNPJt/7rrCVIfR830eZRBY4bDdwLfdhDcHgev6qLyDw5oeqMTiC5YpBfutZX7YQnVFgvQdKnX0eoWxKlYG5TAp1NLEyFCPIkGvYDjbNxs+YIpgwAMbouYbi6ARVPwi39VGJFQrf9p7CUoanq0jfym9jIQePL0Nu/LHf+X3Rm3ZBuoEqgrFw3LHuTCL/jsjq4MIzL8hqlvUwj+qjRhnhJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dARcHoCM4HyMpVSyowxjeXYn0ojHi6T9vKH/YSmCFB4=;
 b=s6edJEqeGK7Mf9+jOGypBtNKtFOmWLUWffImjUDT46Xyhe6y6nPXYmcjsoEA/sFL2QdqWzBt+gkaSfe5zE8DWzI/ASKjAP59KE8edIvy3LEKI6B5ZnhjZBxlvOgSGceJ67T0rqbP4Cq4IMIXz0WYIPOwNRF+zCIpZe1tJ4dYYsmoEj5+TB4/mXQzRgeYGERs1JyKQTdswyfcGTggzstqwbrItrSNvEdq0Nm3i7zvhPHC0XdklcFoHfw7Xu131wOTje0LkI6PuXer6DDZPGNaSJT1tVUj3bhgTQZcml6IhlHdeOLGiXSERNnrhP11hik1cFEMonZCwzAneubRgZvP5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB6355.eurprd08.prod.outlook.com (2603:10a6:20b:363::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 12:33:26 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9031.018; Wed, 20 Aug 2025
 12:33:26 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH v3 02/14] spi: airoha: remove unnecessary restriction length
Date: Wed, 20 Aug 2025 15:33:05 +0300
Message-ID: <20250820123317.728148-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250820123317.728148-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0151.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::14) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 60694f2b-d791-438b-19b3-08dddfe5c276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IINP82Msrn5rFhUV8ayoc3YA+F+OkF9h4+W6I6S5BWxqaycoG6yeNL0M/mVv?=
 =?us-ascii?Q?Dq+8qcR3Y7WLRi47Jfa8V+jt7xVPsOU4d5lVeVP5TXPFsl//vvVX1QEY1sTm?=
 =?us-ascii?Q?BW1AfBTvIko89g91EF12An5cgrKvqekAl3U6juJumif+mAYqF36kVaZPTLE2?=
 =?us-ascii?Q?3/9RxEYRUWJhfo4B/PDPFvNOSKcQa3lIMeElfXbV52qcC+yxzC6YzgAgkYTi?=
 =?us-ascii?Q?UbG9QIw5vh9hhAqVPrMBC5JCu2i48joDB06bVTQAtc134NZHB1ED9PiUo8Zz?=
 =?us-ascii?Q?9Fb6Irxy0TpdJP6jPq5q2hy5PdVI1NnLguSjOD4LOgISrdF0aufRE5+lGfL4?=
 =?us-ascii?Q?m+gU3LyjGhFbDLq9uJtvAx3G3ESAhe+H/pqrErSiZZRk+oEPfjmW03hGdWyQ?=
 =?us-ascii?Q?kXq704pSm72BVH8Wi/Ahq55aPf9+u7M2OMCot/qRq0fJ+RY8p2AmXSRJCPCS?=
 =?us-ascii?Q?lHlRy59jJvtkwhLJw/k9LZsszCoqae+JRdxr3xNDK5Bou9kqrJ2lsFPCQrbe?=
 =?us-ascii?Q?Mir0X0TMmOj4Seal9UM6iRt0SBlHvrQOxujZK5Ul5kWKoAJdc/WHfhsaPJMM?=
 =?us-ascii?Q?+s1+9SblN3gorUeVejYeJtp7Vi8xQHxcJExgP5LyaDylYzLyVy7vSdeMsK2+?=
 =?us-ascii?Q?fI1430E+QaD8uubxeIYbGJ27A9TwdfqtJlwdg0D8WYIDQm3sTV0Q9q3atrTU?=
 =?us-ascii?Q?ErqEO2aHG3DE6FyHFhXY5pedmwq3BFdDOoEO4sSkRJy3zt+X8FptJO7c3tdc?=
 =?us-ascii?Q?05b/hNcdVBuvLIqQeBdxzdKolEKZUYhydy90LqEYwa3y7VvqLEhc2Zpphsnc?=
 =?us-ascii?Q?6OJarMMwAgTmrr8cbTVJ0FSVf0kWjiFl+OimSXzKvCG724n1y7VTRBPbytzH?=
 =?us-ascii?Q?GCgKGoNpEPpa0ZA3I803lFRfn2ncPuYRZOTljWJYRrQdr2k9A900NoYf8QI3?=
 =?us-ascii?Q?zWYuD1uLSrsrTiOPBRXDUO/PszMuifkbD12l7ae0RrONUlRz83gw66MT0CP9?=
 =?us-ascii?Q?aDIwwlRJuMFp0qtT7e1UPEH3GyAbaFGbLM+pqY0SzvOegwyKlr2hbal0zm6c?=
 =?us-ascii?Q?nJUvAU0W0VqEQDQilO+NjkDaOA+hk5sHc7sEuCmoES7WAOuA5J9XiY6VJkWY?=
 =?us-ascii?Q?vsHKbGKvvmpbgkaVb3qkMtdQWJvCCNulf6vxoiF+2OxrO9OtNnkhszviS3K6?=
 =?us-ascii?Q?tJFQYaiziprn36Ro7hzf4LpF74Bgn502wjpWqxMPb3gerogz+n75pZEA+ejT?=
 =?us-ascii?Q?MFa/gNshbBlvUkZSvZDzqPofufdPMK+49z8WQyEG1f9ceKoS0qlP/aXXaL74?=
 =?us-ascii?Q?Yu871schPy7xxycswpMSYSrFP6Lo9y1/6wogA4xd61Tz1DsUKgKUPDf6QUHe?=
 =?us-ascii?Q?XEmut3r3+duc2qOpdvAno4m+L9O+AKzEnm/gIUYwXzLNFNUOUfA4oyTBiljN?=
 =?us-ascii?Q?SeZUMvDzQB3wtdH4U7mO419T4hRbyuZAGG+sHh/cJTKRtXIU1v9EKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DyOeS8LkqM07fgpdnrrCQGgYe5ar37kyYLGTHc7sdeFI4fadJ93TYUwRq6rX?=
 =?us-ascii?Q?G5fCokug4fIHWe1qb6/PEnojR2KdyEl4bBdkJVH8endr7KSufhzVtYWQ3wKx?=
 =?us-ascii?Q?vu1sGOZ7wOMfCkGr7+WWV8QjMbjoKGOQTkaBnWl2y/auluWdpl6lh7uGmylT?=
 =?us-ascii?Q?l4LijOhLXUO1r1t6obpoNoedA32I01wuTaa3BaRiLKvCeq6wtRYvtWrdC5SR?=
 =?us-ascii?Q?YfOGe+EBq7NWy8wWuS7E7nmUUHFpwK5y2ARiJ+48tp9xTCMVNSki2xBHwljv?=
 =?us-ascii?Q?pH/WLfQuaIru05YWVp7y6w1NyRoU6G3o9m491rqRyBZ377RUAT9oVYQQ5THa?=
 =?us-ascii?Q?fyoQPZKz5j1FOVr65t882nzS7IIEAHnGgFulKicc3Xdm95n+rPuwUXTLvKor?=
 =?us-ascii?Q?dVcuyr9vvXhzBHZsNeylh14HekaK5NVB3RyYS6rzhyM0sPJaDvH5vjesdmyo?=
 =?us-ascii?Q?pH2j0TOsfoav/PWS/iYPm+37iWD3ZGh+PygLvXNderd+QRHq+wa0Y7+CCicD?=
 =?us-ascii?Q?LoVV2i3tRqlOOSB6ittE/LTDKladln08czoyLsVDxl7X/ofpyIR4xTIlmxjA?=
 =?us-ascii?Q?n9H8riJ/ElutxszKYLDxJBCOS7k5oyXesLHlZbVhPicBcQdhdU6woFkNpPnp?=
 =?us-ascii?Q?pbrttNBjQRFy2Q+OWqFNgUUL9Cw/JrSdCtgUMCeYj3tDBMNLeiSiVrIbkNge?=
 =?us-ascii?Q?k8QEpWKymv5cdbyTcvMed38HVZQHUF/C+nalRBxCN5V7o5A+1II/uneovg5T?=
 =?us-ascii?Q?gY84IS9E9Q0Pa8ujnfD8H/jYQUpCUXh0qcgAY8rR+v4L6wykkzdC6MCv8i8W?=
 =?us-ascii?Q?GWSO7djBpCxIuG8b9gToiI3YJnfMsJiDgzHCPfNbE+r2Swf9nJxDtw2+xUVB?=
 =?us-ascii?Q?mbUbJXTn/NwIXhLj9MXN+MnfLtyRnj5h0vArCrrfnV641lb+YtbIclR72ECi?=
 =?us-ascii?Q?VwfYbkevkE+O32mywlzAgOjm8Mkebby4yUnMSi7LR6AAH1CMZ0NnBHGSLS/S?=
 =?us-ascii?Q?LnkcqGswzKOpXOiyMMDifhumvevNscfouQBvvhMNl66JnxBZwlVjcZmOSJRl?=
 =?us-ascii?Q?aoLLTdrM2L67wY+RXucDzWbqPRuFdqSQvGTWdOAms/cBkLKfYI3/j6ZzJp9P?=
 =?us-ascii?Q?Jxv/YzanCOe6vDgtcjoWHgABbQH/1Y6PGTCCq3KL+ykKJQtYXV5S9XlAA2YN?=
 =?us-ascii?Q?5quvGr9fp7/4nQN1SXgArZpboi3kZ8ALVKCJLKWZ+6IyJueeacfOJakXBDAX?=
 =?us-ascii?Q?OgHk6rMZ6SJVub1ZN1Jp6DMcTHPzhcFnxDYCOSIM0sQF9lLWUjAUmhiFOoiO?=
 =?us-ascii?Q?BOVCkwyfAJSbEKb1lEY4eRVrvcDW3OakWcq6SiKFAH1TtrFLdlpMEgx+2/0s?=
 =?us-ascii?Q?lPkuS5ssJ7spDX/u10k4QZVNYQv/Be2TR65QmB2MKMSRtkWs35ac8FtlYUS7?=
 =?us-ascii?Q?z+cksK8UK8ujYao8VP8X4iRioiVbgi4WriKxvUKBh2cYdWdAsgNZdKbtvJ5w?=
 =?us-ascii?Q?SjPThNzXDhGhT9lU883tEJSIWwor5bfD5SItqk1JxoKfrB7hZrVgYFcE9Qk/?=
 =?us-ascii?Q?5vkiYlX+o5fILv1wvmY4h6zMRCmLKNK0F5FK7hAiaByF1hM4QqI5La/pD34Y?=
 =?us-ascii?Q?ehKgIJZBMI1FTxtnYL9VOxk=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 60694f2b-d791-438b-19b3-08dddfe5c276
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:33:26.1246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7FmKjJVoeHSVBtDRhO9CqOt7gmCc1DI3HInaBUMZCr4Dvq9oAjIrGhR/PyVpYOGOicfhDRR3tJKKHj5XFXCdsATbfveMEZncNGsCxvz5SQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_053333_655039_8181D676 
X-CRM114-Status: UNSURE (   9.50  )
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
2.50.1


