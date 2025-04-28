Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E9C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jx1vK732d+76aGqW4vphTAvyEt73F2t2JoYDOYy07aY=; b=IjNIsx71EPRaq58dYeYARFAuQF
	SACKJIXFZwebZ2Tj3wt8hE6h8w5cXbNMwhu8tjGyETgzU4iVX4kmfH6spUEQePrWNJy2o3eh50qR4
	gFlUhx2mafmvdb31JoaLq9r0fWUrUZXPFi1BBVOl8c5vj5xTS0ML77BlNMvh2HwSMXjelC7K2evx8
	6YOU49t19/UIOqlbON7xMHdz4okR+nGDVciTo604FT6SAKpa6SdKFZNpyVr0OXaXDMf8F6rXJ5c1n
	ZLDfbc7jbEyEhVlWKynRk54ujsaTsDkYJxbU2UOjT+lwp3N2qI58LrrFsgd+tpauJH0F0CfNwomk5
	iP/icR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Mza-000000062Cf-1Min;
	Mon, 28 Apr 2025 11:49:46 +0000
Received: from mail-am6eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2612::61c] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MTt-00000005ust-31O9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHVEA+1/uqN7OLMpCM1CoLQg0Iyg8uiEizk3Ookz38p0Q7pzaYqstmi1Q5+emLVVORfEgqBm1LVu64u4NGc+jE0v4p5hnEYDgeu2PHkXGGbX750xFmMajKtJE10DPiAxBw8z53nMpLdZIpc6BkMIPswbQuAqZOlHFTHZWr48mbZkn0DXSBnh2kgmQV2A7exAqPcMrOydpfKVzSdl/KFftZ0Zy0iTnF4wYtl2dRmoZTsruF8ayAAHxu2Nnp2sjIIlhPevG+Jlcw3FY5tET+thAsrMTOmjzYN4PR2ghKz0QCCJw4nkre+w9gOneJLdZRoBjQfjhX+xJVrYiE/wr0GKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jx1vK732d+76aGqW4vphTAvyEt73F2t2JoYDOYy07aY=;
 b=AkhmO0skAXiED7UGG13FGQOmtvvuZP8ccX5NPy7gA6B5c6GM/KlawHRpY0IDttz5W5Y60PZ02J6aaeyN1+cZ85OlsJVmoZ5x2umIslpLLRZYQB3vaJxRe5oJOysduI6hqibutcKM+Zs/nVYlCuj5P1cxWq50Lp69ESV5frmjMWrDCvrqPi7zRi+MG9/DHezNwQZ466OPGpUmU5lv/MhJrVQvSuBaCITKfCg7QVcLgpu8zHNVSRsxvd7+4ldX8u+si2+hUUU2A50oAUb8cxxdDlws7e4YnPDi2Qmm0qg62Scd46uWnrpEYf9bnFjloQi/tavDpyUKdoNwISHmmmkagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jx1vK732d+76aGqW4vphTAvyEt73F2t2JoYDOYy07aY=;
 b=lL/jmVqBs8+i1jo39vASwBCNex6KEZqE+h36SLWSz83wIG+UhV0/zuGUwtEOUeY37JydtI++8Q5zX02LtUOrErCZcfR2U6Z2f/3VqTGJXKtuLyB/ZGjqj5Z/U77Gko531J3dhTRwxsuENNr6HdJLYBJdLZbUF+PcuDXGZskgE7HPkysHAzySQ4BHUQwctYkckuAq6WuEUgBsz2vh7RS2pj0JwTwhKhISD/PTaZpva1tsFbfaGE2z+WUguh4Pa/I3hwF/MTMzzA4Tw+8ANT0xC7ipijoe6/mUXTIzFVPu62iZKWAbQ1VtbIsLOSCH/ekA33NB/9ffFwGOpfX+F308SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:58 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:58 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 13/14] net: enetc: add VLAN filtering support for i.MX95 ENETC PF
