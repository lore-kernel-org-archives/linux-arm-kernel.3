Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A8DC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hz2Y2XXBlVSsD0ujhohRc4qeLOJqXVC+eP3fnFk9s0g=; b=F6ukdr3fGKSIioSmWGNuZ/7Zen
	kMctQbNBJa5oA8L23AhWvWlq1CCdIkCzsRQEeaOkFy6Dz8noqliGPN0MKwNZck7OQDfO66RuWX8ZZ
	pm8BgZ1N77/+O+1n8l3MZwOOJ/Dy05Xt191Nlp//SkzfTB7ki821zgvjcXhlRKxuw5ekW4yBALGkJ
	QpCyYgLZQW3x9NJ2nEFPtondGhpD1KEFeJacGnT/ETye+PB3KNOPiaeGQkRkbJjqTtdcBn3Q9/5GK
	ROCowJ6GVkUAQ6706A9C2QQpcnDy2TykrZu2bx2NXKruvciFFMCzO3a419PO7Y6yNOeHdw4NFgNZ6
	TgrmDJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCbi-0000000EhZS-03Aj;
	Fri, 11 Jul 2025 12:12:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCLE-0000000Efn1-1naY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 11:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hz2Y2XXBlVSsD0ujhohRc4qeLOJqXVC+eP3fnFk9s0g=; b=Ma+kMwoRUayj63gy9rQQguidj9
	wphJ7eda0MlFguC49cDfOKQSX3X9zDDudhC+Vr7s6koMd1FiJFY9mrB1bOG9QNfXvtcd3CiUQd++Q
	1GAM5siBDSFuswDAnVHgO0gSO8yGWVM1gCVlb2L0wnMvPBrIuTfBbgc39lSK61JjCfJsP4d8iAj1e
	xLlCHBkP3/fuqqZMGRO6ht9kVXhvknBGtc0r5kQOG/oFbsMnmYKWNF8c6Wm1BMI9RNRF8DmucfkcE
	IDIvPg/1ZaMmqhpkulV7rnN3614w4vvlqe5IwZ2gW/cOf5t9ksbJQvDWKqP5L4DaUolH8RgOMa+wS
	i7P2Wmiw==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaCLB-00000009Fq3-2ZLa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 11:54:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdqml1fHPz6L52V;
	Fri, 11 Jul 2025 19:51:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3542B1402EF;
	Fri, 11 Jul 2025 19:54:37 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 13:54:36 +0200
Date: Fri, 11 Jul 2025 12:54:34 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <dan.j.williams@intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, <gregkh@linuxfoundation.org>, Will Deacon
	<will@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Yicong Yang
	<yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, H Peter Anvin
	<hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>
Subject: Re: [PATCH v2 1/8] memregion: Support fine grained invalidate by
 cpu_cache_invalidate_memregion()
Message-ID: <20250711125434.000050f3@huawei.com>
In-Reply-To: <686eedb25ed02_24471002e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250624154805.66985-1-Jonathan.Cameron@huawei.com>
	<20250624154805.66985-2-Jonathan.Cameron@huawei.com>
	<686eedb25ed02_24471002e@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_125457_777930_1664D3FB 
X-CRM114-Status: GOOD (  20.34  )
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

On Wed, 9 Jul 2025 15:31:14 -0700
<dan.j.williams@intel.com> wrote:

> Jonathan Cameron wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Extend cpu_cache_invalidate_memregion() to support invalidate certain
> > range of memory. Control of types of invlidation is left for when  
> 
> s/invlidation/invalidation/
> 
> > usecases turn up. For now everything is Clean and Invalidate.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> > ---
> >  arch/x86/mm/pat/set_memory.c | 2 +-
> >  drivers/cxl/core/region.c    | 6 +++++-
> >  drivers/nvdimm/region.c      | 3 ++-
> >  drivers/nvdimm/region_devs.c | 3 ++-
> >  include/linux/memregion.h    | 8 ++++++--
> >  5 files changed, 16 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > index 46edc11726b7..8b39aad22458 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -368,7 +368,7 @@ bool cpu_cache_has_invalidate_memregion(void)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
> >  
> > -int cpu_cache_invalidate_memregion(int res_desc)
> > +int cpu_cache_invalidate_memregion(int res_desc, phys_addr_t start, size_t len)
> >  {
> >  	if (WARN_ON_ONCE(!cpu_cache_has_invalidate_memregion()))
> >  		return -ENXIO;
> > diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> > index 6e5e1460068d..6e6e8ace0897 100644
> > --- a/drivers/cxl/core/region.c
> > +++ b/drivers/cxl/core/region.c
> > @@ -237,7 +237,11 @@ static int cxl_region_invalidate_memregion(struct cxl_region *cxlr)
> >  		return -ENXIO;
> >  	}
> >  
> > -	cpu_cache_invalidate_memregion(IORES_DESC_CXL);
> > +	if (!cxlr->params.res)
> > +		return -ENXIO;
> > +	cpu_cache_invalidate_memregion(IORES_DESC_CXL,
> > +				       cxlr->params.res->start,
> > +				       resource_size(cxlr->params.res));  
> 
> So lets abandon the never used @res_desc argument. It was originally
> there for documentation and the idea that with HDM-DB CXL invalidation
> could be triggered from the device. However, that never came to pass,
> and the continued existence of the option is confusing especially if
> the range may not be a strict subset of the res_desc.
> 
> Alternatively, keep the @res_desc parameter and have the backend lookup
> the ranges to flush from the descriptor, but I like that option less.
> 

I'll do that as a precursor so we can keep the discussion of that
vs the range being added separate.

Jonathan



