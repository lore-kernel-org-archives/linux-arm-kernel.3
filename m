Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B62F53D72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=giM+7jLybROuP1ofZ8EapF7YBLZ89liIPv3wFTUjfbo=; b=vWymPOqqNOwG+xHSfYxGSTAhEQ
	1jOdXMc4sqvm/IXIgVOVaKB1uwL2EZecbjDp9N8nRuZqh65NzGZolpXAYNE8mK6pOL/5YIOh773n7
	tOIRweQS/vNjLuELhR1jFRQYR3GHPEpzTNpvABRsJREnZn9KJLQImKmy5cRNLIPnGkA7XDqWOIg0S
	ZoAEhx5/a3eZgXG7OdECTKbtaimYbV80d/sKtg0WH+sYFYMTrw6T/CpI3UpMuti/oFoVQtZgwgvB1
	kILrCKvj2PdgPwgV28qBmKI6SrK7NuMzfnEgiM5G5rTnrzkFCiOMWxAdOpad8UV+fdZ+XE2TH+voE
	yABOdXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2B0L-00000004TuF-0tCC;
	Mon, 16 Mar 2026 16:41:22 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2B0I-00000004TtT-2wuS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 16:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773679278; x=1805215278;
  h=date:from:to:cc:subject:message-id;
  bh=dyy9kdZD6ABPlnalok2JdWrwqKChqmiBzgNHmMR+KY4=;
  b=fX/+JtNh95bZvUoypU8GsDPFzhJ1EpJQZ94tmvCyjKYEjqVTLBhVFnAQ
   1XriIqZIIb07VbGoj3NyBPiHhlX9zVaZZ8fhnBO/XAOhodzKya0uJLOAi
   mtt+zYyFtqtouKBjJoxoTfqYHCsPzreSnhG3VxHnRHUgT7vlSdTatz6rH
   NHoR2uKhUvz3xYlTJcnkdT12/5At2N3HgVfpVNSsQwamUbr40SPzyAn/1
   K7a59fUniteLjMx1lBwQGttmW7NNB7BC4pm2KIQWeQGRezGs/LLsQmDEG
   vgrgdhJNIx6hPQL5ilXMpgXXHrhKq5AIt8WYdgVxhKicjs4/bcXovvbVX
   Q==;
X-CSE-ConnectionGUID: 5gHEZ7d9RqqZuv2EY2xOQQ==
X-CSE-MsgGUID: H/Z+RFn9QsevfkHT1ItHkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74735810"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74735810"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 09:41:17 -0700
X-CSE-ConnectionGUID: PkcRoEO7SQ6UdtW+/bO6kQ==
X-CSE-MsgGUID: TgxmtjgSSpy+48+MdSwEHA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Mar 2026 09:41:15 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2B0D-000000000yc-29Tl;
	Mon, 16 Mar 2026 16:41:13 +0000
Date: Tue, 17 Mar 2026 00:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/fixes] BUILD SUCCESS
 9e22e9c4a5bd208a2d17f0b1a8414c170b4e5939
Message-ID: <202603170051.lC0OuEFU-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_094118_788076_12950781 
X-CRM114-Status: UNSURE (   4.33  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/fixes
branch HEAD: 9e22e9c4a5bd208a2d17f0b1a8414c170b4e5939  ARM: multi_v7_defconfig: Drop duplicate CONFIG_TI_PRUSS=m

elapsed time: 1286m

configs tested: 16
configs skipped: 150

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc                   allyesconfig    gcc-15.2.0
arm                    allnoconfig    clang-23
arm                      defconfig    clang-23
arm        randconfig-001-20260316    clang-23
arm        randconfig-002-20260316    clang-23
arm        randconfig-003-20260316    clang-23
arm        randconfig-004-20260316    clang-23
arm64                 allmodconfig    clang-19
arm64                  allnoconfig    gcc-15.2.0
arm64                    defconfig    gcc-15.2.0
arm64      randconfig-001-20260316    gcc-11.5.0
arm64      randconfig-002-20260316    clang-23
arm64      randconfig-003-20260316    clang-23
arm64      randconfig-004-20260316    clang-19
loongarch             allmodconfig    clang-19
riscv                 allmodconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

