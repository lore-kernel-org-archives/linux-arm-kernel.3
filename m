Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7DAC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 20:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WLKsiChz5lYZiCXTi8lrf6MYnUiVxf7oa0rlcjDVEk4=; b=zQr22bqFKPq7Mz2oB3+x944kJv
	8MBR+Yy2++MrWdaHx7z9ZjyAq/dhdFFWDUjggOQLWfw/KcmzSlqDtPWYZFwq7STd3BpSOxT1WguWd
	mkgwOEbzF9fWOaj37LpDLFUPjtiQYuwAOojphScynroC7wtdK5gQK+coS3S4JgYIpxhV/Q8i2pLa+
	CqCnD4uWdi/xJ0A70oHLFrpFKrqZjj0lLvKjsBV1EV2VqPSk60Xra7QUfHYfp6myRC6LcFBNX0PLg
	b1bDlGF9g4n+uEPswwMsajZXlaAxU8CK76fCTLa0G3a2aKo19akszx86uRp1CzSrE4qqW0ri9A7JX
	Id0/pEYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQXA-00000008dga-09ra;
	Tue, 18 Aug 2026 20:35:44 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwQX7-00000008dgH-2aiY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 20:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787085341; x=1818621341;
  h=date:from:to:cc:subject:message-id;
  bh=2OUnK0I5efJeU4BU39eXbDxuJ2cvF/SK9a7SUF4VTvk=;
  b=SqzBb7ffXWGlaX8qtQR7AelML07YPvhb4TOZtYJLCJwSOZVITL4a1ezq
   qNzZt/xM3rKvN8DV+614ZDlLvLpmE8UyT3RNUtkaGC1ostYvXHfDWOqdd
   4azGHF8pyfEoWejxF1piy2eNqPXHMZcY96Wbozn3czqDTFiGOP91CJY+z
   bcFDTFSlvfh1IjMdTVHwfg/CCpSdQPPmS3Dlccr5Tl1dFVolWPX4PfO40
   TeAnbZriLwTpkv+9b9+KHkpD4PF/oBwoHRYKNN29z/dLdg8IgLvagLWMj
   N2JfAxxVQfFp6104tKtBKGODhE29lVNijWhPUVhDV0S+Ps27ceWWTOI8v
   g==;
X-CSE-ConnectionGUID: sae26CL8T+2nBqourlZLuw==
X-CSE-MsgGUID: jrE6lo6XQCK+jmy6DJFfuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105123339"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="105123339"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 13:35:37 -0700
X-CSE-ConnectionGUID: ewapnlZ+Tfyj8i9YJtaFSw==
X-CSE-MsgGUID: 7HxnKt1zSpOuxVUuMMABpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261118491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Aug 2026 13:35:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwQWy-00000000eZ8-3498;
	Tue, 18 Aug 2026 20:35:32 +0000
Date: Wed, 19 Aug 2026 04:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org
Subject: [soc:board-remove 188/217] Warning:
 drivers/memory/emif.c:140 struct member 'ip_rev' not described in
 'emif_platform_data'
Message-ID: <202608190446.ZgG9cXrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_133541_671882_74EC7F43 
X-CRM114-Status: UNSURE (   9.12  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove
head:   057394422bc04420585b2790b230d8a1f350ace8
commit: a2959dbcdfccfdb2802d2371710176d42b3a9b37 [188/217] memory: emif: remove pdata based probing
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260819/202608190446.ZgG9cXrH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608190446.ZgG9cXrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190446.ZgG9cXrH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/memory/emif.c:140 struct member 'ip_rev' not described in 'emif_platform_data'
>> Warning: drivers/memory/emif.c:140 struct member 'phy_type' not described in 'emif_platform_data'
>> Warning: drivers/memory/emif.c:140 struct member 'ip_rev' not described in 'emif_platform_data'
>> Warning: drivers/memory/emif.c:140 struct member 'phy_type' not described in 'emif_platform_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

