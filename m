Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+ruBf9Oz0qu7iyS4oPe+TZ1G+MgWr5NrR7SFsVkMLM=; b=AbwNuvwzjeADOMUPD4KXGB9N3A
	e3S/0OuOpCuMuNG2Y8r9PhaUSq5V47zB/h5mTG2ImDrahyyAEbA+bBMoxKixwBaq4Fs4CD0b2q64A
	Y0ljT9tcff32YEBLgSFXnLDxZbUXI5s5lA6v9/pCIeEb47OXuMVd326n79ExUET/q0R+N7tTxs5Ct
	LCWmGLgcbKGB/q88t0D5BoxADSJHSj5kz1jJY68ZFVtQsfmFp4NieDe3fqyXefurolTthlyC+Oz6l
	SvqnrE49WKIZpelfgLSU8UKr+qip6aMOuQLCY5cxfwLz7wvcMjUbsMAWiTtVMjCeWlqTq8ncIfLPV
	0cSlTNrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXiBU-00000008jDi-38lZ;
	Tue, 14 Jan 2025 14:46:24 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXi9O-00000008io6-25DJ;
	Tue, 14 Jan 2025 14:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736865855; x=1768401855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wt6Jj95+PYNqxpsm1cs8AMmqyXIhoQDmPbP216JDWbc=;
  b=W1/aXDNIWqJUJizEpjmGYC+qthZkZHPlE+BBctH8x2yqAZeOsqwZAxCs
   819Mzj9RBmNU9djBL99YsTQ7n2lW6EZ9121w8gqAOzeDS3umcKPI71a9R
   LaxgFb0RBtLNIKUaeY/QZxIMoBHCC90bMOLmqBB3ILN8Sf5l5EsN5r5hD
   UKtCNYmG4+zdNjqz6cSndWPru5PTTaQLKfrspQ+Iw0LmIix/jarYpkHFs
   vcZU32wEZJk21NO+Z9JrM7+EdRAr4t2me8DFs5uO3VgV5zMLez3amf9cS
   d8oISwYCnvNMzGvC2T3DdSXfILUo8SQFiTvK9w3aNgfFi7BnSpae+issM
   A==;
X-CSE-ConnectionGUID: O37oeyuJRNedXzOOY36/gw==
X-CSE-MsgGUID: cYPxFYGCRaOp7eciTke/lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47829509"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="47829509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 06:44:13 -0800
X-CSE-ConnectionGUID: JdH1HnLSS7mX4lYDcCZNUg==
X-CSE-MsgGUID: O+YI7V2YS3Kgh2RHy9TmsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109970974"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 14 Jan 2025 06:44:06 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 948DE39C; Tue, 14 Jan 2025 16:44:04 +0200 (EET)
Date: Tue, 14 Jan 2025 16:44:04 +0200
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
Message-ID: <2nc5silj5wbj6kz5tcsutgcjx6wviobhem4z24x4ya2r4q4ra5@5rixeg2wo7c3>
References: <20250113131459.2008123-1-kirill.shutemov@linux.intel.com>
 <20250113131459.2008123-3-kirill.shutemov@linux.intel.com>
 <1532becb-f2be-4458-5d34-77070f2c5e2d@amd.com>
 <vuj7mlvkvazuz5noupusqt2bk42vjkr5lkgivnrub2nby4ma6y@7ezpclbirwcs>
 <9981e3f5-1414-dd82-c6ad-379289575b07@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9981e3f5-1414-dd82-c6ad-379289575b07@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_064414_548914_D8B897B8 
X-CRM114-Status: GOOD (  23.36  )
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

On Tue, Jan 14, 2025 at 08:33:39AM -0600, Tom Lendacky wrote:
> On 1/14/25 01:27, Kirill A. Shutemov wrote:
> > On Mon, Jan 13, 2025 at 02:47:56PM -0600, Tom Lendacky wrote:
> >> On 1/13/25 07:14, Kirill A. Shutemov wrote:
> >>> Currently memremap(MEMREMAP_WB) can produce decrypted/shared mapping:
> >>>
> >>> memremap(MEMREMAP_WB)
> >>>   arch_memremap_wb()
> >>>     ioremap_cache()
> >>>       __ioremap_caller(.encrytped = false)
> >>>
> >>> In such cases, the IORES_MAP_ENCRYPTED flag on the memory will determine
> >>> if the resulting mapping is encrypted or decrypted.
> >>>
> >>> Creating a decrypted mapping without explicit request from the caller is
> >>> risky:
> >>>
> >>>   - It can inadvertently expose the guest's data and compromise the
> >>>     guest.
> >>>
> >>>   - Accessing private memory via shared/decrypted mapping on TDX will
> >>>     either trigger implicit conversion to shared or #VE (depending on
> >>>     VMM implementation).
> >>>
> >>>     Implicit conversion is destructive: subsequent access to the same
> >>>     memory via private mapping will trigger a hard-to-debug #VE crash.
> >>>
> >>> The kernel already provides a way to request decrypted mapping
> >>> explicitly via the MEMREMAP_DEC flag.
> >>>
> >>> Modify memremap(MEMREMAP_WB) to produce encrypted/private mapping by
> >>> default unless MEMREMAP_DEC is specified.
> >>>
> >>> Fix the crash due to #VE on kexec in TDX guests if CONFIG_EISA is enabled.
> >>
> >> This patch causes my bare-metal system to crash during boot when using
> >> mem_encrypt=on:
> >>
> >> [    2.392934] efi: memattr: Entry type should be RuntimeServiceCode/Data
> >> [    2.393731] efi: memattr: ! 0x214c42f01f1162a-0xee70ac7bd1a9c629 [type=2028324321|attr=0x6590648fa4209879]
> > 
> > Could you try if this helps?
> > 
> > diff --git a/drivers/firmware/efi/memattr.c b/drivers/firmware/efi/memattr.c
> > index c38b1a335590..b5051dcb7c1d 100644
> > --- a/drivers/firmware/efi/memattr.c
> > +++ b/drivers/firmware/efi/memattr.c
> > @@ -160,7 +160,7 @@ int __init efi_memattr_apply_permissions(struct mm_struct *mm,
> >  	if (WARN_ON(!efi_enabled(EFI_MEMMAP)))
> >  		return 0;
> >  
> > -	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB);
> > +	tbl = memremap(efi_mem_attr_table, tbl_size, MEMREMAP_WB | MEMREMAP_DEC);
> 
> Well that would work for SME where EFI tables/data are not encrypted,
> but will break for SEV where EFI tables/data are encrypted.

Hm. Why would it break for SEV? It brings the situation back to what it
was before the patch.

Note that that __ioremap_caller() would still check io_desc.flags before
mapping it as decrypted.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

