Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1038C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWSEjYsGNXaC2zNfY2BhjfpLCPDyWnHT1ESKnmnAKW0=; b=HT0dfcropGSpXI/PvpS73ZoFK+
	AbhfHEftYgIWHVd1AbDAdpgN2KHkNKkrgQIyZ5qug/oNO0l6NGydIO92zytqspqNB4AwlDLs0NwZN
	SP8t0O3uzPWm4f4Ewom3KLjiNlA9Wjv7GrIvHqzoZEKckHeLuzLgRRAK7bSs7GPy1rdS0684ONdfz
	RknY42xpILJjEUeF3ECEc/QFG0vF48h7iytyhOl2mpgo0C0tn+89LRAMPpWwzpN4lO6YRZiUpDPtP
	wxuoYc3rKoUVfj4kgYZPU8MBdPtKZ3YvuYxbJsuqDvgNQI2kHbLwxUhSj7LHDEyCGclqydilElQaL
	u8uxY5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpS0z-00000004jXT-0c7R;
	Tue, 04 Mar 2025 13:08:53 +0000
Received: from mail-eastasiaazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c400::] helo=HK2PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRy5-00000004iuT-0rse
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9SW0xBNc2rq+whwQp/sZixadxMQU7RgksWYQGWi6SPXHbIywpucZukUCBzyqkPvGhhpgW/EIp1j5vTMWYbRh7btDVgNS7iavIXnFiN9wm+6niiEsm5WdOYJmId7uILEJ7WyCjP2MqPT1anR8FWPo97NMkCVCIDM/0/qISXqHvNcwxgKFEbp/kGr+s3Zyj1yOoxr2QN7aG6j83/NRUkSJcCeU5ZRuiNC2ssxvHNVdje35E9Glr9MbW25Z0tvcReZeKZ+mvX6t+Y++RRNV2FBcV1URJvaeoaTzscJQZMdj/aRD1Ur8ZUf38tC6j1GDoz1RRh4SDy9SFYbijSV7ik6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWSEjYsGNXaC2zNfY2BhjfpLCPDyWnHT1ESKnmnAKW0=;
 b=GfKgrC8RifT/59Qmd6GdGK72NIhXqz4bn0j+a7gzcca6GXOj+/J9G8BOijRMEI/2Pq9AITbHeXXvxc3VGMjs5kri6OvEms1/fWKvfZZAk4Lm1EIcFzRpxbYrWHU9fddXW4I3p3+IzJoS+LJb+Psz/oD2oiDqNEq1Sghjx+sbmk/cK31EFYylbnifr7FJPzLTJqTfPp08PmnI3ZgqoaEMcQUr64NTE67cUk/xt/XF07fjDAaIWJnsJzYcAOXjpuJBjxXn+sU7LUNmKuUK0KbzLnsM9Sh+Sdmp9lQceIJhUTqcq11UaUQR4Foj4HtuuoZvU177+kAoLXvPSjIVQVZegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::9) by
 KL1PR06MB6371.apcprd06.prod.outlook.com (2603:1096:820:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.29; Tue, 4 Mar 2025 13:05:41 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:190:cafe::4a) by SI2P153CA0028.outlook.office365.com
 (2603:1096:4:190::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.11 via Frontend Transport; Tue,
 4 Mar 2025 13:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Tue, 4 Mar 2025 13:05:40 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6BC4840A5BFB;
	Tue,  4 Mar 2025 21:05:39 +0800 (CST)
Date: Tue, 4 Mar 2025 21:05:33 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Marc Zyngier <maz@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z8b6na8RjtF5FXi7@nchen-desktop>
References: <20250227120619.1741431-1-peter.chen@cixtech.com>
 <20250227120619.1741431-7-peter.chen@cixtech.com>
 <86r03ip0kf.wl-maz@kernel.org>
 <Z8WUxyJT1fdHKo67@nchen-desktop>
 <86ikoqoso9.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ikoqoso9.wl-maz@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KL1PR06MB6371:EE_
X-MS-Office365-Filtering-Correlation-Id: 69b3775f-4380-4da7-4d43-08dd5b1d43de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dD/cO1+cNyilB2SWuBlSyG+PJBqr+XhnocRkIbjp5Wlz6ftMdk7khGvZZ8Ta?=
 =?us-ascii?Q?zDTLWZcjrIwVAS+VL2qteTj6m442dcBk0vCtBgjecFpiylAoS7BU9+EivTRo?=
 =?us-ascii?Q?VF8/IPWFm9ii0ytQJfc49KqggzjQMTkVtbY8P3QNaF1gWQQU4EtX5HN6r1Mk?=
 =?us-ascii?Q?TazNlDn7NJF2KXuO+FmtaOhh2b3xbU/blXqOKy5KB+/LduPXu48q3EJ4yJVe?=
 =?us-ascii?Q?Bi2D2P7GQLm2KbKye7vIZGmbwKzGqaupRjo4qrLLJm2WrT3TvCm5fE7W/3+V?=
 =?us-ascii?Q?UaS/A+bIR1N+rkZaJN0H7jk+0gjgym4L066/eT/R97MV9igHh8FLnzhvqwb5?=
 =?us-ascii?Q?sejn68A4zpdvHRqjjPAH8EDs+K46mHbahKjWBy6JwkGm85O07WjYJJnHPIUC?=
 =?us-ascii?Q?gZZxq+hfcVMD0xnFNf2lFsbolziWPSLf8AJ9dP4CYZo8niUuEfhj4zrD8UvM?=
 =?us-ascii?Q?IACXiPJReok3mfYq+Z9SxQ6BavQz7TmD6ciAhWKDkOc8moTcnbyzulaSu8TK?=
 =?us-ascii?Q?rremQ9cb/UWr3ZtskqWiaF5ViDg95ZcF+nIc2LCuQ9qI4jEOdwCYrbGb0Vbz?=
 =?us-ascii?Q?gP2kYzcO0sQDF6u6Zo8IE0Tbsp5kTdsCPNOZekAwcOZNa8RQB95lUPTNIYOs?=
 =?us-ascii?Q?sHSAxw6n5VVATE2XwEihB7sj8onhfwQzo2l+zFwzjiHQ3WEcmlzJOd3AdRZH?=
 =?us-ascii?Q?ddkZrRzgBmhZ3lzktKfzW2j2NcRkQfhLclvIrDXgzX5NKRUZQHlC9TlfuVqM?=
 =?us-ascii?Q?/1eYrIuivPPc8+Sb8cbjzTzIrLs0n/+hr0WkxNStstcf/G13FcKuGh4TkDu4?=
 =?us-ascii?Q?AXkwVQi3aMn0AVrqyzZlB7hqPP9+xGlBUdUNZkQEOay7iFApMjTFvJOzNies?=
 =?us-ascii?Q?0vXgNM3Hf4KrnGTWKWELoSEDr2G+HlRcSszJIRhjtae4eWJM7ACv9MGOL+ZR?=
 =?us-ascii?Q?0RsIB+tdqDRCYL6oEE1SB7XXi5FBfnnYpZUcILDo5FjuKMdvomzVD1WK/RPv?=
 =?us-ascii?Q?6tCP5P6K4acqLijI0MRIsbq8Hyk/IG8WUYGl5j9zrM13Lo+BEiMZri3QMzUq?=
 =?us-ascii?Q?IrV7zkWKJASMOu+Yt2Ipe1V3IuSSC7cZtEsprsAcnxzer/XJRsVQtUrVhBFK?=
 =?us-ascii?Q?qlqx5O+N0dost6Rd7cpGrQ/9cjv8iLThWIi+otZPa+lDI3COtLo0j7faFcg1?=
 =?us-ascii?Q?DL+yNTOoJ3QH+we+Ec3D+NRMhQ4L20MlWd9j8zePi+C6xtqijgtBQBRwm9fP?=
 =?us-ascii?Q?S3Wx+5vn4A4lLmScwOcPPSRTYAguaNK2vkfAPbl/Dp1YvJIt3HehKJaUoQJT?=
 =?us-ascii?Q?iVppyp1BSKRwSTgRNfU1zsCiurXdzTnCYXM1fUgUZ33/RvoOyH/jKUlYjGS+?=
 =?us-ascii?Q?/4G2NjygzqL892cJrYKWqAgKX9YFPCztbb/6BB2nyNVu/ilsVMRwdBmBdAoI?=
 =?us-ascii?Q?dKhFYpszjsZKRYN4wl3ibNJC4OAgS8bx6riIRmB/mQA2I4usanuTNTCWCOnG?=
 =?us-ascii?Q?ndkfsJTVZS1mgqc=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:05:40.5268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b3775f-4380-4da7-4d43-08dd5b1d43de
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_050553_247767_0375CED0 
X-CRM114-Status: GOOD (  27.61  )
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

On 25-03-03 18:49:58, Marc Zyngier wrote:
> > > > +
> > > > +     pmu-a520 {
> > > > +             compatible = "arm,cortex-a520-pmu";
> > > > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > > > +     };
> > > > +
> > > > +     pmu-a720 {
> > > > +             compatible = "arm,cortex-a720-pmu";
> > > > +             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > > > +     };
> > >
> > > This is wrong. The default configuration for PPIs is to expose the
> > > *same* device on all CPUs. You must use PPI affinities for your PMUs.
> > > Please see the GICv3 binding for the details.
> >
> > We have discussed internally, we have not seen the benefits routing
> > different PPI interrupt to dedicated CPUs. Any use cases?
> 
> This isn't about changing the PPI. It is about matching CPUs with
> their PMU. Here, you are saying "both PMU types are connected to all
> the CPUs using PPI7".
> 
> That's obviously not the case.
> 
> > I prefer changing pmu nodes as one generic Armv8 PMU node. Is it accepted?
> 
> No, that's not acceptable.
> 
> > Or must I keep both pmu for A520 and A720, and add PPI affinities to
> > describe hardware well?
> 
> This is an established practice on all big-little systems: each PMU
> node has an affinity that indicates which CPUs they are connected
> to. For GICv3+, this is carried by the interrupt specifier.
> 
> Please look at existing SoCs supported, such as rk3399, for example.

I see. I will add ppi-partitions for gic-v3 node.

> > >
> > > This will need to be bumped up to 4, and all the interrupt specifiers adjusted.
> >
> > Depends on if PPI affinities is must.
> 
> Definitely a must, unless you want to completely remove all traces of
> the PMU, which is of course silly, but a valid alternative.

I will change #interrupt-cells to 4, and applies to all interrupt
specifiers.

> 
> > > > +             arm,no-tick-in-suspend;
> > >
> > > Why do you need this? Is the HW so broken that you have implemented
> > > the global counter in a power domain that isn't always on?
> > >
> >
> > Not hardware broken, just arch timer will be powered off at cpu idle
> > and system suspend due to power consumption reason.
> 
> This is not about the timer. This is about the global counter. If your
> counter stops ticking when you're in idle or suspended, your system is
> broken and you need this property. If the timer (or more precisely the
> comparator) is turned off because the CPU is off, then that's the
> expected behaviour and you don't need this property.
> 

I will delete this property.

-- 

Best regards,
Peter

