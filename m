Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AACC02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBJgNyWrC0RxqeS3kzcgaSlmgQeV5i+55GjShRf9p8g=; b=IzbBh9NwavE+LRr7rCU+FJkAPa
	+5LjSlcsR+HgET3umDURKGDxES4C//TxDl3UWuvflj77kcLh1dHVGyr3+TCvPSXymZfBja/TM1mEh
	TgyD5rzw4in3JZHSdosBkRUBrtZjKMX6a4SxXSW3F/Ia9GFYA98sj48v47uJw82Md8qFug9V6toAo
	5NfbmQ4iMj88vqsG7u504jPARziMr5DnLzNJ3ipmSQoMXVZFiQkTxZ0MDLnfY1Icik+pgKvSgp8AM
	SFfW+tHqNJDUg1FaHf72IIc7J6I6BJx0tcHHRLUb/aR7lw6y/eaHRxYM+fJeFBSrFFsuAm5C6EIo0
	GYJHl2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9MX-0000000CvxJ-0p95;
	Wed, 15 Jan 2025 19:47:37 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9Kp-0000000Cvf3-3eDO;
	Wed, 15 Jan 2025 19:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736970352; x=1768506352;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nJNs4DtnimvoTU3qtzohKzecutGkBG66VbnYL8iKSQE=;
  b=GSyHm5Z33StaOyCt+dM3RCjNnRDeLEPP33tO6ZaqJPkgq4m8lFxIlvEX
   7PkcnCIRmOXd1qCXC0wx5uN1ab2/fTWhfXdm1YuAnYd4f5QK0dUVRnt7v
   wNDSNydeVdIFw/UbXxRybzc+cooqiUbfcmtapexzKh9GuPyyZjkygojsL
   gxG206sBvZd2hRcRZ+lsbzBVvoqVuYgIN0LaitVIgFoEu+SPxCfmPE9w9
   m9vbmlVYWlSjdtU7hSjyOjZ7/XjkzrfGbDKTYRX/rqYdTt6E43IMuZJ6R
   VRS8Dqmu6ka/JXNz65GlpOXtFxJqdNL/VKn161rjMu7L9wD0DghbTPPlk
   g==;
X-CSE-ConnectionGUID: XPPH6A9cR0KwdRPRQQ7cGg==
X-CSE-MsgGUID: Y+iAmhUqTrCVNWrmnD29HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="41260719"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="41260719"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 11:45:49 -0800
X-CSE-ConnectionGUID: e8uQRh9CS4KDLGRInb65Uw==
X-CSE-MsgGUID: 5IAEEZ/CR1K3LnUoWm/L0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="110213744"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Jan 2025 11:45:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY9Ki-000QlT-0x;
	Wed, 15 Jan 2025 19:45:44 +0000
Date: Thu, 16 Jan 2025 03:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yenchia Chen <yenchia.chen@mediatek.com>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, yenchia.chen@mediatek.com,
	yj.chiang@mediatek.com, tbergstrom@nvidia.com, yujiaoliang@vivo.com,
	u.kleine-koenig@baylibre.com, treapking@chromium.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] serial: 8250_mtk: Add ACPI support
Message-ID: <202501160328.DUMWkTOc-lkp@intel.com>
References: <20250114033324.3533292-1-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114033324.3533292-1-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_114551_918886_E58D2DF8 
X-CRM114-Status: GOOD (  12.14  )
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

Hi Yenchia,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on tty/tty-next tty/tty-linus usb/usb-testing usb/usb-next usb/usb-linus linus/master v6.13-rc7 next-20250115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yenchia-Chen/serial-8250_mtk-Add-ACPI-support/20250114-113715
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20250114033324.3533292-1-yenchia.chen%40mediatek.com
patch subject: [PATCH] serial: 8250_mtk: Add ACPI support
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250116/202501160328.DUMWkTOc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160328.DUMWkTOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501160328.DUMWkTOc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_mtk.c:662:36: warning: 'mtk8250_acpi_match' defined but not used [-Wunused-const-variable=]
     662 | static const struct acpi_device_id mtk8250_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~


vim +/mtk8250_acpi_match +662 drivers/tty/serial/8250/8250_mtk.c

   661	
 > 662	static const struct acpi_device_id mtk8250_acpi_match[] = {
   663		{ "MTKI0511", 0 },
   664		{},
   665	};
   666	MODULE_DEVICE_TABLE(acpi, mtk8250_acpi_match);
   667	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

