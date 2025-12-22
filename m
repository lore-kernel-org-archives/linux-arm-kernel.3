Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AAFE69165
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3mVBOpRTkB+1HUFOm4pLanQN4DIy/Opg3wflayBF/Vc=; b=Jr4KWdqxRwIdUg3Umlw2XUsNMq
	CpMmOYJFbftMOK2/MQcTiN7uXFvkhGZe105KWnJxb5eypMOxQi0SqhdWoVnfGeICY6/E/eZ7L0fQJ
	ZNXNT5B7Eo82gYtycQQpwk8r0EqSP+CrnUdt/vVXKfH0JBT2Jh4NyS3NFyoM637H4S8NJ7Nm2WYtR
	Vsto5IsVsMIQ74Tfyj5DM+RcS6Cy70WKONrU+ArXGZeG3Cymk7bEsxu8F1BKGhFM1RlDjd7nMh8D8
	/JiFpBWFAZJshXdNc4qSTUY11GUFHDRlPVBBE/xwgeN4eQibeqeXji2e2tmVSObUZlWCwQpohs5BX
	c463rtCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXm0A-0000000E73j-0HUs;
	Mon, 22 Dec 2025 19:55:30 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXm07-0000000E72x-0ISi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 19:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766433327; x=1797969327;
  h=date:from:to:cc:subject:message-id;
  bh=2F/VJzaUifzPWgFf8CsuOUNTjqEWrPAZZcR4Vb4Lif4=;
  b=DHPoS110LTGpKAouuM5l+F998YucFMgGzrOxBkfmJ3eCCyeHFXQki1AW
   MuxOhb7Q8bTSjKePAoItQCdSvWohI0ScTybS6u1+pkI8QWiWAWVEoVy1v
   ChTRA4eRtB8RTorxbSnrzYHGYNTHQk5gPbjvcK5t++3tkBvXbGC6+3GXq
   Ho3oLmfngE1sGajIHJac4dB2ng9ghImaHZbu4O03IbgQcgZ2ZTZ6IRMOZ
   PcsMIHkDvoL3x/agCge0CK4tKH4QZgfV+xSDsh4yAxgSYHvdG8csdxypl
   Rlp2+uXra36Z1yVx1R7YXM1ixx6J7UhBnjRKx0i4kDkMziBoLNhLeYt9n
   A==;
X-CSE-ConnectionGUID: RcLosiWNQuC0wCsTLv9NeQ==
X-CSE-MsgGUID: wNIYNi74Rbq1uDpmhqF1bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="71920596"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="71920596"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 11:55:22 -0800
X-CSE-ConnectionGUID: oyFPog87T1u+LRlFLojpFg==
X-CSE-MsgGUID: 0urkKI1qRBqkY3Qw4KxrVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="199589774"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 11:55:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXlzy-0000000013l-3XVe;
	Mon, 22 Dec 2025 19:55:18 +0000
Date: Tue, 23 Dec 2025 03:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 79/82]
 arch/arm64/kvm/vgic/vgic-kvm-device.c:814:15: warning: variable 'addr' set
 but not used
Message-ID: <202512230356.D7sdAEag-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_115527_191293_2ECA5094 
X-CRM114-Status: UNSURE (   9.01  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 68c9d49d6ae8b462ac80a902806969a43ac20de0 [79/82] KVM: arm64: gic-v5: Plumb in has/set/get for sysregs & IRS
config: arm64-randconfig-003-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230356.D7sdAEag-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230356.D7sdAEag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230356.D7sdAEag-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-kvm-device.c: In function 'vgic_v5_attr_regs_access':
>> arch/arm64/kvm/vgic/vgic-kvm-device.c:814:15: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     814 |         gpa_t addr;
         |               ^~~~
--
   arch/arm64/kvm/vgic/vgic-irs-v5.c: In function 'vgic_v5_has_attr_regs':
>> arch/arm64/kvm/vgic/vgic-irs-v5.c:988:15: warning: variable 'addr' set but not used [-Wunused-but-set-variable]
     988 |         gpa_t addr, offset;
         |               ^~~~


vim +/addr +814 arch/arm64/kvm/vgic/vgic-kvm-device.c

   801	
   802	/*
   803	 * vgic_v5_attr_regs_access - allows user space to access VGIC v5 state
   804	 *
   805	 * @dev:      kvm device handle
   806	 * @attr:     kvm device attribute
   807	 * @is_write: true if userspace is writing a register
   808	 */
   809	static int vgic_v5_attr_regs_access(struct kvm_device *dev,
   810					    struct kvm_device_attr *attr,
   811					    bool is_write)
   812	{
   813		struct vgic_reg_attr reg_attr;
 > 814		gpa_t addr;
   815		struct kvm_vcpu *vcpu;
   816		bool uaccess;
   817		u64 val;
   818		int ret;
   819	
   820		ret = vgic_v5_parse_attr(dev, attr, &reg_attr);
   821		if (ret)
   822			return ret;
   823	
   824		vcpu = reg_attr.vcpu;
   825		addr = reg_attr.addr;
   826	
   827		switch (attr->group) {
   828		case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
   829			/* Sysregs uaccess is performed by the sysreg handling code */
   830			uaccess = false;
   831			break;
   832		case KVM_DEV_ARM_VGIC_GRP_IRS_REGS: fallthrough;
   833		default:
   834			uaccess = true;
   835		}
   836	
   837		if (uaccess && is_write) {
   838			u64 __user *uaddr = (u64 __user *)(unsigned long)attr->addr;
   839			if (get_user(val, uaddr))
   840				return -EFAULT;
   841		}
   842	
   843		mutex_lock(&dev->kvm->lock);
   844	
   845		if (kvm_trylock_all_vcpus(dev->kvm)) {
   846			mutex_unlock(&dev->kvm->lock);
   847			return -EBUSY;
   848		}
   849	
   850		mutex_lock(&dev->kvm->arch.config_lock);
   851	
   852		if (!(vgic_initialized(dev->kvm) || v5_reg_allowed_pre_init(attr))) {
   853			ret = -EBUSY;
   854			goto out;
   855		}
   856	
   857		switch (attr->group) {
   858		case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
   859			ret = vgic_v5_cpu_sysregs_uaccess(vcpu, attr, is_write);
   860			break;
   861		case KVM_DEV_ARM_VGIC_GRP_IRS_REGS:
   862			ret = vgic_v5_irs_attr_regs_access(dev, attr, &val, is_write);
   863			break;
   864		default:
   865			ret = -EINVAL;
   866			break;
   867		}
   868	
   869	out:
   870		mutex_unlock(&dev->kvm->arch.config_lock);
   871		kvm_unlock_all_vcpus(dev->kvm);
   872		mutex_unlock(&dev->kvm->lock);
   873	
   874		if (!ret && uaccess && !is_write) {
   875			u64 __user *uaddr = (u64 __user *)(unsigned long)attr->addr;
   876			ret = put_user(val, uaddr);
   877		}
   878	
   879		return ret;
   880	}
   881	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

