Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5317ACFD30D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OXOifcyOhvWg/DSNnY8bnj3M8DsI7B4K1bFLJ7qx7gc=; b=IZDr0kG62rYLFCc5q0WMgKzzMC
	m9bu1ezBVEK4yygSlQQ8mjpFbBvxgd8N1T89cVgvbzx6E+HUIuUyLvYYG3P+zMLmDz3G8yCjQhwEZ
	/McPxxQsN0P0H0JFwkHj8GeaHqM1N8lmRR9Cqf1bNZBFNuaTQ161dL7mRAoCwCKyDiNR68i+P+mLR
	wdvle4gW2S/e+sxJliN2fQroPnOedbXJZGnxg7iNlLGMTCPh6Y48LV+rwdWvm8LiYlb0rp84Vk/fs
	4DkM89OSZ0thCNEX3OZ/YcDhx2QCYES2yiGRTHd0wbed0XOmHYow+evQ244NqQfjYcGmB7DcYxTd5
	dtmsv0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMwNt-00000009wQc-0puk;
	Sat, 22 Nov 2025 22:47:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMwNq-00000009wQB-2LgC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 22:47:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763851630; x=1795387630;
  h=date:from:to:cc:subject:message-id;
  bh=SGAiFhxUIi9epffWomz+r4OwlxxxXcuyxLXol3w91V4=;
  b=CcWZR0cWCw2dVUOzGHtjPyVY3JGApWBu1tP981GJOFoTnCi0mBxxczv5
   7AhvZYtHLp2C9VSk+BCwkkOeZ8g/fXyNX37B+RVV/Y1FIoGjFfnSRpBUc
   z8dkvcq2OF+r8i53pTmRWvdn1T/hvWNTpihgTef/ZfYV7zeNvAL7Ylm7R
   VQ4eWnaBQ/N0p+CzgbBneluSIJp17pVcXJIDA5uKQNLYs1+A5eQsxpZRi
   ESvP1OnpN+gBfuCdi0jfzkt3pFGH0IrBYrxVYsSeSm4ZJZOBDzk1zJhe+
   9Y7ORJhr1Jf4zfBwYDuXnUULw3IAhMhW4mFIPNQnNbjLgpYf+JTtAfeJ8
   A==;
X-CSE-ConnectionGUID: mVuNuJ65T1KgI2n6spAiGw==
X-CSE-MsgGUID: vJKi6E1cRoCkyLEwXoMBGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65844508"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65844508"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 14:47:08 -0800
X-CSE-ConnectionGUID: 9aoh845UTQCYXdDXZbcfAw==
X-CSE-MsgGUID: N8jl7WNyTfqo6ssDQwcy2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192772946"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 14:47:07 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMwNl-0007t5-09;
	Sat, 22 Nov 2025 22:47:05 +0000
Date: Sun, 23 Nov 2025 06:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 1a263d3a70b9c80ee9de80d8c39e3e39b9bfd17b
Message-ID: <202511230649.wsZ0kY3h-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_144710_656814_2AE3BF67 
X-CRM114-Status: UNSURE (   4.96  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/defconfig
branch HEAD: 1a263d3a70b9c80ee9de80d8c39e3e39b9bfd17b  Merge tag 'v6.19-rockchip-defconfig64-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into soc/defconfig

elapsed time: 1538m

configs tested: 2
configs skipped: 151

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm    allnoconfig    clang-22
arm64  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

