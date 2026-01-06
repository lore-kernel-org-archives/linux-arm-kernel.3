Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C92DCD0423
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CN7KZGAJri01RyIh84Ofz2JkJ0i16gitHzXHbOPDnw=; b=o65YQc8XQ6PnrLvp8KWddmgvzn
	PyUVFRNgGGHfYmhGyCWUcPgpR9xxb+brhT1HvQY2VVhx5sVm+FhVzqTWoTQMh+wk7wj10SSGwf/St
	Ixfr3148TiMWvB736RTP5ArrrTZYfE/QNhpbpAdeTnd9Qq43PSESRduIYbVxLjmLV3EDPEiSSpODO
	3GTE4/9XjQlRDRjIQA5k3BAEVkcqtzhLmMKLbPjnw1SwzkUYdlHwHPRHDW4d2eE4T0jyoaogvk2LP
	rHCMqmGac1vQxAJdUi6Ip+6d6G0KpIBiJwodLUD9qvsowUZHyQIAumezTBacuwvByuh+QkZUWhA/0
	ye0HD5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8CB-0000000DIsd-2xIf;
	Tue, 06 Jan 2026 14:38:04 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8C9-0000000DIsF-3COI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:38:02 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlv0L0LzDzJ46fN;
	Tue,  6 Jan 2026 22:37:54 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B743E4057F;
	Tue,  6 Jan 2026 22:37:55 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 14:37:54 +0000
Date: Tue, 6 Jan 2026 14:37:52 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 33/45] arm_mpam: resctrl: Allow resctrl to allocate
 monitors
Message-ID: <20260106143752.00000600@huawei.com>
In-Reply-To: <20251219181147.3404071-34-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-34-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_063801_968459_FFC5E425 
X-CRM114-Status: GOOD (  12.32  )
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

On Fri, 19 Dec 2025 18:11:35 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> When resctrl wants to read a domain's 'QOS_L3_OCCUP', it needs to allocate
> a monitor on the corresponding resource. Monitors are allocated by class
> instead of component.
> 
> MBM monitors are much more complicated, if there are enough monitors, they
> will be pre-allocated and free-running. If ABMC is in use instead then
> 'some' are pre-allocated in a different way, and need assigning.
> 
> Add helpers to allocate a CSU monitor. These helper return an out of range
> value for MBM counters.
> 
> Allocating a montitor context is expected to block until hardware resources

monitor

> become available. This only makes sense for QOS_L3_OCCUP as unallocated MBM
> counters are losing data.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> USE_RMID_IDX -> USE_PRE_ALLOCATED in comment
> Remove unnecessary arch_mon_ctx = NULL
As with some other patches, I'm not taking the time at this point to dig
into all the interactions with resctl as others will cover that much better
than me.

Too much to get done :( 

With that in mind.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

J

