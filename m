Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6E8CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPKjmK8IL0hIKWSuz78Dkqskm1BmzhLo3RxKx9xEcm8=; b=gRlNc1sfl1akuzSC7ZpTk6VnsB
	9b37sjc2C8+gaQwzlai/W/dgWsUXxtGptLnxpZGciS82+mDzljB36zS4IJjR5v3DC/iBG7lVAWZAq
	ZLkRzppB+EOWvYMRfj0DL4L6FykLVHux2Z2NWQBK6vbHuH+Y5xLIFlxXdMffjGZqQv5E2ceqz0xzd
	NWze04fRhUe1Ab5/2cVh8eBglyGOG7zj2HAztH//KPidkEQLnd7cmeTmHb3MSKPYlzlDYo9nkYdsS
	sm9Yk4cceHsbp5YHmwYTEBCAH8vX3U3UT+9nOsZ6ZmhOnMTnGoMz8j2Hp2pZvKmCRsMrfqs1W0MWu
	pBnhvUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jh7-00000009JZh-3b82;
	Fri, 10 Oct 2025 20:26:29 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Jh5-00000009JZK-09TN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 20:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760127987; x=1791663987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AscKgj05BtJh9IDBr3hGSKSH55FRqss4Bu8m5A4Qt98=;
  b=W5m/ACAIQ4ncsE5THaX4vwN3w8NwhqKl8cTxoV6K/WU1wDUWF07p1bgS
   HEZSvylzwp9Balhl6U3kgjlHFeJOH3wZ5sdl0SzJq3K3eFYfp3V5DdGJ8
   WcXgjdjx1Fy9FsvpKT3fKS0I74q5KtuPGV8px7BNYDnIvXkFvroH7A1Qd
   GGAD2ovM6q25EJfB8uZWwPfwXPnXqAd0V4jwkxnFOqkuIGtr9+LNpos9s
   ase7EYOBXUoxaaLkVQ3Ij/6g6wYNzDd/c6BSd6RQUzcs3GcQydpainuR2
   ylxYTzqvmYrRhYWUqbTriQHBnvCNgcq8iv0aDmCd4SZPByTFeH2WYBlfG
   Q==;
X-CSE-ConnectionGUID: 8rgG//ArQ9aPVMSgkKoZ+g==
X-CSE-MsgGUID: JE0DLTZQTsmVmg1WDB1hkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64974408"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="64974408"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 13:26:26 -0700
X-CSE-ConnectionGUID: Fhe87ZQLTb6TwXu4exd1Hg==
X-CSE-MsgGUID: kEAcKQVcRpKmqg4V6RHnnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="181010994"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Oct 2025 13:26:21 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Jgx-000391-0y;
	Fri, 10 Oct 2025 20:26:19 +0000
Date: Sat, 11 Oct 2025 04:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 06/13] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <202510110421.ZnJdu1ds-lkp@intel.com>
References: <20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_132627_141406_DE5EA7FD 
X-CRM114-Status: GOOD (  12.42  )
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

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on c746c3b5169831d7fb032a1051d8b45592ae8d78]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/dt-bindings-rtc-Add-Apple-SMC-RTC/20251010-092141
base:   c746c3b5169831d7fb032a1051d8b45592ae8d78
patch link:    https://lore.kernel.org/r/20251007-macsmc-subdevs-v3-6-d7d3bfd7ae02%40gmail.com
patch subject: [PATCH v3 06/13] hwmon: Add Apple Silicon SMC hwmon driver
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20251011/202510110421.ZnJdu1ds-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110421.ZnJdu1ds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110421.ZnJdu1ds-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/macsmc-hwmon.c: In function 'macsmc_hwmon_write_f32':
>> drivers/hwmon/macsmc-hwmon.c:246:24: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     246 |                 fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
         |                        ^~~~~~~~~~


vim +/FIELD_PREP +246 drivers/hwmon/macsmc-hwmon.c

   225	
   226	static int macsmc_hwmon_write_f32(struct apple_smc *smc, smc_key key, int value)
   227	{
   228		u64 val;
   229		u32 fval = 0;
   230		int exp = 0, neg;
   231	
   232		val = abs(value);
   233		neg = val != value;
   234	
   235		if (val) {
   236			int msb = __fls(val) - exp;
   237	
   238			if (msb > 23) {
   239				val >>= msb - FLT_MANT_BIAS;
   240				exp -= msb - FLT_MANT_BIAS;
   241			} else if (msb < 23) {
   242				val <<= FLT_MANT_BIAS - msb;
   243				exp += msb;
   244			}
   245	
 > 246			fval = FIELD_PREP(FLT_SIGN_MASK, neg) |
   247			       FIELD_PREP(FLT_EXP_MASK, exp + FLT_EXP_BIAS) |
   248			       FIELD_PREP(FLT_MANT_MASK, val);
   249		}
   250	
   251		return apple_smc_write_u32(smc, key, fval);
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

