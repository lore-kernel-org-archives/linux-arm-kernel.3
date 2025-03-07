Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC6AC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hzP4NIQbR4u0Yf2YcmYooirpRXbk2Hp3ImATJuW1+UA=; b=fVqs0JLpJWRVLbX1NUZnxE8Kd4
	xLCEhBYRVwORB/oDuFngTzFIxb0IISvF3D69CbLYxelEvNxZRbyEmHhbr0OkGMy9e2El2C45VNQ5q
	A4kle2NGDlqVeioE9QAFjjaF8eDP4vBWRN8BGpm2rlfHvekE1gePKAFw5q9EbpUupUZLdA5oKgkQn
	ljNPH0mSVpZYDaLN+CxozIKaBA7a/6yQh5MkWdT+9Cm0HP42ILqakAVax52/qleCSBE1dKQC4UkNN
	yunz4nxO9JBylE+U0YtUO/ko9WYpn02zjY9mgEcf3XT013h9mjtu0kJgYBiKKH/dxhf/3G/UeOkCA
	AJV1xyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbZT-0000000F3Wd-4APy;
	Fri, 07 Mar 2025 17:33:15 +0000
Received: from [192.198.163.14] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbXq-0000000F3JE-0exJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741368694; x=1772904694;
  h=date:from:to:cc:subject:message-id;
  bh=tB32SeAuG0Oe4nbGTRfPmymBuKBmrgx1N0nzAyksI/c=;
  b=g4QLH/j+EXESbAlzjeX7eVSKgC1WMjF9EBhMGTZSSQgvET29Nm+CXxQV
   fr5/7IzmgXOCYchvCBuLgH7K9lrTP9m3gHOrKfRk6bAkhyqIsA7xnkrOI
   OFjob2QVS6LFQpli/HIZoX29t/Cof3ce/dqkdjTxh92Hf3kHsX8EatmIs
   t6VfRWOOhI53ilUjFnkeOZ9zV0i4JGJMVze8umiu4sx+iaikZ0V+a27T6
   zi0M+bCT1qkUdTL/W3Q6FQziiBudWyzMof9vm+r/T7VboJICFtUWI7kdL
   o7ZhIS+LBIF0cAoAmaRquWnf6FX07IMH9EVdgt/CiTwnreBRpHphbCoIt
   w==;
X-CSE-ConnectionGUID: XJ9y9KlgRLmqR3Hfr8Grkw==
X-CSE-MsgGUID: 59WURMjBTVGjHxYAqi+e4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42653356"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42653356"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:31:31 -0800
X-CSE-ConnectionGUID: OicsQBv+Q1WTniMxa6vTlw==
X-CSE-MsgGUID: 2X35aGhaT5uoj1l26DV0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124611332"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2025 09:31:30 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbXj-0000rF-2r;
	Fri, 07 Mar 2025 17:31:27 +0000
Date: Sat, 08 Mar 2025 01:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 da3c926ca8482b5c7fab6f017a7a3dbe9df86385
Message-ID: <202503080118.wa8GozRi-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_093134_235191_62893F9C 
X-CRM114-Status: UNSURE (   5.51  )
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
branch HEAD: da3c926ca8482b5c7fab6f017a7a3dbe9df86385  Merge tag 'renesas-arm-defconfig-for-v6.15-tag1' of https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into soc/defconfig

elapsed time: 1450m

configs tested: 4
configs skipped: 119

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm  randconfig-001-20250307    clang-21
arm  randconfig-002-20250307    gcc-14.2.0
arm  randconfig-003-20250307    clang-19
arm  randconfig-004-20250307    clang-21

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

