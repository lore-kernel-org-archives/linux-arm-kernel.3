Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44641CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QcaRmLz9FiLPhXXmE8TyE1XEjU9TRcZZad+3l2nV6sI=; b=fwsKWlqrtxJthJhkg39Sah+chV
	+a+OpWshE3fnCmpsl8pRTEIqiMwrpeHsvbzGmM3Umo3F/EKjHiDF4acvhVXSHHWgDFrEHMr9TZD92
	ay9kQC8R8HAYWIyJWNTsb581+XepRQRD+XOcmjrQaIpSuIux07EjMWKkpDzU322PvBC04TY0gijMz
	5q/terB++39YD1YXRAVZteO5i+FnksHCkE13qH9FKYUbrp2+jA6QO7oUlKkVQzD46Yy4n6yCJZWkn
	pE1MeKuD230DYSZbjKi1BkBZuN/5iQbg7FRomZ8rseN09bkfE7PKiQX/+Q4ulxOh9zFJGYz9/RpOX
	MLHrpG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7KVa-00000009PKr-1XeF;
	Fri, 10 Oct 2025 21:18:38 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7KVX-00000009PKC-3873;
	Fri, 10 Oct 2025 21:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760131115; x=1791667115;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZB7gTALx625QNqK16XpJCnVnzCKeZXqVUYR+15Tq6Eo=;
  b=fbeqMBo7IhHvbKapr5u+zCIs2LabyKp4AdZvIOWm5FVZ1uJgGJ3TFiem
   xS6T9KVwkQUVLGaHfqzzR+45J9p6gizp/GvjZxpDWb52W8hfUqPL3EumR
   N88LIHMJYhFqW8634ZcCM1/1qRLLuLTA4N3YRJLwogmuhXua6n0jX13hY
   ixw3GRVZTiegDbEHM0vCtHa2lGXbG418c/j6ImvAUm3mICrw6iyLDODNE
   4gv9gE2gr0RCCKiCRfZMZfpDU3j+Sx6hIZ6b7U4pP+MuQ6A1BUK/3qRkB
   LbJd18muaxfG5M8PlpD5BBbf3ET7kqpQ8MQJZxslA1TpsSi7nfx+taOKR
   g==;
X-CSE-ConnectionGUID: 1UD4fRkxQsueXKOmwhnD3A==
X-CSE-MsgGUID: iN0NEaryTB+nuzDBLRcZFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62386911"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62386911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 14:18:31 -0700
X-CSE-ConnectionGUID: fA3MzUJ8R5W/zcSKv2QBPQ==
X-CSE-MsgGUID: rr8eFiMJT5eYgQ8vSm6kFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180653184"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 Oct 2025 14:18:26 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7KVM-0003BB-16;
	Fri, 10 Oct 2025 21:18:24 +0000
Date: Sat, 11 Oct 2025 05:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
	broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v8 2/9] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
