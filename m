Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF846C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHhT/9vCRjUN3YTO0u3ems5D9aA0HtvNCeJ9uyFGQTU=; b=yG7VvWimw6/yWCoEiflsra3kpr
	RHVzAIAl27JJO/Ods7DHey+mUEVnONKx1mwN28kmmrjIM/s7k2YEn529vCfopIqFxs9NGYqoEGzo5
	XdFGvEwEj7OGU8Pn/T1MX32Nk/KGVduBsR6zYRnLH9/80PK/8+ZhrD4+fKdznnAVhhTYgne5SouJG
	oJnxBCQpCAszvZNADb4KBOINbO0/BdHs+g7ewf5iVzhS+Rt1kB1V0kP9kjWxjz49K6Y8ufuLFFYw3
	1dXTGCFg6KdOXa8BzhMorce0TrZXqzk4b1PgbtPGamOg+i8K8NjWaIdnohLTtQIHVc3vlxV6x13jc
	SqfE4iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAFW-0000000HThR-1Zrq;
	Fri, 13 Jun 2025 19:39:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7zM-0000000H9Gb-1eW1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 17:14:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJmDQ068yz6L4wf;
	Sat, 14 Jun 2025 01:12:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C596214033C;
	Sat, 14 Jun 2025 01:14:36 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Jun
 2025 19:14:36 +0200
Date: Fri, 13 Jun 2025 18:14:34 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, <yangyicong@hisilicon.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<james.morse@arm.com>, <conor@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, <linux-mm@kvack.org>,
	<gregkh@linuxfoundation.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, "Dan Williams"
	<dan.j.williams@intel.com>
Subject: Re: [RFC PATCH 2/6] arm64: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20250613181434.00004e7e@huawei.com>
In-Reply-To: <64ae0e68-b025-4a33-9389-5393ee887fb4@huawei.com>
References: <20250320174118.39173-1-Jonathan.Cameron@huawei.com>
	<20250320174118.39173-3-Jonathan.Cameron@huawei.com>
	<Z-bo7AQ1h6VQr65V@arm.com>
	<64ae0e68-b025-4a33-9389-5393ee887fb4@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_101448_569462_2223B907 
X-CRM114-Status: GOOD (  19.03  )
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

On Sat, 29 Mar 2025 15:14:14 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> On 2025/3/29 2:22, Catalin Marinas wrote:
> > On Thu, Mar 20, 2025 at 05:41:14PM +0000, Jonathan Cameron wrote:  
> >> +struct system_cache_flush_method {
> >> +	int (*invalidate_memregion)(int res_desc,
> >> +				    phys_addr_t start, size_t len);
> >> +};  
> > [...]  
> >> +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
> >> +{
> >> +	guard(spinlock_irqsave)(&scfm_lock);
> >> +	if (!scfm_data)
> >> +		return -EOPNOTSUPP;
> >> +
> >> +	return scfm_data->invalidate_memregion(res_desc, start, len);
> >> +}  
> > 
> > WBINVD on x86 deals with the CPU caches as well. Even the API naming in
> > Linux implies CPU caches. IIUC, devices registering to the above on Arm
> > SoCs can only deal with system caches. Is it sufficient?
> >   
> 
> The device driver who register this method should handle this. If the
> hardware support maintaining the coherency among the system, for example
> on system cache invalidation the hardware is also able to invalidate the
> involved cachelines on all the subordinate caches (L1/L2/etc, by back
> invalidate snoop or other ways), then software don't need to invalidate
> the non-system cache explicitly. Otherwise the driver need to explicitly
> invalidate the non-system cache explicitly in their
> scfm_data::invalidate_memregion() method. Here in the generally code we
> simply don't know the capability of the hardware.

Coming to this a little late.  It would definitely be helpful to understand
whether other hardware implementations where this is relevant (e.g. CXL
capable systems) do require explicit flushes of the caches nearer the
CPU and any dance that they need in that case to ensure no race conditions
leave stale lines.

The PSCI spec (that never was) did allow for reporting that it was necessary
to stop all traffic prior to flushes, but that is crazy to support and
someone built the wrong system if they need to do that under even
vaguely normal software flows.

Jonathan
 
> 
> Thanks.
> 


