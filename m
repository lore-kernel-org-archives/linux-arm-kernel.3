Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32483CE7B01
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bYaLI7QAmVU7GiJU7z+IdGgZ2/O58hzIGFV/EOmiGRU=; b=V9VFK0BzyQNWed1iOdC7kqt3Qe
	7C1Z98fe/NoKeRhIbOuupn+6FLCfr+DEiqjO1d6LVOOq2SgN6ICLtad26JtZe1HA4B0jWrFHA43Gp
	fkvUnE1/+FXhneMlQquCilk/jK6lVJULpyPx4UxWY52UGrtG+0YgYjLj1zjVikYJLZWFZbs7iJoBz
	g2VQiKSnZwvBNY/SGv5KmIzRtf8P40FycBu96sUzaVaDYAY8FRgnq7O2064XxnEKKNsvuWelhgPDu
	nq4gezmapofW6FMmkgSghFZnLOPvQrKHXQgjLib30rronRbzLv/KuGlLawztw553i/jzBcU/TM4Vt
	xraoswXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtFq-0000000CDDT-1oRe;
	Fri, 14 Nov 2025 12:50:18 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJtFn-0000000CDBz-3TpC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:50:17 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4d7H5d6tbYzJ46jg;
	Fri, 14 Nov 2025 20:49:25 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id AECB714033C;
	Fri, 14 Nov 2025 20:50:01 +0800 (CST)
Received: from localhost (10.126.173.232) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 14 Nov
 2025 12:50:00 +0000
Date: Fri, 14 Nov 2025 12:49:58 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Conor Dooley <conor@kernel.org>
CC: <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>, Dan Williams
	<dan.j.williams@intel.com>, "H . Peter Anvin" <hpa@zytor.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
	Drew Fustini <fustini@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, <james.morse@arm.com>, Will Deacon <will@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v5 0/6]  Cache coherency management subsystem
Message-ID: <20251114124958.00006a85@huawei.com>
In-Reply-To: <20251108-spearmint-contend-aa3dd8a0220e@spud>
References: <20251031111709.1783347-1-Jonathan.Cameron@huawei.com>
	<20251108-spearmint-contend-aa3dd8a0220e@spud>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.173.232]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_045016_018768_DE71D241 
X-CRM114-Status: GOOD (  21.92  )
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

On Sat, 8 Nov 2025 20:02:52 +0000
Conor Dooley <conor@kernel.org> wrote:

> Arnd,
> 
> On Fri, Oct 31, 2025 at 11:17:03AM +0000, Jonathan Cameron wrote:
> > Support system level interfaces for cache maintenance as found on some
> > ARM64 systems. It is expected that systems using other CPU architectures
> > (such as RiscV) that support CXL memory and allow for native OS flows
> > will also use this. This is needed for correct functionality during
> > various forms of memory hotplug (e.g. CXL). Typical hardware has MMIO
> > interface found via ACPI DSDT. A system will often contain multiple
> > hardware instances.
> > 
> > Includes parameter changes to cpu_cache_invalidate_memregion() but no
> > functional changes for architectures that already support this call.
> > 
> > How to merge?
> > - Current suggestion would be via Conor's drivers/cache tree which routes
> >   through the SoC tree.  
> 
> I was gonna put this in linux-next, but I'm not really sure that Arnd
> was satisfied with the discussion on the previous version about
> suitability of the directory: https://lore.kernel.org/all/20251028114348.000006ed@huawei.com/
> 
> Arnd, did that response satisfy you, or nah?

Seems Arnd is busy.  Conor, if you are happy doing so, maybe push it to a tree
linux-next picks up, but hold off on the pull request until Arnd has had a chance
to reply?

Jonathan

> 
> Cheers,
> Conor.
> 
> >   *  Andrew Morton has expressed he is fine with the MM related changes
> >      going via another appropriate tree.
> >   *  CXL maintainers expressed that they don't consider it appropriate
> >      to go through theit tree.
> >   *  The tiny touching of Arm specific code has an ack from Catalin.  
> 


