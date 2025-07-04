Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05603C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KJlHJ28OHty+7K/P7duQBR5SZ8zYEK3c/hMCtdv773o=; b=HmGl+Z0iCEnl3NueV/lCL6IP11
	1F7nLYawYKe7XpuEWQKkesPzbmCe7te7IUCdf3GLD7lt3+NSON+iRVOXjeLU1oONwLgGQR0Pb5md3
	+is6n1GVxHoOGAEd3sGuDuygpwXysnQNfJygRgo/H4OmCLrsYSEHnAL68qI9EfmWC9X1/HEaZGEwV
	ZS2YzfbAW/LW74azMLRZ26u/cJcrOZqEnjJPz2rW8bPdxepfisZD4glgFZL+CaCcnNNUwRfg7ZtVf
	JXuKt/gOw+cwBGDZbsi1ALEZhkm0ixpJT8RwRVgaAVCk3+4d91jH8vecHZMY2KOkSy8VDllp1qhWz
	0wxIwjqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWaB-0000000D73F-3jEZ;
	Fri, 04 Jul 2025 02:55:24 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWS9-0000000D6Dq-1xxr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:47:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2ZldXXRghOSVnm4RTRWJbpjjZ/qa8tuWX/cVnNrxadM6XVbmFE4PLMgoVY3Isx0EqOPs2wWDdFgqwiYmyHA4JJm3tn9rUuQqw0wgCPJvQyO3+tkiFp611+UVgZdiUqDjRlTdK/On8ysOU2Gj7KfyZL6mGVmqz8Jk1WpscM0+Dsn+p++q8sLXyqYLZ2P4u32bmjtopFP6fenc7LqsLDB5UjqzCm93T6bgmkvNNXPsCE7yD7IXh2fSZqbdf19cs029UEtroCr+NxYV4FQQf5WBv7HE/wELNeuuZNlwU/JS+qH42mDajnS4gUjRPQypjDB4TvHhYdWoYdiCh8JW8fhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJlHJ28OHty+7K/P7duQBR5SZ8zYEK3c/hMCtdv773o=;
 b=LjhY+eZlYTwxmHPPUAh2jemKrH2KM7UP1gell7TaJ+rPf2wgrLC0h/3y2aC/BXcYrND6OHD0WHlj9PTf4jXgvA3FRSwTp+hMOByrZbiwRvNYyI4dJXP3GApoQcNW6VfInOhWHYh0SpDyo4i9055NnWm8PTWFg5A8i+zlOADSlmWvgKWuaRYbvohc04tAO16R/8Ii+vs++fG3E3/zRZW8rI5gsPoVuvTgMyG4IIVUdB0RrYo2zbU884yXFCVlA6fjMoztEbLfBkCrIQrt5oL6c5k85rHrgYE2AfQ0uIJAdK3mcB3PalY/cMApBxxuD2xLfCCx0hwkJtFDMXGknzCMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJlHJ28OHty+7K/P7duQBR5SZ8zYEK3c/hMCtdv773o=;
 b=R6g7++LWCVoMFxahJMM5HpVyc1ePoZnh/gyXSVUM4FJNB8/W5PeDjuzu6hj4PaKojgTFC5YoWgnl6zckMQqRvNivA4JBKtmaLtdbBDglLqFATwGpCm0dpx3xWpemGq9uzQrxlJ5SCHTwgD2/nNMkEctHeOgXs533PyqN6HitvHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12880.jpnprd01.prod.outlook.com
 (2603:1096:604:340::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 02:46:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 02:46:41 +0000
Message-ID: <87cyagu0z4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 resend] arm: mm: l2x0: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 4 Jul 2025 02:46:39 +0000
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12880:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a790b5b-6fd3-46ce-9613-08ddbaa50181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sAZ33JM0X028KGa91JLijQ/H3mviEdLmDmGMOT8t+4Cp9Njw8bfKbBVI7f1t?=
 =?us-ascii?Q?h+RcTSNDbBR1PA4oZS/eGhxGNN+kuN/cETAojYDWRfdutVk2GXTScUXeFKhG?=
 =?us-ascii?Q?2/vaGXIXXYOUDeWRJAMCISJMA7KOIBQQ5zVlVgoJ+E/EXKwiAKZw8n4AohQQ?=
 =?us-ascii?Q?XHIRBGMVyngvS+jjKfADUK4Ni4HqeHBhdPQHeY9bDlttIDJIYYKFrzXwjrit?=
 =?us-ascii?Q?v9+ZFw/Ls/TdMiwRHygUTKsTj+2vDIw5wOCp5JQ5M9WG+ZJ566Awhlj15Xmf?=
 =?us-ascii?Q?hWcIVBAriMPBnXa2caQTLWC1U324Tw/VSd0DzlKHEfVwnBSI2nsFtzo0yDvu?=
 =?us-ascii?Q?YeJGvAI6cYs07y3xW95LRJE/UmYb4jTLtK8YwIKeRgZyVnkquEENC1co41Er?=
 =?us-ascii?Q?ghKnJfJlwu9IzA4L8QtGLeXSVBHilzNsVpoYxMYUQvtK06aHXeYgXloBGcgE?=
 =?us-ascii?Q?QwDXXWLQAa5aJxhDHi2lM1MIwO3zEGIbfYATIpA37oCi0/FmXcwCiZ/8Tk4y?=
 =?us-ascii?Q?GWaUjIYh+VcEo+MZ8lW7NWcuioYVDqwmwzho68h5bQ/BvTsVFT4MHoyPJ/i/?=
 =?us-ascii?Q?KVdhgfUi6cUJ1lIWLxpWhCnQcLlCEGtsyEEpkxYoNygnDIFJEARznniJixci?=
 =?us-ascii?Q?spLsigSQHTm8gmGKEhgG96hrvyoylR5zfZ9L2OxHAgUULUefqmxGGDHQpNFS?=
 =?us-ascii?Q?sRGuOBX5QB0eMWHzBH7SsoSDVEBz4zReghzTOHrT1JeZkrdwP2mSYFF+DCf4?=
 =?us-ascii?Q?Y9ym3Jb6cfuc50oL8ebEHX28KR4Dq0+1T9WBdLboWdpIpqrby675LL7qWBBS?=
 =?us-ascii?Q?2zhjHZbW5VrH5rAC9MKSMP9pTcYnq3gj6f8nWSSxnjynMqdAgqjH/LneHbFH?=
 =?us-ascii?Q?klNfsF1qsuMtG+kkRwQ/+FpxV6v538Uo5benf5kA71uLv2cRO0Ha/zYvaw23?=
 =?us-ascii?Q?btgaaiUV1XxyPQ4eC1RxYGNO7NO9Gfz5kB9ENK+pJ6AryAoiR0OioEJ2mRA0?=
 =?us-ascii?Q?qBfsOK+SlkGzBxiGFi14U1leRdbAdWH/ejw6YYWkb8kSSCDY3OuTPZgO4aLl?=
 =?us-ascii?Q?nsb/Nu+KzygQ8SuMsm41fPD4nz+1I3idHPbYlpyzSV0/zVi3YFQXhfuIGLad?=
 =?us-ascii?Q?fGlsit5vT5RO2BCB7RO2c4uN/34zfE9n2Nzzb5HQ/0MRl2SGyt94m7Lg/HyX?=
 =?us-ascii?Q?aTPAYtDc/TgRBGxmG6AxDz3npjEUZa91m2zBdyLTAd/Gs6nPxadOO42mhqoH?=
 =?us-ascii?Q?5gPrCnqV2atX1+QGEmf371TQNIobm0n6rvrzQDnlXH1U2uaSuwXX1wRrTVmr?=
 =?us-ascii?Q?p2EiNnSJp0LF2KutTApx/GZnP2Fh6+0R4rldaWg0B5SfseWqj3CTkgraEHYe?=
 =?us-ascii?Q?5JWtgzx86Hhea4747GM4LZyDKJfTgMr7Bfna71RAubufCmCufwFlGg5rTDRu?=
 =?us-ascii?Q?GTAMr/+5LXJKWq4kA/Xv1wYjX1MBDh8QVqNm+Zajknyx/0CWtEldfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kJ67QMLLS15aXBxPNS4agTJly1i/N0i4xYHG/I706GB9KYHaMRwkvprlkBKi?=
 =?us-ascii?Q?sAhbI3CDdeYrwr+tS9OkFXnF3Pz/h7g6Z6ekX4FogGin5EPZ1JKwuExIrpTe?=
 =?us-ascii?Q?6ig+JMTEzSI4/aJhs8ZLvXVlRStnFqtw2KuXDuaTiEQg0PY/a2dr/0npsHPN?=
 =?us-ascii?Q?K7rxV6mzqWidCjaAC0V6gAMRTqH/YEs+ByF8AF6wlr0gOpQXzUfUvwPWKuj2?=
 =?us-ascii?Q?Upb5lqlCa8BDwduTjluEfXDNuHEXW7NeC/Pt17draragNkaSMYRgSO4JLeto?=
 =?us-ascii?Q?rUd59Pr762j5qU9Gm3laRpmjwdr73IPiWngcJ/vJZTbu2E7MyxmQRCmVH+O8?=
 =?us-ascii?Q?FXgbZ5W1ijJQZDVLYlBauSnitFdgj59j5+hglsYgm/mtN2e61kfdVfWap+jX?=
 =?us-ascii?Q?3sCt0EUOxGHplVygnhuPVJ3blq+l2FrLiSVrfIq9VAV8ymhgRs5QIFylVwBw?=
 =?us-ascii?Q?zA1mLmcmjJBLyZ+B/SI2QyF4OzOrIX+Zlnk0+QJr/9kiFOvpHUf8nQZ8OLAt?=
 =?us-ascii?Q?//wQvk+YsDGbz6qJyr3B25O+7V3f6LCrSDkihUlAVjYcfZCVcDELA0PnBoZp?=
 =?us-ascii?Q?oyVIczS1xDBiC67XdSclHDZWInEhkzN3JhYclndTa+YPQDl/PlC+9UA3wGCL?=
 =?us-ascii?Q?W+IGLNDyPlAC7+LMUSwqQVRQUzOqJRv16dctp7sfeKqdUozJMjSMyRF4VzbC?=
 =?us-ascii?Q?qtb1xsUEasV80gNDqrXTVdP6MHy8TXPSXb+5yG6nEjCILBakC/xI5TAoMNpf?=
 =?us-ascii?Q?ZTtUSFeUE6lRZ+9tKH9Yl5vIr1S2izTU4HgnhFs3OTGPgv8+oRIuGQ1TVbQ6?=
 =?us-ascii?Q?tbYHZxoxC1VwbBmFlbKNDAOEvenchYsBqdMcKyuXOB6yNuAYFJoIrsOHWb8f?=
 =?us-ascii?Q?EvaFn80KYvHw5CjDoIWksxVMoYIOyKY5bUt4v36kkvudpH62DwCxyvFQVTJi?=
 =?us-ascii?Q?+AilqNDzJtPwxlp8dS4uBxOXcOnHI6c54Pusr0jAC83uS/tCLoP00+1IXuxI?=
 =?us-ascii?Q?Segq7sXg2KagShKNVlVIikH1i7qJ/qdXrNYiqUylFCBZW0tZmqnP23X0bRsG?=
 =?us-ascii?Q?E501UcEV6Spcu5xqHW/aoRwtfieFdM1OQZPYfuGQZPnYKlhyXiZyfLFmTHhW?=
 =?us-ascii?Q?T1/1lV7Lxf27mpUmwTd8SQnh3s82aLiFxfDcU6E8gZQ7k+eq3fAnngCitbCr?=
 =?us-ascii?Q?CEJN3kwvdCTeg5dZnz+RJMFTvzDte1yWK4vG59gPHh/i6UwMOY5suGwkqiJo?=
 =?us-ascii?Q?wG+GEgDlhL7oxnTLNDn4QGjl0k6Xvds0jl3O0qruT87d1zPo/NdHmJXHQG4L?=
 =?us-ascii?Q?/8pJhHt0fN0cQR9RmonTinhj2teSBpCcE85bIzzdwtVVE/mLRtGvKhZujdZs?=
 =?us-ascii?Q?IQglx4CkfjhNdRBPVMHsIkzQaMS1/tqUc9zX5bkzqOZKU4TL6AK4GAOW5lMv?=
 =?us-ascii?Q?U930c2ov0o1nneWi8UG7+9q1HIUxPkHC0/4AYlOVELWLXJqMwPoLayBl6w63?=
 =?us-ascii?Q?vQ1Bi1XQjR6bSiCpDe3VnGsyj+E/opKcD2jmkCkUVjsGmE8spNuLJrdYgUJb?=
 =?us-ascii?Q?dt+SfvgIBVeR+noPhlXoTBnC8fMm4G1YEDQncCezVP/YE0TobaO/HYpOwayU?=
 =?us-ascii?Q?vRiBRdJ/vGGG3ED/thTAeko=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a790b5b-6fd3-46ce-9613-08ddbaa50181
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:46:41.6413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YRTPKnS93pGd+CRZacQPoiqZmaHFG9NyhBjKIO5TtMBO6k8BDPXgpGN1Eizo4r4CVG4FqMHIPRCJhxSiXUuKfjTNQa+n3W8r9IirlUFX/A6dHHPWjCRfhaoFQOMAMvE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194705_753977_DE2231BC 
X-CRM114-Status: GOOD (  10.68  )
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

We can use string choices helper, let's use it.

It updates format

-	..."%sabled", ...? "en" : "dis",
+	..."%s",      ...  str_enabled_disabled(...)
	      ^^^^^

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add commit message

 arch/arm/mm/cache-l2x0.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 43d91bfd2360..470867160076 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/string_choices.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cp15.h>
@@ -667,9 +668,9 @@ static void __init l2c310_enable(void __iomem *base, unsigned num_lock)
 		u32 power_ctrl;
 
 		power_ctrl = readl_relaxed(base + L310_POWER_CTRL);
-		pr_info("L2C-310 dynamic clock gating %sabled, standby mode %sabled\n",
-			power_ctrl & L310_DYNAMIC_CLK_GATING_EN ? "en" : "dis",
-			power_ctrl & L310_STNDBY_MODE_EN ? "en" : "dis");
+		pr_info("L2C-310 dynamic clock gating %s, standby mode %s\n",
+			str_enabled_disabled(power_ctrl & L310_DYNAMIC_CLK_GATING_EN),
+			str_enabled_disabled(power_ctrl & L310_STNDBY_MODE_EN));
 	}
 
 	if (aux & L310_AUX_CTRL_FULL_LINE_ZERO)
-- 
2.43.0


