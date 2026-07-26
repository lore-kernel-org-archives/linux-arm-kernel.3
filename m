Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1C9C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0OBJFnubzlThz7J7RmRavYXWrnSlCIfitF7McUOenY=; b=U4XzS+SxqbBd6miEwLv4Ii5JdC
	vd+xspDJw7EMt1CNUOjcBWuolfl3K7TfAInhhOiDTr5KC37Zw0EVn1jyXcXop1F+uRds+XOPkN5RK
	SW2z7Xll+N0A+6NSHyXI0Wyeo/l5IjpXKMs5hxDBP3t87zXiKJK10k2Qr6arDlKHlCQptDHrYmWdK
	poy7SyF81A0mVSzpraU9kBOSCuYc6tCuxECsV3TVAAYD/MzWwPLEaG7UFZqr76Y3XJJaxh0TwXZGA
	seotH/iHQHvq2pdL1OBBNw5njwpZeuXxfrdQHKwsIz/0DkAf1DSJ0LUk3KgJ1dNfxU8gY6kXz01GE
	zVatBDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnuRV-000000011dK-2iGJ;
	Sun, 26 Jul 2026 08:42:41 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnuRS-000000011cz-3Z3u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 08:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785055359; x=1816591359;
  h=date:from:to:cc:subject:message-id;
  bh=NTdMQVHxEKAyRRofAa0dQcOgU9Ttprr6sqs2IVd2hi8=;
  b=YLS2FhDWzCby8loRDBJjiR5wS4pah6Vg9AqAZLCVYKRvM0NsyVdeWAUP
   DO6bSOMD41YTHTcvpNvciPDB+qMqlX2w/pwgnJaFlQqq+K7CXbmraZMGS
   OfPBQtgrc75naRLhZkBeNI6mZRbsYwDYKyJG/qrMa9KjxiU4S/9FNuVdT
   MX7tpdRQahwf8UIWz2RG3H9RI5FW5u+Zz7ULooA7XAAnEUodaoPj/Jl/P
   8L89XhBDTp0tz++fVM5hJyTzVSAf/vpPM6+WQHLZAnx6PWtReVux27u5l
   QO/nLD9fPQOvSOMg6R9g6Pg1wLHg16zdt5GtL92YTn0yGNzVH881ywgck
   g==;
X-CSE-ConnectionGUID: ifrdJ/GyTKWv53cM0SeJpw==
X-CSE-MsgGUID: fUvStUiyRSaocRftr7z6qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85697752"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="85697752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 01:42:37 -0700
X-CSE-ConnectionGUID: IRlUDY3xQneHfPDnLkWamw==
X-CSE-MsgGUID: 8ttsfNdNQCiciRNhqRqFXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="262904386"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Jul 2026 01:42:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnuQf-00000000cQW-40Ac;
	Sun, 26 Jul 2026 08:41:59 +0000
Date: Sun, 26 Jul 2026 16:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/defconfig] BUILD SUCCESS
 6495ae297cebb175ea28f3ec07379e3cef99fc87
Message-ID: <202607261621.v7ca3PB5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_014238_931838_50FDC7DF 
X-CRM114-Status: UNSURE (   5.57  )
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
branch HEAD: 6495ae297cebb175ea28f3ec07379e3cef99fc87  Merge tag 'riscv-config-for-v7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux into soc/defconfig

elapsed time: 854m

configs tested: 2
configs skipped: 120

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
riscv  randconfig-001-20260726    clang-24
riscv  randconfig-002-20260726    clang-24

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

