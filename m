Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C29C44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 01:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:From:Cc:To:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOdC0p4G9k8473QE/ZetfqAp4Ko4XokajowOF/Vg3Ms=; b=kGNN282U6iKCmvDCrMmvqNC8Dp
	bKwaY7tMpIQBFpB/XsEfdl1aGKOeOHp6e2e+SoPwyiqz6Zc3bNMqkxq9zGVAzRthLLm0Be0unPTBu
	K5F/eLySXUB/D99tg2K4oYdKZcwC1jTtBDCbcghJs3EGhl6uPBa7k30IKye9feW6U6jOgfHIfs+fd
	11QjrhZtoLv8PcHshFc/6hnTgVpMoj/W3mQHNx+BjJalgRlCLY7Xxuu6U9Sxjx+zSwC54mSrNihYa
	9nwpXnddvQ636JGrAGy04mXYCAzRBAy3guTrc5oqc11ur++s0lBsaNum5LRcxfSxOisBwkZSbsrXl
	PRMsNQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzPY-00000008C94-1M8I;
	Tue, 21 Jul 2026 01:36:44 +0000
Received: from mail-japanwestazlp170100003.outbound.protection.outlook.com ([2a01:111:f403:c407::3] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlzPW-00000008C8f-0oYe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 01:36:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bISPmJ3yPBp8TR3MNS72VujjhJqBuXgdTHhrh0R1BR5v7vEW+Ky56vKMW31to4hmpcWZqtQsEtPcS+/EkYJ8Kj7+OeLpNFAldh7h8CpSWJk1zCYWq+xY7UOFfaTQnuDNjW8ZtpQeNo+fBbRJOw+ClxNv/qe5tqtgqhaeKotw4XQHn5DLtQml1Jph/TISKMRH8CX+4oopNhVXnsfPpxqKhmSJM0DigS4mIkDkhQn+MJMR7oEW5y2AXH3a+7CE5TCGDxCuVZqdUApeNHwjdGVjThY45NvNMIqyEGlmGStr1XOnO1HJ7yjm13hfCDoIU+eWy27wVfZk+RdUrlV8p/klxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOdC0p4G9k8473QE/ZetfqAp4Ko4XokajowOF/Vg3Ms=;
 b=fGP0Vt0lsmwZTDE9m30k8jFF6WShoTGYfL0YWu/zGHY2/gnmEpseBDoLr4WzHNs4o0JYZ1KHHm7zCZsPY0yaF3rvMbsn3mZ1cg+k/qm23CQHeY8Z36Fnf9V2XQjlQmcGbT4cb5pZlZbBINHZiYn8OrE/dqZAeo1KhsVfJ/LOTMFjWUu/6vc9OJGwMwmokyUxYkd2ia7duxJcrKSrAPTM7st74fmr1EYDGtH/fVlPJT6lUGAYvUSE/lC0w6p4r3em3zu1D5d/rnn7Xr8gfhXKUOwrVkZpBum181YcQ9cJCCiQV/fjmVDoVvXhoPXE0kKc+6t+xnBZuBOJRcLPVjfx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOdC0p4G9k8473QE/ZetfqAp4Ko4XokajowOF/Vg3Ms=;
 b=nDi7sS0FxjYDSceHtDInAYQ7VaEemoHovBQ3Uf3NdeENwVHp7QIhsrLeDo0/BwGlhqV7RwcQKx8RIzWKTn9gmsqplhi5XG4oqRzTKi96/KFtwoYFNMJXHJlGbBl+MgNOWBbJ5ycuThj4iysD4aO62AByvzyTiTsY8Ywa3Dooe5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:36:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:36:24 +0000
Message-ID: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: meson: preparation for Card capsuling
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:36:23 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c76b479-0784-4806-952b-08dee6c87986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|23010399003|366016|38350700014|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: VhyBbWNI4Mz+2Pa6QaWfV2rDafhd1OdfpCqKsfwAaDdhMcaHc9sFxEmOL9MW8PfO1LqUVjnr/H54AIgpE+N8tL7tg35QqebgND3cSqcvE9mgfUIbnRuEHjnf37YNYsRdvZmrRCh7rHdVyhFArJXEmKO/vlpODAySADgsaMEGUNuYjvAlDjjsyx6yw44eoCj3jGK3dzXIyP5tK6auSkU/DGkitd1L5XY0x+7hyzbv2tniTfAyWyrt8ba4GPEnVpQbHfJGYYZq2cm0HGobIQnmb/2vijcfc90XRMYPGSRFP3uzidhu6mTOsa10deUSmQLy8jmgz/kDTOI2913C6y2eF1Cw0XDJwaj3DlubSuvroaKlTSq2YlVIe0W7c+IQERmFyVLCbbDBlWND31iBfKbfmpzgEeW82ejg9SgbIativnjvJQhjwfFsurvXt8df4dWpop+XnJcsjKVRLOA30QmkqV21YpVEu8JQDgRWrRKMJlwtgtRnEQBlPGkedGDpicQ4TCqMHYjgEe7V3Et/Iwc8i68Ib87FWBFDEVTplvKf1ePzwyHiLGhnhMUNSwOV51O7d39FJuF4yiTjleL1p7rioqQTh1zSHXsoeYSPh9JDZ0RYKp8GyGWN/YrKhktKl3a0v4tn9H2gkk9kWn46AA4ZJ3ENoqAWzC+PRfxbDbduwVM/CXzFweDJggTkR/ozGScIGDsuloHNmex45gF1V3VfL3eqdH3i3mfgZVC5rgCA3+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(23010399003)(366016)(38350700014)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?01qreDVOg05DNBdSJ8e2J+K7DhTq4P3s1zkZ/jEu9KiBvBJ2X/RQJ0thGn91?=
 =?us-ascii?Q?VDvpT6O31CuHqQcIehB+fk8D34L7OC+GmM4bKAHdnm1ckPK2t/BRZ4O/FFea?=
 =?us-ascii?Q?WW/xPdseqSgpli78WXpkOlrvOwSc8YP1EAZxDvHhBMaLWd1MQlANXtVO4TmK?=
 =?us-ascii?Q?CkIbYIVaxBeY0miqc2t9WZnDxv3VgBy+AUEoE2fvRE6SsEQQYvngwbvJuqv/?=
 =?us-ascii?Q?QQwKFNBaxH2JOQNbJoP6uEQf1ggOAC13HuWdX9YEC+DDzFVJ1faYnfzyOUdF?=
 =?us-ascii?Q?zIQydOaGYVMKxrFxV7JIEeL24I1RLRpHITaX2fKK4vtsQ2Hd4VVfAsxvIAAz?=
 =?us-ascii?Q?sQHpdrvoVnyxHJqFCTT8Q8kB7gAuNkYC1ckQAr2mRPtfe7SXJLQ3ACqMfq4Y?=
 =?us-ascii?Q?zRXyqFdTD1T8S7fDE+xfCik0Htl8MGnI46wcIGugekyXGdrMD4VjZdFtneKt?=
 =?us-ascii?Q?A0bpI6UdObTMStF1y1elC3NUhyVSYrsO66XrzyDb0ZPTu+xFTdPztp8tEA8+?=
 =?us-ascii?Q?iSpHxHzlfS52YtX6bUfQma7vGjdWshfc1JlL9VnP4t0kq0raOyEBhqTpMpBp?=
 =?us-ascii?Q?TNJ7dHUv4cI2xssgFnbT9oBXKWLid1croZ8atIusJf05jHAT2Ke+ujzLiHD2?=
 =?us-ascii?Q?uwxy931aJktpzab5RHwudYoZfADW/4KpDSASK6amaR5Vova4EaAKmnPh/lpF?=
 =?us-ascii?Q?thcvNp5EJPFyLT/3WEKDVketzSCJwXOtVJzvlTCNdGlTyAdXvhZInv4TxF1Z?=
 =?us-ascii?Q?eumjct/y/BAYUdcwKmx6JqNv0Sk5KVdBHK1t0Q/h+Px5OsqI2NGM20oPdTii?=
 =?us-ascii?Q?mxxtPMmrKY2RM1YIdzUWrcoLeSChX7eLYbz+xA8+W7R/0DSh8Hpn/KgVjmcZ?=
 =?us-ascii?Q?xiIGnvEaZykqmHolsIBIlijGFB5Ic9MHofkO/4W7DEVqZhC2B4CTYP3kaKdW?=
 =?us-ascii?Q?MR2NHc9Sc7KXdbPlKR+lRJgLTbvocSPGJpy3SAdoFvMgOxe57WWW/FAPGksh?=
 =?us-ascii?Q?CSLNqB7PscVfMfb1mxljt2iZT9SFDmvyvWMPGS6JS4h/vh5wqOLaprYuKRK1?=
 =?us-ascii?Q?78uk2H0FHJRedMFGV+yMFNnvpSYrMtWfWbTPemv6e0xsQCkVFBpVhpTMpPMU?=
 =?us-ascii?Q?8+uPlKGy6gNHBKW1Xy0kxqGkRSJo7Xw0s3MUXfdUIqwbwyCXqw+12mjDToiz?=
 =?us-ascii?Q?ivNp27gWs2u6jjsShe6uvnl+Aaq2JLQHMKHv+mzlBwbqy+1BVRVZ2MIbK5L/?=
 =?us-ascii?Q?VygKdrENAhnuTQVtCs4KbIBdEAxnLgf3t5+SasobIfX0/EcbMLm1ZtGPX8Yu?=
 =?us-ascii?Q?JZbX2NJi0pmOdd5u8sslu+8lTlmy+brWM/KD0elApfl350Qa3PU+QJkMe7HV?=
 =?us-ascii?Q?G/TNexUP4cyUr6dIwHLTXq2607vvddpcIinBC46bSyAjBE97xJ2SAaY+FTdB?=
 =?us-ascii?Q?kkcEoIVxG3OTHh9rFF4f42QbNTRcY1JNMW5GdkWtlwJSpvZ3hYGViGJlmEBI?=
 =?us-ascii?Q?n3COeZnXMc/86jnw1N/0+gXui2rrXp6eSIPQPS0tg5v4ZA9Bu6eTwLyuAPoa?=
 =?us-ascii?Q?uCScavjdP23+gIWIOaiH1YqGWrrQRo5MWTxyZI6hk5y+gqNnJimfDeFiuO2y?=
 =?us-ascii?Q?sWXvg8YZ9sEY7MqWk7HN4fXHshNXWwtEKoAIHeAZjsTK54aB6NP5KEbbJJ0C?=
 =?us-ascii?Q?leFPSAgUfw2SaVJ0nrLmhQvnAFmb2P8mMwFSWLfvYHUxWg0iBdZrq8MO4390?=
 =?us-ascii?Q?NM9V3T2vvyQlV2qdBovOPBd6A+Qd6cPWdiT5V94nw4mug8tsl3pi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c76b479-0784-4806-952b-08dee6c87986
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:36:24.1344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c17//45RRT1JWiQlul96NkFkG+PtEuCBgB7oZ+g875v8dSp34ThYwwcgUk7KB0EY1teIZ3eAxizin0BkWmKT3JoAPytRnbTc9bz3zvCD3dGwQcTkP0MKny8NfRcb59LF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_183642_234368_064A351D 
X-CRM114-Status: UNSURE (   6.84  )
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


Hi Meson developers

I will post Card capsuling patch.
To makes its review easy, tidyup meson drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.

[1/2] is RFC

Kuninori Morimoto (2):
  ASoC: meson: meson-card-utils: use meson_card_parse_of_optional()
  ASoC: meson: meson-card: use priv instead of card on each functions

 sound/soc/meson/axg-card.c         | 63 ++++++++++++++++--------------
 sound/soc/meson/gx-card.c          | 23 +++++------
 sound/soc/meson/meson-card-utils.c | 59 +++++++++++++++-------------
 sound/soc/meson/meson-card.h       | 11 +++---
 4 files changed, 83 insertions(+), 73 deletions(-)

-- 
2.53.0


