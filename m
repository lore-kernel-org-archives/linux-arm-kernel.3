Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFD3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCi78B7aKj3xIvZH8blOvIWfudPbJq6fDLGpUrk4Xyo=; b=GGgTFufsWZITpv1wI7DNeSJ9mP
	+8LiNUbjWaZXH7GIgxZ7ne4e/s6HbEnbL9/syMKGxIZ5duS4BV6CNFllNbA6XlRNez1kGCmZAL7n3
	G6faahlNjRJARV1Y0J+xd4kybDga3vaQKqLWzxh4gmv9KA7eniY9Iw1NoPKIJlNhfIRsY/hJChXGE
	Y+zXkh+4we5zbTe8p36boTMlbFDBbl4JHlFcIWVFoxJblsrWc19E1Ri1F6tNsz6NTsQP1bsMTTokr
	k/FaL8ix7FZdrMuQjzmJQWWJg9DoOX1uaqsEAH9mNEw0iRL4Mb4TswqSzIPbIjNfyRFMm8CgqvGZp
	kNSdwusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnin-00000000XB7-1Zae;
	Fri, 17 Jan 2025 14:53:17 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnhV-00000000X1L-2Esd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 14:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737125518; x=1768661518;
  h=date:from:to:cc:subject:message-id;
  bh=Wbdouy0MEjE93Q8+Tw7k6AdQtNfcsn1f6drsiglQwYc=;
  b=IhtRmDR/f37AwM3nyH88A9oR+XLhWUI/MmrKj56zoEYSIbUDkberFwd7
   NK3r3xFMKv4j2jhPTDoL6WbtbGu0I3hI0fMUNJdK7qCl/7A/uIuGLvk7z
   RbT7dEduMXAts2TUn2w+egSaxgxnOyG9Z3uBPYm4HRbfWocSlUDyrUite
   hLdqZEvVUoH29vftJ2deXOgTa4OL+B+bld2kzckgqc/fyL4EhFtYY/DwM
   vY1xJYuScnDSfQ1vhe+hrhBwepUz7XQL0xFQlQtrBn7avBAISA9SvPIhy
   FVxpSEmrRGWoDqWgwHLZj4acSuKihJWPlgE6u4HZODB+tIl8Eb1Fp4GFg
   w==;
X-CSE-ConnectionGUID: Lw1AUdB3RQ2nuRNRnHxt5A==
X-CSE-MsgGUID: 8FoUSqHrTzyqdT1yuGKnZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48145907"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48145907"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:51:54 -0800
X-CSE-ConnectionGUID: +qIlTZ+OQ9uYNcobe/U6AA==
X-CSE-MsgGUID: leRm1k7NShmrqtzF4j2mqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="110823714"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jan 2025 06:51:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYnhO-000TLF-1T;
	Fri, 17 Jan 2025 14:51:50 +0000
Date: Fri, 17 Jan 2025 22:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:omap/dt] BUILD SUCCESS
 dd504db5cd4a4bb48e8b96159e23ece89bb54d90
Message-ID: <202501172207.3ZOyRqSF-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_065157_580338_FA4748FB 
X-CRM114-Status: UNSURE (   5.35  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git omap/dt
branch HEAD: dd504db5cd4a4bb48e8b96159e23ece89bb54d90  ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

elapsed time: 1442m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                   allnoconfig    gcc-14.2.0
arc                     allnoconfig    gcc-14.2.0
arm                     allnoconfig    clang-17
arm                     allnoconfig    gcc-14.2.0
arm         randconfig-001-20250117    clang-18
arm         randconfig-002-20250117    gcc-14.2.0
arm         randconfig-003-20250117    gcc-14.2.0
arm         randconfig-004-20250117    clang-16
arm64                   allnoconfig    gcc-14.2.0
csky                    allnoconfig    gcc-14.2.0
hexagon                 allnoconfig    gcc-14.2.0
loongarch               allnoconfig    gcc-14.2.0
m68k                    allnoconfig    gcc-14.2.0
microblaze              allnoconfig    gcc-14.2.0
mips                    allnoconfig    gcc-14.2.0
nios2                   allnoconfig    gcc-14.2.0
sh                      allnoconfig    gcc-14.2.0
sparc                   allnoconfig    gcc-14.2.0
xtensa                  allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