Message-ID: <202510110504.A2lR6quW-lkp@intel.com>
References: <20251003091158.26748-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251003091158.26748-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_141835_832908_AC536533 
X-CRM114-Status: GOOD (  13.65  )
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

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on lee-mfd/for-mfd-next jic23-iio/togreg lee-leds/for-leds-next lee-mfd/for-mfd-fixes linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20251003-171606
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20251003091158.26748-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v8 2/9] regulator: Add support for MediaTek MT6316 SPMI PMIC Regulators
config: alpha-randconfig-r073-20251009 (https://download.01.org/0day-ci/archive/20251011/202510110504.A2lR6quW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110504.A2lR6quW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110504.A2lR6quW-lkp@intel.com/

All errors (new ones prefixed by >>):

   `xe_configfs_exit' referenced in section `.data.rel.ro' of drivers/gpu/drm/xe/xe_module.o: defined in discarded section `.exit.text' of drivers/gpu/drm/xe/xe_configfs.o
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_base_read':
>> drivers/base/regmap/regmap-spmi.c:26:(.text+0x11c): undefined reference to `spmi_register_read'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:26:(.text+0x124): undefined reference to `spmi_register_read'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_base_gather_write':
>> drivers/base/regmap/regmap-spmi.c:46:(.text+0x1f0): undefined reference to `spmi_register_zero_write'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:46:(.text+0x1f4): undefined reference to `spmi_register_zero_write'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:56:(.text+0x220): undefined reference to `spmi_register_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:56:(.text+0x228): undefined reference to `spmi_register_write'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_ext_read':
>> drivers/base/regmap/regmap-spmi.c:124:(.text+0x3f0): undefined reference to `spmi_ext_register_read'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:124:(.text+0x404): undefined reference to `spmi_ext_register_read'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:136:(.text+0x444): undefined reference to `spmi_ext_register_readl'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:136:(.text+0x458): undefined reference to `spmi_ext_register_readl'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.o: in function `regmap_spmi_ext_gather_write':
>> drivers/base/regmap/regmap-spmi.c:164:(.text+0x528): undefined reference to `spmi_ext_register_write'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:164:(.text+0x53c): undefined reference to `spmi_ext_register_write'
>> alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:176:(.text+0x57c): undefined reference to `spmi_ext_register_writel'
   alpha-linux-ld: drivers/base/regmap/regmap-spmi.c:176:(.text+0x590): undefined reference to `spmi_ext_register_writel'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for REGMAP_SPMI
   Depends on [n]: SPMI [=n]
   Selected by [y]:
   - REGULATOR_MT6316 [=y] && REGULATOR [=y] && (SPMI [=n] || COMPILE_TEST [=y])


vim +26 drivers/base/regmap/regmap-spmi.c

a01779f89fc8a2 Josh Cartwright 2013-10-28   15  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   16  static int regmap_spmi_base_read(void *context,
a01779f89fc8a2 Josh Cartwright 2013-10-28   17  				 const void *reg, size_t reg_size,
a01779f89fc8a2 Josh Cartwright 2013-10-28   18  				 void *val, size_t val_size)
a01779f89fc8a2 Josh Cartwright 2013-10-28   19  {
c9afbb05a9ffbe Josh Cartwright 2014-02-12   20  	u8 addr = *(u8 *)reg;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   21  	int err = 0;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   22  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   23  	BUG_ON(reg_size != 1);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   24  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   25  	while (val_size-- && !err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12  @26  		err = spmi_register_read(context, addr++, val++);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   27  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   28  	return err;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   29  }
c9afbb05a9ffbe Josh Cartwright 2014-02-12   30  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   31  static int regmap_spmi_base_gather_write(void *context,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   32  					 const void *reg, size_t reg_size,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   33  					 const void *val, size_t val_size)
c9afbb05a9ffbe Josh Cartwright 2014-02-12   34  {
c9afbb05a9ffbe Josh Cartwright 2014-02-12   35  	const u8 *data = val;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   36  	u8 addr = *(u8 *)reg;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   37  	int err = 0;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   38  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   39  	BUG_ON(reg_size != 1);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   40  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   41  	/*
c9afbb05a9ffbe Josh Cartwright 2014-02-12   42  	 * SPMI defines a more bandwidth-efficient 'Register 0 Write' sequence,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   43  	 * use it when possible.
c9afbb05a9ffbe Josh Cartwright 2014-02-12   44  	 */
c9afbb05a9ffbe Josh Cartwright 2014-02-12   45  	if (addr == 0 && val_size) {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  @46  		err = spmi_register_zero_write(context, *data);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   47  		if (err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12   48  			goto err_out;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   49  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   50  		data++;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   51  		addr++;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   52  		val_size--;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   53  	}
c9afbb05a9ffbe Josh Cartwright 2014-02-12   54  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   55  	while (val_size) {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  @56  		err = spmi_register_write(context, addr, *data);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   57  		if (err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12   58  			goto err_out;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   59  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   60  		data++;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   61  		addr++;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   62  		val_size--;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   63  	}
c9afbb05a9ffbe Josh Cartwright 2014-02-12   64  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   65  err_out:
c9afbb05a9ffbe Josh Cartwright 2014-02-12   66  	return err;
c9afbb05a9ffbe Josh Cartwright 2014-02-12   67  }
c9afbb05a9ffbe Josh Cartwright 2014-02-12   68  
c9afbb05a9ffbe Josh Cartwright 2014-02-12   69  static int regmap_spmi_base_write(void *context, const void *data,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   70  				  size_t count)
c9afbb05a9ffbe Josh Cartwright 2014-02-12   71  {
c9afbb05a9ffbe Josh Cartwright 2014-02-12   72  	BUG_ON(count < 1);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   73  	return regmap_spmi_base_gather_write(context, data, 1, data + 1,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   74  					     count - 1);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   75  }
c9afbb05a9ffbe Josh Cartwright 2014-02-12   76  
9c2e5cb38da220 Julia Lawall    2017-08-11   77  static const struct regmap_bus regmap_spmi_base = {
c9afbb05a9ffbe Josh Cartwright 2014-02-12   78  	.read				= regmap_spmi_base_read,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   79  	.write				= regmap_spmi_base_write,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   80  	.gather_write			= regmap_spmi_base_gather_write,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   81  	.reg_format_endian_default	= REGMAP_ENDIAN_NATIVE,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   82  	.val_format_endian_default	= REGMAP_ENDIAN_NATIVE,
c9afbb05a9ffbe Josh Cartwright 2014-02-12   83  };
c9afbb05a9ffbe Josh Cartwright 2014-02-12   84  
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   85  struct regmap *__regmap_init_spmi_base(struct spmi_device *sdev,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   86  				       const struct regmap_config *config,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   87  				       struct lock_class_key *lock_key,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   88  				       const char *lock_name)
c9afbb05a9ffbe Josh Cartwright 2014-02-12   89  {
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   90  	return __regmap_init(&sdev->dev, &regmap_spmi_base, sdev, config,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   91  			     lock_key, lock_name);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   92  }
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   93  EXPORT_SYMBOL_GPL(__regmap_init_spmi_base);
c9afbb05a9ffbe Josh Cartwright 2014-02-12   94  
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   95  struct regmap *__devm_regmap_init_spmi_base(struct spmi_device *sdev,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   96  					    const struct regmap_config *config,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   97  					    struct lock_class_key *lock_key,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08   98  					    const char *lock_name)
c9afbb05a9ffbe Josh Cartwright 2014-02-12   99  {
3cfe7a74d42b7e Nicolas Boichat 2015-07-08  100  	return __devm_regmap_init(&sdev->dev, &regmap_spmi_base, sdev, config,
3cfe7a74d42b7e Nicolas Boichat 2015-07-08  101  				  lock_key, lock_name);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  102  }
3cfe7a74d42b7e Nicolas Boichat 2015-07-08  103  EXPORT_SYMBOL_GPL(__devm_regmap_init_spmi_base);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  104  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  105  static int regmap_spmi_ext_read(void *context,
c9afbb05a9ffbe Josh Cartwright 2014-02-12  106  				const void *reg, size_t reg_size,
c9afbb05a9ffbe Josh Cartwright 2014-02-12  107  				void *val, size_t val_size)
c9afbb05a9ffbe Josh Cartwright 2014-02-12  108  {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  109  	int err = 0;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  110  	size_t len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  111  	u16 addr;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  112  
a01779f89fc8a2 Josh Cartwright 2013-10-28  113  	BUG_ON(reg_size != 2);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  114  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  115  	addr = *(u16 *)reg;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  116  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  117  	/*
c9afbb05a9ffbe Josh Cartwright 2014-02-12  118  	 * Split accesses into two to take advantage of the more
c9afbb05a9ffbe Josh Cartwright 2014-02-12  119  	 * bandwidth-efficient 'Extended Register Read' command when possible
c9afbb05a9ffbe Josh Cartwright 2014-02-12  120  	 */
c9afbb05a9ffbe Josh Cartwright 2014-02-12  121  	while (addr <= 0xFF && val_size) {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  122  		len = min_t(size_t, val_size, 16);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  123  
c9afbb05a9ffbe Josh Cartwright 2014-02-12 @124  		err = spmi_ext_register_read(context, addr, val, len);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  125  		if (err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12  126  			goto err_out;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  127  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  128  		addr += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  129  		val += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  130  		val_size -= len;
a01779f89fc8a2 Josh Cartwright 2013-10-28  131  	}
a01779f89fc8a2 Josh Cartwright 2013-10-28  132  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  133  	while (val_size) {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  134  		len = min_t(size_t, val_size, 8);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  135  
dec8e8f6e6504a Jack Pham       2016-04-14 @136  		err = spmi_ext_register_readl(context, addr, val, len);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  137  		if (err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12  138  			goto err_out;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  139  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  140  		addr += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  141  		val += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  142  		val_size -= len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  143  	}
c9afbb05a9ffbe Josh Cartwright 2014-02-12  144  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  145  err_out:
c9afbb05a9ffbe Josh Cartwright 2014-02-12  146  	return err;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  147  }
c9afbb05a9ffbe Josh Cartwright 2014-02-12  148  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  149  static int regmap_spmi_ext_gather_write(void *context,
a01779f89fc8a2 Josh Cartwright 2013-10-28  150  					const void *reg, size_t reg_size,
a01779f89fc8a2 Josh Cartwright 2013-10-28  151  					const void *val, size_t val_size)
a01779f89fc8a2 Josh Cartwright 2013-10-28  152  {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  153  	int err = 0;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  154  	size_t len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  155  	u16 addr;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  156  
a01779f89fc8a2 Josh Cartwright 2013-10-28  157  	BUG_ON(reg_size != 2);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  158  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  159  	addr = *(u16 *)reg;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  160  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  161  	while (addr <= 0xFF && val_size) {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  162  		len = min_t(size_t, val_size, 16);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  163  
c9afbb05a9ffbe Josh Cartwright 2014-02-12 @164  		err = spmi_ext_register_write(context, addr, val, len);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  165  		if (err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12  166  			goto err_out;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  167  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  168  		addr += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  169  		val += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  170  		val_size -= len;
a01779f89fc8a2 Josh Cartwright 2013-10-28  171  	}
a01779f89fc8a2 Josh Cartwright 2013-10-28  172  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  173  	while (val_size) {
c9afbb05a9ffbe Josh Cartwright 2014-02-12  174  		len = min_t(size_t, val_size, 8);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  175  
c9afbb05a9ffbe Josh Cartwright 2014-02-12 @176  		err = spmi_ext_register_writel(context, addr, val, len);
c9afbb05a9ffbe Josh Cartwright 2014-02-12  177  		if (err)
c9afbb05a9ffbe Josh Cartwright 2014-02-12  178  			goto err_out;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  179  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  180  		addr += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  181  		val += len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  182  		val_size -= len;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  183  	}
c9afbb05a9ffbe Josh Cartwright 2014-02-12  184  
c9afbb05a9ffbe Josh Cartwright 2014-02-12  185  err_out:
c9afbb05a9ffbe Josh Cartwright 2014-02-12  186  	return err;
c9afbb05a9ffbe Josh Cartwright 2014-02-12  187  }
c9afbb05a9ffbe Josh Cartwright 2014-02-12  188  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

