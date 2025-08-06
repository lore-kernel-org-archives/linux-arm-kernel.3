Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8E7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=czam/2hYRBD9T032q+T907kae+5LMHuhoLMKncqUIfw=; b=yQ267c5+pcJ05vpq/kPrbGWmYr
	sJceBU95nN5Hhqp8TckTXR9wSj3VROt8Sylo5sc9R/ZXDnfk0tBJi147L4JH2mTe587p7oAZN7riu
	4M7HpAl4+1n2V2V+B4fd3RZ3dnEQPV4hYeQTalUxLg1rlJKcAUsQRRBY4agNqGJCeYGTGyRtuka5u
	ZTclXJjTepZXxk+hRIq7hzDDliXL3dwMSz4TqBErdeJsNXoBkRK8akDu5/3EZJeJaRQk4NQfTkgl3
	WWExyO0WHL69AnxdumOd7Feu+RWVQddZWelPSk209nRN29/lysgVIuzpq0UGIhKUav308m75N6ZIq
	Trg3Y6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnax-0000000GpOC-1rw2;
	Wed, 06 Aug 2025 23:30:55 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnRN-0000000GoZr-3Yje
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:21:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nguOisFZQ/xGH/SGewdRBJIRkTHfgqZ+cAB0bMQ61FW3UKGXoBK41OeP3XNWibaQZueNEYrhn8glVL1GhD2UGoqUAACzcYGvq812bLE8iqNMWmvaU8t9sqt0hoy+MeqnOGhGap4LAh8Ge5L+ixC47QdbpTXIKgMpEUDMmglJVO/MC7x8NcojJi06yeTCljRSpcPgBI01T9GXbqblboJxHVYllSgtQdGtq4K/QMg/wyYFxY82X5uAW0Pv6f1tVHOd1wKYMEIPfAm17Xhtp/QpgouX8HAUyOetlRWAgN3Favdv0P6TiTYvOsSKm6+2PCcwzqzkK2EzFfGZpu3aMP2u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czam/2hYRBD9T032q+T907kae+5LMHuhoLMKncqUIfw=;
 b=JoE80OiCu4hb9NyqGERNRMD07FY9vCQbShunty8IsDYVMedLR/wJ66w3H5+FZX3Ak//x9C+f5W9W9SLXEb1usaKYZ4UbUiPJwMKhqNzGr8azTJewUnPFb0yDDQIAbm0NfbOx/k3omVHT4oFkGMnwDlof2dqoo6ADapbaC2/cGg7ZhxF/0Jg78zS7x8q/zChAFu0tv27RKl5L7Llvwew3Q0aGNcEAx9xA1P9Hi3TkLwHall660TIkrBrfux9kpJR2rnfgWs03L036KTqUAE/25FONe8y6s3aHFU3cMqLv5CqI0bjwdtBVzVGqoPgx543jlpd8QBpZbklwh4ZRf8ZoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czam/2hYRBD9T032q+T907kae+5LMHuhoLMKncqUIfw=;
 b=YUOYHRb1XVaoxUPxW4Xj9srbAHKKDw7BXzp+aHFXGeeNA8TcypUpakTNqmmy1yBuR0wSwrdRYeQgSLbslr4C49AGvigq1lAaZq15DFJZu/Zht4xX6tE6ab2OLcXItn7vSENTtcP+vzDxMO64/Ydfv3WPXbLH6rpWQiYRkeEDx5c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6910.jpnprd01.prod.outlook.com
 (2603:1096:400:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:20:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:20:51 +0000
Message-ID: <87y0rwca0c.wl-kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] arm: kernel: bios32: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:20:51 +0000
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 52e932fa-775a-4d3e-0aad-08ddd53fe293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d24YrYvbnuGsgM67is5fhMt+NX5Qo3W9ucbz+X4I6HGmaxyrRDcow7Mz3EIe?=
 =?us-ascii?Q?Vh03gNzhYiQfEalXZkQ5cbp1QMumh/Hb8/JPknRBoB5ndjtJn6bvb5r9lq/U?=
 =?us-ascii?Q?ztsitSTKPgQhkac+wnxO4xREXp0EKUB5ZUaBSi2UtSLqy26mOua6QRqkfF0c?=
 =?us-ascii?Q?ny/zjxlfyWEEnMWbHIpgjXIxvx7MCxgrbplkED9E+9HUc/d6pwpsviW54kmp?=
 =?us-ascii?Q?0XOq3fhFE4yP8cqq9sWyfFqlycynieHsB4fqfhdlrfOpm6dbqq5ttubBlUCQ?=
 =?us-ascii?Q?kFR9WUVpY7cwiuGfX4pK6vB1V4ONz5B76BwfwE9hqs5NjnNrcXakuywnHFKd?=
 =?us-ascii?Q?kmwe4G/iF4W3sLSOMX50JftYBS1+Ke8CM83ZzbCR4JEbCFOcmjWUn9de60bz?=
 =?us-ascii?Q?OcljcTktUT8MH2thVCY9OgCraV9ZQxuLggaCEX8YsCSWEMPhUefygOdCUMxm?=
 =?us-ascii?Q?k826dvlv4S7wuS2HVrXDIAxxKoB7AqqjmGpkeGdIoK4E6Vefx+eTEtHFHQl/?=
 =?us-ascii?Q?m8NCoaftQDC9YDQ0VkN5/P1iHGjdcDDlZKLAkSUmI7M+mKmhR+PbB0bQVTEP?=
 =?us-ascii?Q?6h9k5D2F7atgQurnMag1d3OAcmpH1DEpgmXirKF0G8mkaXI0jhs8BI1WE5Ki?=
 =?us-ascii?Q?MYh5wStV/dRQQfnb8eUiaD/vs9vwIpDnCxdexIpz0S5Yey1JjlQi79GHDeIw?=
 =?us-ascii?Q?FqOvOxDbvfSuFrC/uyJR9p7gVzeqwzUbqRdK5BAPcZFvAFwG3tZorvhKlvrv?=
 =?us-ascii?Q?4z4bxuJnzejZBRxMleiJ8OIcVU+hxof7DhQvRiF0hiRsJlUrus4EP67wwZQ0?=
 =?us-ascii?Q?Z0ZXu98I84Caq4atWnziiF4w6Bu1ZIalNfC2CUn3Jn68RhqdUZnEt6Hq+ZF0?=
 =?us-ascii?Q?42jWZyG6pZ6JOA7cVZcqxFTSiNdLD70bxVkddLPwhHmx0N8EYPzsarSLXALn?=
 =?us-ascii?Q?O4loP/7MF1ThUgkl8FbrcJYxJEUdygojh8d8OjikzbrcYuTqEEkTc6gGJlnI?=
 =?us-ascii?Q?9jAW9K/eT7T5x3rhkN4yQHsQDBZ0jzp7wqVy2vNFeh+BeTKE3b8trVxBZJ4L?=
 =?us-ascii?Q?RzB+j7uVK7pi1J2t+1EHSBRV5MAYgp0OAUx/ZQBB8+FCbHCwJx6HQVnHFgD+?=
 =?us-ascii?Q?GoHxRqA7hs/En2DCpKuBq4xp/i0mZ7GJxEzqdlFsqE+Sl5IxcuOSFC5Y32X5?=
 =?us-ascii?Q?TLkyhUy8BUvki87ynFRHgU4ZhIz/hrcYmFXE5NI5NAyQVXf4wTTJhfI7egqh?=
 =?us-ascii?Q?pz0N5IcHWVbsK28nTh3iNPgW3YUdLP3APNdoL1/C61fWtSuQo4xKTTcqgxHm?=
 =?us-ascii?Q?gubRX1jRbJ6j8lSnywDScIfk5RlQL2FRyHGKIZKQD97H/OJDoa8CZZ8CydYd?=
 =?us-ascii?Q?w6DxyyycTTHmTwBCdyv7Za6oaq8vQH8BviF47yalL2zkMct0uUgwcGeA3KE5?=
 =?us-ascii?Q?cgU05vdrzYWNN2mrr4AVl1q6pQwvzfodkfy2eY87kwwXwjYRhFmu5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xEfotPk7ZcnvjIDrSpj8Z2ZVkr9WMDjp+H1AdnPIgUDwmKKm5URQi19dvequ?=
 =?us-ascii?Q?tO8bucGsA0qqCOSbP1WSQx2LFFv0iutN9wOV+dTFv6kg7H72YhyMovGVjf2m?=
 =?us-ascii?Q?js6bkX1nR9G2/cOLLemlnMSQpsmvG/tT02XE3Zmy/49baESEKcAY+QseSNW2?=
 =?us-ascii?Q?XAL4Se4suYFd0fk+q/TR1l6jJmm/Kl854x1W5Irxn6teRGoU5PPrC+K8BCVd?=
 =?us-ascii?Q?96oo6GD+dyEPaGHZwL4IiJQLKDk7RNFjx3RvC4bSFfza82DJnH9xcs954H7E?=
 =?us-ascii?Q?sy5ELFuwSmlOhJHGWMVrRUNETpzLXR13Got0VCA2DCjCFjvmqGt3e6Vv2r/D?=
 =?us-ascii?Q?j72MYsB/yuNUsN6yNSIzXtQrQ3GVint5gQsKI0UO3gmBmcAX91Z4NS3+Eh3K?=
 =?us-ascii?Q?MVs8BLaBwfrc61+ibvYMdpVBdk7Du9gboQ0Kb5e2RxlRrNMb5aIVoQmzizVM?=
 =?us-ascii?Q?9I1nzS+2JEAV3GxVEJQMp101nW+Eg3awOL67zZCwfaOkln5GYgDat0E4xO5x?=
 =?us-ascii?Q?1yA6HxtD5ucpx8JaSXWvDDZG+/WuF29v9mPItak5PDkhUGiXjGmVpxUiTx/k?=
 =?us-ascii?Q?V+qxrAmohQ7CIljku+I7XHocvhCCNjdnaSlVTCpYh8wryn3ybe6xJ/DS+rq9?=
 =?us-ascii?Q?uYoym1EG4zs3rihAKUn6YQZsQKZwYW9IBo0p4AaJeFrz9tsz/dBCRER8ARDr?=
 =?us-ascii?Q?b8z+5v+jfIOWnRL0G2v26mpMQbB1xMOyIIn2SFwYNtsgRdMWlDsVEXaRWbfP?=
 =?us-ascii?Q?7vuUeanBz/P2A8T6PXWnH5ubw1OYRvKqCoFOULsFys6T9reDF4FeVQ+PoeGy?=
 =?us-ascii?Q?zsVa0o9yunlApNuDF5RR7LJWml0VSeVadxRk40eSkyFkD/OXtekXE8uHqoO/?=
 =?us-ascii?Q?kPYIMdIJqNEP/l9LXovMLejmSVwEyAz6+tE5D0x7e2WcQ0HjFZpqrvYQK0PI?=
 =?us-ascii?Q?3RLbvciv51NYPEedp2aYZC4AG4JfFymgntyh4Ea85FdeUCMolatvGh6P+DGv?=
 =?us-ascii?Q?cXpXDpTtMbP7Z/Pbws3sHCgBaH5UpfaJnj8Ol5Xvn6sBYzFFCSc6i9a3+CPJ?=
 =?us-ascii?Q?9X/pVxay2Kc2X7Pr2Kb1/cL6GuPDAmmCNFhCgnFIHriDPpJsk6eTH98T9iMp?=
 =?us-ascii?Q?LjpcSz5rdQO02EAOBiOk3+2AH5Fv51ml9dmptv1WCTIYaibWLwEdNlZlmoJ9?=
 =?us-ascii?Q?gO+WXUebkObBQrOwv5UIK8vhae2X/jKSnxM1qHlxwE43Vuj5kn49cWSymaxF?=
 =?us-ascii?Q?wXj57Tiw0qW1cAIIHGxNkKRxgxDOEvvfzgdp0VrsJMxhadNEgBGLjBxsdfNy?=
 =?us-ascii?Q?Dn7xmeAa+ljSe2Sk6lRbI/NUcHdzkh0boW13IRq26pESE/zUVmUNM9otmiBY?=
 =?us-ascii?Q?rppibGFCmCQSq4Dp0QnPl/VlPr87OObBvnbtm8O2zEy4wrly7Cq0T9ZMVjAO?=
 =?us-ascii?Q?8KqVoOe7rpk0COLN6c6ri9IAUqhsGUlQYn1P6pPPCZsqMPjlalzpjPF0u7R8?=
 =?us-ascii?Q?ex0rskdx5Xoo1AYrrqhKx0NAGr2l8yEIFSLczbtbh3oi/i2r4WSZTgSVZfWN?=
 =?us-ascii?Q?MIPyR7fmySVORrBYEugQ8JJTBI0bi8vgEm1jlXacAKhVJh+sreA8sT0/igjK?=
 =?us-ascii?Q?qUx00YGOZlWKHFErTeiyvMc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e932fa-775a-4d3e-0aad-08ddd53fe293
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:20:51.8964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hpft6+18/1knllGXyBCaYR1KwRavWKPScJ4J/7nb6KsuHxykILQdCgH72PqpbnNyFuxpXI89Q/yggME72wpD2ajjBn6uwEAjZrsC0ylQLVyZ3Aco5+qdX3DMF26BtZh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_162101_893353_287661C7 
X-CRM114-Status: UNSURE (   9.90  )
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
KernelVersion: v6.17

 arch/arm/kernel/bios32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index d334c7fb672b..b5793e8fbdc1 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -10,6 +10,7 @@
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/init.h>
 #include <linux/io.h>
 
@@ -337,8 +338,8 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	/*
 	 * Report what we did for this bus
 	 */
-	pr_info("PCI: bus%d: Fast back to back transfers %sabled\n",
-		bus->number, (features & PCI_COMMAND_FAST_BACK) ? "en" : "dis");
+	pr_info("PCI: bus%d: Fast back to back transfers %s\n",
+		bus->number, str_enabled_disabled(features & PCI_COMMAND_FAST_BACK));
 }
 EXPORT_SYMBOL(pcibios_fixup_bus);
 
-- 
2.43.0


