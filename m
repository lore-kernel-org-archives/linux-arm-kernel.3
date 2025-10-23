Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D453CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dS/kHyn2rSYrZDIWLh4sztc1+FksVkunul6FLLyz6VY=; b=lKYP4Qal5suuBMIosokX4R+XSI
	wakJKlA5VzL9zCQZsuZb5T1Go59v3d9F1bWsfHT6JuCdf9AD7vKiB67TPpRUOaYJseNAOFI0bIJ0e
	lh04UlS8SdqK4J/xtm+t/6kWKBzApNUup7oFXa+5l8FZ7w9XqS4otC4GqPjG0+9j+VWWIAhJiRq7D
	1V8SlP1z/BlrYd+XdKIQ6fQ8mHZxeflnYiwm04+/mbN7Gz2d2Lqt9pOSSmb0ueZ2BdWT7YXS3yEx/
	sYsVmn0ONXl5ei0ZWC4MZlomEdnC2Uo4xVPCp+3GApS4rdk2iFyc5cOIO0wqoGEPppB2CUTqioqUS
	tcQVQgsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByMg-00000006vlZ-2gQs;
	Thu, 23 Oct 2025 16:40:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByMc-00000006vkj-12J8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 16:40:36 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cssDh5Wmgz6L57c;
	Fri, 24 Oct 2025 00:39:00 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id D77761400CB;
	Fri, 24 Oct 2025 00:40:28 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Oct
 2025 17:40:27 +0100
Date: Thu, 23 Oct 2025 17:40:26 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Conor Dooley <conor@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas
	<catalin.marinas@arm.com>, <linux-cxl@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Dan Williams <dan.j.williams@intel.com>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
	<james.morse@arm.com>, Will Deacon <will@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>, Dave Jiang <dave.jiang@intel.com>, Arnd Bergmann
	<arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH v4 0/6] Cache coherency management subsystem
Message-ID: <20251023174026.00005b42@huawei.com>
In-Reply-To: <20251022-harsh-juggling-2d4778b0649e@spud>
References: <20251022113349.1711388-1-Jonathan.Cameron@huawei.com>
	<20251022122241.d2aa0d7864f67112aa7691bf@linux-foundation.org>
	<20251022-harsh-juggling-2d4778b0649e@spud>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_094034_644594_5D1D7F5C 
X-CRM114-Status: GOOD (  30.30  )
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

On Wed, 22 Oct 2025 21:47:21 +0100
Conor Dooley <conor@kernel.org> wrote:

> On Wed, Oct 22, 2025 at 12:22:41PM -0700, Andrew Morton wrote:
> > On Wed, 22 Oct 2025 12:33:43 +0100 Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> >   
> > > Support system level interfaces for cache maintenance as found on some
> > > ARM64 systems. This is needed for correct functionality during various
> > > forms of memory hotplug (e.g. CXL). Typical hardware has MMIO interface
> > > found via ACPI DSDT.
> > > 
> > > Includes parameter changes to cpu_cache_invalidate_memregion() but no
> > > functional changes for architectures that already support this call.  
> > 
> > I see additions to lib/ so presumably there is an expectation that
> > other architectures might use this.
> > 
> > Please expand on this.  Any particular architectures in mind?  Any
> > words of wisdom which maintainers of those architectures might benefit
> > from?  
> 
> It seems fairly probable that we're gonna end up with riscv systems
> where drivers are being used for both this and the existing non-standard
> cache ops stuff.
> 
> > > How to merge?  When this is ready to proceed (so subject to review
> > > feedback on this version), I'm not sure what the best route into the
> > > kernel is. Conor could take the lot via his tree for drivers/cache but
> > > the generic changes perhaps suggest it might be better if Andrew
> > > handles this?  Any merge conflicts in drivers/cache will be trivial
> > > build file stuff. Or maybe even take it throug one of the affected
> > > trees such as CXL.  
> > 
> > Let's not split the series up.  Either CXL or COnor's tree is fine my
> > me.  
> 
> CXL is fine by me, greater volume there probably by orders of magnitude.
> 

On CXL discord, some reasonable doubts were expressed about justifying
this to Linus via CXL. Which is fair given tiny overlap from a 'where
the code is' point of view and also it seems I went too far in trying to
avoid people interpreting this as affecting x86 systems (see earlier
versions for how my badly scoped cover letter distracted from what this
was doing) and focus in on what was specifically being enabled rather
than the generic bit. Hence it mentions arm64 only right now and right
at the top of the cover letter.

Given it's not Arm architecture (hence just one Kconfig line in Arm
specific code) I guess alternative is back to drivers/cache and Conor which
I see goes via SoC (so +CC SoC tree maintainers).

Given there will be a v5 I'll rewrite the cover letter to make it less
specific whilst still calling out that for now the only driver happens to
be in an Arm SoC. Will leave some time for additional review first though!

Thanks,

Jonathan





