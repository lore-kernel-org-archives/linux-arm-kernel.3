Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCAAD49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JrC0vMwwRlG1T63TUuuaWObUMzcTdEbclbj0ktEXyWA=; b=zt23j2JpgmuYh693cdsx6B8tnu
	proJjXcbKC/hWPRIMtTOcRBlTOudm4R47h3ytuwSjrpCno3cFeqluz7LV2A4xm7pGyclI4I8XVyNT
	wYu6AqUkMknpXBiAaMchCpG02JVby8su9HV16b8XlYB/tRaEtqhnqhjvVGDCGqTffKWo+kR6SioTQ
	y9hVXFtq0MvwQRVqRhgAF/gRqMYAWDGEvxW5Vou+oHMgTPdpebC2EbjuU9bvkaOkfaD95bpgav9gj
	k/p1OH8BM2aFIQBQcB/jjPC3aD1m2Yt2ZBlcixtIG2dslMJDutroOxiwLy6OjwC+G23n5PEDOkESw
	EqFhL3GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyIj-00000008xCl-1F2N;
	Mon, 18 Nov 2024 09:44:09 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyHn-00000008x5H-2N62;
	Mon, 18 Nov 2024 09:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731922991; x=1763458991;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2m33SZvlePmlt6YGusHzLVJNac4WE8TIk+QuRV1Woeo=;
  b=Mkgajf2UZ/DsLMtISpjpRgLrU+CwVRLFqk7GK4Rvbfb6SURHtSplKsgA
   CEfH/9Stut01evJCUeyw9IXbQf2AQVKRVSJeuP4Of5YxmcvW5uoJAM/qh
   5cNedrwK4AbOHiLcp2sdycFCdsL1NfJXXanWIL0sRX9koTpio9isRSrDw
   stQuDX2We8lotnUMFLNjj46/elDn/6SrqKa2mjxk6YIQzJyiKMNPUwxTq
   72PlOjc1F0C8QTDmc6+t6p6lgVoFdtsduilzan3sCcLTVM5S+mCyVj1e5
   Uh0vBETuETxI7lQGjIcITwckk1kpQjvLswgakyH5+C/eLUOhWqOm/hYbW
   w==;
X-CSE-ConnectionGUID: ZiQmeF1wTvqCGJZMNcmBGg==
X-CSE-MsgGUID: XsUnU1r3S4iRKAqIp36D2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31246884"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31246884"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:43:09 -0800
X-CSE-ConnectionGUID: 47+CdCU3R/Kuq822McxOBw==
X-CSE-MsgGUID: jI1nU6ebSQmW/RTXAG2Z6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93996397"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 18 Nov 2024 01:43:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1000)
	id 30C9F277; Mon, 18 Nov 2024 11:43:02 +0200 (EET)
Date: Mon, 18 Nov 2024 11:43:02 +0200
From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Andrea Parri <parri.andrea@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eric Chan <ericchancf@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kai Huang <kai.huang@intel.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Russell King <linux@armlinux.org.uk>, Samuel Holland <samuel.holland@sifive.com>, 
	Suren Baghdasaryan <surenb@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv2 0/2] x86/mm: Make memremap(MEMREMAP_WB) map memory as
 encrypted by default
Message-ID: <oh7zs7c4drl7i35dt3bxunqhlefrmcej7yd2bjxvdzpnqgtyk6@qkl6vvipa54d>
References: <20241021105723.2707507-1-kirill.shutemov@linux.intel.com>
 <j54jizfjzubkejbkobyryl33i4ejhoek4ynshtethkiidkx7le@2p22g3fxxedz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j54jizfjzubkejbkobyryl33i4ejhoek4ynshtethkiidkx7le@2p22g3fxxedz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_014311_658717_7EA32F0E 
X-CRM114-Status: GOOD (  10.23  )
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

On Tue, Oct 29, 2024 at 05:11:26PM +0200, Kirill A. Shutemov wrote:
> On Mon, Oct 21, 2024 at 01:57:21PM +0300, Kirill A. Shutemov wrote:
> > Make memremap(MEMREMAP_WB) produce encrypted/private mapping by default
> > unless MEMREMAP_DEC is specified.
> > 
> > It fixes crash on kexec in TDX guests if CONFIG_EISA is enabled.
> 
> Ping? Any feedback is welcome.

The patchset fixes crash. Please consider applying.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

