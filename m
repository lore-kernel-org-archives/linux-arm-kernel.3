Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920E7C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 09:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZy0CRl5aW0Pxb5BnMHOljFTQe2d/7Wav2h1v2sH8AA=; b=L6P5EN2cq8n6+lprjDD+snZAqA
	gxKVZ7YEs3cCMjKMG6hmpmnSWjpAkmUXI08uDPeXQbijzmqoEsdMWaETTeYEag1/LMYJlX4iWdWlY
	IzhsXKv0sNg+ObMhWLa8JvMP/FTIuP7qrc3NHQjPn59qvFuHBpontj5z7jZq8BsznsCyF/9+kwX7b
	4mlJvIxCvlH3Ez0IdrMYVgV6ObzBqgqddnuMxcYucp8/4ek3sewlxq0lzBuz31s8uR9DnekcyKEYL
	w5mXRjVCrHck7fvgdq32EJmOBfEx0N3w3OBp567W7k6oGbiCrRGwAd2ghmDh3Z3d3TskdsZXpXJbP
	0ymI0RkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtsy-00000007n0n-1CyG;
	Wed, 02 Jul 2025 09:36:12 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtc0-00000007jyK-20xY;
	Wed, 02 Jul 2025 09:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751447920; x=1782983920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YgIsYbsQFBijlbHTYsgXc9tCHNmRLzh8Vr+Nl8ZnQ3Y=;
  b=CuB+c7iTvjiAcBaxL+Xq8ZqevfuprXwmOA7CseMZCvJGDz0gG1rZ0Z7D
   F4hlB93Wl1cYr2xDehoREj/Ymti1PzjyPc8qPBb1e+S3/2iyfk+Aacnpm
   3WUJ9aGARNgO7cnZrGbIQ0Ld5ahMOJWEsVolO0Cox2kfxTnIIfbAJoniL
   mjRPOaQHCDxG5umQQCFBP4wQByx0mdCQLME2EBJM2XgUrnVA/SsaOpRoj
   8kyM8u1l6eUnd3L7dLeWr5GMWGVu1dYI7BwQhy73jms2qX/3DIcvJOs7o
   iZ+6A7lNTQY0GJIlp4sHw9EjQZz+hfaeYzTX5wFXS7Yyja/MZCs6U70DB
   Q==;
X-CSE-ConnectionGUID: +wgN5iv0RA68Hm42Ehhr2g==
X-CSE-MsgGUID: 8n5R2itWTqq26wc8aIO9wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427973"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64427973"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 02:18:39 -0700
X-CSE-ConnectionGUID: vxd1XndcT3OoMKfVHJDRig==
X-CSE-MsgGUID: gpP80ZaVRkCf3Rmd/W+dKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159538616"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:18:36 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWtbu-0000RX-0P;
	Wed, 02 Jul 2025 09:18:34 +0000
Date: Wed, 2 Jul 2025 17:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <202507021740.qURVV9D8-lkp@intel.com>
References: <20250701225355.2977294-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701225355.2977294-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_021840_537750_B2134C85 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250701]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-gpio-Create-a-trivial-GPIO-schema/20250702-065536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250701225355.2977294-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
reproduce: (https://download.01.org/0day-ci/archive/20250702/202507021740.qURVV9D8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021740.qURVV9D8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/lp3943.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
>> Warning: Documentation/devicetree/bindings/powerpc/nintendo/wii.txt references a file that doesn't exist: Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/ti,tps6131x.yaml
   Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

