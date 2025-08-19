Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C5CCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtORuBZ2j4M8OoNH40Tv6s2Gu77IXPjMXivcSSyPqcU=; b=0UYdQj1tOVBhU7+pIbCBzRUyLB
	ckci+2t83QkJujDpnTKEncDqIeAxCgL6R9n3jyLLOI2Qk5cIYAGeBgGpRH3z+/xVsu65js0SACTz/
	BQpR2BsHcZ9ScUwel8HqsbVMGSwEn0ws9AAsPlObNy6lR6c+3Adt0jEDi5sVWpoWMM+Yqx7OarHgw
	XaqPINyqRf4SVhcnU+FRh4tRdkQLJVOD3qOzfk/V1RD7StVCg1WRB64eU4b7pTmZoD4ZVwb5I15Pq
	Bmmm/jZbJmTimtD8s94zon4LFnM44279BIFxDmsZPbC1zHgTTIW+y3r/RGUcCxvB1eCA1GJwfTuNm
	vNfEDcaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKDH-0000000AEPR-3zoD;
	Tue, 19 Aug 2025 11:09:11 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIXW-00000009wOA-0vRH;
	Tue, 19 Aug 2025 09:21:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VF4oCXLpCHK8RL7/rS/jUM2Y3FLnwrfBNdgjxJq+Mo0jiA3Ozm9VWQm1bteGz25vMyd+pFOdDIC3sYy0mEPhejPoqpKZgzYvFrQn/RvA5/FKPfKAJ6lcBPPNzMbwE4tIpNR/czcURfxlVlJR87RRLu38VE979GTsEaBR6h6Umrz+FDqNr+hatNXu/lWR15oAvzOIQnf86rL0x+ytUYPRdGF15tWrjdhXhj9r8rtXv7qmLeU0VTGQsdOyb0IJmhKrnxLl/qY7CdSElSVZCv8ituQUCmxE7ETuUgfwyDxe1HxEiZfAjXxxQhVFHSAAdakrmol9Qb/gpam12zColHJOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtORuBZ2j4M8OoNH40Tv6s2Gu77IXPjMXivcSSyPqcU=;
 b=LTbgipvegLcnut/BOEexWjcEP+/e5V5SlAqXvs/NeA5v1i9DqS1knhqCm93L1acWDx4uOHee980aa4TKAWEjDxyQL2kaWo7PGt+YjFM4KddtEsWzETYoJUt7lk48fchQDWu3pTOrMvLRhrsNQnPv6t9M4djt+4WlUKHXQajciZPPBjOU+yoowayA0oG8vVmm6mFkK1cSF2Prz6fNdCmR2lwK5XjITO0/rDPvhhv/tblbpZ+ZQYzo7rmPor98OrSQZ78sWlTBf59yiRDXGsmaBs4Urz8oYUz997rrNHPqU4KR/9TQ4pE59enkcGPtLwpq7DkVfQuy1zqAejbO3uK0gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtORuBZ2j4M8OoNH40Tv6s2Gu77IXPjMXivcSSyPqcU=;
 b=csOVydq1rMVv3DpzAPx6HUEVwY8/bUHk5Mfx5QIZEcK4F4bc9hFNmFKaajKZqDOHFRkuYElDyNrNmGlxh92c9riRna+WCXkWGyhfbrgaZkh6lWEq+6df8GXejSxx9w5kVe5a+ozNOQF9X8FPvreTrkDAVMEV2lk5XiSvP11ydyFF8ZqCOyrsdeAslPoX7wIZrDh+VJxpRph1JB1FjgiR3PDF3nMonoY4LVycTMs97bW4ecH3DJmBUbCg2dY+EQdA52YmrT5WnXMqWMmhmXWDOZoCZkxtlV6SMMQT1zMHYfxAUFLihUiEigm5Dcx15mc82riDklwcQ1WFx///Dxpc9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TY0PR06MB5054.apcprd06.prod.outlook.com (2603:1096:400:1bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 09:21:54 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 09:21:54 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v1 4/6] spi: mt65xx: Remove the use of dev_err_probe()
