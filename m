Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C28C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaiyWbIz6Oj82hUDQViuJJ3GQPXALCUTLWwNLfrR6gU=; b=et454KE7SoL0l1rFoJBErX6luS
	kynzB2+o0cIGrTtXndSMRC/tEGwRJdJ74vke8yyY38XpjcV32sn0L5dn1JLrIJdNqPh+oPEbav7K1
	gG/LiU9PxBHY4e86PajEkHU4esRkgmRH50F3pnSG4zyDYqhPobqZfzrjNXt1H80bE32ZVCMgmq4QH
	4JmvtT/qXvQzN6HN4fA2iNi/I1DpfKJUXd3oHa5Pv3Ur3hQsHxniyeifJ1zFdyJlTw39ax5jkqSzO
	XhiD+RBs5S/r2v85lvBWGKE0GUEqO7dX55QIMlj1P9cTJuOOk+QyBbeVPT3CAEctU4/5UzxSBOjAM
	8zKwr79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5Q4-00000001fb8-38OJ;
	Mon, 17 Mar 2025 08:01:56 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5OO-00000001fHx-15VT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 08:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742198413; x=1773734413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcJorY7PCd1uLYcrL2Xac0peBqgqcHLr4/yCJRQ9DGw=;
  b=VbuBK3RzhS9I77nkxjc8CRD+l9uJl67jdz7NjQEym5Io12k4g802DqVf
   luHmA/P9+iBeqx9+2HtHM/SCDC3dbEq9O0Q9d5cf/iqvZmso2KAQf5qyN
   63yOYGoliPexp3ScdMtf8LN+i89OUkFb0RbNjLGF/euWx3z4C3Ut4D3Y/
   ilKVvfQGucbZDHYEmoIgZraGgCm4HmZN3BdNFvvpJr9X8fD9SZVNotPqv
   Pm37z211wpdj4ZxCyy/v3vwCXyyo/DxRvv6yHRnF3+zBGv5fe+ML0JCWc
   pYEwP+/goAqboF03/zRmuNnB4AAXCj4UJm97mHir0v1dT5VtPjooSCSM/
   w==;
X-CSE-ConnectionGUID: xsT6ZpRYQ4atdUbNG9UwnA==
X-CSE-MsgGUID: aUcGRcfVQ+GB3GQVa96qVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43383615"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="43383615"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:00:12 -0700
X-CSE-ConnectionGUID: aE6cL5gsQ3avEEOtd25fgg==
X-CSE-MsgGUID: U1U/tNhnTbWmIps9Wc5uMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="121674712"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 01:00:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tu5OG-00000003FIn-2NTM;
	Mon, 17 Mar 2025 10:00:04 +0200
Date: Mon, 17 Mar 2025 10:00:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Z9fWhGDrUbAmGRl0@smile.fi.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com>
 <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
 <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fec0a1c8-251b-491e-893d-11a8186a2128@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_010012_345901_5989BB1B 
X-CRM114-Status: GOOD (  21.29  )
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

On Mon, Mar 17, 2025 at 08:48:03AM +0100, Krzysztof Kozlowski wrote:
> On 28/02/2025 13:38, Andy Shevchenko wrote:
> > On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> >> Hi Ryan,
> >>
> >> kernel test robot noticed the following build warnings:
> >>
> >> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> >> [also build test WARNING on linus/master v6.14-rc4 next-20250227]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >>
> >> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> >> patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
> >> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> >> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
> >> compiler: mips-linux-gcc (GCC) 14.2.0
> >> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/
> >>
> >> All warnings (new ones prefixed by >>):
> > 
> > My gosh, this is valid report. But it looks like a preexisted issue.
> > Can somebody fix this, please?
> 
> 
> That was three weeks ago and still no responses from Aspeed or
> contributors from here.
> 
> I think this tells a lot about aspeedtech.com patchsets on the list.

Yeah...

-- 
With Best Regards,
Andy Shevchenko



