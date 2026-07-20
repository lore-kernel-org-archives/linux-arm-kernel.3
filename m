Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D66AC44527
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=; b=vZAfJIW28NKicKmvcGH6SEB+fB
	8J1Qkh8j+CUe7PhiRlmcoY4y1LcVA/TdXJX3PpK+O5puDCvKxk8EKBwGo1V2j6GzAMiwF+XCjuzAo
	zIZ/g+KtNjjQL8fei7QtLmueDOer3WGI7ksUxhRGzwtx3vWLdVUwaLZH4R5CpgPdgBspW63Bl42JB
	VKo73E8AYDBwpyBhfyKxIUrcIz8GhKLgT2i6TA/NzsFIr0ZfOw+EdusB3xmv/ANOTRFPljTvli+51
	mHOypCersXuAxypxRBgTgSMSYO3iCbiDkGqdFBmhW2YZX1I0Z/2H2GOVCy7ZHp66BiUnBvz24myEa
	iTD9QVZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlknD-00000006OrM-0kxO;
	Mon, 20 Jul 2026 10:00:11 +0000
Received: from mail-japaneastazon11012018.outbound.protection.outlook.com ([52.101.126.18] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkn8-00000006Omg-3ALv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 10:00:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4xFEVWtJ/uXNCL09qg+wmDct0qjNgWcHbzsUAnyBsaNlPHMRwMKzumg7BKz4ioUlh4K/Bfia5PfcWy074TrTnfp7NXateb93CLfV0sH1QgjTeM+l/tDow+8d7OcJUtMTkaHSUGEl18jD7WvuwlJgYjL060Wb3D0XHMGZzj1QFPnVxULZkBhA3ldjxzrgOkRHWPvjjqHOvb/EKoBZEkedlYBhvt8yQQR8R+D0T7Azd3Gyf4IzwNXVGC8ozu+KhTW3TRdIV7jTx1/xKU7EawBbrPFdAaKFoTDrAUrUwOjgdVwUEHmkotZk/kuhJP4ide5hlQhSj/dzF8TV21QeVGVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=;
 b=qKCp0IraRHPSyLj6u9/yDbJRPqI7uheADe6aX+Op5ZyOT0a9DoA4udm/rpQJTxiTvFOUGcG6iyeC1cBN6Y2g0KytlRIel1hI2KRAXJVM66e0qNAZdFbXk9cNWLTezniQK221ZiOR4yUwpEHyDsPUNsJH2yZ31JX1VEY+zvU44m/iSbxV9g1+V6pPQEcSOphe4Ehq++9d0iawDk9wgJ829MeakyAsV6NuULc6zVMzdK1Ik+dNr4ne2Odyp+3+WbKCCTuL7CvZlNpXUDk5gxZzdoeP6ORq333/+OOFY8XGEKlpTpOJHlVb8z2bm1P+AFQPelnAaQveVRPJvXmJxse1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWp76fGCLRMdX+Ql14Q1KqYDj3g8xmuSGtKT3/KgRi8=;
 b=PAASgaalANriVl/cFxgKMPn2KW0jAgTHPnTwjygb/rJH2MFNQOugxzY/jIKfjOxBlL7+npxW2HfVXWiLr898juZACqznOau+ttkwfOWCdJhI/ZsuRJqNwVvppjO2QsYfw9iAKxHK/UY1tuuBt3fNcOiXq6GkHCwRHetQY9LInx4wl02FxF3PNzKXSS2XgYjAMOYYDRpyw7xshQKVnZfFA9/rXSnSQWCKw8r5OI407GMe/o6wQ2DVan0Ng9xtm8U4hiyRKjt8pSpyPTDx1zp6O5GFhm1IylCgZ1XeHJQKGG9h0ZpTm6nAgQJvJoDm2/pU1gRpl4qBMwuE3r4+yJtYIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com (2603:1096:301:e8::11)
 by KU4PR06MB8458.apcprd06.prod.outlook.com (2603:1096:d10:7a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:59:39 +0000
Received: from PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a]) by PUZPR06MB5828.apcprd06.prod.outlook.com
 ([fe80::1d47:987a:ed97:769a%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 09:59:39 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Imre Kaloz <kaloz@openwrt.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/INTEL IXP4XX ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 2/7] soc: ixp4xx: Remove redundant dev_err()
Date: Mon, 20 Jul 2026 17:59:08 +0800
Message-Id: <20260720095920.542801-3-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095920.542801-1-panchuang@vivo.com>
References: <20260720095920.542801-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To PUZPR06MB5828.apcprd06.prod.outlook.com
 (2603:1096:301:e8::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5828:EE_|KU4PR06MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: ca173429-aa9c-4d3b-7b60-08dee6459ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|52116014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|38350700014|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: w1IWEtOE4hZpcsLnlviUhMmrw1NNIdnfj/e0kwwi8f3oPIG5TVl2tg/oYt4GP9j6IiRT0sJyOgySqtES211j8i6nf8HrgtzMAiTwJnnwiVeZrKnQhQt1SafOpM9JOyyOnJupbpSTMCjMzkempEpZTWFwK1rKIZGFeK/46Fj9D3f8xkh5lfIW/Ag1j9uJYvCwp6iyQFIhC78gPgMEo+KY5h83g+EGrzpw3xmdVMeckwTQyRkcpiT9A/CvqDDRz7s1Nn6HEQNAazyff7HDYeWwtQ78+BCx1xoDxG0QbM3aL1V2Mi6rqJdrpWbk7fW6VzNFh0iIwQjdXdNgvxUDqiQmGNIVPh0uzg1iBnSmTNs1P4qYhSI4g9CkaRsjSrs9UKYnW8TOp/iz9zvzIuEIaSx7k2venwTXr8m1GXF1eotvmsp1iJ6iyFa2hMMEqpDYq8cjTJW3+JLEEkXtoN1XJkbIswIZBAY3RURWeP0O+bX6i8lvOYtubEw054LrVO7HdhbHP7oSnVZt2/RatLyPwJHe7HzAA3UWbY7OKAa+R/3aqzX7Oznek0h7QHyzx+2c55zy98TIXTQf17Bt741h1o0nlg2QSRBgtd6U5VhtZPJvDpSkvzrTT4o+8IGhjEI+Bh/5Gc/nl2S6++Qsh0PoQD6HvMiYaoNJmKvxP2hCjYWhsbEwh9bK4+PEuLXv3VqbYKqS3i4GEYKfih0u6JuHuz/3Cztv92cOFSh5mN/9Xu4ECeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5828.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(52116014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(38350700014)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3i0HxG9ECTBQ+q63yF223omNtVUrUnubZI/8Can6nvgFnfj8qnNgiBxhx8vK?=
 =?us-ascii?Q?t6OYPAAXCvf0NIUsKZBiR2A9c8Il1BaVthRMDk8P869NzosKpqHsbvMewpse?=
 =?us-ascii?Q?5YdqIByIBsDAISObAkzmaLKXolqOZSUU9CzkjRVm7bg90acUWYAMGHD6CaSR?=
 =?us-ascii?Q?FRHSJMZTo2s9K5fOy/6tOByJSle00qxracThUQXo33MwFpHyDEn3vFqOO8D7?=
 =?us-ascii?Q?ojte34kEIeY6LARhldHFIn8ivc/S0NcYZWiO95Z6JFShnS9zK118tRb7Gq46?=
 =?us-ascii?Q?fBHjHqifmoh6H8d/3TeKk/3a6Kro4G0SDwNqy3TssollxjCPeXE6PXPrwdpA?=
 =?us-ascii?Q?fIprnF8nDL3bVXFXVOsknoKN+bCVFxQ76/eejIS0FU6n6RNTJDrvlAU4bdL+?=
 =?us-ascii?Q?+1sM79G8uvtHOkQO1F7aFoigiIvpvDT5rCPOYvx0mgJDPtYwe1bsh9nuAIm9?=
 =?us-ascii?Q?lqXYEuJWqaiJyshRd3SCD+Txc5wZLULW/F4a9GGabqz3VzSPNCm3Bo7z+kUq?=
 =?us-ascii?Q?Jl3Bo0zJkBnMMagcjPh3oFhaploTbVQzp5g/rjPBtBqmkuOQN3D1OXuKWKMC?=
 =?us-ascii?Q?qZnVGWmTHQ5OIrrMmCW7+maERUR6nJamxQCW4Ecw4lEH1rQmu54K3V6l4wnT?=
 =?us-ascii?Q?NXPG54bPU2JtkpqrB7+JsNOo/s6uE3PWdpu6ZnSaxc7tDR6DEP/r9If+ivnz?=
 =?us-ascii?Q?IdAZNvTa35GIw/FYtmZcbt7oqdoR17Lgt3I2Mu9NCc6O1KAH37ud3Y6JTysF?=
 =?us-ascii?Q?taOfR3yt0OD74WDyiGy/sPpKpXak6fVThYfln3BPrm0Gn7ZTAzaYORtk2uSH?=
 =?us-ascii?Q?/kjgmFbrpctlF/0rpdnq20Vzlk4mS6oKts+kX/qeS/3CBYcsh8hVLEX7wtui?=
 =?us-ascii?Q?2NNnaIvknX9qgw12ggjSYNKpfFOllNV/Se3hd5DIqc/P6Cimpn9Mew1eFuew?=
 =?us-ascii?Q?J7tnPdbdti7pFL4n94Ncf86AGWRlwcNp2hiEh/Zkn15E5blVIwdAwybJx97R?=
 =?us-ascii?Q?iWFHtg81qVQIWnbJM8FsRY4Wnxavasy2RRNHbFD4SDw8Uzv0r3/iTWh2pvts?=
 =?us-ascii?Q?xvswchOVynWNNzWE2EgNY5tnQIVB2uLWOpMcnSJPQ/sUODDYT5JZyhElu1IR?=
 =?us-ascii?Q?rO22A1tW7WVrskccFcHgKu/y8uDzRItyR02DsdxltJ+tDNs+6O3sR4LVyr6h?=
 =?us-ascii?Q?1PVA6LUZrRY36ZAhd8QmnOMhbrRgnlFikb8OM5AsO+YKVPgKEz4wWy0Bp0Vm?=
 =?us-ascii?Q?iZgUZFXD/4v44Gb0AaLX92bWKXxJSh7Oboi6qJ9F0BVQMG5KFtYE4r7hFCTK?=
 =?us-ascii?Q?Blzhjdu8A9JILEP8kGCZpqb7lGv0jE+cwVldkMQyDVEnkfE7lckb5mEt8zGf?=
 =?us-ascii?Q?adOdXUUtwRlkwGyTc5jLXPukXnNIYKDpUT5rsTtZKKC7/uKLQxcNRd4QqTFz?=
 =?us-ascii?Q?Lo3zVAIQRZI/VEBCgFhPFk4HcwPRakyqXUlPoAQXlANCHaz5qwzfSXhecDNc?=
 =?us-ascii?Q?/Vt/puw+90JyA5HtUYoc6LhaKoQnh5bTUNFyS4oXVhHJUvkIB8iSuG5v3+RX?=
 =?us-ascii?Q?1rFwX+Kke9lFuu+Q7XbIMvSKakqoPoe7JRlIj11e4TtEdPmrSwKBqVFtC+gz?=
 =?us-ascii?Q?EpUzGORAq5kjtG/1MGVffdWE8x1M8A4N2u5r8OnUSNz65ViSCmE8yp9MgiB+?=
 =?us-ascii?Q?9qB6JjcJ1aHNJb7BwwWvRTjlqnOKXC3DZopF376kBhBgjy884z4hkwX4wPmU?=
 =?us-ascii?Q?HyH9NHbAxw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca173429-aa9c-4d3b-7b60-08dee6459ce2
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5828.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:59:39.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOdAEsqFIBeZV1K3YV/Kl7hq5so6NSsdD7XB8X8D4yCir0/CuX+4qE9XarSWiNifzLizwQZ1Nw4whQ0KtUnIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU4PR06MB8458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_030006_794005_41BA39B0 
X-CRM114-Status: GOOD (  10.09  )
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

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 475e229039e3..6e1fca630b80 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -421,19 +421,13 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 
 	err = devm_request_irq(dev, irq1, handler1, 0, "IXP4xx Queue Manager",
 			       NULL);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%i (%i)\n",
-			irq1, err);
+	if (err)
 		return err;
-	}
 
 	err = devm_request_irq(dev, irq2, handler2, 0, "IXP4xx Queue Manager",
 			       NULL);
-	if (err) {
-		dev_err(dev, "failed to request IRQ%i (%i)\n",
-			irq2, err);
+	if (err)
 		return err;
-	}
 
 	used_sram_bitmap[0] = 0xF; /* 4 first pages reserved for config */
 	spin_lock_init(&qmgr_lock);
-- 
2.34.1


