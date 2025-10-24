Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704ABCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 21:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wjrz2b705fwQCHpU1G05h50dzuN50SGvOat3qETxAMw=; b=LLhlkbPeoWF7uZTWR/o0DN4RUe
	71rTiqQ1lZgmk8tUTEiuW44TCOaFYkiv5Hdyf6aNoZH9pQe3c1luSbez6GJpdl+J3TSkw8QnRMpHo
	EFupe4jQvaji0otiZLNa8XMtpkyPrjMEhKmoLNxOsOM0rnMZjvxRyRcqtqjZnP3Zdd5QMEJkKsExa
	+cwBwZDMZDIkKnlKWSG8SUBHFI0qct0cCmJmM1Y4vXauWGXYng3EV7/MI+dwBJ2eiA2EeINYmKNtM
	kZObxR31h2L0z02c8FacpdPWHW4Ym9TJ5WKNHLxnDZ/4GYjh7MnB1oPF68RektjFDqKJK8Fob3g0p
	qD6hI70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCPIO-0000000AY2W-1yzS;
	Fri, 24 Oct 2025 21:26:00 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCPIM-0000000AY22-1JWJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 21:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761341158; x=1792877158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zPOh5wqxEgbCEXKKEbH5sl3BiF2Gmtq2XYoDsNEfQc=;
  b=PL6EcOe6yXKBMLrq1A99BmFxqREow63l4+MwwbcIS3G+JtRIgBz7HQ70
   FqfHNtr6gUo9EAN+qUYHVD7RzrABQvXE2D/+EO3MoHN0c8RqW/cW4j37Y
   gUpqbdiICpZkHZNwfoLt+wgjVDsoMoecIQW4MOR0AEY9XLwNLxoxjYjqW
   WgesE8onQW1Y4aDLvh0fbpL0BC6JfcWaUAqhfBzWSS1eQTI4ePrVQARBJ
   xcMHNnNqDsc2JvOm/NkfYj8BRlfXIB2EWvMJtlAg3N9fdcQYju+UrfqJi
   2NSWcqVVkUGB8KpfH4S/altQdtfesW7wvWF9CADE6v7HXI+hwxQ5wv16x
   g==;
X-CSE-ConnectionGUID: hNmI7WivRtaZe4mUYtTTiQ==
X-CSE-MsgGUID: lzEd1aBaReuP3qUKWrV5dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63620752"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63620752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 14:25:57 -0700
X-CSE-ConnectionGUID: CqL5zGUgSpazFxb3BTqu7A==
X-CSE-MsgGUID: NsbYYu+PQ32Jf62A7c7GkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="215182989"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2025 14:25:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCPII-000Etp-1V;
	Fri, 24 Oct 2025 21:25:54 +0000
Date: Sat, 25 Oct 2025 05:25:42 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:ux500-janice-v6.18-rc1 9/11]
 drivers/input/misc/isa1200.c:423:10: error: 'struct i2c_driver' has no
 member named 'probe_new'
Message-ID: <202510250509.rKlq3ySg-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_142558_370457_14AA6FE9 
X-CRM114-Status: GOOD (  11.17  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git ux500-janice-v6.18-rc1
head:   ccd3929e54f44ccae885d803cc472204f661c886
commit: 5e4f8e741997d1d027479597bf5265607888bcb1 [9/11] Input: isa1200 - new driver for Immersion ISA1200
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20251025/202510250509.rKlq3ySg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250509.rKlq3ySg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250509.rKlq3ySg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/isa1200.c:423:10: error: 'struct i2c_driver' has no member named 'probe_new'
     423 |         .probe_new = isa1200_probe,
         |          ^~~~~~~~~
>> drivers/input/misc/isa1200.c:423:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
     423 |         .probe_new = isa1200_probe,
         |                      ^~~~~~~~~~~~~
   drivers/input/misc/isa1200.c:423:22: note: (near initialization for 'isa1200_i2c_driver.id_table')
   drivers/input/misc/isa1200.c:283:12: note: 'isa1200_probe' declared here
     283 | static int isa1200_probe(struct i2c_client *client)
         |            ^~~~~~~~~~~~~


vim +423 drivers/input/misc/isa1200.c

   416	
   417	static struct i2c_driver isa1200_i2c_driver = {
   418		.driver = {
   419			.name = "isa1200",
   420			.of_match_table = isa1200_of_match,
   421			.pm = &isa1200_pm,
   422		},
 > 423		.probe_new = isa1200_probe,
   424	};
   425	module_i2c_driver(isa1200_i2c_driver);
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