Date: Tue, 19 Aug 2025 17:20:41 +0800
Message-Id: <20250819092044.549464-5-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819092044.549464-1-zhao.xichao@vivo.com>
References: <20250819092044.549464-1-zhao.xichao@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TY0PR06MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: 187b0482-b804-4ae1-c55d-08dddf01d63b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bj8ul8B/phu+fioIsqlVPxBp1O+9qVAuhcoo7gGCfHmWg4K+rOUn8CYusIEO?=
 =?us-ascii?Q?houBx3UCgGiBsPzLQ4oCa1YkmRSjOQKDCPEiiDHxptcrM47LEoYhsaPu3bDK?=
 =?us-ascii?Q?/yQFEtQ6bcM+Al8rw/0f8lxanK8hGfMsgjmhXMlewLrvynl44roaNfc7cxU7?=
 =?us-ascii?Q?6/2mDdjWirvn+K5cvn8GdT/W6OaVk8MWmJnVpq9wXTl1SHIKbF0L6LkhJBwi?=
 =?us-ascii?Q?n2uR9Y4sotjInTd7CcggaQjvkTdAQd6WWVGoPdwSLKETntGGgPLeyxCVa+9e?=
 =?us-ascii?Q?j72rs6n+p895LihdpZOc1ykH2bAGflF/7F1Og9vGZyRkDNNwEuu0NsCkcjND?=
 =?us-ascii?Q?N8zzroPV0XgkM4oXXijl+AjJz9usRxzIVp3Qj2lU/5Du/Z0ZLgCn7DBA9eBw?=
 =?us-ascii?Q?vg8yq1hwAZLS8ia4fE+Zj7VK1h63Fbie9nP9csxI0av6TvYjgar6aqVNqgG1?=
 =?us-ascii?Q?4ObItzAXjQ8v2B6QwwgYoV5Q4EoNngsRutdsNxYMQV2sx8tEcG+fIoSV/4YT?=
 =?us-ascii?Q?GAEWr3Gn1+mODCjzTFOqKIqewfF4jtYA6a2t3qy3xiXdtSRJ4GTUs6YD2JP9?=
 =?us-ascii?Q?MHlU0baJpvaTM5RpfvBj4AFX9btYnSjKcmliPBn7yAft1VpRdd/RMR4dE/hr?=
 =?us-ascii?Q?vslo7RJYvu0xz/oU2L3W36MHFapO70nVv35GnJSEXKnVX6dgtN7H6nNDxMj7?=
 =?us-ascii?Q?2yEDzRP664ShIhBjO/M5bFvJOKjp4Br2ZF3ArF35Kg7TfytmARQQZAcGxAUT?=
 =?us-ascii?Q?zdVOR1E1Ra11udmdeMvFl+c2nQflvcpMZqz4ra9Q2KpGlbhRPTIUXw6+nm5G?=
 =?us-ascii?Q?g/7mKyGO1VDbEhtGF7hb3FG5PIzt2aXR81b6/gqy7pA/qIUWTsfjY+/9seiw?=
 =?us-ascii?Q?5sF75mtZC7WkPnyySzgX2DJjClk1CfdNMZbPAFjkftJjZ5WVsqfWKcMF+KA3?=
 =?us-ascii?Q?XIKDLRFCITy+5K44oklxEkhf1euarszVOlrW7u8WO3RQA+U7DS1hILadMsIU?=
 =?us-ascii?Q?rqGXtN/tCHb77Ke5QKKkeodwOSk1VvYedgSImRuTYoelOBNHTQ2xAB/tAhPw?=
 =?us-ascii?Q?yViKRjYTg+cGBBdkCbN4rRCdsotqpF1RD69c6Ww0s66BVzct98+5od/1MzxZ?=
 =?us-ascii?Q?9cTimZjiM2Z0MH2Wz106JZlQGPf4tbxXvqD92L9gU7Ay/UayrW3yTVAdikA0?=
 =?us-ascii?Q?ywrdySbFzubgCbrs/cWpkU6JGTt+Ai50vM/tbjsKQgB8rSKrRIEgFgckfgVG?=
 =?us-ascii?Q?acHr2xq4KCKQjh3aqzsSs2q4a7XLt6HYMwctUHQjnX0gFqGgp2FOX9DeuCF1?=
 =?us-ascii?Q?QL/Tq9vWd/T2TaTEFZKSitpdtlGe34zWFrJIxUf8d1Y7i7jk5c+4BetMaotZ?=
 =?us-ascii?Q?M8qoUoVYVQ1pBeJE8oDTT7AOsTW1GGMddTTmldWdGQMzxzYgC9y65SrD4+0r?=
 =?us-ascii?Q?SM6KRh1aZexdCJW57cg4mX9Nh3eo15goGs8CYI+34i041O3ThQiuwQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v0JrwN+bueePnbUnqxUiAedOhY7Dy8F9np+31utHaOwvIVm9IzI51m8uuK4v?=
 =?us-ascii?Q?PVFCcdwAybS3gsO8lcMU2Wcx6IyznLniycxlPsTufSVtCNRdmI4aQ0hY2nKV?=
 =?us-ascii?Q?YpEL+Y8QwJpKNcad0HmHIASjvbDulBXUIin5m+N8snqGFAsNwhv29eR2J6gI?=
 =?us-ascii?Q?sS1Fj/0fojdTQBTrlHmOlau65sT/DY+66j8FAC9vxwSHWMbp8o0ui7crcb09?=
 =?us-ascii?Q?0Yg2CkGd68N0ljO9ZSovFWSX0wGUtfMbVnJxVyvebJOIndCqbR2yL6RdIGvn?=
 =?us-ascii?Q?B3kZWIMJ9D25n+EoeiguzAv8H83DxJQRiFOhLIM6QC5r0Inh330YCahvlDx/?=
 =?us-ascii?Q?I3hm7JjIwWcCLLo8Jed70kpX/aD+BFVMa0r8991LG9+qmCWAugFnV6hHB5CK?=
 =?us-ascii?Q?GhY4wCLg8Sw5CtaGLbYQmWyJZGssNivRzzM25JFxHP+qLNZoijslaWrG3P5C?=
 =?us-ascii?Q?Rl7RS2jAOaFw/NZsQGNWwx0rXYCX9JYVDhUyY2gJfxZWfWMnowzRikC9MlIy?=
 =?us-ascii?Q?Wbt5uyVPpgp1xWKZfutQEOKCZq76Dgz1qA20LblOm0M1EUvd6ffxm5tfhZ/T?=
 =?us-ascii?Q?bh8Y+q8912eavvaXOj7C2xSKpRE5ym3ixU/YnlMABDYgE050nfxd9EJwlKkt?=
 =?us-ascii?Q?tqVe/0Bm6I7M3Cjkv3ZOP76+2zX4rKEbwWqjpijRrxaKujzmiOppBBVlNefS?=
 =?us-ascii?Q?Am8BrfGT3+xVnOy7ROfiXigAx1kGL1hFux00oeQ4TbF2x7xwx7IpAVXqvSXX?=
 =?us-ascii?Q?h9OzBFdHus3vPniLupfPwDtwvNwh853+f9edRfM8axdgerLmuMUJX68PiMde?=
 =?us-ascii?Q?Gac8flxtPB8qI2Rtb4VHFJjsYTkfsLTVIxVLcxDVu+2UyKoY7hrBQ3nBEYDc?=
 =?us-ascii?Q?qa1rwMlxslF6nN9jjEtZ1TKXVH2vv5WaXKJUrEHm/xTvE3TqVm82wj8NdCU4?=
 =?us-ascii?Q?rj9BwtipYzYEUNw0iNHVPklRlUE0V3tiXZGg0IniG27dMhzOFiURN1p/cp2P?=
 =?us-ascii?Q?ofirzYiqwKEO1wFVNeXMViZOBhx0MzgwgByIyce/Sa6CUkQYTtN79Do6LZ0E?=
 =?us-ascii?Q?OhcZd27jQ4+Fse4+ZBlN2dk/JqT8jf8Ll9kHSJVRnjfhEQPt6yLRUBTEY7Av?=
 =?us-ascii?Q?L8D18n40uSDOr2u2cJ6mQO3YJes/bUL8gPUCBgBvBCUmp6Elf888OemZxkyy?=
 =?us-ascii?Q?j66XFCrme3EltEsWjemgVEG9rrt0j0YOKgk37d7QmmLVoO1vZFjX0xmS6Zmh?=
 =?us-ascii?Q?Qn9F2BwQcpYD3ThlAeK/zhIXFK1jt8uPwbh3qCoYmlVcNXbuWRFw2/h0XX5L?=
 =?us-ascii?Q?Og82KT9d1dfJj47I/vajjGLXqTvR96rzHOUpB2qW6ak8EfKqDbSqT8Q0soBJ?=
 =?us-ascii?Q?3MZb/L5KySadtaDWqa0j+8AMziTZQ4epYERya5Esd2DWJh6LN6VB8JkAyAfl?=
 =?us-ascii?Q?MNkgJXnoByNylpZ0DwlJ55CNUIhEY+aSfAlR6G994RXGwxCBytHJ23vHfKHu?=
 =?us-ascii?Q?5XuhCUh6kPkB8VkUh0ciTdrwgtz8pXOa06Mer+Bv23uN1jZWGtl9UziuNeeE?=
 =?us-ascii?Q?j8hhJf8LaGIo8XPpZEftV2vxL8HzShcas1ZyRbsr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187b0482-b804-4ae1-c55d-08dddf01d63b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:21:54.1235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Q3WFRv9E/iEPbS1DDLqFOAdkiNLPUC2KfgJUi/05QRKHSdZZ1lvyueH7Lkahb038FijI/4seyCCGi2Y3y0QXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_022158_261359_1A5027C9 
X-CRM114-Status: GOOD (  11.37  )
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

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/spi/spi-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index a6032d44771b..8a3c00c3af42 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1159,7 +1159,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 
 	host = devm_spi_alloc_host(dev, sizeof(*mdata));
 	if (!host)
-		return dev_err_probe(dev, -ENOMEM, "failed to alloc spi host\n");
+		return -ENOMEM;
 
 	host->auto_runtime_pm = true;
 	host->dev.of_node = dev->of_node;
-- 
2.34.1


