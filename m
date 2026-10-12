Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CA4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0gN/BB7FY0AEmijSPXT0P+5ziIH558yKgQ4pIyaaGY=; b=Znl32LeIhQs24XhjnyQjij06OX
	qd7BSSix2005mNJYQQkZTbimu4CZy3L+XHd0PTyanwHi8c9pqjSZS1pgcEyjD/UFn/W/r8p2sduAS
	tIPXsuqZv+pwn6I+rue/Dcpy4h4QpEGSxIjtBObIpvFeB73xmLFoN406LnYr29X8EtDtsikNCXT7a
	VCUKj+pmURD5nPjAgx3J1N0JOV6/6dZ7ZG0iM1M6lG21z4UrYKbZGfwYPXV7NCbNI1uSp06SNtnRm
	VKDyBk5PbpHppxu4kxfb//crjXv8HamzeuPfVkU3Sw5VMDRxGV9KYRjix8Jg6OOTJ4ySDrWkPdMM9
	HDy2pAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCl2-0000000A83H-3OBi;
	Mon, 12 Oct 2026 09:55:48 +0000
Received: from mail-westeuropeazon11010017.outbound.protection.outlook.com ([52.101.69.17] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCky-0000000A7q3-2MaD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:55:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTNYmJR+aB+KiC6NaRiCC6iMSbEj/2B/jdfHHUWZQOfYiBx+Nr1jhVdGW9eKn2TFKJAfu3rV+kgKpqND9G6DtIUmDgNYh+rVv0zzawzcougoxl6YdHUzvCPgntrPohPz5wmit++hh4YzRD9iyNYu2NnXVMe9rB9tVzLhxhzTWEo0ob+FAkLXudaHL0NLzhd/POttgLMpNVKwZvhhF6LjpefUuXHBTnd111+8oixWkYAkrcq+3RsZQ63dn+Ef1gj/6OC0dOO5YAQxZsG3Gicyud+YvUEFp2EuGmDSWDgTEIpME0Bv1wzLpu6ixEohw1GwT9/0VIzNg3qa0O7EjM7Fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0gN/BB7FY0AEmijSPXT0P+5ziIH558yKgQ4pIyaaGY=;
 b=X2dGo31A0GEr6DKNaPwQYeYxwr/IyapMvCGSFmRlQlZe2zYIAMGEhHRNcEf6K22szOvNS08+yofsstOAgHWq/XQVFCYpRm6/kL1GbUbeu4leC8fxRRSCUejV32jxXrxZHzElY2BnWwUMql6BvOSzxWc7FYuVIkhZ0tTPVletg/lrb3asShh+/9mvERaIMYmiX4ZkwwjRErH2XCBZr394Zz0NuTiewVRmbMFH/LukJZrEJOa+OFI/zicINaJ3Tp6dUIN1Gflb4b9NzB8/yTYfL+eT/TCNRA4/NZ+i7aMdQ1ZsFyDh/5k1d27TtjR+0OW+aDkjXZybVzX31GNjLmX83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0gN/BB7FY0AEmijSPXT0P+5ziIH558yKgQ4pIyaaGY=;
 b=LuO2EBVqrrBWuGPn+FvcMeduSenPaP1H2CszCSDChY5tTLR++wOGL9JJkmiaDTSZwCD9euYOrarT3pa4/d6PC00zvDFWEjrwoZKM04L1Pl/HTVov2e9SzT0ks/++Jhcy1evF/9fCHMxC7KB+8sbMHcwmiYVZNnCZ3Tz6ocLMqNXNsoIW2aqLwjLn6HYYRTy6R1u39iJPrjBVSS/rHdj5D/U5XVTUwmffZAgjDMRtd1syjzM9VUAKS0MgjkHwCQPnVGkpnBzjIEtGuXRT0FYP9EnLT2eaUsuZlvFGLspamkvkefddqMk6l3Y4egbJjItCOXOrgSj9xyTegPxTf+RxSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by VE1PR04MB7248.eurprd04.prod.outlook.com (2603:10a6:800:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 09:55:38 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0496.018; Mon, 12 Oct 2026
 09:55:38 +0000
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
	richardcochran@gmail.com,
	linusw@kernel.org
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 net-next 7/9] net: dsa: netc: enable ingress port filtering lookup by default
Date: Mon, 12 Oct 2026 17:59:22 +0800
Message-Id: <20261012095924.1129312-8-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
References: <20261012095924.1129312-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0336.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::14) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|VE1PR04MB7248:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb29c70-a028-44dd-18bb-08df2846f80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|7416014|10067099003|3023799007|261009223027099003|921020|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: H/5cLzryN5R+esHWbOYk7aLYLbVQZbzu1JGyh5VbzisXLribInnvgHIFIKR4gcWJdsu6wzNwOF25i3psBGSHULATYq4x7mfK+IaZvXJRExTNARsyxr/WvdSwg3heX0LUD/sFTx7JQAaFFT4oK9aEeq6UkQA1tVY0hqIZUtBvfC1tcN3Mi7nC/6V3KmTJ5GzdRLB/oMqtXSD5YuOi23mgbEu87Fk+YvvWoMvCebJKUZUqZpBWUbwitUTo4YLeAqkSIHVeuuKdpw/AhQ8ZXSaCUoBToPT5z/QsAm73kuyXR4DjHGaPrvCPmO1bP+fLLMzPcEGkbN0oN/F1xLdpAEostVhelfclJSOAG28pmFf5h8tqT6B8RydJaARWwkTj8joI/uuwu8IaI5qt+j4YzxowOHI3NfriHq+vZ/1E2NnfulEzBkq5Q9RFizHX86dOUh2UP5ccVYcChTuUTNOdSYYiSBYQZqiZq8WsDaUjD/QcmvdqMzsrKcnMDR0OojQGXAEBkYl2EBPDICm0R1bljn6yYscpFcRWln/uvbD2j9J5K2tQOJ09d9/Zb9ynwwbhnGCoQSX8aSnw0WUi4ZMakpobIbB3499JnFSTPLMO92rw/pekY+/fFiVGgSfRnJDfyNwiQS7rQydcs+FAJxp0LNwmhRfdP12a6DOd3R+bU3Qx0lFIVdh/NPHAMCIdHUxkDuXEMK8wUQjVjmUwtu6sxrfp9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(7416014)(10067099003)(3023799007)(261009223027099003)(921020)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+G6NTx2NGXrnSNfJFl8p9tHtCgicYHAz7wOnEKYGFcjHp4l3ToAl6Kd77m9s?=
 =?us-ascii?Q?Wm3NNY/szXc6pDE09Yxl7elD+DmmM3U76IYcKK3BlCXtZ2Sid5XR2IsCB9/8?=
 =?us-ascii?Q?5pgJ8Ji8FgJOS/b0nl+wHN1m/8tml/u+AC+WbdafLeZg+jDMRqaUcIITjLZN?=
 =?us-ascii?Q?JlzcMByVucVsYxLfG1G7Yh29Qb0xjiXPByede9pyIdwAlbVNLNdN1vpQiSMh?=
 =?us-ascii?Q?q1wKL4Dwp8EcoOx1W9cF3xN4apoSOuFF5j7xiLSqat5U4dVA0f3XcBUAKQUN?=
 =?us-ascii?Q?bCS0L9I/EQiI2EYxnYE40v4rQpcLofnkT8U0SNPwKVlGmIxsOT7kjpHeng1v?=
 =?us-ascii?Q?+pxhQ9uqSqTaf1nBJ6nQPmBRIf0KwsDVLmi2AwP1d9vTh4UYjIF819k1ybsk?=
 =?us-ascii?Q?s4AerkXiE9AidTR9wYFmn+PxszHVL9P6LxqUUgPSSHgJNDhfCW+TWBxRcVXv?=
 =?us-ascii?Q?1NlPRV8JjhGrgQBSruOFSbtTa7H1AGAuhFFwdGhyFDTI123n8KtdbnU9eZiV?=
 =?us-ascii?Q?U9ko3MsfGhhRrG97zJay/TPvLHPP+VjvW8FTzaViur9XY6nSBwLdRH7ClROq?=
 =?us-ascii?Q?BMsQUDrLU0KZWNdkr01oWkyOy6Y288FvHXhQMwsNJpNASGRPWuAbvvSvd5dI?=
 =?us-ascii?Q?VD/AojCaKQg4OSNT8fDg68W/mhI1xa+erAJKCa78LeecyHfwzpJvMAmmztHI?=
 =?us-ascii?Q?pEaL6d5qyuDao99DAfMmPMQOSzoaVKrcIAU3AjmDdxJuxBBvbtlTvU5aHzyg?=
 =?us-ascii?Q?WV6HvjrtkP+D4o4B2xVzO3gS1+sNufXWB7O2iah0hz+khuZxI1PFwFxa8BMm?=
 =?us-ascii?Q?PYuY6NIDADr0cPVQ/NkrYICcdzJFrBaSQkQEUB36iwptZndWXhWaQYEqwXtd?=
 =?us-ascii?Q?gRj10VqP++sM49UxZ0lhy3m44AY+Xmnh0UIn+PnhqaH7DyFHVfmHBWwCfUAr?=
 =?us-ascii?Q?hZCHLndBCwlHkGCBzIn2eL9mkDeRGP0cmQUAwWrGATfFUIPuE6f9AUm7Xd74?=
 =?us-ascii?Q?94biFEiTCDMK/t6EZaJ+dh1xXSyxGHqbEuXIqGekifg8fHUlL49e6qkPFsch?=
 =?us-ascii?Q?G0yAehSALn9hlWv3hp174tJu7RkQsf6qB8OlToNQAr+93p1+0SJGvmZr4rbg?=
 =?us-ascii?Q?m6dd3GegE5P7xzNp/z4Hm3Ap4McS3vImjsA/5xLllID/rBlLBvMXwlOPCLke?=
 =?us-ascii?Q?wDQfWVhQ6SEZyxWGMQDytb8Is3wawPGsmAfZTOcnDISrGwlLVC9hf/5nA/xo?=
 =?us-ascii?Q?ea3+qALBnsS1LuEYWmY+sMXhBdC/WqokdwnnuA+qPsnsoj8kKqIKikRlRfc5?=
 =?us-ascii?Q?j+tVD0Z8hCx+tJZQKEXEpbuBjvNES41aQd8QlKnro1ioEyJTmLPWd2QQvEs0?=
 =?us-ascii?Q?uKA7HdasSiXlX7YuBxb9FbrW3M0zlS9YF63+2oDGgF8vIoBmkqTaqAtRFFw5?=
 =?us-ascii?Q?tiBUVeX15Pmr3GmhBi6A5TVEXuKRQxbLa1LCgDyAOBosAdRbrVob89H8O4cU?=
 =?us-ascii?Q?9/KNlBuLOvAsRHogCWo0LguCVM2OedQPxJYq/nVyNaonqKdqtD9DzuTbUF6X?=
 =?us-ascii?Q?uX4gug/H8SkKzyz0jn3MWmu/C41ulb9VgY5ox1u49AyJUPmr1m+2WE0mimcZ?=
 =?us-ascii?Q?2pxnx57G9X4kbAcThghI4PZXLgTT+wxHshNEExlo4MyxbL70bs64hF823L0Z?=
 =?us-ascii?Q?f1bAdbDTFqBLGBkqTU2eK8emp6IsE2kaKPe3V98YYGDBPWb/VgITzFg5ZfIY?=
 =?us-ascii?Q?5ImvPPginL1KdxVawagPK9eWmnFCPfD6d+d6PJLSE5tqX7LxUaBg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb29c70-a028-44dd-18bb-08df2846f80b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:55:38.5500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfrCgOhEe8uuac8nv4RxGu8Cnp68w80/o+W+obuMVJbMNIHcrWlR07Z9jFUNN1/TKBLxe6Hkl34sPFOsmy3lcXWz8HKcERRs4d6L6MNkUTVglAa9dAMg+Lnj5g2Ruuzn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7248
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_025544_644844_B8AAEE1B 
X-CRM114-Status: GOOD (  14.34  )
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
processing function.

