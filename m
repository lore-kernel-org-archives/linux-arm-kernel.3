Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD60CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 02:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9vtIfPq7mAAXhqw58ME1FlR38Jq1BnviOtdUftbZiYk=; b=ST7unmJj/iiZlEUVBpK3hYvI65
	e4t1SY1qqclvT+3hB7PTLFXr0XCV6luRspKa1Z3eT0Suy7CQdn5LHGkIez1B/s9ihDBXWrzHqCk52
	n1iaolPY7JC7yZIj6ubgozHyEZRp5MXe+ysPMrGsfyY7RLy8yz+XKgsObT0O3NWYdrdhfYtdvhBNz
	Hobz488BIGFizbrOPnnc71ZIcpR+PH+OpjwYAxqzZ7v3SndH+yG1W2D4S3dPxEW6ZNsS6Nd8L0Efy
	hoePL87qvzC3IrW1D8/K6P3mpbb6KuZesQI8jRWHWrKT9xEx6gkHWo7QZZz+NvTIt2FLNk9jf9U5w
	e8ZDuqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWmYW-00000004eBU-38rS;
	Tue, 09 Jun 2026 02:51:08 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWmYU-00000004eBB-0fhK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 02:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780973466; x=1812509466;
  h=date:from:to:cc:subject:message-id;
  bh=lpCg3edZkkWflTV4kM+tQJguhHYQqG7qXP22/ofcZ4s=;
  b=S0hMNpRmAIumOP5mz19HIUzDsKKg0hrCtmh4qUPMFlV0XarY9jF6sDol
   BcWDSOZF7Y42dibftZKXgovc2mOU1pX6OTQYqiwCiNT34HH7YY2o68U/Z
   QHGGdNeiKm3t/yhXDwwpnezuSwahxYN30ToxF9ouksIceTrNIGnF2oEkM
   KLNGZWu0iJfgUJXw/V9p4PTvQeexKLgzSr7xaaqD2rXF4MVtTFJCemVA+
   0Wa99CEsS+9gRKb4Z/mQPR2QUvAPTnlaPvQFpgKULvBMKKVrSNYu26ceK
   0zC1kLewQvGlDWlJwuEYr8t6UEubXghS0E2+y6FaYxvufjB0BKUT9C7Mm
   Q==;
X-CSE-ConnectionGUID: U21tssxvQX6Rg2V7XfV7jA==
X-CSE-MsgGUID: 4CzjPpxsSleEPt79SF7UQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99303728"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="99303728"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 19:51:05 -0700
X-CSE-ConnectionGUID: 98wVP2XWSlq/z7eEdeeGTQ==
X-CSE-MsgGUID: CgxLfDarTDaKmBQ4Li3/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="250817822"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jun 2026 19:51:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWmYP-00000000JXK-2gQq;
	Tue, 09 Jun 2026 02:51:01 +0000
Date: Tue, 09 Jun 2026 10:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:cix/dt] BUILD SUCCESS
 4bf90cff838c8ede56216d59f1d64ef25315cfa9
Message-ID: <202606091026.HHfwjgJx-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_195106_259638_D4595787 
X-CRM114-Status: UNSURE (   4.91  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git cix/dt
branch HEAD: 4bf90cff838c8ede56216d59f1d64ef25315cfa9  Merge tag 'cix-dt-v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix into cix/dt

elapsed time: 8958m

configs tested: 5
configs skipped: 231

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc        allyesconfig    gcc-16.1.0
arm64      allmodconfig    clang-23
arm64       allnoconfig    gcc-16.1.0
loongarch  allmodconfig    clang-19
riscv      allmodconfig    clang-23

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

