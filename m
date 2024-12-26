Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D144E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2XfanComPwRY0vT1FVgzOC+d0ifACAfwIyZjIs75RQ=; b=WZNgHo/kMNLGjxENb1o8WA96Zk
	EgGDnsNHgGhWftHYEgAGMz1aC8JxvCwZp9t8YdRBhM7twVV/1LeIxWeQs3wLg2gFLA3FRN08W/vlP
	9T7xWW13dqLSnORMSLxAilofS6UJbfKoQYXlXiRTOg1/ONkNne6veIAoZ5/ko3+rfCOKe7yL64pxq
	/nTTEgZrTZQvEkHqq1+Uk798rJwThl7fmgpXVBG6qbQmNkruqJwWvPNrHtIyu0SSNxldKwqGdJoAC
	GIarwLsirOUASfFtjdzkrMoUirIT11IPOwhMKIAGQ2zydNkIDAKfhgkmmu4JEwBiMqHGuW/vS4gid
	8t94fYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQkvo-0000000Fant-1sIb;
	Thu, 26 Dec 2024 10:17:28 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQkuU-0000000FagH-3cye;
	Thu, 26 Dec 2024 10:16:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735208167; x=1766744167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PNysoKr4x3TzAEfHcmAw8WO9zljvb8duad9elAZ9Cfo=;
  b=agrYOLAkKtT84qAthrkD/ZL+OEd1+2p9P7DW3fhLSTWRJVQdi1q/URJE
   b+84ZmbIXmG7kyxHMZf66WUBQk7T3TIXBIvXmT8/Y2xNK9FmwAxRk9AKF
   WQQ6ux6yuejjEjvOy+m8FuocFRYGj/Ii7rzZfji/oL1HMPEAPKgjuIdh1
   4dsuJ1m5R5zCiqQJnk0eBFGNizeUY48LOnz0fuNGns2UHIfH3oUzzMrlk
   sKexS1/oLp8P30WBkqI6Aj0c6MzYUAVrNPlYSE+TnQJN/texnh5lwXS7T
   ZEoH8wxNBrEctN0geTJUJvr02xnlejSjN3x9vBl4Ces1gxvhO4nsgFJTh
   A==;
X-CSE-ConnectionGUID: KvFQlqgZTmioVE5k9k32Rw==
X-CSE-MsgGUID: 8Yo+JHKsQ0mtdhve1N508Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35855079"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="35855079"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 02:16:02 -0800
X-CSE-ConnectionGUID: YtWgRRzCSgS7Y0XstJNVKg==
X-CSE-MsgGUID: SXJucXphRAa1naaBE0aT+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100716808"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Dec 2024 02:15:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQkuJ-0002TS-1u;
	Thu, 26 Dec 2024 10:15:55 +0000
Date: Thu, 26 Dec 2024 18:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
Message-ID: <202412261752.6HK0iJXu-lkp@intel.com>
References: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_021606_964726_F86D0FFF 
X-CRM114-Status: GOOD (  12.19  )
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

Hi Xianwei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4de5110762b94b9978fb8182a568572fb2194f8b]

url:    https://github.com/intel-lab-lkp/linux/commits/Xianwei-Zhao-via-B4-Relay/dt-bindings-pinctrl-Add-support-for-Amlogic-SoCs/20241226-155844
base:   4de5110762b94b9978fb8182a568572fb2194f8b
patch link:    https://lore.kernel.org/r/20241226-amlogic-pinctrl-v2-2-cdae42a67b76%40amlogic.com
patch subject: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux propertity in DTS file
config: arc-randconfig-001-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261752.6HK0iJXu-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412261752.6HK0iJXu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412261752.6HK0iJXu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/pinconf-generic.c:250: warning: Function parameter or struct member 'dev' not described in 'pinconf_generic_parse_dt_pinmux'
>> drivers/pinctrl/pinconf-generic.c:250: warning: Excess function parameter 'pctldev' description in 'pinconf_generic_parse_dt_pinmux'


vim +250 drivers/pinctrl/pinconf-generic.c

   235	
   236	/**
   237	 * pinconf_generic_parse_dt_pinmux()
   238	 * parse the pinmux properties into generic pin mux values.
   239	 * @np: node containing the pinmux properties
   240	 * @pctldev: pincontrol device
   241	 * @pid: array with pin identity entries
   242	 * @pmux: array with pin mux value entries
   243	 * @npins: number of pins
   244	 *
   245	 * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
   246	 */
   247	int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
   248					    unsigned int **pid, unsigned int **pmux,
   249					    unsigned int *npins)
 > 250	{
   251		unsigned int *pid_t;
   252		unsigned int *pmux_t;
   253		struct property *prop;
   254		unsigned int npins_t, i;
   255		u32 value;
   256		int ret;
   257	
   258		prop = of_find_property(np, "pinmux", NULL);
   259		if (!prop) {
   260			dev_info(dev, "Missing pinmux property\n");
   261			return -ENOENT;
   262		}
   263	
   264		if (!pid || !pmux || !npins) {
   265			dev_err(dev, "paramers error\n");
   266			return -EINVAL;
   267		}
   268	
   269		npins_t = prop->length / sizeof(u32);
   270		pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
   271		pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
   272		if (!pid_t || !pmux_t) {
   273			dev_err(dev, "kalloc memory fail\n");
   274			return -ENOMEM;
   275		}
   276		for (i = 0; i < npins_t; i++) {
   277			ret = of_property_read_u32_index(np, "pinmux", i, &value);
   278			if (ret) {
   279				dev_err(dev, "get pinmux value fail\n");
   280				goto exit;
   281			}
   282			pmux_t[i] = value & 0xff;
   283			pid_t[i] = (value >> 8) & 0xffffff;
   284		}
   285		*pid = pid_t;
   286		*pmux = pmux_t;
   287		*npins = npins_t;
   288	
   289		return 0;
   290	exit:
   291		devm_kfree(dev, pid_t);
   292		devm_kfree(dev, pmux_t);
   293		return ret;
   294	}
   295	EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_pinmux);
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

