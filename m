Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0128C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lg4VOKVSngR8oIbwvQ7anmn0kEJI3kf6N5PwARaunaI=; b=Bwqcg+hDYopo5HCKAnWYZKtOzO
	5Ap/Jdt4om64PerDqbw6yET8MsCv3WAc8Ecmj8WMFol496EgKsqmxNMvgfzmixThQ3meqs0+MosRi
	rN9xaeH6/OseSqiXegBV9uni1mjtuW/bFYGAoq8g4zDJ4u+MD+BJ6oKpETFh6CcEZgFs2GZQyFjS+
	fokH+OrK0uRNd1HYaYS/f67EXQHEazGwKZjUbY9I05Ic8sI73m30wrFq3x5lEX0jkK+xfXhrprFa+
	g6mrK2Oxk1q0mnmdRA8hWx0MWqyTCyOmP7LmRBaLFIwmAb6gEgV4pRzT23XT7VT3DhaLtzUkedqqz
	goaKXKmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyCE0-0000000FVpW-0CGQ;
	Sun, 23 Aug 2026 17:43:16 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyCDw-0000000FVp8-3dys
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 17:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787506993; x=1819042993;
  h=date:from:to:cc:subject:message-id;
  bh=+77qb95wWuBtWsB/rTcGB1RqEA3o5s434ffTHriEE78=;
  b=CoxZAvNIMlcVE0YVURFtjRjnWJGj2vCstYgp6kbC8fOmn/0KJQw/ZbXY
   mLQWQSLca/e8f5oK7LuEks/OJgPEYyILZD37Z0hApuZFHzQrWaehYgBfM
   joOlBxkByLRfbjn9JID7oX5cYF1PHZ24ULsgTuIKz3RJ7EtKa9hoMqoTy
   MCUI3DqFk1yjnk0q9L27sNrv25aRoTIGwG8dQwG4ngBO/7wwOScbDiiAi
   YVeWWdeqUSsrB+aaGYGIDDjawBYydSMyaaJYqRKl+3iNhc0uZIlZ6G8Pq
   Cw8tZSl4gAFlC9evk9hlxVgkbDm3SpyL4aCU4IvJPQXt+Q77ILzYVdO3J
   w==;
X-CSE-ConnectionGUID: BpKzuwGpSYGCMP1JF05wgw==
X-CSE-MsgGUID: R66xQvvrTd+rNAYMrlsmOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="90483655"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="90483655"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 10:43:10 -0700
X-CSE-ConnectionGUID: kb/MmFyKQ023oqNrvqtO/g==
X-CSE-MsgGUID: U7/xGOSTSIOv/qnjX7aMAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="291644491"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Aug 2026 10:43:09 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyCDn-000000000o1-0mbp;
	Sun, 23 Aug 2026 17:43:04 +0000
Date: Mon, 24 Aug 2026 01:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-dts-ab8500-regulators] BUILD
 SUCCESS b173b6f24531107eacedf184f8e023b3227629e6
Message-ID: <202608240119.kvC7D8xa-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_104312_973345_506BFB29 
X-CRM114-Status: UNSURE (   5.01  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-dts-ab8500-regulators
branch HEAD: b173b6f24531107eacedf184f8e023b3227629e6  ARM: dts: ux500: Fix up regulator assignments

elapsed time: 764m

configs tested: 15
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha            allnoconfig    gcc-16.1.0
alpha           allyesconfig    gcc-16.1.0
alpha              defconfig    gcc-16.1.0
arc             allmodconfig    gcc-16.1.0
arc             allyesconfig    gcc-16.1.0
csky            allmodconfig    gcc-16.1.0
i386            allmodconfig    gcc-14
loongarch          defconfig    clang-24
nios2           allmodconfig    gcc-11.5.0
nios2            allnoconfig    gcc-11.5.0
parisc          allmodconfig    gcc-16.1.0
parisc          allyesconfig    gcc-16.1.0
parisc             defconfig    gcc-16.1.0
sh                 defconfig    gcc-16.1.0
sh         rsk7201_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

