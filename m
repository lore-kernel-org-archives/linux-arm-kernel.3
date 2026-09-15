Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1CCC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ji8lj9ap2FkQ0aOqFkgG/1taSSW0Fl1G68BbaAjCS0=; b=tzRa/B6wiJpSDXmFyXvXeQFqiX
	qZy3W3tXP/HueZ0RCKDDuy3/E9ZUtbUwY8aXWn2a6MF64Qt6MjN3fbXIQDvvjeN4EOpuEoy3veVB3
	8WzgroLC3P5wd+N3g9C9CQFctjJSNped9F7y/xOHthxLu0pVYYD1G0RdjQIOJEjK9Sg1OK/7UD44X
	nbKp+zByRxQM3Oc4w0phfPp1kId3ESrIYjHayBX9+hIH9MNqCzsFUn9eghVzt7yxlfeajadcRf9VO
	L+dHdL5y7Cs1cg+NeptljkcLbM47kJZleClZneagE4gXos3iwtU6oQlJQOC4A+X5XR45K/8OSFxrx
	yGZZCWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b1i-00000007yvI-0cuu;
	Tue, 15 Sep 2026 21:49:18 +0000
Received: from mgamail.intel.com ([192.198.163.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6b1e-00000007yur-3nwz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 21:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789508955; x=1821044955;
  h=date:from:to:cc:subject:message-id;
  bh=4Mh5YWpLGrRiK7zAXkaXbQmVg/ZurD93+09+Y8jTx+M=;
  b=IPGcxdUHrRSjhlqJ1XINuHEUvC2TGV5w5tnWB+xpkVm84+UvNbFUjWkr
   fRzTOy+FfMdLx1Tus6T7Xvpw7Fd7jp2EYcoGB6kRB8ospF6W+9zukXcJn
   FsFtU+zfCLEpLlNXxJrlibUTUR6PPdsTmH9ls1GL9hEx1oimhanm+OYDN
   nFXD0kPNk6FVCgtZesqnu/JGeudZ/avYZq0TicpYBZdl2qUCwaZSZW+ZR
   RwSs6dOoYQ5z8ja4OpPazj8plEwnqEpE89iFareFCu2TuCAPV4VjdVrra
   Mu4UgPWAn1cduJ+hD7A9Z4qF/2L3Kl6VWqgS1btmptpk2OrJGWlBkKH+S
   A==;
X-CSE-ConnectionGUID: d/cs9debTcaox5MQTGqtnQ==
X-CSE-MsgGUID: MVNwR+uQRrqqhzxyDn8vdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="395297"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="395297"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 14:49:14 -0700
X-CSE-ConnectionGUID: hLb2xrbBQ161CTWIOpZ+xg==
X-CSE-MsgGUID: 2z5BNDMlQAerbuvLzwFLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266930764"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Sep 2026 14:49:12 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6b1Z-00000000577-3KBN;
	Tue, 15 Sep 2026 21:49:09 +0000
Date: Wed, 16 Sep 2026 05:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Subject: [kvmarm:next 31/83]
 arch/arm64/kvm/vgic/vgic-irs-v5.c:1016:8: warning: variable 'addr' set but
 not used
Message-ID: <202609160555.JW0KTj94-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_144914_989699_3983C9C2 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
head:   8476ce1f1e949a4eae0c0b8f06cf6ab51a3edfd0
commit: 71091136d1452b6125579b210d29efec3e79681a [31/83] KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region
config: arm64-randconfig-003-20260916 (https://download.01.org/0day-ci/archive/20260916/202609160555.JW0KTj94-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260916/202609160555.JW0KTj94-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609160555.JW0KTj94-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-irs-v5.c: In function 'vgic_v5_has_attr_regs':
>> arch/arm64/kvm/vgic/vgic-irs-v5.c:1016:8: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     gpa_t addr, offset;
           ^~~~


vim +/addr +1016 arch/arm64/kvm/vgic/vgic-irs-v5.c

  1010	
  1011	int vgic_v5_has_attr_regs(struct kvm_device *dev, struct kvm_device_attr *attr)
  1012	{
  1013		const struct vgic_register_region *region;
  1014		struct vgic_reg_attr reg_attr;
  1015		struct kvm_vcpu *vcpu;
> 1016		gpa_t addr, offset;
  1017		int ret, align;
  1018	
  1019		ret = vgic_v5_parse_attr(dev, attr, &reg_attr);
  1020		if (ret)
  1021			return ret;
  1022	
  1023		vcpu = reg_attr.vcpu;
  1024		addr = reg_attr.addr;
  1025	
  1026		if (attr->group == KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS)
  1027			return vgic_v5_has_cpu_sysregs_attr(vcpu, attr);
  1028	
  1029		offset = attr->attr;
  1030	
  1031		region = vgic_find_mmio_region(vgic_v5_irs_registers,
  1032					       ARRAY_SIZE(vgic_v5_irs_registers),
  1033					       offset);
  1034		if (!region)
  1035			return -ENXIO;
  1036	
  1037		align = region->access_flags & VGIC_ACCESS_64bit ? 0x7 : 0x3;
  1038		if (offset & align)
  1039			return -EINVAL;
  1040	
  1041		return 0;
  1042	}
  1043	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

