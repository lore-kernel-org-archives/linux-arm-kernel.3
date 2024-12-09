Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE7BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBrKVQhvPvvcGdXyQR2n+0aYYfxMfPaFR1fpM4VzZuk=; b=qMNzYdL9I4N1YRkdLT0I/jQFiW
	zsW3M1Vetk0Nrg5vAQfV2O4L/RKygAK013cLU8xI3e179XOe4yiaHPj0cqgA8LQvw0JxoNSXWJgMZ
	Vd+gktGc4oyVXJOKw8cEiJ15uRop33ZOKRkSve0LsJtfnec5gULAT/m3sA+EMIQ3bRopL/spQDnFW
	P5+Y+3K6nQYYevpd0nxtelDEqor5G84TQVyJevb4gmJMImyUSSB3QKXNo0LTJcESzyK0erdPzIwSV
	w3MyHlqLxDXqng58W9i8AGzz6pv4lavzveiUgah8tJ3wVaE1lty4FN4xkaPFsR4u7el6GwXTEWDxk
	k3QhdZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhH7-00000008gD0-3aBj;
	Mon, 09 Dec 2024 17:10:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhG4-00000008fxu-1jSO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C14D4A41823;
	Mon,  9 Dec 2024 17:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C016C4CED1;
	Mon,  9 Dec 2024 17:09:16 +0000 (UTC)
Date: Mon, 9 Dec 2024 17:09:14 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: kernel test robot <lkp@intel.com>, linux-mm@kvack.org,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on
 EXECMEM
Message-ID: <Z1ckOoPMSXfNdrXd@arm.com>
References: <20241209031251.515903-1-anshuman.khandual@arm.com>
 <202412092048.tTzJ5szH-lkp@intel.com>
 <f492ac51-9dad-4b18-8cd4-81dc236b3162@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f492ac51-9dad-4b18-8cd4-81dc236b3162@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_090920_580071_95D42B0E 
X-CRM114-Status: GOOD (  21.49  )
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

On Mon, Dec 09, 2024 at 07:43:32PM +0530, Anshuman Khandual wrote:
> On 12/9/24 18:06, kernel test robot wrote:
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on akpm-mm/mm-everything]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-execmem-Make-ARCH_WANTS_EXECMEM_LATE-depend-on-EXECMEM/20241209-111533
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> > patch link:    https://lore.kernel.org/r/20241209031251.515903-1-anshuman.khandual%40arm.com
> > patch subject: [PATCH] mm/execmem: Make ARCH_WANTS_EXECMEM_LATE depend on EXECMEM
> > config: arm64-kismet-CONFIG_ARCH_WANTS_EXECMEM_LATE-CONFIG_ARM64-0-0 (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/config)
> > reproduce: (https://download.01.org/0day-ci/archive/20241209/202412092048.tTzJ5szH-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412092048.tTzJ5szH-lkp@intel.com/
> > 
> > kismet warnings: (new ones prefixed by >>)
> >>> kismet: WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE when selected by ARM64
> >    WARNING: unmet direct dependencies detected for ARCH_WANTS_EXECMEM_LATE
> >      Depends on [n]: EXECMEM [=n]
> >      Selected by [y]:
> >      - ARM64 [=y]
> 
> Although above mentioned config here has CONFIG_ARCH_WANTS_EXECMEM_LATE=y
> and CONFIG_EXECMEM=n (actually absent), could that really happen though ?
> 
> Tried making CONFIG_EXECMEM=n (rather deselecting) but that did now allow
> setting CONFIG_EXECMEM=n, it always remained set. Reverting this patch i.e
> the current behaviour is also the same (CONFIG_EXECMEM always remains set).
> 
> select ARCH_WANTS_EXECMEM_LATE if EXECMEM
> 
> Above statement seems to be selecting EXECMEM as well but the intent seems
> to be a dependency check instead! OR arch selection for a config brings in
> all its dependencies as well.
> 
> If the selection is always, should this change be like the following ?
> 
> config ARCH_WANTS_EXECMEM_LATE
>  	bool
> 	selects EXECMEM

This is wrong. What ARCH_WANTS_EXECMEM_LATE means is that, _if_ EXECMEM
is enabled, the arch code require its late initialisation. Currently for
arm64 EXECMEM is selected by KPROBES, BPF_JIT and MODULES. So if you
don't have any of these on, you don't need EXECMEM either, no point in
selecting it above just because arm64 wants a specific behaviour (late
initialisation) for EXECMEM.

If you do want a patch for this, I think for arm64 we simply need to
select ARCH_WANTS_EXECMEM_LATE unconditionally. Not much use in having
any dependencies really, it just adds to the clutter. And don't change
the core Kconfig either.

-- 
Catalin

