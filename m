Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB814CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXHrqfAshD3KFe4h2T72aZVeyacDo84TUBm4/8hycPY=; b=VlNsjr/6HgTY8glG9XUT95WHZ0
	8lpptEBNCyvdDrPW2Uw+HYmvu5ozHcUF/IaN45mEWkEcp3HSxmcEJwF6pHNYalVUWEGoyMqDe9DQM
	Q0enIXZvqD4JaEcgH3FSchiYp7hU6cFTbQFQaVqY9v+RkDv71NBCvg5JH3JsxHi8PzjLByhfJI1bH
	OKXyZbs9Ncw2ke4syaDf6RJpIv45Ghg9wIBE6ceU4r5aAIKTTCH3QGCFyVE4NVHSlAX6v16/4M69o
	aaEMZ7rDo0uMXROTeaVSEsWpiKTHvflHwYu2aRGtyQ9o2PgjEGtnV1J8rOVtyQFOGmUOMbVNq3bhP
	KCTF6/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRut-0000000BORJ-1dyX;
	Tue, 19 Aug 2025 19:22:43 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNVP-0000000AmKa-0q56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 14:40:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ox+IlL60s24xO3M6Hy+MJ2dFYn06yUIb4gVe+Z/LPIrGj+BnV96KHAeHVUh2qjevPSs9yn/OW8ROemGLM/REuLPmGXeJkOJPwzo4p2dJEcDjOJVdCbNvIM/5CMBJkgkY/BM3EwOi/X4k3h4Ks+Steg7uT3KAArQylO7JmdfjOMKpt69kafxvPdKGd1Jcx2fROP9b0H/kIgUbgeDlyqDviXPZAWqEkSJeCjFdEcmOLgrifbdjZrdzTohnqn2wNipIqKXnHOKBJv9iNG7130OwdLn9yuPtdK8fWUt+suiRh/hVVt+l2TKukdnLJQxOQR43vGs/U65aHxXLPNsr8bslow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXHrqfAshD3KFe4h2T72aZVeyacDo84TUBm4/8hycPY=;
 b=I3ySEEWMALH5WJx70j9m+s+ii2+w2kFOxVbneYdBy8lg6BqcL3rNbYNJxkl2YYRrD9KGXsK33qTOaPVRzAJ+INBk8mGXa2I0hfjUKGmHdxvFDXw9HVbQlI/c0Wtn9kqGhnZwmRjxfioqYZI1b/YySmS9uZdn/hP6Whu15+1ESW8Lhia6FVCxSofxy0X+pLsrtFNnuHGpM6Y1EOrPLhtzP/R8GjKD1+U9+s1hpoog/MgYtU8pGn0wYTThR7h74+mVUOF/e63/I/fXf55l2ELTgnHxNhCPeNJE9G/qBqpAJ8MfnGVULwzS7vvlpP9QXBxMcX0QyetXxQI+So4yfBlcKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXHrqfAshD3KFe4h2T72aZVeyacDo84TUBm4/8hycPY=;
 b=cv2jgvRn5T2XaJheSiW4SqfWj5Bo9Mw37TbpTRaF9+you+m84nj5KlSS/b/8If+9ASrybN/SLB7dMFNtX3GaWTQNGKXFOIeVrCIkSxGZZPqiBgUEFI4ZdXEuaxzA+ugvo2oXIdQHBDQn7xSRR+dmu20v8FHeSYIx8mUQgowK1Fn5AOO5IUpw4lfPhatBbYB8vH0R0BL+elLzoJ782LQWd5HVHF1VXMtqGuF8mHBRrdDijhBzZHk1kTXN1kt7QMArlUgMT88Ij1ZdRV/Zm/bcDG8pJ1QfUCehhsm83zGuDcpdy3HoBbKWmOA0cC/TAdGkLshlzRd+kYXoRa3dHFg3Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 JH0PR06MB6679.apcprd06.prod.outlook.com (2603:1096:990:3d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.13; Tue, 19 Aug 2025 14:39:51 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 14:39:51 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 2/4] pinctrl: pinctrl-zynqmp: use kcalloc() instead of kzalloc()
