Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B57CCFD30D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 00:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BnBlK7ul15rQqPPcHvTC+H9JeM4VxSstyXMSBJ0Frwk=; b=WpC9X9ZQHMAIp1aS190afyeZDK
	EZGA0xPbNv+TqmCHrQodjavzSU/Df5ufPCkUcGIfGYXq/fee0Oyf9K7HxZHXhL8xONstTvOHRMguZ
	47NFTdqt/TDtDkaPZPotQ8CKkxTbsXA0q87u/A1lIvr+eYavHUajSuGt3/2WaISveDhYyld4IKue5
	NNX4bG3BPWqlXi+oq50rOnsn1xvePHrPQ3CnS6vyeMEvl8Q7eyBMi4m00Blzp9oQ/ZT/fKMOeg2rC
	YhUyWAdBbDkM3WIUuiSQljLt6EOYrP74Ox3Big+sAqS7Yklqiz6uKyaCv78satm/rHw5iIciBMLRB
	kPQQLvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMxur-00000009zkz-07Uv;
	Sun, 23 Nov 2025 00:25:21 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMxup-00000009zke-0PVt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 00:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763857519; x=1795393519;
  h=date:from:to:cc:subject:message-id;
  bh=dHP1HtgZvZ4AQQRulTgub3vUkRBs63Wtu5X7YuIpfS0=;
  b=OoLhKjupTXohfNRfEFJ1noRFfglEueSLFgWh9VD0cvpGB87YQ4kZXukN
   +ZePjKQRZmKUe3nvwQbH/9yVBEeQ3hfzISqoHHgM3LnRAWr7fB31+O+PY
   DG2osoyT6JSGcnh1vLD2bATdqdvwlYveNxGnPuHtZvKgLdOuBJXnQBhEk
   jXJWF9qdgjGC91iQ6nVLFxzxCp6/Dp3+PT0xsIjfTSVUQS2fEuu/G5EkB
   DwSamtNTpwmgNVharWacQA7hKPJfk+rWUaoMbjSVdUyXgDbh1lcD8BhZY
   dIa4cOBSutjtgVL3xs5QOi/er8ObHvPXYjxd8WDIi/RMX7ISAjRyL6C/g
   Q==;
X-CSE-ConnectionGUID: mVUKkTCSR6eBV+UIF4DJzw==
X-CSE-MsgGUID: 5iplyRsmQ2KpdbMfSgDJ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65792715"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65792715"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 16:25:17 -0800
X-CSE-ConnectionGUID: m11wLt6pRjqZt88vgB5veQ==
X-CSE-MsgGUID: Q/sifB1fRm6/gd7K7Eb+PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="197124729"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Nov 2025 16:25:16 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMxuj-0007vn-1M;
	Sun, 23 Nov 2025 00:25:13 +0000
Date: Sun, 23 Nov 2025 08:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:soc/arm] BUILD SUCCESS
 ad2478e9fc6ba3bf1519f5dccf65d48b0dc8c656
Message-ID: <202511230823.DKpeWFwr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_162519_202458_F26B3566 
X-CRM114-Status: UNSURE (   5.34  )
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
branch HEAD: ad2478e9fc6ba3bf1519f5dccf65d48b0dc8c656  Merge tag 'omap-for-v6.19/soc-signed' of git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap into soc/arm

elapsed time: 1566m

configs tested: 1
configs skipped: 168

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arm  allnoconfig    clang-22

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

