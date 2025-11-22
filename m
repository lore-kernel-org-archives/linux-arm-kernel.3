Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FD1CFD30D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AOd54ki+XIqWfot8TGQRJ3Ioy22sn23+LylVXBKEbP8=; b=tDK1NcCDZSsfV/INm1hT83nL1U
	IFGurPS09FgsbPaNMCfH4Fcc91adV2sYPjKOgq01/1rj+KFc2dd1WLIpEoPCk46kELRZDeDxd/ErU
	SxAvefX3zMxJB2egc2D5v3S6RlYKCICwbUa9XouIUbIxQLHzmQmcvpt5mixMlK7SbfHYMyqUJQY5b
	JujsEWeDIsDdmG1A05T5n7T1Z4kMIQAlgq4Ne2xmYDMwNs0mi96UWdxx/MtMCGfOhG4rMc3y1SWyG
	Fl7la9NHcs17Ly6v2OF+VHun1PoMT/ohz7kBNfcXoNGdDMT54J88TTYd4HhDezHKpPaF5rPYGPP+z
	ky8pAJZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMwaT-00000009xAq-0pDB;
	Sat, 22 Nov 2025 23:00:13 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMwaP-00000009xAP-45vG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 23:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763852410; x=1795388410;
  h=date:from:to:cc:subject:message-id;
  bh=8EO3lfsBg23hekOq7G6aZh+MXslRhEGfWpNr3poD3hM=;
  b=SNl66bsXjD6M45IHKA1H77LYLbpqadpfSoNWHuaPl9z/gpJgmD2mEdN4
   LqoVIpVipnDbE/2pwVDtIDn5x7nmRbL2ynm8kWRB5R+YQ8h8dUiKNNq6F
   rqXFQFA6/diQ48GWUt6NNDfmioTxx7UataB/dc0XPRTTYTCNV1R537DJG
   wRYX2fcBKXRClKG8HrAzXO5YG5U3a2qhSJSp2kESuN5eykEqdkWVo9jyV
   H+Pnck3T7wZjmGHRkK8I5stw4exva6LY2tYoK9ghWV502blSmKodgx/wo
   /VZe0X/FcvNTO+BF/kwFwzizT+JaUDQy58pBXcCdEwxOSuD6Xj1w2v2tX
   g==;
X-CSE-ConnectionGUID: Ny4f1mk+TLe7t4B55A1Cnw==
X-CSE-MsgGUID: GtjfYHZxSDGUoVpngqkrgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65844870"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65844870"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 15:00:09 -0800
X-CSE-ConnectionGUID: OFk6liu6TNCrD3vN55VW2A==
X-CSE-MsgGUID: sOOQx7/bRva3+4pBffCMpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192773881"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Nov 2025 15:00:08 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMwaM-0007tR-08;
	Sat, 22 Nov 2025 23:00:06 +0000
Date: Sun, 23 Nov 2025 06:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:cix/dt] BUILD SUCCESS
 7dfe67ab5a830083d28a072d262c5f6d3df6b39f
Message-ID: <202511230649.deHs4B2b-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_150010_086790_AC652216 
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git cix/dt
branch HEAD: 7dfe67ab5a830083d28a072d262c5f6d3df6b39f  arm64: dts: cix: add a compatible string for the cix sky1 SoC

elapsed time: 1553m

configs tested: 1
configs skipped: 158

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm64  allnoconfig    gcc-15.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

