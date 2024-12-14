Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C17E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 17:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lXrWYXYzsAx5Y7gy/qw4VXYtZagOcwsbOgV+oUbNohE=; b=dCY6taROJFgovSY2jc5PiXTrlO
	MS3CI57rto2xPqNfHJT140tUVvcQV3zPv4sNCTUMlkW62ScBTBgOSuZ2hsJK3a0a3RFwxmsoE7cS9
	fA8WI8qiBCZmfRJC1dRtYx5OJkODjY4We/3Sp1o9L8YxBlBVFaYWnG1nZwSSKVTsGGVWl0yyUpy1F
	taL9BguusPnpMf27nzetFE3SgjGNktioy0uc7v+qIQdMTnZloZznynVsptOy0luBxLt67T9lRMle9
	jPxsqiaGQtXMQWS+cShiCfYC9EvMTdlTcyYm1GuCtAEc8kNmnklIcCpuVYr8HXgTPMGXiq6alkOme
	RVTmRX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMWBg-00000006jXe-3SLm;
	Sat, 14 Dec 2024 17:44:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMWAc-00000006jVJ-1VBJ
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 14 Dec 2024 17:43:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lXrWYXYzsAx5Y7gy/qw4VXYtZagOcwsbOgV+oUbNohE=; b=qB/AP1/0HkJp3AerT9AzgMY3az
	XqXb+Dv8jQzIpo+KOPLnYmtnbwVQPqk/OeAp4c56qn2E9G7L0OUPhVj0xDRlWM2e7bSsGLMd2Ebr8
	+Zrj9lHkB7kZ5WlWBIGlqrEgzM6ZV2ZeyRhAeKg9QArIWAZIDjWOrqxZwWSXbVrtcE5vQASl4RDd7
	59lKEWUyedvftdCtQMiWF2kZg154xbzoFHZH2GrgaUYuA+iGvquok/U39Aer1JrZoq9mKKFMr+Png
	B7DOzUJBSW6NbDbike0IoMuNcP1+7ROCtU4zrCjootSsjJ6h1QO3aJ0+cD3bNYuhEjmajrn/3pNcU
	BAdM+KNg==;
Received: from mgamail.intel.com ([198.175.65.17])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMWAO-00000004Xbc-2C7h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 17:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734198181; x=1765734181;
  h=date:from:to:cc:subject:message-id;
  bh=Y1gjnqTOWVhfckLcMaKIst/+ut+0P2YUiADvJg47fKk=;
  b=RtuSbsOqbZU32pM/LOUEFQk4f9Fy4DH7bngBS0bZ2mRBpjNBg3kDZcfa
   GNBj8S+0BCFB45csM77H43Jp/4JJyXf4S2GHhdvpkC91+hqS2h0saxhQF
   Cnx9elFKWyiqllKcHGIUTWmdlsWgYqMYbo8qsyuwTiGEu0mO393KI5gIk
   Roh4010/lbsCgDcungStJVJoWk+BRBxOVDehHjHWZPXQwtcf9NJhCiqJ8
   CDb4X31r4bdWTUQLjo2fTy+fLmc+LOwKsAZJofBtcgta2c2v8vYWdJmUP
   fyUk+I8VGirJpfPdnOdrIbyJDHuDB5r5Jo94Uny/nSrNJKR8Tx5lJvrOz
   Q==;
X-CSE-ConnectionGUID: nHj+l74wSTOnhPIc83Jv3A==
X-CSE-MsgGUID: zoZxXg8tToyqF+B3R+GtCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="34679362"
X-IronPort-AV: E=Sophos;i="6.12,234,1728975600"; 
   d="scan'208";a="34679362"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 09:42:52 -0800
X-CSE-ConnectionGUID: dQrGgw+GTs6PQa3q1S2zzA==
X-CSE-MsgGUID: uX/SxJQCS8G3DJYT7PhCQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134160591"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2024 09:42:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMWAB-000D7D-35;
	Sat, 14 Dec 2024 17:42:47 +0000
Date: Sun, 15 Dec 2024 01:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 b589fbc3f413c94b2f279c04ee802a008692a7fe
Message-ID: <202412150158.MpLg3nHH-lkp@intel.com>
User-Agent: s-nail v14.9.24
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_174304_990388_A8726B45 
X-CRM114-Status: UNSURE (   4.44  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc/dt
branch HEAD: b589fbc3f413c94b2f279c04ee802a008692a7fe  ARM: dts: nuvoton: Fix at24 EEPROM node names

elapsed time: 1448m

configs tested: 4
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm  randconfig-001-20241214    gcc-14.2.0
arm  randconfig-002-20241214    clang-15
arm  randconfig-003-20241214    gcc-14.2.0
arm  randconfig-004-20241214    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

