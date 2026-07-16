Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC93BC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=go136pBsLDhcZhtaoyOkpun7aLmwyUi6+4cWEM39SXg=; b=s24jHTZaKmLNCaoL90dkSjYfSV
	3JeihLurighJ5DolguXhwgqsiO27rohZAcy6ZQI4Lok+n/yDzmTYWe9XKsNyj/U2GBIfOFWFuPuea
	9Pdekn4oWe4RMnGFTyYnYCm/nzzAvswCALTB+9RDcHePjy+qFGrOe8Up0dZziBkWe8kYhNiCjDbT2
	oHveTq8GfDFY8mGE6g4zuCGh6r2Af+sXdU2Cj7MgpKK6dtum2fyVWcqcf0TVWEjUvStAWBGgfE6UI
	jVEuGc89QRsvS/f3FxMOK8UT034WtAIve7uYnTwG55GwDQBs0Njx+z4vTXp06USvnx+3ThJVju/pT
	Cdb5iRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIzx-0000000Gy7D-3Tfu;
	Thu, 16 Jul 2026 10:07:21 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIzv-0000000Gy6X-0Scq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784196440; x=1815732440;
  h=date:from:to:cc:subject:message-id;
  bh=vwuoQS9pKnNRJo8VIeMvOuNXYzHBhs7LqGTN26wN6NM=;
  b=YEHK/6F5IetePrEjMGuOHgOtlbMmjQyYfpcDtFOIJSrUAczIoxRzkO4t
   Zb2yTkGANp48oLK61PrdIl409/gXjQUTg6bu97cAMXvGp/JQ+dUpAOVeu
   s8gBWd7B9r2qc0oJEBvopEqTxZlpPItpdCdcDcRZ7ZHCL0sI+S3IvhcRY
   DaiM9R9EzqeaPuygdgBYoSx5pHLZ/m6NyB/wKCZD3TkTiuDhhKW4bB5BT
   g8c/gnoeYq2aWloYfohTvaZ1ikfZFx+QwYQMViHtqdQpoE1y4cnNCxSZZ
   9wC5uIufQDqKm9KQcwKx7Ry7yBO5fuOlCuJH080ZXI1lKEOpjdaedwXgc
   g==;
X-CSE-ConnectionGUID: qb/FPybuQsadK69ryDqxPg==
X-CSE-MsgGUID: v0guzku2SRGcVIQ7aEjjpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88528214"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="88528214"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 03:07:19 -0700
X-CSE-ConnectionGUID: 6WRAqE4tQYuWWlSYG0kMUw==
X-CSE-MsgGUID: uTfnRCSvSEWPklSg2KTuLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="254702808"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 16 Jul 2026 03:07:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkIzq-00000000Of6-21p0;
	Thu, 16 Jul 2026 10:07:14 +0000
Date: Thu, 16 Jul 2026 18:06:30 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:arm/deprecation] BUILD SUCCESS
 6cb7a10ef7488720f4379e27575d723a85790b30
Message-ID: <202607161819.KKSBX8Bn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_030719_202887_5243CA55 
X-CRM114-Status: UNSURE (   5.25  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm/deprecation
branch HEAD: 6cb7a10ef7488720f4379e27575d723a85790b30  ARM: mark mv78xx0 support as deprecated

elapsed time: 781m

configs tested: 2
configs skipped: 69

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm   allnoconfig    clang-17
arm  allyesconfig    gcc-16.1.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

