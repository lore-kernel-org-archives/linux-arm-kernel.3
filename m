Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E092CD040C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 21:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV0p0217Uokftp364KV11FOFc5od890q1yJz1R5qRlc=; b=JTHQcEqr5yvyLmX0UQnQaRm7/a
	5c28a7lCBOqfsjSIsm63wZbiwHGKieqUq47b3b85L9Hvhd26R7bx01cSku/Q4L1EN+EPiQ87SoSVx
	9rB4Y2R0s3LrhjhjX9n6kcrvTFGlMCpqzRawIz7m7ZalsOzdI78ThA03Ib3y+CDo1r8V1X6AbioHL
	z9GRxWrGWrHLucF3N5905CXY0N5dPgGuH5lhCR+bP2/7+rA877JQ1gZfTWR50J4tzEGclXOR9K3rC
	WInY56gcqhMAaA1yg7c7Q8SQ3QopL6MzpHMqKJhd6U4JfUF+IfTZCWhtZ+Ii+cx68lEV7yqizOzfQ
	bmfUfuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsA4-0000000C7v5-06eF;
	Mon, 05 Jan 2026 21:30:48 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsA1-0000000C7uc-48zB;
	Mon, 05 Jan 2026 21:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767648646; x=1799184646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+QPX0QOZsIbeOr1tYmOsmy8KiMogxkPsaB5Zw6Ya8u4=;
  b=E9yhrI/MYXHuPCIMXuh7EnlKpwiLkMDXBb6WWwDHFqZPSataq+PGwDEN
   ZvpWtlfaFIVQS3y8csK56dRLAWMzLSZ6EyR4+lGhoeVDdYDsdNnQjJB7U
   NajAuvZawO8iN9D+maubPNC+bdQoEuickbOjoK2yky8Js7CMh2bC8AOsW
   mC1hnHiYuMmMOnMtfgFigcLrKYSBpZpQSsT5OckMoLRTYBQJp7VttPteL
   7hL14JK6kqpxV5Jw68Y4vmYhF/WECB2vLAUyzdUvXuAJEIRR2Arh7zC+l
   fFKQIpu6Dt94AYQL+zzWYNKnmCz70Xnw1aFCj0QGxwyNoPef0HoM9wGHl
   Q==;
X-CSE-ConnectionGUID: t4HKHV4OSKOwz7DxxxF6Xg==
X-CSE-MsgGUID: BIIKBcVYQVGmaVJj9fflug==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68923774"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="68923774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 13:30:45 -0800
X-CSE-ConnectionGUID: NPj+/zxiT0aoB/qL190f6A==
X-CSE-MsgGUID: JCPR0GnLRUiPosC/4ZYcBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207522667"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Jan 2026 13:30:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcs9t-000000001Bh-457N;
	Mon, 05 Jan 2026 21:30:37 +0000
Date: Mon, 5 Jan 2026 22:30:17 +0100
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Alexander Winkowski <dereference23@outlook.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH v2 3/6] platform/raspberrypi: Add VideoCore shared memory
 support
Message-ID: <202601052222.PZT4wjmg-lkp@intel.com>
References: <20260105-b4-vc-sm-cma-v2-3-4daea749ced9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-b4-vc-sm-cma-v2-3-4daea749ced9@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_133046_092922_49BB9D68 
X-CRM114-Status: UNSURE (   8.57  )
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

Hi Jai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3e7f562e20ee87a25e104ef4fce557d39d62fa85]

url:    https://github.com/intel-lab-lkp/linux/commits/Jai-Luthra/platform-raspberrypi-vchiq-mmal-Reset-buffers_with_vpu-on-port_enable/20260105-170249
base:   3e7f562e20ee87a25e104ef4fce557d39d62fa85
patch link:    https://lore.kernel.org/r/20260105-b4-vc-sm-cma-v2-3-4daea749ced9%40ideasonboard.com
patch subject: [PATCH v2 3/6] platform/raspberrypi: Add VideoCore shared memory support
config: sh-kismet-CONFIG_BCM2835_VCHIQ-CONFIG_BCM_VC_SM_CMA-0-0 (https://download.01.org/0day-ci/archive/20260105/202601052222.PZT4wjmg-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601052222.PZT4wjmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601052222.PZT4wjmg-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BCM2835_VCHIQ when selected by BCM_VC_SM_CMA
   WARNING: unmet direct dependencies detected for BCM2835_VCHIQ
     Depends on [n]: BCM_VIDEOCORE [=y] && HAS_DMA [=n]
     Selected by [y]:
     - BCM_VC_SM_CMA [=y] && BCM_VIDEOCORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

