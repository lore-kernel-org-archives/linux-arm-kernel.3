Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB77CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KPKvmG5AKPtCKB/OTWjImN0Se1vJ3USQUbT38AoLOI=; b=qXhJ5CZW4iEHk9c5shVkkgB5cy
	e1CtkOSJ7UIDswRHy2lSRKannZLGgPlSQjzBAVKc+/vwVVImsI3zKiE1dMr3ehal/xQG13C1NwlGa
	VSCzEFlIpWUMZs3Lw8NZ2P5ltymUf/T0NKbuIjPqb/Jj+rXNufh4aLLY05uFcrhQ50P2s6eOC+O0g
	MrnrWehGQwQ8xVww5LbQSLKO+lWaOV/VYou3Ru6HT++CnZPtTpw7rrSg6AxUk2W0i8vlzcdx0faiw
	jWh6fun+KR7hMjh4wkzDhbXPvLyfBDjOebJwTDRyoz3lV/vACUumiajxNIyBGzPRieoMHs5W0dkIK
	HB3BT+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29ra-00000002BqS-3wDc;
	Fri, 26 Sep 2025 14:55:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29rY-00000002Bng-1owp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:55:57 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cYDD06v2Wz6L4vW;
	Fri, 26 Sep 2025 22:55:44 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9DF77140373;
	Fri, 26 Sep 2025 22:55:46 +0800 (CST)
Received: from localhost (10.47.75.77) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 26 Sep
 2025 15:55:44 +0100
Date: Fri, 26 Sep 2025 15:55:43 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 07/29] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
Message-ID: <20250926155543.00005de0@huawei.com>
In-Reply-To: <9982847d-2878-4748-8c65-2d98a2e47396@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-8-james.morse@arm.com>
	<20250911143544.000026aa@huawei.com>
	<9982847d-2878-4748-8c65-2d98a2e47396@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.77]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_075556_621416_A221BF57 
X-CRM114-Status: GOOD (  15.85  )
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


> >> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> >> new file mode 100644
> >> index 000000000000..7c63d590fc98
> >> --- /dev/null
> >> +++ b/drivers/resctrl/mpam_internal.h
> >> @@ -0,0 +1,65 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +// Copyright (C) 2025 Arm Ltd.
> >> +
> >> +#ifndef MPAM_INTERNAL_H
> >> +#define MPAM_INTERNAL_H
> >> +
> >> +#include <linux/arm_mpam.h>
> >> +#include <linux/cpumask.h>
> >> +#include <linux/io.h>
> >> +#include <linux/mailbox_client.h>
> >> +#include <linux/mutex.h>  
> > 
> > spinlock.h  
> 
> Fixed,
> 
> 
> >> +#include <linux/resctrl.h>  
> > 
> > Not spotting anything rsctl yet.  So maybe this belongs later.  
> 
> There shouldn't be anything that depends on resctrl in this series - looks like
> this is a 2018 era bug in the way I carved this up!
> 
> 
> >> +#include <linux/sizes.h>
> >> +
> >> +struct mpam_msc {
> >> +	/* member of mpam_all_msc */
> >> +	struct list_head        all_msc_list;
> >> +
> >> +	int			id;  
> > 
> > I'd follow (approx) include what you use principles to make later header
> > shuffling easier. So a forward def for this.  
> 
> -ENOPARSE
> 
> I'm sure I'll work this out from your later comments.

I missed on the comment (I think). Would have made more sense a line later.
Add a forwards def

struct platform_device;

as no reason to include the appropriate header
(and you didn't anwyay).




