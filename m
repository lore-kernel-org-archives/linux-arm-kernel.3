Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D09C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VNpvdbrjRipXAZRFsgbB8hUK22geTs2yM8FHSbi51iY=; b=GdrYDbyHZti0IgCg5n0rUCyllQ
	RMRmuAu+DHnkoqI40ICjiT+2D9tJAjoCYW5fGuJQt+OcWCnGVqMJR+goI9uJRMSGiwPS4arQQZAub
	IiMsEg3mCMwP8fcWaouwvAEFsVTM8OA6MjnoeApMqQYKpFPrCF+DiNVu97ZJMiYyDeIT5BieyBijN
	bTMmtaZMi3chVZUajv7GJ9nnXSg+xOZ/FB4oskJazJuI5z5vz4VZGSqDi0/XHNO6vCXcK91q9CxTR
	pSKjQOGa7ckh/t/Vl7JlfInIZmbrx/zLO15eWwB2MV+kgOrdTlW1vAVDAcYq2t5DRNW8ESFuoVdu5
	NwLQ39bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnfy-0000000Gpso-0UDF;
	Wed, 06 Aug 2025 23:36:06 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnRQ-0000000GoZr-1qPv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:21:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ww6L8LnQ5ifa843Meml6F8XHyRp45fnqFBCkt/1BwVxCTnKO8qS2LhjX9VoM/nX47ItjQSPyrCJgQSZzNBNs5uGuFTUsZwrxNZ7exV2+9bkz29HLS2MrF0zTTi4txE4q52IorrO6RxNF1oEIISPvKx+TAtwsEWlA87JL28PMom21fGrLZLWS+J7DlaP8qsBcJxgB3PYPZns9xbaPZLGY4w3KCOpiJMC91xpRTyahiyk9JUJ6G5tncmPAQN+NVtJ5PHjMO/YavAHpk96AzkA61YS3b+d4kboXlY3EbCTZRsutu65XnmPCEDhRV6xxX/3JUCFf9cebHUiAZwBdQgAV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNpvdbrjRipXAZRFsgbB8hUK22geTs2yM8FHSbi51iY=;
 b=nY7gRF94jJberzIoXFW0GmcfskjPsZp3W4kWqDRbVAQoEf0Fyk7XCEJI0RRUHr6FJ/q4/ZkFdc0qglYkpUsFsEgV0xE9m5zSwez3XXf28Xr42VVxG9sLvP0f4etnivCcOeVngHqWXF7lDeyIuwBBZT/CwHX1oTOta8djI3OD/LwONlf3dYPMUnsnOWLTCQuE/MCROnO/y8l8urwEWSgr0wx5Xc2ZikfioZjKDWFFtlU+ppL9pH1rTX35qvI3OOxGGzxBANnFg3AstuEQ9LWOqeSUDgibxQEwRRkzh+X0zkeeEtyemC2ZCtMENJ4VuSMv4tr5EXFEg/u/V1ub8Eul8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNpvdbrjRipXAZRFsgbB8hUK22geTs2yM8FHSbi51iY=;
 b=DWfxoXD3mGefkDu6C9+gbueuzH6KyHFtJ1Aj1+GgmQoF0JR1LlLU9fjCedrXBNz3gKT2sI3dYCd78tZj+xRjdBbRw23cGZjQXG7nMGGopDORT0VKPj7YtP59QyP6Smg2z6kPkRhBWSHS2pMFXToyChOrhx/lvQwlxGrQcd2OtBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6910.jpnprd01.prod.outlook.com
 (2603:1096:400:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:20:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:20:59 +0000
Message-ID: <87wm7gca05.wl-kuninori.morimoto.gx@renesas.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] arm: s3c: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:20:59 +0000
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 532d0912-437e-409b-6700-08ddd53fe703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/uwd28BRcGwYFOiR+YBlJIgNGqSU+HXXcdDFbFXJhVo50DZR8Xf+KGFZrC3H?=
 =?us-ascii?Q?KMATD4NhajUG6qShmJYoZkxTYuAuJ2Jzt27zZEBQ6plFnGjdxS/OFUFrhssU?=
 =?us-ascii?Q?PfDN9oxG0QjT93a3GMn6tK8rcA+SMEUJU688YLhm0OmhGGt2aGBj3Wp8Wu94?=
 =?us-ascii?Q?LXHej0cF92uTQXhoV7KWAvieoycj2tGYU2poM2l/yl7Ld2mf2fZy/NjOOHWh?=
 =?us-ascii?Q?AOQDwZw2WpJVvrtNbY6CvdfXJZz7J9bAUP41Zqo3PW50mDOYgUK5qYqnLbzg?=
 =?us-ascii?Q?UGRVigT7hMYypMOkpAeJJH1jIrUSOo79aShnCde4w8wUOT0RPrSBrV2G52kL?=
 =?us-ascii?Q?1bpv79BThFEUg/jsi+s5h0/K8DlHMZfYWXzhNOcRlKEeZbnL0CWQXODXFHsQ?=
 =?us-ascii?Q?xul52yEeSXPD3HUBriHrltLMGbt6i/+EbKaBibU61+PmchnWWNshnJYJ4myK?=
 =?us-ascii?Q?Fz3GCx5bHOLCf3aptfbE7PGmxpHVgnLV35wjFGMafr71RhEEzNIFBZhNIJXk?=
 =?us-ascii?Q?rK5TGOivs/khg4zVNnDyb/fOKMwAJ+Wzzz49/eVgCwYDYOPERrp66VuhEbyi?=
 =?us-ascii?Q?cYOl137T6hqdvmDrv7wVsBnGMiQozah92Z6KaYL71FTue8RwBpijWM89WDzE?=
 =?us-ascii?Q?6tBepdUr0CyWwKr2VL5UDvLeYaqUcBQMa56hki3kN8a5PM/Wcj1Gr9Vbk0BT?=
 =?us-ascii?Q?zUazRLfHtf6Vr8J1UDXJPi/noFsqrWYBM68TmN94kiUULenZLZrbQvRIDMJv?=
 =?us-ascii?Q?cQ8cPoq5Y6D1nwiH2Ngv9kOJfcMA0jBQHFL84q6mAUpL1DUnzpB3xYMYFvjk?=
 =?us-ascii?Q?M10iL/i3fvyXDWZOB1tKT/9nmEs2sA20BfiXiKxsVnbvmRJCrQkAi0OjCw/Z?=
 =?us-ascii?Q?iUcfJ4gRLNMmu/LNMVjJ6aJ6ndd+5aFCwrZI3DGCepqbc7u6/ZwlLeBpEeRH?=
 =?us-ascii?Q?raABJt4isKkZgvR9SbQE/gon7cpffwwZDu64B6ozPRB4ktxgGVxxGDdjNV3U?=
 =?us-ascii?Q?xVxOUZ8OS2QyUycJZsD83M2CAg62QIqVHaeguHX8p7C2JyWgw727s0IUrNVP?=
 =?us-ascii?Q?JJGtvrxHacTmebsrxFLz2Cv8OSIV2SEzq25HBCg5LtQVl3HjHlQR27UoFw1H?=
 =?us-ascii?Q?YJTwa6TjcnIPMK1q/eGfdbnav5TXEEAiHXI0WpOkf4zHIffR/HCJDW/hAgbr?=
 =?us-ascii?Q?RSdADQqIry5gKOcDYaUZNgcolPQSqpEn/RugVmi2rAF4TtJussp/r4Vo6vai?=
 =?us-ascii?Q?H8yvE2/31qkHMtxKPqaoeNnJArjUm36RWQTA5oNIO70Jxt4saua+SrrJkQMv?=
 =?us-ascii?Q?tmUPnOY2XTUA7ZJU6dMKjVDAsyKiIay6w1VAmrfgj521PMQkR2Z7R4QeWgYl?=
 =?us-ascii?Q?YPYerqaJoPeaq7fNWrSwc3rJUsn4kcb1EBcxkzEi7QtOom0EyNkBhRFB7OA9?=
 =?us-ascii?Q?Q8ns5H/JAumwcpN/IKjtOnxz/URa5OfIa/BrC08lZcOdVgdJuH4iKA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S425wVQ08y/PIEdU4XYUPHIVaCzpTn4GF9Z7URuUkWfoUoGKWGJe003hciVP?=
 =?us-ascii?Q?utVC6TWyEiPZd7T6eRUb39V5fhIfmzCyw2xKfkO3yot5VzkoCeP2dq0jkFWo?=
 =?us-ascii?Q?A46fH1kQnD/dDSNuDuZ2xsRcnP+E5Mlfr6BeJf7yxe1QHYjA46YsE2st9rCB?=
 =?us-ascii?Q?ninFOCVFX22F5RaJCovBG7iZgANaAqWb8jezoinM3+2XjSW7FvKgZ01JzIwK?=
 =?us-ascii?Q?v17btV28E6ETpPaVcN1ChRtJhjA3/MqAC3l2czaIOED529MYmFYglvwZq9kX?=
 =?us-ascii?Q?ymcZm+92AEFftCqEp4F9AZIyGJZeAZLl6tkPavLvlQpajuO8BsSrXBGFlnUs?=
 =?us-ascii?Q?tuuxsO+An65pmFCNZOJ7mSuKZ5zKejh7lxGEMHLZvYeL37DpseTzOcQSq7NT?=
 =?us-ascii?Q?vh2lVjYkRJj0BphLKORrJDa7VXK93M/ZmzZG+Gz3qwYrvdfEIgmfINerVeIJ?=
 =?us-ascii?Q?jUMkd+5bjhtUfVe/XlsqrZhzQxuFA+gbk2lnxSQ5BJoXhAmW948NQXNcyi6P?=
 =?us-ascii?Q?wt6whGnxMOAEy+0Qzp7bsyaEk89BloNYvD8RHEPaTDP/d1bXtoSGg8fnj/WM?=
 =?us-ascii?Q?+UzXrwHzjQjHGuNu7FO88HtK3zR8KdS6AYFSWrKO+FhWwEHE0o9mfS64A/dE?=
 =?us-ascii?Q?xud175iqFpjoQq56WLYz+NfCaL3rG+Yd/EzYJazuEdBJLCNegjqJVyAYVXNQ?=
 =?us-ascii?Q?B4VagQus9ygXZL02b8U5wyABHlystoSw7h28mFJIHr2GRaXSc54q6qaH3QGK?=
 =?us-ascii?Q?UAzFahJkzATck0JZ9lbUiZ0hObw1JwuBFKPqbKUiy0uQA/uzwtdTn1uhL+9h?=
 =?us-ascii?Q?dF2vMMZHkKVuAKRFvRrAUwBudBBP4xNVsA5jexQOGqR3sJOEpLa/Eu13fR0T?=
 =?us-ascii?Q?+yjOiveXG6ZghhJn9hO0X7Qv0xJYRj8rL7rEZQMy0Slfz4oUAY7jzu815Lew?=
 =?us-ascii?Q?EyjYYWEqkYMCNC5boLnsAjYQCMtd9bcqksx4fxE33i0atpZxXQ22udmOvvSO?=
 =?us-ascii?Q?91FSQ/aCRt6Vv1wDgnDyw1wCuV9YNqPbq6bXUA6HJpUAigNGHM6qHRqMP0Xf?=
 =?us-ascii?Q?WQWdn/SHJAMh59+fgKF7F7IlI+fN0M5zVCOLNiNGQ2kO91oc2v8rF3R+jQH/?=
 =?us-ascii?Q?aARVv0daQHZxqgDKsFMtMqryPihZFkR4pM8SpXOjelxb9QUlc2RDtKuc1409?=
 =?us-ascii?Q?kpJtZ7JjB8Tu2vHvIFMCoDcACGCeloWRy4n8LRvwcEUaHseTxSqh7paYEprQ?=
 =?us-ascii?Q?JoKjzge3icMcHhW0dzVLedoEaYwV0TsZQ9DZogZlvlkFMUkHvpHlwLcd26uR?=
 =?us-ascii?Q?to5dRdf4cIGy/NfJUOiDHAAHaZ20TCKnrxhdNW6uHlviTPuHg6NcOJbxwR+l?=
 =?us-ascii?Q?36UfTcyMgysZ+3TFqbEaBgF+C2bmFi0oELX1be0SYTd95fiutgIVp3YinYEt?=
 =?us-ascii?Q?2kNM3OpFxH3AniHF5r5T6TddMUuZVTE2HrcrISLJNbxWNMp2vPHp+HpIOoB1?=
 =?us-ascii?Q?LuobzX29dYmrHvjc2ECO6Ium5etgFLOy3BDFjHD9Qa9/yU0mQxilt2emLVU0?=
 =?us-ascii?Q?k8Hw6ssug4d0NVUsjx9vb9SPAzvxKU/cEBxklqPojRX4WG+qxGh8OhgCi7Us?=
 =?us-ascii?Q?In09+hjfWFp141tY98Ustj0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532d0912-437e-409b-6700-08ddd53fe703
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:20:59.2688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jRWEoMKk3/aaZ2jZ1bJpZWpfij6Sh0zpZgLFmOTuRPM0rkXVzG2ojM60FHEoifBxHJanhHQffS0t+f0mXE3FDK5Zk0wQOmOlJ1Z8L0pJvHAn4BzE15CHwZcpqR87Ggv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_162104_486256_06FB855E 
X-CRM114-Status: UNSURE (   8.90  )
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
It also tidyup printk(KERN_INFO, ...) to pr_info(...).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
KernelVersion: v6.17

 arch/arm/mach-s3c/pm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c/pm.c b/arch/arm/mach-s3c/pm.c
index 5698cbceaf7a..e4c240699d14 100644
--- a/arch/arm/mach-s3c/pm.c
+++ b/arch/arm/mach-s3c/pm.c
@@ -46,8 +46,7 @@ int s3c_irqext_wake(struct irq_data *data, unsigned int state)
 	if (!(s3c_irqwake_eintallow & bit))
 		return -ENOENT;
 
-	printk(KERN_INFO "wake %s for irq %d\n",
-	       state ? "enabled" : "disabled", data->irq);
+	pr_info("wake %s for irq %d\n", str_enabled_disabled(state), data->irq);
 
 	if (!state)
 		s3c_irqwake_eintmask |= bit;
-- 
2.43.0


