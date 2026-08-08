Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B33CC5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 03:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msyugM1rdQGah/lV7BFbdl85Dot5pNHhQNoUia96vVk=; b=Pnz0ge4h4KJtWVhZhhAN5WCEPS
	cN1k/6T6bCsayntiscGMD+KRBMCh01A0VKjHYt31nGY/IWUj+3eSfQNxLwE3zmmqN76Fbo198mpzq
	O/AvHnuqVqfhPq5EHpPrP9A9VxB5Bwhjh17oMEWlJyt8gYlIAvVaojNyvE72G7Nv1JtWQAu+nQlBc
	KOCKTQAU4bk4UYvVTuPHBNA6a6i8f96AXigHmU43XfC9a0FeFioisURpnSWC4gWCm2+ZvkrdOAOFA
	CC2nKEvAVd+vRR0JcURK1wJ04Ctm/cEJ0Yep4Czowv0rhA+b4TXY5fy50t6GTb84npfzhPoua9JRM
	1S+3S0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsXaD-000000091D0-3SDp;
	Sat, 08 Aug 2026 03:18:49 +0000
Received: from mail-northeuropeazon11010044.outbound.protection.outlook.com ([52.101.84.44] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsXa9-0000000917Q-1I0q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 03:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnbL3NAt/f75uzJmn6UgqlHAx8tTMbjcIyKY6rHyU0FMUl7eLuucZy+z62fFPp+4lb/Y8uxtp79FoiXMHi/psdd3eHD4q/+apQTJRJhp8BnET/kSu1diU18oGA/K/Xbx/eE4P06VHR6b/iVkgA4JPyedkQWyR4XYAXZUfQgztIhxjHvtXMfaSUBPPYNIUa/TVH4Z9zrExr6uMteZfSbdmbqOnGiLEYHu6yWLF+MhQnLt9nZ0a0gKL7XyihyUAuxPAsZGi1DVAzc+rXUJonJsoTUfcQ5ydeciCuETqX6gyqxsu8PrASanswrCN+jbD24JOzO58pNmX0f2diOx8Wmyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msyugM1rdQGah/lV7BFbdl85Dot5pNHhQNoUia96vVk=;
 b=VeIkWGQaLDvmhH4F/ngFDGTfkWvkkKxshNzDzdZNHMBlg9VHHuGd4PlV15e+dHbP5UiHII93Gib3+at6fOM+zumaLr3PV+Jds4KUd+zO2cj6w5GFZonbfm/llB5U3qGvqY16+SJiElGWI0GUq78zXd1WkQ2KobAfRn6VlBn0H9X7RVJBxFPtGQWgexoyQ7VCB01tYAVEbICCDrhB93f46TqtBVp79JdRZKC/aOBoIomszVNmykhWcbBg0848B3osZPKRec2xhGupq4ttmtlC5zDtukG03zQ6stDT9EDMncaXrd+R2AL3uWUEdmQLAoHRVMEr1GjddThTWpfIKXB+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msyugM1rdQGah/lV7BFbdl85Dot5pNHhQNoUia96vVk=;
 b=qK2JTdJLvVgSHOkUkXTxE9yvpt2MJteAtOSnqFXs8HbWBUYCYC8AAQsgeogCeR6sUolIBMHqSR6DG7/yQ1sNklJ/rBklo/IM1ODZw6WBmr57hPw/wvlP/EOu2bYVP0VD1zkx+hnS5B6MNojxCrHOYWL7s3h7CuitTdnQ6YxTEu2VOIMw0GYWDUTXKQIb6kHnARjsCHh13lfEw3/Nda125LHjN3fDbkrWIRzZ8F5esn2MSKrG6lyKApObdbUKALoThmH+7UaBf0K/PiKrr4fq/wVRdm96WA5nI3s2lDi3CCEQDNeM9xos+TbU4ABeSL2ode0p4tsNkYk43c7OIPFFxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DU2PR04MB8936.eurprd04.prod.outlook.com (2603:10a6:10:2e3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Sat, 8 Aug
 2026 03:18:43 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0292.022; Sat, 8 Aug 2026
 03:18:43 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 net-next 5/7] net: dsa: netc: enable ingress port filtering lookup by default
Date: Sat,  8 Aug 2026 11:21:44 +0800
Message-Id: <20260808032146.2335723-7-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
References: <20260808032146.2335723-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::13) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DU2PR04MB8936:EE_
X-MS-Office365-Filtering-Correlation-Id: 2819d9d6-24b2-49a0-9168-08def4fbc014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|19092799006|18002099003|22082099003|56012099006|11063799006|3023799007|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info: 2H7SwqaTTVzoASBseZU1jiMprbJOWKtGo5bBnRiksJ0v1VF8Vt+aooNdUTRdXfG/i/YkM7OYJ5niww9NL2BprgEyhwBRlB5yKBMJ3jT2xlBLOVkwEkxZ+RGNW+ElX5DU+p4ykCDabGSWcy636B7w6x1Agy2cVFDLzYf9aiLivwyvrETfmHtuqBIRInfU2UUcx+dPr0XTD+EwTfPf7rqDE3s4LYan3rPathl0QxXjw615HMh5GXePEQFCPA4ChRMzGqdILzkHrtgcdtWR11TQ7Dus9XPtBypchKtbt404jORgcukMxg0WNngdgRjcP+bP3+hkq3uzxZI1z/DCyuZvT2BXZL11P0bC7gmVFRcpH1j9rGNDD9Mq5/r9G4dndKRlah5GyyFpsLukVxbLx/BbRPZKRv0cjf/B3KlJt/xLUAfmkjpL/U4cRUuW1vJdX/PppkrAJpNhlN04s9vekLR70G0VAs3GdOXtag45FwCAJxnxypEAWhdPFSF+6DsXbE/b73ZNvav0uP6BYpI7zaQJG4xExtmovLDFeUPIsXSNS4uSWXRB2pSbL9+rPAD70d7js8XGYtLMbr5HlNFGaoluA7MsxWo+szpDHtbP7TeKJE3M8lMpkm/vxML0Ujz4m2OLmVndITcxE5JcDy2bh3XyfHd/ojtnBVUuJp4FR3Pj8vNrHDUkIpVW8Wr/eENrm+QewuwSu779Hc9R8IsD+laXtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bdmjvIOUt9laR98tLb84jl0LaDvTHaA6JLNwVD5Q/BzsQeY+na6lFDKni3XT?=
 =?us-ascii?Q?F1ZY/N5JuOhljj4yvVu0v09NNipOQ1m2CR+xVRDOhZclvXCQM9JFQFqoDOyU?=
 =?us-ascii?Q?yO9jlhi4BYhrK07GZ4C1IziBP0AYoSJsjKND6lZINSbFaA9DPZelrC/BcFxB?=
 =?us-ascii?Q?LFYzZfW6SgXtzeND+tfadRkhCNTMFG24mQEYct1WTscW5KDkEMxGdoxevJYp?=
 =?us-ascii?Q?N1Ir+tlrhds7WPcDRJhpjK5y1pWlmFH4Zk01ELcLIYBrfCjbEVIpQ9HyrSGw?=
 =?us-ascii?Q?D2gD5JqFFzT7bLJRv1yBIenjxb/TCiZKeVLAOCFfExL74ApEhoHOUp64UIHe?=
 =?us-ascii?Q?eMigaFFXOaxjk/hgdCuJ/+JtzUaTp4VYO4brF710dTbSPWx9iodXVooDpXIW?=
 =?us-ascii?Q?ld55vj78h4Cvy3g0Nu4ZfnGHL4ZiE1Dy6SME0bQI4hLjKKXT8XjKyqM5riht?=
 =?us-ascii?Q?H8LQZ+A7VUY8w9ONi5rkfXeqIS6u1kyS5IXzUmNHYBGaYVWBpkgeaBiQqiKT?=
 =?us-ascii?Q?RtOmrI8PlFfufrCocpA/aP80rqecjhw0irMlueo+HLdQE3tJFdqhoRb12oU/?=
 =?us-ascii?Q?DKs2nk60F8yZo12s/Nuc8Fvkm2rKCHpn4kvuCP4z2MTNPuiKAjY5lfxNG/yr?=
 =?us-ascii?Q?wJ4/2PAOjnIPBN5KqQsJySlCyus5r69gm9YdaWJztAN897qVt5/rXYmAwqwi?=
 =?us-ascii?Q?+tCpUtfsDBLNE8tHYIvwSU8qMBodIghb9Iz+T39Y6QztAj+hUrfpKXWyqUal?=
 =?us-ascii?Q?evciTREdDKKMBOtEL5HOlpJmY5KDlNq3UnW1seos6TGD6AfVWW0P1p0Nsykb?=
 =?us-ascii?Q?e6oFSMgwk75sLlPS0MN9g6McOs+LFXkHxjD73HT1gzNtN7dPUDs1EtDMy3Bf?=
 =?us-ascii?Q?/Qncp3qGJZ0MFAGNN4M8TDzY2HjST6++lz7sn93g4OlqJdgK88Kk3WeNrinL?=
 =?us-ascii?Q?/nNmkl2g0FDAYl1KbEAR2sDN9k6WK7OrtR1h2ZfrugpsqyEpAZz1hGlRskBa?=
 =?us-ascii?Q?Xtg8P+xaKy92tuzmg061tzDVT8FvkW5dFA9Lh1Z6f0s35cC0wyJWhnnGhu+a?=
 =?us-ascii?Q?XcyjTxxENDeYolcLZ/KzLxK4vH2EQe4x1ShyE4NMN4LSzAwyBxr3wDzmrC/h?=
 =?us-ascii?Q?J6vejKWo6Bk/7/S7yANJU6tyg4xHHazGA45B2qVbOEQqmLTxOKLe/ZIBZBDt?=
 =?us-ascii?Q?BJQNhU2t1ozc1xw4PWHNFz5EwcrzgNHPTmZkpuqTpdIgTqSt61KNpDIHfHdw?=
 =?us-ascii?Q?DZGEYQDOtWI+/st8tppQ8zHCFC+m+Q5hqewWDYJ9gnMPGAtW1V/FlPPAbnKt?=
 =?us-ascii?Q?GkepuySECaKgxiJNZ2u95oBWLMpuKXYp6oh4C0DGWPYqrgHhY+F3wn2fmXSj?=
 =?us-ascii?Q?bufatlIpVOMvKlcMgpwNA0ud/eKBL8f0goDlblB+HSsyDZ2IuQAXl8KW0KA3?=
 =?us-ascii?Q?I2XOA4gkSCvhLeuYLNOhFkh2shAIVzA1Csz3F/CF7xPAEq+Q2KPHu1a0UGYL?=
 =?us-ascii?Q?u2is4bt8BdWJfw83WSp2T/vROryAzQpDEKppdnmjdq+u1nTSqW8CpgDmqcTm?=
 =?us-ascii?Q?dIVgA1cyDn+vh3YlVcF2N6baiXYA+x/0UD2ecJME4GpsIudIhO3A+q8Kmv5J?=
 =?us-ascii?Q?+K3e25AfMFN8s7UJ91E8fhbe86O+QBUQiZhD5mNm6cHX2i76lo6onjZouyrI?=
 =?us-ascii?Q?J9x2CTNGPODSY2j6vdvMziSxOgbW+3d+AVWS04krC/DVVaCEeVv3ruqSt16P?=
 =?us-ascii?Q?+hHK2SKE9l30t2QVbKf7c4l1kmvYCAd/EF6KD64/0Um+ebKih6ty?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2819d9d6-24b2-49a0-9168-08def4fbc014
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2026 03:18:43.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEBI/Kr2MV+HF3IT7EXyeOwUxg/4gwNDQ8qjV/BMw212l2pfwX9MG9A25GCjXIshIQH4ZX4rbFuVLcBdARE/ZzZvBv4wdu0Nzjg2UZSp3OdHtnnV0mcGtgp4H54leXSG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_201845_353265_963AB90D 
X-CRM114-Status: GOOD (  12.54  )
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

