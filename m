Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE15C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSXGJ8b9R1E7eJzyMGHhDHqxN/s94X8g11DuaMV0FK4=; b=H0bRkuSTxcR38jNLIZI+AeEn1w
	Wfv5+G1bFUsKQ7YMOvLTmlpGLe8Oji1/W/1CCMZTarOLZiw5BR8P6boTj9KGAJWt+OQkCWbLQXSrb
	YTOrnvzABX47a/N11Park7LZ9nI3rfGSbGClxYBLBUcA65OrJ5eqaZy25IlVzIiOdFmqozqFGZARs
	hAzDeBfFM1fGgRRCrK704Z1sAqa7sTzlhtzVvIyWlq3nL5pOxFdPYj397rnvH7bqui/Hl+ZIoasjs
	6NfIlm0bBIcSLe/aTgceWKHEhTIiBKJWh976pZPu3DpPa4BM6fQ0Y0MnRv3SnmWfcWTPqQAwPSJLI
	32p/4B+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virz8-00000006qfQ-0ZQe;
	Thu, 22 Jan 2026 10:32:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virz6-00000006qek-0TvS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 10:32:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uSXGJ8b9R1E7eJzyMGHhDHqxN/s94X8g11DuaMV0FK4=; b=BZFCiYg83WUZ4ZesFmURrnz3Oi
	btbxZGw+9O6Jf+j0CtzvoTHYlnvNscNjvi8RVemUsIX2vuOQbVwsiNXjgMyjJO4MSACSES0fXJOs8
	nGAZg9LPz8AeJEi4869AStygfFoYN5fhhsqmmGsv0Umk8xD4RO/zODkqzb4g1G0SB6JKd7Ko2upP2
	7OB2grUYt8EufdjTFpE+DHs5lA9rXPATiaxTA0D08d6dyH17Dy+X8DqJoJtsC/3vqeHlwK/GlM40G
	XW82GmkDp04/f5/3pdWoknIRF1C7z3cD4InucPSsZ0H6Gg+1WqmEZoD/h4/CMVjc9Rp9rkD8eFs9W
	SMcuyaIw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virz2-000000009Ri-1w9e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:32:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F0BC43BF0;
	Thu, 22 Jan 2026 10:32:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D748C16AAE;
	Thu, 22 Jan 2026 10:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769077931;
	bh=YzxKJLp4hOFWmHBq+27FjBflguVyKyH8AcaBNRlg9LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PImNJqovSexK/KAYqd1P51YKSled/h1pxeAWJWrd1SSoXKQeZDZ8tjWkfRkpd7jTu
	 gPCEwaU0hVogUmBq8dYq1Bl9eupQ1keJkP9OvMEymhkiAVEm9azQjl8o027hPeYgKM
	 lZ1Z1KE6OU/f7yjdSgg7og6tCWIe6tFCr376EtsR2QgEeIos6KTuYKRQZjGBbY7tS/
	 RjxjOQlt6V0SR7Faq0ZBUV/asKMa5JKv3Td/I19xnDFcfVWr9uJsdLlwI+z3ty4fXP
	 BSaz3YYnRttv08iVLPETyS15AgDiVUhssTvvbsKyqLE8Anmq11vmXHaHGTnMCEEs4N
	 QqIpVb1PsWrQg==
Date: Thu, 22 Jan 2026 10:32:06 +0000
From: Will Deacon <will@kernel.org>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zhaoyang Huang <huangzhaoyang@gmail.com>, steve.kang@unisoc.com,
	jeson.gao@unisoc.com, xuewen.yan@unisoc.com
Subject: Re: [RESEND PATCH] arch: arm64: set __nocfi on swsusp_arch_resume
Message-ID: <aXH8ppr2bdc-lWUH@willie-the-truck>
References: <20260120060619.469565-1-zhaoyang.huang@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120060619.469565-1-zhaoyang.huang@unisoc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_103213_062748_0B31A5B7 
X-CRM114-Status: GOOD (  21.33  )
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