Date: Mon, 28 Apr 2025 18:56:56 +0800
Message-Id: <20250428105657.3283130-14-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c8063d-28ad-45db-907e-08dd86463080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CdvE/iwZeBBy66eYDscEfEy0pYfetFAomWHowDgeMj+auIJLlXTNhkJUfDxR?=
 =?us-ascii?Q?NaCMFviTvnnKNf7qSSfuCdUsGgNWYwXRht9YuyCtqyDdQneQTqkUU+9g0ob2?=
 =?us-ascii?Q?c2XyxDJc8Ke2tKGBS/FN/K/EOv/DeAQFOazdw0OGgXv8L/4n6+sfgNSwkLde?=
 =?us-ascii?Q?LrfNLkKRUufrswk+UCtfgjTQDzEPUpykQ3V9e4/aOA5xKwudmcU/M38Loz1q?=
 =?us-ascii?Q?5ad+0Zgb7RKztQLSgxjJ6BUezW1UQET31JESizxZfTuELvuiG+CxIF9H0Hts?=
 =?us-ascii?Q?Tdqz3BZIjURoEVANuXBI8WL6IOCaQpNhh/fzBYO9PnlfILZxJJAymJjcxy+h?=
 =?us-ascii?Q?qAROb/gx1rYlUMniUVpI7zKRLFMH51NuBcEkezhutPu5uYt6pIe6+xDHtCVR?=
 =?us-ascii?Q?ftaGjbJ10ocRqK9V/cOV4LCTlIVGqpeWFpQ3isujzZoKdW+TuYjEd+/vPJpt?=
 =?us-ascii?Q?M8I4JIIRqyaY6UmV4+VG3a+hMx4cBOxuGhXuev04kjT1UigMDVd9sduWfVoi?=
 =?us-ascii?Q?1lO3aFY2tbfWOigBu9OBIam8z+5+nl0/LZ2XLEhwQFY4a2uts/BgI+KrsitE?=
 =?us-ascii?Q?UgytZE9JSfAOADOwT7TWJfN4ardsqnR3paCNPasKuhT0fb9+VgxhFpSIyJiC?=
 =?us-ascii?Q?SMGKU47xGzKpWLq2QNeq45w9U5rKg0FgzysAxcLW8ckG4/GrAzp0b8rzDqFv?=
 =?us-ascii?Q?nNS3sjZI/tNcBsN1xCy2tg/dcUyQLxK9KQ1aqjLle5ANszqRdFh2SHi+ujtX?=
 =?us-ascii?Q?M2h3RktC+ysTyJz82PEWivOUtxbBTpufgeuUphQYQUXtML1ZVzU2QkXdHJE+?=
 =?us-ascii?Q?LRCtLHq3kWhjIR8l2VTQo10drYZ4SgX3lROdCS3/8d4N11XCnXsZRLgnyncs?=
 =?us-ascii?Q?gn2PAt9oS3KF8IoovtVAtKtdXimbAuQPLSYaFT0VrVNapEkNbh1+XazqtaZP?=
 =?us-ascii?Q?26qfK9+EJNCl9sYg932fiWvtbXhjujX241LAxvcoy5/9A2Pcgl+6bCKz8Ukc?=
 =?us-ascii?Q?YR+6wLWSlx08Y5u5iWmJfaamYwohXHFsbjNWM6DTdFJ8Al+StllYBtV18/wN?=
 =?us-ascii?Q?/ddotXSW2Gkt8XLrXLcJHsViIXBYXR+XIkY72Rxu+PPS5E8s+mYhlilFy2Mg?=
 =?us-ascii?Q?/mhyz5cq/5TtiVYQPiNwcdLqgtuNfvuCq7fAqFEJ/2JbkNQswCRNCZYzemfM?=
 =?us-ascii?Q?5OlUrij82hOgXIlMQgFn8fJ15pBitseUu9aBjo0VNBFJsDLluCITkmpDBEh1?=
 =?us-ascii?Q?DgF1Ot1ILxZZQeRGYwRcwAF80FpHNc0qRDJstLyTwp4iYqS3RrdNzT8EOQ0P?=
 =?us-ascii?Q?BEKfxs2D8Y04ECui9NRgv1FyE52N0zUNCrGjhhQG6wNsp01sU7Uxgu3r547M?=
 =?us-ascii?Q?PzhO+xsGjgsfSl3+FxRvNuwdbW839+OobVirAKh4hCDidhFTA56T20iMcwZm?=
 =?us-ascii?Q?qTrGdbI1whP5Gt91Z+NsSVbTTrhaRmdOsOIoFh5O4f2dweOs9aS2iQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q04eBs+haYoNMVbVSXALDPKhLPvYN2SZpH9mB4fKKGunGN003e38s6G6//du?=
 =?us-ascii?Q?+UCsJN/lx05RIb0CtCm8l3fkJrMWTGqPRGcv+I7BzXaP/fcFLUvtqdDyFi1r?=
 =?us-ascii?Q?+3nRShbPRpH8IG6zTy89sN18yn6niblJhvkeqeIbr3X28x2C4eBVtI5FxnIi?=
 =?us-ascii?Q?74WjVFDQ+L4WUnY1vF0Ruvr9zOJ/J6HNHaFrJy3b2eKOiRF7T0pVtlwBW8vf?=
 =?us-ascii?Q?WbMAeGtShY2QvLhptIch1iwYccO8zv5LW/TD+DKWfYb3r95RfOVleSEfmiCI?=
 =?us-ascii?Q?14URKg8BuI/83w33LwzJ3SiStoemD/4dNAOzcfmrXbX1yCJ4LZO/5OdU4YlK?=
 =?us-ascii?Q?Lpef+uadWLjXE7rLnuH16tL8jyQDnp5gO1oCXk06HHc8C2msO3tlGs22H3Bk?=
 =?us-ascii?Q?0DPvlVGVKRrfQq1ONQ1pxtHWF9O6/wdWjgIS371bq2i5wRCLewiyKxgA8JJJ?=
 =?us-ascii?Q?/7184YaN4jQwhgcR2HMUCuCAV7VLafbbf1jvoxeocIg92TyhpxuL9/jbcFuT?=
 =?us-ascii?Q?Bs69towtn4DS2jSEpXlnGAUzIE0b06ZXhFM5g1oaS1E3XrEOcCG3OOIGikoI?=
 =?us-ascii?Q?BZxLOBk4gOcHFmBzgQShYJFPsPFbsolGNQH08SdDhkYMfK0U+u5p0fDAqpN7?=
 =?us-ascii?Q?qSIrLRb/w/V4zySknn+i+R92QG41A4UC6ekbds8lDWfD7opOIU7PbCPuP70Q?=
 =?us-ascii?Q?ZdRzUKVvuy7HtrGgXTI8skxISKtXVps2gK/+Q10f04FtOl8sAFCfKcu1O2wZ?=
 =?us-ascii?Q?adyUGsGR8eYF/Npt1CuOarZMSmg+V8oh8ziGHefHBfq3p1wu0sHMo6xZdb0J?=
 =?us-ascii?Q?vplUKbpSwsqDGFXFKPOv/juq539x8HysIhlDzDANEcIv9h865P9Ndo61eAnF?=
 =?us-ascii?Q?fczjRBaMAdD6jkctLs9UpPTM1ENWqomtpEi0JIhhiL9wAlmFK78rVjU2Lff/?=
 =?us-ascii?Q?KKFK+YxtWDa4bs3yxeGiYuEuLooAVMsYNc7GHQGZBXujLr3vf2AOQPzJ8Rg3?=
 =?us-ascii?Q?uk7GZ0il48EPAcZlQpY190UqybS6qxFaLT6PmjQ95oCSPjzvhI6OGz7dulqX?=
 =?us-ascii?Q?AMkCcG/gaj7YKLi0LPYa5aU8Tdit3SDIYaA/fCZGCttSImmo7FETmQ/IPYW7?=
 =?us-ascii?Q?3i9Qrj2MhQJ4pXj9dfeKWkRRYIDMj6pVCKTc6G7Ua9ovrOSiGjDYEc3JtkCT?=
 =?us-ascii?Q?3hUP1u6kLqBsV+7irRcCErtrnXiqOq8xmd5pSMwGCtLXVTBUe+6m9LTXyhST?=
 =?us-ascii?Q?dE2veiPcLQdc1x/Vvd0zyBx6gQN6U8eIqviky+z+OqGWwQu0E+W88GD6o3j/?=
 =?us-ascii?Q?Q7EvxRibpNnOQZGbQnVAIOyv0jTDG+kYMUBqYSB106Htw8mZs4p9XKvTuBRR?=
 =?us-ascii?Q?nyMgrnER8g8pd3oB8KGmSnhC1VyNQO5g2BjHu6GzKupVbivA4D4xeS++GQUw?=
 =?us-ascii?Q?LtZ+atrWFO1YtBmeu8MxYcHdWf0w63Nmt/TABxYUYZbQNEqh7PCQTe+0LhPZ?=
 =?us-ascii?Q?1ZnsRPT/XHn90y+H6bNY9R0OyDVOMygemhPSwwpBvkRNrdvkYFeMyOErmTza?=
 =?us-ascii?Q?h9Mel8OizIZP1ZmQnOIlJmP0HKV9kFJ1WEXd2JGi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c8063d-28ad-45db-907e-08dd86463080
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:57.9320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0POU4HyP/EIrERH3ckeIWc5u/hsBmsIHHeB78k3G2RcI+TlleZAA3I0+t+WnZ1wlOVbKfHaoIaFiIf8fQha7Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_041701_764702_C3DD373F 
X-CRM114-Status: GOOD (  16.34  )
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

