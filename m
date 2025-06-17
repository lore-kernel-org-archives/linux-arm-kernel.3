Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B037AC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qGOW4zmnv1y9nJuJMLUFEVyvAfTpuWF8x0Tp4Q99yU=; b=jcwalwf2o9c/tziKcxuLcGGLN+
	dbeT/H7rjDyiQz/9wmg7DYs5s3n/t1Dtx68nvUIVEOCwdv7N1BlWSkZ5hgVkytSUmKou4oLXiHftZ
	nhvoREs9ZpITwuiFWUK5kvDnt3itD4JzFJq5Pgx8CPWLtOZ8INr1BWs7JBAjtEUoM3Z0x5hB6/ydS
	8ROedDXA6pxqIe81rZ6s2NQfFobeQK7D9nSs0h+nPM1bFmM3b4qCl8BGv40iDkJBER6eiS2Vbs+TC
	DwCyu1StNrrstoTgqAiKajqkDqvDSjcmKspEhXHxe0pvPggg7wlE1LjrLyQWFrgx7csiGwsUI5WM8
	3PzT88bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRg0i-00000008e5A-2uSH;
	Tue, 17 Jun 2025 23:46:36 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfvA-00000008dUC-37X4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMWmCxGqazN0blsI2tledVnrN51EGpzaagNvgZDVNiuZ4SLUVw9hWC/KWUHO5F+bbIb8F1A4cxPv7ti8YP9Gyo8jRb61IVnBpOqA6skyfrBR4RO0BJ2XtZDzKYKuoRvrHzsUcyUppFaGDwKi8a0hXqpoo+zbGUQeSKiAbDudDE2//74+DyaPRmxjM9BtfkoDVXUmf69wDxH8NIdWQPP5KjxdCFVZyrWRONwNz1KkbN5Oc+GtdEt3ILNFcF88NvWih9UBh26ZTq2ISZBAPcqQ0DQPpyZx4weqRDyDC4HjkzJf5CqjR1mFCYZMfRqLsaAP0Ew5bh8YKbtFpiCJm7Hfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qGOW4zmnv1y9nJuJMLUFEVyvAfTpuWF8x0Tp4Q99yU=;
 b=iGIDgEO1QD9CBah2Qimp7ea2qsK1PtP9iFXjdY965fSncNi61QAfAJfkQy5+HRWcAOVpfc9XzJTBDDCHbXycZIH2Xh+sREueEezsmcmQbWZHeXDHLiVLc/34hVh+PG+YrxAcP4CcDg1aZSBq6Dymi2MWk1W+tc/KYbSsgwuO/U8jtgkb2GF0SvRdwOwewGI4vBLwumZX471SSMnAZqzx5E+d28LOTQ55UcGVBmeTFwpeea2RT6/kmTCu7v5fADD9AvQipcqQgQc7x4dpn/wpfBo02XyA5kztaZmWoFnb/oGeXPjTjMy4G1MaKCLepA/uxGAGDyI1dT2zjW/VSuutyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qGOW4zmnv1y9nJuJMLUFEVyvAfTpuWF8x0Tp4Q99yU=;
 b=QJXjl6cuRkqCN2EY4sX5A8DhSdA7Jqh+uU+Syzmno9KCPn2mzUqv2NYIw3ELcifuDlZuSjaRyzheZ7JzDgLQFiEEyIfzXX/fdiw2JHkHh/ski0rPvFW54vRehQpYI2liqThfdvvgyL2/DfK28rjtBmacWFh/r+4G4de/1bVwY1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13401.jpnprd01.prod.outlook.com
 (2603:1096:405:1c2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:40:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:40:47 +0000
Message-ID: <8734byndhd.wl-kuninori.morimoto.gx@renesas.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: s3c: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:40:46 +0000
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13401:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a89654-80c0-4f35-5299-08ddadf8623e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FlWNbPEIAggOC07POZAB6uLNEu8DrxKJbXF3SzlLWObDSTh7UmbIhib4UUU4?=
 =?us-ascii?Q?RjY+OyaTn9bWatstkv4NC92ZA16DPnmR4wzlIHtuLBPGeNXxncPvSHIy44ny?=
 =?us-ascii?Q?oXfPIZeT5ygtJkz0TZZIKhTx9sD0MeiUrDnBT3SXpj5FsmiQPF1s/chzlWb7?=
 =?us-ascii?Q?u2ka7Dm2EbRcgG212QmCLEhfNWY9zwHi6qfRQqc6EfZtPFfm7KUQKkAQTx5+?=
 =?us-ascii?Q?dmgtMQQ0rquxFwuVXDF4Q98UKG2k85W2LE13e7PhagiJpR8TBJDET/PxyoBN?=
 =?us-ascii?Q?pj4Ux27V10AjG7x/p7YnnJFhBLlediqzmwM6EhwEd6zoBOSVrzfoX4bmhvL5?=
 =?us-ascii?Q?+u6Twu8muhpVm51RXWqzsOm1q/1WMsdBWbdliTYUQFEljCBmdikrbNmRUWa8?=
 =?us-ascii?Q?Kn/rww+4Yzz1p49aaHn8CT/eBIk4eKs3+4CDnBCRaeF2jwh4WnU9ECN2jyJ1?=
 =?us-ascii?Q?CA02g3Is3nMGk/kqPcjOIc3WHmT8QmM6jOhHTpmP1uVSxSy9ITDH188othjU?=
 =?us-ascii?Q?4f4t9JsbiKmtmiSj/pIX8vW3+4VDZkGMySpz72Jx2KAh0IQgeGPpoL9NpOQk?=
 =?us-ascii?Q?9njxLpMPuOqsMhfou8/a9TucvmVzPAMM425PChLxdplBaCaGPxYvQpsxMD4e?=
 =?us-ascii?Q?DdJBQw5uDgdN0fw4KPau1AXLjtShO1HvLeI1pOHaJt1YcBA7wROxYF84FWrF?=
 =?us-ascii?Q?mpl7HO1Yj9I4xvx1khU4dcCtuTT56QP7LOapCzU58dTpYGjSaNoAA2emTBAz?=
 =?us-ascii?Q?zF5Zfg45YoWMcLmZeZB9OFoPWVs5gcitXtKRe5vASrSM4tq5rXsKb8UuA9eL?=
 =?us-ascii?Q?ME57tgOyqMZZtE1MDUnOkr/jnGmk2+boSK8AQiRQUH9QKpqv2blDLZCFIlV0?=
 =?us-ascii?Q?A88WlR0R1Y9qxOmwUau+QeZ+SCcHqdNeZ+cOAW1769ngN2uz+G2K2GyvxWPk?=
 =?us-ascii?Q?JEb9phNBwXUghJ1JxK63/TlmmCZPa320QYmDUxk7FS3LRG9Jpv55h+elL30K?=
 =?us-ascii?Q?ULI7LXMxEGCAuUltHoihjsRJsJFt2RwibDDxf3854rqglyCkgXF3tNsd6Bms?=
 =?us-ascii?Q?0H3CohFilfbCuFjjHRX6Uh1xWwqvBOoe9ycZy69ivVng0xVDmg0WaOowaD/0?=
 =?us-ascii?Q?Fe7Hq0c17IFvV3+ol6tAJk67yCICsHT0V4vFsrUCgXgTBDlYt1gO3H+0b6T9?=
 =?us-ascii?Q?XIKHtvIFBdtS8yKXaQlI1ygOzteI7cvl64HLaEtgNdjeiH25HGzZ4/EVI/C2?=
 =?us-ascii?Q?X/O3owo2zbwpiro75E5uM84i5jpV0SC57xYZ6hwcI9bmKWpojzCml15WTVDz?=
 =?us-ascii?Q?TZzYtw9LSrgCL5QOtsazaCE+FLMjDpX86A/3BQd66uLn03zG6O8Qu/BsLPWG?=
 =?us-ascii?Q?gpcnndCLnzqKVNdrhKnNDE1dzjz46EjCT7HfEvzq0pz1k1mffRP1BKudLurW?=
 =?us-ascii?Q?6cDNKT2DbiUtWyDB0UCw3u7WNoGQsGBeTIJ82fAygE7jl2r8fjw8HA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CoYU0AUedjlwncqneQ5QI3POJD8x/856gvPVw3JHFyqFSkq69R8dkxKkGhyZ?=
 =?us-ascii?Q?Mw3AX1TGWLCCzQAHI2yaVAt4ieYG5Vfiy4HIC/ynt5IfxX3lEecbZKP9u0cC?=
 =?us-ascii?Q?C6gosFbjv4Hj4Jud4lRIMz51TMA1sf7DjmpkuSTNMmg6AwbjzMc1m8uWWEi0?=
 =?us-ascii?Q?455bkySqiRO307vxVjcxskkZYFy2s2poEFRPrH+sVjDxsWXEs2c7N3+OoRaK?=
 =?us-ascii?Q?5NNFv2P8wnXzVn0/c2R8kHTnzpWOHctmyXqR+oHFLaWcaDGp59Y1kbA3Ya60?=
 =?us-ascii?Q?wslMSZ8Pftqu7zHsUyqa78+RgvwKsa0GonA5nFxH+kEQ8IrHJwAGqmSwCgQT?=
 =?us-ascii?Q?tWFQZFPLagQ+dTUxYAfUEIbbn0fns3mSPDIvox0VOxOSZp6o+sj/U/GZEBlo?=
 =?us-ascii?Q?JdklAkXxUoySyNnlzQ4MGoqQbIVUjmWFyT10rsrN9vo49OIdNBmwk5+Quw2e?=
 =?us-ascii?Q?lGloUsTDMwTG6XXhS5JJOpiTlV1gv/LPhcrnYAqEtZlDp9+OvKUl+K1EISMz?=
 =?us-ascii?Q?zJNgB/3YrzmKL+zMqWF/c1/bnnTmWABwBD4O5Vub8Bamkqjk+LsJQeoPFcyW?=
 =?us-ascii?Q?3JUHL0VYDoKf9HMDLwmGcwtb3b8iCgll7+fFqvJlR8FrQyS/inyIufEaE5vT?=
 =?us-ascii?Q?4SfaZKl4Q7czs2LSr+TQPXIjGaTl13E+/nhJev39yhNaQXOa1x8fEKxfI5dV?=
 =?us-ascii?Q?BwyRXr5PeqSfM1kwtotrcseJ+Li/SMmBr80noZCjy+0iODUUzXYQtQa4Yc53?=
 =?us-ascii?Q?E5gaBTbdQXfibZmolTWLipn6LYtkSPTZi6/+Y2MuXHkMd5DbHxvqXVHkeQvF?=
 =?us-ascii?Q?U095q1DNNnsop4q38s1eiRnVQvDUJS1Hij2QBEbyyRNzr2adbe4SKYftv+m/?=
 =?us-ascii?Q?h/0LFFlrDm11YTEHCyoX6TJ3+8GOSwyLYYaFdjHl5M80aeIPsBH8rwr7HurE?=
 =?us-ascii?Q?7qv/lJ7Pj2S4ODEe7UMuy7C4W1YBfsamj1TBi4Qds2i4sNaIkE3421A2ydGp?=
 =?us-ascii?Q?idgxxVJn0sDsLv3Xebgf7QojtL8GxTWXeJYCHnUiJaCmlRl9YWEbYYgys1yR?=
 =?us-ascii?Q?sFUkM2QJV/IqhaaT+3I5JYuCcnwiRWjUd0KLizg+OPk9nVu424JyNlA4zsvD?=
 =?us-ascii?Q?lOZblwUNurxz/PHqXNfisom3qQSrNJ0+qbFkIq4zPKZfFz0etM7E5LOvQawE?=
 =?us-ascii?Q?1fFXeu7clZn+qp2VhAJ+CDDxDCk3u2yuao6CdhFuJ9OX00t6zYldZKpjsmw0?=
 =?us-ascii?Q?2LPatQxHSj1sJZGHvd8BHvoG9Znvs/+SQJtsrcFueO9/rhhCKvOW/BQXwT+W?=
 =?us-ascii?Q?IGNo9SsehLS8fKdayG3A2qD7ufr9GPA0g+fSWc48Fe8WXnWiJmQYLGKHa+qI?=
 =?us-ascii?Q?vj7hkDboseSdHY6v1hQt6ljvCTJ2P4vDdXuKJnMcDAnQt+F7n4RO9yishl4W?=
 =?us-ascii?Q?3MpjepnXOnvmgutgAFCq3uomvBuLZ+iXhQK67lu+iip3wz8eYHH6RhJ/wn22?=
 =?us-ascii?Q?DGqk6ViEvTwL8iCuDHMXPOkXw8TpuKY78zKp4DYVLYx8Wa/7f4BRIyo/WyFY?=
 =?us-ascii?Q?m9DmYPMazxAVSURh6WQwmvWfQkctyKvX7snNWmGj9NDG8zQC8s3faL4sUz+2?=
 =?us-ascii?Q?Ztb1lubEgsDfDLlL0m4oOoE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a89654-80c0-4f35-5299-08ddadf8623e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:40:47.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l216joUYXmglq0Ghp44Dbxvt/AORjm82i7dSrZwznh9Tx5ZoAHYyvMckpiV2VwnHD5PfzCWQZw+EClJl7DcKgKSQnBxFUenU59MmZ9A80NGKympzy836Uppcq8QWuuRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_164052_780416_95BA6C78 
X-CRM114-Status: UNSURE (   8.96  )
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

We can use string choices helper, let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add commit message

 arch/arm/mach-s3c/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c/pm.c b/arch/arm/mach-s3c/pm.c
index 5698cbceaf7a..6ef037dcb641 100644
--- a/arch/arm/mach-s3c/pm.c
+++ b/arch/arm/mach-s3c/pm.c
@@ -47,7 +47,7 @@ int s3c_irqext_wake(struct irq_data *data, unsigned int state)
 		return -ENOENT;
 
 	printk(KERN_INFO "wake %s for irq %d\n",
-	       state ? "enabled" : "disabled", data->irq);
+	       str_enabled_disabled(state), data->irq);
 
 	if (!state)
 		s3c_irqwake_eintmask |= bit;
-- 
2.43.0


