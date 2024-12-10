Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F625E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nPD5E4Ad4U+hhhI8VaXA17x9Czn/JwL4gk7ChKoSXc=; b=ssYzn8asjA4fbhS5+7Iodu2mPY
	KLq7BwGE6cH9VJ9bRz2QgprgiNJh8pQztviJ1jgHACVFjt9FeD9GVEyQx+Gj8JA78JjL087SFSNML
	tyfcG58gqI0b4gpbjquURHYAWcmmW8UW0KC4Pu35DTN9mQvxvyhRzp0vNTXVSNy5mJAThcBjGJpNx
	ngkMjIT/ApbueFeORaDem9yqKiClALDRhbpv/Bv1AYLqt0VpMlidvM4UjcaAt6VpAJA0Zx70Uaj3t
	3bLFiD2b4mONjKEcCrlST8GpHW0hhVbwP6mhCsqa9a3ed3NhZ8ffV+KhfbfIDklNd6taEH+OOl9Lx
	f+zabLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0HM-0000000BZvN-1YME;
	Tue, 10 Dec 2024 13:27:56 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0GI-0000000BZge-3fjT;
	Tue, 10 Dec 2024 13:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733837211; x=1765373211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o3FwI02N8aqXF4xZIrONk/VReti3pvSzpyqhoYtREr8=;
  b=IU94MwaLjRlfL7KjYwzpTGb8uK/bXra7dA2rfR0H26kn1pnKnJ2fCH6j
   HVPaUA8N2bzY8GDeJ+nTvpQXHbIUiUcWnw7Ajh3eB+ufWI+Q4wo+bWUh6
   SDj0uzaZqsZ4MO1VxPIt76OxPmqkk+JA1VynyPisHHXBrDALvohIIhFO0
   J2e+wM6n34J7xzjrMQdahGsrXMUH7QAl+aJBfz5l8fE7Fo2DdX1aOq3Li
   WYGNW0MY9k9vgPSQz8XUKk1OPtyFq3mrBKktqjpVMJ8VZDxLAk0giGMLL
   xNPjXHf0H18wG/kt356AqDlHP9EmWdXkyjRacDvMMLyxLuB2kk+6lg+h6
   A==;
X-CSE-ConnectionGUID: Cpm6pNTuTtykbdmHp2oVQQ==
X-CSE-MsgGUID: 027vLAGdQLa++3529Zt4MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37864859"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="37864859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 05:26:49 -0800
X-CSE-ConnectionGUID: tUiZTf8LRc6BazYMUocLhA==
X-CSE-MsgGUID: MAqDFBXxQs2A/WQFrE0SGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95750103"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 10 Dec 2024 05:26:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 0FF4D26B; Tue, 10 Dec 2024 15:26:40 +0200 (EET)
Date: Tue, 10 Dec 2024 15:26:40 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Borkmann <daniel@iogearbox.net>, 
	Eric Chan <ericchancf@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv2 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <bz3vlh3lri7yfckdkddopwhsgvkmizhw5q6ecomgeba7q22ufp@ntu2kugiho4o>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
 <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
 <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121114952.GCZz8eYEVa3yubYQzO@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_052650_965219_26F297A9 
X-CRM114-Status: GOOD (  26.93  )
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

On Thu, Nov 21, 2024 at 12:49:52PM +0100, Borislav Petkov wrote:
> On Tue, Nov 19, 2024 at 10:21:05AM +0200, Kirill A. Shutemov wrote:
> > Sure, we can workaround every place that touches such ranges.
> 
> Every place? Which every place? I thought this is only an EISA issue?

I looked at other places where we call memremap(MEMREMAP_WB) such as
acpi_wakeup_cpu(). We actually get encrypted/private mapping for this
callsite despite __ioremap_caller() being called encrypted == false.
This happens because of IORES_MAP_ENCRYPTED check in __ioremap_caller().

So we depend on the BIOS here. The EISA problem happens because the
target memory is in !IORES_MAP_ENCRYPTED memory.

It's hard to say if any other memremap(MEMREMAP_WB) would trigger the
issue. And what will happen after next BIOS update.

> Then clearly your changelogs need to expand considerably more what we're
> *really* addressing here.
> 
> > Or we can address problem at the root and make creating decrypted/shared
> > mappings explicit.
> 
> What is the problem? That KVM implicitly converts memory to shared? Why does
> KVM do that an can it be fixed not to?
> 
> Doesn't sound like the guest's problem.

Well, the problem is on the both sides.

VMM behaviour on such accesses is not specified in any spec. AFAIK all
current VMM implementations do this implicit conversion.

I think it has to be fixed. VMMs (not only KVM) should not silently
convert memory to shared. But VMMs cannot make memory access to go away.
The only option they have is to inject #VE instead indicating bogus
access. At this point it becomes a guest problem.

It will get fixed in VMMs naturally when TDX Connect gets enabled.
With a secure device assigned to a TD, VMM would loose the ability to
convert memory on its own. The guest would have to unlock the memory
first. This will make implicit conversion impossible.

But it also means guest should never initiate shared access without
explicit conversion. Otherwise #VE will crash it.

> Or maybe this needs a lot more explanation what we're fixing here.
> 
> > Such mappings have both functional (as we see here) and security
> > implications (VMM can manipulate the guest memory range). We should not
> > create decrypted mappings by default on legacy interfaces.
> 
> So we're getting closer.
> 
> The changes themselves are fine but your text is missing a lot about what
> we're fixing here. When I asked, I barely scratched the surface. So can we
> elaborate here pls?

What about this:

x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default

Currently memremap(MEMREMAP_WB) can produce decrypted/shared mapping:

memremap(MEMREMAP_WB)
  arch_memremap_wb()
    ioremap_cache()
      __ioremap_caller(.encrytped = false)

In such cases, the IORES_MAP_ENCRYPTED flag on the memory will determine
if the resulting mapping is encrypted or decrypted.

Creating a decrypted mapping without explicit request from the caller is
risky:

  - It can inadvertently expose the guest's data and compromise the
    guest.

  - Accessing private memory via shared/decrypted mapping on TDX will
    either trigger implicit conversion to shared or #VE (depending on
    VMM implementation).

    Implicit conversion is destructive: subsequent access to the same
    memory via private mapping will trigger a hard-to-debug #VE crash.

The kernel already provides a way to request decrypted mapping
explicitly via the MEMREMAP_DEC flag.

Modify memremap(MEMREMAP_WB) to produce encrypted/private mapping by
default unless MEMREMAP_DEC is specified.

This change fixes the crash on kexec in TDX guests if CONFIG_EISA is
enabled.
 
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

