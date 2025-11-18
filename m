Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEF6CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juH0/Fzf+TH3LVoLXnz8NGK09UW1tEgs/Nx4Vc1Lq5w=; b=SbHnISTVV6Wiy43+rRhWFUHF2+
	EnRupuO6vui7rARhQYlWWsxsoTRshB3V9JCqHckQNFIHH4MDp40SKRik5gj2m5H6hxAdiHuSR+4r7
	qmphUVaEFm8J+CfNNJDHlDlMFC4M0DAz2Wi/WLQxEDTgLbwCyEHalX1AZCi12hMhzLHrafzp976oF
	aVS/xiC9r6IkIWIzWGIwLrlYKWMB29QTsGPTIxIgKcMFQIdR01XIwnBPvOlzUIlMTAi7zRpBUJKOi
	+XITNRtb8Z8eynnH5tMybygIwtK3WweI0q0Tnf0SQGp5uW0Om8sY1sLrGgwRTVbhKydN4f/ME94ej
	wVEd7QuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOle-00000000lWj-2rlc;
	Tue, 18 Nov 2025 16:41:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOld-00000000lWU-34XI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86C4C60B51;
	Tue, 18 Nov 2025 16:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35276C4CEF1;
	Tue, 18 Nov 2025 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484080;
	bh=I3+KsjXxz49EfV4wkRep87vIKoty++l0n6HSODxRlxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obWE1jW+GenhAGdgEvLBAYYAgvDaJ1Y320ZLaQhieqIOKQYQFsot10iXSRcJU22MM
	 Rkw/xulYcV5nktH8c89iG3kQlG3BPCr1xdRfZJVT+kvMSvRT9snY2A0El3H35vKyXV
	 W6JZa8QVqv5OzZMLkpyHmG0sb3W7KsU1EFjNFJuCjQ0Yo5eI/x4sKHKnvitUAPu3ez
	 LDCaj/FFwq3rZLWvxuUt8o79MzenYiJGRFKVC7bOwBoqEpLDaJS7yJLiQo2dLnRfp3
	 teTzNW0m3tBPqeCKWjAL3kI1BMDksws67nMnlw76So9SYLlJeLbv0HUyva0MHdpwrt
	 EcaDw0EIz1hrQ==
Date: Tue, 18 Nov 2025 09:41:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, cl@gentwo.org,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: mm: make linear mapping permission update more
 robust for patial range
Message-ID: <20251118164115.GA3977565@ax162>
References: <20251023204428.477531-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023204428.477531-1-yang@os.amperecomputing.com>
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

Hi Yang,

