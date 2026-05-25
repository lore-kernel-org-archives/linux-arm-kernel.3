Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181BDCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 16:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ev9yLt5NTZ9nEb03Xjyz/o28bx64uGp1JLdEhh9Coe0=; b=FzwDHcwkpX1E8iFipfVZls9ePh
	XWtsBu3QycFKJ0jsdOssW28TX4+v4Hl/0Mg4mJP58xV46KVLcMBTAqtsZOF2vzcc9I7kieNse9AZ+
	Q+wnU5ICG4T3es3byDu8iyXKXCaWcA0c7euzaaPwQynW+eshQzYLP427BOHKXMH1pczNvQNpxwHzL
	sEiJNBvQ/YWH5751s8xv4EU/+aIQHGh8c4ztKJmKKuLZMWFEhQ9GzK4baZ+C71SmQrDpgC+mUyc82
	1UWmGAvh2FddUzMNGzmPFJRAiVXfGSwj4CgbrhDvX5p2pbINg6xcAnRZIrDCWxtI84KkpWQjnxonf
	guPK2Tjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYaV-000000004vU-0kgY;
	Mon, 25 May 2026 16:55:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRYaU-000000004vK-18ln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 16:55:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B3BA3600AF;
	Mon, 25 May 2026 16:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74DF41F000E9;
	Mon, 25 May 2026 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779728133;
	bh=ev9yLt5NTZ9nEb03Xjyz/o28bx64uGp1JLdEhh9Coe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fmjI4rKS4bBepoqAbV18Ip+mP1JiKaJ3SoWM3uQKqXia1IKu2zRHu2mI1vT2l5Fqs
	 3+EOG9c04IkzAjonoKnZm7GnFDrQO2v6NPjAZT3ut9lI48JcOZ2G9P3IT6YksrvV99
	 y1e7z+eYHMmBDGXGsxi2q2imq/lnYzFVqV9rOuqaYdo3I8lMmskVD04kbXLnNMYQ25
	 kq967Zy2cOc7fghz+uBGLRScMX/WVp30btRe98rSP5Hzx65U9+z4lBn/0KOhjB71un
	 l52BZzGMNEsXMzRCvHQ21t4rHFRPC21lyXe8cKiDIOKJGMB+BdE8FFmuHw3AWsjfUk
	 dPifMRmJhwO+g==
Date: Mon, 25 May 2026 09:55:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Mithil Bavishi <bavishimithil@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Message-ID: <20260525165527.GA18457@ax162>
References: <20260522233036.12277-1-bavishimithil@gmail.com>
 <202605241332.fXvCYBR2-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605241332.fXvCYBR2-lkp@intel.com>
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

On Sun, May 24, 2026 at 02:01:31PM +0800, kernel test robot wrote:
> Hi Mithil,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on tmlind-omap/for-next]
> [also build test ERROR on linus/master v7.1-rc4 next-20260522]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Mithil-Bavishi/ARM-OMAP2-Add-CFI-type-for-omap4_finish_suspend/20260523-073206
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git for-next
> patch link:    https://lore.kernel.org/r/20260522233036.12277-1-bavishimithil%40gmail.com
> patch subject: [PATCH v2] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20260524/202605241332.fXvCYBR2-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241332.fXvCYBR2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605241332.fXvCYBR2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/arm/mach-omap2/sleep44xx.S:61:1: error: invalid instruction
>    SYM_TYPED_FUNC_START(omap4_finish_suspend)
>    ^

This report and the GCC one

  https://lore.kernel.org/202605252315.UhjCBtGA-lkp@intel.com/

are both pointing out that cfi_types.h needs to be included in
arch/arm/mach-omap2/sleep44xx.S for SYM_TYPED_FUNC_START to always be
expanded properly. I tested adding

  #include <linux/cfi_types.h>

as the first include line and both issues were resolved.

Cheers,
Nathan

