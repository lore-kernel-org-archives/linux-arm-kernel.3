Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB38C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pCacE+xisYPcsgdv3+TM1VMm0lKFuw1VC2E+x/ru66M=; b=WDpGhxpC0fteICEzIfBk7JpN7z
	qr4eNDyutVfn9gaVyTzYgACLCeKxYFzYZ+2DlEoWgViY7CuUyh2QBcp2tY/0SJqp9zHB9qs+1eNve
	mY8SQXUZivabFUgJ7L5uUUJb/lyYLwbPuo71vP94B2DO4Ou6AkP4uSmUTSMYfT65/diTe91+OBbIm
	zaWAHwDfwrtLVMP4RgtAD5IVG2nwGcIQRukCYW3KLPD5H/f16ddmImKb9aY5PUg+x8V6wVIcBO1Rs
	lC/yOFrO4FpyyfTpSvDDZR4iChCN8LBvAAky+fqMFT8qxBawaDpdzsTxEiHc7HNa8fe0ky2iVjUX0
	a+nTLsHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twl5d-00000003iaG-3Ab8;
	Mon, 24 Mar 2025 16:55:53 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twl3u-00000003iLo-1xGG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742835246; x=1774371246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dE6Zd6Ph+/ryHeQLLazfSBwNRaC6LfUCJ2aoR2M+tDQ=;
  b=QhOKekUINcKM/BiQtaOrPni0qQ0+aprMmu+2SLx9iOoe2ERL3Mga3Tnj
   CGaL+Qvwm/FlkpfyQ2fAlQgSZW5WdU/v0vkBHT/prU/IJR3BGfzpVoUp3
   lcmPgaBtSi1u6lVUHfkitylVO1t9+ms0plU1vfRV69Q7LY24DhZhrtD4J
   /uCFhw3LofI1MsQrgxXqBKgvp7I4gQ1P8vWfBoPpe5TsxMApHNS/YhEFJ
   wKZmMNRAWwZy88i/NQ6MRoy6S+MbG+RPeSrK9qZzCledNVqnYi885ekWi
   A0xDH/wgGVgRvxbtJxUEmxpR66KZr2X9UbF+bRA7DE3LaisQcv1rBC+aM
   g==;
X-CSE-ConnectionGUID: 6fuGFQoWRQKo0pHCSsY5cA==
X-CSE-MsgGUID: +Uwf/hGPTtikY61wNYo5yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61444871"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="61444871"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 09:54:04 -0700
X-CSE-ConnectionGUID: y2R8TjF9T0uyVt27GhllBQ==
X-CSE-MsgGUID: cDQOi4IQR9e/FuSVLgSLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="124891128"
Received: from agluck-desk3.sc.intel.com (HELO agluck-desk3) ([172.25.222.70])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 09:54:05 -0700
Date: Mon, 24 Mar 2025 09:54:02 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
	Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH v13 2/5] arm64: add support for ARCH_HAS_COPY_MC
Message-ID: <Z-GOKgBNxKWQ21w4@agluck-desk3>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-3-tongtiangen@huawei.com>
 <Z6zKfvxKnRlyNzkX@arm.com>
 <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <df40840d-e860-397d-60bd-02f4b2d0b433@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_095406_568978_FBEAB327 
X-CRM114-Status: GOOD (  35.09  )
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

On Fri, Feb 14, 2025 at 09:44:02AM +0800, Tong Tiangen wrote:
> 
> 
> 在 2025/2/13 0:21, Catalin Marinas 写道:
> > (catching up with old threads)
> > 
> > On Mon, Dec 09, 2024 at 10:42:54AM +0800, Tong Tiangen wrote:
> > > For the arm64 kernel, when it processes hardware memory errors for
> > > synchronize notifications(do_sea()), if the errors is consumed within the
> > > kernel, the current processing is panic. However, it is not optimal.
> > > 
> > > Take copy_from/to_user for example, If ld* triggers a memory error, even in
> > > kernel mode, only the associated process is affected. Killing the user
> > > process and isolating the corrupt page is a better choice.
> > 
> > I agree that killing the user process and isolating the page is a better
> > choice but I don't see how the latter happens after this patch. Which
> > page would be isolated?
> 
> The SEA is triggered when the page with hardware error is read. After
> that, the page is isolated in memory_failure() (mf). The processing of
> mf is mentioned in the comments of do_sea().
> 
> /*
>  * APEI claimed this as a firmware-first notification.
>  * Some processing deferred to task_work before ret_to_user().
>  */
> 
> Some processing include mf.
> 
> > 
> > > Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
> > > that can recover from memory errors triggered by access to kernel memory,
> > > and this fixup type is used in __arch_copy_to_user(), This make the regular
> > > copy_to_user() will handle kernel memory errors.
> > 
> > Is the assumption that the error on accessing kernel memory is
> > transient? There's no way to isolate the kernel page and also no point
> > in isolating the destination page either.
> 
> Yes, it's transient, the kernel page in mf can't be isolated, the
> transient access (ld) of this kernel page is currently expected to kill
> the user-mode process to avoid error spread.
> 
> 
> The SEA processes synchronization errors. Only hardware errors on the
> source page can be detected (Through synchronous ld insn) and processed.
> The destination page cannot be processed.

I've considered the copy_to_user() case as only partially fixable. There
are lots of cases to consider:

1) Many places where drivers copy to user in ioctl(2) calls. 
   Killing the application solves the immediate problem, but if
   the problem with kernel memory is not transient, then you
   may run into it again.

2) Copy from Linux page cache to user for a read(2) system call.
   This one is a candidate for recovery. Might need help from the
   file system code. If the kernel page is a clean copy of data in
   the file system, then drop this page and re-read from storage
   into a new page. Then resume the copy_to_user().
   If the page is modified, then need some file system action to
   somehow mark this range of addresses in the file as lost forever.
   First step in tackling this case is identifying that the source
   address is a page cache page.

3) Probably many other places where the kernel copies to user for
   other system calls. Would need to look at these on a case by case
   basis. Likely most have the same issue as ioctl(2) above.

-Tony

