Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90775C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 03:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGtmMY0jjQNHZyAaO2osi5hoTz8dK2klDnC/0ymGdaM=; b=vQMLfgsz5iWQ9tn5MEBQJOs2UF
	m0uZtgXX2k6sGtxrhuzAkrwZ2RZTFV/lwXa21GX63ZW5GCL7QfE+RxlyOxaJ3eNT3YkkgyoSgWM62
	lN8iRWKgefIAAPGSqfMFQQ+b3xW/Lg9PJlQGFWn/s9oho/rUKrS8HBZoS6sltX5T7zTF/Segz1vuH
	5rFLosTPV3arH6h0qGUZfQxtBJxxLSy+w76N++EdL0feCfkdw7q+1XbfItX9eK1RT6UlFI0tXZfj7
	mF+okP8IWQeJ7PdynoHECAtMZS+dyXBnCQRpMxGtLM16YnqU3Fmss0yrth3H0Fy5RcZSzoKIWSRwf
	QXBQfwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlY0-0000000FruF-0D7N;
	Tue, 25 Feb 2025 03:23:52 +0000
Received: from mail-psaapc01on20718.outbound.protection.outlook.com ([2a01:111:f403:200e::718] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmlWT-0000000FriL-0lAW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 03:22:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSIBMEBI+IePIU0ZffX4Ch3KSfMjh0i7mUCQHyXYduBrrz/iW6GxN58nDUdbnoAsF0wKdcqHG+7ehZSOPL8giw5Rp6+eOlqKivzhE7XxF/p4zLSfFTTCm9H3Ug4KNF0OTHVWjKj3PzaEypyNO1eEySMvbqYS4RMlbEcZOmcAKTkV2+8ZW3ezthCiC316pPH3ARMii/qwEh75uU0R2WmAsvbB6+xtmxa5nxgewjmUmdd0kzgAqf25+mR4vs36do7gzH4XwmLogVeKYEUb0gdCNinAClbXmbhudCxbu8fvku4RgXTfb2MNGKT2OR8Cq9DUBJHnXPS5UrMZZYpCt/9++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGtmMY0jjQNHZyAaO2osi5hoTz8dK2klDnC/0ymGdaM=;
 b=YKth8touLUYvFWF8fiZnkagksV3WMzztQiwooLwloOt910hKeFB71uVhcG2Yis0SGJ0MlbkkYInlJJgVr7BBR9NZTgbD2g8dpPA/P/6xTrdRrnT8cH6pU4B9lGk5j/JgEqxrJRjUIv0kRT2XGK5q/xmK5Le/uGtUPDd18aK8bo0jPly43DaebJRCfROC4Nw/kUQwAaq1fQocx91EeAqAXZt0pW3oJ2EIVMmJ6I3JgxNpC9QEZBp85ChXooljfx1m7I3dOEFzIjXe4FYT+tsQivOHw39eLKbknrE3mJsc0s+wkb7BO2zp26DmH5t/5n3Vda+vBtj0hBhWh2o9aJl6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGtmMY0jjQNHZyAaO2osi5hoTz8dK2klDnC/0ymGdaM=;
 b=sVX4dsJ3M8m5Sll2RqvzVOS7d4mAGBjJDhYwZe5em3dqHTLHD3OhgXXRWEUIscM69Kd6R063AkTnQuOZBhcm5V31dRfllM+ecg+rYh4gZHAVEDgECHwuwRNuoUVLF1bbG0vRNZd7pESjljJakLGges/eVG++fBan3TIPS1GQKxh0DxRK5+IaPkdxeQGWr+j4BBeIBBaYQokYNuhuO960HrJ4685iCSNpx8T0n3WvNNj9s3Z2ekYfJfNaLY1DfCtAq+EORs3/oQEBK3dFnPbrHkVHe3kGdHw4Fsh8oazGGlQqtpAsL7L2eJjqoIFHXx3bvs4yj1pW82fT4Z3t9dFf1A==
Received: from SE2P216CA0041.KORP216.PROD.OUTLOOK.COM (2603:1096:101:116::20)
 by KL1PR06MB6867.apcprd06.prod.outlook.com (2603:1096:820:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 03:21:59 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:101:116:cafe::d) by SE2P216CA0041.outlook.office365.com
 (2603:1096:101:116::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Tue,
 25 Feb 2025 03:21:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 03:21:57 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 043C94160CA0;
	Tue, 25 Feb 2025 11:21:56 +0800 (CST)
Date: Tue, 25 Feb 2025 11:21:51 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc: "arnd@arndb.de" <arnd@arndb.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"will@kernel.org" <will@kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Message-ID: <Z703T0F7I8TmCeew@nchen-desktop>
References: <20250220084020.628704-7-peter.chen@cixtech.com>
 <068655e7-2ad7-4497-aca7-4100ad478d99@juszkiewicz.com.pl>
 <Z7xZwGTIKgj9_zNZ@nchen-desktop>
 <7f673cea-8d85-404a-b380-4282c0e3c0ad@juszkiewicz.com.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f673cea-8d85-404a-b380-4282c0e3c0ad@juszkiewicz.com.pl>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|KL1PR06MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: a9470625-7cce-4206-74f1-08dd554b8fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BMVgJY0xs0MoERedW59QtN1BzWyc1OLIy57cH2kK0/uGIwVWl6f9Ynh/yoL3?=
 =?us-ascii?Q?/uaQg2KWtVoN5euiUaCof7SR2XcSRITmJOWC+w4RJg8cN/drZtpbHQ2s9YtW?=
 =?us-ascii?Q?t4SqSc2LcPvffOzHjuVuK3KXK/ed5tR5wQU0NGp+4SCukjaS4zLVIJbjBS3A?=
 =?us-ascii?Q?ZRw5uzPDeWlI0705A/n9b2IaVtEv5/OFQtkg56fqInii29Kju3+pp7hLXv+G?=
 =?us-ascii?Q?65o5iCPk61G6rdZQzJESerGJVbm8WNVHmcafGBrd8CQ0ObtrRDtY5hSfZ3Xp?=
 =?us-ascii?Q?ROjEHI2thGkEArukWa81xCngzQhIJjaIMFvoA2Q3M5erZ1th/QGl9O5d+K2H?=
 =?us-ascii?Q?KHil+U1WLKJMN+608IjBb/uM+rHrddphEVaaM8HS2b6zihX5kPuBucGFoN8a?=
 =?us-ascii?Q?oJQJ3kFjczmvfKbMhz5+P1J6pjPhwyVAIXHEZmuVgcQyFEaeN+tsFsjyQXMj?=
 =?us-ascii?Q?wHK0y+d/uGk4emwvLRtWTc6dtZsI+Gg2PJXyHUVK8vZSC3yCo0oSPR5XHohk?=
 =?us-ascii?Q?zPO1vHbSBwD8BFCHU6wf3PJonKHCOP4XdkbUukCZDSyxRMpDkx/wmGpGZrgc?=
 =?us-ascii?Q?WGpBscHZPvzpMK0SOAvVV24kX6m2uzpQDaHi4eo+OLAMMsVIN54R+H/oSz9w?=
 =?us-ascii?Q?wnyB/TTK6ymMH5YC+T6smlXHocw9bPnmFEdmz629xsYw9iWTzIeHlXx5RxuK?=
 =?us-ascii?Q?/iti/zDL5ExEP3gOJUGRPbvl52wyNBMC9DciGDb2fMxJSdsTHhpphnTl2VPA?=
 =?us-ascii?Q?fnVx/fImLGhqew9pYToNdDLNBrbLXS9qbkJtwUYvHcskFcjaGHgmOCrkvoeI?=
 =?us-ascii?Q?I9n1vWu19y8YOdMPslCgwlt63B+DfIXWpK7krmTto27uR4yMBDjf0pd+ONH0?=
 =?us-ascii?Q?3qyDynX8xSPOhgF+VZPIfqPPYgqz+N1fCiWoPc5fWu6eAwBb2AV4Z86Tse/o?=
 =?us-ascii?Q?6km8K/f1tTGq9RUSjTmHqNuJaKJ8qVc2hFiXw6SQD3anZsKY6jrucnwnKGs0?=
 =?us-ascii?Q?XZqCog01ilSZC17lOFAEWPuFnVgm+tC3NsauW6P3MYkuicwC2DAvq2e6KDNc?=
 =?us-ascii?Q?EblytQwKViR1Q19lpZdnYAVqEsZcAdXmehZ3xFVnUOPvvW0LE2TT5ND3vhur?=
 =?us-ascii?Q?XXZyQp2qGA29G1U6euiDwfkTp1mBU7BJHM8Z4yuCD9KUBA9ZbXaYVjAmiK+T?=
 =?us-ascii?Q?3TiLTAHPOTtKvYnqPfYylEy2I+subT0EEt4iI6gBx2tJw2W3cT1EG4Lw+ZKY?=
 =?us-ascii?Q?zS7Nhgf7TLHY/mFZtICor5o+sQhwDfYsZAq5M8qh12vMohim64kUlyqWiG82?=
 =?us-ascii?Q?RZUsEE8ZibFY+EJx08z3Aq7Y14vRNjZj4uDuMWHTLwD7TXgiVuwZjUST/ymk?=
 =?us-ascii?Q?Tw9V5RFZuwa5b7xDbbjh/pxoW1vA3VmWuwp8pHHbdPO9pviiw7xu0gBdGmWW?=
 =?us-ascii?Q?oId8iLg42HuUr7yCzBoeODczepYQvjrr0GDMG3KY50gvA7fgFYbDVODD4SFV?=
 =?us-ascii?Q?cdebNxWdPUvUpZs=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 03:21:57.9393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9470625-7cce-4206-74f1-08dd554b8fea
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_192217_220476_C35625EE 
X-CRM114-Status: GOOD (  16.10  )
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

On 25-02-24 15:06:19, Marcin Juszkiewicz wrote:
> > > > diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> > > > new file mode 100644
> > > > index 000000000000..d98735f782e0
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> > > > @@ -0,0 +1,264 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +/*
> > > > + * Copyright 2025 Cix Technology Group Co., Ltd.
> > > > + *
> > > > + */
> > > > +
> > > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > 
> > > [..]
> > > 
> > > > +     arch_timer: timer {
> > > > +             compatible = "arm,armv8-timer";
> > > > +             interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > > > +                          <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > > > +                          <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > > > +                          <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> > > > +             clock-frequency = <1000000000>;
> > > > +             interrupt-parent = <&gic>;
> > > > +             arm,no-tick-in-suspend;
> > > > +     };
> > > 
> > > This is not Arm v8.0 SoC so where is non-secure EL2 virtual timer?
> > 
> > It is the Arm v9 SoC and back compatible with Arm v8.
> 
> Arm SoC has several timer interrupts:
> 
> PPI 10: Non-secure EL2 physical timer interrupt
> PPI 11: Virtual timer interrupt
> PPI 12: Non-secure EL2 virtual timer
> PPI 13: Secure physical timer interrupt
> PPI 14: Non-secure physical timer interrupt
> 
> You mention 10, 11, 13, 14 only like your SoC would be plain old Arm
> v8.0 one (Cortex-A53/A72).
> 
> Sky1 (CP/CA/CS8180) is Arm v9 so should also list PPI 12 which came with
> VHE (Virtualization host extensions) which is mandatory for each Arm cpu
> v8.1 or above (and is implemented in A520/A720 cores).

Thanks for mentioning it. I will add PPI 12 for v2 patch set.

-- 

Best regards,
Peter

