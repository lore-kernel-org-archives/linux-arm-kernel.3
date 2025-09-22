Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E918CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 08:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnz4YXT4UL+ZtyagC/lw+PodgYHU9nUB0jDVzq9G9Kw=; b=nAvUIJquf56PZj3O1UgpMA3rnC
	7cKeS5fxZd5t2i1DJ20W1BNlOH0J0MnXP44dcEFalIdMcKkzY3KDt1THHrW+ojBG2GhXKNgsKJX6g
	Ke9mljlkUTAlFxZuQHM5hEBfu6MOLogKESQvzEr4ZhI7TxsslHh7ANJphxrkCvqEvtlZydEY0UsKL
	LlJPhj5zGvkBY/J1+6Le9MdWFq3APfhA4KBQeDmOtCYX7y42b65KlgM1f2Ydjw+73KU5SpBi1yh3Q
	HY9L91WUBFQGUvbiqsSrpFTf6FMzHkjxx/Hfvw29qNEf/mNOi2UZMOFZJxIbgIX23El0+/DfZsorK
	bp0tW1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cFT-00000009ntz-2Hej;
	Mon, 22 Sep 2025 08:50:15 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0cFQ-00000009ntG-0tRQ;
	Mon, 22 Sep 2025 08:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758531012; x=1790067012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EIwX2Gv25NRIdufRlFKCm9KTmV1tzjcTIKEMfhqFOjs=;
  b=UiEkSYfFx4DtPUl35Tq/as+vXxhO52ktCNZhqBBl1kzQyKSkC3Su7iGn
   7iOIvSoB3FBar1N0ZkYA7ixCji9A/swiz8diiRx8IDeDN/bBK5rsot51j
   6CImqtcwt+MSKPIgENG/8vSGLoXd5AKZeWw4npg4kREBABlHJs7wkIytE
   EkJr2v65wWZOLaATWhBVHUl7w506dTop/l8xTTd0zoxUAX5V9tcKrdbty
   Hftjiw2GdjtckD9W908hSwf+b8mB6jma6Epyb5F+Gb4Nd7Y7wS5j3HKg7
   /YMTG1vB6IY8luUke0umOVYtO4tglI1B8I4GgcBUoSDOgcCnBblV5Af9a
   w==;
X-CSE-ConnectionGUID: SWyaYeq8SFGO0v5t32Mf8A==
X-CSE-MsgGUID: AVk19TlDSjaCc7Fb5kJ5iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="48364751"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="48364751"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 01:50:10 -0700
X-CSE-ConnectionGUID: H465Suv1SMms04Tugxlnaw==
X-CSE-MsgGUID: 2epaaLTjT7uCtIJLozB0OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="176033714"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2025 01:50:03 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0cFF-0001UX-07;
	Mon, 22 Sep 2025 08:50:01 +0000
Date: Mon, 22 Sep 2025 16:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <202509221607.rWZ3wNqm-lkp@intel.com>
References: <20250922012039.323-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_015012_308829_20105580 
X-CRM114-Status: GOOD (  12.31  )
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

Hi Chaoyi,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next linus/master v6.17-rc7 next-20250919]
[cannot apply to rockchip/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/usb-typec-Add-default-HPD-device-when-register-DisplayPort-altmode/20250922-092549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250922012039.323-2-kernel%40airkyi.com
patch subject: [PATCH v4 1/7] usb: typec: Add default HPD device when register DisplayPort altmode
config: arm-randconfig-001-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221607.rWZ3wNqm-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221607.rWZ3wNqm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221607.rWZ3wNqm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dp_altmode_hpd_device_register
   >>> referenced by class.c:609 (drivers/usb/typec/class.c:609)
   >>>               drivers/usb/typec/class.o:(typec_register_altmode) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

