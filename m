Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2FBD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8SYktrzeeo7bczXkgHeTvK3YGf4hkrbBoEDQaomo/Q=; b=ImxmDAw78rVGoU7ZdgKV7+Bs/E
	2KQzfuqDsEckoc4LRg3wpWyjigIvFJGgksR4BeOipdZlHd19kOkl+uIVw/nadkO4BBIXzi0Vql7hS
	8Dc1hReBWHNkoOsjbsgHiCyynecPUoU9O6AlxZ+km2uCUKMk6BlYD0ditFTcXeiZsZG59hgQ2sUTn
	drb1ja4xfSaVm32QVgzULdnMLOzqzJfyPfwC2YG406Bq8wKMh6MElIadoIHtTLvRj91EGV//oetzd
	P51oqa1eCO0OkZKpdW21Mvj6mOoqfQns2shLnLdETHyyzJymMndf0RBDzV5VPtsMhL0d7Ej4aD40W
	DH3CH8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhnk-0000000H9OU-3pL6;
	Thu, 27 Nov 2025 19:37:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhni-0000000H9Nx-0EL7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3FC8406A5;
	Thu, 27 Nov 2025 19:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9ABC4CEF8;
	Thu, 27 Nov 2025 19:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764272227;
	bh=jTQZG/LnU8/DhCvJo8hYRrS1O3MY+ahD+lg50BHNABE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VpvLKLXZd0CEesapSP6Udlj0hUrCadlBugvB5kvILrll67bEFmKC0qCL1Iid0+1VI
	 jIZhO1StMuZtB0NbiVKdkgWpF95+RoP+2rVt1nXLIq2iE9OD+mnDlRqwNIkTRUF1YI
	 iiOctAAW/BUCY4dUm9/FModDOlKqgLQElsS/08BY=
Date: Thu, 27 Nov 2025 11:37:06 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, bhe@redhat.com,
 leitao@debian.org, coxu@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random
 field
Message-Id: <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
In-Reply-To: <20251127182644.1577592-1-yeoreum.yun@arm.com>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_113710_122666_D8D00DA3 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, 27 Nov 2025 18:26:44 +0000 Yeoreum Yun <yeoreum.yun@arm.com> wrote:

> Commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> introduced the kexec_buf->random field to enable random placement of
> kexec_buf.
> 
> However, this field was never properly initialized for kexec images
> that do not need to be placed randomly, leading to the following UBSAN
> warning:
> 
> [  +0.364528] ------------[ cut here ]------------
> [  +0.000019] UBSAN: invalid-load in ./include/linux/kexec.h:210:12
> [  +0.000131] load of value 2 is not a valid value for type 'bool' (aka '_Bool')
> [  +0.000003] CPU: 4 UID: 0 PID: 927 Comm: kexec Not tainted 6.18.0-rc7+ #3 PREEMPT(full)
> [  +0.000002] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
> [  +0.000000] Call trace:
> [  +0.000001]  show_stack+0x24/0x40 (C)
> [  +0.000006]  __dump_stack+0x28/0x48
> [  +0.000002]  dump_stack_lvl+0x7c/0xb0
> [  +0.000002]  dump_stack+0x18/0x34
> [  +0.000001]  ubsan_epilogue+0x10/0x50
> [  +0.000002]  __ubsan_handle_load_invalid_value+0xc8/0xd0
> [  +0.000003]  locate_mem_hole_callback+0x28c/0x2a0
> [  +0.000003]  kexec_locate_mem_hole+0xf4/0x2f0
> [  +0.000001]  kexec_add_buffer+0xa8/0x178
> [  +0.000002]  image_load+0xf0/0x258
> [  +0.000001]  __arm64_sys_kexec_file_load+0x510/0x718
> [  +0.000002]  invoke_syscall+0x68/0xe8
> [  +0.000001]  el0_svc_common+0xb0/0xf8
> [  +0.000002]  do_el0_svc+0x28/0x48
> [  +0.000001]  el0_svc+0x40/0xe8
> [  +0.000002]  el0t_64_sync_handler+0x84/0x140
> [  +0.000002]  el0t_64_sync+0x1bc/0x1c0
> 
> To address this, initialise kexec_buf->random field properly.
> 
> Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")

Thanks, I'll add a cc:stable to this.


