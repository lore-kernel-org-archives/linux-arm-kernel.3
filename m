Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FC4CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 22:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0C+5N6MmXKXBOJcIShHumvRXB1ZJWJmgKyIbWDPTDio=; b=0DODOVnYav59/vpV+s9X1egYOW
	L5pnIFcXN2qkWnj9+3tl/htb+77HG8Wve3jYQb8NpfNflCK56u9QZi7mHKzn+Yiwade/8WMwNOPit
	DSfxc2rRQFHl7Qwzn1soG0wyrnN5JNR7iRHC5ctOW7bUSXYxxwGA/nNC0TN2NEZX5ZWCka46jx/hu
	BpGnD+80OTrJt794XuJqq2qTHOxZ6R/YdD3lmIMcruL3M94xqNKKJTmZpBHpHJYdlU3wlZCU97dZ6
	NV3IkC5QgZ2+80lvwVVTbMqsSLEbQKC1naNS6lDcileS5QoycTsrp88LNhf/t1XGCrCNOaV1xEK2b
	rA+KHoTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiUU-00000004Ul6-0Ove;
	Mon, 08 Jun 2026 22:30:42 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWiUR-00000004Ukm-2mU3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 22:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780957840; x=1812493840;
  h=date:from:to:cc:subject:message-id;
  bh=nZo0Jf/L6bMEYHOOWypuaccqVC+t1J/Z3kYlzk/izWc=;
  b=CJjv+Kku2n08vj+ROLqaR6nf9tRReGs7NZGU+euFTX6aPGHYuBi9mNnP
   BPTsDAR+7dM/STkp/V96mo2BsMFOBwOocYgEK4PYm30cMrulSMpFX68PD
   I/Wru90Embunm/lUCDUDShto33HnmDXiDagyNLw5W8JjharTY6NCk4/gA
   I7Z5zp+leLxp5HhK3+dXeigwwg0DZEorCYExWSdMOFM2W2Q7J0GiKkY6q
   plTHeiMTSOZ8TVxDVEjE3XG7m67/664v/81bsY88CJpQeBMMy4JEh7mxY
   HTwvubg0OUzDyQ+SQmkXroZjQSdocDX3dyg3kWuQeZNp4YZgGcWmU1Iwb
   A==;
X-CSE-ConnectionGUID: ctmAU83/Q82/wQODoBGurw==
X-CSE-MsgGUID: OJcHzIltSriInAX+0vbIiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="92030258"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="92030258"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 15:30:37 -0700
X-CSE-ConnectionGUID: 1EhJ6UjdQLKeeubrHvLNUw==
X-CSE-MsgGUID: zcs28u3uSEi9r44oDwf5eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="283755415"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Jun 2026 15:30:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wWiUL-00000000JKc-0xh4;
	Mon, 08 Jun 2026 22:30:33 +0000
Date: Tue, 09 Jun 2026 06:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 f6f84276c6cf2a257a8054137e49b5f37e19f27b
Message-ID: <202606090655.9a4Vtwn9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_153039_767982_2E0D5AB2 
X-CRM114-Status: UNSURE (   5.00  )
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
branch HEAD: f6f84276c6cf2a257a8054137e49b5f37e19f27b  Merge tag 'samsung-soc-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux into soc/arm

elapsed time: 7302m

configs tested: 2
configs skipped: 246

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm   allnoconfig    clang-23
arm  allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

