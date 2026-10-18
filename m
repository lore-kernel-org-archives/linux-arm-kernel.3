Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A51CCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 00:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CokdTGHz8vHWvWGZKlzAZG9TpYCvGqfXhGkwmfn1/VY=; b=z8IfwQ0As+viF6ViDKLoOJzCxo
	32JFEklVgpnBZK99+qOmll3Rafxmu3pWHtt0NyCrTbISAdjib8Ov90uw+lev6QRRri0nHY2kYH4ud
	KM8onMlKlUsAjVoWXgZFt2p/ZM7wuZU2yKq8Z1YvqhtRlEok3X2Zejn/7NOJsvQWtK9VpORo0AzkZ
	8g1FL7i4/Z60Um4NTuio6pXMXrQiAS9PYVPSM3cqAeH2i1Eg9MpLsC1lRgoz+ZExnEDGPbDgFiWS+
	smbf78YW23Y3ChlNoIP2ATlkRADr9KlK6wirO+hDOLY9MX5Nj+CKCzW13qCxN3I4TbQygS1cWjpQ+
	4OCkS7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIF3r-00000005Nfw-42Hh;
	Sun, 18 Oct 2026 00:47:39 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIF3p-00000005NfS-0PzM;
	Sun, 18 Oct 2026 00:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792284457; x=1823820457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=daoOQm05VwaFoZ0+CpbIgWX8Bo/e4Sr3//Gl6DlQae0=;
  b=ltODWq9Udr3rn8gdruveJSEkGaH2dYI4GhcMkscBDVkVDd4j+kQyRURm
   HoI4qgch8o/IWMK5Q4idWmnNVUlhaKZczUqOpkFz+Rtr04N7UdgWem1sr
   SqN3pFxgkcujbpYe6/Zulg2KGHtI/OHuZo6Ly6pIDfQCosQHcWGVdeDdx
   VYVVLPnOE55rn3L87ii+YtH8nve5rbkuzben8lx9JgvTa3W3QAYfF1r9W
   etw/Jmsj35LCpG1xAPheBjI3e81YpMOCCe8AnOhf8aADfxnOWJOD178Q9
   dakdWGd5a54urq9FV/biSG8MZR8gZPr+1Dt3xfwtQGCbckKj8hMefOcPW
   Q==;
X-CSE-ConnectionGUID: dxWA0wcPRuO2D0VIzfSSZQ==
X-CSE-MsgGUID: h8OOT8z4T/iKp5njtQ8iwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1049618"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1049618"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 17:47:35 -0700
X-CSE-ConnectionGUID: 7QNb9IvsTCmVMcmTPGQv7w==
X-CSE-MsgGUID: IT3zV5cIQzKxka3VbTtNMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2646600"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2026 17:47:32 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIF3h-00000000Juw-19NP;
	Sun, 18 Oct 2026 00:47:29 +0000
Date: Sun, 18 Oct 2026 08:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v17 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
Message-ID: <202610180841.U0qsol4i-lkp@intel.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_174737_239982_C06D4FFE 
X-CRM114-Status: UNSURE (   9.38  )
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

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/phy-rockchip-usbdp-Track-PHY-power-state/20261016-204317
base:   8f56fdf3d8cb9f1dbdc93bf9ac816698aa6f70b7
patch link:    https://lore.kernel.org/r/20261016-b4-rockchip-dwc3-rockchip-glue-v17-5-876f96893e2f%40collabora.com
patch subject: [PATCH v17 5/7] usb: dwc3: rockchip: add USBDP PHY reset quirk
config: hexagon-randconfig-1000-20261018 (https://download.01.org/0day-ci/archive/20261018/202610180841.U0qsol4i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180841.U0qsol4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180841.U0qsol4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 struct member 'dwc_rk' not described in 'dwc3_rk_phy_nb'
>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 Excess struct member 'dwc' description in 'dwc3_rk_phy_nb' (did you mean one of: 'dwc_rk')
>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 struct member 'dwc_rk' not described in 'dwc3_rk_phy_nb'
>> Warning: drivers/usb/dwc3/dwc3-rockchip.c:22 Excess struct member 'dwc' description in 'dwc3_rk_phy_nb' (did you mean one of: 'dwc_rk')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

