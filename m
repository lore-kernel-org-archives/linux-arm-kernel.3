Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD35C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bBqEZzG/3qP7hxDl/BVOuu/JudVBqOrYm20UfGabDRQ=; b=04j+myBVTf0HEPugcLuvYMlpkn
	J1QlKRsm7EHr7DC3mUTkWO7c60POW8UvP1xSRkcFIggEDtIRfVj4nW8lXsdNNKzbIp+VC48FAk/YX
	SKoDKNg03RQvRTpUNtLL7jjMx6oJm5apwgqPbcm7pN1FrYP8+HneDxvimBGzjFdhv+9e4ooFgoTMf
	FAy4/GqC/jBzVBY6GMl9PTmwG93zsU0GHAUDIabIHdZGWDTUtH7QE4zGi2sVq9oW4DUQEq0VnwCNf
	QvP0Ra2fuWoQYONh6kNqMugMAUhFhV+yOw+hlvpYDwkeiS/IqXWFS7+gOhdShOcAkwvZxpnSJbF6L
	WZSfh93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnurh-0000000129w-2Y4a;
	Sun, 26 Jul 2026 09:09:45 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnure-0000000129c-1dyh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 09:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785056983; x=1816592983;
  h=date:from:to:cc:subject:message-id;
  bh=iuCajqugv2Rsw8dWz/uBalGh+8jmv4QEMYv80kBNolQ=;
  b=N5fDQ1TQNrkjOrXKk7mRM9Lmmi4zQXVm1O0IZafFCnS+95cs5m2uxFOQ
   af0lJRAbfq9GMz2hwwzcCrENMfYSrdBbq/YV6tpodWsQ+gBzy+8gvDTXd
   Wsu3mJbghxFkmyWEPOSM+6Cfh/isropO/5fd2/5yKhnDn1FCFCSNu28RB
   9Zfzh8nBADClORA5ki2DkjnNhsGSmWWKFwdvnJByT470vpgzF4J8ZjXZD
   i+YnuduTse/Vf0uM31booI5ILLaf2w8MNlvKIvcSu2dax/cMxyu4YZJAT
   S4f+LDmyoMn0EWmVuMXNELaONVUPtQpeVQjh/MxOHVAsfMwVCdgR7lhwq
   w==;
X-CSE-ConnectionGUID: R+re/Y2DRtSltMwmbzMyJQ==
X-CSE-MsgGUID: DlyUZ222TQah2j3x8U+HMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89545737"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="89545737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 02:09:37 -0700
X-CSE-ConnectionGUID: p0GBljECRjqSeoHiLNax6g==
X-CSE-MsgGUID: I86cMoJMSr+FgEG2X1+P7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="252796251"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2026 02:09:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnurK-00000000cRM-0sK3;
	Sun, 26 Jul 2026 09:09:24 +0000
Date: Sun, 26 Jul 2026 17:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 0bcfbb1f786d43372319bae28ea44b5657931029
Message-ID: <202607261757.b2IkRVc4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_020942_531531_C2A395A4 
X-CRM114-Status: UNSURE (   5.67  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: 0bcfbb1f786d43372319bae28ea44b5657931029  Merge tag 'riscv-dt-for-v7.3-early-k230' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into soc/dt

elapsed time: 876m

configs tested: 33
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha                  allnoconfig    gcc-16.1.0
alpha                 allyesconfig    gcc-16.1.0
alpha                    defconfig    gcc-16.1.0
arc                   allmodconfig    gcc-16.1.0
arc                   allyesconfig    gcc-16.1.0
csky                  allmodconfig    gcc-16.1.0
i386                  allmodconfig    gcc-14
loongarch                defconfig    clang-24
loongarch  randconfig-002-20260726    gcc-14.3.0
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
nios2      randconfig-002-20260726    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
riscv               randconfig-001    gcc-13.4.0
riscv      randconfig-001-20260726    clang-24
riscv      randconfig-002-20260726    clang-24
s390       randconfig-001-20260726    clang-24
s390       randconfig-002-20260726    clang-24
sh                       defconfig    gcc-16.1.0
sh         randconfig-001-20260726    gcc-16.1.0
sh         randconfig-002-20260726    gcc-16.1.0
sh               rsk7264_defconfig    gcc-16.1.0
sparc               randconfig-001    gcc-16.1.0
sparc      randconfig-001-20260726    gcc-8.5.0
sparc      randconfig-002-20260726    gcc-8.5.0
sparc64    randconfig-001-20260726    gcc-8.5.0
sparc64    randconfig-002-20260726    clang-24
um         randconfig-001-20260726    clang-24
um         randconfig-002-20260726    gcc-14
xtensa     randconfig-001-20260726    gcc-8.5.0
xtensa     randconfig-002-20260726    gcc-8.5.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

