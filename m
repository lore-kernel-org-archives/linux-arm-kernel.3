Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F085AC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLCLbLAEIro526ipZ0IrcLVpCURdBfJ9YdaycP6+uhw=; b=N1YmXIuyDrcrhTeb8Q9Jc9P64f
	X95fdAuR8HbQqf4e1MrjRJ20fX1hhZWYTXqWThUMc7l7UkyYtqmlqKexzn4VxPQg3D0cVShpPdOoI
	pHiHuRxyYLZmoe9myLP5OCFJ1dG1PMRXibTSWCVP2a7hSqNqaLRF3ffdNCJyVq/Qa7+//8sy5BZ0Y
	HAlVsX+KQj5PZuG5VcvlBcVCSnNJWW9668a8D+yFPjAgZRJA5Igh9TNp9qD+6U3+OD6gACcFkx6Mj
	DWOgli1w2mjRGk27BlY6iPncIZrx7jWwYpKrgUr6z97CxqdULNk/jGXlhtwVDVLIzfTy1Zx64KA3+
	hAvk3I7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UcR-000000072vI-3V3C;
	Tue, 15 Sep 2026 14:58:47 +0000
Received: from mail-francecentralazon11013052.outbound.protection.outlook.com ([40.107.162.52] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UcO-000000072tA-119b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwi6Fn3/qOYJNqWm+FgUgZb5CdI5uwcnhLjg0h3JEOQFGJYCKw1nIU2cacAE5zOFiFAOCUdhhUsswRn8HA7U+NBmDUEU1wYTH9zfF6tiEa/3eYz5jjW4pCB1iTWmnK03oSpk9qej/7l2lnf6s05axGrzFILm1oFniSK2dfvMGpOR9kR0WjswZjLhrc9baAnayzC0VQuBH6L0DIAp5OXgEado8qAm30G3ghevwny7BaUkUohwtG5PB8e3NIkyAo4PB/pqjTJ08GWzAqwp+sj+PPgi1bt5hh4qnsX3agpGUuA9IUdDrrMZ4thE8K/dc9cMJKNvTsPg5Ngq8LSGuEc/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLCLbLAEIro526ipZ0IrcLVpCURdBfJ9YdaycP6+uhw=;
 b=TPsopI1yO1gCnoaQglKCqd7Qb3vRwBxxS1koFv7IIXbn/uJ9/8JIYCygq5j6gERlGxYFj/+NWmEFXNJ5dMNxxDqZvECTgW1n8nA6Yo3Mfr0X8AHCfDbfDQLllu2wHahKILigVeizInQiqbr5+Mb4yRfci9Bw1kLpBhAN/i1muBfODGh7JoEun5mn7+NeeAR5/swqmnHOX6Fk1YbSg93BhGMXd+YnZHYSGj6CtTgUuobasDOx4mfudSQCCVgDqZDDy2GPDXdX5hmguCeqT/8t3JdfNKtRc/R/3rauoGzygbJ/wpCBrkfjgMi9cJ8yWVr1ygbaA7398a6xNO7Y6V7fqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLCLbLAEIro526ipZ0IrcLVpCURdBfJ9YdaycP6+uhw=;
 b=PS9MZL5Glk9kb6NF6fMapQSERrxW0DwgdY+x5ocyowuY4qZxGxCcHCFDe3hH2bCDObTS6xe38HxVo5wM89bm0XoaQpF7eEE3BSr8ahfzFydAV7fE3L7EMEuMac/rVZayVO4U8FLXXcKEXJpJrw9bXNOp8qDo7BXy5Wyp+E0905Aotk7y0nGGpGDHuRa7CqKXZeJuNyxnCrr/C1vS3ZGDUT2MqLB4wXeVPs3yTdHye7BoBqes7eR/IdEa5yLjpBikVwCUT7UBITRYBM5wxDEz0awJmiBl7aiRXT5EwKPhTbW0qgqaXV1ZEZwJtVYH3gmBSGrNfEhc+j1W9fJdigUuiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Tue, 15 Sep
 2026 14:58:38 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.008; Tue, 15 Sep 2026
 14:58:38 +0000
Date: Tue, 15 Sep 2026 23:02:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Cc: "Ivan T. Ivanov" <iivanov@suse.de>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4] arm64: errata: Add NXP iMX8QM workaround for A53
 cache coherency issue