On Tue, Jan 20, 2026 at 02:06:19PM +0800, zhaoyang.huang wrote:
> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> 
> A DABT is reported[1] on an android based system when resume from hiberate,
> which is root caused as CFI will plant stub code[2] to verify the
> swsusp_arch_suspend_exit's authentication, where the hash value is stored
> before the page that alloced by create_safe_exec_page. We also have
> tried to copy the hash value together with the function but get failed since
> the value is not on the desired position(src_start - 4). So we solve
> this issue by setting __nocfi on swsusp_arch_resume and it works.
> 
> [1]
> [   22.991934][    T1] Unable to handle kernel paging request at virtual address 0000000109170ffc
> [   22.991934][    T1] Mem abort info:
> [   22.991934][    T1]   ESR = 0x0000000096000007
> [   22.991934][    T1]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   22.991934][    T1]   SET = 0, FnV = 0
> [   22.991934][    T1]   EA = 0, S1PTW = 0
> [   22.991934][    T1]   FSC = 0x07: level 3 translation fault
> [   22.991934][    T1] Data abort info:
> [   22.991934][    T1]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [   22.991934][    T1]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   22.991934][    T1]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   22.991934][    T1] [0000000109170ffc] user address but active_mm is swapper
> [   22.991934][    T1] Internal error: Oops: 0000000096000007 [#1] PREEMPT SMP
> [   22.991934][    T1] Dumping ftrace buffer:
> [   22.991934][    T1]    (ftrace buffer empty)
> [   22.991934][    T1] Modules linked in:
> [   22.991934][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.98-android15-8-g0b1d2aee7fc3-dirty-4k #1 688c7060a825a3ac418fe53881730b355915a419
> [   22.991934][    T1] Hardware name: Unisoc UMS9360-base Board (DT)
> [   22.991934][    T1] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   22.991934][    T1] pc : swsusp_arch_resume+0x2ac/0x344
> [   22.991934][    T1] lr : swsusp_arch_resume+0x294/0x344
> [   22.991934][    T1] sp : ffffffc08006b960
> [   22.991934][    T1] x29: ffffffc08006b9c0 x28: 0000000000000000 x27: 0000000000000000
> [   22.991934][    T1] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000820
> [   22.991934][    T1] x23: ffffffd0817e3000 x22: ffffffd0817e3000 x21: 0000000000000000
> [   22.991934][    T1] x20: ffffff8089171000 x19: ffffffd08252c8c8 x18: ffffffc080061058
> [   22.991934][    T1] x17: 00000000529c6ef0 x16: 00000000529c6ef0 x15: 0000000000000004
> [   22.991934][    T1] x14: ffffff8178c88000 x13: 0000000000000006 x12: 0000000000000000
> [   22.991934][    T1] x11: 0000000000000015 x10: 0000000000000001 x9 : ffffffd082533000
> [   22.991934][    T1] x8 : 0000000109171000 x7 : 205b5d3433393139 x6 : 392e32322020205b
> [   22.991934][    T1] x5 : 000000010916f000 x4 : 000000008164b000 x3 : ffffff808a4e0530
> [   22.991934][    T1] x2 : ffffffd08058e784 x1 : 0000000082326000 x0 : 000000010a283000
> [   22.991934][    T1] Call trace:
> [   22.991934][    T1]  swsusp_arch_resume+0x2ac/0x344
> [   22.991934][    T1]  hibernation_restore+0x158/0x18c
> [   22.991934][    T1]  load_image_and_restore+0xb0/0xec
> [   22.991934][    T1]  software_resume+0xf4/0x19c
> [   22.991934][    T1]  software_resume_initcall+0x34/0x78
> [   22.991934][    T1]  do_one_initcall+0xe8/0x370
> [   22.991934][    T1]  do_initcall_level+0xc8/0x19c
> [   22.991934][    T1]  do_initcalls+0x70/0xc0
> [   22.991934][    T1]  do_basic_setup+0x1c/0x28
> [   22.991934][    T1]  kernel_init_freeable+0xe0/0x148
> [   22.991934][    T1]  kernel_init+0x20/0x1a8
> [   22.991934][    T1]  ret_from_fork+0x10/0x20
> [   22.991934][    T1] Code: a9400a61 f94013e0 f9438923 f9400a64 (b85fc110)
> 
> [2]
> 0xffffffd08064a878 <swsusp_arch_resume+596>:	mov	x0, x24
> 0xffffffd08064a87c <swsusp_arch_resume+600>:	mov	x1, x20
> 0xffffffd08064a880 <swsusp_arch_resume+604>:	mov	x2, x21
> 0xffffffd08064a884 <swsusp_arch_resume+608>:	mov	x3, x22
> 0xffffffd08064a888 <swsusp_arch_resume+612>:	mov	x4, x23
> 0xffffffd08064a88c <swsusp_arch_resume+616>:	ldur	w16, [x25, #-4]
> 0xffffffd08064a890 <swsusp_arch_resume+620>:	movk	w17, #0x5d7b
> 0xffffffd08064a894 <swsusp_arch_resume+624>:	movk	w17, #0xb6ad, lsl #16
> 0xffffffd08064a898 <swsusp_arch_resume+628>:	cmp	w16, w17
> 0xffffffd08064a89c <swsusp_arch_resume+632>:	b.eq	0xffffffd08064a8a4 <swsusp_arch_resume+640>  // b.none
> 0xffffffd08064a8a0 <swsusp_arch_resume+636>:	brk	#0x8239
> 0xffffffd08064a8a4 <swsusp_arch_resume+640>:	blr	x25
> 
> co_developed-by: Jeson Gao <jeson.gao@unisoc.com>

This should be "Co-developed-by:" and you will also need Jeson's
Signed-off-by line in addition to your own.

> Signed-off-by: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> ---
>  arch/arm64/kernel/hibernate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 18749e9a6c2d..9717568518ba 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -402,7 +402,7 @@ int swsusp_arch_suspend(void)
>   * Memory allocated by get_safe_page() will be dealt with by the hibernate code,
>   * we don't need to free it here.
>   */
> -int swsusp_arch_resume(void)
> +int __nocfi swsusp_arch_resume(void)
>  {
>  	int rc;
>  	void *zero_page;

Why does is the '__nocfi' annotation here rather than on the
'hibernate_exit' pointer?

Will

