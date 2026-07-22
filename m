Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA2FC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3lqVgOIoFj+rmr1wuewolWPCx+pZ7RII1LrDRzyZJ0=; b=BjVdovDr578ZlIWmEwu6JglYvw
	buhT3TULeNoL7LqSz8jlD1o9HSBrl1Rlv0mLXD87cV3AjU01O2Wv1yCq8kwxVHKj+QEjOW75jiR8A
	np5513HxNAJEB+WyqZiT30TEv5mTfYiNmTHCxbWkajiWrh6aMWzPvPjC9pqxk4buE/t7jmeFafspo
	wl60gdKmAp8iQoCZKYj/hasG8gjgR8/hxCbB3ittwmoZXBA05o4CrhqBCzD0F+opU7bKpKfMm1Ipr
	mXRdcUlYuuohK5ybNbFSDG+jrwPuExNDakuvM/sZdcMjdtlT4VIdnmfKeyV+8/I3CwM3t2bsFIX4j
	dxw4lwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT31-0000000BMi5-0bos;
	Wed, 22 Jul 2026 09:15:27 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmT2x-0000000BMh8-328V;
	Wed, 22 Jul 2026 09:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYuQ6JXYCVT5EGN6JDaJZLujGnfPfHI3ZOeiUmNKDyEpYa3h7GrF2STCHg9q35HFNfNqC8SRKKd0PNWicrc5eOAbCJjU0zWcYcS5cLXBmeltKF+bLK2XrQK+OhLfsX2ZIOMp4tNrCStMUcsabl08hhNhs5Vgvplr7QtY5kxvGja8uCuEF3tnwYn90MCZ5nbbK0E3tz5oio58KqD/er1OTTLWRm/a0VCnjgM9RyxHRCEyIoFpwXz+hM6yIgLlMO2UZeDyXaeLsVL+0/aF+J9fekMGpOjfLZ/tlXPbVpIG5+UR3mvoiNYff/dgZZBj7StjSVyhBI+fCnqs1FadtdmH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3lqVgOIoFj+rmr1wuewolWPCx+pZ7RII1LrDRzyZJ0=;
 b=FGeo/OJCDAqCkAv0X3VocDVHswIa6FuGW5VapmgkoZY9xnzbVSoDGgv97QojRxFMzMe7HDtAbUpnPJxkBKDigNyUNYdKdWbpzM6hAG2HT6gMV3Yxb4nFzHIOFtGSrjRpbsss7tYoDrcK6vQuM3SL3pz/oTlWqrKt32TKYrJCrTVFOKMhgwkOHlvAN6bWpTunJ3NTeL/BWCiKrYmMWeSJJARxF6+0Inm8KTpdsKt5uVc5F7EP1rlCdvqhyJ3ApFpLVFjRFM12tdmn3AyKtj1LqUO/PuNp1MarXz9q69IvzVidt0zApVVG9TCwt0ZDD5Jzi0A4oqgTqIQElOAzmWgVDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3lqVgOIoFj+rmr1wuewolWPCx+pZ7RII1LrDRzyZJ0=;
 b=VreIfh/Ik0ZWFx0uTcq23fPF8/3STEescgcZK0bugI9K5yZ81o0MC/E8w4awVVvDYKmhKFEqansXrs01XQZKUymjSGUQFsl8tqYqDmBwjDBFSThMgVBQ3DmZOUnv3TqaQKfONTWMUaqS8VmktqJnsOTXLnH+r1b2Doopl7Sb3BnW8l0OTd3j+fBb+ZS0bwE8tw2wpPxakevEwD8qsCMd39ve6izmpk3sYfmZ0xBnLBAEi46kSRDDWEcJxn3ALjqh2J2J2wahWvju/6awjKvLvN3HUnj98RGi3PGr5IBKvO9dHrci1fjrsFWWfA9M//C2Drnv/l4odGpuu13APWEPKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GV4PR04MB11289.eurprd04.prod.outlook.com
 (2603:10a6:150:28f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 09:15:15 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 09:15:15 +0000
Date: Wed, 22 Jul 2026 12:15:11 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Tanjeff Moos <tanjeff.moos@westermo.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 phy-next 1/9] soc: fsl: guts: perform fsl_guts_init()
 error teardown in reverse order of setup