Message-ID: <aqleHm4stDi3Pt//@shlinux89>
References: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-imx8qm-cache-coherency-v4-v4-1-b2e528c7d05e@nxp.com>
X-ClientProxiedBy: MA5P287CA0244.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 252eb8ce-e3ad-40ec-9557-08df1339d2ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|921020|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sKAHHW+hNyD5oK6b+x2WuKZ42J7OB6wsS3X09emBnTYaXCnJ6kUeXsjyyOp3mJWXQAiq5U7ufPedvzhR8kNzGOC+bg3BAJDKAehT5Fr47n9OfLvM9sZAaBqDC0AhwkhIAZ5InfNj4x2VWqGGdf4j5t9giCW9L+u9K07C+rMyTKhMx/6GFSD6I59avweKreQ4XE7VgZYPFRrdPgrFTouWQGrAtfdZQCs4t0ISaLxtuiGGt/pvVUj9cEWTJNa1b4ht8V2aN9aD7pzfb/W67cI//R1aXcz0BirGn0XXvUzxyLIhEx88ho+gxmFZURnNpqZnGlEywtut6pHtl7qX4cEYhYvW6B96W9IUkcWebYHpYWw1s0DFmY3BYgOGzasUTRMeFe1CFxWUzOgDGdNYGjAOOzledntV23SRb9pwflF3niv5x458GdlUDlgKbuAmO/RMN1YvqLFknSCsiGFJBulEUM7a07cQabtqq5l8kAkJ7ZNTa/2pvyJNzSXnCYSFWnNYN184GtlVJucg8QmSNgKtDL03+r1PTyGKv6v8GvxiYw9x9sRHYFhquO6jn0OR8j5LkMWHnEKai+/lzITLQ8Mu4pQ/sb2CXsRazSRRxLVkD4BcLZVlVAHYTC2PlHnjc3HB4spLZGeBLCFXYCdsw9f8KoZbi5d8o5aQVlBPCH0oM2oaWzm9MZ6uSANtq07Ow82MdSLg3zVSPwoCVFiCdYCZaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(921020)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvl03sm/In3pEbpMWFrX4p+d98EBy5AOu91CxhbL7B02cJlmON4AA/IEyHsU?=
 =?us-ascii?Q?oB74Ug9GCE+8wiXNWcvEVjkLsbaQbG/bkXQz7iiINJZzED6u68BuqUTyhoz5?=
 =?us-ascii?Q?wi5BqBDXJCGlTm/LLf9n/HsXaXhDD2RpvIBOU16s2pOJVQP83HVueEm4ae9+?=
 =?us-ascii?Q?9YfrGrerk84oLrbBvyGhOKoVJoIcFBtIRmeub1TBtfxpbavpDz/APU0j6zT3?=
 =?us-ascii?Q?Zn0zsqTPj2Vgtnaw+VDEhvTzXXaTDOLCYRucKpTQi71OJcIadf+0ZqmIzTRJ?=
 =?us-ascii?Q?9+WOgRULVaPBqiQkId2LjsCJow9sdFetePyW5xZBiBnB720onAfsuhNj9ai5?=
 =?us-ascii?Q?33OaxCuFx+HbsSk6JtMZndRmKbwnMauy87vKmDatdfcIZLwskTuggrINuwml?=
 =?us-ascii?Q?eoNAeAg/WbVy3YrMxc3djM77rKR6b5WbjocyHKRVBlUBRFL2d7br6ax0KPrT?=
 =?us-ascii?Q?QuMmpct2TWS+pvbCYBo66qZcvNW26Eg8i0WPipO6kxSmLtGyka9H/KWTFj66?=
 =?us-ascii?Q?QcOagBONOu9sDvSValE3VRkTwy/ZenwUPJFqEwFuj/eI/RFsYPVF4R0H2rIY?=
 =?us-ascii?Q?g1kt8CihGEONiLP/b8hYc7IRB9WdMnRlN3Ns3aK+zz4pwqqrJ1uwaCJb6jss?=
 =?us-ascii?Q?QCulKPkn+OcZ53QyugLJg8B9TUNEsGShXhRzhj2/CR098AibeeYmG70hc5ex?=
 =?us-ascii?Q?o9ohW/PuD2k4fZBhp87VYxonT0vmo8SoLNuT4dcjFn6C+nzt7Hc73ZZEMUZi?=
 =?us-ascii?Q?wYXlhDFK4Svtl85YG+MUi4H4RoXZfZat8X59t3hLdNqYQTzzWeWcH67yUeKb?=
 =?us-ascii?Q?u8qEnBE8HZzGckNxyB3W8mz8Zpomn/gAucsSQ9VO6tnczvsp3+eaescX17Wu?=
 =?us-ascii?Q?cE+NZ2GREd+rCUnZe81Dgt4cwP7HIgoPOOIzHdytZAOU1D0WtrRd+/5jqdsS?=
 =?us-ascii?Q?XdPCgyhdyFBMLi/suX0fusY7pjbG1IhPdLrpt2soqF4/6yR78IBQoH6leRO+?=
 =?us-ascii?Q?RZ2XZCvHzUfpwNsdw1w2VCSbc+MfKBBOR12zWP4UcedHDF+5NH8nETyzh6aW?=
 =?us-ascii?Q?PQN7Di+bq72AvR4Xz2h01dHi6oWtWrS/aSg0vMwbEffSLZ5BWLf5mg41jMkI?=
 =?us-ascii?Q?SQSIKa+ymYo9hvV73tLBtsfn6f0bAcNMzdVC/5H+oKej+7Z9X8JQROZOmAEa?=
 =?us-ascii?Q?/The9pIcNZjQIQ/0lsuhUh8LynJGOXRcKY1paZ9NNLNBMQSQOC7SPh1rVjey?=
 =?us-ascii?Q?VE/4KiphL+ABKXjUjcHK+WvnbTIBNLP0IqMiDWrN+dQ6sxVwbzgFFrVhSsYZ?=
 =?us-ascii?Q?pcHu7YKUTz1Vrap5bzxch6TR+zvgPvlrTuQbS5e5FWg0aFGXJRNSY90jSHla?=
 =?us-ascii?Q?cRYHqecRk+qcMDES2Cr6S2CkX2rIKV/YJw+80w9qh1PZ+mXpmX7lGOpnlRFn?=
 =?us-ascii?Q?WrqTmYb2DGn7bYndotBhEJx7/Zo63Xf58fv2WeWhR5zsNMnWnczwggMEPgTh?=
 =?us-ascii?Q?/e0nDMSdd9ZY+H64vg0+cAKoMOb5PFU4hsRlR3/0pqfajFJuOaY3NNsuKrYm?=
 =?us-ascii?Q?YuHYMSyzOzZyUUcY4Nrv0dKFWFmETfpYnm1LM986egpNx1EiIwFviZ3OrViO?=
 =?us-ascii?Q?nXFqfv4yt7TtModUKRPjxX7tHN1tnXL/5owYtuQEASOgqbovTWvlS9COA9GH?=
 =?us-ascii?Q?a0OHcCdsgmEADu8GtQntsKPEpGyJOnDi91LwnN4UibRI3OSxXrrrEVkPd5Zw?=
 =?us-ascii?Q?jkHBFNp6kqE3p58zJBP36oUi4l6TzV+Sqk16DoHEwav7YFJ0InUI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252eb8ce-e3ad-40ec-9557-08df1339d2ef
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:58:38.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG7gtRa9YbSrH3i/KtU/403wsgKvbNZFBLQLApkE2YG0IM/OHkNiqkwhhhOUucp7L7fpTH2IT5V5ciOQziXe+QsghcOKsUXhAR12j4UvYsoNhbcJeqArme9QnJ4RmLcj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_075844_286338_DB28688C 
X-CRM114-Status: UNSURE (   7.22  )
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

Hi All,

On Mon, Aug 24, 2026 at 12:02:04PM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
>According to NXP errata document IMX8_1N94W[1], the i.MX8QuadMax SoC
>suffers from a cache coherency issue (ERR050104). The upper bits, above
>bit 35, of the ARADDR and ACADDR buses within the Arm A53 subsystem
>have been incorrectly connected. This causes some TLBI and IC
>maintenance operations exchanged between the A53 and A72 core clusters
>to be corrupted.
>

Any comments?

Thanks,
Peng

