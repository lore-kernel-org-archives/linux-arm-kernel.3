Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73984E6F084
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvzCdP0HSo6CLidEPN/0n/NDcLHbMmPtB1W+JZKiqPU=; b=vMwf55HCLyNGgSghnUioee4IMf
	xPqz6xnmMDWJn+xk2fqniXhSdeRBoEZD9igvnwoJe7V5FfxToRfE/jOjRpP8CIW4ZELLaIDbz3TYd
	/lhdcYS9+Pygpcy4fQvk2JCPknlP+y12afVLSaBAa2DOxquRxc3VaQoflMbxkvc8B94foGq2OH33J
	UHRgvgpiyhyg7LWKjJK8lWBYMTuYY+W1eYcVZ1BZnSpg1S3cQWIb/Jw+t2Vk40BDVxm2Ogc0Ca/Gr
	czjAqfvQiGpg222zlA0FB0Rdiuq08r0xdcjgdCmD1ifDo8sNVHpQTteXFXIxPxlVb8LEJfpXiDnQv
	BXY53Iyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY1AD-0000000FLmc-0s83;
	Tue, 23 Dec 2025 12:06:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY11U-0000000FApk-48Zt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 23 Dec 2025 11:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=BvzCdP0HSo6CLidEPN/0n/NDcLHbMmPtB1W+JZKiqPU=; b=Qg4e5z1oNQAv0u19Fkg7kMkXAw
	ZqoqfarOJHTaPSksgBD+bO7jsqb61oUIfqDwvqN0GA40BBxMoPwuUp159WOvrtucIlsIGzp8RIVSz
	b/M77ARJ8Bt9NLo7U/du3ZP5+MOvos+meupFp1RomSJuo2wjaULWhWEIJdci36ryujNPYSkR+1sEx
	fU92CZeZyzZACWsog3Og1mrT4P6tummeoA2Ul6nPBuH1tUiA6dyFMgN9ju+VD2i1gEXKqFKYetcUi
	b3kgOwfBJDi7Q2BubApp56MZFJI7lNE4dSIyoaY7nbQjHGmPvI9L8wOyNN6qzRwsB34NSdkr2VlK/
	9d3qsZ1g==;
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY09y-0000000Gf83-20tS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 11:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BvzCdP0HSo6CLidEPN/0n/NDcLHbMmPtB1W+JZKiqPU=;
  b=OAW3LPcFA3BlxTdQUPEgVyV5Ih3XpL83awV98ff7FupPXtQGx77lVck0
   D5xiUL3KpYAyFOmDFmAT+acmiZdyD8wiS3k36NeWeIpL62nu7M5Jl2xTW
   I+ZX8J9wAvwNhLqKxEtvZEuTqcun1zwOAo+h+AnY5t7ABQp8uZ6ccIdDB
   c=;
X-CSE-ConnectionGUID: aufqR5CUSOWmNZQdOSMYxg==
X-CSE-MsgGUID: GqmQ1M4aStiyzHMhiIDuyQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,170,1763420400"; 
   d="scan'208";a="255712672"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 12:57:43 +0100
Date: Tue, 23 Dec 2025 12:57:43 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Sascha Bischoff <sascha.bischoff@arm.com>
cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 63/82] arch/arm64/kvm/vgic/vgic-kvm-device.c:187:3-9:
 preceding lock on line 111 (fwd)
Message-ID: <db3b9674-4fb1-3c5a-ad3-944949960b2@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_110234_755468_2E35156B 
X-CRM114-Status: UNSURE (   8.97  )
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

Please check whether an unlock is needed on line 187.

julia

---------- Forwarded message ----------
Date: Tue, 23 Dec 2025 19:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [arm-platforms:kvm-arm64/gicv5-full 63/82]
    arch/arm64/kvm/vgic/vgic-kvm-device.c:187:3-9: preceding lock on line 111

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 77646e062bb3fbc3f7a614ab5d1bc7f273748c61 [63/82] KVM: arm64: gic-v5: Register the IRS IODEV
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231907.IGXeZ6an-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512231907.IGXeZ6an-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-kvm-device.c:187:3-9: preceding lock on line 111

