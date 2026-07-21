Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C94C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 00:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XN3t6IUtMWHgF/uymhRTJckIvUKSgjsqmU/2sUJ04FA=; b=E8s6tgOjdZY4fI5R3uu3z1cMy2
	Ny7OeF07UZJz+J6oOz5PxZwBvcExHE2dxd26tLOLH7Aq1metgDtWfh+WgVsZs5FHCurSLKl7oDKo0
	nOMrj72C8OQcJeBjcS92ZQf9Exa9JY6baAPBb6BrOegygZBdaTpAoUsHwFlsuKkAUkoh08LrnkH3c
	+Ye+j6ah50cKJxNSXfp3YiiEukLkzGKEHvd+28MpNrlOPL1AQUmJja9Rga/Tga+lnb1+eH7/e4oog
	V488cC0b8QJPqi1ss+ufKS2mZfLtHqRLptHvAEgXWF4PFONMSiMU6FbE64aaRzHYQK9dMjb/0asxK
	vIs+5oJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzF-0000000AatS-2PRU;
	Tue, 21 Jul 2026 23:34:57 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzB-0000000Aasy-1jFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 23:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784676893; x=1816212893;
  h=date:from:to:cc:subject:message-id;
  bh=IexSWM1kyeT0jf4wTBHyWzo6OHIZkS061yRFNiXSVVk=;
  b=AHINEwCxGW6jOB4FNd9yZ65XTQV16V4fj2NPKoqRS1Erjw8weVCA81I2
   KQx3D/bGQRxRbpqmZqxAm0hAPDZfaciAd6ZdSQVrOxM6ZvIh60zLjarGU
   cyltap81rrFAp5xLCaZu9b570hZztkrN40iCg0ygZzIWy+rakP6eCw3tR
   apRAKzj0uOB9UIgN5mPhdQtVcbfUqS7I11K0bjoKBMGx4sXOF/RcydlMM
   rdnJG20jeXGzf9UhHq2vw/Jy7W2P3a+GoxyMKP61WmqHumtgaVCz6uZ0j
   pEIGakX+6xRkCrZfZQ83d5u0J/CBJYaQC/4lwDV/Am0DQF1k7/xMFolrP
   A==;
X-CSE-ConnectionGUID: EKpXLU2RSaeBMFqc5mX0wQ==
X-CSE-MsgGUID: xbyhfyQ2QVyK0ZLd+7nB3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="72834047"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="72834047"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 16:34:51 -0700
X-CSE-ConnectionGUID: BMzy4p6pSXyrQynlGvmlQA==
X-CSE-MsgGUID: NC04mrFiSE6J1Wzcgo8r4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="254503574"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Jul 2026 16:34:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmJz6-00000000YAd-0PON;
	Tue, 21 Jul 2026 23:34:48 +0000
Date: Wed, 22 Jul 2026 07:34:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:for-next] BUILD SUCCESS
 11f8710f99a18b13bd1868202813f4d5dad7cbcf
Message-ID: <202607220737.E6v7xsz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_163453_485158_812C2B06 
X-CRM114-Status: UNSURE (   5.71  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
branch HEAD: 11f8710f99a18b13bd1868202813f4d5dad7cbcf  soc: document merges

elapsed time: 6082m

configs tested: 22
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha               allnoconfig    gcc-16.1.0
alpha              allyesconfig    gcc-16.1.0
alpha                 defconfig    gcc-16.1.0
arc                allmodconfig    gcc-16.1.0
arc                allyesconfig    gcc-16.1.0
arm            ep93xx_defconfig    clang-24
csky               allmodconfig    gcc-16.1.0
i386               allmodconfig    gcc-14
nios2              allmodconfig    gcc-11.5.0
nios2               allnoconfig    gcc-11.5.0
parisc             allmodconfig    gcc-16.1.0
parisc             allyesconfig    gcc-16.1.0
parisc                defconfig    gcc-16.1.0
riscv   randconfig-001-20260722    gcc-13.4.0
riscv   randconfig-002-20260722    gcc-13.4.0
s390    randconfig-001-20260722    gcc-13.4.0
s390    randconfig-002-20260722    gcc-13.4.0
sh                    defconfig    gcc-16.1.0
sh      randconfig-001-20260722    gcc-13.4.0
sh      randconfig-002-20260722    gcc-13.4.0
x86_64                    kexec    clang-22
x86_64             rhel-9.4-bpf    gcc-14

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

