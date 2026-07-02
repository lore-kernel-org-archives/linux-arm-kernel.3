Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950D0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 03:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9teLbrzqZgnzsuJ+WpluOJhgvnQS3Ittbs/uIhjx02o=; b=fotolvPIqV0AH3ysdixXgaz2Ip
	mxrUIsMIZ6ntDliq8NvMOJk7+nwYKwTk0CzsdJpXqkaaHVnG4i5lqmXZbCAIc/tAAXY4F9EvuCtiJ
	70ckLznRliI1WtiALsj3ywMkd0OQhWMR41/NVfSxlb03QzB9T1fLi6XJgxqFF4m2xfeYhxTME1k2G
	JoP8KtAZShN9GrpWnN0JHIznfZgJ7mB/VGD/wNToUe5CXMFcd8x0ae8Xq2or6fhyna9ITmE9n3EuR
	w8v1S2YWv6valCuw7dSp30j4avdMa6B4SCjKXDSeHV15xN6nc5otdCZHjppqX3s5yIV6A/nYz34M0
	7vCI/b7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf849-00000003U9o-12fe;
	Thu, 02 Jul 2026 03:26:17 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf847-00000003U6V-2NiU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 03:26:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENrfReRNkzNXPHq5xh+w0muOhFmbzsVU5y9+37nnq7lXSmNAovYWi1ON6KmlzkpOQAFMzdxQ41CJatEAG3/lUYmpamTJDvIbl79YgW9kOzicsuzZTXRYMt4qLyncvhsJIuz8EIOj4n0jrgJM1OLZgoY4BwAwKZyA3GhBrWnkYTCgjYG4vnkn7Ep68qk6g1VmCRlXYtyZVTJUQmY4Ktgn+vmrfDFHbpL+7DnqO7hlCl9zwDcBR3xQOD8lxnyD18t2cYuH4iJSyeIXinMt+CoVtI1bRh0rdy4fsU5wOwdWCQVg5ZE83jRHXaePH9HUxe45UfwzUN5XikGwAgExbBP69A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9teLbrzqZgnzsuJ+WpluOJhgvnQS3Ittbs/uIhjx02o=;
 b=iH0qmWcAVKF6NCaaYgRaF3PlUYjr6OOgp7oOPgqH5JuldvNuzsZP6rRjeUTSsR/88+8gA/0EF5waj+chomKG9v22+SiY0NGWaWx1tzK32HAhmpK4q45fRDtex3y1k/wFhl28W/V1DnZHPQfayyJJW1cgtg9BPsRxaQammdCFMpjL+AITx3kExy7DCdNRKnkLhYQv0UVs1nHnoGaYp29esxfqbVuS38um/A0VNZDSlLxoOblIQC3eVaOZ+A38zHgh8R7NWJ81mAjbxBwGtRN+ABvbscy2eRurOzwryHsPulCnFKfNQSRCigVACB2gs9SX0uGeDmItTMz4cGO4cyPbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9teLbrzqZgnzsuJ+WpluOJhgvnQS3Ittbs/uIhjx02o=;
 b=Smvw8RqIsl5X3VJSkIuSml5o3xHBTmtAXgcs3lsZ+gY7vUOUAkjV88p8463JBEvdvIKGcf5zKvKv5Oj+4+ScGMSVq5srq3bjbl2yJrYU9XGlq4tcUqhtT//U+rb5O6OvJPEtXF8rir46P9F6H3JhS0Im6R3pb21DRO8mD/EYSynECiyKdRW/kfDfx0lJnXJqoIl2qgTQAQQA4jPNcj1tz7gjVVDYAM4vhievvEpzw1/PRQfSOCu+kX/dbUQO2fahFmvk1X9n86QfwIibd4wRLFfOL78+oP27zK2j71XnlllNQihnlyfxgHFEyJxb7ASIaNA8zu1t1pEC7LE24vQ9UQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by GVXPR04MB10248.eurprd04.prod.outlook.com (2603:10a6:150:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 03:26:12 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%3]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 03:26:12 +0000
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
	chleroy@kernel.org
