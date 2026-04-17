Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9525F43688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBf89WduF3sMSrUayOKydYGrpW/tWs+riYe7kT6EsWQ=; b=DFK8s0Nh38NsdP6vhkIRqSFaL/
	mrBSXLV8AXwMPFbPm83Au3d95ztl7tzaxdPlnBNlEZji7muIcIY/uLDFczs7dS/+Hb0KZPyabKLvO
	w3TBjDdQMDs7a98TIqyj+f8zhfwg255ZFvbtU48aHgo2vNlCZkoM5C9ZgK9EO49oxVjsLC+DRRJ6v
	wThYqL903BTd+WTs3ew5aeVsgWp46QXbWqxFbZfr2moJ4l8nRPt/YTBNS6kdFGsuTnKReFD5sKKMn
	PCu/AzQDN+ZbL7l/Vmb+aTeTIBeWR1I9tASdFp52cUsKQjNdGcDuqVD4pyJpM2eXVc9WD5OTnCBkt
	xu59hRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfV3-00000003ojb-3Efb;
	Fri, 17 Apr 2026 09:28:33 +0000
Received: from mail-westeuropeazon11010052.outbound.protection.outlook.com ([52.101.69.52] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSd-00000003lfy-03Xg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 09:26:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6qwFUgyHkQsle0MTspYsR4WujjMo/IDqRlLTac+eb5BpHZBHokG6GDWn/Z5wvshj+nRaQt18vDhQaFXXg+XYwx1UTBDYj5VOI70V0J2fExzwV8wzGZBHw6wiV2dQe0Dbe6e3RUHpG1JqE16yR6Z7Ez8akdnKcs5BrBd7cqVV5SouB5UDwJpitf1A3K8tNIPYzAVWgXC0XuA8IRkBXVbMD5nSJtOWXLknRtX/gL5GaURbKCJvmpyLVx0+fVWSuA87veNYm4Orq4m0U+wR5i3CZxN0kHW/R4BO3+YZ9jSoXIg3jOIDoclcv6DZZoBcLC21sdv/crMHHbYEVNeOadK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBf89WduF3sMSrUayOKydYGrpW/tWs+riYe7kT6EsWQ=;
 b=Pkf/Kh0stiGqXEXrEV4oyEHquWyoIggA0Amyc2Z8Tkc+0zMH9BmBJXwXuo6Hr+8uI1HDy/BAsA6s2HIsK6/3ou9XFwYYTfPBdqIdDl6S66jEKf/jRX92PD4Bmab/HqSEKY4cotjOJfSmUJ+o+N2kbuH+oa6dSaZKMN6OGwJqGYOMrihvXKJ4tAJQoBx2c88I/gBh5lcFkOVRh2bh1sScuEqM2DZlkNPqN8muDRzntoSmRoBoRH9eUg18XUT4lCuUFT3NawjKUEoGBUdB5gCdN9VsOy/yoY8bWXpPfivKME3Vcp18LLfIRoT3ANJekDu6u15tIi27dvInM0l5G4O4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBf89WduF3sMSrUayOKydYGrpW/tWs+riYe7kT6EsWQ=;
 b=Jtm5GPWITBlaNv1BuJ/mty7kHFzImc+206Kn/aXU8aI4L7aGSRw2u69Dmc0Ly5SfgkVLp+Hh3VrLscSoMz6xwuqNMTiiQc4wcojHZQZDO2f+/XMby7tAK5qYQmW1JKtwogoExJzGwLSAHO21RCmvyVhSyarOdaPooe5GsZHxmwZPekhGPSdTWdoVbPAamzf9qVVO/ZbJ9RDV2rg+zn8hVLszIa8TYno6C+jfLQpQVULMqSEsrQeCGo5Q4OZLVFp4UsQFu04uXjmr3+R887xMp/REaQm9ezS0516oDorb+gAv7Qv8d+z9OD1tiOvYID/WesATNy3uKlaKlqRLz1tu3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by DU2PR04MB8855.eurprd04.prod.outlook.com (2603:10a6:10:2e2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:25:58 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 09:25:58 +0000
Date: Fri, 17 Apr 2026 17:28:09 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	krzk+dt@kernel.org, andrew.smirnov@gmail.com, kernel@pengutronix.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com,
	guoniu.zhou@nxp.com
Subject: Re: [PATCH v2 1/1] reset: imx7: Correct polarity of MIPI CSI resets
 on i.MX8MQ
Message-ID: <20260417092809.GA582835@shlinux88>
References: <20260417080851.489303-1-robby.cai@nxp.com>
 <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2605c4332e8a3e8950b0b15fc5377423cfed4a1f.camel@pengutronix.de>
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|DU2PR04MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: fa75e555-49da-4931-8e13-08de9c635557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|52116014|19092799006|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: jT6IVvIEkDmziKHKoClBphm9djMMAQHz2yvF2vHiN55felnqsPm7Z6PShV4GalZahyD4OZ7HPLG8cZy9g6yVojXlM3nwPowEc8EWjBStfKd1w0yoeMXuyvjBLoy4GUWICq5PZnKelwjXD2o3OcEbAHFvWLUtNmX9FrTCmwJ0Dolkt0kYzBmYNSnJnG2h/DNA3XFGoOQ7WGUjKdGq7nzNDM4wdOzJq+F3Hstw3yqe1kS4+oIv/znES5nIucfvCv1YBuqfzM1oahnvXbl45sz31/DbNP5WA0/kIxF9BR/LJH0oaWymHTIGDZgJVmmk0qEdqX30PtGfW0Bzgw/LFD/BzGGT33qDvyhsBCZjusEgQ/vlBH/L6t/drAPgx0QzX0MhSXjf2esj6SQq18Y0/qpmZhXJBowy8yyOHYcy6J/GFb964V6zMn68AD3cuO+FlXVxT1c91pkWvzkNUsyOiLI6/dC+tNFTrRw5T5fVbB7PKt9SYxz5tCpZx4HO2iH8TqPNx9pMBfxyvx/e0rwKGZKb4/EE+IhlTjD0npKzBVheezK3MFzE8VkNUaxL/qhm3fQoeSRDOFngdXxi76gXkBHkDISUsRT8uOcMW71zljDTfMMRZM3f4+vXtbutmyzceIG9Cd6eNmMeHEXXtLQZMf/yQ0Rhe1b7GzoNBxSMB9XVtRz4mmyEVwP3hDGhV3ncoFEovZb6edKknTMYfWkxVqGNbWvRTMGTDrYtoVFJEM0GQurRq8LJWuDKHbVE/8SrdBEENoUj9ZDnc6B1945ShA7AnS3XUVKlVX1GwkvVGvFwJHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(19092799006)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MIxM6jvWP7f4Czjx6ctoig960pzwduskQxZnh/34jvBXCizlVGKGq3XFheQ2?=
 =?us-ascii?Q?sRNTNHESyivZNe/ThggsI4nRBn+uwFV/3AWUBkJvRDWomiG1pTw+68lGgx4J?=
 =?us-ascii?Q?DmPHlI7CNL6OQ6EvF61o+TMV/OwrgWSNL3/oqYt4Y5fvG2SXDww4VIrvmre+?=
 =?us-ascii?Q?wCnrvfbex35fZJF2t0aqzRUKnWyQboN4bnjCc4su93grSSBT0I79V4z87FBw?=
 =?us-ascii?Q?CMVl4xXF3r0GbY/Rutc954tps8OnQzG/vk5mvBK5sRLTWzBnV63B0cWTmdx1?=
 =?us-ascii?Q?LZf6W+K16v8ndFJNWxkeQ68zLAAi0EKnqGyJ4NAQAwuABeCH3DR1wnbfS2ui?=
 =?us-ascii?Q?iqIIjaFBW2Rtu2lPmlXYxw9xkV/nyLezgMibHHV/eaRbrSeRM1quGZbWeyJy?=
 =?us-ascii?Q?NgqNJEIRb0BO5Ix+GhqO1XrXDFunDjP2Lr5uCWbMounkQv1kX3MX/THHBL7l?=
 =?us-ascii?Q?4O6wz+cNHz1JslDTBAd5TS5Cu9HuopBvtZM6/cXDo+o+W6rK32uVE0+jfNYF?=
 =?us-ascii?Q?YDFQzEZg75CRLDzu0eq4bNnCNZjmSgpc+zDX08MtYMxS0lVRYtNeQNUtHoWb?=
 =?us-ascii?Q?pEsxa9vDCJhBwBxHvuXEp8j5RBxldD06GrQzC7lzbjDFatqdf/u2qUTt57Be?=
 =?us-ascii?Q?jhI+qI7pbgeK/pv1PZXHFgSKwf+zxMF+hAsVYHdsBoyssxPmhd0xagVRDvCA?=
 =?us-ascii?Q?2AFuzXfk+xr41pc737S47QX4hRqUqiQVWFzMMO5yD9oKeqYc12J132upmDTg?=
 =?us-ascii?Q?JpU1VR/aytquXMWGgNIa+pyty1lu/KQm2dnO9ZYiRCq2E7QOEIRHC8Tm2Qu6?=
 =?us-ascii?Q?wIRkRyEuQsZu3IIjanqE6BNqfmczpqMOuLes0gdK7Jd1K+XNslfnIqyaoJi4?=
 =?us-ascii?Q?TLdwAPEataPQz+0QTphz+dqE6Hap7O1Yespsvt8I2EpIkoeGSG4GgXE0Z+X0?=
 =?us-ascii?Q?Fy40+dS2eNKfw3m2J1MAeaBH4uJGMoX19PbrcSp23tGPF8k5aKM7GwYIhsbN?=
 =?us-ascii?Q?OW6d2TTwb454PMcslSHH2m/U1PXDabpaU/evA1g9bNrnKKepHgJclOA6VdOy?=
 =?us-ascii?Q?Cg4ogZEXH/lZBoTV34vJCob8UZBkKlnsJqfgn+to605tLYC+2qXu3Ji0OI4/?=
 =?us-ascii?Q?p7P3ToMGhDprDBoUCo2p0XlExpNZbMnT9ifzvZ6cuOhOiehBor535lxMWuhK?=
 =?us-ascii?Q?22yZkOyuBab/xoxmSZVRWi2GYamZe9s4mZIrIH/KHr5aapeaA52Rflw3Eil3?=
 =?us-ascii?Q?eRKpRwB/iba/sEPXDMYNCBGhh1oHYt6vwqZnYtN29I8+pH4bzcYhLYnZ5B7R?=
 =?us-ascii?Q?Uwl9Bq5frL10p/cRrTbYScn0lwMhIpWtz9TQJx1r5zvAr27YxM6kdbCjUKy0?=
 =?us-ascii?Q?QizzffFN3nXXZ6HoOcDlxCRThak+eE2y2aq1kTQv+WsjQR14G8R08bbbLq2Q?=
 =?us-ascii?Q?RZtqUE0holqIp/+b1Ka48VbPDA4p7RlLPjwWXB2IObgwWqhWh392NVqIHkzg?=
 =?us-ascii?Q?uqDGVP7yCW25e8XJKBg8YXEAZHEztM9gpFYhrbKZIe1A3qKtYuZqalg4aLM8?=
 =?us-ascii?Q?1uNig9Ysd/7oT7OECgSWgcq6B0Znb8nT7DOHTN9OLGZ3VfYMFTPPlmLelGoQ?=
 =?us-ascii?Q?QM3q9zZbQUd2sHzpm1UGi01nseDvMXjWdLIrRO3wK/ux5Ze3mpcTacGnm1U/?=
 =?us-ascii?Q?82lSa0b4ijIQbpZRau9Et7q6163X/qT9fbKKHOuqJTF37A2gfIIyl7eJMY8b?=
 =?us-ascii?Q?SLyBL51XCQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa75e555-49da-4931-8e13-08de9c635557
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:25:58.2927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7FFRh+oiihapWyX5o2h/wGbnO904pSP4paSI2B89Pp6qnq5GRtOVWVAnHl1F3Ka7/wjfAlG/kmoZHnqRAzeEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022603_111760_D2E2130E 
X-CRM114-Status: GOOD (  12.94  )
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

On Fri, Apr 17, 2026 at 10:47:48AM +0200, Philipp Zabel wrote:
> On Fr, 2026-04-17 at 16:08 +0800, Robby Cai wrote:
> > On i.MX8MQ, the MIPI CSI reset lines are active-low and not self-clearing.
> > Writing '0' asserts reset and it remains asserted until explicitly
> > deasserted by software.
> > 
> > This driver previously treated the MIPI CSI reset signals as active-high,
> > which led to incorrect reset assert/deassert sequencing. This issue was
> > exposed by commit 6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly
> > release reset").
> 
> If this patch is backported without 6d79bb8fd2aa, or the other way
> around, will that break MIPI CSI-2 on older kernels? That would warrant
> a Cc: stable tag.
> 

Yes, will break.
These two patches should be backported as a pair to ensure correct behavior.

Regards,
Robby

