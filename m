Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165851091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4HbQOGwImv1fOmjGJt0gkGaRSE0nKnPhlffcNjvLSQ=; b=Hm9oH0I8gMjWjRx/JvI9zKmMsw
	Ak3eecTxVjRUK3mFH9PAd/KEwJrIYTHZJSGznbhMWI3PltB/Yx5ABVr4zr4WfzN60wtUhl5a84yqy
	lIJ+5fjTuUuLWcN3xTnyZlJZmeg3FGiEkOeGSl99r5iu3xdeP9pNl4TSe4oynBOjngs3t15S0hpTL
	WAvB72A7yImet27lxZmRRJqFPNUq+zcYMQ7AXH3aFmgfGVQnnHIclfl83sra7BZmCQKcEKMSvN6xo
	vNgLIohioKlQQrJ4/USLKOq/u3G749C1hG6bhsoqzZ7qJ03Fm+g8yWVTetmgRP+7mArnwcGUTbkWb
	seZxYU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JCP-0000000BSka-3Idl;
	Thu, 19 Mar 2026 19:38:29 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3JCN-0000000BSkG-09sM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773949108; x=1805485108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YiPkuQ6dFBAJVz3h1COZnRhMIdto56/r+LybiYglshY=;
  b=Solqn8DSOQbA23YR1o6am1qNrQAuPyHAv48BgmDFr+dHdmyKnRn+0hRT
   RuOth2eiFl3VQZZKNW7HnXuK8HixJcPYUQMagOUqnsiva9yXz228GKMo7
   egfNf1EWg5QhDIAskfGYIfiq75hh4LJkA2u49kUWcBCtK6p+JVFKS1dLe
   rCsoFUcb1pKMN7iBgsZQ5C+U8lbou/PPtac4/YukpcuQB3UZA6oIUIhkS
   sWGXrhjOz5Gx3RR9k/r24aINGpEt4OoiDLwUFvBr9uQfATlczvMjbDEK1
   fwAOs+XDi1yL3RWWUcgOnke5ap41NN/gelaNAfKLKqNneRJU57SshmgsC
   Q==;
X-CSE-ConnectionGUID: wDAlL9+GRCO5mESA9bIaxg==
X-CSE-MsgGUID: Qi/8//HXRs69nEoFjsZu9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86509952"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="86509952"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 12:38:27 -0700
X-CSE-ConnectionGUID: idZKjUp0RY6ozfWI/qJtRg==
X-CSE-MsgGUID: 4ESHFOJVSHKcgIfLaflrEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227768956"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Mar 2026 12:38:16 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3JC2-000000001au-1Cvf;
	Thu, 19 Mar 2026 19:38:06 +0000
Date: Fri, 20 Mar 2026 03:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ahmed Tiba <ahmed.tiba@arm.com>, linux-acpi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-cxl@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ahmed Tiba <ahmed.tiba@arm.com>, Michael.Zhao2@arm.com,
	robh@kernel.org, linux-arm-kernel@lists.infradead.org,
	Dmitry.Lamerov@arm.com, rafael@kernel.org, conor@kernel.org,
	will@kernel.org, bp@alien8.de, catalin.marinas@arm.com,
	krzk+dt@kernel.org, linux-doc@vger.kernel.org,
	mchehab+huawei@kernel.org, tony.luck@intel.com
Subject: Re: [PATCH v3 10/10] RAS: add firmware-first CPER provider
Message-ID: <202603200349.vMgMwlEs-lkp@intel.com>
References: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-10-48e6a1c249ef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-10-48e6a1c249ef@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_123827_248908_6A6BEF9E 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on 2d1373e4246da3b58e1df058374ed6b101804e07]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-Tiba/ACPI-APEI-GHES-share-macros-via-a-private-header/20260319-115432
base:   2d1373e4246da3b58e1df058374ed6b101804e07
patch link:    https://lore.kernel.org/r/20260318-topics-ahmtib01-ras_ffh_arm_internal_review-v3-10-48e6a1c249ef%40arm.com
patch subject: [PATCH v3 10/10] RAS: add firmware-first CPER provider
config: hexagon-randconfig-001-20260320 (https://download.01.org/0day-ci/archive/20260320/202603200349.vMgMwlEs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200349.vMgMwlEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200349.vMgMwlEs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ras/cper-esource.c:84:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |                 val = readq(ctx->ack.addr);
         |                       ^
>> drivers/ras/cper-esource.c:87:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      87 |                 writeq(val, ctx->ack.addr);
         |                 ^
   2 errors generated.


vim +/readq +84 drivers/ras/cper-esource.c

    75	
    76	static void cper_esource_ack(struct cper_esource *ctx)
    77	{
    78		u64 val;
    79	
    80		if (!ctx->ack.present)
    81			return;
    82	
    83		if (ctx->ack.width == 64) {
  > 84			val = readq(ctx->ack.addr);
    85			val &= ctx->ack.preserve;
    86			val |= ctx->ack.set;
  > 87			writeq(val, ctx->ack.addr);
    88		} else {
    89			val = readl(ctx->ack.addr);
    90			val &= (u32)ctx->ack.preserve;
    91			val |= (u32)ctx->ack.set;
    92			writel(val, ctx->ack.addr);
    93		}
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

