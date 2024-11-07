Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867F6D4335A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 12:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+UmpOQw8zuRGya0xzGUDJxvT1+Zri4pO+UBWJC150Dk=; b=FyJFTHBrupV6jMuf7g4r2Tm6Of
	Stt1JVhLk42Pp1UisNWeWQe5J5KUVTHBk8a3JuADn7/HFuwUbuygmEusRMtK8Ufydus9ytTX2646X
	/Nj60unsJ7rVsxcAGrRlGiduQJAG/6IOiW+PmCgcDqdFzwfToQc9qfjgLomAjekgLw6tt2ETSFXaI
	eyiPXRkSKANJbfws6Ds/ZD1kNpK6i603k51tnAeUiQIPSC+uoz2Apo5+Hb5bAa5tdm3QGTlXABo4W
	xt2Y5/3l4T9DsSOU2GV6xaachUHGMsUuTRxyHKEXUyEWPII3kfMXl6JF9bFaYCpeFb8aexU6jpz8b
	Nu+9WMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t91lN-00000006x9u-3PEs;
	Thu, 07 Nov 2024 12:37:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t91jc-00000006wss-3R4k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 12:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6E5345C584D;
	Thu,  7 Nov 2024 12:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21F6EC4CECC;
	Thu,  7 Nov 2024 12:35:32 +0000 (UTC)
Date: Thu, 7 Nov 2024 12:35:26 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Greg Marsden <greg.marsden@oracle.com>,
	Ivan Ivanov <ivan.ivanov@suse.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Miroslav Benes <mbenes@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
Message-ID: <Zyy0DpOIu63isKZR@arm.com>
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <ZyPxhF34JjT3Ky9K@arm.com>
 <083d9e98-b6b8-4702-a700-24aea95cef9e@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <083d9e98-b6b8-4702-a700-24aea95cef9e@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_043537_048088_BAAAD90A 
X-CRM114-Status: GOOD (  28.24  )
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

On Wed, Nov 06, 2024 at 11:37:58AM +0000, Ryan Roberts wrote:
> On 31/10/2024 21:07, Catalin Marinas wrote:
> > So, first of all, I'd like to understand the overall maintainability
> > impact better. I assume you tested mostly defconfig. If you run an
> > allmodconfig build with make -k, how many build failures do you get with
> > this patchset? Similarly for some distro configs.
> 
> I've roughly done:
> 
>     make alldefconfig &&
>         ./scripts/config --enable CONFIG_ARM64_BOOT_TIME_PAGE_SIZE &&
> 	make -s -j`nproc` -k &> allmodconfig.log

Is it alldefconfig or allmodconfig? The former has a lot less symbols
enabled than even defconfig (fairly close to allnoconfig actually):

$ make defconfig
$ grep -v "^#\|^$" .config | wc -l
4449

$ make alldefconfig
$ grep -v "^#\|^$" .config | wc -l
713

$ make allmodconfig
$ grep -v "^#\|^$" .config | wc -l
14401

> In the end, I decided to go for r'(\S+\.[ch]):.*(error|note):', which is any
> files described as having an error or being the callsite of the thing with the
> error. I think this is likely most accurate from eyeballing the log:

I think that's good enough to give us a rough idea.

> |            |     C&H files | percentage of |
> | directory  |      w/ error | all C&H files |
> |------------|---------------|---------------|
> | arch/arm64 |             7 |          1.3% |
> | drivers    |           127 |          0.4% |
> | fs         |            25 |          1.1% |
> | include    |            27 |          0.4% |
> | init       |             1 |          8.3% |
> | kernel     |             7 |          1.3% |
> | lib        |             1 |          0.2% |
> | mm         |             6 |          3.2% |
> | net        |             7 |          0.4% |
> | security   |             2 |          0.8% |
> | sound      |            21 |          0.8% |
> |------------|---------------|---------------|
> | TOTAL      |           231 |          0.4% |
> |------------|---------------|---------------|

This doesn't look that bad _if_ you actually built most modules. But if
it was alldefconfig, you likely missed the majority of modules.

> > Do we have any better way to detect this other than actual compilation
> > on arm64? Can we hack something around COMPILE_TEST like redefine
> > PAGE_SIZE (for modules only) to a variable so that we have a better
> > chance of detecting build failures when modules are only tested on other
> > architectures?
> 
> I can certainly look into this. But if the concern is that drivers are not being
> compiled against arm64, what is the likelyhood of them being compiled against
> COMPILE_TEST?

Hopefully some CIs out there catching them. Well, if we are to fix them
anyway, we might as well eventually force a non-const PAGE_SIZE
generically even if it returns a constant.

I'm building allmod now with something like below (and some hacks in
arch and core code to use STATIC_PAGE_* as I did not apply your
patches). alldefconfig passes with my hacks but, as you can see, the
non-const PAGE_SIZE kicks in only if MODULE is defined. So, not an
accurate test, just to get a feel of the modules problem.

----------8<---------------------------
diff --git a/arch/arm64/include/asm/page-def.h b/arch/arm64/include/asm/page-def.h
index 792e9fe881dc..71a761f86b15 100644
--- a/arch/arm64/include/asm/page-def.h
+++ b/arch/arm64/include/asm/page-def.h
@@ -12,7 +12,19 @@
 
 /* PAGE_SHIFT determines the page size */
 #define PAGE_SHIFT		CONFIG_PAGE_SHIFT
-#define PAGE_SIZE		(_AC(1, UL) << PAGE_SHIFT)
+#define STATIC_PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
+#define STATIC_PAGE_MASK	(~(STATIC_PAGE_SIZE-1))
+
+#if !defined(MODULE) || defined(__ASSEMBLY__)
+#define PAGE_SIZE		STATIC_PAGE_SIZE
+#else
+static inline unsigned long __runtime_page_size(void)
+{
+	return 1UL << PAGE_SHIFT;
+}
+#define PAGE_SIZE		(__runtime_page_size())
+#endif
+
 #define PAGE_MASK		(~(PAGE_SIZE-1))
 
 #endif /* __ASM_PAGE_DEF_H */
----------8<---------------------------

-- 
Catalin