On Thu, Oct 23, 2025 at 01:44:28PM -0700, Yang Shi wrote:
> The commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
> permissions for vmalloc_huge mappings") made permission update for
> partial range more robust. But the linear mapping permission update
> still assumes update the whole range by iterating from the first page
> all the way to the last page of the area.
> 
> Make it more robust by updating the linear mapping permission from the
> page mapped by start address, and update the number of numpages.
> 
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
> v2: * Dropped the fixes tag per Ryan and Dev
>     * Simplified the loop per Dev
>     * Collected R-bs
> 
>  arch/arm64/mm/pageattr.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5135f2d66958..08ac96b9f846 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -148,7 +148,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	unsigned long size = PAGE_SIZE * numpages;
>  	unsigned long end = start + size;
>  	struct vm_struct *area;
> -	int i;
>  
>  	if (!PAGE_ALIGNED(addr)) {
>  		start &= PAGE_MASK;
> @@ -184,8 +183,9 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 */
>  	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>  			    pgprot_val(clear_mask) == PTE_RDONLY)) {
> -		for (i = 0; i < area->nr_pages; i++) {
> -			__change_memory_common((u64)page_address(area->pages[i]),
> +		unsigned long idx = (start - (unsigned long)area->addr) >> PAGE_SHIFT;
> +		for (; numpages; idx++, numpages--) {
> +			__change_memory_common((u64)page_address(area->pages[idx]),
>  					       PAGE_SIZE, set_mask, clear_mask);
>  		}
>  	}
> -- 
> 2.47.0
> 

I am seeing a KASAN failure when booting in QEMU after this change in
-next as commit 37cb0aab9068 ("arm64: mm: make linear mapping permission
update more robust for patial range"):

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- mrproper virtconfig

  $ scripts/config -e KASAN -e KASAN_SW_TAGS

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- olddefconfig Image.gz

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
[    0.000000] Linux version 6.18.0-rc1-00012-g37cb0aab9068 (nathan@aadp) (aarch64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP PREEMPT Tue Nov 18 09:31:02 MST 2025
...
[    0.148789] ==================================================================
[    0.149929] BUG: KASAN: invalid-access in change_memory_common+0x258/0x2d0
[    0.151006] Read of size 8 at addr f96680000268a000 by task swapper/0/1
[    0.152031]
[    0.152274] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00012-g37cb0aab9068 #1 PREEMPT
[    0.152288] Hardware name: linux,dummy-virt (DT)
[    0.152292] Call trace:
[    0.152295]  show_stack+0x18/0x30 (C)
[    0.152309]  dump_stack_lvl+0x60/0x80
[    0.152320]  print_report+0x480/0x498
[    0.152331]  kasan_report+0xac/0xf0
[    0.152343]  kasan_check_range+0x90/0xb0
[    0.152353]  __hwasan_load8_noabort+0x20/0x34
[    0.152364]  change_memory_common+0x258/0x2d0
[    0.152375]  set_memory_ro+0x18/0x24
[    0.152386]  bpf_prog_pack_alloc+0x200/0x2e8
[    0.152397]  bpf_jit_binary_pack_alloc+0x78/0x188
[    0.152409]  bpf_int_jit_compile+0xa4c/0xc74
[    0.152420]  bpf_prog_select_runtime+0x1c0/0x2bc
[    0.152430]  bpf_prepare_filter+0x5a4/0x7c0
[    0.152443]  bpf_prog_create+0xa4/0x100
[    0.152454]  ptp_classifier_init+0x80/0xd0
[    0.152465]  sock_init+0x12c/0x178
[    0.152474]  do_one_initcall+0xa0/0x260
[    0.152484]  kernel_init_freeable+0x2d8/0x358
[    0.152495]  kernel_init+0x20/0x140
[    0.152510]  ret_from_fork+0x10/0x20
[    0.152519] ==================================================================
[    0.170107] Disabling lock debugging due to kernel taint
[    0.170917] Unable to handle kernel paging request at virtual address 006680000268a000
[    0.172112] Mem abort info:
[    0.172555]   ESR = 0x0000000096000004
[    0.173131]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.173954]   SET = 0, FnV = 0
[    0.174481]   EA = 0, S1PTW = 0
[    0.174957]   FSC = 0x04: level 0 translation fault
[    0.175714] Data abort info:
[    0.176160]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.177014]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.177797]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.178648] [006680000268a000] address between user and kernel address ranges
[    0.179735] Internal error: Oops: 0000000096000004 [#1]  SMP
[    0.180603] Modules linked in:
[    0.181075] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G    B               6.18.0-rc1-00012-g37cb0aab9068 #1 PREEMPT
[    0.182793] Tainted: [B]=BAD_PAGE
[    0.183369] Hardware name: linux,dummy-virt (DT)
[    0.184159] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.185366] pc : change_memory_common+0x258/0x2d0
[    0.186179] lr : change_memory_common+0x258/0x2d0
[    0.187004] sp : ffff8000800e7900
[    0.187581] x29: ffff8000800e7940 x28: f8ff00000268a000 x27: 00003e0040000000
[    0.188818] x26: ffffff0000000000 x25: 0000000000200000 x24: ffff8000804e9000
[    0.190046] x23: 0008000000000000 x22: 0000000000000080 x21: 0067800000001000
[    0.191283] x20: 0067800000000000 x19: 66ff000002ff9d20 x18: 00000000781044e3
[    0.192519] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[    0.193758] x14: 0000000000000000 x13: 746e696174206c65 x12: 6e72656b206f7420
[    0.195001] x11: 65756420676e6967 x10: 6775626564206b63 x9 : 0000000000000007
[    0.196218] x8 : ffff78000800e776 x7 : 00000000000000ff x6 : ffff700000277000
[    0.197429] x5 : 0000000000000000 x4 : efff800000000000 x3 : ffffd8c39bb09964
[    0.198647] x2 : 0000000000000001 x1 : 55ff000002770000 x0 : 0000000000000000
[    0.199869] Call trace:
[    0.200298]  change_memory_common+0x258/0x2d0 (P)
[    0.201117]  set_memory_ro+0x18/0x24
[    0.201747]  bpf_prog_pack_alloc+0x200/0x2e8
[    0.202499]  bpf_jit_binary_pack_alloc+0x78/0x188
[    0.203325]  bpf_int_jit_compile+0xa4c/0xc74
[    0.204070]  bpf_prog_select_runtime+0x1c0/0x2bc
[    0.204886]  bpf_prepare_filter+0x5a4/0x7c0
[    0.205621]  bpf_prog_create+0xa4/0x100
[    0.206305]  ptp_classifier_init+0x80/0xd0
[    0.207019]  sock_init+0x12c/0x178
[    0.207615]  do_one_initcall+0xa0/0x260
[    0.208293]  kernel_init_freeable+0x2d8/0x358
[    0.209049]  kernel_init+0x20/0x140
[    0.209660]  ret_from_fork+0x10/0x20
[    0.210293] Code: 9410db81 f940127c 8b140380 9410db7e (f8746b9c)
[    0.211341] ---[ end trace 0000000000000000 ]---
[    0.212148] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.213317] SMP: stopping secondary CPUs
[    0.213963] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