From: Wei Fang <wei.fang@nxp.com>

The ingress port filtering lookup function involves performing a lookup
against the ingress port filter table (IPFT). If the frame matches an
entry, subsequent frame processing functions will perform corresponding
operations based on the parameters specified in that entry. If no entry
matches the frame, the frame is allowed in, and passed to the next frame
processing function. Therefore, the ingress port filtering lookup is
enabled by default to simplify code logic, eliminating the need to track
whether the current IPFT has already added an entry for the port.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/dsa/netc/netc_main.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
index d326a00104e1..9cb9e618661e 100644
--- a/drivers/net/dsa/netc/netc_main.c
+++ b/drivers/net/dsa/netc/netc_main.c
@@ -555,6 +555,12 @@ static void netc_port_fixed_config(struct netc_port *np)
 	netc_port_rmw(np, NETC_PCR, PCR_L2DOSE | PCR_L3DOSE,
 		      PCR_L2DOSE | PCR_L3DOSE);
 
+	/* Enable ingress port filter table lookup, if no match is found,
+	 * the frame is allowed and passed to the next frame processing
+	 * function.
+	 */
+	netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
+
 	/* Set the quanta value of TX PAUSE frame */
 	netc_mac_port_wr(np, NETC_PM_PAUSE_QUANTA(0), NETC_PAUSE_QUANTA);
 
@@ -1708,8 +1714,6 @@ static int netc_port_add_host_flood_rule(struct netc_port *np,
 	int err;
 
 	if (!uc && !mc) {
-		/* Disable ingress port filter table lookup */
-		netc_port_wr(np, NETC_PIPFCR, 0);
 		np->uc = false;
 		np->mc = false;
 
@@ -1753,8 +1757,6 @@ static int netc_port_add_host_flood_rule(struct netc_port *np,
 	np->uc = uc;
 	np->mc = mc;
 	np->ipft_hf_eid = host_flood->entry_id;
-	/* Enable ingress port filter table lookup */
-	netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
 
 free_host_flood:
 	kfree(host_flood);
@@ -1779,7 +1781,6 @@ static void netc_port_remove_host_flood(struct netc_port *np, u32 entry_id)
 		np->ipft_hf_eid = NTMP_NULL_ENTRY_ID;
 		np->uc = false;
 		np->mc = false;
-		netc_port_wr(np, NETC_PIPFCR, 0);
 	}
 }
 
-- 
2.34.1


