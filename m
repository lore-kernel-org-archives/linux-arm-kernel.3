Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883D0CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BOW5hxTfLOmIVdIDox+jTV1yxmuQmFgSZvwUrdXBZ0=; b=kmbTbaZZ4HDgOin4JG8nS+tLLs
	f8yS/X+fkGZ/aqnCNgQQ1KaEBjcncKH0Iid+uBkRWVyNBKao2/D2hIb0+4ophbLmnECNFe4OCN40+
	vwnxnp+2+JolGjg5tG3CykiJYQZrDUZp7QFXQ+JgSDVrBZf6BxUJoqty/nBIOzdpon3FHdoeHVF42
	7TiFe4tVJW2vSdOc9J2KWtrKZAQ1jieba8Xvhk0emdiCQ3Af9OPlh/BMTAA9hHs8X1Z36VSgr8APk
	90AemmK4RB8gs2/frwMHen3T3JgBva+e4JKl2umb5A7ZlQ77dRH+N02LOTRyceY8iOHIzXdyLC8K9
	ubSUXiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtGS-000000062o3-3FQb;
	Thu, 23 Oct 2025 11:13:52 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtGP-000000062lN-3r5N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 11:13:51 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4csjx65rM2z6M4gf;
	Thu, 23 Oct 2025 19:10:02 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 42B8B140279;
	Thu, 23 Oct 2025 19:13:44 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Oct
 2025 12:13:43 +0100
Date: Thu, 23 Oct 2025 12:13:41 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Conor Dooley <conor@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <james.morse@arm.com>, Will Deacon
	<will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
	<linuxarm@huawei.com>, Yushan Wang <wangyushan12@huawei.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>, Andy Lutomirski <luto@kernel.org>, "Dave Jiang"
	<dave.jiang@intel.com>
Subject: Re: [PATCH v4 3/6] lib: Support
 ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
Message-ID: <20251023121341.0000765c@huawei.com>
In-Reply-To: <20251022-tried-alright-752fa98ff086@spud>
References: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
	<20251022113349.1711388-4-Jonathan.Cameron@huawei.com>
	<20251022-tried-alright-752fa98ff086@spud>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_041350_244298_6F59C15A 
X-CRM114-Status: GOOD (  26.77  )
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

On Wed, 22 Oct 2025 22:11:12 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Wed, Oct 22, 2025 at 12:33:46PM +0100, Jonathan Cameron wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION provides the mechanism for
> > invalidating certain memory regions in a cache-incoherent manner. Currently
> > this is used by NVDIMM and CXL memory drivers in cases where it is
> > necessary to flush all data from caches by physical address range.
> > 
> > In some architectures these operations are supported by system components
> > that may become available only later in boot as they are either present
> > on a discoverable bus, or via a firmware description of an MMIO interface
> > (e.g. ACPI DSDT). Provide a framework to handle this case.
> > 
> > Architectures can opt in for this support via
> > CONFIG_GENERIC_CPU_CACHE_MAINTENANCE
> > 
> > Add a registration framework. Each driver provides an ops structure and
> > the first op is Write Back and Invalidate by PA Range. The driver may
> > over invalidate.
> > 
> > An optional completion check operation is also provided. If present
> > that should be called to ensure that the action has finished.
> > 
> > When multiple agents are present in the system each should register with
> > this framework and the core code will issue the invalidate to all of them
> > before checking for completion on each. This is done to avoid need for
> > filtering in the core code which can become complex when interleave,
> > potentially across different cache coherency hardware is going on, so it
> > is easier to tell everyone and let those who don't care do nothing.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> I'm fine with this stuff. I do wonder though, have you actually
> encountered systems with the multiple "agents" or is that something
> theoretical?

Yes to multiple agents. There are a multiple instances in the HiSi platform.
The multiple heterogeneous agents case is more theoretical today.  Similar
components for other purposes are heterogeneous so I'd be surprised if it
doesn't surface at some point. Our initial internal driver for the
hisi_hha wrapped up the multiple instances in a fake front end, but it
meant we ended up with multiple levels of registration and it was just
simpler to relax assumption that they were all handled by one driver.

Jonathan



