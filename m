Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA736C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NW+sctBDHO4/8kHr8vFlZ0uovMEhvpdq2zxs/L8R+Ec=; b=2zCgLIis0cOVbmPpTTL+5ugM+c
	bnhGC1o2nsF2XLOXQYWof6jCMRSTdfHD3t4+AZGz/Vo0xYUOy1+noQ1rpVJfdneqGH2WBeCCZ7f0S
	lMSLMKpf7h5G27Danp1C4Iwd7f7QvO4I0aWdy7MIa9m+u09UtxF7y9bh3JioxxnjMgOq3N+yvLWWj
	wYQqgwQ7M5aWe+3z5hg0LghSi6fsfc/Ndi81X3t55nxxnaZdpn1LFiexNhFzG0fo+epTnDS7OFM4E
	eINbJQKED88wpfByGNyd2Y3wPdotZt5IB7fB3GbHmekUJbNN05S99d3cZXEymkzX9lKjjeRBTlswx
	G/z/6Bag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts58n-00000006knd-13gL;
	Tue, 11 Mar 2025 19:19:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts575-00000006kiQ-1jSX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:18:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 135925C65F9;
	Tue, 11 Mar 2025 19:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E668EC4CEEC;
	Tue, 11 Mar 2025 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720682;
	bh=SsEEYkxbEBjU9Fy5Mp24bRmDLzFTU2qWFlecfqzLHyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXj08Ug0c18CbzPxiLU41gDA9ruR0ZBzerZ3kg/tNy9TvrFbw/jyUbtGasHdpna69
	 xaXMUXZq0F0a1S0DpG/ojKgUWQcOp97KntnBBKJQuDgMP6g/Jj44/erNvv/cL3HJ/P
	 HoRVMwkYEdqwUxRv6Ry7vPeRz5oGODychG1edtRuYQrANg6N84FRuG/x6+DNkpLYZW
	 O3cXra1SkgFw4s/nqEoh38vBYc4JwZ1nWuCyEPvVIaG5JNwGWik+4ZYVq125jo/+3/
	 3qQD22qyeGR82NMufqDEc2ARHCWswFC4QzuuHcIAo5rUoBTocr4OFkpLJeSkbJTEn5
	 eI+q9ah5z9BjQ==
Date: Tue, 11 Mar 2025 20:17:57 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Christian Eggers <ceggers@arri.de>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ARM: substitute OVERLAY description in linker
 script
Message-ID: <20250311191757.GA1958594@ax162>
References: <20250224125414.2184-1-ceggers@arri.de>
 <202503050230.820w99b6-lkp@intel.com>
 <20250310203729.GA26968@ax162>
 <2110116.YKUYFuaPT4@n9w6sw14>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2110116.YKUYFuaPT4@n9w6sw14>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_121803_538142_CA12BFE5 
X-CRM114-Status: GOOD (  36.26  )
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

On Tue, Mar 11, 2025 at 09:18:48AM +0100, Christian Eggers wrote:
> thanks for pushing this into the right direction.  Actually I didn't recognize that
> lld complains about overlapping virtual address ranges, maybe the .config provided
> by the first LKP report (which I used for testing) didn't enable the necessary options.

Right, it looks like CONFIG_HARDEN_BRANCH_HISTORY is not enabled in the
first configuration (since it was a randconfig) whereas it was in the
second configuration.

> On Monday, 10 March 2025, 21:37:29 CET, Nathan Chancellor wrote:
> > On Wed, Mar 05, 2025 at 02:49:38AM +0800, kernel test robot wrote:
> > > Hi Christian,
> > > 
> > > kernel test robot noticed the following build errors:
> > > 
> > > [auto build test ERROR on soc/for-next]
> > > [also build test ERROR on linus/master v6.14-rc5 next-20250304]
> > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > 
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Eggers/ARM-avoid-that-vectors-are-removed-during-linker-garbage-collection/20250224-210146
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
> > > patch link:    https://lore.kernel.org/r/20250224125414.2184-1-ceggers%40arri.de
> > > patch subject: [PATCH v2 1/2] ARM: substitute OVERLAY description in linker script
> > > config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20250305/202503050230.820w99b6-lkp@intel.com/config)
> > > compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050230.820w99b6-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202503050230.820w99b6-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> ld.lld: error: section .vectors.bhb.bpiall virtual address range overlaps with .vectors.bhb.loop8
> > >    >>> .vectors.bhb.bpiall range is [0xFFFF0000, 0xFFFF001F]
> > >    >>> .vectors.bhb.loop8 range is [0xFFFF0000, 0xFFFF001F]
> > > --
> > > >> ld.lld: error: section .vectors.bhb.loop8 virtual address range overlaps with .vectors
> > >    >>> .vectors.bhb.loop8 range is [0xFFFF0000, 0xFFFF001F]
> > >    >>> .vectors range is [0xFFFF0000, 0xFFFF001F]
> > 
> > Looking at ld.lld's code, this error is intentionally ignored for
> > OVERLAY:
> > 
> > https://github.com/llvm/llvm-project/blob/9f170e6abed4a7b393bb8abbf07ac8d6930aa3b0/lld/ELF/Writer.cpp#L2751-L2761
> > 
> > I have submitted a patch that allows KEEP within OVERLAY to match GNU
> > ld:
> > 
> > https://github.com/llvm/llvm-project/pull/130661
> > 
> > Once/if that is accepted, we should go back to your v1 with something
> > like the following diff on top to keep things working for all linkers. I
> > hope that it won't take long for the ld.lld change to get reviewed and
> > landed but if this needs to be fixed urgently, this whole diff minus
> > '|| LLD_VERSION >= 210000' on the init/Kconfig change should work (with
> > a comment change). I can always send a follow up change to add it back.
> 
> 
> I build from an internal tree, so I am not in hurry.  As the Kconfig changes
> probably should take your Signed-Off-By, I am also fine if you do the necessary
> changes on my v1 and resubmit it together with your patch when it is time.

I landed the ld.lld change a little bit ago so I will go ahead and send
along my patch plus yours formally shortly.

https://github.com/llvm/llvm-project/commit/381599f1fe973afad3094e55ec99b1620dba7d8c

Thanks again for bringing this up.

Cheers,
Nathan

