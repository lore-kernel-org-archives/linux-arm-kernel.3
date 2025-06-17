Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42567C71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 23:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:To:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LjYTUavckTymR9bv4bH2WPQifIS9mDSzBZy1wXmLgBo=; b=rgLF4WY6qHH3EXrDRmhg6dFcXv
	bvB3BJuM5BPRby/EHHzcPKqv6ROezAo1Kz4KEBlY/Vr3Sdujp1/FVQQJqS6xlEi/r/DwUxcJZLek2
	q/rZGsOwzl1Dok77yFvd+C7jsg2pcQBkWwPh5iTnvi1ArxohWBkq90AuZfgkhMqib0V0p9AzaqIRW
	uz5Eh2wY6feSsBnAgB2U+fwxvfWj7P3lWNXbJRXy8i5tqstgHR0+8plmD3o1UdedyrEiQ3cZx0TmJ
	TR20B4ZtZf2S8KDX08l5CpOsoxGQymiEPtWXzFAeSUlyn/KvG2mV6pE+LeLHHVE2mIfyBN2D3G6W0
	0Uk3f0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRg7G-00000008eVZ-080d;
	Tue, 17 Jun 2025 23:53:22 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRfy7-00000008df8-1cHc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 23:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjlJOCZVj45eXUl0Aoffqvd7G9uSTFUl6S+iDqpeHjoCxw7vzEb/eEtDgvDLxRvrhtAr9HmODnQP/6Bcxoomb2mlM7Dezqp452r0stBHtg1Hfq7g4DDQaVdTS3EWgWcz/AgtZVZaaNg8uCyVjDcY13a2yiJF9rT5hPETEq8C/pDVsyjQqZiKEj2mZ8xUSMeuJ6rJFA+r6pgGj1ejg8HGoPye7HxU6NTO6/xC+OPGPBQMcaSznUUlhY24CVRezxd7AkV4E/h9KZ8CHw6oFsP2Ophm9u9YP/6uv63R3loRGDVN3QEd/XKR5CB8hDL5CKxWZPr2URuVL8Sx+OYHW5JaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjYTUavckTymR9bv4bH2WPQifIS9mDSzBZy1wXmLgBo=;
 b=H7Y3MBmR20IRD4rApAIPuekygJdpPUlNyTiR5g2NLsvg4hiuuq0Mo6D2q5NSse/iYD2WVc6fSUk5cx5VLKdbysbG6HwSj4Sirbm5Y9ah5k4HcMO2g2A4f5kA09dKbramFYddA3rUbSEor15cnPJd+JE/Ka1+1CcQ0rnXfO2uBqyQCwNWzZkglBwOZfosp1nLtdKtL119EpIXqo4DbON1qKvrrhcGjRE+HWyPX8hETxt0nbUrEB9hzN/bypCcVS5fsYQ26mPY0Sum8TwT++yLqJMHptuoCF3ySY24RspjmQFeF2BDHHyj+SCw6xhF61UUTh4+Pe0YVs5VrCkLKMJtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjYTUavckTymR9bv4bH2WPQifIS9mDSzBZy1wXmLgBo=;
 b=LaRmJIHjEyC/vmpCQjMUi1iIOLze8vxik6a6wOVLchDCP/MSlmtv6MkiFA3cCAhBdaFDPOLMhKWRSeIrVYmzyJEvI1BKtOEMlsFRA00VrC+/a0I3N5GUXP7eSMbuyn6B62EBOYZH3edUvrWyWUiJ1cmQG3chO6Vqm6GhObcAZpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5991.jpnprd01.prod.outlook.com
 (2603:1096:604:d0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 23:43:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:43:48 +0000
Message-ID: <87y0tqlyry.wl-kuninori.morimoto.gx@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Russell King <linux@armlinux.org.uk>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] arm: orion: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 23:43:47 +0000
X-ClientProxiedBy: SG2PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:4:7c::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acecefe-7a89-4bc6-9e94-08ddadf8cec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uD6o1zkMaIrYmbfFo+fFNnFG4WTDIXyQezNP6Dy97e3Wwu+obK51E7ymNFGw?=
 =?us-ascii?Q?uotvwqeNmKMG87g2pNtr7gbUsZH9Qh0AXamYG0X5m7WSFYU928EFe5VuPRk8?=
 =?us-ascii?Q?HZdEG+q2SXpR/1oYc9KYFiO9tYLOUss2evIXDkVnYlzWOfmj4TyhtxtC7Lr9?=
 =?us-ascii?Q?gVWlvk79y+1+wQmq6Pu6nH9CmIH8KZ/4xE5hQSztI3OsMc5X54ctFJ1lBn0g?=
 =?us-ascii?Q?kSOQpkkoBDwBaQUL9EqR+ZPZ1s47UeACCxlEkfHzSxDYGgaURJ5K7hn9ixMD?=
 =?us-ascii?Q?3/0RHImd/rWUDj+tBRz4MsuHRRdX7Jlpib9ES07EHm3LtAAdP5pTgtcfTSix?=
 =?us-ascii?Q?MQs3tTXnru4vkitXfZnAYJDdWWxz/niRn2MUd0kMWdIJcXlmoUSCYfXyRaQF?=
 =?us-ascii?Q?Olpf0EpHVQlabokB4A3vB3E30W27FSPOW+sgiVrkJlPzPcCy+gs0gXdbmxbh?=
 =?us-ascii?Q?7kkc1NC8wa8wHt+ghHOrGJFMOp4EEk5JOT1xMXVyxZHpp8WbG53pDD8QCBRr?=
 =?us-ascii?Q?SAMLBhkrn4J4rkkFU1GOF0w66I/Jd0iwxE/fHKEp2ETUlU9o/BPSThEPBtT2?=
 =?us-ascii?Q?I8MwY6rubqiyeoixJw2c+GMrbBtR0vVNXAkuNiLwMaORor7L1qw6zKjh4Hkj?=
 =?us-ascii?Q?dVbky5bjyVAuUzPhm+pfkXLz3kOygeRp0LvpzKetkLCb/BWZtwpyFVzFp7o4?=
 =?us-ascii?Q?ssgN+oaQ6akqlS23pcUqt3cwXDJyRuFI5UYWqM26ZB8MzhNl4n79HrjsIobI?=
 =?us-ascii?Q?mIvfEPWZO78f/OSrBZej/u3Yn9krRMOUsCyo7m8wYkAmGFSAdmGy3PC7Tt92?=
 =?us-ascii?Q?/oN2lfBHmcihzAOr6I11A0TGx+h3WrvRqwvlzeKCC+hX6c/16owqaNxCzp+v?=
 =?us-ascii?Q?pvwZqc68LTxC7Jv8S5+HPyzJKnlv+WWhrW4iHdRbU8g4eqqEZ9igl5ttnuHj?=
 =?us-ascii?Q?xtVWllIoYSFBWXA6C4474CJJ3nmQX7EfPMiJwhNPxFVV1g/TR/PN/b/THHrJ?=
 =?us-ascii?Q?8o1qPYNAyDDZFw3lgO+EmRJXptpc5cS+grhxMtdLofZ+W57V9TyJCM9TarQe?=
 =?us-ascii?Q?bM4ii1HfPV3GQXDpIUMuTJvL1kpeO30UDwpPWRbbB9L0lm56A0NVBXTCZ+gn?=
 =?us-ascii?Q?siUC0DA+1XvGouubiF80VsnVkZrqc+90WxOe5+jS1JcUx8z6n/IfgrPzYOnr?=
 =?us-ascii?Q?Oo0RrBlKxBUulYFuWI7gpIL+qmH97IZlcsnsluwKWD/lG1QGHSvhsfDIeHMT?=
 =?us-ascii?Q?nwUntTrPQ8JhfAgvmkCoE/kTq7dFo53ZGQhogA+LZi/kvVJAz8xrF9dyIeGp?=
 =?us-ascii?Q?Ldww5gqvRCnFezn0Fjcj4HAaGIx+VPazDlnaJO7L1oGH6Zsf76jAkSWA06jl?=
 =?us-ascii?Q?fA1b27KeX6ouWiqheND5B0N2cwLxB+PCRYgKKZgYvDP8e8pIQp4zYYkQ+95r?=
 =?us-ascii?Q?C88XVejNLuGM966DZxbXd0YsBeBCf9pIRO67V2oS7Fq/Fr7l8V//vA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EiUYxTJ73GnLXykbP8Z5YPe6N79stl/r+P7NJuZO7+ynwCAEBsnmdag7joIW?=
 =?us-ascii?Q?fC/C+ohwFeXpGF5GRqqv9tTN1vS7KflIc8X3UJSemCVnArPGR+Lu3+OOtonY?=
 =?us-ascii?Q?ANo80s1MSWUEQl21D7Z54rkSOktMLgWVdiOb29V3H2r4x16R+Xh0bbVBNLmx?=
 =?us-ascii?Q?n4yyJdHAVj6ErltH9jeMHX9QFFssay/KgqlqG4VGsWeqlSea0kG+mhg3coN4?=
 =?us-ascii?Q?WKC5w1CcorHXQIu36bR2qze5V9EKVcFTRPfJSjtXITv1e9gJQZ7gVAtwvns0?=
 =?us-ascii?Q?puLComnP69XbMjjC+VtuuomU29H7KeLS8Tb81A8+onpvbxicEnKLnu6d4a4r?=
 =?us-ascii?Q?UrOw1HlndEJrzF19cBRAPxqbZLLeH+20Q7tEBs7l5xX0tlTdIoeIV65MK82E?=
 =?us-ascii?Q?nrO5BMqqhATmKsC34RcLe6lyR11J+e0PO7n0HNAF9M4wpdK5/2k+A0HGbVBp?=
 =?us-ascii?Q?GN6mFjsvQ1w5EIowLqHJ+btT8PRTEpsu+cx/AOe+1PO1L2LwxCrd/o9bYm3m?=
 =?us-ascii?Q?TmaOiqz8SLHxe94Ci5uBUZItdcpc/kSfnitGRAnlcFQEN9xFpNU3LIpkMSs0?=
 =?us-ascii?Q?dpk+sYrdQ7wlut428IVN2VLCj+fFAJ+Yr/zvfq/WwSdInrCrfSSWGW47awJ1?=
 =?us-ascii?Q?QJbIt874mzTynQtY0F5swxfs75uPzoqUky4XKtmvuE7sFq/xifavNZBjs8OX?=
 =?us-ascii?Q?NwjriJ8t0cbwOQ/0u8cx/eRt0ram+2iXYA72fZLbVSwGdgpsjlF5hfOJjIKZ?=
 =?us-ascii?Q?7OOKGkZtiuxwNOemTLJzshWWVp1OBS4wD28NFjfFK1m0sacq+2jhz2XlVImv?=
 =?us-ascii?Q?nGfJnC49xJxZf1uiPPapj6CxR6rqCDjBBILnBS9/+hi1HXScUbBBtNmNHAtC?=
 =?us-ascii?Q?WOxVdefXF7aA82k9L2LOicQJEfTv1XkZ3DtdOcDghwIWfLPmqFyxdHF1vvc2?=
 =?us-ascii?Q?uI4jLDdk/xnkDCpP4TkbH1NKUeJEZkkYzE4w1zmcpSX1Dc7vyxT9jw1vIZCh?=
 =?us-ascii?Q?286vA1JwSVk4WjzqH9/D97CxOuv2WHWaTvonUTEzYTBdCDS7/WuTzazMo0qZ?=
 =?us-ascii?Q?AYh4P55poGoe1bvXh+yDS86zXgoFFnxrumhQU6RBQMU4GsqXhiQOJ4blXAOO?=
 =?us-ascii?Q?WiF0Zg3Xy4SSYu4DE215NliVVcgjbji0vxHvpw7eS/kiflS+mmU45nwkXPZL?=
 =?us-ascii?Q?ULGeCPYR+lxWIWnqeHn6Iih5C1V0uUKbhV5ORbVLXeSHWT5uYDXKAHCUbSiW?=
 =?us-ascii?Q?UqcQs7JBvet8ZTL9CNF0B/GGWPMOIDgCUW64m6sNh33dyX9u9exYu7l7jaVN?=
 =?us-ascii?Q?zPyftQaFlvh3JGgRdCmHTMjkVli2RDN9peLZLyA+VgcvFsFQ49u34ETlBGS7?=
 =?us-ascii?Q?XvS38qLrOcE5kZd/c0pSg52+l/huOfP0VTxvqn91M4wtmIgZFdIFkPKnA9c0?=
 =?us-ascii?Q?o4hX96q0OVhp9FzYbk8RT9mpMZ/++laaW6Dt/VwfrF4emDDnEoW9v26eWvz9?=
 =?us-ascii?Q?kiW783IwglR65xyU7hfnZziOlgj4s+Bi2gtqEfSIztIE7Np/2jtSX1OLFUuE?=
 =?us-ascii?Q?mINVSyY4csOTnL7wzHqiCC0To//CCnBgMEpqNZRTiA7yh3Gtee+Zqvel0yp6?=
 =?us-ascii?Q?q237KD1csEND0otinpsUD0I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acecefe-7a89-4bc6-9e94-08ddadf8cec1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:43:48.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hyg5z8gW7Q0TcBoS22Dk1e8WP559wThYGoPagN/0ZlKakJgwmQaP3prbs7vE2MOF71DiygcU7Ha8U9qlPzjCaUNCGrUU7u9K1Qjp9ynr9tqEQubxJoZpCT1dcEzudRN4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_164355_427341_A340CA56 
X-CRM114-Status: UNSURE (   8.30  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v1 -> v2
	- add commit message
	- add Reviewed-by

 arch/arm/plat-orion/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index ca1bd764cfa5..6f09f65e3d95 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -468,14 +468,14 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",
-				   out & msk ? "hi" : "lo",
+				   str_hi_lo(out & msk),
 				   blink & msk ? "(blink )" : "");
 			continue;
 		}
 
 		seq_printf(s, " in  %s (act %s) - IRQ",
-			   (data_in ^ in_pol) & msk  ? "hi" : "lo",
-			   in_pol & msk ? "lo" : "hi");
+			   str_hi_lo((data_in ^ in_pol) & msk),
+			   str_lo_hi(in_pol & msk));
 		if (!((edg_msk | lvl_msk) & msk)) {
 			seq_puts(s, " disabled\n");
 			continue;
-- 
2.43.0


