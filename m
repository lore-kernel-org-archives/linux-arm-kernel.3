Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2957D6007B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 08:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/ZT5Ueu1k3uE1gWNbib7vlxBTCrsHaCIzkRiL9IKyw=; b=nr2XuzFvLdmFFmlETjiRpq4FF8
	SPpFtqddHCRUh9i5VnTgHHduzCx/fwx92QqtzhbMpjDn8+aIrTre4oVnUa32Q2WL3csi4Ew5xxhDG
	7grGVR35+JtaLvI/j9HGVSZfnQez07tt77JiVg/BHzg+Ona33j9BqPCX3CLfWVIyisG71AwHryiWR
	dkfVernzhwJpVUlbbXQXD+aChhdnl/uD6dYzfjorBrVNIZ0y4qbu3UGATBzvTJe3RVKkR4nppNThv
	C4h5S8zqvqWbYmWQ4WstzyDav2dtHSbEsMoVHwIg9Uhactr8rKieTQuIUt+284wCRk7jdsXAFjxtE
	aVi8BqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJV2-0000000BjzP-1Akw;
	Tue, 19 Nov 2024 08:22:16 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDJU4-0000000Bjsg-2mJl;
	Tue, 19 Nov 2024 08:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732004476; x=1763540476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ATmfCzclHdM2YT75Oaruucbf85ygBbbHlKeZnhLFY48=;
  b=D6RymFxYUz27lX2J5uBRbUulZpgM55ZE2aMCC//ZLvdTPl2TgWbxpUZi
   4+FkDDKUcT7ts0P29+te+83X2SXZL6tB09k7669JaEjV4yxj9IIPAIxP4
   CvVMMSPAz38XLXCKo+05ORv+8yxsaSnGhSVN2C/UlUyr0izFlAdrOqWfO
   vV9HKUy83+L6kcHWxQmLf3+WAcWKu/+LP29qApxn/xRfw5zd9RB3D7IQC
   WGxWUeNeaBUb3dMXtyxYN4OJIii6mhK7igMITnx6tVmiwEm73ZYq6EAMW
   KLQ9N/IWqTxAODzs3nW2deZJNjgv2QHOMq/8kA8p7QP33dDwe4P0QkSTM
   w==;
X-CSE-ConnectionGUID: yvRIBatlRlKiYRCBfr2GPg==
X-CSE-MsgGUID: t7mt6xCRQ46QDEQg13Wr2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42619274"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="42619274"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 00:21:13 -0800
X-CSE-ConnectionGUID: LAnQUuu3QsmhihWdYaL+uA==
X-CSE-MsgGUID: SmMoEHkuRFuaFU8wofzIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89894414"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa010.fm.intel.com with ESMTP; 19 Nov 2024 00:21:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id EFB4B1C4; Tue, 19 Nov 2024 10:21:05 +0200 (EET)
Date: Tue, 19 Nov 2024 10:21:05 +0200
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
Message-ID: <s4frmqwtuvclinuu7ttyzfpe7bj7hju5xgt6sxzy3gyt3prr62@rrgvhkv4lgwv>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <20241021105723.2707507-3-kirill.shutemov@linux.intel.com>
 <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118164616.GAZztvWGs9cOV8t20_@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_002116_711053_582F9F51 
X-CRM114-Status: GOOD (  13.75  )
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

On Mon, Nov 18, 2024 at 05:46:16PM +0100, Borislav Petkov wrote:
> On Mon, Oct 21, 2024 at 01:57:23PM +0300, Kirill A. Shutemov wrote:
> > It fixes crash on kexec in TDX guests if CONFIG_EISA is enabled.
> 
> Do TDX guests even need EISA?
> 
> "The EISA bus saw limited use between 1988 and 1995 when it was made obsolete
> by the PCI bus."
> 
> Sounds like no to me.
> 
> We usually simply stop coco guests from touching such legacy ranges:
> 
> f30470c190c2 ("x86/boot: Skip video memory access in the decompressor for SEV-ES/SNP")
> 
> so can you do that too?

Sure, we can workaround every place that touches such ranges. Or we can
address problem at the root and make creating decrypted/shared mappings
explicit.

Such mappings have both functional (as we see here) and security
implications (VMM can manipulate the guest memory range). We should not
create decrypted mappings by default on legacy interfaces.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

