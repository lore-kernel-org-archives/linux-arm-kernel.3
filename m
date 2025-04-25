Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01149C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZsY0a6nrOQltQeu1yw8cksiWMQy5LuF97NOwHPYedw=; b=dXUoFgmidRgnZch4InuspCZ3Bo
	nrJMdL5zIfTp9M+b9oufiAAkDAInSVDEcsMUMT+r+lFDCBVkx3pDV00WJ8zw2DySgHij9DHlg3Bjj
	pwHALRym2oS3IFh7RrLvVwUTKrx1BBKxnO3iJg1lKLi0A0W14DdEDXlbFV4lj3QwUEahoB7WZTRy/
	m3yoeBNulxJJDUxaevZddVi3+jVkxWd1Dwz5pInUWpXf3EaHXDd3a84+hWqKtc2vRbjlaIDd8JU3V
	6TH9G2x+8Tz0BaPcAqQEuvf7HVUgEdCzgL5XTUNqDu5Qq6cgBuQ/ta8h78iaG8PoEIMnakcCuV5pa
	xGjhHABw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8O0W-00000000YEb-3hgS;
	Fri, 25 Apr 2025 18:42:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Nvk-00000000Xoq-3pH1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 18:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 599BA5C6AAB;
	Fri, 25 Apr 2025 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30F3C4CEE4;
	Fri, 25 Apr 2025 18:37:41 +0000 (UTC)
Date: Fri, 25 Apr 2025 19:37:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: BUG: vdso changes expose elf mapping issue
Message-ID: <aAvWchSUlnAfg42x@arm.com>
References: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f93db308-4a0e-4806-9faf-98f890f5a5e6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_113745_069607_68E34EA4 
X-CRM114-Status: GOOD (  18.74  )
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

On Fri, Apr 25, 2025 at 01:41:31PM +0100, Ryan Roberts wrote:
> ldconfig is a statically linked, PIE executable. The kernel treats this as an 
> interpreter and therefore does not map it into low memory but instead maps it 
> into high memory using mmap() (mmap is top-down on arm64). Once it's mapped, 
> vvar/vdso gets mapped and fills the hole right at the top that is left due to 
> ldconfig's alignment requirements. Before the above change, there were 2 pages 
> free between the end of the data segment and vvar; this was enough for ldconfig 
> to get it's required memory with brk(). But after the change there is no space:
> 
> Before:
> fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> fffff7ffc000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]
> 
> After:
> fffff7f20000-fffff7fde000 r-xp 00000000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7fee000-fffff7ff5000 rw-p 000be000 fe:02 8110426                    /home/ubuntu/glibc-2.35/build/elf/ldconfig
> fffff7ff5000-fffff7ffa000 rw-p 00000000 00:00 0 
> fffff7ffa000-fffff7ffe000 r--p 00000000 00:00 0                          [vvar]
> fffff7ffe000-fffff8000000 r-xp 00000000 00:00 0                          [vdso]
> fffffffdf000-1000000000000 rw-p 00000000 00:00 0                         [stack]

It does look like we've just been lucky so far. An ELF file requiring a
slightly larger brk (by two pages), it could fail. FWIW, briefly after
commit 9630f0d60fec ("fs/binfmt_elf: use PT_LOAD p_align values for
static PIE"), we got:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xaaaaaaaa0000     0xaaaaaab5d000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
      0xaaaaaab6b000     0xaaaaaab73000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
      0xaaaaaab73000     0xaaaaaab78000     0x5000        0x0  rw-p   [heap]
      0xfffff7ffd000     0xfffff7fff000     0x2000        0x0  r--p   [vvar]
      0xfffff7fff000     0xfffff8000000     0x1000        0x0  r-xp   [vdso]
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

This looks like a better layout to me when you load an ET_DYN file
without !PT_INTERP.

When the commit was reverted by aeb7923733d1 ("revert "fs/binfmt_elf:
use PT_LOAD p_align values for static PIE""), we went back to:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xfffff7f28000     0xfffff7fe5000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
      0xfffff7ff0000     0xfffff7ff2000     0x2000        0x0  r--p   [vvar]
      0xfffff7ff2000     0xfffff7ff3000     0x1000        0x0  r-xp   [vdso]
      0xfffff7ff3000     0xfffff7ffb000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
      0xfffff7ffb000     0xfffff8000000     0x5000        0x0  rw-p   [heap]
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

With 6.15-rc3 my layout looks like Ryan's but in 5.18 above, the vdso is
small enough and it's squeezed between the two ldconfig sections.

Quick hack forcing the vdso alignment to SZ_64K on arm64 (not a
solution, it can still fail in other ways):

------------------8<----------------------------
diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 78ddf6bdecad..9f9085e3e203 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -111,7 +111,7 @@ static int __setup_additional_pages(enum vdso_abi abi,

 	vdso_text_len = vdso_info[abi].vdso_pages << PAGE_SHIFT;
 	/* Be sure to map the data page */
-	vdso_mapping_len = vdso_text_len + VDSO_NR_PAGES * PAGE_SIZE;
+	vdso_mapping_len = ALIGN(vdso_text_len + VDSO_NR_PAGES * PAGE_SIZE, SZ_64K);

 	vdso_base = get_unmapped_area(NULL, 0, vdso_mapping_len, 0, 0);
 	if (IS_ERR_VALUE(vdso_base)) {
------------------8<----------------------------

gives:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xfffff7f10000     0xfffff7f14000     0x4000        0x0  r--p   [vvar]
      0xfffff7f14000     0xfffff7f16000     0x2000        0x0  r-xp   [vdso]
      0xfffff7f20000     0xfffff7fdd000    0xbd000        0x0  r-xp   /usr/sbin/ldconfig
      0xfffff7feb000     0xfffff7ff3000     0x8000    0xcb000  rw-p   /usr/sbin/ldconfig
      0xfffff7ff3000     0xfffff7ff8000     0x5000        0x0  rw-p
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]


Not sure what the best solution. IIUC when ld.so is loaded as an
interpreter, it wouldn't need brk above its data section. However, when
something like ldconfig (or ld.so) is executed directly, it should be
loaded like any other ET_DYN executable at ELF_ET_DYN_BASE, e.g.:

          Start Addr           End Addr       Size     Offset  Perms  objfile
      0xaaaaaaaa0000     0xaaaaaaaab000     0xb000        0x0  r-xp   /usr/bin/wc
      0xaaaaaaabf000     0xaaaaaaac1000     0x2000     0xf000  rw-p   /usr/bin/wc
      0xfffff7fbe000     0xfffff7fe5000    0x27000        0x0  r-xp   /usr/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1
      0xfffff7ff6000     0xfffff7ffa000     0x4000        0x0  r--p   [vvar]
      0xfffff7ffa000     0xfffff7ffc000     0x2000        0x0  r-xp   [vdso]
      0xfffff7ffc000     0xfffff8000000     0x4000    0x2e000  rw-p   /usr/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1
      0xfffffffdf000    0x1000000000000    0x21000        0x0  rw-p   [stack]

-- 
Catalin