# bad: [0c1c7a6a83feaf2cf182c52983ffe330ffb50280] Add linux-next specific files for 20251117
# good: [6a23ae0a96a600d1d12557add110e0bb6e32730c] Linux 6.18-rc6
git bisect start '0c1c7a6a83feaf2cf182c52983ffe330ffb50280' '6a23ae0a96a600d1d12557add110e0bb6e32730c'
# bad: [821f0a31ee487bfc74b13faa30aa0f75d997f4de] Merge branch 'master' of https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git bisect bad 821f0a31ee487bfc74b13faa30aa0f75d997f4de
# bad: [21cf360c8ba83adf9484d5dee36b803b3aec484f] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git
git bisect bad 21cf360c8ba83adf9484d5dee36b803b3aec484f
# bad: [fa87311c638d397ba4d20b57f1e643e0c7f43bc6] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git
git bisect bad fa87311c638d397ba4d20b57f1e643e0c7f43bc6
# good: [880e7ed723955d5ed056394b6420c0438e601630] Merge branch 'mm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 880e7ed723955d5ed056394b6420c0438e601630
# bad: [e9d0f4c5024eb6a75396140378f3149b6d7e597f] Merge branch 'for-next/perf' of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
git bisect bad e9d0f4c5024eb6a75396140378f3149b6d7e597f
# good: [40e8a782180dde6542d6e17222fb71604254a6f2] Merge branch 'kbuild-next' of https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git
git bisect good 40e8a782180dde6542d6e17222fb71604254a6f2
# good: [3622990efaab066897a2c570b6e90f4b9f30b200] perf script: Change metric format to use json metrics
git bisect good 3622990efaab066897a2c570b6e90f4b9f30b200
# good: [4eed2baf8f1622f503396eda30d360ecc46fc1a5] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/rmk/linux.git
git bisect good 4eed2baf8f1622f503396eda30d360ecc46fc1a5
# good: [cdcfd8a60eb28122cb7e4863a29bc9f24206ccba] Merge branch 'for-next/typos' into for-next/core
git bisect good cdcfd8a60eb28122cb7e4863a29bc9f24206ccba
# bad: [f27acb65b4696bf1a251b077b9d6e8ec73516ba6] Merge branch 'for-next/core' of https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
git bisect bad f27acb65b4696bf1a251b077b9d6e8ec73516ba6
# good: [a04fbfb8a175d4904727048b97fcdef12e392ed1] arm64/sysreg: Add ICH_VMCR_EL2
git bisect good a04fbfb8a175d4904727048b97fcdef12e392ed1
# good: [c320dbb7c80d93a762c01b4a652d9292629869e7] arm64/mm: Elide TLB flush in certain pte protection transitions
git bisect good c320dbb7c80d93a762c01b4a652d9292629869e7
# bad: [c464aa07b92ecd1c31f87132f271ac5916724818] Merge branches 'for-next/misc' and 'for-next/sysreg' into for-next/core
git bisect bad c464aa07b92ecd1c31f87132f271ac5916724818
# bad: [37cb0aab9068e8d7907822405fe5545a2cd7af0b] arm64: mm: make linear mapping permission update more robust for patial range
git bisect bad 37cb0aab9068e8d7907822405fe5545a2cd7af0b
# first bad commit: [37cb0aab9068e8d7907822405fe5545a2cd7af0b] arm64: mm: make linear mapping permission update more robust for patial range

If there is any information I can provide or patches I can test, I am
more than happy to do so.

Cheers,
Nathan

