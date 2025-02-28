Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FB2C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 12:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFjBbY+XC1UAMgYfJ6fw2q+12gCt9wbXY8XezCsmN6U=; b=dCDA1tKnZ8rlhQu4r5nmvGR9A4
	BOaXnBKveaW8jSypAKDtrwnr1nigsDNQj47QGue8CujyacEVpQYNuftTBU0CkzDAEJmw59I42RG8O
	tGHcVFMZXEDuFFGI1cBa/MIGls1kCT2PuPDrL7qEPon8kZ9QNl0CLzJqKNKQ2AoRSbFNbuIlVJh06
	V2xk8gjZfy3xia+rH7gNURpYm8ssqyOK9ylcKPs0F0TQmL15Xq9cdJ9k8vQ1d6XHBGeLoh1IOzAEY
	g+n+oeaM8wysGifTTelJyIi6KnuUXsAtPZqi+Vtl6Z0W0IpnaSbAzMED0w/Yi3bO8ODvZMUxGre92
	aKN2CrhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzgP-0000000Ax58-1zNz;
	Fri, 28 Feb 2025 12:41:37 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnzdJ-0000000AwF9-2mOq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 12:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740746305; x=1772282305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYX7RMZyCDlc3/89q5oGVMuk0VSFqLZ9SexG0yL3SwM=;
  b=Oz+m5X5vyAfniXS23fQZ6XsVWmO46O+YSrczbPHtCXbUkFgPjYSApYC+
   ArCuf1ZMEfCng3o1532sDtkN6s4jYgcLxwMBwbUN6XkUja8WJ8jfFLsU3
   b7XYD41syXW635EcZwm7QOW6y61MZp6RFEfoFCzYDKDFVeCnhsecm9qkQ
   Q19qsijIo8TLH1oUl4wcwCYPte3xo8iR0OY9hcQRMtbA0TwzvYv4bLm/R
   J/qU40aGdSWYuZe1PFRC7375D4Fs2+NU73Y5aeGE+HP7/GgEKgqd8v8uO
   PuO7KCWUzXIXkpth3j8HoOJUTwlnjR1Bnt7/rFSmTGRHmNk4uGm83C5lm
   g==;
X-CSE-ConnectionGUID: pP8OAQPlSlO+Of8CVOFJWg==
X-CSE-MsgGUID: Q30saBclSMmpdpKH0uIGpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="44487570"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="44487570"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:38:25 -0800
X-CSE-ConnectionGUID: XFK1U7eRRnWQ4oGOGKwDHg==
X-CSE-MsgGUID: 9fz0KIp6TWq3kGY8ZRIIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117312902"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:38:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnzdB-0000000Fwgv-3Dnc;
	Fri, 28 Feb 2025 14:38:17 +0200
Date: Fri, 28 Feb 2025 14:38:17 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <Z8GuOT5bJL7CdXX6@smile.fi.intel.com>
References: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
 <202502280902.U0gLDhve-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502280902.U0gLDhve-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_043825_710152_3A03B69E 
X-CRM114-Status: GOOD (  15.85  )
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

On Fri, Feb 28, 2025 at 09:28:59AM +0800, kernel test robot wrote:
> Hi Ryan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on andi-shyti/i2c/i2c-host]
> [also build test WARNING on linus/master v6.14-rc4 next-20250227]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20250224-140221
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
> patch link:    https://lore.kernel.org/r/20250224055936.1804279-3-ryan_chen%40aspeedtech.com
> patch subject: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280902.U0gLDhve-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280902.U0gLDhve-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

My gosh, this is valid report. But it looks like a preexisted issue.
Can somebody fix this, please?

-- 
With Best Regards,
Andy Shevchenko