Message-ID: <u7ihkf5cwaijzwkpf2mezokjfb2f77gqycn4p64drzj5lxa7zd@5irimzukasw4>
References: <20260721231603.67865-1-vladimir.oltean@nxp.com>
 <20260721231603.67865-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721231603.67865-2-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AM9P193CA0021.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::26) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GV4PR04MB11289:EE_
X-MS-Office365-Filtering-Correlation-Id: 232c868d-a886-49bc-7bd3-08dee7d1bde5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|6133799003|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 6c8HDU88BO5yv0vP4oykq8ktqzjGWKx3p89p25G7+fb4c3RXe5ePzdjWmB/3znRHZbzOUFAc0VhAksF763I6Lsmque7Ul8uuAVSlBOjHE2YAvGE+ybW3BeT2gPuBFMLV2uPhKuFcrsQlTfnlMTPnSVzSM392qxdYnyx1j/w84LHegICPaZ3WPC7Rdp9Ho0xpDB5B4hpyy08d+IRWSyY14FfqLmoCMUCkkA6HpZjl8a1PeHQjdCT+lVJZK5tMsDKFTgJGm2NpppxPUnsFS/T7swUD0Td/6qv4bYSRaprWDCI3QMruOQTeQMbpmLg7CD0B5FgbsatvshvLwu3CpW+bRvINERNrkAHBnKPRKqtWqLW+inI/DL3SklefMh+onTcasZ8qsc6L8upwJOMOQs1TzN+Akz4PIrrmyJc01e2361PoaBEKlYNFDElLgQHBqlq9wQLmed2yMauFK/EU53cX1hTqNVtRGiNVMu1A9EZ+tQiuUrM3bVQylTVqN/xiA6jusz1yx3mujU/J6VhbHa7qPlH4qZ3ET7rEnO58rO6y46GoIyb6hgYz5Xlc9S0WtD+Ewh+Ur9atWXvo2yiPHRIfusSsjn4IJ1qwPZgikGzSsBc5mvD2jfnreuqFfLVZ2ScKRcUD07rLOCKBcVlynCqNk4L49khoSE+17GgtO0WOK6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rz28qeBfal7gd0Vc8IM8d4bICksFPgMNfOB0QzhC9VVv8iRjrBve4X7y/3Il?=
 =?us-ascii?Q?XgwVVgigZq1nk5UMFb4EDTL8Rgo+Zb1PARlW+RwmyVNJ8yU6VgMmHfT37/ZY?=
 =?us-ascii?Q?J2zC/XlNxgyxeaP9rxo1/LY8G4GKcXB9ZnPoreAeY+q9AL8h/PBqNAgZB8a9?=
 =?us-ascii?Q?P00o8tmbCjYirM0ZrpDUOujc8/LjBgr+0PES+yrnvzNrHnrTh45L1AUIeJEN?=
 =?us-ascii?Q?UXb9l3VtTDbMUMipUtsL2/8kzwlANWVL4l0QPm3T5FVydVpFPcRR7etfVGQf?=
 =?us-ascii?Q?rpQPrpyPrAXmu/z5xNuY61Wcmi1t603CroOILON8nMXzURuxfbuS9W5lJu0s?=
 =?us-ascii?Q?iLBfr8H7mvsmkADLKIeUychmAWkAE9bulhXpoI4gH1HPjcXPB9OfHgIcytUx?=
 =?us-ascii?Q?iaI7iQr4D4Tt3uzPFjlkWyWDZ9K5m2mBc3S6hoNFq5creUKxWSUIF3ZHxOiR?=
 =?us-ascii?Q?nNQkl1X7oouIcvYXVhzuIsMAxaCaWrFMM8ab3lVy6diDrUzmqbE3fOQPKFP1?=
 =?us-ascii?Q?xfQUPHlaGRScOr1JitNjYKe9vo+IkQb3juRchMXUO7i5PfW6yfs/t3q5Er1/?=
 =?us-ascii?Q?Sd1IRaTHN/CoK3jIhvlGxrJVktgLRbLH+1dG8hZg9Z7ICGIcO3W7Pn5MI3p9?=
 =?us-ascii?Q?V93sHkThzz4TbAWSkHcFMeEYqqw+JbrSilZBDaG8FsSGPYjNURzw+8S4YduM?=
 =?us-ascii?Q?NDPRmkg6CXQd3+eZES/j+bL4+nXMx7/aS/Le6m0UAMZ2gAXtXuOUd/gUjV7P?=
 =?us-ascii?Q?bK0OkfNpiCI4N6kMWRQTCDrLrLtn6Ac2CttMuGVz/kKgxR1ZZjOvl/vSGNUj?=
 =?us-ascii?Q?P+SZ1QSh7HNN70Sv70nEd8LI2SX5PLt2HxGoDY5eiY5E1uil9wm55ofsJXOu?=
 =?us-ascii?Q?I3dqMbtLV4bxCemIJxTpG6St8wDfop2z52/Loxjd6vXoBLUCWHxBrP59AvDA?=
 =?us-ascii?Q?yyTVEms4SHO+cAHVszeqCwIe4JQTFheDJFfm/Re+txDMIxSbgIblC196vPs8?=
 =?us-ascii?Q?qFzevTH172m6g64ej+SFxVqJ4OSVfPu34RDeE6KeyFx1v3T1Ayep4zH3tNtL?=
 =?us-ascii?Q?mBLYxe0guzPlN9cPFvQdvIIvvtmIWhts8Ih2yfgYRVN1vRD6phQ6AdbndGuh?=
 =?us-ascii?Q?1ln7fQEnH2dP3ueIfVcqvRlPKKcacO86yRktvM24HFJT2emtVSY9F3ky6ikx?=
 =?us-ascii?Q?+cI80pCfdY9pPBtoejZsUDdVtu0RiBjPxfjVHsm6AMZP9iOK7yAJvfxXBGfy?=
 =?us-ascii?Q?kqMLom1vLjj6PfhnSm5ZuhgZ0kveUmyIQa0MkmcCfDgZdDKT6cR9Kn5FUlTU?=
 =?us-ascii?Q?Ph/RvYCcdGZxPhbjhjoZl1DTCGR1Z/0AaFfTyGl8iuS2Wz37Nt8IRTOPKSbT?=
 =?us-ascii?Q?NkfH0A9U8fCLqA3uiMBX7VwuCRk43wr1kEJlhrsCYmR5laZFZHioc+UWaccw?=
 =?us-ascii?Q?qAmStBxHQ08TNFCPr/AI/tW/IY+1he92s8qQhMswy1RwliUV6WbIeX7maI+B?=
 =?us-ascii?Q?T4AA22tzRpJyHrNKPtqN7Oo8zo32W4pbLNHK7Gf0uOuiJbC2zw55bhqe0F8B?=
 =?us-ascii?Q?emIhXvtQ069UM4/DPDV16FGe38e74mOlvK4Leyg/RtBBwqRyMjzbqE+4X+0m?=
 =?us-ascii?Q?tQ0NWYqZiKUyPyT5+X6B0Fh/M/W49rXeYLzvmODmit/IrqXazZBD0v1bRO34?=
 =?us-ascii?Q?+TJV9qDjrRFSssP1bthfHop3+y0qpotuJNlL8Tno/aHH1uxZ69igu0EwwmRa?=
 =?us-ascii?Q?U2cNaKi/uA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232c868d-a886-49bc-7bd3-08dee7d1bde5
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 09:15:15.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btKvFQDhfavbyDqZcr8qqcMMX1RyEhMTZ97DiM5eNKbyqE1cqoG7vMt9ur9yDHWgvI5NIRrdHUeC2419j+eobg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_021523_773666_870BDF47 
X-CRM114-Status: GOOD (  16.19  )
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

On Wed, Jul 22, 2026 at 02:15:55AM +0300, Vladimir Oltean wrote:
> fsl_guts_init() is about to get much more complicated and the central
> error handling procedure cannot scale in its current design, unless we
> add a lot of "if" conditions to detect what has been allocated and what
> hasn't.
> 
> Currently the code relies on the fact that kfree(NULL) is safe, but this
> doesn't scale to the case where "soc_dev_attr" itself is NULL, because
> this would dereference "soc_dev_attr->family" and friends of a NULL
> pointer.
> 
> Convert to the more typical error handling pattern where the teardown is
> in the strict reverse order of setup, and a teardown step is only called
> if its corresponding setup step was executed.
> 
> At the same time, maintain the optionality of soc_dev_attr->serial_number
> by not checking whether that kasprintf() has returned NULL. In the error
> path, kfree(NULL) is safe, so we don't need to add an "if" condition for
> it. Michael Walle has confirmed that ignoring the error was intentional,
> and we preserve that:
> https://lore.kernel.org/linux-phy/DK44809N7Y8I.J2Z3U4N32H0Q@kernel.org/
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>

