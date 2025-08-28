Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9ABC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gxE79aiFZd+XEa7cG65iGpYs74gkdT9t8zqUxTnTi7U=; b=BPEpE9+PYVXBQYr8TzFOmzCzdT
	NJekQxf0MHuM4WUdXepBIJ1cUCZYphs9C33dl7maaD8KLVdIXDveBT4KCESXmVL4JUzXgKAppdmiC
	3WTptce3+JENSVpbj1M9app4OZQfGpMWTeDq0dCXenzMnWg28K2c6bhIfeJ4vxTPwCoJt2k4M1KCg
	FUUqEU4XNxnr/C5JC1TmRTtQpP7979H1Zza6tRCpB8Hdl6l59cFofV3svQecZl2soflB68s+8pNwI
	5ehS581EHk3uOwvowv0pnC2GCSmjPyTxWFwsjSDtj/p77XipNqxqSwnk24drJVjuw0AZimAUB9YHJ
	gQv6XtRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbVm-00000001ULz-2qyU;
	Thu, 28 Aug 2025 12:13:50 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZ1b-00000000yxO-4Abe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 09:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756373673; x=1787909673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yuynSKYGfxPDARXbNkOVcirGGnm9MJdjYgpoYNnyvqk=;
  b=ehV/9kUqyLJJ1ta5HZu8VDDlLM+PqkQDiS3ZUk1Vswf8vwwNAHfXtpn0
   /C4PgZdJHt8hx3nJY1Q+wCdL6Gu+2sQQjH1Wz4/BFxE7AJjY55tgu/HKa
   v+zqAQq0wOJ0Z7oImEYt8kzeieh+jREk9jnTHjVnCc2fThmyz80RUa7Ib
   m2inOrbkLovkLaIzFIlAQie4lTkmgou2qAEIvzoXv9otKRxHYWr7gjYop
   e+xNAfF34XI4J76qUoIpKUCQo64sn8+imQNVjlKbasg8rrvUkdeLo1VwQ
   mR5hl9gdhDfkOq1Z5yfDh73HlSS9UZA/4jC9EEvHdxvLGD/CpZx/7G3at
   g==;
X-CSE-ConnectionGUID: OJvpfoVnSZ6t0cA2N2+2/w==
X-CSE-MsgGUID: 67NZ6ClgQ42hD2RvGag9VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58787356"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58787356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 02:34:31 -0700
X-CSE-ConnectionGUID: 3oW4vjZ0SqCDl3Ptz+McUg==
X-CSE-MsgGUID: M5KpuRq8SLWF14awLIFgLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170462631"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Aug 2025 02:34:26 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urZ0v-000Tbr-1n;
	Thu, 28 Aug 2025 09:33:57 +0000
Date: Thu, 28 Aug 2025 17:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: Re: [PATCH net-next v3 1/2] drivers: net: stmmac: handle start time
 set in the past for flexible PPS
Message-ID: <202508281615.ExryCwiA-lkp@intel.com>
References: <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-relative_flex_pps-v3-1-673e77978ba2@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_023432_225992_A57C8AE4 
X-CRM114-Status: UNSURE (   9.66  )
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

Hi Gatien,

kernel test robot noticed the following build errors:

[auto build test ERROR on 242041164339594ca019481d54b4f68a7aaff64e]

url:    https://github.com/intel-lab-lkp/linux/commits/Gatien-Chevallier/drivers-net-stmmac-handle-start-time-set-in-the-past-for-flexible-PPS/20250827-190905
base:   242041164339594ca019481d54b4f68a7aaff64e
patch link:    https://lore.kernel.org/r/20250827-relative_flex_pps-v3-1-673e77978ba2%40foss.st.com
patch subject: [PATCH net-next v3 1/2] drivers: net: stmmac: handle start time set in the past for flexible PPS
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250828/202508281615.ExryCwiA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508281615.ExryCwiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508281615.ExryCwiA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "timespec64_add_safe" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

