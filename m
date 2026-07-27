Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35117C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxO3WB+yesZpl59WOxdJoD0DVE5nFgb16wZ142JZEWY=; b=mBcSHfhI9HBU1OmcFmcGT0k2Uz
	SMG38jfTDks7Ojb6qHw3IJPcg4xnPqLmEpJRDs8Ya5eS28hijmDlmdNtKxSoKZRQWESygQwo17R0P
	qpXlL8pmS6ukCOWs6pRNrrDr545IWmQDdNK/Pzqod0BT6yT2UklWxxOQGha6K1tBEEer71yN6RXYw
	KLoe9Aa/MBPHu2aJoHvm6hOo4hCAkt29gGn9vSi59T65jUjXyDC8qFNcuF+63IYcyh3n/Ey8Owtc9
	Cwu75n6BsqEflXM/CO8shivzlHM9UoI6Cp1Qn/c8D8cjjsovEE9mR7JHm44+y5Sqdg4Yw7DN9B5ka
	bsLWJOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI3T-00000002OaE-1eRU;
	Mon, 27 Jul 2026 09:55:27 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woI3R-00000002OZi-24MK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeZ7vNekK4ARcgUoa5/n6opi2keH8/eWOHKIPbKWV9SCp6XFVa0MAkvurAHSGc6BaxXxli/UeD/rkrxfaqUi4QotDeVIIVcQBfdrq3kLX7RnmoHtq+3GSMdUk1L81ZsLdid/JoAZZWx5vWZ9yRLFxDyPC6q/2iR/MNOKn/xg3jt1agmPCExeAg7LuqOFD6hHLr7D7YdtIQ3znMAqkteacsug4APxL2qbLpWCwo0sIoIEtml8ZRuxoKvZHUDUEM05Bk2YjzdFJxXExn1AR8Tx3tIjzs1NewEGLwBgK5EpLyunlM8xe/rkhiwEWXoBpFA3v5UBBnvsuk3XZuUuse5ijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYEkoSoMzlSnS237NZxHA/xyujM7ClNKdQae16f4kwU=;
 b=PzWRp9b+6YG+crO2JtazTx4UEiV1+9emtiJ8gbtcfwui4tLQWar92EqbTM5NAK4KkdLjFuo0271GAiTTCPvTMNoOAyoDltqtEy2E+KrXRvBVOOB+THK4laGjVrVXt78B86wILsOgDw8xR2CWE4VheiMaep70Eio50iNcclh6RFSlIWGotUMIysCCmM8KHQicW/Ts4c7cjf5sVNGtlc/HpXBDzMu202nqzOSM5WVQynWM16Qwmx9mjpVSwrAc4CfcNo6GE89sQKkIQCew9WSxKghiafR/7iXZcpAZsWn4gMTdCPBmP+01cNR9dde+Ur0MEJOVISoQFYNnnSqGY+X37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYEkoSoMzlSnS237NZxHA/xyujM7ClNKdQae16f4kwU=;
 b=oVn3QZPIsdxoXQ686pYkXSiYlUV3Vo9/v2Ovfp5b+OI8DpWYVDvWOVt0eXcKuMvdl27kbRgTNpzMd1o05ufAhkE9jeBTedGOp/X+fKl4qiC9fkAP6vS0D5Zc2uYjD/gBZ0NLBo/tCVhS1LqNIv4I+DuaK70QUskaq26E2UNJqXQIdfeDEHAa3VVUTeE7V/TCG2CaoCWzxB2ijWFdFiYd5mD/dzvXglc+3yJD5T+SKVXm+JJuRVV6+J0O24S8+Jp9hEHH8fT5wRn7EwkIO/nVZpyIjyPkEL160auv3Yk6kJJDENSacFJ4ZmlVHFm7BiEbkRx7hATQ3+khjjfB+08g4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by DBBPR04MB7660.eurprd04.prod.outlook.com
 (2603:10a6:10:20f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 09:55:18 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 09:55:18 +0000
Date: Mon, 27 Jul 2026 12:55:14 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Pan Chuang <panchuang@vivo.com>, Roy Pledge <Roy.Pledge@nxp.com>, 
	"open list:FREESCALE SOC DRIVERS" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:DPAA2 DATAPATH I/O (DPIO) DRIVER" <linux-kernel@vger.kernel.org>, 
	"moderated list:FREESCALE SOC DRIVERS" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: fsl: dpio: Remove redundant dev_err()
Message-ID: <ulsxkv24z6u2eeccgpgb2ijskrxfmoaw7jf7y5m2jmgehfnbrh@k66mkm375cuk>
References: <20260723024748.30105-1-panchuang@vivo.com>
 <877f0d7a-6eb9-4305-be24-20e97bb3edcb@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877f0d7a-6eb9-4305-be24-20e97bb3edcb@kernel.org>
X-ClientProxiedBy: AS4PR09CA0009.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::12) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|DBBPR04MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc03633-b23b-4a2f-e0b5-08deebc52a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|19092799006|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 6nBSizglX3nI6/etvOg7B03TADMJ4sjruXPYQYcPtTk2MErZ9xxr+mlD21cf+kLB26duQBGCGg2GtAuNqGpRCgdXichYg9xcwXd9a5p3IGTAsT4Iitb6f/0rhEZwf0BVUp1phiAdH/IrW3jcGhdr8sTHJDCqTY9apqmnwGbJ7jgXXEEIZXCyrqLijBtue+hZSQNMonIYu+Za0LOy8yCk4nIPomCDd3geKW8B5b8E2lGqPr9oUUXwVWkmPEXr47CWbawHWeVk6mD70/krztZl+0qnAWgOklD22TlYwxHWhPF2Ofhac2xk/eN5eyTDC3611WJO5FONcDdARmdR4QIoPRAOeay714lhL/eReu5F3zSmGaRS1SvpwHHpVUGRnG8RGtJr8nvXIqossUk0In/H40Ff3mTQsJ3o4j46SQ18+XTB/VhCKYKV1C6UzaW7RCZO5y71ufR7wV43GnOcRe+pQ8AI6rHiPM+M3PUoOwNOG8LYEOd9sc2LMR7CHn1hDpxdeV9fEZqWWTWOVWs6OEM0+7WToZNzcF4dLJlQZnoRLFjmP5zkCb380TXnntp3igm2MiHfodBjHcC+c3SWjXZFHplBUMJ/aGO8SKn/zAaWaIRu9gdUvL4VTP/rTNRe6xXJRzm1cPXzMQRQVpPY5Q1yGcBCWQPENcCKpyZJsWTdb48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(19092799006)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Smp/ha8g+PBFGbImOZhR5qAnoUnhWqnnphER8kDoIstDs0Ci2lUzUUjoGb?=
 =?iso-8859-1?Q?5C2SlJ5c+bs8zn7BLls+0iaHDdXBN7t1n3s/kH1FjoDd0HrwfkUE1vJ+z1?=
 =?iso-8859-1?Q?yHS5Hdx84RulVjMR8T7a37dPVSera7uz/b3wYFSRkWnflLRi++HScyV+PO?=
 =?iso-8859-1?Q?0TkzTQab+7PLders6O6gt9YRNh6BGPgoH/jI6mb+gK8OTqlRMz50NoinVa?=
 =?iso-8859-1?Q?GQUAZk6y5SCEwzRkY84oR5IdzNAvWtLG8CUqDi31L5BCSl/1pJrf+WQayr?=
 =?iso-8859-1?Q?l4h7PTXmDnEZzxinLyXrK+821+akJdLrExhFVyNAPbV/MK5GnMXmTGSRl8?=
 =?iso-8859-1?Q?7P7m4EyyLh0epbcQBxYChV9w3Xmod0Rp1+9WqJdAwwyCx1zwDuMAcGcY4R?=
 =?iso-8859-1?Q?qPJBo1SO1ErON/Ghfi2Bcwvc3RKQBTeBHz4AES2QzEK/+YgintPq4A9Bcr?=
 =?iso-8859-1?Q?idICdYL6+6mGHBtr+0DZQT0Bogo5aQAjHOZ5rppF1fpPMzPFmU2EfffJj1?=
 =?iso-8859-1?Q?xC9sED+sVF0VLZ3AfeOMKfcp6XGC/pfNDxljhU7xXJJjPxt+pBuWJrUbMm?=
 =?iso-8859-1?Q?eJdAo6rdeSHf1vthEf4aUMEQx8zh56UdSwKpyaUShnb6KZ9inWIheBnzi/?=
 =?iso-8859-1?Q?uswNdJ3dtpqP1jApjF08ycc3qKC8Y3GCnN0VAOTnFD9QMwhIQJkOlDfimf?=
 =?iso-8859-1?Q?gBC8+prnKHSQuS8QGoKpSScKNdf0r75+uYUzJUWSoh272EVTIkT4UToQUN?=
 =?iso-8859-1?Q?+SQsSgLO1aeLpg5r6l5WdAcB/r/WbSVN1heDHqm8SvlROVvzus5mUDrgJd?=
 =?iso-8859-1?Q?jeFBYeYRn1X+TXSP2tHd7RAT8Y4k4fpdz22TsD5zk9kNi7nO9ppPO7lodg?=
 =?iso-8859-1?Q?+7CdMGvrFHMKt4zBCl0c4qrdK2Zh0yj4gkZ7lTXHQ9DeTY+ZHBjlpQBs8O?=
 =?iso-8859-1?Q?EzdREdfOzFfzQSo9k69b56OTNOi2pqEcjh3cNnUygN6t73op+qMol1Qgs+?=
 =?iso-8859-1?Q?EqpoMh8RBo+8MEhbV4aSp7KEEVyLGZO03uHCooH+1Zus4Y60JgXhE7HRcE?=
 =?iso-8859-1?Q?wuJl5mu49Q0iFwKDAauECbsszNFxfRDqcm4WyNJOYMQDqgSu02260pHvcl?=
 =?iso-8859-1?Q?BFlqmVWDxZNBJR7E7gon9EpGziUXPPDyBWrVQbu5EJAtZP6ty2jDIDfqrW?=
 =?iso-8859-1?Q?Fx9FNAazVTdli22sAmfOokohUbhC0aE7ka7t8RDKKbaUKZ4ooyEOjmxwLx?=
 =?iso-8859-1?Q?79iHQ/YhTBr99BLAPSQXm8muPMsKZ7dv63t0tAkGb4ZF38oMWeeCtAT1g+?=
 =?iso-8859-1?Q?h+I+50P7PZrLwF7pV/0zG5PerLBoqBFpvLI2A4l9c5mpSgBe1PP5ohJJF3?=
 =?iso-8859-1?Q?xDouxhmzL2ebN3PQ/K7dMMNUilV7vftf2VvsPIK92d37IcX2a8TMXbWocZ?=
 =?iso-8859-1?Q?+U4UefqXmcPsCTKt8BKeUm9DDYKTfiZ1mN7OySx6NR+A5wO40kv1gVzdbq?=
 =?iso-8859-1?Q?bgbxYH/Gdmy9Qr+yFmdA4zPrjSdlktYFmb/A9wV42TftD4SRJ4Qchz5c1e?=
 =?iso-8859-1?Q?twLt0DcknuF3QHmGLOnf91oeEMxlhGNAjNk4ZjrZaHL4nO0lNNRpz/sHdl?=
 =?iso-8859-1?Q?d6QhfWN83UZnYOJRQapXk1Ra96PUeZ/stSr4DYOXLXfLlZR+wHxt2pHrR5?=
 =?iso-8859-1?Q?U7MiZT+WaJlaO/7HVEwR36M2Ty4puhrscDYwsWcsOpAVzbKtmOB3iZEqMn?=
 =?iso-8859-1?Q?3HrJAezV5cHtdiNznz8oc/EpfIiLZtdxuTs610USPRpeFtm9mjTOyHhX75?=
 =?iso-8859-1?Q?DsvArlYJBA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc03633-b23b-4a2f-e0b5-08deebc52a03
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 09:55:18.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iaz7Vqu8l2vaHxdhXyrKZ8bQ8d1t1hH+z7BRv4LoF2ZprEXdMphDLMZ9zSgjG+z18lIo1vkNSxHe4wb6vlgbVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_025525_534863_020C4E1A 
X-CRM114-Status: UNSURE (   9.98  )
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

On Mon, Jul 27, 2026 at 11:47:02AM +0200, Christophe Leroy (CS GROUP) wrote:
> Hi Ioana,
> 
> Le 23/07/2026 à 04:47, Pan Chuang a écrit :
> > Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> > devm_request_*_irq()"), devm_request_irq() automatically logs
> > detailed error messages on failure. Remove the now-redundant
> > driver-specific dev_err() calls.
> > 
> > Signed-off-by: Pan Chuang <panchuang@vivo.com>
> 
> I plan to take this patch for v7.3, do you agree with this change ?

Yes, you can take it.

Acked-by: Ioana Ciornei <ioana.ciornei@nxp.com>


