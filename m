Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F6CCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YOUr8qrS1uJrRqIrwGUAZR8TAxDRGHD7I4qcYE4hLUM=; b=rsZlKW0AGVYzMWHAdfBequfrd7
	SmszKY/9FQ4tJzjhxlcVANK8qfB4iMlNKfIB1g+R4X4OT/28JvvwNLvtzT4qyZGAFk102espBsv+T
	OHiJvAh/vF0/5yfRjwGmAFbxAkNcT7L8J2yee/DE3hhKtqasyCKj2Yt0pJFq3UWRwi4AY/fJw48+K
	hgun74NKDOwb2tmxLJYu2UGmDXupkke3A0c0HpaVmZiaOcbzRQ/qqhLTcZiQEvMHfiZ166a+k6LlR
	8mk0D4MTarouGhsF9Lj9ExNzC9V7e8+S7Cz8NZe06PTPG0cIsqqDHo/ZvgqMMHrjnhUrHe8slzWj1
	/zKQEBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1WkI-00000003mr6-1Pi9;
	Wed, 24 Sep 2025 21:09:50 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1WkG-00000003mpv-2T6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 21:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758748189; x=1790284189;
  h=date:from:to:cc:subject:message-id;
  bh=cEsRtEePLDI02rhCx+KN5Qo9Xw+0ajhA4dTALVviC5w=;
  b=bHVqPQSRZqoRdqEKg8EX9qfkPgwXeD8VlwRBPCdwBHZwAfPRXXTshyE+
   i+vqiIstMBPLvij5uX8qNk0DVHF5DEO4DDYkwC0Lp6o8LkzDYmxUVEPgj
   vRIg+I17pjfFQ2HEVuE/qe+4MH6wUDLNl87PVY+xKh8ul9G+r02AU7LDm
   RZGYY6mMwKYbQxLOgx8R7JrsmlH42F5IdjwV4GLtlYgdAwad4kZo+scxI
   TrrMw6P7mYUMldVpkAOXj5rloM7p32ux0Z6VlK/XP8K1ffjLALwAQw71J
   8zbmEtvpePTG//W/LFJEMAtXLpQKgu5lSjqRDNE9Q67BGXIX2QLSwbeRk
   g==;
X-CSE-ConnectionGUID: Zs4cnM+FQTinsS9ep6r7Wg==
X-CSE-MsgGUID: ASVp1n2JRuKt5eNgMGDY8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60759635"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="60759635"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 14:09:48 -0700
X-CSE-ConnectionGUID: CN/pZmT5R+qRpPJWG+YIzA==
X-CSE-MsgGUID: yiFZiirhTbOwcg+1bMQC0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181145587"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2025 14:09:46 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1WkC-0004ZF-0U;
	Wed, 24 Sep 2025 21:09:44 +0000
Date: Thu, 25 Sep 2025 05:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 2136c694a045c347b52366a297d107329796ffe5
Message-ID: <202509250523.cXg9qNrZ-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_140948_670401_887166B7 
X-CRM114-Status: UNSURE (   5.95  )
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
branch HEAD: 2136c694a045c347b52366a297d107329796ffe5  Merge tag 'qcom-arm64-defconfig-for-6.18' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/defconfig

elapsed time: 1386m

configs tested: 13
configs skipped: 117

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm               allmodconfig    gcc-15.1.0
arm                allnoconfig    clang-22
arm               allyesconfig    gcc-15.1.0
arm    randconfig-001-20250924    clang-22
arm    randconfig-002-20250924    clang-22
arm    randconfig-003-20250924    clang-22
arm    randconfig-004-20250924    gcc-13.4.0
arm64             allmodconfig    clang-19
arm64              allnoconfig    gcc-15.1.0
arm64  randconfig-001-20250924    gcc-14.3.0
arm64  randconfig-002-20250924    clang-18
arm64  randconfig-003-20250924    gcc-12.5.0
arm64  randconfig-004-20250924    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

