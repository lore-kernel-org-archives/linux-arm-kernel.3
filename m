Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD5AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Lhtjfysy1PkKEr+1A++OXk9kMmjEESk7RoJkgG955o=; b=IXaxHccoV5ObEp9QOOhWWbuTCJ
	IN1MW2tSX1f1Rn3G3k6B/qAbGGwd44NEag+sbZF0FOkOeQZcRRdgt899ROLJu7TJGJ9OxL6UKHMTS
	l9ZP7JOUXvofE+b35NwdLB6HvfbxakNUXIY4jhzp3U3ryx9XquYnpwA7YXrzwKpc+Et+OSoBrajW1
	lzWWyZJcOgyCVZQzplEhkaST1JpmEkOO2dFphgp0m20TRol3uaqtgYACyZVpzkGimQHs3SHErnCsa
	zs7MdThtNs2DWIRpSVoJNZFnzYMHUQqnrePdFpBbGjXbTtngrUIWB/lLoUp44dVEAgC29cVTaEwVG
	6rjNrE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNkC-0000000A7Fz-0QFJ;
	Thu, 17 Jul 2025 12:29:48 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucMC5-00000009uD9-20xy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 10:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752749429; x=1784285429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RnOYNCVbIcR1/NQHJ0LkvmKFRZrbUei/gDK1cnLHFC4=;
  b=IQfYvIMm+hNP7xIUp7t6Fc/+868ZwvjxX1hjr6QK5bLoLn1ng5j2yP1l
   9KWiEJ+k9LRjdO0stPHMA253ZelgbJ2aBgdnFZ4vdFAgMnPv4fBmJv+2Y
   BGkYGp4D9rsKVLeoENDC9E/FTtjK+3MOwEv9V3vEBi0Vj+4Dnzi4sRysU
   u3yAX6+LTaqZMZF6cegPuLzgWg9ilRhTPsz/OIZLhlOucmvxBuMZXh1Sd
   FSEc7xoo05UQQC2ZYGIq4DpRNOmGKaQXg+/8mpyctFKsPXTf+8xakTO94
   Rx/5Tge+lyZ0gOarsmGZgIHXYsEoQV9iQnux/lv06a73D3QArywl7e9sN
   w==;
X-CSE-ConnectionGUID: ZHLPer7TTGWQPu/Km5aYMQ==
X-CSE-MsgGUID: 589HP/7gSnu3oAahjISYjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66469916"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="66469916"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 03:50:28 -0700
X-CSE-ConnectionGUID: gcageXL1STip2wz8LQf76w==
X-CSE-MsgGUID: xMI0ELb7RQiRrcITnDokKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="161790908"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2025 03:50:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucMBx-000DXj-0V;
	Thu, 17 Jul 2025 10:50:21 +0000
Date: Thu, 17 Jul 2025 18:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux@armlinux.org.uk, ardb@kernel.org,
	ebiggers@kernel.org, geert+renesas@glider.be,
	claudiu.beznea@tuxon.dev, bparrot@ti.com, andre.draszik@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	heikki.krogerus@linux.intel.com, kory.maincent@bootlin.com,
	florian.fainelli@broadcom.com, lumag@kernel.org,
	dale@farnsworth.org, sbellary@baylibre.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	dagriego@biglakesoftware.com, u-kumar1@ti.com,
	y-abhilashchandra@ti.com
Subject: Re: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
Message-ID: <202507171820.SxYjRSbE-lkp@intel.com>
References: <20250716111912.235157-5-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716111912.235157-5-y-abhilashchandra@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_035029_564253_C7C921C4 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Yemike,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on sailus-media-tree/master next-20250716]
[cannot apply to robh/for-next linus/master sailus-media-tree/streams v6.16-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yemike-Abhilash-Chandra/MAINTAINERS-Update-maintainers-of-TI-VPE-and-CAL/20250716-192326
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250716111912.235157-5-y-abhilashchandra%40ti.com
patch subject: [PATCH V2 4/4] media: ti-vpe: Add the VIP driver
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20250717/202507171820.SxYjRSbE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171820.SxYjRSbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507171820.SxYjRSbE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/ti/vpe/vip.c: In function 'populate_desc_list':
>> drivers/media/platform/ti/vpe/vip.c:828:22: warning: variable 'list_length' set but not used [-Wunused-but-set-variable]
     828 |         unsigned int list_length;
         |                      ^~~~~~~~~~~
   drivers/media/platform/ti/vpe/vip.c: In function 'vip_create_streams':
>> drivers/media/platform/ti/vpe/vip.c:3382:43: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
    3382 |         struct v4l2_mbus_config_parallel *bus;
         |                                           ^~~
   drivers/media/platform/ti/vpe/vip.c: In function 'vip_probe':
>> drivers/media/platform/ti/vpe/vip.c:3677:25: warning: variable 'pinctrl' set but not used [-Wunused-but-set-variable]
    3677 |         struct pinctrl *pinctrl;
         |                         ^~~~~~~


vim +/list_length +828 drivers/media/platform/ti/vpe/vip.c

   823	
   824	static void populate_desc_list(struct vip_stream *stream)
   825	{
   826		struct vip_port *port = stream->port;
   827		struct vip_dev *dev = port->dev;
 > 828		unsigned int list_length;
   829	
   830		stream->desc_next = stream->desc_list.buf.addr;
   831		add_stream_dtds(stream);
   832	
   833		list_length = stream->desc_next - stream->desc_list.buf.addr;
   834		vpdma_map_desc_buf(dev->shared->vpdma, &stream->desc_list.buf);
   835	}
   836	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

