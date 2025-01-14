Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DDDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVEy4JRudpZCxZfDhXaG9w9JfoTpLaK//CCUuMYvpGo=; b=gLLfAyIYB/3mIK/XwE5voDF8lT
	ELNe8DwqQS/MmJ0etXWPfDGOCXMjddrI6l/Vf4A11DF5b0RIeiClkSykCRND3tPleGKgD0Im4GlpB
	ETcm9G0uY4u/lPlJPr89Ln42mW+kuPwapz8XrSPnEQTLTgNtCy2l5Ipn0CPapUYXkNDHJfANLSyM/
	8wxt9p93bM9eTCwR8Ahd8unLqivIau/Oah9+IhwHDVLowOuUVHdFgYIMklqek9ZCTw8PrIRNLDz5L
	VuP7Cq+7EDnzFSLZpI1hRZH5rTlh6nL99ZtCigEgxxn9JSBqNOyvmKVTMnwa+diHMnE5dNWyN9qcO
	mg/IRD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbM0-00000007fsa-0jtj;
	Tue, 14 Jan 2025 07:28:48 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXbKj-00000007fdp-3rGS;
	Tue, 14 Jan 2025 07:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736839650; x=1768375650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KJfe9nVlEn8D3imcOLIM2aumy8f4v35mSshgLI8XJhM=;
  b=Obz2uxCRSOwgqdek2YKqqa/JhqZG8VFFf0cwTy/fo9ggYWmTh9POZ9xc
   MPijPUiH/ghuFAFt+OJVhWK9ZYp+5Uz/jPr37ZJjtOhwLzt1VTWJ9XMQc
   gG/GREfRqxEGZjQsyofBpOViDWgc025S0TKvVMPszj2h1McWdTsxm3Uul
   gFF5g5oSBRwyN//wpuBE2qpqhjGWF3O1FxVjezAwMmuHeYYTg9dRCBshF
   lxbi6ci1y4JHnkXkqFrYCyz9mI+PV3POzyaZghuyAaTJ0/sdVGMpKXwZK
   WiQJSflzHyLptY+xUZIiA5clFHgyVmMoof8mF8qgzNBdvFf9fDtr9EQuE
   Q==;
X-CSE-ConnectionGUID: 52GIXBlUR6Ww2xd14NUzqg==
X-CSE-MsgGUID: bcuZrouOQR+LucTcHLudeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48505566"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="48505566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 23:27:27 -0800
X-CSE-ConnectionGUID: yfW+ptOYR5mGfoxEhg0Blg==
X-CSE-MsgGUID: lzW8z/BNT229n2J3J5ggdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="105286103"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2025 23:27:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 773212A6; Tue, 14 Jan 2025 09:27:18 +0200 (EET)
Date: Tue, 14 Jan 2025 09:27:18 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Andrea Parri <parri.andrea@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eric Chan <ericchancf@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Ashish Kalra <ashish.kalra@amd.com>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCHv3 2/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <vuj7mlvkvazuz5noupusqt2bk42vjkr5lkgivnrub2nby4ma6y@7ezpclbirwcs>
References: <20250113131459.2008123-1-kirill.shutemov@linux.intel.com>
 <20250113131459.2008123-3-kirill.shutemov@linux.intel.com>
 <1532becb-f2be-4458-5d34-77070f2c5e2d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1532becb-f2be-4458-5d34-77070f2c5e2d@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_232730_040323_7E9C01D8 
X-CRM114-Status: GOOD (  19.50  )
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

On Mon, Jan 13, 2025 at 02:47:56PM -0600, Tom Lendacky wrote:
> On 1/13/25 07:14, Kirill A. Shutemov wrote:
> > Currently memremap(MEMREMAP_WB) can produce decrypted/shared mapping:
> > 
> > memremap(MEMREMAP_WB)
> >   arch_memremap_wb()
> >     ioremap_cache()
> >       __ioremap_caller(.encrytped = false)
> > 
> > In such cases, the IORES_MAP_ENCRYPTED flag on the memory will determine
> > if the resulting mapping is encrypted or decrypted.
> > 
> > Creating a decrypted mapping without explicit request from the caller is
> > risky:
> > 
> >   - It can inadvertently expose the guest's data and compromise the
> >     guest.
> > 
> >   - Accessing private memory via shared/decrypted mapping on TDX will
> >     either trigger implicit conversion to shared or #VE (depending on
> >     VMM implementation).
> > 
> >     Implicit conversion is destructive: subsequent access to the same
> >     memory via private mapping will trigger a hard-to-debug #VE crash.
> > 
> > The kernel already provides a way to request decrypted mapping
> > explicitly via the MEMREMAP_DEC flag.
> > 
> > Modify memremap(MEMREMAP_WB) to produce encrypted/private mapping by
> > default unless MEMREMAP_DEC is specified.
> > 
> > Fix the crash due to #VE on kexec in TDX guests if CONFIG_EISA is enabled.
> 
> This patch causes my bare-metal system to crash during boot when using
> mem_encrypt=on:
> 
> [    2.392934] efi: memattr: Entry type should be RuntimeServiceCode/Data
> [    2.393731] efi: memattr: ! 0x214c42f01f1162a-0xee70ac7bd1a9c629 [type=2028324321|attr=0x6590648fa4209879]

Could you try if this helps?

diff --git a/drivers/firmware/efi/memattr.c b/drivers/firmware/efi/memattr.c
index c38b1a335590..b5051dcb7c1d 100644
--- a/drivers/firmware/efi/memattr.c
+++ b/drivers/firmware/efi/memattr.c
@@ -160,7 +160,7 @@ int __init efi_memattr_apply_permissions(struct mm_struct *mm,
 	if (WARN_ON(!efi_enabled(EFI_MEMMAP)))
 		return 0;
 
-	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB);
+	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB | MEMREMAP_DEC);
 	if (!tbl) {
 		pr_err("Failed to map EFI Memory Attributes table @ 0x%lx\n",
 		       efi_mem_attr_table);
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

