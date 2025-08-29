Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24282CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 18:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHNzLHhz9TbKR+0AHZJJRMTYYhLsO6VaF8JlxCCHo5w=; b=c2xX+i6myRzsp4z6GpJPp3RR/S
	w2cVJIt7/DWVyOGQTHi0/nEmB+JEk6k8RcEvBSLAi6YppY72HsJUQR5i+ZolglkzY+lVU30aztMmr
	869d0AC+fAicEG9B1PswyTIRCUBqwGnIreXhANf7oEp9mGcQU0N4W2eH1UoribHVSloc4WJKt4mK4
	qFVBNdsx258pWJlmOepbzYGIonVzvGJHl8upmTdfEbB2lShg4AtYECU6N2bHQNmz0zuoV7QmstDWr
	iIpD+zoiNI72V6ElaunyyEyitdt+rDUyO7pXoMoLDTZART43LOFnrB8ubQq2idaOJjsgffZuHt+5a
	BW+hM9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3py-00000006dHp-1tr5;
	Fri, 29 Aug 2025 18:28:34 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us09x-000000062Yk-3nsz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 14:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756477978; x=1788013978;
  h=date:from:to:cc:subject:message-id;
  bh=S+4TYjdXCNb5n1/2Cpesfah2GAO9RVl3MMDJ9bG30VY=;
  b=h/DofVqKG/AwaXQMprtGZagP5cz1VgWItD2By39DXpsZi6WLkyTvRx9l
   xj1eMH9XPvGbIXk3jguB7ecE81jW9LEBs/1wDIQmekt4hsTVTe1NUF5PW
   /UMItgxGHJANUQYLoGNQI2uOyMnn3v2Tx+A1PP8FilCUDr4ByENq8lvs7
   sEiRmNzkAqEPhU1aKttTwzIxXxA4wr2dEQWdGASXP9eEi1bc1CX+NFhly
   UphR8klh2pheO8aFkswF+MMTE/03kXeHzUu7LWI6DHQRgQXgoWb/9pUBc
   a4q6Mf13xnKVSgsRi4UtNEYQnvJqP6/K+8L/PuWGMaobxqiBX7OWgTeE1
   w==;
X-CSE-ConnectionGUID: mB/BBW26QtqrXxQjyhoDKQ==
X-CSE-MsgGUID: AWJv5fnqSRKoKn9f+pBMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58471799"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="58471799"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 07:32:58 -0700
X-CSE-ConnectionGUID: /c+Z3b4dREe+hYL1XJsujg==
X-CSE-MsgGUID: L+3593C+Rr6+zc/Mz61eLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169697260"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Aug 2025 07:32:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us09l-000Ugx-1o;
	Fri, 29 Aug 2025 14:32:47 +0000
Date: Fri, 29 Aug 2025 22:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-dts] BUILD SUCCESS
 9c66753641765cc2f5ee1528a23f3fd2fd77cb93
Message-ID: <202508292248.OATUQLsf-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_073257_981284_0A3B9DF9 
X-CRM114-Status: UNSURE (   5.82  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-dts
branch HEAD: 9c66753641765cc2f5ee1528a23f3fd2fd77cb93  ARM: dts: ste-ux500-samsung: dts bluetooth wakeup interrupt

elapsed time: 1146m

configs tested: 7
configs skipped: 124

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm             allmodconfig    gcc-15.1.0
arm              allnoconfig    clang-22
arm             allyesconfig    gcc-15.1.0
arm  randconfig-001-20250829    gcc-10.5.0
arm  randconfig-002-20250829    clang-22
arm  randconfig-003-20250829    clang-22
arm  randconfig-004-20250829    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

