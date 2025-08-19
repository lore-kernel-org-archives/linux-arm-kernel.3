Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B05CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/L5Xhx4PLx+jkDnLlQ5xIqZZVyHIkqP1KN1Y68a71s=; b=1Oz9WfprOs4pDVn0hmWkZfT1Pa
	TZFphlzoCC8up/4mgQhNwEraHocQsq3lr6m5g69rbHtSJVKCsmF51ZQCE8fdQ3afIFJRqBQRv0WZ5
	tK0UMBkSNB0tFSyVBtXVRlAiLDNKpxCtZiPO6Q0vb8gSOkGBq63EaMcqqQR+HdA0UhohgzrAt9PN7
	bLygc/TXDLNSqWhZ9KDFJBcB5QZ+i5GJQRrAboEgwvmOfFwoD5qM3kY7wf6oileSEAalfbuU5w5w0
	xRJ50gGK59+RACqjDzTj58TXk7JRXIsiL4ESNgPMJGsxf0nOKBr6DHj7fE/pmJwUrVTmICbO90ic1
	WuYfENTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDCg-00000009HlX-2MSE;
	Tue, 19 Aug 2025 03:40:06 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoD5U-00000009GoA-2Ssp;
	Tue, 19 Aug 2025 03:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755574361; x=1787110361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q3526BUAxicDe4mK4TVB0A18N/m1MKyoIMPvQ/IIODA=;
  b=SuEX/1RkNy4obxPaXaQhDhOW+iqMGIPq0VAq08qEmvmHTcxAMjrIcxGH
   r9oDrzJbdFg3Q54nJoRsbLyRR6ts4OEHXYId9Nc7Fc2MBI34lJGgeB9l4
   CqC3agshmkjuAQurNM0B1BW0WWYuuG6Hzfi4U+SyCZWr5u7ZyMzfJmwO2
   C/d76vndVrykWmrg4gFZyMLcHTpMIZBrl7ttmrt0fzZ8JEQcxBJWRKLm5
   ItWy+QqA+KJ/GzxEhRHb99Mk+446XzWdLYdVPkIH7JDUIBgw6cwkF0Kss
   MYq7r1KEWQ3Zk6hB2v8HNvs4CfmNnOfY1NgHPKwtoLXpp6lHG6GxTlR3t
   Q==;
X-CSE-ConnectionGUID: UuToTHsJRdKv3aWsNZse3Q==
X-CSE-MsgGUID: kZ9fH1nuQWqm2Ol4almaBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="83236060"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="83236060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 20:32:40 -0700
X-CSE-ConnectionGUID: Fee4F7f7ToaYhdNs6ihxCA==
X-CSE-MsgGUID: TWhnzNskQCqlPV1RiTRlAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="167246268"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 20:32:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoD5O-000GSx-0d;
	Tue, 19 Aug 2025 03:32:34 +0000
Date: Tue, 19 Aug 2025 11:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Velikanov <me@adomerle.pw>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: Re: [PATCH v1 2/2] phy: mediatek: tphy: Add software role switching
Message-ID: <202508191054.otlyeeg5-lkp@intel.com>
References: <20250814234825.810-2-me@adomerle.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814234825.810-2-me@adomerle.pw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203240_674017_49DCCD43 
X-CRM114-Status: GOOD (  10.89  )
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

Hi Arseniy,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.17-rc2 next-20250818]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Velikanov/phy-mediatek-tphy-Add-software-role-switching/20250815-075416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250814234825.810-2-me%40adomerle.pw
patch subject: [PATCH v1 2/2] phy: mediatek: tphy: Add software role switching
config: arm64-randconfig-001-20250819 (https://download.01.org/0day-ci/archive/20250819/202508191054.otlyeeg5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508191054.otlyeeg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508191054.otlyeeg5-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/phy/mediatek/phy-mtk-tphy.o: in function `u2_phy_software_role_switch_init':
>> phy-mtk-tphy.c:(.text+0x31d4): undefined reference to `usb_get_role_switch_default_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

