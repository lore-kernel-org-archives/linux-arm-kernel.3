Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA61D59F6F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 06:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4Zi0Cq2cNoPGA6Sc/4dV8ieFRc3hxO7Se1dqUqqJX4=; b=jSCRmBZXgCooEaC9I2btxmf6Hm
	O3+Cow1aZqn5IPWEn+d4RUtttbhWx2S0GigNASzN0HpG5GzfMLg8oAPLQ9rTFzRiZcB/j69De0RFF
	ZDyJPATspfoiXMe/Es+iLYMfSkvcP1O9yCnaRLF6oK4TBdwfLIIui9pN0GQ2l+Xd8MXmLPEKciIU4
	H4ojUUj7k64x+/Eqr24YSFgA5gC0xCqw5s/Ec/GpErSaE1YSO57X5x1+vUCbyt+6F1fz1qVp5vQR7
	BRrfwkaXjNuhK58fdamKVoO6oTOe3E2FW40OWkIEx2uVOOUSGH8+ZXk0xkOHbvM/WLs7s1qR4I3aZ
	VTWabZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJ2D-00000001SUC-2c6s;
	Sat, 13 Dec 2025 06:23:17 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUJ2A-00000001STm-41My
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 06:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765606995; x=1797142995;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/lblB9mHbneVuke30grVcxJBPtiroHf6vSxLBptFtwY=;
  b=a3mZf1K6KdNw2cz6no+sWnp/9qt0pDU+zOeUCZ7nYAWzAFwWBW2S1691
   C38AtvfhldluTBGEHzpeG0GvHICJGwtNeGzsa9HGXkuxGtbOC6pQ6P7nS
   Yh7PZ8cJuoxeRovVjm++bpnNOaQfKhazYeyMfhPWlhA2OjUXEtj9vFNeW
   uI9RMQLogIkstCqx+Jbnz7AW58YWJNERskqyydfq8GLXWWHZ615hyJteE
   6jOvh8eIvQntZfj2rtFy9gtyHNHJiYOdUcL5wKFmaHOJq6ZbgdB08/M7w
   cZDfX7ZyyvnYMSBxefgbRQTViTNfo3CUSAr2XKNdC+BwGQCuujJ4G5vNo
   A==;
X-CSE-ConnectionGUID: JbvxgqW+SmiRwUrxN98t5g==
X-CSE-MsgGUID: wAJnxUGXS72r0uLwwzzzYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85195471"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85195471"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:23:13 -0800
X-CSE-ConnectionGUID: /ArYPWWMQhODYdGKXQI2Hg==
X-CSE-MsgGUID: 5PESpJhWRDqeRxxg82lXqg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2025 22:23:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJ21-000000007A1-3Wso;
	Sat, 13 Dec 2025 06:23:05 +0000
Date: Sat, 13 Dec 2025 14:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	"Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
Message-ID: <202512131342.1nkKkryD-lkp@intel.com>
References: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_222315_064402_AE5131AD 
X-CRM114-Status: GOOD (  18.47  )
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on d358e5254674b70f34c847715ca509e46eb81e6f]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Perrot-Schneider-Electric/dt-bindings-vendor-prefixes-Add-AAEON-vendor-prefix/20251212-154458
base:   d358e5254674b70f34c847715ca509e46eb81e6f
patch link:    https://lore.kernel.org/r/20251212-dev-b4-aaeon-mcu-driver-v1-6-6bd65bc8ef12%40bootlin.com
patch subject: [PATCH 6/8] gpio: aaeon: Add GPIO driver for SRG-IMX8PL MCU
config: arc-randconfig-r132-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131342.1nkKkryD-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131342.1nkKkryD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131342.1nkKkryD-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   `.exit.text' referenced in section `__jump_table' of lib/test_dynamic_debug.o: defined in discarded section `.exit.text' of lib/test_dynamic_debug.o
   arc-linux-ld: drivers/gpio/gpio-aaeon-mcu.o: in function `aaeon_mcu_gpio_get':
>> drivers/gpio/gpio-aaeon-mcu.c:124:(.text+0x4c): undefined reference to `aaeon_mcu_i2c_xfer'
>> arc-linux-ld: drivers/gpio/gpio-aaeon-mcu.c:124:(.text+0x4c): undefined reference to `aaeon_mcu_i2c_xfer'
   arc-linux-ld: drivers/gpio/gpio-aaeon-mcu.o: in function `aaeon_mcu_gpio_set':
   drivers/gpio/gpio-aaeon-mcu.c:139:(.text+0x100): undefined reference to `aaeon_mcu_i2c_xfer'
   arc-linux-ld: drivers/gpio/gpio-aaeon-mcu.c:139:(.text+0x100): undefined reference to `aaeon_mcu_i2c_xfer'
   arc-linux-ld: drivers/gpio/gpio-aaeon-mcu.c:150:(.text+0x172): undefined reference to `aaeon_mcu_i2c_xfer'
   arc-linux-ld: drivers/gpio/gpio-aaeon-mcu.o:drivers/gpio/gpio-aaeon-mcu.c:150: more undefined references to `aaeon_mcu_i2c_xfer' follow
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o

