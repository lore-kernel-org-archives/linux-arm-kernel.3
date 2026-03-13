Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F2F107BCD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 18:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oa2v1lInDv7kWQwQPHUatRoPLpz33HiyI5rEbiP4n3o=; b=pLjcMrGZfnmQyLH3KWWbb2wFNO
	SWJmbvk9naB6RPOhxchM4ACnxmFU5l5nUBTBbR2t0UaLDKjonH4CsFeJrsNCrgXqr2Thrnaikzen1
	G34nLEQBYR60daK6CC0tFvfX5niHg8QxA0TiW1hRjCOgPwpBgPri7oVp6+BXwJRVJqbsuvR4R5hE3
	b7fIFP8mw48MIgXl060dCz1Q/seB9ObI9VClndhZppawqePySozYQiZvfhHcJfaETRDSVUg1ah42y
	BaIoTAu7GvFAHbdxRvLMZ7uuqX87ke9VN1Rd8Ei2kFOU3friR7vMUsDrsJMYqsQp3oRa4du0PDL8K
	L31+ry8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w176a-00000000svu-23uS;
	Fri, 13 Mar 2026 18:19:24 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w176X-00000000ssM-0U40;
	Fri, 13 Mar 2026 18:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773425961; x=1804961961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wGHHmea18QzDv20CIQ8/NkoCGCljzKpgR/2yblyc0Sk=;
  b=jnOO3/gLMmSZaMfBV2KBpMuT882GHRbRskKmhvPE3bqX8pHjPS6OuUh9
   ceDc9M7iusTBMvKcOeiiYuteNAbr6AaJVn5r1+gycDgUqPji+kLWi8+98
   CJ8bZt1RsGf+WdtlHMGfGRV9hCyP5RfkHALU/6B3JB84OwQ+wWmgi7Jlp
   TKkfHcVEQkfLg7hfDsI1XhQkTrv5gkXwp3jhEEkoT8V7zWNb9eGfzKuaj
   b9xk45co5ae6CQDXlfUVtebKNio0nZamM2U3/O1FVUzzukOfgtMtjHtO+
   4uYYmQUoZJTtpP2KGrXD2D3ffa9zz6oJl2TVflk7IsjR3q+Jsj288TXI3
   g==;
X-CSE-ConnectionGUID: yNG4HKczRPqcHI1SFCIvbQ==
X-CSE-MsgGUID: 2pJmDB8jSwSdEpYf+SQ2Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74618909"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74618909"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 11:19:20 -0700
X-CSE-ConnectionGUID: IsUab5fAS8+RjETs0meTqA==
X-CSE-MsgGUID: tK2pfwEHS9KDtmikB151zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="225347842"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 13 Mar 2026 11:19:15 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w176O-000000003h3-2O4L;
	Fri, 13 Mar 2026 18:19:12 +0000
Date: Fri, 13 Mar 2026 19:18:54 +0100
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
	jingoohan1@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
	bhelgaas@google.com, helgaas@kernel.org,
	florian.fainelli@broadcom.com, jim2101024@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	ilpo.jarvinen@linux.intel.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v8 1/5] PCI: Add pcie_get_link_speed() helper for safe
 array access
Message-ID: <202603131934.SHJnSGL9-lkp@intel.com>
References: <20260312163652.113228-2-18255117159@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312163652.113228-2-18255117159@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_111921_165509_803D125D 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

Hi Hans,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 80234b5ab240f52fa45d201e899e207b9265ef91]

url:    https://github.com/intel-lab-lkp/linux/commits/Hans-Zhang/PCI-Add-pcie_get_link_speed-helper-for-safe-array-access/20260313-220734
base:   80234b5ab240f52fa45d201e899e207b9265ef91
patch link:    https://lore.kernel.org/r/20260312163652.113228-2-18255117159%40163.com
patch subject: [PATCH v8 1/5] PCI: Add pcie_get_link_speed() helper for safe array access
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/202603131934.SHJnSGL9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603131934.SHJnSGL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131934.SHJnSGL9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/probe.c:793 expecting prototype for pcie_link_speed_value(). Prototype was for pcie_get_link_speed() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

