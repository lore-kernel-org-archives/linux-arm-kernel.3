Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37780C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6uEoZVelqqiPHG5MINFGev4roHy4M8lixp1YqZumD0=; b=Cx+G3cH4vN9L1KbPKspQ+yHNHn
	ALNnAZrE5wP7xSYRut1Uq53pHjIBb/I1S1DQdaiG7fPaY6zST9fhXoCOc7vp69Y+7M7/+4URPPMKs
	Psc4WrJVAkOiaI2kmrd+kb7PIkY6iB6cRpN8vvG3K31ukDimfFpUU+DVkzF+WHg0dPv01QPR/sVDE
	jb2Z5unB+aZ9xpf0ryMssven2ceBTimkVs2/BV0XftlG89V3a7GSZg7Do0FTlaW6gAc03TNVzTFIE
	FP6q0cer+00LmSkh9bXwrB+Lq+soQ/Pj1IIybr3CJXJF5G14167FUkfXO+jXauRcQNGTLPjBeqiGn
	6ZeVdBag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbLr-00000006hFx-3Wwd;
	Fri, 03 Jul 2026 10:42:31 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbLo-00000006hCU-486X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 10:42:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SukMLcalc4vFJlxrr67QkA2wy8N/WC4bc6s/HFhZFpRYyYcDT/cj0psagreKQMwMcBi+dNH4kXQyB3O+ELmllnmv6nhJjATLjmBRmU/LJ690OSAsAKRCgIXjZM8OHf6JYiIW1qv0aTaynExgyMaW82IhwkQ2/KRAjqk6osKXPcfd+sD52R0jmUpkqutpYl4eg2043VB/989+rZIQcazkmluf4bkRQdnWC/lRpsQ5ORcWDXcXbFDPqGds7VmlBvP/JkR48rXa1JOWwXqvBJkED5vhF8HjvCYrN4nxG466sLl2cK7Bey79jzQuCtSgj7gaFuukiZDj+L8VfPeRQtD+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6uEoZVelqqiPHG5MINFGev4roHy4M8lixp1YqZumD0=;
 b=dfa5IvSSlKYiiiWqrbAXIvF41608kbjGnGd3WwUe2x08RTNzm2ztE4x5b0SkxTYHwQgUIGTqm0FjsFu8B8bVOQlyldNnQmX8vUIOLsMFVZg4XmP+FhuxFOeo3R9fz9i9MImpuaulxYQh4+OK/DrDyDh6zj8x72noZ3Jur+VsUQ6ZnlPdONOzzaBJu7jnzniirr4gnOryiF6Ku9e6vIHfogkRIK7lQbG/frcwrEv05s8w3euK6NEieFzLbcIyejF4lh26fue3XSb5q1+orgbz2RJ9bwQ3qd7PBxfkXJh5h7qNngFJA4kT25NXuBUXg16j+MNUK6j7HV4tOUhJq8PAug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6uEoZVelqqiPHG5MINFGev4roHy4M8lixp1YqZumD0=;
 b=gVyOb6Z6hcnz6/9Hx7lbrbB8qdaWjLRmumbg+wa9Zi+mI86iPaaXN9KDBApX3IC7RvoO+EN/JiH5iEOYYKu3n5xGzHp8WSp7TBbFthfY/ga44TkqnbE8ZIGuv1laV3TYwJDYT89GVs6pQG15qQXVB7o81KZVJbb8f78vYXfyHdZdmVUZtwbTU7foCjJBbCiIaJgUL5SDMWsYCvtA+Bd1KMeh+cM3yngBJ0q/o8EBRQlm7z1fwQNHiNMBWFRNbPs9UeICT+qskxq6zv7gVjCvlkFhpL+g5ojU91/5Fc1bzxutngKWJyt4zhbECre5M1+6Z+CVAxgGHrixSXcbpoPBwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by DU4PR04MB10741.eurprd04.prod.outlook.com (2603:10a6:10:581::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 10:42:23 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:42:23 +0000
From: wei.fang@oss.nxp.com
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	wei.fang@nxp.com,
	chleroy@kernel.org,
	maxime.chevallier@bootlin.com
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 net-next 05/14] net: enetc: use PCI device name for debugfs directory
Date: Fri,  3 Jul 2026 18:13:19 +0800
Message-Id: <20260703101328.550714-6-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703101328.550714-1-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|DU4PR04MB10741:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c67164-2ab7-46ec-924c-08ded8efc404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|921020|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: afPx3AXjdpBr1ppdGi4p8znO4uQhGvm3wb+WlFfMPHXzDyvqTHNCoLNe/AAV0S5TDnFbSo0SI5OlFx6MpNh9Own5ZSVsxSI/pg5hRf25U1PUAaTNDQj8FE2n2logXGhW3XejGHxIEfKr0vtoewiNNd8SoZVfL21mJcEnxbctXX/sOHGFQK1I7/NaAA54dGca5ZRxBPBCBZ8LiJuLZnkFzxMrgBk/UBMc9/ot+j5FoRulEaagr35SmOhuvhuEbixWsea87jqrxUKQmCLO7CterRFsxAqqKbxJanfn0+PrE8S5yjXqRClqU1/uGO4rmRjKjwx6BXZoDH3kuVH9FAW8xAeW3WS6+OSbUnCVzIsyxnbe4xY39eU2y3Q525zWuLPsH1cTuSCAKE0JBXL8XG20OssAJEmmY3+M/lBj2bRuQMCtzv85P5O6K3XVXtTznxkkpFqSNQJzTBShE1pYj9NqUi8QpLwXPSAJ5vsQgp48Ed1EBgKjZhgkKunVZbS1MUK3rFvbocug01QIuzdFAm/mW2uisbnw3QLpI8xWeh7XM9O0iwiWYInUuZGtwT94ttw7tWaiLMyXRQqwQrNCOSxloB72+sGNyf3BDScSNb+gmOvocFqCEgQ1kyEe8aetzBoYJcP4KAydjlopXH2022AO0u2I5CdLlUAxo0gdbfFcLwnZEgEZu2AXpNtskS7nhGUoFu8gIcimMMVEy1Cfy3E3kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(921020)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CjBSxzuKemSM++AMib/ExZsvPT4QhYEqmfGVdFdInTTb5oDHmg8e97dt5cD?=
 =?us-ascii?Q?zgHm0ea10hhxDDwnq/Q9MimpRQrYdKB1hDxNapGzkQISN2kOcSFdtPFJauBS?=
 =?us-ascii?Q?WDGAQwVdumhA3l/9dDtnnMgOtH85VFB93PsGnqqB0JCWwEDIkadyvkbE94Ra?=
 =?us-ascii?Q?VqwIK++yejeWsqZgf9eeL/MMRR+g3x5H3bQD6wkeATdOaQPIjVhGBdEmrvvs?=
 =?us-ascii?Q?eBEB01FPaTKwY3G4mMKFYV6bh8cIaXEr2WlSpAFmxRh+DR/IFaifiuMIVds3?=
 =?us-ascii?Q?XyCx3FtvxY48yF1gvEAxKGhk7EXN+i8Tc21vtgsFrJvm+1lgypqsBwRDeBUj?=
 =?us-ascii?Q?prGMYTezpsU64SmJbLFFeKURsrMM5SPhSK/RaED4S+Yzix6Z5IEAE9HbHSVs?=
 =?us-ascii?Q?0LsULOR+OCHB45a20WE6MoFtWyy1KoolOITsUvNEMjqB7iPOa6XdCZdGnNcm?=
 =?us-ascii?Q?lEhWfvj/Ct3SpMzxrv0JULN6nmVSLAYn+l9zWVWgvuxf+Dy6KGNjRVQDi9/F?=
 =?us-ascii?Q?6V/EaO7Ty9BHspBSgdD/VSnUvcJhYSl4GAgsWIz+ZcbxcV/Shf7yZgW7bkAE?=
 =?us-ascii?Q?A4YQYQvfsyBPfvYrW4buivszaa1ZWM7gaCN5hbC/uQYkSt4FHXORY5bTR21X?=
 =?us-ascii?Q?AkGPqht+2MwvsqlOUpQy/s1A4PwaH5mg4U32u5y7KRTdoM9iqWzh6ouUXbmo?=
 =?us-ascii?Q?pLuJemgcP6x5o9qYOzrWc/vEGj/K09pHQPhEaA/DmuooZMv9tlXC9BaKzjeC?=
 =?us-ascii?Q?wkS3IGfhf2UEePvgBmxxHH8xu+rEZVATHMjsSBOJlXlCvJPwukAYMVn/HvTw?=
 =?us-ascii?Q?/7ChKmVKqiorbqlcD7yYs9z3sMrL6uXUFqafxu5XP3krizNAMq5W+c10Go0T?=
 =?us-ascii?Q?TgqxIl//wt6jaKvSXbBXYUO4aV7NDsS0dlXTNxeZoKMQdHHfgt9XA5tNrVTU?=
 =?us-ascii?Q?WsB6hyPveM0sf/QAEkio/qa3gKUivEM11uQhCP9UiQOkvrGq/ZfmESY1Fh0m?=
 =?us-ascii?Q?rc3HFtwoMPO8KUA/v2dqZtX7X50hbaFk3QDYO445G2C+bruM4fh2soYN5Mbt?=
 =?us-ascii?Q?LfNnrpW+fT6Jpiv4CwPsLV7t/z3NJv9FZD+Ex7e3zn8R2CcbtFiCGurhnX1w?=
 =?us-ascii?Q?KUbFLfC6BA8bGraIf07ha97bsl236MV47FBMX+0ojsxrgIiNYGqZDHjjLi0l?=
 =?us-ascii?Q?iUD8zq77p8HQxcNlHNKAETaVp92m//J/z9J69b+3h+Ifwp227uX2T7f6y0Ns?=
 =?us-ascii?Q?apLPX6CIn3oocHqAxBOWfGbynF68YAADJjtFBaTXiVP1h5CRTBwjc9wtAezd?=
 =?us-ascii?Q?uLb90vYJK8NodbZ9Y/Vg8rkuai6nRigLg2Wabz2QcQOtMfynuJ79p01CQztz?=
 =?us-ascii?Q?hLrzJuILj94l5UUoxQcaewJz+AIRovprFTXojB5HjcoP5ecBYggICkJZF8cW?=
 =?us-ascii?Q?IR8FPzCOp3oSaW+sf03auH+HEK0Mmcfz110Rc0J1dvYhfzuvZnfiqUWd5A6y?=
 =?us-ascii?Q?eJf+aQsOpzq9jLDxyhooDY7qOhKYIKbVmYSx5SwSSc+05bHmY/1rfic/ZZ/X?=
 =?us-ascii?Q?eTq5SfwInByErPmi+L+5S0u4dc5BcOExa/PLd39HhPWS1lD7XkgL1G4kh9Yi?=
 =?us-ascii?Q?3Cvd+3uVvE4/1mLrn1JeQEbtoGBAxb2q1YeqjAL1WUZIGGblooTRLOEWQNdV?=
 =?us-ascii?Q?scoFAT0zz7y1ktYUOWI3JijqN2zavCpN77TCEdeG+rKnPxiHeyIKTDegVuyW?=
 =?us-ascii?Q?LZm8BcEzE0N/sttSj6nPao+nVusCT53e/7FYe7o0+6uEEHl8rOur?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c67164-2ab7-46ec-924c-08ded8efc404
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:42:23.3216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+NXpLpmu415d+od2JT9dD3hKBg3Xu5eZsR0oHAcE2dB2FJuMmvUHNYrT/1VURKqaUSO2UxsC6zYwkK1d7gSeEDxOCeLNKNVhGwp2r5JEF1BwuDVLQSHUq1tUVIGfjfy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_034229_016515_8977F747 
X-CRM114-Status: GOOD (  10.21  )
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

enetc_create_debugfs() is called right after register_netdev(), at which
point ndev->name still holds the format template "eth%d" rather than the
final assigned name (e.g., via udev rules).

Use pci_name() instead of netdev_name() to name the debugfs directory.
The PCI device name is unique, stable, and available from the start,
making it a more reliable identifier for the debugfs entry.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
index 4a769d9e5679..be378bf8f74d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
@@ -81,10 +81,9 @@ DEFINE_SHOW_ATTRIBUTE(enetc_mac_filter);
 
 void enetc_create_debugfs(struct enetc_si *si)
 {
-	struct net_device *ndev = si->ndev;
 	struct dentry *root;
 
-	root = debugfs_create_dir(netdev_name(ndev), NULL);
+	root = debugfs_create_dir(pci_name(si->pdev), NULL);
 	if (IS_ERR(root))
 		return;
 
-- 
2.34.1