In the future, the IPFT will be used to filter PTP frames and support tc
flower. Tracking in software whether any IPFT entry exists for a port in
order to decide whether to enable the ingress port filtering lookup would
increase code complexity unnecessarily. Since enabling the lookup when
the IPFT is empty has no effect on RX frames, enable the ingress port
filtering lookup unconditionally during driver initialization to simplify
code logic.

The only concern is that when deleting an IPFT entry fails, the hardware
will continue filtering RX frames based on that entry. However, we have
no choice. We cannot disable ingress port filter lookup because this
would deactivate other IPFT entries, which is obviously not what we want.
Moreover, deletion failures are almost impossible under normal
circumstances, and we don't need to be bothered by this minor issue.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/net/dsa/netc/netc_main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc_main.c
index 09154781df7a..1a7103fe1e34 100644
--- a/drivers/net/dsa/netc/netc_main.c
+++ b/drivers/net/dsa/netc/netc_main.c
@@ -618,6 +618,12 @@ static void netc_port_fixed_config(struct netc_port *np)
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
 
@@ -1836,8 +1842,6 @@ static int netc_port_add_host_flood_rule(struct netc_port *np,
 	np->uc = uc;
 	np->mc = mc;
 	np->ipft_hf_eid = host_flood->entry_id;
-	/* Enable ingress port filter table lookup */
-	netc_port_wr(np, NETC_PIPFCR, PIPFCR_EN);
 
 free_host_flood:
 	kfree(host_flood);
@@ -1861,7 +1865,6 @@ static int netc_port_remove_host_flood(struct netc_port *np)
 	np->ipft_hf_eid = NTMP_NULL_ENTRY_ID;
 	np->uc = false;
 	np->mc = false;
-	netc_port_wr(np, NETC_PIPFCR, 0);
 
 	return 0;
 }
-- 
2.34.1


