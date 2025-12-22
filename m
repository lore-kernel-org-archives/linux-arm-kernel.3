Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78309E67810
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 18:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=54cDYhVLZTQmg67XefimqPrB68TEDWGqX3xVSGdbfcg=; b=zAx9p127hAFycd0qXnONC0K/SF
	aj5pLh/CtphV1Y4rjSBoBNWeeuRcmd52me4xH8sbBGgX5rXQ0qBrRfFxvb3nTkoFxZNpYvx2yc+ZT
	WZaWoskmnJ2UILzdNOwX29MEsZDT3/TlEODrY2wiOzzjA1PG9VIx3FwppyYWRu7V1hbfKsFZ85EfG
	LqgVI0t6uClPvPJDEpV7vDhofg/zQxvRNsccPEsXlYmcKh0PRnkk5Dm17wA6z3MrfMG3csW4To2bx
	F/A7CbIitce6dNs5bJg3S/JnlSIS8F3udu4/Ac1o1bxPwyCk+lQggqxulu7Otqu/Nn7pRtVv9ziV+
	QRo4qe+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkfW-0000000E4KP-17rt;
	Mon, 22 Dec 2025 18:30:06 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkfT-0000000E4Jz-0Rku
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 18:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766428203; x=1797964203;
  h=date:from:to:cc:subject:message-id;
  bh=IXyWRuiMr9qA1yl9TXWOW3DoyRAwFq/Bx6+HLVZcBf4=;
  b=gQtwrQQPhj1E2IiSKh1N1KP58am8736t07vsoxk+vcEGlbDfXNJJKEv2
   5zTfcKc3+etmevrERnWXG4TFQnk03zLZgXbQejbUGqAJ1H8Ct8pzb/KLd
   hNql7nqmBjsyQcTcUlXyqkC/kGMOokmQPjXTHWT/y/T1OoOem8+oCpLBA
   MtDzMKaYBuBGFNJfLxV5uIErZR64bdnw80RrMwIEbvMArMIiONviJTINy
   ZH2sjXoUnvufxWnrqSVWqSTYUwxLZI0/5u0iQjGaxXYCVUx8M528Lx4tQ
   J5OA1j5M5rQZbBU9bQ7gHUIXra/oCwK26sHx43k7CXdqdmhKQ2XMPBJU4
   Q==;
X-CSE-ConnectionGUID: fkUBVOxzS2iLfIV57zdQvg==
X-CSE-MsgGUID: NLn3+sIOT/mRnejkJQqReg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68178220"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68178220"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:29:59 -0800
X-CSE-ConnectionGUID: 3CQkKCnmSnGBvTxv3knFqQ==
X-CSE-MsgGUID: mhH7lhXnRI65HrlLWEl/Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="198825842"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 10:29:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkey-000000000yv-3SPl;
	Mon, 22 Dec 2025 18:29:35 +0000
Date: Tue, 23 Dec 2025 02:29:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 78/82]
 arch/arm64/kvm/vgic/vgic-v5-tables.c:1186:44: warning: variable 'host_l2sz'
 set but not used
Message-ID: <202512230249.PtF5RcJh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_103003_750136_B3D0B020 
X-CRM114-Status: UNSURE (   8.12  )
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
commit: ba5d2e0b287e57a009751d6a993a4b31206fd97b [78/82] KVM: arm64: gic-v5: Implement Save/Restore for ISTs
config: arm64-randconfig-003-20251222 (https://download.01.org/0day-ci/archive/20251223/202512230249.PtF5RcJh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230249.PtF5RcJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230249.PtF5RcJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-v5-tables.c: In function 'vgic_v5_save_spi_ist':
>> arch/arm64/kvm/vgic/vgic-v5-tables.c:1186:44: warning: variable 'host_l2sz' set but not used [-Wunused-but-set-variable]
    1186 |         unsigned host_id_bits, host_istsz, host_l2sz;
         |                                            ^~~~~~~~~
   arch/arm64/kvm/vgic/vgic-v5-tables.c: In function 'vgic_v5_restore_spi_ist':
   arch/arm64/kvm/vgic/vgic-v5-tables.c:1380:44: warning: variable 'host_l2sz' set but not used [-Wunused-but-set-variable]
    1380 |         unsigned host_id_bits, host_istsz, host_l2sz;
         |                                            ^~~~~~~~~


vim +/host_l2sz +1186 arch/arm64/kvm/vgic/vgic-v5-tables.c

  1179	
  1180	int vgic_v5_save_spi_ist(struct kvm *kvm, struct kvm_device_attr *attr)
  1181	{
  1182		u16 vm_id = vgic_v5_vm_id(kvm);
  1183		u32 __user *uaddr = (u32 __user *)(unsigned long)attr->addr;
  1184		int ret = 0;
  1185		__le32 h_iste;
> 1186		unsigned host_id_bits, host_istsz, host_l2sz;
  1187		volatile void *host_ist_base;
  1188		struct vmtl2_entry *vmte;
  1189		gicv5_vm_info *vmi;
  1190	
  1191		ret = vgic_v5_check_vm_id(vm_id);
  1192		if (ret)
  1193			return ret;
  1194	
  1195		vmi = xa_load(&vm_info, vm_id);
  1196		if (WARN_ON_ONCE(!vmi))
  1197			return -EINVAL;
  1198	
  1199		ret = vgic_v5_get_l2_vmte(vm_id, &vmte);
  1200		if (ret)
  1201			return ret;
  1202	
  1203		host_ist_base = vmi->h_spi_ist;
  1204		if (!host_ist_base && attr)
  1205			return -ENOENT;
  1206		else if (host_ist_base && !attr)
  1207			return -EINVAL;
  1208	
  1209		host_id_bits = FIELD_GET(GICV5_VMTEL2E_IST_ID_BITS, vmte->val[3]);
  1210		host_istsz = FIELD_GET(GICV5_VMTEL2E_IST_ISTSZ, vmte->val[3]);
  1211		host_l2sz = FIELD_GET(GICV5_VMTEL2E_IST_L2SZ, vmte->val[3]);
  1212	
  1213		for (int i = 0; i < BIT(host_id_bits); ++i) {
  1214			volatile void *h_iste_addr = host_ist_base + i * BIT(host_istsz + 2);
  1215			h_iste = *((__le32*)h_iste_addr);
  1216	
  1217			ret = put_user(h_iste, uaddr);
  1218			if (ret)
  1219				return ret;
  1220	
  1221			uaddr++;
  1222		}
  1223	
  1224		return ret;
  1225	}
  1226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