Cc: imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 net-next 09/14] net: enetc: remove enetc4_set_default_si_vlan_promisc()
Date: Thu,  2 Jul 2026 10:57:09 +0800
Message-Id: <20260702025714.456233-10-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260702025714.456233-1-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::6) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|GVXPR04MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 98422596-3561-4d9b-3131-08ded7e9aa9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|7416014|376014|1800799024|366016|921020|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TUgML9QnbdfbzJsS2s+y/7nJikulYgWcCcU0XdAqWWbjrDpz/tMjUs7Kc06BHbQKv9t2VM54urrp9aKMb+jsZ3GICioQUz7Y/DjKiy2pUlQmUq0JSajzKvHtsKkCz8t/PAoIJhIbeN9Q0dR33H8gw4MjSORjvNW8vW7dDy/4Xg/9xIcFz5O6jXyJN92K83PpPUx7BCOyVSGncQmOPdIN38Z8et8gTm5fZnpwCbVJsGwVlWdI1HmmgsQ61IDi2wUTFmOp+2MudXCxzZHco9xyWWQSxIQu2y3eJNEAgE7bVQBuxFeI2U/TALy51BfALp6PXnoNZVR0bJs3tHTkOGn49rYNwEj8HqA8ypc6mysoVQG9wpB4fZBP8mJwuIb5vVJui+2qI1Tw5xXa99fXaQXFy3mckimUsWQfc+3e66HxO4GMmW8VHjdRZRD3fsuZ6PEzVPJI8w61CD2sXkS8a6F8gwWjenRC8AZqxEZ6jnGTxqZMFv8pPh4dCRPUw76EiTbfSsZWkrvJL5I4HYLVYAQHoc225kX0+0XSg+qcLLkxtqmXJdKABzI2IUzlFsRTREsZQCB3+DqmnbWXOWXSCOBeRYnwjcthNkWhDwBcilBiOR3/EJZGHX5xpKCyOIbV7cNvou0EolzYuwqXeGbNv0EK7NwtsBoAJd2HbEuWHKJLIVmCdgCyU+6+EIlcTw1HUeEsAPxCOgga1sBcPnm1qIy42w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(376014)(1800799024)(366016)(921020)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sTASpfd+x8uUFgL6CVHAUKiCfo/aqEV3wEsH3NKyL2psV9GvROhNCiGgjzw8?=
 =?us-ascii?Q?pAtqFd7KhX5iQJ5W/Nn8CGwT7gcaDBbASBQYIUXC6DLgUHVEZ5tn7LTO7rpY?=
 =?us-ascii?Q?X9GZLNNZlzM5n9pUQKHObDxnwKrS6RCkTBA9yoqT1eEJU3YzyiDgpgshm4W5?=
 =?us-ascii?Q?EcbBovZjqgNTEAs4vH5WHWPccmQTybJ8f88Hr200R2G5Phd+g1MMaqHSnDLh?=
 =?us-ascii?Q?24xzk1rAf4rY4bpu3MXgsdHZclyons5l9KgS07GkMZm45fVFqdGItw8KHQrR?=
 =?us-ascii?Q?oyTd71mfmLEoBqcC7vrfJXw2MJLFvb/D6BbB0R54iL4xcfWK5NwnBsjBNuIC?=
 =?us-ascii?Q?Z6Du3iYxwm3GAeGBHQWW7tp48gv+XlAlTPgSraI50TojY+A4ajHEdaeuFVyB?=
 =?us-ascii?Q?AY6pTCvVDrXufVKy+kf23fqC2b38XKse3Y+HfMzRqQb4g4ovnUdPftIiSnxo?=
 =?us-ascii?Q?LjwV9mZy7ZJNs29xUKwtY1ivcT2H8VDzPe+cIKCJW7qChqGGG+dypEYfTV3+?=
 =?us-ascii?Q?H5Eke6GpL8smLd1aUJV9HkTODC8MP2i4kxaNTws3RPgjJ4S88Wu+gA1f/QUZ?=
 =?us-ascii?Q?yrLzg//npMMdjYnu1te2M1uTHY8VQrp1OMvwBN9i0Tiit79fABX3ziz3rcRe?=
 =?us-ascii?Q?BHbhXQslDjlXsdWQTN47rSFZoL0O5vXOPcpprzvugdFQ90DZC9yI5fb23iYR?=
 =?us-ascii?Q?PTAK7X22jOqY1bUKlyLCfoqahXG74s/mYZApKi7ssYDSt4FDqrzC6mdB/ejf?=
 =?us-ascii?Q?/zVIAvSINO4wasXmRGddQsQEPTQlsVewC7jXY17xQwc/3/ajDrUg3GoZBgr6?=
 =?us-ascii?Q?1MflDEzBERMv610IQ4US49WdtoIUOJhaFu5w1SD5X5o4PrmE8HwRZYh7kBqG?=
 =?us-ascii?Q?x37A4QpDM2+AbNNk2IeySUc13Le8JkN9oob4hAevPsr1yFmbXcBSdnMBPZd5?=
 =?us-ascii?Q?kNLHNiSnkWove0FKdT0AMgeXuTjXL16qJrlVAsdLyWeNbUQ6Q2WgjH1c70Rh?=
 =?us-ascii?Q?94pUsvyJisDeo9rhPi2Y60rm+D2PRO/AN64KhFDAp4vogq9ROPaTjKUNX0NN?=
 =?us-ascii?Q?afqPCwh1JGIVX8IhdnoIVvMhhqB2dj+Q0UFHZsn5Jj7SlQGXG0qS50fNbzog?=
 =?us-ascii?Q?clXZJ6k2e5sozyniyGXrsfgL+cseM9FpbPW5Ak2iyg707j+thfTj3pCn2kDy?=
 =?us-ascii?Q?7/I52a+uNypkiGeabX9WkObP3xeDgGTHLZnwtr9CKKRGWPxcubPtNuQJP+M5?=
 =?us-ascii?Q?k4wlYg1S+k5w/2tipHEq1jiFg3IdGDIFBwGv/SoEMXSTQaZFMIMedLK3c/9E?=
 =?us-ascii?Q?buk/wZZSlsQHHz/nwBlat9EZkJO1LAC/fcyzgH1ncS84zakvERkd8kTVTbsH?=
 =?us-ascii?Q?tKqCd5p2g2jRV3DqC9qdB/VDoVeMagpWHMBdKrNS0bIQeePEq5TKIrZv1vlZ?=
 =?us-ascii?Q?+H+PhaB9uWY5lkO6sUHPrBJKF3Lgk20MzOcZPObNcpT5ZeC7tR9YaY1EVyIV?=
 =?us-ascii?Q?PU4iGphJ6sBIaRc8B6eQfAqMQQSOxvEBYMLLTAsjnzWC2+yWng9O9RvBjbma?=
 =?us-ascii?Q?qVNiaiky+hyGL4jbzBVycAhzBdmf92aQBTZ2yh7eOWDSdY8N/j1qAEIaiVyE?=
 =?us-ascii?Q?QcKdecXsNtVTHmjtlFHG+FCTWYv+8M6w7xjNF9INukPMg5Babpoj/Y/s+Gpe?=
 =?us-ascii?Q?fLqiG2KjRaNyQC41oGZOLBPmPynhDwrL1CFxfEaFextzxWjoZ42UWWfnXSx2?=
 =?us-ascii?Q?WBE+WLFIxdSJ3bna+Iz+2v3kttiqn6kY8sugoTM1kPu8hIg92dNt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98422596-3561-4d9b-3131-08ded7e9aa9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 03:26:12.4406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNOqyEdRTOzvhMX77CWU4d7SlenSnNo6Ewq12UZrFak/CFVt+DT7hBqfz8efDkeJjNelDEnYcFFDmJgG7S1SHVt8b9p6bwXNsJD0DYARPtdzvGF8yf7rt6py/J9bNNUW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_202615_619813_4774042F 
