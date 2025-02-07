Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0412CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViEYKen56Zein15LENOgrGuz5JoJanFVz6I34hEeRqU=; b=vUxj1lrHiPaekCrvuIk4GSEmsE
	PSKnPwiuFe6IfoALQas8m/57lsF/mpXNNeN/Rc80ufu0mC99G1TkNwD6viLOjt7qG6WbSv5F76AqX
	a54EdocotLMlnJcW/CydBC1pGD5h9fOVciELOXTxVyZJUUX9H73NzJWloPUiRIhNWO+WNQGyasEju
	3SFvgAzB7uUD519rSrb3r+mhva9nlZMZLZf1awHA+EZi6HjWDbeXsowtbN58cUO8JaXM6RJpUmOVh
	YlRWwVVz4JdpLKxtB2lkCo+37RLRmG9CZe1sl6cyaO5SiHNC7Vazmf7cxuN+uPPkZaLAWM0c7rHa9
	p+D47GJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQUu-0000000A7ob-3a8f;
	Fri, 07 Feb 2025 15:42:28 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQGR-0000000A4NN-16hF;
	Fri, 07 Feb 2025 15:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738942051; x=1770478051;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6GE9Dr6wuDcMJE5qZBlWMnYEgJHzTHm8FhWdCrRJ3Gs=;
  b=W7MwL0Dj+hB2ChFDCCj9fh74l8avilohF5itG0F7PhH6wGZRMjbwRL/S
   S97M4titlUb2yMCSBw65v+MPfr6VgriWZDqClmLFR5liPa16NuUnBSQwm
   Cw24CJD5B1k7gyLzQYT18eDz+aQrXMys4USBHmNcb1mImZaefFOPBgOkg
   EqFu2lsu2VM67Q3mBzEZ1fSh7gwNMaVMglCE75BPdIJwcOD5VZcRVJB2E
   khIHT+WqaXFnDdhaDYbcfOAueKe0gZ2rZjFerz7wQ7mJNHfDPSIe4f784
   BmD1ljs2uGkJC7N1ATivYcrQBR4S2NUo++6nOqz9VRgEkfE7/vhanAMwr
   g==;
X-CSE-ConnectionGUID: POTIAYVzSfe5usv5kPH0/Q==
X-CSE-MsgGUID: UColjF/zT8ipKqd4vddTew==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42426787"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="42426787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 07:27:26 -0800
X-CSE-ConnectionGUID: 0SbW1BpCT1KUK1j159TXaQ==
X-CSE-MsgGUID: dTs5T6O9TJ6I7nDWk0GB7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="116556719"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Feb 2025 07:27:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgQGD-000yWJ-2O;
	Fri, 07 Feb 2025 15:27:17 +0000
Date: Fri, 7 Feb 2025 23:27:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: Re: [PATCH v3 4/7] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <202502072356.crcHKSbX-lkp@intel.com>
References: <20250206-v6-8-topic-rk3568-vicap-v3-4-69d1f19e5c40@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-v6-8-topic-rk3568-vicap-v3-4-69d1f19e5c40@wolfvision.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_072731_318701_AEE43D5D 
X-CRM114-Status: GOOD (  13.36  )
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

Hi Michael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Michael-Riesch/media-dt-bindings-media-video-interfaces-add-defines-for-sampling-modes/20250206-180041
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-4-69d1f19e5c40%40wolfvision.net
patch subject: [PATCH v3 4/7] media: rockchip: add a driver for the rockchip camera interface
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250207/202502072356.crcHKSbX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072356.crcHKSbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072356.crcHKSbX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c: In function 'rkcif_dvp_isr':
>> drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c:759:32: warning: variable 'ctl' set but not used [-Wunused-but-set-variable]
     759 |         u32 lastline, lastpix, ctl, cif_frmst;
         |                                ^~~


vim +/ctl +759 drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c

   752	
   753	irqreturn_t rkcif_dvp_isr(int irq, void *ctx)
   754	{
   755		struct device *dev = ctx;
   756		struct rkcif_device *rkcif = dev_get_drvdata(dev);
   757		struct rkcif_stream *stream;
   758		unsigned int intstat;
 > 759		u32 lastline, lastpix, ctl, cif_frmst;
   760		irqreturn_t ret = IRQ_NONE;
   761	
   762		if (!rkcif->match_data->dvp)
   763			return ret;
   764	
   765		intstat = cif_dvp_read(rkcif, RKCIF_DVP_INTSTAT);
   766		cif_frmst = cif_dvp_read(rkcif, RKCIF_DVP_FRAME_STATUS);
   767		lastline = RKCIF_FETCH_Y_LAST_LINE(
   768			cif_dvp_read(rkcif, RKCIF_DVP_LAST_LINE));
   769		lastpix = RKCIF_FETCH_Y_LAST_LINE(
   770			cif_dvp_read(rkcif, RKCIF_DVP_LAST_PIX));
   771		ctl = cif_dvp_read(rkcif, RKCIF_DVP_CTRL);
   772	
   773		if (intstat & RKCIF_INTSTAT_FRAME_END) {
   774			cif_dvp_write(rkcif, RKCIF_DVP_INTSTAT,
   775				      RKCIF_INTSTAT_FRAME_END_CLR |
   776					      RKCIF_INTSTAT_LINE_END_CLR);
   777	
   778			stream = &rkcif->interfaces[RKCIF_DVP].streams[RKCIF_ID0];
   779	
   780			if (stream->stopping) {
   781				cif_dvp_stop_streaming(stream);
   782				wake_up(&stream->wq_stopped);
   783				return IRQ_HANDLED;
   784			}
   785	
   786			if (lastline != stream->pix.height) {
   787				v4l2_err(&rkcif->v4l2_dev,
   788					 "bad frame, irq:%#x frmst:%#x size:%dx%d\n",
   789					 intstat, cif_frmst, lastpix, lastline);
   790	
   791				cif_dvp_reset_stream(rkcif);
   792			}
   793	
   794			rkcif_stream_pingpong(stream);
   795	
   796			ret = IRQ_HANDLED;
   797		}
   798	
   799		return ret;
   800	}
   801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

