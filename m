Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F602EC1126
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 19:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec7SVpvpk4vouNNo+13CfybE9PvNtnh5vXKKQYjneVs=; b=l0+KdEgd62LbUOxdxOVcezCrHR
	8WG7Uq1pmdopAVE2uXBHVZTO96ZmHSxvi/y5ZlQ52eZhRgD0b9zDidErZq2S2WR6Nshc4g/0A3/XN
	7Bj0aD9P5qyXGPGdvu957lRI4E3wndaldkaMJvmySCEiqpz6Ze5Rj6XbYZY1rMcjbRrnieQh6xAGo
	IfZ/MBfsuGElm6hLbOBsm8/Zh65J3c9KIPYmm2X92L2YtKpMjgRIjZuP4+Qy8ioH/PoWlCRlw81PC
	Fa5Gm4Gi85SKVvriKs40tZ3d4jKlJIzg5/1+G4qpcfAQ57zUpYXuZWFWGs6VG2l1fMof2ubZ+4EAO
	+lkeMvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubTS-00000000vDX-28nh;
	Mon, 23 Feb 2026 19:20:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vubTR-00000000vDP-0fA8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 19:20:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17FFF60123;
	Mon, 23 Feb 2026 19:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9B3EC116C6;
	Mon, 23 Feb 2026 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771874403;
	bh=IvRbM7okQMjpYZLZwOigDhJDvKkmJao4UOPHQtL6GfM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GMqPiJu3AZrZs8whzE7B07bnRFwB+DpbATa17lFaTuUM5k6DrP3GliEoQ/emBWKbc
	 qy0iw0rQyS5kORkbphgZdfwt+ajwj4wiXa3Lw6j+F4hheHnurVMRrveub1x7bWhCbt
	 qVXaEn9p4Od1HhLLdZgcthuusilghClkaGt76EZesrNB3qDYLk1TdN7yNreRaXj6Pm
	 gSw92PwXObPz3YT/P2RVglzqb3Ayqyu7sJRQQ5sQMR3J4y8+XE6edoXSASMyG2VKr/
	 U/+ewOmI4nmiAaFHbaJsWZAZejegEp9Md/sFrfOlb14FxSdDdPR+N5tXdcsYAgs4vw
	 +mKGjGijde4PQ==
Message-ID: <a7b9f809-7ce5-418a-90f0-8c4e927cc9c3@kernel.org>
Date: Mon, 23 Feb 2026 20:20:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: gcs: Do not set PTE_SHARED on GCS mappings
 if FEAT_LPA2 is enabled
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
 Emanuele Rocca <emanuele.rocca@arm.com>, Mark Rutland
 <mark.rutland@arm.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260223174533.1478164-1-catalin.marinas@arm.com>
 <20260223174533.1478164-2-catalin.marinas@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260223174533.1478164-2-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2/23/26 18:45, Catalin Marinas wrote:
> When FEAT_LPA2 is enabled, bits 8-9 of the PTE replace the
> shareability attribute with bits 50-51 of the output address. The
> _PAGE_GCS{,_RO} definitions include the PTE_SHARED bits as 0b11 (this
> matches the other _PAGE_* definitions) but using this macro directly
> leads to the following panic when enabling GCS on a system/model with
> LPA2:
> 
>   Unable to handle kernel paging request at virtual address fffff1ffc32d8008
>   Mem abort info:
>     ESR = 0x0000000096000004
>     EC = 0x25: DABT (current EL), IL = 32 bits
>     SET = 0, FnV = 0
>     EA = 0, S1PTW = 0
>     FSC = 0x04: level 0 translation fault
>   Data abort info:
>     ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>     CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>     GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>   swapper pgtable: 4k pages, 52-bit VAs, pgdp=0000000060f4d000
>   [fffff1ffc32d8008] pgd=100000006184b003, p4d=0000000000000000
>   Internal error: Oops: 0000000096000004 [#1]  SMP
>   CPU: 0 UID: 0 PID: 513 Comm: gcs_write_fault Tainted: G   M                7.0.0-rc1 #1 PREEMPT
>   Tainted: [M]=MACHINE_CHECK
>   Hardware name: QEMU QEMU Virtual Machine, BIOS 2025.02-8+deb13u1 11/08/2025
>   pstate: 03402005 (nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>   pc : zap_huge_pmd+0x168/0x468
>   lr : zap_huge_pmd+0x2c/0x468
>   sp : ffff800080beb660
>   x29: ffff800080beb660 x28: fff00000c2058180 x27: ffff800080beb898
>   x26: fff00000c2058180 x25: ffff800080beb820 x24: 00c800010b600f41
>   x23: ffffc1ffc30af1a8 x22: fff00000c2058180 x21: 0000ffff8dc00000
>   x20: fff00000c2bc6370 x19: ffff800080beb898 x18: ffff800080bebb60
>   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000007
>   x14: 000000000000000a x13: 0000aaaacbbbffff x12: 0000000000000000
>   x11: 0000ffff8ddfffff x10: 00000000000001fe x9 : 0000ffff8ddfffff
>   x8 : 0000ffff8de00000 x7 : 0000ffff8da00000 x6 : fff00000c2bc6370
>   x5 : 0000ffff8da00000 x4 : 000000010b600000 x3 : ffffc1ffc0000000
>   x2 : fff00000c2058180 x1 : fffff1ffc32d8000 x0 : 000000c00010b600
>   Call trace:
>    zap_huge_pmd+0x168/0x468 (P)
>    unmap_page_range+0xd70/0x1560
>    unmap_single_vma+0x48/0x80
>    unmap_vmas+0x90/0x180
>    unmap_region+0x88/0xe4
>    vms_complete_munmap_vmas+0xf8/0x1e0
>    do_vmi_align_munmap+0x158/0x180
>    do_vmi_munmap+0xac/0x160
>    __vm_munmap+0xb0/0x138
>    vm_munmap+0x14/0x20
>    gcs_free+0x70/0x80
>    mm_release+0x1c/0xc8
>    exit_mm_release+0x28/0x38
>    do_exit+0x190/0x8ec
>    do_group_exit+0x34/0x90
>    get_signal+0x794/0x858
>    arch_do_signal_or_restart+0x11c/0x3e0
>    exit_to_user_mode_loop+0x10c/0x17c
>    el0_da+0x8c/0x9c
>    el0t_64_sync_handler+0xd0/0xf0
>    el0t_64_sync+0x198/0x19c
>   Code: aa1603e2 d34cfc00 cb813001 8b011861 (f9400420)
> 
> Similarly to how the kernel handles protection_map[], use a
> gcs_page_prot variable to store the protection bits and clear PTE_SHARED
> if LPA2 is enabled.
> 
> Also remove the unused PAGE_GCS{,_RO} macros.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: 6497b66ba694 ("arm64/mm: Map pages for guarded control stack")
> Reported-by: Emanuele Rocca <emanuele.rocca@arm.com>
> Cc: <stable@vger.kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

