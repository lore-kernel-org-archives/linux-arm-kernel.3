Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D4ECD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 02:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zk4PIb5tAg8JP8dGkhPKJh/6yHKVDh2ktW5bqzxGr7U=; b=FJY37utLwiENjYjBaNKsHt2HFd
	K6jxT6FEJUP5lkCboIFi1JHXvxAFIdOR+I7K7kjSxIkbIZh5HMPD3qMk3kpRf+cyuTkaiyvS+TYjm
	dMW8OLGBxQ1TZ7NhF1xbm/KytO1rZPOMQa6TIXbYgFIDFUhzxx62f4K3mqC6g9RofqVoYFxCwGII/
	HFJYP1Q7TK4Uk2wkvJeg3uqaIYFqXeQH8Ji83nhDay9y5Rx9gnHAiRkDDEZrYMmAgvvp87RZcN8v6
	8GFfctO6vv/N+v9wDAZFz3VZeZ4GMnHirWooYkwCFvC2DH6DaGE94Oj2dzsZrUTw9o0JM9PoLqCyU
	rCJ2PvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrSX-0000000AHnz-2D3U;
	Fri, 12 Jun 2026 02:17:25 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrSU-0000000AHmK-0pY6;
	Fri, 12 Jun 2026 02:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781230642; x=1812766642;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oy85sK2Gn+Zq/RhyB1hdWZcoNF2HzoKYEyRUhJRFs98=;
  b=eYnRV7DPNdakeMJksjuxj1etrOmhwSXolMjuZWmHFL4gfcPzMCyJHpjc
   /f9WFzCP1uqLEZLYRMPpqy4ViBFTwFhkalMTRKfdrL54ds5csMVYbrq1A
   xXsXHD/10QLV5f7XMuqfJEgMwrZRZMEb4tugnYAVmHNfP/2yQBkH4jxMU
   tg+HJrNVlsQ3fobh1S4/rG40/td9bEF9mTh5HEybDVhbyECcmLoTcMJPP
   OS8jBpUZ+fxjkT1Td0i2JA0gJmFrnQ/kX9m9uBv7PQ1Brbx6zcKQQ1Ifg
   HJseui5na1RM1RuML5OEsKmDWfb0nR6PQGTOEPfGx8RgXZKyBXBRaGcsn
   g==;
X-CSE-ConnectionGUID: ELASs4DWQXSDHTVwEGiDMw==
X-CSE-MsgGUID: g/+Ff5wUSeC9n53dFNVC3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82105577"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82105577"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 19:15:16 -0700
X-CSE-ConnectionGUID: mm4dzS0QSW6s/fPGsfAEfA==
X-CSE-MsgGUID: 6WGDJgrGTeaYkwKunTwo6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251641450"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 19:15:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXrQK-00000000OA8-0VEK;
	Fri, 12 Jun 2026 02:15:08 +0000
Date: Fri, 12 Jun 2026 10:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eugen Hristev <ehristev@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eugen Hristev <ehristev@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Message-ID: <202606121013.RsnqIwho-lkp@intel.com>
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_191722_253387_BD597238 
X-CRM114-Status: GOOD (  10.92  )
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

Hi Eugen,

kernel test robot noticed the following build errors:

[auto build test ERROR on a87737435cfa134f9cdcc696ba3080759d04cf72]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugen-Hristev/media-bcm2835-unicam-Fix-querycap-multiple-caps/20260611-141320
base:   a87737435cfa134f9cdcc696ba3080759d04cf72
patch link:    https://lore.kernel.org/r/20260611-bcmpiqcap-v1-1-10cf7fb438df%40kernel.org
patch subject: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606121013.RsnqIwho-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121013.RsnqIwho-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121013.RsnqIwho-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/broadcom/bcm2835-unicam.c:33:
   In file included from include/linux/dma-mapping.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/media/platform/broadcom/bcm2835-unicam.c:1836:20: error: use of undeclared identifier 'node'
    1836 |         if (is_image_node(node))
         |                           ^
   1 warning and 1 error generated.


vim +/node +1836 drivers/media/platform/broadcom/bcm2835-unicam.c

  1825	
  1826	/* -----------------------------------------------------------------------------
  1827	 *  V4L2 video device operations
  1828	 */
  1829	
  1830	static int unicam_querycap(struct file *file, void *priv,
  1831				   struct v4l2_capability *cap)
  1832	{
  1833		strscpy(cap->driver, UNICAM_MODULE_NAME, sizeof(cap->driver));
  1834		strscpy(cap->card, UNICAM_MODULE_NAME, sizeof(cap->card));
  1835	
> 1836		if (is_image_node(node))
  1837			cap->capabilities |= V4L2_CAP_VIDEO_CAPTURE;
  1838		else
  1839			cap->capabilities |= V4L2_CAP_META_CAPTURE;
  1840	
  1841		return 0;
  1842	}
  1843	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

