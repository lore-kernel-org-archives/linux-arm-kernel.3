Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4579ECAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWaLu9UIHcRV3XvCl1msglz3xlSh4+pN4ENSkCoyCow=; b=kCPtlt+gbkW1qTJC8cXvttGWth
	8ELj4WdrHuoS7jL+RC8k1iV5VsXmfm0jP+rdT9HqKecJpOXDbaY6+JdmgJIstiwXH5KAeM6PxF6e7
	gMXBGFr5YHozIRDYQHJfi4Csf5BZJDYT97txooNdnOU+N1sRIqTtZmDUH/TUaKVcJRMH8Bv7eG3Y6
	NMOrlJ2KH4RfcYDsRMLGKVtJoVxNDfCEN42jZIJ+wPEvO2SvI4PgZ6OHEoYqd/tQQXtUC5nwJDy+N
	euW/WnHw96kNnRi5iI2ZmP1PJmIAJbeg90QVjW2CPATkGMBxb5we/AcVtTxfw2m+Qm1WtCgWKqtQD
	41gFkN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bQZ-00000009ZB4-0PEe;
	Mon, 22 Sep 2025 07:57:39 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bQV-00000009Z9e-2JOH;
	Mon, 22 Sep 2025 07:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758527856; x=1790063856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8yVDHTkeERDKqGU8/+5de0a01zz7l/9JjTsXpfwJEqU=;
  b=e7o+rY4T1VHqE26mQcKa2x12Q6FzgHU4JDyM74EmQQoqL2CDvx1YoqMm
   wJeZ2safDzYNp2Azydf/5f8e8I214GAuPeVKZDIPdlJ9TX3JpCQ5nBHPy
   uc0gA/TPXDVyfl+vF6xxAHfpMOb3qtPzSkkrP2EssP/3mmVP5jkqWgeb1
   A8JF5IauBY8sM7AbuMlrCZhp15xqyMQgX+6UvZJ1xij2yz1mQTX1iIQ/p
   o48ozUpRn3t/3DA4HTHXXExwKhZ/eR02m818S1I6MbCvLOiD+lpZ2NP9A
   RVaDYMJKXgsadoIJjIrzYQsrYDymWAOW4lCMBZ0lk79GZmranwZd2+Afe
   A==;
X-CSE-ConnectionGUID: 1VtRRdsfTWGLr6QC7g/YVw==
X-CSE-MsgGUID: LvucopA3Tq+8PaT63dJ37A==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60901914"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="60901914"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 00:57:31 -0700
X-CSE-ConnectionGUID: A37dvFYzS3yKNurn/d60PA==
X-CSE-MsgGUID: JVijE6a3RaepPTic1nShNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="180675538"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Sep 2025 00:57:24 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0bQH-0001R3-1T;
	Mon, 22 Sep 2025 07:57:21 +0000
Date: Mon, 22 Sep 2025 15:56:35 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/7] usb: typec: Add default HPD device when register
 DisplayPort altmode
Message-ID: <202509221516.1umvcXG6-lkp@intel.com>
References: <20250922012039.323-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922012039.323-2-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_005735_602753_79307AE9 
X-CRM114-Status: GOOD (  13.64  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next linus/master v6.17-rc7 next-20250919]
[cannot apply to rockchip/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/usb-typec-Add-default-HPD-device-when-register-DisplayPort-altmode/20250922-092549
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250922012039.323-2-kernel%40airkyi.com
patch subject: [PATCH v4 1/7] usb: typec: Add default HPD device when register DisplayPort altmode
config: i386-buildonly-randconfig-003-20250922 (https://download.01.org/0day-ci/archive/20250922/202509221516.1umvcXG6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221516.1umvcXG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221516.1umvcXG6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/typec/class.c:18:
>> drivers/usb/typec/altmodes/displayport.h:7:5: warning: no previous prototype for 'dp_altmode_probe' [-Wmissing-prototypes]
       7 | int dp_altmode_probe(struct typec_altmode *alt) { return -ENOTSUPP; }
         |     ^~~~~~~~~~~~~~~~
>> drivers/usb/typec/altmodes/displayport.h:8:6: warning: no previous prototype for 'dp_altmode_remove' [-Wmissing-prototypes]
       8 | void dp_altmode_remove(struct typec_altmode *alt) { }
         |      ^~~~~~~~~~~~~~~~~
>> drivers/usb/typec/altmodes/displayport.h:9:6: warning: no previous prototype for 'dp_altmode_hpd_device_register' [-Wmissing-prototypes]
       9 | void dp_altmode_hpd_device_register(struct typec_altmode *alt) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dp_altmode_probe +7 drivers/usb/typec/altmodes/displayport.h

d266e96820cc36 Ajay Gupta  2019-04-23 @7  int dp_altmode_probe(struct typec_altmode *alt) { return -ENOTSUPP; }
d266e96820cc36 Ajay Gupta  2019-04-23 @8  void dp_altmode_remove(struct typec_altmode *alt) { }
50d2edccce6bf3 Chaoyi Chen 2025-09-22 @9  void dp_altmode_hpd_device_register(struct typec_altmode *alt) { }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

