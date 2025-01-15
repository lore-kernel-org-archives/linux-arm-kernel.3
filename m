Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13CF7C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uih6Mm4WhPDvLdwAv6reFJlC+wDDvlFzzNRYJIheL1s=; b=WegTQcTEq2/lURNoQO2L5Tn45e
	1NcEjAL72jrXzXeetgvTFwv/Jn4FmpGcc59IzRVjFU0kCD8P0WUbGJYHFMJovjVNICTQV6tXM0EQR
	9+RD5ryVsqYFucOAMHVj97KN6yrfWqeb4HxGfzvEehOOvAtu9JwXNhHBtbPgE/uMZ6bf/QAkuQqML
	ZPh99hv7d+vSL47FA2UoDrg2ez35YWrtrRYbnop6GCDjy1ndoMims3KT+xgHdJY0AyCU6OehpnrSg
	I32qu+2shWvybRAEaL9YiRLX3OCeyTldxQECojGtDxLrN4cD3mu3sO4y3gp4saDHOsGkL4oKl8m2F
	znPwU9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0bd-0000000BTuK-46OS;
	Wed, 15 Jan 2025 10:26:37 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0ZE-0000000BTHd-3dqb;
	Wed, 15 Jan 2025 10:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736936648; x=1768472648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mrQ1OaXlc6bMXEK7JY3n2o9PU+VRgTF8F5mJ7Od9uCc=;
  b=DsC0+g7YaecssPyiqH6B33KDH6Ql2mSefDFn2raA7mjsd3qe8iVNXgXV
   zZC6/U0jN/7gtcoJZ1/g//J9KpQd+9UugTRBfdhtJMPRGHFHgyqnCqrTK
   07wnQXdXTn1jPqiZfFRZUfcWi+bdjesy50/pcPTPc+R0KXKOcWLNitTLg
   ri3jbiPJkplrzbI8iZ4TUtWEzzqA/GS5vOh43k1J+1YOCTJnoUI0Uc2gi
   VNSRhrmrqentonZL6/EaN54Sd1XQPw4yjra1EYlM1ZD1WD7KMSRyvTWtO
   omYyWjWw1oBriabOwTELSMeIy13f78kalAySHX03mvPByhMiWOZjqgJS0
   w==;
X-CSE-ConnectionGUID: Z6a6yT27TR6oqbGZmLu/Hw==
X-CSE-MsgGUID: 3MtzdEzIQTig/CMZleXv6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="37145737"
X-IronPort-AV: E=Sophos;i="6.12,317,1728975600"; 
   d="scan'208";a="37145737"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 02:24:02 -0800
X-CSE-ConnectionGUID: GxpqY8wrS2qpNAwLOm9Oyg==
X-CSE-MsgGUID: eM68aTCeRJitcfICEUNamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135949783"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jan 2025 02:23:56 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id E2AA740B; Wed, 15 Jan 2025 12:23:54 +0200 (EET)
Date: Wed, 15 Jan 2025 12:23:54 +0200
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
Message-ID: <mvosqsybplnqfh6wadw5ue7u3plqnfo5ojusvaq6htzzhtfce2@bbgogdund3ho>
References: <ff8daeb1-4839-b070-dd94-a7692ac94008@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff8daeb1-4839-b070-dd94-a7692ac94008@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022408_961438_3E117270 
X-CRM114-Status: GOOD (  29.14  )
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

