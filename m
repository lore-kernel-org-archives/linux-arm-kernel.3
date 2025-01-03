Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64444E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li/8JG7mMgIPD5YGUfzjmQdWlU9BNm1wlYY/6f3e7bk=; b=Xz9j+bsJ1I4Pv/Rr0QxgfTziLJ
	Z0+N7Ax10cFOrbMZ/gYtl1jmfA12W87+oANfwcDT3ym3hbwH61VUHbetwDlzRZlLzBVCK/GxDIVSJ
	pxKZ5ZUA2d4YI26pAcfCu2VT/saa0eBjoIna7VNITdGz//6jJREeH1Y1UmdIE1AqhBe3GUW8Muit8
	I7Wocd39ez2xf5GcTXXk4l3wZZQGJLYqWN1iq4G40vhdpcWOwgCHTczK9W4xiE9yHciPP8gHpXoeH
	Jz6liNgGcNqpW5J6blOuie6nnXraffkP4JZ+W6x6uk74Uy7iRkpJ39v3dxzGkXFbFmUKAvx7B1VhY
	0zxnT8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkN6-0000000DPF7-1uum;
	Fri, 03 Jan 2025 16:18:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkLs-0000000DP46-1iIY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C0C7A40E61;
	Fri,  3 Jan 2025 16:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18FFC4CED6;
	Fri,  3 Jan 2025 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735921003;
	bh=aCvdU9wmZnvqihH/vpwbjsW1EmPIQRI9CHnri/4yCXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V0zd5/yJmSV+be594fmZR/dWzlvWQBlpfr5Q3LtxFC17MKETGBQraA7ShNKvlpGTg
	 TmcyK43E85521/NWWW2puReX0/8x/iubD3YLSgB1XEuEQrPLz2PcSJlxfgPRLfYvQS
	 emSPrKs8/AmbPayrOu9U7yT6awRmHWti10AbMokW4Xg6wUxJj9oGqyyxlpSizvLKp1
	 5izR8XNg2jeecQ3VVMWLKqo0S9EUhwXzQlCf04RStKxw0XHFwV0XRC/WmRQ2v+ECA9
	 Eif2u3kccLXEXU1YMg8vkcrjk5NH4Y0W6qUcuaArS4n0SbUU1UmY7y2bSOhfB/cJyE
	 tFLH9DyBMq/yw==
Date: Fri, 3 Jan 2025 16:16:38 +0000
From: Will Deacon <will@kernel.org>
To: Itai Handler <itai.handler@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, ardb@kernel.org, usamaarif642@gmail.com
Subject: Re: Issues with kexec on arm64
Message-ID: <20250103161637.GA3921@willie-the-truck>
References: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_081644_586343_352431F1 
X-CRM114-Status: GOOD (  18.44  )
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

On Tue, Dec 24, 2024 at 01:36:41PM +0200, Itai Handler wrote:
> [Sorry about my previous e-mail on this subject. It got corrupted.
> Please ignore it.]
> 
> Hello,
> 
> I'm encountering kernel panics / system hangs when attempting to
> kexec a vmlinux file on arm64 architecture.
> 
> It happens both on qemu and on real hardware.
> 
> These issues occur on all kernels from v4.19 to the latest mainline.

I think other folks have been using kexec on arm64, so something smells
fishy here. Is the issue intermittent?

> A sample panic output looks as follows:
>   kernel BUG at arch/arm64/mm/mmu.c:217!
>   Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
>   CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
>   Hardware name: linux,dummy-virt (DT)
>   pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : __create_pgd_mapping+0xe8/0x3b0
>   lr : __create_pgd_mapping+0x44/0x3b0
>   sp : fffffe00804d3c20
>   x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
>   x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
>   x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
>   x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
>   x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>   x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
>   x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
>   x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
>   x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
>   x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
>   Call trace:
>    __create_pgd_mapping+0xe8/0x3b0
>    map_kernel_segment+0x74/0xb0
>    paging_init+0xec/0x4f8
>    setup_arch+0x234/0x52c
>    start_kernel+0x64/0x500
>    __primary_switched+0xb4/0xbc
>   Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
>   ---[ end trace 0000000000000000 ]---
>   Kernel panic - not syncing: Oops - BUG: Fatal exception

So this explodes because we find a page-table entry at the pmd level
that we don't like the look of:

  - It's not a block entry
  - It's not all zeroes
  - It's also not a table

Sadly, the actual value is clobbered by the time we take the BUG():

   0:	f9400300	ldr	x0, [x24]
   4:	92400400	and	x0, x0, #0x3
   8:	f1000c1f	cmp	x0, #0x3
   c:	54000060	b.eq	0x18  // b.none
  10:*	d4210000	brk	#0x800		<-- trapping instruction

Maybe dumping 'pmd_val(pmd)' before we crash would be instructive? Maybe
it's a pointer...

> I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
> ("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.

Hmm. I wonder if the rodata section isn't being loaded properly? Can you
add some traces to check that, please?

Will

