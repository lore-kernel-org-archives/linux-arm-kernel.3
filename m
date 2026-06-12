Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0541CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 04:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFa8/Ls00h5FodOcZHo0TtLVopWVSoUHVq+MXAnFGp8=; b=Kdka+S2jLFz0/PmarHesUKBlXc
	3t80O29LOc703EpfMhGmoHEAuf4mKpHZIf7AQPvKN2D5L/nT+iisRsVKlL0UPQYApDzcMUGYuNgWZ
	mvuiBooxAtyLe/nGrWEfpnQINHPYdXtUl16o44UT6CB+M8RpGvRjWCIZqDTaCQZmLPr5Qz7dxqPTW
	W/lqo1GR9MDivp0z0BR6bheUAD+EI/u6ZOccmLgxJxjWJg86BTTbK20uw+TSHYAV7XrDHwrDr4MKk
	VIfvKo5Euweg65MW060iq7LSY9LWXBjfJLlX0FGmRxWT4DoXBxIloWWArE0lqKPYE4B1U7BUK5bAi
	nU1GIGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtZQ-0000000ALV3-0i3p;
	Fri, 12 Jun 2026 04:32:40 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXtZM-0000000ALUe-1k8W;
	Fri, 12 Jun 2026 04:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781238756; x=1812774756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=khstqJkF3ATYBmmus/0LM5+7K5YtO6cGJKSvZ7jF6ac=;
  b=aBDr/qeXkL6doU34jI5t73yBKQsuu+o91sFVUev7JBPSXqxD6BTwwhgN
   AGwOUKxqpQ1jWGlWZif1+wIJndn8Cd7mk88MlLYL4ARv1kT9lEEGR27/q
   gQWDzZ4qNT+SUmd6IUK2+JQCizJHVAXhtEYVZSykJRoa7iwyWEKj3hXBF
   VCG06hU8DJSnuojJFtCNxPDaeN6FOYDi0ZosQAd+xwrWcGbeZJJWBIvVg
   pVepmzqH+iThtBcd4+BPGoFB+XgwQtQd3mke4j7WSt4gZkIDHnr0HGNmY
   RgWuEWoYFaUiThUWO6Eut5oTGKTh5OqvITDapWNqAPyK2NmDyznA2Vao5
   A==;
X-CSE-ConnectionGUID: SSyibF++TjeDuO1kxQFYGA==
X-CSE-MsgGUID: Es61NfwJRU+V/F+GSbwF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82072627"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82072627"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 21:32:34 -0700
X-CSE-ConnectionGUID: SV4yh9qbThagVXMe3VqKzA==
X-CSE-MsgGUID: j1RAI94jTU6xaVcXGCNT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="245614402"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jun 2026 21:32:29 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXtZC-00000000OJh-2H3e;
	Fri, 12 Jun 2026 04:32:26 +0000
Date: Fri, 12 Jun 2026 12:31:49 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Eugen Hristev <ehristev@kernel.org>
Subject: Re: [PATCH] media: bcm2835-unicam: Fix querycap multiple caps
Message-ID: <202606121218.nV4fMXUr-lkp@intel.com>
References: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-bcmpiqcap-v1-1-10cf7fb438df@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_213236_810026_B9259CED 
X-CRM114-Status: GOOD (  13.39  )
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
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606121218.nV4fMXUr-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121218.nV4fMXUr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121218.nV4fMXUr-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/broadcom/bcm2835-unicam.c: In function 'unicam_querycap':
>> drivers/media/platform/broadcom/bcm2835-unicam.c:1836:27: error: 'node' undeclared (first use in this function)
    1836 |         if (is_image_node(node))
         |                           ^~~~
   drivers/media/platform/broadcom/bcm2835-unicam.c:1836:27: note: each undeclared identifier is reported only once for each function it appears in


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