Since the offsets of the VLAN hash filter registers of ENETC v4 are
different from ENETC v1. Therefore, enetc_set_si_vlan_ht_filter() is
added to set the correct VLAN hash filter based on the SI ID and ENETC
revision, so that ENETC v4 PF driver can reuse enetc_vlan_rx_add_vid()
and enetc_vlan_rx_del_vid(). In addition, the VLAN promiscuous mode will
be enabled if VLAN filtering is disabled, which means that PF qualifies
for reception of all VLAN tags.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes
1. Remove set_si_vlan_hash_filter() hook
2. Refator enetc_set_vlan_ht_filter() and rename it to
enetc_set_si_vlan_ht_filter()
v6: no changes
---
 .../net/ethernet/freescale/enetc/enetc4_hw.h  |  4 +++
 .../net/ethernet/freescale/enetc/enetc4_pf.c  | 12 +++++++++
 .../freescale/enetc/enetc_pf_common.c         | 25 +++++++++++++------
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
index 826359004850..aa25b445d301 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
@@ -107,6 +107,10 @@
 #define ENETC4_PSIMMHFR0(a)		((a) * 0x80 + 0x2058)
 #define ENETC4_PSIMMHFR1(a)		((a) * 0x80 + 0x205c)
 
+/* Port station interface a VLAN hash filter register 0/1 */
+#define ENETC4_PSIVHFR0(a)		((a) * 0x80 + 0x2060)
+#define ENETC4_PSIVHFR1(a)		((a) * 0x80 + 0x2064)
+
 #define ENETC4_PMCAPR			0x4004
 #define  PMCAPR_HD			BIT(8)
 #define  PMCAPR_FP			GENMASK(10, 9)
diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index 2d890f7bcc95..1f6500f12bbb 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -526,6 +526,16 @@ static void enetc4_pf_set_rx_mode(struct net_device *ndev)
 static int enetc4_pf_set_features(struct net_device *ndev,
 				  netdev_features_t features)
 {
+	netdev_features_t changed = ndev->features ^ features;
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+
+	if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
+		bool promisc_en = !(features & NETIF_F_HW_VLAN_CTAG_FILTER);
+
+		enetc4_pf_set_si_vlan_promisc(hw, 0, promisc_en);
+	}
+
 	enetc_set_features(ndev, features);
 
 	return 0;
@@ -539,6 +549,8 @@ static const struct net_device_ops enetc4_ndev_ops = {
 	.ndo_set_mac_address	= enetc_pf_set_mac_addr,
 	.ndo_set_rx_mode	= enetc4_pf_set_rx_mode,
 	.ndo_set_features	= enetc4_pf_set_features,
+	.ndo_vlan_rx_add_vid	= enetc_vlan_rx_add_vid,
+	.ndo_vlan_rx_kill_vid	= enetc_vlan_rx_del_vid,
 };
 
 static struct phylink_pcs *
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index ed8afd174c9e..8c563e552021 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -135,7 +135,7 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
-		ndev->hw_features &= ~(NETIF_F_HW_VLAN_CTAG_FILTER | NETIF_F_LOOPBACK);
+		ndev->hw_features &= ~NETIF_F_LOOPBACK;
 		goto end;
 	}
 
@@ -376,11 +376,22 @@ static void enetc_refresh_vlan_ht_filter(struct enetc_pf *pf)
 	}
 }
 
-static void enetc_set_vlan_ht_filter(struct enetc_hw *hw, int si_idx,
-				     unsigned long hash)
+static void enetc_set_si_vlan_ht_filter(struct enetc_si *si,
+					int si_id, u64 hash)
 {
-	enetc_port_wr(hw, ENETC_PSIVHFR0(si_idx), lower_32_bits(hash));
-	enetc_port_wr(hw, ENETC_PSIVHFR1(si_idx), upper_32_bits(hash));
+	struct enetc_hw *hw = &si->hw;
+	int high_reg_off, low_reg_off;
+
+	if (is_enetc_rev1(si)) {
+		low_reg_off = ENETC_PSIVHFR0(si_id);
+		high_reg_off = ENETC_PSIVHFR1(si_id);
+	} else {
+		low_reg_off = ENETC4_PSIVHFR0(si_id);
+		high_reg_off = ENETC4_PSIVHFR1(si_id);
+	}
+
+	enetc_port_wr(hw, low_reg_off, lower_32_bits(hash));
+	enetc_port_wr(hw, high_reg_off, upper_32_bits(hash));
 }
 
 int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
@@ -393,7 +404,7 @@ int enetc_vlan_rx_add_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	idx = enetc_vid_hash_idx(vid);
 	if (!__test_and_set_bit(idx, pf->vlan_ht_filter))
-		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+		enetc_set_si_vlan_ht_filter(pf->si, 0, *pf->vlan_ht_filter);
 
 	return 0;
 }
@@ -406,7 +417,7 @@ int enetc_vlan_rx_del_vid(struct net_device *ndev, __be16 prot, u16 vid)
 
 	if (__test_and_clear_bit(vid, pf->active_vlans)) {
 		enetc_refresh_vlan_ht_filter(pf);
-		enetc_set_vlan_ht_filter(&pf->si->hw, 0, *pf->vlan_ht_filter);
+		enetc_set_si_vlan_ht_filter(pf->si, 0, *pf->vlan_ht_filter);
 	}
 
 	return 0;
-- 
2.34.1