Date: Tue, 19 Aug 2025 22:39:33 +0800
Message-Id: <20250819143935.372084-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|JH0PR06MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: a744323f-2bb0-48c6-f999-08dddf2e4174
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r3fxNHBKCS4w7scgfE534YChAwyT/F6T6fujJOAPYS9BUhu9mpKGkBtvER+i?=
 =?us-ascii?Q?1UZDBPRolNB76yLNZWWRiqhVXUZyFI0Nu2/bIqh1CwakhrghyzjDuqabBsAW?=
 =?us-ascii?Q?Ul61dE0+tjH/PkghHTul2yd9lYraCEvsZEGM8hyNC+jXRnFTaaYwTrRrDGFj?=
 =?us-ascii?Q?WAHhDVJySS3ZOM6T0RLB6Izx2T+zEu1GzauWr4q5b6/OD3rYNOKwiWx9L0Bn?=
 =?us-ascii?Q?kRCGPA8BEOycciIKrLHkg0MaRlGREiCqtsfjjauMI0DVCZ0nSBKLsx+jUpSI?=
 =?us-ascii?Q?GW4IBZaIgTwCA9ecXIdgNr34rm7QT+iyBqzrPmEmrW41X0QkUdchgJNmysXF?=
 =?us-ascii?Q?Q1KThoGxsgz+06/BVTkbdVYSgg6SF1vP0P8AOW6jEVhcRGYYDvL1ucmNzRfl?=
 =?us-ascii?Q?BRdfj601FiaI3Ji+B34bQNZdBnGOSvhUSXYexttfH9ez2EMks4mI7POsJzey?=
 =?us-ascii?Q?/eEvqgo8l4Lah0BEMSwq7Ru6cfXT9nCERkfGEaELgIvSOulAbYAiXf6Hfwtb?=
 =?us-ascii?Q?+uYEYBFO/qT3sd0QYQXsTj7IoCu9jq1d3LLtkk+P1prxozOm+udrtOzieFwT?=
 =?us-ascii?Q?QQpgqQtRwOLICoC3AZiKfo5GzKzccA3K+cy72HCrGJZOq1K8PPZusD2NFqYX?=
 =?us-ascii?Q?gKEra2Wu3mdzR967BNxgy7TjQq60i8SNLsN+3/0opxZuoygF0nOL/Hm1twod?=
 =?us-ascii?Q?bftFi3XoSppwNlacFLawTjbCu2orSc4p8liQsGinjn44//ihJBeWjU3lonrX?=
 =?us-ascii?Q?uhZvTJ1qry7Sq+P9clUClAJIVg17S79NbMUQ8q/UoWs1ArZrcQJZTMLFjS1L?=
 =?us-ascii?Q?1U8troWFZ6h1HAUOhBdUG52JQBy7/U19tCXDop/8bCm7m07z6v6yWsp7oEEa?=
 =?us-ascii?Q?dVxqD+hKam9tJJs+eXKPDE1DkUtxSxw6jAH3y4Ny0rRfYVbh2qqpDRZZbE+A?=
 =?us-ascii?Q?NKCItC8ZnJvwOgowIoCM8lksvPhd8AMwFzK6dzwckdDEZmGBk39Wc1ofTzlh?=
 =?us-ascii?Q?lpaXVBPk9qTrioX3aWb30y87VnLOg21zUyLlNcXGGD7R825q/gVIHJwp+mCX?=
 =?us-ascii?Q?TAjIeX7tu2GQ3IFoUdypjMHEMw3KZgK63nxRPXrT3AcB2KdNf/wEiHitZ/hQ?=
 =?us-ascii?Q?WPmesxGC1Mx7okVNMsqwwXmoUz43FQipVXCX5Ig1MW8Sa3if9K9mjdhATAOW?=
 =?us-ascii?Q?jxmCZHGrW5uHRJ4+Zx7dE/NCGXS8+kYPp+WExtVRFYduCJh/mpBWvgtoWoBf?=
 =?us-ascii?Q?8oN1rn3XydUbJ6TwPp74AfUSDactuKGUCtAfnr0oGBN5VoGCzXoWbaIBTjiS?=
 =?us-ascii?Q?XTrgh7HV1DX1aawO4PUGn56/K3JxhPy/hX6sjxqSLNkF0/jiazcDD/MSiMQy?=
 =?us-ascii?Q?x9sEBt/+8LbciD8a2DJNsoNnS3FmMZA7PogBt6vCIy/EHEaYLFkLNmQcRMuT?=
 =?us-ascii?Q?UUSnCjzVcdjx/FACCxLdtX0UuejJBSnx+svrP/3Hna7gsZHlNwYCsM/gyZvV?=
 =?us-ascii?Q?Q2d56y6aX0R1kYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xivqhE86w3TgSSpxMMWURGGvkVPr3pcied+yhO8u5UfjrdVQt+/EzQRxau8f?=
 =?us-ascii?Q?BA/DGMnSr7d72FqwbC+FhbYRKXD2myAslj2Jypp/6Gvc9VJ2JVVjbEllP3G/?=
 =?us-ascii?Q?Ej3sykCgsdADhZbQW7WZ5jDUTCLov1r0sXdPiePqL9QPJ3lzLqMdTWTQuVR5?=
 =?us-ascii?Q?xBhEklRXT+z2uX+gJStjcugtubOPSptNmA/VHvaLpCRN4qeKVlX3brF96YEI?=
 =?us-ascii?Q?fgqpAP11VBKdV+4+q2f2GHQqb46nDioSbNU1uCvVkCGiegiQsUk8LwjGTNSz?=
 =?us-ascii?Q?FDwufEjPCIa9TIcU4a2mXQcXGLAHsLbfo3eUrFB3w6Gp5/nyVOdI+rjvAUJg?=
 =?us-ascii?Q?FKSieQDaDP5h71vSbN5xmKVGPCGGLqgnc7WCAGINP/PfrQ4iFxbjg17f4ErT?=
 =?us-ascii?Q?uY2js+5CHtNN3Jz/ulmFtCvFA/ShCpAPv0Lc/Q6UvU+i0DT9OTuBjNhJRT5M?=
 =?us-ascii?Q?9i3JDGz9lE+/P8zk9LmCKEXbQUJT7wwKfRdNJ26BYmEleoHuI0lOzqssjyvI?=
 =?us-ascii?Q?B2wGy3ddK08K5m/5vUOQQ/ryNrdAog8mI9ehZZO3TxAM60yqeP0UwLOAqw4x?=
 =?us-ascii?Q?E9CPQx4YR4eRCBT5cSsA5nLYdueSWiLAa0yEQYbpfo3MrZdQDGQxbXLYehAG?=
 =?us-ascii?Q?fE9qsnvdZ5tLUgXIuVTQU1+VVba8GjHubV5XfJawH2wgk3eO0ymOwZgIBmUO?=
 =?us-ascii?Q?nfZi5DkFCJJiwBrBK1TASHQCYd2Yl7QRuccE96jKhlJoKw9H/2mQ0quP7vmy?=
 =?us-ascii?Q?enOvQ3FW73TaVD0qJmaryYAUVkMEiy1w7qwvSQCNHKpBDYt6DtBTi74Sfo09?=
 =?us-ascii?Q?KOHLfoZqU9fB/vBuUUCgWnm21XautZvHUi6UuPh3RVCBIQT+nIRCesVIbb7V?=
 =?us-ascii?Q?odBrZFom+JIuHyXvo9+l4Y8XpDGL9XhmwXpIZzQ4aXDtVwux+sBSt9NQP1hY?=
 =?us-ascii?Q?40Dd3nlt2/4kF72dJY2C3HBA5TkqDS14jlElbOSGT3thhvDSfyJku2mAd7qu?=
 =?us-ascii?Q?7dkDy9MDKPOh5dwEz5FWQCdX8GwVpwranCOp62V47/we6qdsb7PGepPz1WTT?=
 =?us-ascii?Q?3GDZa6VRq1xVeUNzr0F+1U7uW7L6VYnS7PetH0xJIxON7w/hK0iik31BszL0?=
 =?us-ascii?Q?+XfgIb/BvQMYZewo33ouMeW1ewmewD1dLQ7VJHYHxUEI/Dhpw7iGNgvAcQzJ?=
 =?us-ascii?Q?SHh7STYn8A/dDioATZ5kJyn0px3AiTgnIIqjPbVDHynK9U+48P7xsJKaNDNO?=
 =?us-ascii?Q?h3mnOv/UH3KkxwkOC8xx2ioXqGCZMinafB45ka0IA1cwRTBkz4mETnkd2+2h?=
 =?us-ascii?Q?SMIdvUxxmb35Zz6aOnji6uEKVV8Ny6hX8QW8CNxDxgyCbTv29GH4LeE+yYfZ?=
 =?us-ascii?Q?WwlxTCUZxIGatoTvkeK96uVpmde0NA5B0TIcZs7iAcSxbbnnZ5OwFBc65unM?=
 =?us-ascii?Q?M5HhRjfTJb1ucF6l/mk8gjdvW5bXcCmdhMIupG+/9ButtiRZVck2JGluRQbx?=
 =?us-ascii?Q?FJ9MMuOVUeveLlLjYB+dKaPK7bW8uSzQyyI38XO72RkZjtkBZifSzHZrxq+E?=
 =?us-ascii?Q?u+ZT07LhwKcVUwYmV/QLWOBFKdbqhMry8C2P5sD0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a744323f-2bb0-48c6-f999-08dddf2e4174
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 14:39:51.8320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWCRbiEojEhKc9lo1o4Xj8t3K1EPDBfiZWyMMfc0B9W/X+CLR3jS3UoYu39lolKjmzi5+MML97SSQoIb+jSykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6679
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_074007_235654_E36CC4C0 
X-CRM114-Status: GOOD (  10.82  )
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

Use devm_kcalloc() in versal_pinctrl_prepare_pin_desc() to gain built-in
overflow protection, making memory allocation safer when calculating
allocation size compared to explicit multiplication.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/pinctrl/pinctrl-zynqmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-zynqmp.c b/drivers/pinctrl/pinctrl-zynqmp.c
index 71eaac81deb1..aba129ead04c 100644
--- a/drivers/pinctrl/pinctrl-zynqmp.c
+++ b/drivers/pinctrl/pinctrl-zynqmp.c
@@ -918,7 +918,7 @@ static int versal_pinctrl_prepare_pin_desc(struct device *dev,
 	if (ret)
 		return ret;
 
-	pins = devm_kzalloc(dev, sizeof(*pins) * *npins, GFP_KERNEL);
+	pins = devm_kcalloc(dev, *npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return -ENOMEM;
 
-- 
2.34.1