X-CRM114-Status: GOOD (  10.68  )
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

PF performs PCI FLR during driver probe, which resets the PSIPVMR
register to its default state where VLAN promiscuous mode is enabled
for all SIs.

The explicit call to enetc4_set_default_si_vlan_promisc() in probe
is therefore redundant. Remove it.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/ethernet/freescale/enetc/enetc4_pf.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
index a77ef62672c7..88ad99cecc9c 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
@@ -310,17 +310,6 @@ static void enetc4_pf_set_si_vlan_promisc(struct enetc_hw *hw, int si, bool en)
 	enetc_port_wr(hw, ENETC4_PSIPVMR, val);
 }
 
-static void enetc4_set_default_si_vlan_promisc(struct enetc_pf *pf)
-{
-	struct enetc_hw *hw = &pf->si->hw;
-	int num_si = pf->caps.num_vsi + 1;
-	int i;
-
-	/* enforce VLAN promiscuous mode for all SIs */
-	for (i = 0; i < num_si; i++)
-		enetc4_pf_set_si_vlan_promisc(hw, i, true);
-}
-
 /* Allocate the number of MSI-X vectors for per SI. */
 static void enetc4_set_si_msix_num(struct enetc_pf *pf)
 {
@@ -364,8 +353,6 @@ static void enetc4_configure_port_si(struct enetc_pf *pf)
 	/* Outer VLAN tag will be used for VLAN filtering */
 	enetc_port_wr(hw, ENETC4_PSIVLANFMR, PSIVLANFMR_VS);
 
-	enetc4_set_default_si_vlan_promisc(pf);
-
 	/* Disable SI MAC multicast & unicast promiscuous */
 	enetc_port_wr(hw, ENETC4_PSIPMMR, 0);
 
-- 
2.34.1


