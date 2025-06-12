Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6BAC71153
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oa8ktHr7TWrgYEjbRn0NXSgUMfxI+Fu+C9Gp862Z1u0=; b=LeOrDFG0ue1YE/6fHn+bOWaNFE
	JOQaXvGi7oK6/bNh2Cqvpj9cMlQc6GMQtLIYXbTNdjzn2rbE4Y+jbDxN3armb3RgnP4bXAsD0DhIr
	b8QZP0j1uKu3SpEHIOYxwcmWl4Arw+cRGNsI4Qw1sCJQde96BxnmsvXxj+Oc7is5uB2pxqzJObCwa
	nKeMCxCXh1kn1MM9zHKQPxSOyL2gA0kdSMdsYLKHPDdDRxxahwCTDKSqkFK5zY2eT2qiEkyQMYe9S
	gAb0In8exZTksgJmeqyJ1NgrA9+Q+SbADYHqagD0qfasdZvVaH4UHgjojlq8kWii27naqUVdCVIrW
	yMIFzlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDl-0000000Ewtc-1H49;
	Fri, 13 Jun 2025 00:24:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPliZ-0000000E2Ar-426u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 17:28:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC3054A303;
	Thu, 12 Jun 2025 17:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB662C4CEEE;
	Thu, 12 Jun 2025 17:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749279;
	bh=S0AfpTT3e1dd75r4X4B034QJv0J/+UOFjOaNXfmUbek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TK1EsFBH2eA7HSZtTEdDkz5gWmhpwQ8gbhx2GcqhICM6fKTrzBjRzNA5uQ3E61nB3
	 kWQrwpQZK+Rm2489I28BR7wKW30uPvFLmMh0igtDU9rAmmhZbKKumtuMonX9ffrurg
	 657WQ7bdrkatAb4x1h2o9+mizytWDA7IIWcxVHCM3m82SeQxzPxn9xGtDm48b7hNGd
	 oU69EW+j5xmwueQA5fnEmjNkGiip06qiROEbJw56mUIFsRoond655tWGFdPgDN3Aki
	 +Mupuoo3d2htaTGD0+t0i7yDnkhqvhMTnuxDQQFzaLPjAozCZ6K8peAyZKnnTNQ1zL
	 UgFCGxh3WWwPg==
From: Will Deacon <will@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Tengda Wu <wutengda@huaweicloud.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	"David A . Long" <dave.long@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
Date: Thu, 12 Jun 2025 18:27:48 +0100
Message-Id: <174974547392.2465190.13255813578038754845.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250604005533.1278992-1-wutengda@huaweicloud.com>
References: <20250604005533.1278992-1-wutengda@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_102800_038534_00513D7F 
X-CRM114-Status: UNSURE (   8.89  )
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

On Wed, 04 Jun 2025 00:55:33 +0000, Tengda Wu wrote:
> KASAN reports a stack-out-of-bounds read in regs_get_kernel_stack_nth().
> 
> Call Trace:
> [   97.283505] BUG: KASAN: stack-out-of-bounds in regs_get_kernel_stack_nth+0xa8/0xc8
> [   97.284677] Read of size 8 at addr ffff800089277c10 by task 1.sh/2550
> [   97.285732]
> [   97.286067] CPU: 7 PID: 2550 Comm: 1.sh Not tainted 6.6.0+ #11
> [   97.287032] Hardware name: linux,dummy-virt (DT)
> [   97.287815] Call trace:
> [   97.288279]  dump_backtrace+0xa0/0x128
> [   97.288946]  show_stack+0x20/0x38
> [   97.289551]  dump_stack_lvl+0x78/0xc8
> [   97.290203]  print_address_description.constprop.0+0x84/0x3c8
> [   97.291159]  print_report+0xb0/0x280
> [   97.291792]  kasan_report+0x84/0xd0
> [   97.292421]  __asan_load8+0x9c/0xc0
> [   97.293042]  regs_get_kernel_stack_nth+0xa8/0xc8
> [   97.293835]  process_fetch_insn+0x770/0xa30
> [   97.294562]  kprobe_trace_func+0x254/0x3b0
> [   97.295271]  kprobe_dispatcher+0x98/0xe0
> [   97.295955]  kprobe_breakpoint_handler+0x1b0/0x210
> [   97.296774]  call_break_hook+0xc4/0x100
> [   97.297451]  brk_handler+0x24/0x78
> [   97.298073]  do_debug_exception+0xac/0x178
> [   97.298785]  el1_dbg+0x70/0x90
> [   97.299344]  el1h_64_sync_handler+0xcc/0xe8
> [   97.300066]  el1h_64_sync+0x78/0x80
> [   97.300699]  kernel_clone+0x0/0x500
> [   97.301331]  __arm64_sys_clone+0x70/0x90
> [   97.302084]  invoke_syscall+0x68/0x198
> [   97.302746]  el0_svc_common.constprop.0+0x11c/0x150
> [   97.303569]  do_el0_svc+0x38/0x50
> [   97.304164]  el0_svc+0x44/0x1d8
> [   97.304749]  el0t_64_sync_handler+0x100/0x130
> [   97.305500]  el0t_64_sync+0x188/0x190
> [   97.306151]
> [   97.306475] The buggy address belongs to stack of task 1.sh/2550
> [   97.307461]  and is located at offset 0 in frame:
> [   97.308257]  __se_sys_clone+0x0/0x138
> [   97.308910]
> [   97.309241] This frame has 1 object:
> [   97.309873]  [48, 184) 'args'
> [   97.309876]
> [   97.310749] The buggy address belongs to the virtual mapping at
> [   97.310749]  [ffff800089270000, ffff800089279000) created by:
> [   97.310749]  dup_task_struct+0xc0/0x2e8
> [   97.313347]
> [   97.313674] The buggy address belongs to the physical page:
> [   97.314604] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x14f69a
> [   97.315885] flags: 0x15ffffe00000000(node=1|zone=2|lastcpupid=0xfffff)
> [   97.316957] raw: 015ffffe00000000 0000000000000000 dead000000000122 0000000000000000
> [   97.318207] raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> [   97.319445] page dumped because: kasan: bad access detected
> [   97.320371]
> [   97.320694] Memory state around the buggy address:
> [   97.321511]  ffff800089277b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   97.322681]  ffff800089277b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   97.323846] >ffff800089277c00: 00 00 f1 f1 f1 f1 f1 f1 00 00 00 00 00 00 00 00
> [   97.325023]                          ^
> [   97.325683]  ffff800089277c80: 00 00 00 00 00 00 00 00 00 f3 f3 f3 f3 f3 f3 f3
> [   97.326856]  ffff800089277d00: f3 f3 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> [...]

Applied (using *addr) to arm64 (for-next/fixes), thanks!

[1/1] arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
      https://git.kernel.org/arm64/c/39dfc971e42d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

