Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3350C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 14:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ollXESlfLkIw+uN5g6J/HukBe6p0ozTGK2V3fCr6bus=; b=MUR1Hlxe+bNJS5COcJ62foPIFD
	//U8qvaoEOdONvj/33bgXHMp0Kl3LbU+Ee0p3cLSpAgAUu/wZRz32Ln2lxDB2PwDqnOc0I0eG8wff
	9NakJ3Fdfz0AigrB4+HKw629LNyr4FZykEo51ZBkMt6kqSL9DafwBdHVzUG1Y5MYjf2CSfz1m6Mg4
	l8GODv/SSpjII/3kWZEKQRzU+tvT1Go+/weEJ68CGfi/p2m0VdAnDKq/sRpFBp6IMl2BdgncS3Kxq
	5lz/uyAwnpJiJWM/5nQkdOt7PpmOeHEBGe4iTzbiT9kvAaXDBo4ffOZIeVQF6yf83ifJNHkxiYDaE
	EJ/mEOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WXe-00000007TvB-3iIJ;
	Wed, 09 Apr 2025 14:36:38 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Vjp-00000007L6I-1PEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 13:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744206309; x=1775742309;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XRXZVaaIKpLxs1YQiTVdMowxNrf5xQjhz6daXuKTH7o=;
  b=JWmTSkYRNN2pCg1wXqV/E/wDiOvJ+QX2mpD2SnRHwYBbcfgsn58xyv/k
   1RrOsrrKRqmpixl/ODQHASpipEOPhOP0ROybk4k8agyPYrhE0jjqEaBFe
   9DBwIjFTbLSibErbP3mlXNHpoDt1w3G7BmFKgLKHdg1Aw2BbQWRvB7C9P
   pFV4nAB+zN4a7C7pljGfIvocqa1T5OWXvCTWVb8pqRQhGRv/POYlIBhTd
   QWkNGmec3tv7UhsZ0TyMonWD3oxhuCSjT1rRBB8ssb20WOqcSHg5wrwLp
   SGc9mNvKeFRxu9XGRvTJlhBwZhKeymFkWOSmLlASlnzY8W3bOjWWV1A/7
   w==;
X-CSE-ConnectionGUID: 9sohL9igTLybO2JMCYCJmQ==
X-CSE-MsgGUID: U48zdUShSLmhfpTt3qJF9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56316992"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56316992"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 06:45:05 -0700
X-CSE-ConnectionGUID: Q7HdWu6oSqycABrrsRjOzQ==
X-CSE-MsgGUID: Iwd85F9iTKGgugmgI/sJBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133463845"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 06:45:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2Vjf-0008uF-10;
	Wed, 09 Apr 2025 13:44:59 +0000
