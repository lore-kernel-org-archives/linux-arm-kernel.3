Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4179E7718C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8dHtJlf8tItSQ/7DyV52Ix8ukF9j6um/mZiGlFEv5E=; b=nJ6jjeTSGZpCwO8dRYzMq7WvYT
	cU2wG7f2OjxdUYIpxdOxHvW6/XZbELlIpBeAY7Bf0DjswyxNKzmbJCwAZxEU8y9M44yiTBmKlpicf
	4pWKPxeV3BmdvVAAdcC6ncT9waYZ3gutOQKzXVWX2kKk/pgQRhrRwdQqQ1CyhKD7BwuTq2eTZDVnB
	D4dsMpdHzD3bTKi+mQVjT++wcqs+5B7ur0Uh77MwJfQfQoxVjLenfzVO976F76Niz+OuHMkRejImX
	Nkn2aHu//VNUtp302JSG2JKbtDBzmxP3sG8yOT6kOBuSIZSK26MEseoOBbrE/PkhibhOAbTXBr7Hr
	DbiGxSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP4LL-00000007IQk-3HH7;
	Sat, 21 Dec 2024 18:36:51 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP4K9-00000007ILW-2L7r;
	Sat, 21 Dec 2024 18:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734806137; x=1766342137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lVYKjo+Ke4pwz0cUb6epoQIlzNlbQZRTf/k4pJY3ekM=;
  b=az5kz1AmpdxN7SWZOAYvfDFdZXKurNTTt36R0Ly4JU7D22kwyy+imA3/
   uKyJoUyXeGc/Ev5I+BMP/JlpgGwfkfk+CvmZs4x1MNTewirIwzi97zIYG
   /O1OITzDRffElEljVx7kd99nDYLEfV0iaacv9xlVroTxwkv0jb0X4Lqbv
   2AxN+aYx7m6RVb34nBzewfdWnPZvc3A4UH+MdWhQqAUmjiWAup7nlpTaD
   76DCbMqp9N7bVDddNOWP1vunQpG/u5Dp+49aegkRauuHJDLhsPvwVN2+h
   dFMoUJFMbMqpGfoXoq3t4k4bkzpN3Bb1WeRCvolGHKey65RLdDJ7SHE9A
   A==;
X-CSE-ConnectionGUID: uzXavMVrTg6Ds/2Bxmhy1A==
X-CSE-MsgGUID: Uf79tYfXTfaatGt0WIVApw==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35474188"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35474188"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:35:35 -0800
X-CSE-ConnectionGUID: ju9GWxSmQFuS6iK0ViHFTw==
X-CSE-MsgGUID: pTo69KGOQMmY3VC50P42PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="98627611"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2024 10:35:31 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4K0-0002Ox-30;
	Sat, 21 Dec 2024 18:35:28 +0000
Date: Sun, 22 Dec 2024 02:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
Message-ID: <202412220238.0kZEBbMb-lkp@intel.com>
References: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_103537_695435_3C9EC2A5 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on e90c9612ac3969cb8206029a26bcd2b6f5d4a942]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Stevenson/RFC-media-Add-media_request_-pin-unpin-API/20241221-002633
base:   e90c9612ac3969cb8206029a26bcd2b6f5d4a942
patch link:    https://lore.kernel.org/r/20241220-media-rpi-hevc-dec-v1-5-0ebcc04ed42e%40raspberrypi.com
patch subject: [PATCH 5/7] media: platform: Add Raspberry Pi HEVC decoder driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241222/202412220238.0kZEBbMb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220238.0kZEBbMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220238.0kZEBbMb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c:24:10: fatal error: hevc_d_h265.h: No such file or directory
      24 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_video.c:21:10: fatal error: hevc_d_h265.h: No such file or directory
      21 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.
--
>> drivers/media/platform/raspberrypi/hevc_dec/hevc_d_h265.c:20:10: fatal error: hevc_d_h265.h: No such file or directory
      20 | #include "hevc_d_h265.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +24 drivers/media/platform/raspberrypi/hevc_dec/hevc_d.c

    22	
    23	#include "hevc_d.h"
  > 24	#include "hevc_d_h265.h"
    25	#include "hevc_d_video.h"
    26	#include "hevc_d_hw.h"
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

