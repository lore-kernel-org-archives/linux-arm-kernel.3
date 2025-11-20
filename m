Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC04CF9C7A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vn7Ea67zuHRCOQHtcNLfgl9AEhCdFK/2R48HxuwyMEg=; b=cgpehA2kOOrrBvjmCgtpglYG6h
	mhgOldUFFfq+U/OjdHtFAVKacTrhdH0YI2i/Rmb/Fwt5WdvRBekYi9uHxF4pbGXlmJLm1KSxJPuaD
	TqdXhRZ5XmYQIo1q0O+kZUo+mEITiTH2tpyzfxaX5tMxVU6ljyrCVhlSfISi58jUfIfsuaafW9vQ0
	BjcjiF4JqB/oNLyUoEe+yvivfUIPEowNMiAy2D7/SC3kS3Q4fh5I2/ZYbmbXwoEurTVJOQOW8Vv9T
	GxABSfdOng26kSqg08wQcEqzWryOwqY/bu5wVB+e8+cXuSO8ZaFp4j9ExBgASrE6czcBChxwN1Tz+
	ZoruM3dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM99k-00000007DCd-0k0M;
	Thu, 20 Nov 2025 18:13:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM99g-00000007DCA-3p8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:13:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BA3D339;
	Thu, 20 Nov 2025 10:13:05 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78F3E3F73B;
	Thu, 20 Nov 2025 10:13:11 -0800 (PST)
Date: Thu, 20 Nov 2025 18:13:09 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: ryan.roberts@arm.com, dev.jain@arm.com, cl@gentwo.org, will@kernel.org,
	nathan@kernel.org, Yang Shi <yang@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: use untagged address to calclulate page
 index
Message-ID: <176366223676.2472999.13349582188639740837.b4-ty@arm.com>
References: <20251119041945.1991527-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119041945.1991527-1-yang@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_101317_009202_1E1CC465 
X-CRM114-Status: UNSURE (   7.23  )
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

On Tue, 18 Nov 2025 20:19:45 -0800, Yang Shi wrote:
> Nathan Chancellor reported the below bug:
> 
> [    0.149929] BUG: KASAN: invalid-access in change_memory_common+0x258/0x2d0
> [    0.151006] Read of size 8 at addr f96680000268a000 by task swapper/0/1
> [    0.152031]
> [    0.152274] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00012-g37cb0aab9068 #1 PREEMPT
> [    0.152288] Hardware name: linux,dummy-virt (DT)
> [    0.152292] Call trace:
> [    0.152295]  show_stack+0x18/0x30 (C)
> [    0.152309]  dump_stack_lvl+0x60/0x80
> [    0.152320]  print_report+0x480/0x498
> [    0.152331]  kasan_report+0xac/0xf0
> [    0.152343]  kasan_check_range+0x90/0xb0
> [    0.152353]  __hwasan_load8_noabort+0x20/0x34
> [    0.152364]  change_memory_common+0x258/0x2d0
> [    0.152375]  set_memory_ro+0x18/0x24
> [    0.152386]  bpf_prog_pack_alloc+0x200/0x2e8
> [    0.152397]  bpf_jit_binary_pack_alloc+0x78/0x188
> [    0.152409]  bpf_int_jit_compile+0xa4c/0xc74
> [    0.152420]  bpf_prog_select_runtime+0x1c0/0x2bc
> [    0.152430]  bpf_prepare_filter+0x5a4/0x7c0
> [    0.152443]  bpf_prog_create+0xa4/0x100
> [    0.152454]  ptp_classifier_init+0x80/0xd0
> [    0.152465]  sock_init+0x12c/0x178
> [    0.152474]  do_one_initcall+0xa0/0x260
> [    0.152484]  kernel_init_freeable+0x2d8/0x358
> [    0.152495]  kernel_init+0x20/0x140
> [    0.152510]  ret_from_fork+0x10/0x20
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mm: use untagged address to calculate page index
      https://git.kernel.org/arm64/c/a06494adb7ef

-- 
Catalin