Date: Wed, 9 Apr 2025 21:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH 24/24] arm64: Kconfig: Enable GICv5
Message-ID: <202504092127.YaPW3UWk-lkp@intel.com>
References: <20250408-gicv5-host-v1-24-1f26db465f8d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gicv5-host-v1-24-1f26db465f8d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_064509_386030_416795F0 
X-CRM114-Status: GOOD (  11.34  )
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

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Pieralisi/Documentation-devicetree-bindings-Add-GICv5-DT-bindings/20250408-190630
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250408-gicv5-host-v1-24-1f26db465f8d%40kernel.org
patch subject: [PATCH 24/24] arm64: Kconfig: Enable GICv5
config: arm64-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504092127.YaPW3UWk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504092127.YaPW3UWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504092127.YaPW3UWk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-gic-v5-iwb.c:298:3: error: cannot jump from this goto statement to its label
     298 |                 goto out_free;
         |                 ^
   drivers/irqchip/irq-gic-v5-iwb.c:300:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     300 |         guard(mutex)(&its->dev_alloc_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:82:1: note: expanded from here
      82 | __UNIQUE_ID_guard576
         | ^
   drivers/irqchip/irq-gic-v5-iwb.c:288:3: error: cannot jump from this goto statement to its label
     288 |                 goto out_free;
         |                 ^
   drivers/irqchip/irq-gic-v5-iwb.c:300:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     300 |         guard(mutex)(&its->dev_alloc_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:82:1: note: expanded from here
      82 | __UNIQUE_ID_guard576
         | ^
   2 errors generated.


vim +298 drivers/irqchip/irq-gic-v5-iwb.c

6b60a5125729caf Lorenzo Pieralisi 2025-04-08  247  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  248  static struct gicv5_iwb_chip_data *
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  249  __init gicv5_iwb_init_bases(void __iomem *iwb_base,
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  250  			     struct fwnode_handle *handle,
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  251  			     struct irq_domain *parent_domain, u32 device_id)
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  252  {
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  253  	u32 nr_wires, idr0, cr0;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  254  	struct gicv5_iwb_chip_data *iwb_node;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  255  	struct msi_domain_info *msi_info;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  256  	struct gicv5_its_chip_data *its;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  257  	struct gicv5_its_dev *its_dev;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  258  	int ret;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  259  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  260  	msi_info = msi_get_domain_info(parent_domain);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  261  	its = msi_info->data;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  262  	if (!its) {
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  263  		pr_warn("IWB %pOF can't find parent ITS, bailing\n",
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  264  			to_of_node(handle));
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  265  		return ERR_PTR(-ENODEV);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  266  	}
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  267  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  268  	iwb_node = kzalloc(sizeof(*iwb_node), GFP_KERNEL);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  269  	if (!iwb_node)
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  270  		return ERR_PTR(-ENOMEM);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  271  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  272  	iwb_node->iwb_base = iwb_base;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  273  	iwb_node->device_id = device_id;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  274  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  275  	idr0 = iwb_readl(iwb_node, GICV5_IWB_IDR0);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  276  	nr_wires = (FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1) * 32;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  277  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  278  	iwb_node->domain = irq_domain_create_hierarchy(parent_domain, 0,
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  279  			   nr_wires, handle, &gicv5_iwb_irq_domain_ops,
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  280  			   iwb_node);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  281  	irq_domain_update_bus_token(iwb_node->domain, DOMAIN_BUS_WIRED);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  282  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  283  	cr0 = iwb_readl(iwb_node, GICV5_IWB_CR0);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  284  	if (!FIELD_GET(GICV5_IWB_CR0_IWBEN, cr0)) {
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  285  		pr_err("IWB %s must be enabled in firmware\n",
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  286  		       fwnode_get_name(handle));
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  287  		ret = -EINVAL;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  288  		goto out_free;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  289  	}
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  290  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  291  	iwb_node->nr_regs = FIELD_GET(GICV5_IWB_IDR0_IW_RANGE, idr0) + 1;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  292  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  293  	for (unsigned int n = 0; n < iwb_node->nr_regs; n++)
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  294  		iwb_writel(iwb_node, 0, GICV5_IWB_WENABLER + (sizeof(u32) * n));
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  295  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  296  	ret = gicv5_iwb_wait_for_wenabler(iwb_node);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  297  	if (ret)
6b60a5125729caf Lorenzo Pieralisi 2025-04-08 @298  		goto out_free;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  299  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  300  	guard(mutex)(&its->dev_alloc_lock);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  301  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  302  	its_dev = gicv5_its_alloc_device(its, roundup_pow_of_two(nr_wires),
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  303  					 device_id, true);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  304  	if (IS_ERR(its_dev)) {
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  305  		ret = -ENODEV;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  306  		goto out_free;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  307  	}
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  308  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  309  	return iwb_node;
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  310  out_free:
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  311  	irq_domain_remove(iwb_node->domain);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  312  	kfree(iwb_node);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  313  
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  314  	return ERR_PTR(ret);
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  315  }
6b60a5125729caf Lorenzo Pieralisi 2025-04-08  316  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

