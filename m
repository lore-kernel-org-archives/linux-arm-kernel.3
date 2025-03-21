Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE6BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x9LTMVNQpdMpi9ZDcWVQN8Cz3yzZrRJQZB4oBe4vtAo=; b=B7yGFUSCIileE6viUQNYu8x/9m
	Z3mxcIXE6zFsOIoCUQ435mduwoQcOS2BvPUKxZ9pX1xDut2YpeijroPFWpwKYh7p9tP2gnQYF+ZoP
	X8LbYgRGrJv8r+ZTtJDVEBy/iS6vQF0yQTXvTKf5Ued9UzgJSsVrNuH1r9j4Smml5pChh991EnydN
	mnSFRtSaRvv2qk9X5JqDdtPfoT4mtXwPe6kZBMEl7+ZeX9SahLlu+kzSPw+JHM/wbZR8hKtCQ43ks
	fsLRSOc3Z8QUP87skM3ZK4Kur9m2mvYvDBCDgu0M7wAGQBumohXxYnoPg1EMxh22Hp/qVomwPo2fp
	YAdhK3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZgC-0000000EXAt-3Ocl;
	Fri, 21 Mar 2025 10:32:44 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvZ3w-0000000ERU2-0fL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 09:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742550792; x=1774086792;
  h=date:from:to:cc:subject:message-id;
  bh=WUm7shAAIcmFO0MQ5vPpFB1k+LaetMzij3n4JBsVojo=;
  b=PqQn31Ob1mQo55pwwzw6olE6Yb0RwIQsPKBCMQlTWg4BzT0RCCS8ZCiv
   pGkInZxyD7I1nY+kaxgOnJRj2J5XFP3kgpiB5wwxksF0N6JyGnMxIscf0
   lgPj/qNi//TRndT/UBO238jzSPR6lcIWym2Q0wWGZPZp9uguJaYuNq+/8
   lm1HnMZEEvH3ZAL5c0yoo5+Vu9YuOIncYj1XXn2+CJeZIP3S9tbk5+bXo
   jkK6c/DadLHGKjJmu5p0Vz6pQyli2JHctP3DacIvyIwe1et0GVQyXZ9Uo
   5u41Wbl9nwH6IMjKqMKyOslB4yV3SG48BfK2+YPAhdTQ803bHH2TimpOK
   w==;
X-CSE-ConnectionGUID: lUW5o/MpR5SQAmsSCIDwuA==
X-CSE-MsgGUID: EyzcbPU8T8iLlV0YKeQxSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="54030266"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="54030266"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 02:53:11 -0700
X-CSE-ConnectionGUID: aAEjjGj1TmWzQ5ZhUtDtEA==
X-CSE-MsgGUID: QMfNuW1ATL6iV/2QsFEPtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; 
   d="scan'208";a="146576315"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 21 Mar 2025 02:53:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvZ3o-0001FD-2m;
	Fri, 21 Mar 2025 09:53:06 +0000
Date: Fri, 21 Mar 2025 17:52:03 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:amlogic/dt64] BUILD SUCCESS
 67c2799bf11fd0f1323579dead240bfda5b6a3b6
Message-ID: <202503211756.oeUukz8l-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_025312_233228_39E931E9 
X-CRM114-Status: UNSURE (   5.33  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git amlogic/dt64
branch HEAD: 67c2799bf11fd0f1323579dead240bfda5b6a3b6  arm64: dts: Add gpio_intc node for Amlogic A5 SoCs

elapsed time: 1446m

configs tested: 11
configs skipped: 184

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc    randconfig-001-20250321    gcc-13.3.0
arc    randconfig-002-20250321    gcc-11.5.0
arm    randconfig-001-20250321    clang-19
arm    randconfig-002-20250321    gcc-9.3.0
arm    randconfig-003-20250321    gcc-5.5.0
arm    randconfig-004-20250321    clang-21
arm64             allmodconfig    clang-19
arm64  randconfig-001-20250321    gcc-5.5.0
arm64  randconfig-002-20250321    gcc-5.5.0
arm64  randconfig-003-20250321    clang-20
arm64  randconfig-004-20250321    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