sparse warnings: (new ones prefixed by >>)
>> drivers/gpio/gpio-aaeon-mcu.c:246:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpio/gpio-aaeon-mcu.c:247:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/gpio/gpio-aaeon-mcu.c:248:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpio/gpio-aaeon-mcu.c:248:1: sparse: sparse: bad integer constant expression
   drivers/gpio/gpio-aaeon-mcu.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +124 drivers/gpio/gpio-aaeon-mcu.c

   110	
   111	static int aaeon_mcu_gpio_get(struct gpio_chip *gc, unsigned int offset)
   112	{
   113		struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
   114		u8 cmd[3], rsp;
   115		int ret;
   116	
   117		if (offset < MAX_GPOS)
   118			return test_bit(offset, data->gpo_state);
   119	
   120		cmd[0] = AAEON_MCU_READ_GPIO;
   121		cmd[1] = offset - 7;
   122		cmd[2] = 0x00;
   123	
 > 124		ret = aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
   125		if (ret < 0)
   126			return ret;
   127	
   128		return rsp;
   129	}
   130	
   131	static int aaeon_mcu_gpo_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
   132	{
   133		u8 cmd[3], rsp;
   134	
   135		cmd[0] = AAEON_MCU_CONTROL_GPO;
   136		cmd[1] = offset + 1;
   137		cmd[2] = !!value;
   138	
   139		return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
   140	}
   141	
   142	static int aaeon_mcu_gpio_set_cmd(struct aaeon_mcu_gpio *data, unsigned int offset, int value)
   143	{
   144		u8 cmd[3], rsp;
   145	
   146		cmd[0] = AAEON_MCU_WRITE_GPIO;
   147		cmd[1] = offset - 7;
   148		cmd[2] = !!value;
   149	
   150		return aaeon_mcu_i2c_xfer(data->mfd->i2c_client, cmd, 3, &rsp, 1);
   151	}
   152	
   153	static int aaeon_mcu_gpio_set(struct gpio_chip *gc, unsigned int offset,
   154				      int value)
   155	{
   156		struct aaeon_mcu_gpio *data = gpiochip_get_data(gc);
   157	
   158		if (offset < MAX_GPOS) {
   159			if (aaeon_mcu_gpo_set_cmd(data, offset, value) == 0)
   160				assign_bit(offset, data->gpo_state, value);
   161		} else {
   162			return aaeon_mcu_gpio_set_cmd(data, offset, value);
   163		}
   164		return 0;
   165	}
   166	
   167	static const struct gpio_chip aaeon_mcu_chip = {
   168		.label			= "gpio-aaeon-mcu",
   169		.owner			= THIS_MODULE,
   170		.get_direction		= aaeon_mcu_gpio_get_direction,
   171		.direction_input	= aaeon_mcu_gpio_direction_input,
   172		.direction_output	= aaeon_mcu_gpio_direction_output,
   173		.get			= aaeon_mcu_gpio_get,
   174		.set			= aaeon_mcu_gpio_set,
   175		.base			= -1,
   176		.ngpio			= MAX_GPOS + MAX_GPIOS,
   177		.can_sleep		= true,
   178	};
   179	
   180	static void aaeon_mcu_gpio_reset(struct aaeon_mcu_gpio *data, struct device *dev)
   181	{
   182		unsigned int i;
   183		int ret;
   184	
   185		/* Reset all GPOs */
   186		for (i = 0; i < MAX_GPOS; i++) {
   187			ret = aaeon_mcu_gpo_set_cmd(data, i, 0);
   188			if (ret < 0)
   189				dev_warn(dev, "Failed to reset GPO %u state: %d\n", i, ret);
   190			clear_bit(i, data->dir_in);
   191		}
   192	
   193		/* Reset all GPIOs */
   194		for (i = MAX_GPOS; i < MAX_GPOS + MAX_GPIOS; i++) {
   195			ret = aaeon_mcu_gpio_config_input_cmd(data, i);
   196			if (ret < 0)
   197				dev_warn(dev, "Failed to reset GPIO %u state: %d\n", i, ret);
   198			set_bit(i, data->dir_in);
   199		}
   200	}
   201	
   202	static int aaeon_mcu_gpio_probe(struct platform_device *pdev)
   203	{
   204		struct aaeon_mcu_dev *mfd = dev_get_drvdata(pdev->dev.parent);
   205		struct aaeon_mcu_gpio *data;
   206	
   207		data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
   208		if (!data)
   209			return -ENOMEM;
   210	
   211		data->mfd = mfd;
   212		data->gc = aaeon_mcu_chip;
   213		data->gc.parent = &pdev->dev;
   214	
   215		/*
   216		 * Reset all GPIO states to a known configuration. The MCU does not
   217		 * reset GPIO state on soft reboot, only on power cycle (hard reboot).
   218		 * Without this reset, GPIOs would retain their previous state across
   219		 * reboots, which could lead to unexpected behavior.
   220		 */
   221		aaeon_mcu_gpio_reset(data, &pdev->dev);
   222	
   223		platform_set_drvdata(pdev, data);
   224	
   225		return devm_gpiochip_add_data(&pdev->dev, &data->gc,
   226					      data);
   227	}
   228	
   229	static const struct of_device_id aaeon_mcu_gpio_of_match[] = {
   230		{ .compatible = "aaeon,srg-imx8pl-gpio" },
   231		{},
   232	};
   233	
   234	MODULE_DEVICE_TABLE(of, aaeon_mcu_gpio_of_match);
   235	
   236	static struct platform_driver aaeon_mcu_gpio_driver = {
   237		.driver = {
   238			.name = "aaeon-mcu-gpio",
   239			.of_match_table = aaeon_mcu_gpio_of_match,
   240		},
   241		.probe = aaeon_mcu_gpio_probe,
   242	};
   243	
   244	module_platform_driver(aaeon_mcu_gpio_driver);
   245	
 > 246	MODULE_DESCRIPTION("GPIO interface for Aaeon MCU");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

