Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FE6CD0402
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8khihi+OTS3DbmwGaQQ5QNmCINXg1t+QNpzKMIH1qg=; b=g747H722oEH23rUAny4saCefYF
	Ufk8V9Bn3rB1AB7rm9iWkUPZHwkALihU+ayNzA6B/Nwz/P3iac0umczm672Z3Cj9zh1C21RYG5tfV
	6+WSd/Bkt8B72dS5T4kx+7aIKiLxhNuqlr5ILof5gBrs3OKXD9Ehq5i4mxA3IeG2YTFDlPcNX5tjS
	rI30dbV3FA6pwCM9qfijtFryRUaijYQ7GfIOHyTqU8XdQjsd0TQeZe6E9jCqgeQr3rMxGIyP74ecU
	WeMYCRPOhGQh04BwhXTyLRKVqhgEwuy7ed7gf91SQDKGHm3MjFj8PHy5QuCNmNEXsQo/JL0E1JVK9
	ic65xaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrcF-0000000C5EO-24Hv;
	Mon, 05 Jan 2026 20:55:51 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrcC-0000000C5Dp-1mbY;
	Mon, 05 Jan 2026 20:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767646548; x=1799182548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WVnWbjYOpqIDwisoDyPelz9EoJY5dPQN7uCwfAGaPOw=;
  b=BAAKaW8Z3uz0MAC0Ztl7qvoUD+rdWujpEok3eT8LoVUvXTtUmpqjNiD0
   xYFzLVcC+F53WcP0dpZ2+WcmN7Mha06tEDMVcm3wI6xd/krWBdlFWvDho
   2HBqoiIn29J7kUzHBcESY+mm7BCpRr4rP0FVznwN3JDSxddB7ieRuJPfZ
   VsumMDCYeugaxahs6EHtrD+IR+zTamEGnyKtNsShcpqCc6ZJtF1Swhqb3
   r3BUbIbRzgIB3aBCL5g/Wsy22LMGixJLQ/Q+wuKp4IlrvIG+tCQH+7fcH
   Yg2uqOSnM5+x1hCz46UcGU/2n/LZIn0PrRuEZPwjXJeXYSsiA3TNAvn4r
   Q==;
X-CSE-ConnectionGUID: KuaDqId9Ry+Br+lTpoxJIA==
X-CSE-MsgGUID: 24/dvIw7RV2o1Lz/2BhR/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="72863470"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="72863470"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 12:55:44 -0800
X-CSE-ConnectionGUID: vVhRYXs2Sa+I91rilLBy4A==
X-CSE-MsgGUID: MMI8n2KmS3y+WWgOlzEMug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202534141"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Jan 2026 12:55:41 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcrc1-000000001BN-36Ax;
	Mon, 05 Jan 2026 20:55:37 +0000
Date: Mon, 5 Jan 2026 21:55:01 +0100
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
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v2 4/6] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma
 to support zero copy
Message-ID: <202601052123.hNOfRem6-lkp@intel.com>
References: <20260105-b4-vc-sm-cma-v2-4-4daea749ced9@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-b4-vc-sm-cma-v2-4-4daea749ced9@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_125548_539954_F80435C1 
X-CRM114-Status: UNSURE (   9.03  )
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
patch link:    https://lore.kernel.org/r/20260105-b4-vc-sm-cma-v2-4-4daea749ced9%40ideasonboard.com
patch subject: [PATCH v2 4/6] platform/raspberrypi: vchiq-mmal: Use vc-sm-cma to support zero copy
config: sh-kismet-CONFIG_BCM2835_VCHIQ-CONFIG_BCM2835_VCHIQ_MMAL-0-0 (https://download.01.org/0day-ci/archive/20260105/202601052123.hNOfRem6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260105/202601052123.hNOfRem6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601052123.hNOfRem6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for BCM2835_VCHIQ when selected by BCM2835_VCHIQ_MMAL
   WARNING: unmet direct dependencies detected for BCM2835_VCHIQ
     Depends on [n]: BCM_VIDEOCORE [=y] && HAS_DMA [=n]
     Selected by [y]:
     - BCM2835_VCHIQ_MMAL [=y] && BCM_VIDEOCORE [=y]
     - BCM_VC_SM_CMA [=y] && BCM_VIDEOCORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

