Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A55D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 18:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHrVCMMWFFFpwx7+jcKrjnIkGEXxDcFfUFIznxXQQqU=; b=NOIzEsk48ROPOYNo6EcFkThNJL
	d8RK2PIGDZSswvy+JIB1sFNRZ3oP8BQuXCPjpxZPmNmmCm583JYUisZFEOgN2nUqybFvQ1pArI9FD
	ohfC6EJx62QnF688Wl5YIiPLYNmHXfgZEFEIhUGQog4MvSSH3oezuMOWbs+R5f6nNEUfCSEu2COxg
	rC679ckIEt8TgsrTFqj9bAmTsFi8/KCgvO8rL8cLhWIxlerE/6z9SFn1gY0A8bZV0VRMOL5+oFeqx
	Jogv75WdlnkCj0A7u3Xp1enOoINoDhXkX8GS5e7OnSt81cONTvoIOnH5l7e1xStC6HCX530VYGDUm
	wbNlivPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Ff-00000000luY-0Rc2;
	Fri, 28 Nov 2025 18:31:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP3Fe-00000000luQ-0rjL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 18:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39C9B6016F;
	Fri, 28 Nov 2025 18:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A12DC4CEF1;
	Fri, 28 Nov 2025 18:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1764354684;
	bh=35/jyW+2nsi6ij4b53BqkKvmhZ5FTacr27o/xRobp2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rGmPFzLq6RnIgl69vh+8BUvIafIBDAugsXyOIG93+HkBw4VD6r9ZdtttKy8ytH0Zb
	 Ckl2E2AepuqtD2raIjGBIkEzW3JOAvoo5oyRs8wfKWEEe4SbYVmAf0Z2cpgTn6wrs1
	 7ycBhopzuVAVaSTDOkaLnS8Cuq/m96A9I55Z69Qw=
Date: Fri, 28 Nov 2025 10:31:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Breno Leitao <leitao@debian.org>
Cc: Baoquan He <bhe@redhat.com>, pjw@kernel.org, Yeoreum Yun
 <yeoreum.yun@arm.com>, catalin.marinas@arm.com, will@kernel.org,
 coxu@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random
 field
Message-Id: <20251128103123.27c259d595a336caca07b00c@linux-foundation.org>
In-Reply-To: <5wel6vqjwwf25hryvg6s7z6aaog7xc3zxjevupt3jn4gntme6d@74wwwmhvvelt>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
	<20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
	<aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
	<5wel6vqjwwf25hryvg6s7z6aaog7xc3zxjevupt3jn4gntme6d@74wwwmhvvelt>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 28 Nov 2025 05:55:05 -0800 Breno Leitao <leitao@debian.org> wrote:

> 
> On Fri, Nov 28, 2025 at 08:17:21AM +0800, Baoquan He wrote:
> > On 11/27/25 at 11:37am, Andrew Morton wrote:
> > > On Thu, 27 Nov 2025 18:26:44 +0000 Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > 
> > > > Commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > > > introduced the kexec_buf->random field to enable random placement of
> > > > kexec_buf.
> > > > 
> > > > However, this field was never properly initialized for kexec images
> > > > that do not need to be placed randomly, leading to the following UBSAN
> > > > warning:
> > > > 
> > > > [  +0.364528] ------------[ cut here ]------------
> > > > [  +0.000019] UBSAN: invalid-load in ./include/linux/kexec.h:210:12
> > > > [  +0.000131] load of value 2 is not a valid value for type 'bool' (aka '_Bool')
> > > > [  +0.000003] CPU: 4 UID: 0 PID: 927 Comm: kexec Not tainted 6.18.0-rc7+ #3 PREEMPT(full)
> > > > [  +0.000002] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
> > > > [  +0.000000] Call trace:
> > > > [  +0.000001]  show_stack+0x24/0x40 (C)
> > > > [  +0.000006]  __dump_stack+0x28/0x48
> > > > [  +0.000002]  dump_stack_lvl+0x7c/0xb0
> > > > [  +0.000002]  dump_stack+0x18/0x34
> > > > [  +0.000001]  ubsan_epilogue+0x10/0x50
> > > > [  +0.000002]  __ubsan_handle_load_invalid_value+0xc8/0xd0
> > > > [  +0.000003]  locate_mem_hole_callback+0x28c/0x2a0
> > > > [  +0.000003]  kexec_locate_mem_hole+0xf4/0x2f0
> > > > [  +0.000001]  kexec_add_buffer+0xa8/0x178
> > > > [  +0.000002]  image_load+0xf0/0x258
> > > > [  +0.000001]  __arm64_sys_kexec_file_load+0x510/0x718
> > > > [  +0.000002]  invoke_syscall+0x68/0xe8
> > > > [  +0.000001]  el0_svc_common+0xb0/0xf8
> > > > [  +0.000002]  do_el0_svc+0x28/0x48
> > > > [  +0.000001]  el0_svc+0x40/0xe8
> > > > [  +0.000002]  el0t_64_sync_handler+0x84/0x140
> > > > [  +0.000002]  el0t_64_sync+0x1bc/0x1c0
> > > > 
> > > > To address this, initialise kexec_buf->random field properly.
> > > > 
> > > > Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > > 
> > > Thanks, I'll add a cc:stable to this.
> > 
> > This has been fixed in below series from Breno Leitao.
> > 
> > [PATCH 0/3] kexec: Fix invalid field access
> > https://lore.kernel.org/all/20250827-kbuf_all-v1-0-1df9882bb01a@debian.org/T/#u
> 
> Right, these fixes are on 6.18 since day one.
> 
> Yeoreum is hitting another code path that I haven't fixed, it seems
> (through image_load()).
> 
> That said, I think the fix should be similar to commit 04d3cd43700 ("arm64:
> kexec: initialize kexec_buf struct in load_other_segments()"). I.e:
> 
> 	--- a/arch/arm64/kernel/kexec_image.c
> 	+++ b/arch/arm64/kernel/kexec_image.c
> 	@@ -41,7 +41,7 @@ static void *image_load(struct kimage *image,
> 		struct arm64_image_header *h;
> 		u64 flags, value;
> 		bool be_image, be_kernel;
> 	-       struct kexec_buf kbuf;
> 	+       struct kexec_buf kbuf = {};
> 		unsigned long text_offset, kernel_segment_number;
> 		struct kexec_segment *kernel_segment;
> 		int ret;
> 

OK, I'll drop this patch, "arm64: kernel: initialize missing
kexec_buf->random field".



