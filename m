Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041F9E63FE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=752JaVkU2L6o0aL1SHQviRopiwp7hO4CqcFVcd7m20U=; b=vJ8IfN7HFaFJcWNUfrqxpAiFxD
	UyLGOCvFRPqoUTlHxGA9RMj9ftQ4+jbRx+KSel2TIfBqXK3JAk4PormuRQ0cq1TnVUCHzZQF66g96
	CDCxVKmY/LHSwN7ANpUyFTZNBB9rg5sGf3TSdDeSI6zuWKKMJTq0+7vm994fBSDp7F1shpGRj2qBt
	wbcWZVZUffT14VBNLLsPS+oMjwjgFEMxoSUvd3Mociei6Un3K9kxVlNIBLXXc45uhhbw4Jc0wB/l1
	swTFKorPKb7bdQc4/QreY9RmqQiqNGPVTfEkrHJZRiKNuev36b2N2BswBsC8kPui77bnDJRyhMsYq
	ejhYWHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95VA-00000003ejc-1DzV;
	Sat, 04 Apr 2026 18:13:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w95V7-00000003ejH-0Hrz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 18:13:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A4F642DC5;
	Sat,  4 Apr 2026 18:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F32CC19424;
	Sat,  4 Apr 2026 18:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775326416;
	bh=wjBG2dDvNOcl73t5Dsrip8H0/qPbPfDx7nYSPfXnK9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2pO4bdXXFL1yc84LWPwy/iQoPw+SE+ISHxp+wjlENH+6kkZcAGH7OWOaXKJVY+QS
	 TMtj8hNKN9E/r/jOhU1ZRCwFGeC6xnxGAR80fbbJUUWI1JRMWSGlNJMaBsaW+bcdPk
	 7q1WL3opiHRdmO8kKVQG5Fw3MsbXpxu79A2wNOcgaamUMOb1eM+nNq7EuBDj1SRBb1
	 TS2ni3llMnn4kMlp4pgZKQcUC/jzbw8YsvtTSBTK7iRjCscWS/9VOtUOqnFUMsYl8X
	 uwgEIo6k8mEpYIdphbHNKEPQHn4Urwq6oRrwjmzVfateMMrzrNkMSqU2dk9NvEtd+N
	 evARPDS2MV6LA==
Date: Sat, 4 Apr 2026 20:13:30 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
Message-ID: <20260404181330.GA3987102@ax162>
References: <20260401170017.369529-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401170017.369529-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_111341_172975_7C7CEF2D 
X-CRM114-Status: GOOD (  19.79  )
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

Hi Marc,

On Wed, Apr 01, 2026 at 06:00:17PM +0100, Marc Zyngier wrote:
> As we are missing ID_AA64PFR2_EL1.GCIE from the kernel feature set,
> userspace cannot write ID_AA64PFR2_EL1 with GCIE set, even if we are
> on a GICv5 host.
> 
> Add the required field description.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kernel/cpufeature.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 32c2dbcc0c641..5bca6e064ca72 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -327,6 +327,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
>  	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTESTOREONLY_SHIFT, 4, ID_AA64PFR2_EL1_MTESTOREONLY_NI),
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_GCIE_SHIFT, 4, ID_AA64PFR2_EL1_GCIE_NI),
>  	ARM64_FTR_END,
>  };
>  
> -- 
> 2.47.3
> 