vim +187 arch/arm64/kvm/vgic/vgic-kvm-device.c

9f968c9266aa30 arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05   77
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   78  /**
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   79   * kvm_vgic_addr - set or get vgic VM base addresses
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   80   * @kvm:   pointer to the vm struct
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05   81   * @attr:  pointer to the attribute being retrieved/updated
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   82   * @write: if true set the address in the VM address space, if false read the
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   83   *          address
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   84   *
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   85   * Set or get the vgic base addresses for the distributor and the virtual CPU
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   86   * interface in the VM physical address space.  These addresses are properties
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   87   * of the emulated core/SoC and therefore user space initially knows this
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   88   * information.
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   89   * Check them for sanity (alignment, double assignment). We can't check for
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   90   * overlapping regions in case of a virtual GICv3 here, since we don't know
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   91   * the number of VCPUs yet, so we defer this check to map_resources().
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   92   */
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05   93  static int kvm_vgic_addr(struct kvm *kvm, struct kvm_device_attr *attr, bool write)
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   94  {
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05   95  	u64 __user *uaddr = (u64 __user *)attr->addr;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21   96  	struct vgic_dist *vgic = &kvm->arch.vgic;
c56a87da0a7fa1 arch/arm64/kvm/vgic/vgic-kvm-device.c Ricardo Koller        2021-10-04   97  	phys_addr_t *addr_ptr, alignment, size;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22   98  	u64 undef_value = VGIC_ADDR_UNDEF;
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05   99  	u64 addr;
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  100  	int r;
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  101
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  102  	/* Reading a redistributor region addr implies getting the index */
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  103  	if (write || attr->attr == KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION)
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  104  		if (get_user(addr, uaddr))
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  105  			return -EFAULT;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  106
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  107  	/*
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  108  	 * Since we can't hold config_lock while registering the redistributor
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  109  	 * iodevs, take the slots_lock immediately.
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  110  	 */
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18 @111  	mutex_lock(&kvm->slots_lock);
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  112  	switch (attr->attr) {
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  113  	case KVM_VGIC_V2_ADDR_TYPE_DIST:
72030536ebf5e5 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  114  		r = vgic_check_type(kvm, KVM_DEV_TYPE_ARM_VGIC_V2);
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  115  		addr_ptr = &vgic->vgic_dist_base;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  116  		alignment = SZ_4K;
c56a87da0a7fa1 arch/arm64/kvm/vgic/vgic-kvm-device.c Ricardo Koller        2021-10-04  117  		size = KVM_VGIC_V2_DIST_SIZE;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  118  		break;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  119  	case KVM_VGIC_V2_ADDR_TYPE_CPU:
72030536ebf5e5 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  120  		r = vgic_check_type(kvm, KVM_DEV_TYPE_ARM_VGIC_V2);
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  121  		addr_ptr = &vgic->vgic_cpu_base;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  122  		alignment = SZ_4K;
c56a87da0a7fa1 arch/arm64/kvm/vgic/vgic-kvm-device.c Ricardo Koller        2021-10-04  123  		size = KVM_VGIC_V2_CPU_SIZE;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  124  		break;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  125  	case KVM_VGIC_V3_ADDR_TYPE_DIST:
72030536ebf5e5 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  126  		r = vgic_check_type(kvm, KVM_DEV_TYPE_ARM_VGIC_V3);
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  127  		addr_ptr = &vgic->vgic_dist_base;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  128  		alignment = SZ_64K;
c56a87da0a7fa1 arch/arm64/kvm/vgic/vgic-kvm-device.c Ricardo Koller        2021-10-04  129  		size = KVM_VGIC_V3_DIST_SIZE;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  130  		break;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  131  	case KVM_VGIC_V3_ADDR_TYPE_REDIST: {
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  132  		struct vgic_redist_region *rdreg;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  133
72030536ebf5e5 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  134  		r = vgic_check_type(kvm, KVM_DEV_TYPE_ARM_VGIC_V3);
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  135  		if (r)
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  136  			break;
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  137  		if (write) {
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  138  			r = vgic_v3_set_redist_base(kvm, 0, addr, 0);
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  139  			goto out;
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  140  		}
94ac0835391efc arch/arm64/kvm/vgic/vgic-kvm-device.c Eric Auger            2021-04-12  141  		rdreg = list_first_entry_or_null(&vgic->rd_regions,
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  142  						 struct vgic_redist_region, list);
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  143  		if (!rdreg)
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  144  			addr_ptr = &undef_value;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  145  		else
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  146  			addr_ptr = &rdreg->base;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  147  		break;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  148  	}
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  149  	case KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION:
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  150  	{
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  151  		struct vgic_redist_region *rdreg;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  152  		u8 index;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  153
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  154  		r = vgic_check_type(kvm, KVM_DEV_TYPE_ARM_VGIC_V3);
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  155  		if (r)
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  156  			break;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  157
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  158  		index = addr & KVM_VGIC_V3_RDIST_INDEX_MASK;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  159
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  160  		if (write) {
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  161  			gpa_t base = addr & KVM_VGIC_V3_RDIST_BASE_MASK;
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  162  			u32 count = FIELD_GET(KVM_VGIC_V3_RDIST_COUNT_MASK, addr);
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  163  			u8 flags = FIELD_GET(KVM_VGIC_V3_RDIST_FLAGS_MASK, addr);
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  164
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  165  			if (!count || flags)
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  166  				r = -EINVAL;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  167  			else
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  168  				r = vgic_v3_set_redist_base(kvm, index,
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  169  							    base, count);
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  170  			goto out;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  171  		}
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  172
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  173  		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  174  		if (!rdreg) {
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  175  			r = -ENOENT;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  176  			goto out;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  177  		}
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  178
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  179  		addr = index;
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  180  		addr |= rdreg->base;
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  181  		addr |= (u64)rdreg->count << KVM_VGIC_V3_RDIST_COUNT_SHIFT;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  182  		goto out;
04c11093222579 virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2018-05-22  183  	}
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  184  	case KVM_VGIC_V5_ADDR_TYPE_IRS:
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  185  		r = vgic_check_type(kvm, KVM_DEV_TYPE_ARM_VGIC_V5);
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  186  		if (r)
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11 @187  			return r;
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  188  		addr_ptr = &vgic->vgic_v5_irs_data->vgic_v5_irs_base;
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  189  		alignment = SZ_64K;
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  190  		size = KVM_VGIC_V5_IRS_SIZE;
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  191  		get_user(addr, uaddr);
77646e062bb3fb arch/arm64/kvm/vgic/vgic-kvm-device.c Sascha Bischoff       2025-12-11  192  		break;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  193  	default:
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  194  		r = -ENODEV;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  195  	}
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  196
72030536ebf5e5 virt/kvm/arm/vgic/vgic-kvm-device.c   Christoffer Dall      2017-05-08  197  	if (r)
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  198  		goto out;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  199
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  200  	mutex_lock(&kvm->arch.config_lock);
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  201  	if (write) {
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  202  		r = vgic_check_iorange(kvm, *addr_ptr, addr, alignment, size);
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  203  		if (!r)
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  204  			*addr_ptr = addr;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  205  	} else {
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  206  		addr = *addr_ptr;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  207  	}
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  208  	mutex_unlock(&kvm->arch.config_lock);
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  209
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  210  out:
59112e9c390be5 arch/arm64/kvm/vgic/vgic-kvm-device.c Jean-Philippe Brucker 2023-05-18  211  	mutex_unlock(&kvm->slots_lock);
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  212
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  213  	if (!r && !write)
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  214  		r =  put_user(addr, uaddr);
4b85080f4e378f arch/arm64/kvm/vgic/vgic-kvm-device.c Marc Zyngier          2022-07-05  215
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  216  	return r;
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  217  }
e2c1f9abff83ee virt/kvm/arm/vgic/vgic-kvm-device.c   Eric Auger            2015-12-21  218

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

