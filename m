Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3565BCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iTJ9vgbRI7WDW7RKpXc81GuQWITBQWwpqtNxLwnRRk=; b=Hu8OaidMStv54re/2BHnLctKJb
	8zsX8RunR/Ve8zkKRDY5FQDf9q0kRavcOh+soimos/AvJZkepHPcRJJK+R2FC9zaW+BGYCBC0SbA6
	pEq2OAR8/n0G6RCqO9rG2Tk4JNr7NGfquTit2PckoXzRQNkcEj2bW1f5Dh+Dv23gcmQv9HfRGf8km
	H+2/gHkyXVPcnb3RpFM/oC6bI3h3Cza9zEAanKJiMf9Uzty+PBgZWkv4I9nPm6YVvk7FNM54xAMXl
	kRjStiR7mrJeJNjESD4Aql7WbPxGUT3OZY41/hccnp87Dshfu7el+yeU2d1khKuICjqJ/gBWGvpIJ
	edn9VM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1urp-0000000DlHM-2jPG;
	Thu, 25 Sep 2025 22:55:13 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1urn-0000000DlFh-01VA;
	Thu, 25 Sep 2025 22:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758840911; x=1790376911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wcm+0+MGr0QhGbbKqE9by5FkhaqCe/1wQYUpEehdWbc=;
  b=B0e7N5+CJ3/AH6A8pmss74HIVvs5E7kRGoQmE7AKk1EYMRN94PMG5eIn
   BRbJkFz5hK+BNDCrKpK4EaC514EerFcusB7+FF3wC8yA+QxcJyrBLzIk1
   dvTacy9ZfOmQiOw/o8Kp5vc3LCiusdOtOXRmxe/EW+xKq/k/piSk6SUE9
   Uwp3dlPvvZO+5+xOW0ndpHPTJ+qJYNKdJj9sOL+KWAl7KxiFKXT3rRUwn
   GVG9SXJ8/IlhA7HsyIUvkBuOSfAySjjC4mF6Fq9t8nJyzZUpO+7GrDNfu
   3ajq66dM4l5bQWZB6qMYcOdI+hfIebHiE7XAScJKiLaHyRbJNW+c5xvfj
   Q==;
X-CSE-ConnectionGUID: rFq5TsMSQ/aeUA4PDqsTdA==
X-CSE-MsgGUID: 55o/ezMBSjGLGfBua8yIrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64985626"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64985626"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 15:55:10 -0700
X-CSE-ConnectionGUID: 3ZgUONWAQ9KZXqtUzThLIQ==
X-CSE-MsgGUID: m4VRglUzTn60fiyCen3W5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="176586918"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2025 15:55:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1ure-0005gz-38;
	Thu, 25 Sep 2025 22:55:02 +0000
Date: Fri, 26 Sep 2025 06:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.Wu@mediatek.com>, Chris Lu <chris.lu@mediatek.com>,
	Hao Qin <Hao.qin@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Subject: Re: [PATCH v8] Bluetooth: mediatek: add gpio pin to reset bt
Message-ID: <202509260623.nZX7ipvc-lkp@intel.com>
References: <20250925092058.16648-1-ot_zhangchao.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925092058.16648-1-ot_zhangchao.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_155511_127274_8F7D2EED 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Zhangchao,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth/master]
[also build test ERROR on bluetooth-next/master linus/master v6.17-rc7 next-20250925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhangchao-Zhang/Bluetooth-mediatek-add-gpio-pin-to-reset-bt/20250925-172508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git master
patch link:    https://lore.kernel.org/r/20250925092058.16648-1-ot_zhangchao.zhang%40mediatek.com
patch subject: [PATCH v8] Bluetooth: mediatek: add gpio pin to reset bt
config: sh-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509260623.nZX7ipvc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509260623.nZX7ipvc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509260623.nZX7ipvc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/bluetooth/btusb.c: In function 'btusb_mtk_reset':
>> drivers/bluetooth/btusb.c:2769:19: error: 'struct btusb_data' has no member named 'rest_gpio'; did you mean 'reset_gpio'?
    2769 |         if (data->rest_gpio) {
         |                   ^~~~~~~~~
         |                   reset_gpio


vim +2769 drivers/bluetooth/btusb.c

  2740	
  2741	static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
  2742	{
  2743		struct btusb_data *data = hci_get_drvdata(hdev);
  2744		struct btmtk_data *btmtk_data = hci_get_priv(hdev);
  2745		int err;
  2746	
  2747		/* It's MediaTek specific bluetooth reset mechanism via USB */
  2748		if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags)) {
  2749			bt_dev_err(hdev, "last reset failed? Not resetting again");
  2750			return -EBUSY;
  2751		}
  2752	
  2753		err = usb_autopm_get_interface(data->intf);
  2754		if (err < 0)
  2755			return err;
  2756	
  2757		/* Release MediaTek ISO data interface */
  2758		btusb_mtk_release_iso_intf(hdev);
  2759	
  2760		btusb_stop_traffic(data);
  2761		usb_kill_anchored_urbs(&data->tx_anchor);
  2762	
  2763		/* Toggle the hard reset line. The MediaTek device is going to
  2764		 * yank itself off the USB and then replug. The cleanup is handled
  2765		 * correctly on the way out (standard USB disconnect), and the new
  2766		 * device is detected cleanly and bound to the driver again like
  2767		 * it should be.
  2768		 */
> 2769		if (data->rest_gpio) {
  2770			gpiod_set_value_cansleep(data->reset_gpio, 1);
  2771			msleep(200);
  2772			gpiod_set_value_cansleep(data->reset_gpio, 0);
  2773			return 0;
  2774		}
  2775	
  2776		err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
  2777	
  2778		usb_queue_reset_device(data->intf);
  2779		clear_bit(BTMTK_HW_RESET_ACTIVE, &btmtk_data->flags);
  2780	
  2781		return err;
  2782	}
  2783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

