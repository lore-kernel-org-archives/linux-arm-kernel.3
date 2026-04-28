Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2A3FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ydZKgX3Q8J+vDny/jhS0Km8R0CYFhIzwIFceSRPdgc=; b=3EMLwOvxW/ryaprH/a4U/8I3OC
	2LMsRiX14smf8f8wWXjcv8O2BBrYG7F8qKpBvTEMeNg1V4EpV2bVp9eFC2a5ruaDD/bIcpqQzcQmt
	Lcyy3X+djs0fupKUlAj69OfJOM/NvwsBBfT6pqMw1ZlFRZvrzylS3Zsmcpa5ECmD2G52sMJKUFh+f
	BytZzpc1LfLaBVnLxxCehM38n1Sno5guJL2UF8me6A2R0e0KN6IIS0LXWUkkts9A3e2P5krGS1DK4
	NCVouzvmf9QQrH9ENWKvlc6RwC43RBkERjzeqNo4x1tVxmVRGPTNEw4NqKlun8LVoDfeFKT66gi/H
	N/Qyu2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkYh-00000001lUi-0z0g;
	Tue, 28 Apr 2026 15:41:11 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHkYe-00000001lUE-1Q9J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 15:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777390869; x=1808926869;
  h=date:from:to:cc:subject:message-id;
  bh=SwFktZyQnHaWOcGqiO3VSqadri33vwcKjGtfvdeWQSY=;
  b=TgfaKGUYWgp522M7b94HTMhLCS7WGuSSiOcYX74N9HRP2a/W/xB4ZOXg
   o/Bo25D3psV/CBV+DTNDjnRo56FzfzYxA3osvjzG5RcdWAgNvBbGdRWF/
   BHAOoVTWkxMsUVO8MeQVummRQ3rLn4XDWQWYYU63U/Wk4uhU3gTuFE0Fz
   /jtmmgbfGp3ym+KzXfK5kc+npi1euFTpx5odntMBHVHR5PXFwVkf5cN0c
   4IzwvrgrvU0TvN8Yt/kDwWsFh+qHdAq8qTENnTiYByQj4FX+/ETt4Moap
   vFMR+Ttzw4ocHANw5XrhFC3u/7Sxv7o42kuEbGdc/ph6rac7JiHZ0OWaX
   Q==;
X-CSE-ConnectionGUID: DAwil8ePQ+2qbWLLMGFS5A==
X-CSE-MsgGUID: I2Ix/GSGS5+ANe8l4aVItg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="88612996"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="88612996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 08:41:07 -0700
X-CSE-ConnectionGUID: Sq1ANrTfRJS5rJYA/fTpmA==
X-CSE-MsgGUID: UddEichmRIi9oYAy/OqSjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="272128778"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Apr 2026 08:41:04 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHkYY-000000009vA-1s8y;
	Tue, 28 Apr 2026 15:41:02 +0000
Date: Tue, 28 Apr 2026 23:40:40 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/no-lazy-vgic-init 22/26]
 include/kvm/arm_pmu.h:134:46: warning: no return statement in function
 returning non-void
Message-ID: <202604282305.uZdSNvk7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_084108_412832_7CECC289 
X-CRM114-Status: UNSURE (   9.31  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/no-lazy-vgic-init
head:   3bba2d1179c5198c5788cd387feeeba2070e7cd9
commit: 4c12b5742e18dbd00b0b59f3882478219d73b463 [22/26] KVM: arm64: Simplify userspace notification of interrupt state
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604282305.uZdSNvk7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604282305.uZdSNvk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282305.uZdSNvk7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
   include/kvm/arm_pmu.h: In function 'kvm_pmu_update_run':
>> include/kvm/arm_pmu.h:134:46: warning: no return statement in function returning non-void [-Wreturn-type]
     134 | static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
         |                                              ^~~~~~~~
--
   In file included from arch/arm64/include/asm/kvm_host.h:38,
                    from include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
   include/kvm/arm_pmu.h: In function 'kvm_pmu_update_run':
>> include/kvm/arm_pmu.h:134:46: warning: no return statement in function returning non-void [-Wreturn-type]
     134 | static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
         |                                              ^~~~~~~~


vim +134 include/kvm/arm_pmu.h

   106	
   107	#define kvm_arm_pmu_irq_initialized(v)	(false)
   108	static inline u64 kvm_pmu_get_counter_value(struct kvm_vcpu *vcpu,
   109						    u64 select_idx)
   110	{
   111		return 0;
   112	}
   113	static inline void kvm_pmu_set_counter_value(struct kvm_vcpu *vcpu,
   114						     u64 select_idx, u64 val) {}
   115	static inline void kvm_pmu_set_counter_value_user(struct kvm_vcpu *vcpu,
   116							  u64 select_idx, u64 val) {}
   117	static inline u64 kvm_pmu_implemented_counter_mask(struct kvm_vcpu *vcpu)
   118	{
   119		return 0;
   120	}
   121	static inline u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
   122	{
   123		return 0;
   124	}
   125	static inline void kvm_pmu_vcpu_init(struct kvm_vcpu *vcpu) {}
   126	static inline void kvm_pmu_vcpu_destroy(struct kvm_vcpu *vcpu) {}
   127	static inline void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val) {}
   128	static inline void kvm_pmu_flush_hwstate(struct kvm_vcpu *vcpu) {}
   129	static inline void kvm_pmu_sync_hwstate(struct kvm_vcpu *vcpu) {}
   130	static inline bool kvm_pmu_should_notify_user(struct kvm_vcpu *vcpu)
   131	{
   132		return false;
   133	}
 > 134	static inline bool kvm_pmu_update_run(struct kvm_vcpu *vcpu) {}
   135	static inline void kvm_pmu_software_increment(struct kvm_vcpu *vcpu, u64 val) {}
   136	static inline void kvm_pmu_handle_pmcr(struct kvm_vcpu *vcpu, u64 val) {}
   137	static inline void kvm_pmu_set_counter_event_type(struct kvm_vcpu *vcpu,
   138							  u64 data, u64 select_idx) {}
   139	static inline int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu,
   140						  struct kvm_device_attr *attr)
   141	{
   142		return -ENXIO;
   143	}
   144	static inline int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu,
   145						  struct kvm_device_attr *attr)
   146	{
   147		return -ENXIO;
   148	}
   149	static inline int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu,
   150						  struct kvm_device_attr *attr)
   151	{
   152		return -ENXIO;
   153	}
   154	static inline int kvm_arm_pmu_v3_enable(struct kvm_vcpu *vcpu)
   155	{
   156		return 0;
   157	}
   158	static inline u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
   159	{
   160		return 0;
   161	}
   162	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

