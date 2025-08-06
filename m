Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF1AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6l2OQbrKWs8uDgGTCZ8zsKL/HByoY5RTO+KMvK/Y3K8=; b=xA+PVxo55J81a0mi9kwWYviaT2
	d37jrNh3B2rafTld5abUS9W/0fTBSgvGoCVL9Eah2ThPTrSylG1LxHieqLD3VQ7Tb2eCw4jdrn1Pg
	NRmkBni9Mmxmc8a2GKe33FnPLm0IUcVzTSQ5zxKzrf59wEZpYqNMx+kvfA5/62x3sQUi2NCfnPEOT
	dAxCpF+4PsFs/bVgwxsbyHtq7cfVAx3e4sg/rZs+yUvvXvyz0sEndiWIh8C8xZcL6yjtqFOqfr6iv
	yo1QbMCj9+PZxmeJBRses8J5DdLJcEPOLjXieqkWU8oE1jvs0x0Ru77oaxFXzCWvQOGmcofGWU9eE
	Cdp+QoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujndS-0000000Gpct-1DAC;
	Wed, 06 Aug 2025 23:33:30 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujnRP-0000000GoZr-0RcC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:21:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEo1jRZFmVcNc4LDy/MmFbmjulkt+2USnO3WCvbEEhyEN/jIwXmErNyWloZRKCtQcMh5LqTNsorrKbuVi6X7ZtLzNI5BNhFrEb3kbmBYyStb8x2q0T2O7fAwbvTNjs/i7V6aQIsKN4gg3MEJa2KEkwzJEKRmZn7noDAGKUF6DOVKDZwYerqUI4FhL3cSBiVlm707QSkf9/TQCmstOOuhXyl5YQMZc4oHlC3fKvESTy4WoyA1lCNVqywddoMYcR8jexDhTloOXAcSQtYiHlXrzgqUsO1qGFKfgN1TahyACfnPbjWEpk2w3aFK1i7nJW9qyQS/OJr2cTpgLsWZhTYYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6l2OQbrKWs8uDgGTCZ8zsKL/HByoY5RTO+KMvK/Y3K8=;
 b=BQc4ZgzK/YTUr/tcbPM3xOqelcWNKMcbU0Y52NzBBGKUwkXRxO3u5m4/Vn/7LOLcZEPnryL/cuPzAf1zQcTYkRKjY5cjLeozYOQvkjkikTTebBGMiuVX8cNjP+2aFqecywcSEJoGUKVBuNSDX9x9f6pM468XYzQPX1EMgnsHvlIoiQ6iPxw8udkXRfM0OdoM3Penu0N2Lkg0j07xmVb7GHNZABk71q2XsNGOPKV1h9r4sjWCkosNWbzy2s6a8wV/NpIAhsv8Bse7M6CIjNJjM7CIMLNuugGQxEqNtLi70oHSeQd+YP0+HX1gpNsV2BA94g+uCxDtLVLSnUsJeXP0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6l2OQbrKWs8uDgGTCZ8zsKL/HByoY5RTO+KMvK/Y3K8=;
 b=a4p3C0n7vu8NKrwEyFj8yBkEwAcRzHVkkktwwDPtWkUHiDeFrPj0ga7xKNIEae1/PTl/pDSjWstSOZKVmWB9rbBxjB1t4Um46Iu1MQfCX51AKSXkgUgpcXVs+5Ldxecz2oauyXuOV5NGhviOrGHWHg6dbPglwmhvYnXszUqhn9A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6910.jpnprd01.prod.outlook.com
 (2603:1096:400:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Wed, 6 Aug
 2025 23:20:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:20:44 +0000
Message-ID: <87zfccca0k.wl-kuninori.morimoto.gx@renesas.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Tony Lindgren <tony@atomide.com>, linux-arm-kernel@lists.infradead.org
Cc: patches@armlinux.org.uk
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH] arm: omap2: use string choices helper
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 6 Aug 2025 23:20:44 +0000
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9ad485-3eef-42a8-2ce7-08ddd53fde17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wrI/cKlzkAKTSC2hcz24Q4rw2uFubRznn1JaN7Pm4jlqxHv0D7gr3ieDOfVH?=
 =?us-ascii?Q?/tHpzsmUJLgCf8VA8kBLelcpRM4PDgDW3xowUVkoyxsOy2/37cUgxxw413qS?=
 =?us-ascii?Q?oRkC5VyLdv4j/BhZzaxy8Va9Uhqnz5kxxzCy89MzgRijO9Zdad/dAITUKalR?=
 =?us-ascii?Q?16AJ699dPHOks1D2oK8v/DsLrZ5f1Ns3xd7VId84/L09V9pXr8dBgHj/kOYV?=
 =?us-ascii?Q?qcHzEOkJ+E8D1R53bUCtjcrR3QvVl8dmAj549fhRUed8RKdFUe8h9CD7aHgz?=
 =?us-ascii?Q?VUXdh4n3KoJJSEeQ2yTT5i2I46G8jVz+Y5D7rlqy47tHResVebFFnLqhKlyk?=
 =?us-ascii?Q?7v4OX+5Z7qa+liA8iMJarG85Kwz2H8UI9Hp3GnwWk/2Nk9lnEN5ZURisx/TC?=
 =?us-ascii?Q?bXhmqAdrxW8DlpQjPWmku0C/a5tE6yqoiKoiEg6IWsEHsaUFoIszz8aWZm/9?=
 =?us-ascii?Q?I0NOMprlAjVshRE8eJbipB5MOVm9f6Wmf+76W3WKHsLU0FIjEWJJT03ztdJD?=
 =?us-ascii?Q?uTD2U1h4f4jyDYF36rdMtFjqSRzYsf7Wq2C2dhXUB1hfpeDm/H1oIm4Yr63D?=
 =?us-ascii?Q?BxSg+wpeLS0+ZFvsmW9H09Im74wCiVuaCBxFBhzu11d2k4sY/H3gi8ZpfpqB?=
 =?us-ascii?Q?E3mCBXo6peifHyDg87fLjxVdT5DSzFW9bPwvwNlmZlQHzHrJvSjkP5nnoqdZ?=
 =?us-ascii?Q?K1Ic1nco2vymx3V8ihuGwcoles0Q0OFb9LQntnR/Pij0HtAuOXLlbEsvmogs?=
 =?us-ascii?Q?ZKb8XkYa0flFIsKS3ESy7E77rO6eT3+UusR5ga8oSAqsyrgRybdunK4oT6kR?=
 =?us-ascii?Q?k7OlhPfRy8+RdrX7Z5voVpr3FvphCYcxRn3PXPA3YGgkBD68x1hqscLJRrTv?=
 =?us-ascii?Q?Iu6kNIMApIJeQR88dSlxSI7B4q+DpHIQLALIlGJcY0+8Wj55Otz1sT0gOZZO?=
 =?us-ascii?Q?FQEsJa+zykCY1SKwN8Mc988b6TKf9HBqfLE4Zez8TROp0Tx7TcyZZjlc9xEf?=
 =?us-ascii?Q?D63DbpW7DKeItPCzjX9g3pVLKuheItZgc/8aLNp63D1fyb852zzJkYrcPE1e?=
 =?us-ascii?Q?bDGbtdkt80BVgSasvWt6yeE3rYMkM6O/I1Ei9+tzQot5yA+kzNWyMicwZ+sU?=
 =?us-ascii?Q?GsO9CAh+rw3991Lhiq2aU4oJtZRx+P7+O2n4MsaK8KPth0zkWfHNp6BfXd+r?=
 =?us-ascii?Q?2RmZjyULe9khUS3L/jg/L1EpqM5MmCDlXEm1VDqF/X4f+TiQBwjmxZHYDQ2Y?=
 =?us-ascii?Q?/rfllYaUxMUnhwlfsZsgKcSNwOnHVS1a63KQH6QsOp1/J3jowq9Gs9MTjxE8?=
 =?us-ascii?Q?moaSWSf1kgQ+g7hOF3XmvotBRgmOU7ZvAkntBe/DKMNi/KZLhQbl5tF0yGt7?=
 =?us-ascii?Q?2c7hazYNodVayAS7+gjj6BLn+z8N+q8Fl8Rfdbx56HwD4GySozwOmetenKzH?=
 =?us-ascii?Q?hkxW5jqIs7z0Z10bOmdUH67ZzRE6CGNxUKLdpYVntCwKC8wg6Nmecg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8KpMtZjrPfvr1QBHPK1fITKThBcFVmW1ssVz/fg/E5qIUrDlpdsHe8d39uZ8?=
 =?us-ascii?Q?fJ2CJPSpxkE8Pf6eSwS9p0lCvLAKpiBGHkX55Ii3DtcCEPLqKLUKW2/fNdKC?=
 =?us-ascii?Q?jdaBVHNU1TQW8ei/ikUkkIm6jHFdrOTz5LXbxcMAjAlTpRNxtPtsMdhzKm3B?=
 =?us-ascii?Q?skV7lnu8YWdb2GsOHmvlX16D0xh40rJsdRZvr0P4qG12Xg8HyUAf/vEAj3eO?=
 =?us-ascii?Q?MKXDrySYR9yr/uuhXwu9XgZ7D6GC5UYF3orhFYUi9gA1yABxnDrL/b66M6N4?=
 =?us-ascii?Q?X9LrmgIRYum0Tf7M952zuRz5VmkZq1gU/a7jousG2b1m7Xr3bodByQV2G8JH?=
 =?us-ascii?Q?K6UU8h23hbFdaBoMoQNvqJ40NO/EcvBVBYKXf03EQkFOM1gq2+//OHyI29Vs?=
 =?us-ascii?Q?2y5PRtKfSXrJI13iE7HUZsQaovYXACDwzJ+ty+Fi8hwD9+J8QCe7hb1ZpFa7?=
 =?us-ascii?Q?gYpBW6WqhrazK0h1dkT65OxxwLFdUtQXw9P6RnGjjfSXqxQuggQ6W23KnPs4?=
 =?us-ascii?Q?yxv+LQF/Y+QLjuPNIqlvG+LDkHmSiqjJ7cWvn66CwE/HsLg4jWxoC0UM/g2H?=
 =?us-ascii?Q?LZuRmvbArsNxJMb89D7ydtndL9wVrhgSvBx7CrU9MVWJ0zA+7wL7uAou4+R2?=
 =?us-ascii?Q?7lHLi3jZkJ/TmKfa4lO/hPGv1dIUK+HAmPTRvN92v1dnb+iXUt8nsRR3Ssp3?=
 =?us-ascii?Q?DUOB/2wf23JwsgyxZI1GpjJf8GTIzGDjgtvCXrW8mkveN6qL64t6j7528ggC?=
 =?us-ascii?Q?iD6h2x/f/zX4bT9NV+gZv7PRrQQ+k1EW3+71ZYo/TXkvQYuMWaE58Tlpn5x4?=
 =?us-ascii?Q?6E53Yt3nMNltjxKZlcr9/ntgrnbD0Mtn0PLuvwPMwLNEhfCb9f8JvkMttQRI?=
 =?us-ascii?Q?J/ndbCBXE3CyFr0wKrmUk3P8cbKnqrFn+Fdc/C0Zbk8ezk3Fy6MloNKHFtqV?=
 =?us-ascii?Q?ztlIPfvNuFh3+byxfCL1CF6IF6e5fulafRS+j9dcCKNF+xdy7rAAVRz+E2Yq?=
 =?us-ascii?Q?doj/rMv+JQhO7hLRnezDYg+AoWwMvNidcbC2BZIwzglj2GJlTZVunOERvksM?=
 =?us-ascii?Q?0mSKvludFF62xCn8vRJcRSXgjP+4PQN66efnV7kPj15Y14M9658YZhjAJAQd?=
 =?us-ascii?Q?5qU2uc28ZzBPJkMMk4JPiEBJ0+kyGhIxjk/H3TfaWD/lU/u1jxl6tFPT1dGW?=
 =?us-ascii?Q?ppxAvnG3F2r50u/F7Y0slYKolJEEGr4vf87jIaPH8M05cQ0B4GnWIU5roxV5?=
 =?us-ascii?Q?OReX4aVYxdYHdObwfBs2dnnDhoeRoJcoXqyvPbJst5EioB3CMNbCN6/TF9GD?=
 =?us-ascii?Q?GOtUXjPbHbUcStitqKH1jrjBR9ZeHG8StaPEEc4kVbaE65vtoMg7XGOQ/DHB?=
 =?us-ascii?Q?5LaAhAmySWPI3EHz2bqq93lYWuWmNVKVVVTZAdOCO9kDs135yvoZUZ1W+x0m?=
 =?us-ascii?Q?zTx0h2u6wMwJUyxxyijb3OkoSsv4eHA+wGfhXoQEAxZxJ+fqPEW5lrBFNGLx?=
 =?us-ascii?Q?GqxEJlkcgdvwZ0wo2S7p8NRf+lDBEYuJ7hbeamPGzk572wiuL6aPMtlqSzOG?=
 =?us-ascii?Q?zG6PxeuRA0c8YizvbkfLmumDwQBnvVBHcrx186qhJZMm+U2TNYTFY+rSk6bI?=
 =?us-ascii?Q?DVJaK3txRu5PtRDIPPtqeoc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9ad485-3eef-42a8-2ce7-08ddd53fde17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:20:44.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wLbgI8RB0YrKEeJJmLwAWRFsbaA8xzHF9DJsfjTHx26Gw6Wo3i8mpR7NaC+K8mwunqttl3juwhWAY4v/LUszXxPPTHB2ZQ8ZRQrHzoB0AcLL/t5MdX+Sq3tAlguTDXl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_162103_144879_767BFBB4 
X-CRM114-Status: UNSURE (   9.71  )
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
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
KernelVersion: v6.17

 arch/arm/mach-omap2/board-n8x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index ff2a4a4d8220..969265d5d5c6 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -167,7 +167,7 @@ static int n8x0_mmc_set_power_menelaus(struct device *dev, int slot,
 
 #ifdef CONFIG_MMC_DEBUG
 	dev_dbg(dev, "Set slot %d power: %s (vdd %d)\n", slot + 1,
-		power_on ? "on" : "off", vdd);
+		str_on_off(power_on), vdd);
 #endif
 	if (slot == 0) {
 		if (!power_on)
-- 
2.43.0