After this change in -next as commit 899ff451fcee ("KVM: arm64:
Advertise ID_AA64PFR2_EL1.GCIE"), I am seeing a warning on boot in my
simple QEMU boot tests.

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- mrproper virtconfig Image.gz

  $ curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20241120-044434/arm64-rootfs.cpio.zst | zstd -d >rootfs.cpio

  $ qemu-system-aarch64 \
      -display none \
      -nodefaults \
      -machine virt,gic-version=max \
      -append 'console=ttyAMA0 earlycon' \
      -kernel arch/arm64/boot/Image.gz \
      -initrd rootfs.cpio \
      -cpu host \
      -enable-kvm \
      -m 1G \
      -smp 8 \
      -serial mon:stdio
  [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x413fd0c1]
  [    0.000000] Linux version 7.0.0-rc4-00058-g899ff451fcee (nathan@aadp) (aarch64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP PREEMPT Sat Apr  4 06:55:05 MST 2026
  ...
  [    0.000000] ------------[ cut here ]------------
  [    0.000000] SYS_ID_AA64PFR2_EL1 has feature overlap at shift 12
  [    0.000000] WARNING: arch/arm64/kernel/cpufeature.c:986 at init_cpu_features+0xbc/0x344, CPU#0: swapper/0
  [    0.000000] Modules linked in:
  [    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.0.0-rc4-00058-g899ff451fcee #1 PREEMPT
  [    0.000000] Hardware name: linux,dummy-virt (DT)
  [    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [    0.000000] pc : init_cpu_features+0xbc/0x344
  [    0.000000] lr : init_cpu_features+0xbc/0x344
  [    0.000000] sp : ffffcd0982373db0
  [    0.000000] x29: ffffcd0982373db0 x28: 0000000000000010 x27: ffffcd0981c63878
  [    0.000000] x26: 0000000000000018 x25: ffffcd0982013f38 x24: ffffcd0981c69068
  [    0.000000] x23: ffffcd0981c635f0 x22: ffffcd0982388640 x21: 0000000000000003
  [    0.000000] x20: 0000000000000017 x19: ffffcd09824c9308 x18: 000000000000000a
  [    0.000000] x17: 5d305b203837205d x16: 305b203737205d30 x15: 0000000000000000
  [    0.000000] x14: 0000000000000000 x13: 3231207466696873 x12: 2074612070616c72
  [    0.000000] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffcd0982396598
  [    0.000000] x8 : 0000000000057fa8 x7 : 000000000000002a x6 : ffffcd09823ee598
  [    0.000000] x5 : ffffcd09823ee598 x4 : 0000000000000000 x3 : 0000000000000000
  [    0.000000] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffcd09823852c0
  [    0.000000] Call trace:
  [    0.000000]  init_cpu_features+0xbc/0x344 (P)
  [    0.000000]  cpuinfo_store_boot_cpu+0x48/0x54
  [    0.000000]  smp_prepare_boot_cpu+0x28/0x38
  [    0.000000]  start_kernel+0x248/0x780
  [    0.000000]  __primary_switched+0x88/0x90
  [    0.000000] ---[ end trace 0000000000000000 ]---
  ...
  ```

Is this expected? I assume not, hence the report. If there is any
information I can provide or patches I can test, I am more than happy to
do so.

Cheers,
Nathan

# bad: [2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979] Add linux-next specific files for 20260403
# good: [d8a9a4b11a137909e306e50346148fc5c3b63f9d] Merge tag 'v7.0-rc6-smb3-client-fix' of git://git.samba.org/sfrench/cifs-2.6
git bisect start 'origin/master' 'origin/stable'
# bad: [dc9c72702de7e46679f8c2ab2175ab7070baa3ee] Merge branch 'main' of https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect bad dc9c72702de7e46679f8c2ab2175ab7070baa3ee
# bad: [d5ea83fae6558b2431b022781f6ccb74d241b2bb] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
git bisect bad d5ea83fae6558b2431b022781f6ccb74d241b2bb
# bad: [d16ebd2d0dc90f1561d0a44a828db2c9148ad5f4] Merge branch 'for-next/perf' of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
git bisect bad d16ebd2d0dc90f1561d0a44a828db2c9148ad5f4
# bad: [768784742008ccebbf3e88a26a6e9e6aad76dc8e] Merge branch 'timekeeping-next' of https://github.com/Rust-for-Linux/linux.git
git bisect bad 768784742008ccebbf3e88a26a6e9e6aad76dc8e
# good: [b671065be2bef906bb3e0c1bc7be4055e84ea1d3] Merge branch 'at91-fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
git bisect good b671065be2bef906bb3e0c1bc7be4055e84ea1d3
# bad: [bd1f7328e25426f08cafa8333293411788c7957b] Merge branch kvm-arm64/vgic-fixes-7.1 into kvmarm-master/next
git bisect bad bd1f7328e25426f08cafa8333293411788c7957b
# good: [1cd0bb0425594cea9baf862393a4ca9cc0c018a3] Merge branch kvm-arm64/pkvm-psci into kvmarm-master/next
git bisect good 1cd0bb0425594cea9baf862393a4ca9cc0c018a3
# good: [bc20692f528b2ac8226bafe5b1db9a1f8be96dbf] KVM: arm64: Don't hold 'vm_table_lock' across guest page reclaim
git bisect good bc20692f528b2ac8226bafe5b1db9a1f8be96dbf
# good: [adb70b3a8b31e9eb05f2ec3c76d85f9a7a8c8cbc] KVM: arm64: Directly expose mapping prot and kill kvm_s2_fault
git bisect good adb70b3a8b31e9eb05f2ec3c76d85f9a7a8c8cbc
# good: [be46a408f376df31762e8a9914dc6d082755e686] KVM: arm64: Correctly plumb ID_AA64PFR2_EL1 into pkvm idreg handling
git bisect good be46a408f376df31762e8a9914dc6d082755e686
# good: [33cdd7f8fa32c92317aa521bd6f407a3cba8474b] Merge branch kvm-arm64/spe-trbe-nvhe into kvmarm-master/next
git bisect good 33cdd7f8fa32c92317aa521bd6f407a3cba8474b
# good: [e54971a0468a8bc82b1976d5b010392d7cb689b9] Merge branch kvm-arm64/vgic-fixes-7.1 into kvmarm-master/next
git bisect good e54971a0468a8bc82b1976d5b010392d7cb689b9
# bad: [899ff451fcee1289f3f37d061da66c3e38748a69] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
git bisect bad 899ff451fcee1289f3f37d061da66c3e38748a69
# good: [9c1ac77ddfc90b6292ef63a4fa5ab6f9e4b29981] KVM: arm64: vgic-v5: Fold PPI state for all exposed PPIs
git bisect good 9c1ac77ddfc90b6292ef63a4fa5ab6f9e4b29981
# first bad commit: [899ff451fcee1289f3f37d061da66c3e38748a69] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE

