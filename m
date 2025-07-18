Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCB1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 02:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCUE56RUoQh+n4YpvVauQ/FyaFfM089/T/Of7bjisLM=; b=W6tL/KW9NJkVlUWDlEi38ec/8x
	2rVtY6A0kUMvqmo3y007I3kv8r+qUK5VOgpm5i+s4hbRbMso2XaiAtk/N5YsOD0kDryHTzLQqahBA
	aYHvimCxwfvMs/7lL6kd5DWO2Wox24AAzaDptCNFaBsBxaCf2c0d5sGOSbyO+pl1l9vUG518Bhzjw
	CGeF30pY35XaoENLjYV4iX7XIPnPFzWdFVU7putNnPFKkNCmWL4wYrk0pCRtCUu0U6Ue3OwgGet9V
	QDcgBAKXCAhK3Tx8D7SccZqegG9MsgmESrZQqVHW0exD9VyUZrM+feZAEvCbHoPmGCTNI8fTor5Gd
	QugmIiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaP0-0000000BV4j-3nqo;
	Fri, 18 Jul 2025 02:00:47 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaG9-0000000BU9J-3gAm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 01:51:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPX1UvO71lrnOusSulxct4/OzfpdkiBuvjLKsc56nPSXIZ8onB2e5VAfDPOiV4MmgYL2bWfm9zTmO0kLhFqv73IHmv/NfIOiuONNtahHY7U/bqhabbt2Bp8cU8nDkPErbpbxfLOOsI3Wbzor679IZukhiD6MvdkwjSmn0krxyUN0DZomPPGmkhwYEi9fpPnwgXMYUhwCtyCUzySYBIi2/RshrKYhB2h8fUQ1w9gTYQnVlJpV8tVqD26X5se9AwK5eEByQQn+goxks/U001/NYtt1tM+yLmM1z/fdq4rDpRIPCwnxMr5oBtwAc84y1BwXGMNCXILXP8OUlef3SqyYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCUE56RUoQh+n4YpvVauQ/FyaFfM089/T/Of7bjisLM=;
 b=tpXolzP0CMUxTmqE1eA013KdS0d+bwr0ArVWj2WCFeZG0kpj9IUFnWO7sHV7RlziI0wM8Fkf6Ht787nQZ7yu5qaZnTa3U0KfjCDrQ6Tg5s6flTI4snZSgRJqLLWNV+sVCgb36IXfNm/eBYUPv7vLKJKMo6DWvcqdC+JwPotQjd8XSpMJpyn+mILTsH7NanqIHc2RjgjJjFeUYyLVeGflRpdH5rYlWqccdtM8ntt41/f6DJ9zUPD1smaNfy7IIzkCyxdAFdIhfMtP5NmoMF9I0pY+dinGSXpv2+WBi361N0HYK52Seocqt/iN6cYfmvesgdaoJe9Od+g15QK4bpWFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCUE56RUoQh+n4YpvVauQ/FyaFfM089/T/Of7bjisLM=;
 b=DOlyqBvRGFtct15Cegt5W9LSv2lieSuXXPWmMKXrvXtsg85rroxL3aW2gcryCKfP+7xzoQ991uFESJy3cUzX7LwZjBndRDiJvNWXytK1ICl5Hqtq50kgnCjSCepom8IbqU7iKjEgbFdY06uDRF32+sa2MaWhYSIEGIQbBUwGkIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12514.jpnprd01.prod.outlook.com
 (2603:1096:405:1aa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 01:51:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 01:51:34 +0000
Message-ID: <87ldom5krd.wl-kuninori.morimoto.gx@renesas.com>
To: rmk+kernel@armlinux.org.uk, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [resend][PATCH v2] arm: mm: fault: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 18 Jul 2025 01:51:34 +0000
X-ClientProxiedBy: TYAPR01CA0158.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12514:EE_
X-MS-Office365-Filtering-Correlation-Id: d9949bdd-700a-4b41-7bfc-08ddc59da055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OMNe0SNmjoqHqrvUI0gXcEIaVv5lLUvKrZg/nYp2ZZtcJF7WOZdUysmwrKh3?=
 =?us-ascii?Q?vgMp29HqY0Pv6/mJPPJ3xyyGhQoXPYqLzpi77S2rIKfaRUsCG3VVDg19ORxD?=
 =?us-ascii?Q?lwR4RuKEdoYBOtSRQVFjenVH4M5be9I41tPBPlBU780y9xHMsnLZDdUwulit?=
 =?us-ascii?Q?ENx/iyQRC3RqqCtp8rj90qCJAr77wZw/UUUDSp838KbA/i3IT1G3pQabZ/Et?=
 =?us-ascii?Q?/MwhUpHN9DuHRq6Q95BMlc/SqvAIfPaU9IrChWKRbm98kniR8RW/aiMSqpHm?=
 =?us-ascii?Q?oUdiOBKiNXXsu8KHAHz6UQWqjN7qn9JS75C2YKXGvEcbvJx2k8oqV8AsyCDt?=
 =?us-ascii?Q?OLpJjuibVGKZ0VTDLHfSUya1LOkb//b1r59osd6eGBkg0UCW68n+FKWz9wfR?=
 =?us-ascii?Q?6L9LvMLgkRR7vn0Y8pXrvle8WGHAi/rWJMJpNxZrU58khcAHunj0OqWRn3Hj?=
 =?us-ascii?Q?3qfCQdnAtcQEgDzpmt6kxYyL9mEi974JwGyxbhfmOWov+l2nbqIhCctKermo?=
 =?us-ascii?Q?jBY55YawuApxrBBFpHj42i+KiyxR8lH4QYwfpbc0hWbJcDGp4urH8gB/rya8?=
 =?us-ascii?Q?Dg+aa4ndADUbiLdRYZZ3lQMnNVo/xmjiqOyw659vP0ondDv/7JanBASHAS2u?=
 =?us-ascii?Q?YrLrlaDBLDX98OWdQhsAroGxkCc2sYxssr9TVUOlVwRvTVxp313IkFG/lFWd?=
 =?us-ascii?Q?1DfATKBkjayb+FNDcvDqu36CuAuzyeVkns9kTQCdmdGw8OWWMAZlhoxmUrYY?=
 =?us-ascii?Q?q1Jm2BdYg4UeTxnwVq3m48gAZg8Ow/O1b7krw3iM7B5SRmVnYlasjFJp54DB?=
 =?us-ascii?Q?sRLPfczMgJEc2yXoQvW/k/U6m4GJtGShbwYUvu+khm2voshfmMhrDHEFrxdQ?=
 =?us-ascii?Q?e8/ofXdAlR6Ea5nhgUl5K3aONv4lzMr70LB5/uae6lsSCiNqdbfCEm12yTHQ?=
 =?us-ascii?Q?P36XfnJg1yRwKW+SzHGqFGhjJ6Zc+1HX3Rd7Mvh7TpBA001iEq5w+OcSsNL7?=
 =?us-ascii?Q?e60wtbgp6KjWzi7YuFyOV5fi2txvWbd2ZY8gb/JHH2hkKkcP5wRUKtK1SsjD?=
 =?us-ascii?Q?Uv67v6L9DLxBnabBGS9C33lKPSta3sU28Y+7FgD2FeaCg5q9QEMf1BXcfoSM?=
 =?us-ascii?Q?PYHEcDwY1PWaObI8mv3Mhbw+0xzDiiDZO8c/jPzqJdAj+oIF1P5QEo5RW9On?=
 =?us-ascii?Q?pKikHXg5faHUXr1WI6XEiDABbM2duKlyNyyITC+YAMPjFD/QbzTZrOtWnKqs?=
 =?us-ascii?Q?xGpz6J4ZFVzADgFP2Ebz40pp00y9SGVYXqCUdzGC0tV3LrYFGn2RDW3SQX99?=
 =?us-ascii?Q?N6EoazgjEZPV4xY9YeberwDjmBy466Iix/shCvnJ1T11VkXg9KPqQ7w6uwR4?=
 =?us-ascii?Q?I/sYOcxD9tud9rT81S1v9ADJGPvJHz8saNjTR9GkU3i9JvWTe6nOw2jfbqO3?=
 =?us-ascii?Q?WCEVradufZeqzNBTpYWT+3PnNiC9Hbf/6q7LMtQ2GX7p0zI3RJM9Lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eoeMY8Oe6BxjR9vbFf5guGWmXqVvS+O23O7iRvsKaQrnhcKPnWG01kkMEpMb?=
 =?us-ascii?Q?xzaJzBxbSyLIP5I+vT17ip93P+TkQOsY9kV5H3eyybo7UWnwqu3qPv8YD31q?=
 =?us-ascii?Q?oFfAf/Ttg8supjYwhuA9Jqo2csslxZkaDIqknSPnP11euEGWSCijyZ2G1I4E?=
 =?us-ascii?Q?pQrCSk2gZPJaIpfLO1BErXTu6HkXz6OIq/daWhOctV8Xli6jeZClk7y1roLC?=
 =?us-ascii?Q?deMdJ32Yr0ZBLDd0qyEk/s2qfjlKt49+8w8P7Q21hmZ4sz8A+MsWwg2QByhL?=
 =?us-ascii?Q?tL4nVp6SXQkYPbbozLTMvaxspB7gaFT9vP4zOcnrpFVFpHdl6CYd6jLKa3j6?=
 =?us-ascii?Q?MFJMlhHkR/I/7CcJWoB91+u0HUj7KYI8dmJtBPB1T5gcKFQlRfUx5avndpp/?=
 =?us-ascii?Q?tv0mVtwPwJOy6GPWhWwx7q47M/0M1R1/2J/vcrT30Q7KIJCfHpN6yjdkY16l?=
 =?us-ascii?Q?WAlG14aZHDkmkW2LkjcllCDnUd3vdRLBdC2gLikX/3wIVhfuSnGGEpGeqGgN?=
 =?us-ascii?Q?dp2ixUWr7FWpFY0boi+8GHWCl77R0jnEkgNR86rMAFmx+qQojrxNSorHpyST?=
 =?us-ascii?Q?TKi5tMBJqy/uyCNtgLq/blybBw5AFs7wccRaZCNiMyjAUgAeMAA1+xGBv24K?=
 =?us-ascii?Q?8bvk0pyKLgIGvAvtvplHivZr1HVuj2NRIf9ccwdW4ol3XISfjzl+Vi98bp/X?=
 =?us-ascii?Q?m/lf482HiTLAwaxq4Anp5LUFNcFksVDNUMfDDb3AxG+9og0vTjAIo3Ojq0NJ?=
 =?us-ascii?Q?utheiAjZwWh47lmaLK6q0tHxgB7MmvxPirDTHznudB5yWPufn+dyI/nCAe+4?=
 =?us-ascii?Q?zCKZ2RRDH9UmT09MptnOT/ubrYxTQyVlRrmAASvx3Ok9oZkLuEQU0GPQiwon?=
 =?us-ascii?Q?fLMbpuLMFiVlWa6Y3qtJZD/nXDGsew9eYoP795zU2RT1wpSRfI/fb8KBWXTZ?=
 =?us-ascii?Q?G82wbkCEz+lNqAEsv9k2OsTM6S4n5Z2WcgSJyAwEaZo+a4wNSplRrcGcigwF?=
 =?us-ascii?Q?OH6J8PublUt4cPOq4/h3uaMbWvzYOSurxUpY5Ujza6pii2cDzIBky59PX8Sx?=
 =?us-ascii?Q?n2rRT41tDDZMSw8XArAoGKZsmXsU+v0553Ml46MflsEPbwtcL+Qb1vAesBF2?=
 =?us-ascii?Q?zDb0EIPOVv+GQkZtMMgTNccW8qu2JIm5Bgy6VTuR7/8TueAiNmz/oQY+f1VE?=
 =?us-ascii?Q?MiQ/wPBR37uwiIkYu/fG9siuhCML5g6lgnujWi+E9Xu5gS9rkGjENBYblgj4?=
 =?us-ascii?Q?Ydm47+yJnUsrawvD67DzhgJLjtnpO8UTtFgSNhqfL1kKZjCsU7Hn4bGA3GTR?=
 =?us-ascii?Q?5/Q5gxPQtUccIaRrauyzu5AW8iHSKNcpfdbH3jebB+wehFhZLwgR0FEuQwFg?=
 =?us-ascii?Q?INqX7iVGO2bzrZW3olvs9DOQi6IAEg/jfxdA4uVigNpo/9Jag8hUnsqbXpbS?=
 =?us-ascii?Q?iGTvJRoAka2ZkzfaroKxp3HDDa12Xjj1pUN33TXjOEeWghcliIrGOvnJ/Nf1?=
 =?us-ascii?Q?WgLdORDpvD6KngOPgRYa2tIE/lXBJksUCClChZ9xuAFtqdhkIpgu84T3vGyj?=
 =?us-ascii?Q?lftkjlhQbW4VFNI2HwuYY+hjiGSa6VxxbM+VRk6qD/m8wX2VubTg7jSq8yke?=
 =?us-ascii?Q?c4BpU5cI2xMoX08IdVd+ok8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9949bdd-700a-4b41-7bfc-08ddc59da055
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 01:51:34.7943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1I7toezvLFshVZ+vuKKbQ7XRtEWc3nyhYvndCnj5T9qiQIxJNvqt3IotuOoVFX0qtOYftna577ATjmuvUBm/1lB9G0EHNkd+DyI/3FwNcoeXBktgQHCgxmq45Eowa+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_185137_916338_1BE4E1CF 
X-CRM114-Status: UNSURE (   8.46  )
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
It makes one line code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/mm/fault.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..825054b21e0a 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -135,8 +135,7 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	bust_spinlocks(1);
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unable to handle kernel %s at virtual address %08lx when %s\n",
-		 msg, addr, fsr & FSR_LNX_PF ? "execute" :
-		 fsr & FSR_WRITE ? "write" : "read");
+		 msg, addr, fsr & FSR_LNX_PF ? "execute" : str_write_read(fsr & FSR_WRITE));
 
 	show_pte(KERN_ALERT, mm, addr);
 	die("Oops", regs, fsr);
-- 
2.43.0