On Tue, Jan 14, 2025 at 10:54:53AM -0600, Tom Lendacky wrote:
> On 1/14/25 09:06, Tom Lendacky wrote:
> > On 1/14/25 08:44, Kirill A. Shutemov wrote:
> >> On Tue, Jan 14, 2025 at 08:33:39AM -0600, Tom Lendacky wrote:
> >>> On 1/14/25 01:27, Kirill A. Shutemov wrote:
> >>>> On Mon, Jan 13, 2025 at 02:47:56PM -0600, Tom Lendacky wrote:
> >>>>> On 1/13/25 07:14, Kirill A. Shutemov wrote:
> >>>>>> Currently memremap(MEMREMAP_WB) can produce decrypted/shared mapping:
> >>>>>>
> >>>>>> memremap(MEMREMAP_WB)
> >>>>>>   arch_memremap_wb()
> >>>>>>     ioremap_cache()
> >>>>>>       __ioremap_caller(.encrytped = false)
> >>>>>>
> >>>>>> In such cases, the IORES_MAP_ENCRYPTED flag on the memory will determine
> >>>>>> if the resulting mapping is encrypted or decrypted.
> >>>>>>
> >>>>>> Creating a decrypted mapping without explicit request from the caller is
> >>>>>> risky:
> >>>>>>
> >>>>>>   - It can inadvertently expose the guest's data and compromise the
> >>>>>>     guest.
> >>>>>>
> >>>>>>   - Accessing private memory via shared/decrypted mapping on TDX will
> >>>>>>     either trigger implicit conversion to shared or #VE (depending on
> >>>>>>     VMM implementation).
> >>>>>>
> >>>>>>     Implicit conversion is destructive: subsequent access to the same
> >>>>>>     memory via private mapping will trigger a hard-to-debug #VE crash.
> >>>>>>
> >>>>>> The kernel already provides a way to request decrypted mapping
> >>>>>> explicitly via the MEMREMAP_DEC flag.
> >>>>>>
> >>>>>> Modify memremap(MEMREMAP_WB) to produce encrypted/private mapping by
> >>>>>> default unless MEMREMAP_DEC is specified.
> >>>>>>
> >>>>>> Fix the crash due to #VE on kexec in TDX guests if CONFIG_EISA is enabled.
> >>>>>
> >>>>> This patch causes my bare-metal system to crash during boot when using
> >>>>> mem_encrypt=on:
> >>>>>
> >>>>> [    2.392934] efi: memattr: Entry type should be RuntimeServiceCode/Data
> >>>>> [    2.393731] efi: memattr: ! 0x214c42f01f1162a-0xee70ac7bd1a9c629 [type=2028324321|attr=0x6590648fa4209879]
> >>>>
> >>>> Could you try if this helps?
> >>>>
> >>>> diff --git a/drivers/firmware/efi/memattr.c b/drivers/firmware/efi/memattr.c
> >>>> index c38b1a335590..b5051dcb7c1d 100644
> >>>> --- a/drivers/firmware/efi/memattr.c
> >>>> +++ b/drivers/firmware/efi/memattr.c
> >>>> @@ -160,7 +160,7 @@ int __init efi_memattr_apply_permissions(struct mm_struct *mm,
> >>>>  	if (WARN_ON(!efi_enabled(EFI_MEMMAP)))
> >>>>  		return 0;
> >>>>  
> >>>> -	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB);
> >>>> +	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB | MEMREMAP_DEC);
> >>>
> >>> Well that would work for SME where EFI tables/data are not encrypted,
> >>> but will break for SEV where EFI tables/data are encrypted.
> >>
> >> Hm. Why would it break for SEV? It brings the situation back to what it
> >> was before the patch.
> > 
> > Ah, true. I can try it and see how much further SME gets. Hopefully it
> > doesn't turn into a whack-a-mole thing.
> 
> Unfortunately, it is turning into a whack-a-mole thing.
> 
> But it looks the following works for SME:
> 
> diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
> index 3c36f3f5e688..ff3cd5fc8508 100644
> --- a/arch/x86/mm/ioremap.c
> +++ b/arch/x86/mm/ioremap.c
> @@ -505,7 +505,7 @@ EXPORT_SYMBOL(iounmap);
>  
>  void *arch_memremap_wb(phys_addr_t phys_addr, size_t size, unsigned long flags)
>  {
> -	if (flags & MEMREMAP_DEC)
> +	if (flags & MEMREMAP_DEC || cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
>  		return (void __force *)ioremap_cache(phys_addr, size);
>  
>  	return (void __force *)ioremap_encrypted(phys_addr, size);
> 
> 
> I haven't had a chance to test the series on SEV, yet.

Please do.

I am okay with the change above. Borislav, is it acceptable direction for
you?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

