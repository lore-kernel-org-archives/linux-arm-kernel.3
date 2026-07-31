Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B610C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r4KcnA0sJPxkgXpQ+evDNQW0Sx1E0abDRAGqbiOF1GM=; b=DAy76oP8G/Y3E75FMyiqh05kRv
	08UL+BQW8NaZycJrKrNhGvnHy/cTuH5oggQXMzdFk3Zr+4L1jACxjnuQS94+ECwPI5AruFw+k+Enn
	pRuJ72AoxOfWHSN9YEwcSNR6GFA19Os9fI0rVs6rW3IUxeknvx8CH1mqI14V/tKYcDsKE1pPmeD57
	ufna7fkutFweQjc0SVOWtgGX9aPPCNtqhttcejR82fkRQtobodh4rXdOZTe/gR6j/spjMopiGHRIf
	9BJRnNfbU45SQRLdYaxmFtM37wSJmNPbo5Y5mfwFqrJZWesVtHzbotc4XjVTJ1SdMM6+rF9H+fdPM
	AFsgdCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpo5Q-0000000Cgab-2bhx;
	Fri, 31 Jul 2026 14:19:44 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpo5N-0000000CgZn-3ARJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785507581; x=1817043581;
  h=date:from:to:cc:subject:message-id;
  bh=4qEbP+WKgDtLxkUtvO8zFeai2EyTOV0bfYqiNSvVSUc=;
  b=Ix02NlgT69HpO7eiFBSmc4gGEq1DjGcAKOP10X9B0eDtZKsM2+iFEXSf
   cRXQNb/Y1rE/grVy7LqA4AXo7cSO1Nni4tu8saRWCL+3nmakmOUIERuyj
   6k5vSWt2C5WevEjH9QlNgzoVJsflPKO2CHyjTgJbSzvTJYdpwzVYsoidp
   CPGdPifciVjuLtelqJ42xEuAL3TR/ABYBxn9V6EAIEnd/Gx3NF5sLml5m
   Ka/kuuxagOnSpCjC7PJbH1/Krmr46AdJOfgYLPgBq9tWpDq+9LoZc38Sv
   UuaWDhEOEPrSlz301MCJoCwCm7QQK7XB2iS+N5rdcuT94wOuKm/IbD+sy
   w==;
X-CSE-ConnectionGUID: IFChe4JaQ8yoMrzNJ9hkbQ==
X-CSE-MsgGUID: qAKqwl8UQjezLu48GK2C3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96792828"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96792828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:19:41 -0700
X-CSE-ConnectionGUID: QDyh81TLRUm6Y21Lcr4rBg==
X-CSE-MsgGUID: Qu9NOQ/DRvunDcsib8JoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="260652317"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jul 2026 07:19:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpo5J-000000001Bt-2q9k;
	Fri, 31 Jul 2026 14:19:37 +0000
Date: Fri, 31 Jul 2026 22:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 7c8af4b5b627d8bbf88c6783db49c52dd6b43f5a
Message-ID: <202607312217.CJcnUOXe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_071941_830641_58F80408 
X-CRM114-Status: UNSURE (   5.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/arm
branch HEAD: 7c8af4b5b627d8bbf88c6783db49c52dd6b43f5a  Merge tag 'imx-soc-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux into soc/arm

elapsed time: 802m

configs tested: 19
configs skipped: 5

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
nios2                 allmodconfig    gcc-11.5.0
nios2                  allnoconfig    gcc-11.5.0
parisc                allmodconfig    gcc-16.1.0
parisc                allyesconfig    gcc-16.1.0
parisc                   defconfig    gcc-16.1.0
sh                       defconfig    gcc-16.1.0
x86_64     randconfig-071-20260731    gcc-14
x86_64     randconfig-073-20260731    clang-22
x86_64     randconfig-074-20260731    gcc-14
x86_64     randconfig-075-20260731    gcc-14
x86_64     randconfig-076-20260731    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

