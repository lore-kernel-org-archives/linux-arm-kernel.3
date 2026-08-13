Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA8FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o1wSQX6zdKE+ebU5VsuFMfcpZJ7BAr1c/8jqloFBISc=; b=fijBJl0u8ANGRaLDxRdZGvKALO
	nZ/u+R2MDU2aRtkdipzQ9IZuhgFRdMNGluEXREFtPLbzCjyQ6M4yj9zTX+SJ7GHwi4c8jhd39R5uE
	jLEJ4U6C1qCeZgpE0WPHnVlJdAqNe5hEwXL8CFsLM1Kbrw91wpkbe485zp/kVQrJQxoYz7TSi4Coj
	8RXRooAdJKGSaOeZIgSGwTSeDlaZ/bmrxqZvj81+KtbUNwTzZfD6hN2bU9V3O0pgnW8uyOhzA5Y54
	Sz+lwknsQIlR5xFHg8Rbdm9f1VZLLwsi7fdryXd8RR+l7hzFpQ+mY3H/f/bv4xoszuObY5J05ZTSR
	v8tRIntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaqX-00000001Qy7-3ceU;
	Thu, 13 Aug 2026 19:12:09 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaqV-00000001Qxa-0dnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786648327; x=1818184327;
  h=date:from:to:cc:subject:message-id;
  bh=1UDh7Jl1HOhZI3fqeEDw5dNJVZ7G0LSVMFPhDc3ybtQ=;
  b=l75krruNh7VRcKhF4EJW9ddF0dPQTo49oLR5cbK9UUExPbJHix2/7RSf
   ABK6n5J4c/aG5gsMvdYE61X0xcLQuAs5KRyJp86MD/8dK7GAUm576Eoc3
   zqG7B6DJdST7Jz9Q44yRXzHrXiUebFj+h7UjBfmk6xBDZMqn5XPzHGz0j
   Qz1Sz0h9ZwL6NCw95J9xWmb6w0524spe5iOLTZknEKPfxGY0/x6vwx6uU
   njKwMBGT014uIyChxjTPPGDMAUUelYpq/5320ER7FgTCVQ/FDt4m0MiGg
   cwYQ32iELa6PMp6cj5YebdOQxbfED8xWBMUDvWNgy3RtCpTIDv6ANZ/y+
   g==;
X-CSE-ConnectionGUID: VokNcBQ3Q/2iaIe48Qthlw==
X-CSE-MsgGUID: W9XynzwLR7myT/JKvXiGQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87448472"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87448472"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 12:12:07 -0700
X-CSE-ConnectionGUID: xNA6+Tt+TQafRh6mTgtsWA==
X-CSE-MsgGUID: YSycpIpjQJ29TuQTv+UYXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="268294282"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2026 12:12:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuaqR-00000000WIb-1u3p;
	Thu, 13 Aug 2026 19:12:03 +0000
Date: Fri, 14 Aug 2026 03:11:29 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/dt] BUILD SUCCESS
 6fdec78001b3b94f1b6000bbb2f9ec3498f1c73e
Message-ID: <202608140317.vOXIMa0M-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_121207_229510_2C1843AD 
X-CRM114-Status: UNSURE (   5.22  )
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
branch HEAD: 6fdec78001b3b94f1b6000bbb2f9ec3498f1c73e  Merge tag 'microchip-dt64-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into soc/dt

elapsed time: 741m

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
sh         landisk_defconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

