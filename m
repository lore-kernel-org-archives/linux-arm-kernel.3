Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3E6CD4F41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lKFA1iywRmDs93EoF7Go0HqXzi4PPoBJAOpuw+HXT/E=; b=EWh1MIQo6OWSyEq1tx5ZrsKiol
	ttIs1DQ23fUsvYrHMCO9aL3hKSx0c0CvC8dtERgbr6WL/KZDoVJk3sBgThhQrg8jCUQttP+CzF/RS
	xz13NOqDt7U97LmGFqX0WacTuB4Bek/qgjbncZYzzSXjhWmPRTbshDu0lObeqwd8Tj99Xv5wjlHZ2
	aXoIDeixW/odE0np7oTI1ETTWkaxxhNp2VRxvaRbCmcWYniAgNf/yhQ33D0poyqFS4wtkLdasK8J2
	f4VimQlXepOOC1mOaRTi7OkJtUXwoMdxwIeqW8JDWzt31tzTLDSSvbbOIMYvT3GiE/fBXxFsDoNeE
	un+eqwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdXC-00000006b9X-2L3n;
	Thu, 14 May 2026 21:23:58 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNdX9-00000006b8R-0hgV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793835; x=1810329835;
  h=date:from:to:cc:subject:message-id;
  bh=OTsrmU+bhyn3VZCxiU89rd4HceiWL/nRvXizikFUeoc=;
  b=RdbPoNJnZYmsL/GVY7Ca9el9xz0NhFlZ7A93hEVb8e3FvYLs85rb1bzP
   QicCKCpqeabHQEDSSWqzgddrcs7Pr9YcjqhOzi/0NbQE+rGHYbQ3O8K06
   /6t3xBCDmZA/QxHQgRpRhii3lX8/+l+AAkI97uS6pTD5evsd9Mw1iI1o7
   rcVMrNLJ6XElqmihkKeS3+10DGSL5eXo/NBW7GAq957JtUv6bdRLJocQ0
   hTeXkhMLrtMbVqStOWW0YscJCKCBL156+KjZCd19HMNXaJbyvGxhC/S3X
   iVMnSpB3eoQzaleYYl9nvRTgQHiZrF6HR3PSAScdYki/NNd7Ao+EqEEmB
   A==;
X-CSE-ConnectionGUID: 1wbJ8FZ0T7Ov8Z0BBzJmPg==
X-CSE-MsgGUID: uE2X/pi2SiiPrHeqzOpScw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603404"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603404"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:52 -0700
X-CSE-ConnectionGUID: WonYBUcaT/CoZFcLfA9TLg==
X-CSE-MsgGUID: 6nCqy1ElR7GKcsER09I3KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458958"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-0000000001I-2iBe;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 04:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:timers/el2-vtimer 1/17] Warning:
 drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in
 'acpi_gtdt_descriptor'
Message-ID: <202605150401.Pd0Z0ZjV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_142355_251750_75EBE588 
X-CRM114-Status: UNSURE (   8.31  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git timers/el2-vtimer
head:   e793e78f4ead18e3dfe5a3a1be912a7ec5bc55d8
commit: c58180850debdd9b2306a86238860769137f40cd [1/17] ACPI: GTDT: Account for GTDTv3 size when walking the platform timer descriptors
config: arm64-randconfig-002-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150401.Pd0Z0ZjV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150401.Pd0Z0ZjV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150401.Pd0Z0ZjV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'
>> Warning: drivers/acpi/arm64/gtdt.c:35 struct member 'v3' not described in 'acpi_gtdt_descriptor'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

