Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7A1D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iAQtJTtj1yfrHdLDvgWWtqZ4mTMlYZUEp2uH7qiL9s=; b=nw2nyvkI7FjtKBOry7DsWyzDq/
	W9xrEsf3DqSGL/KlAah6vl9bCmjVnWXDvVMMq/dv/hUCnmgajxwS7ub/dc/kJ5qxbgHXTyFQp2dH5
	lVhmFzbCkLB5cy0SVAbwg+ApSeMRlXIW4gz6HnE16owlLKjC4CHi2H9poFfXp2Ffafkrv9ILAujYo
	by8yOS5BheM58rQmOoq+YG0p1qDTzYPXD358wVedXqLiPkWEbK2hGJJ/EnYrtg55LlveBugko1hNQ
	p/b3c9zyxHXFhO7Osn4l7uWMFjv7t/2BQ1cdC4iNspXEPL4OW/kBML3g2RMAjcpyKNVPILSZQg6xz
	b4UmCKXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0cC-00000003FXN-1SeB;
	Mon, 01 Dec 2025 09:54:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0c9-00000003FVL-3xAW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 09:54:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3989497;
	Mon,  1 Dec 2025 01:54:27 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 612AB3F73B;
	Mon,  1 Dec 2025 01:54:33 -0800 (PST)
Date: Mon, 1 Dec 2025 09:54:25 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Baoquan He <bhe@redhat.com>, Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, pjw@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, coxu@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <aS1l0QqJSebgCg6f@J2N7QTR9R3>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
 <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
 <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
 <5wel6vqjwwf25hryvg6s7z6aaog7xc3zxjevupt3jn4gntme6d@74wwwmhvvelt>
 <aSmrUGnZp0UeTp1E@J2N7QTR9R3>
 <aS0Ch3hrYPDXomDC@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS0Ch3hrYPDXomDC@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_015438_097681_F5C139C7 
X-CRM114-Status: GOOD (  24.97  )
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

On Mon, Dec 01, 2025 at 10:50:47AM +0800, Baoquan He wrote:
> On 11/28/25 at 02:01pm, Mark Rutland wrote:
> > On Fri, Nov 28, 2025 at 05:55:05AM -0800, Breno Leitao wrote:
> > > 
> > > On Fri, Nov 28, 2025 at 08:17:21AM +0800, Baoquan He wrote:
> > > > On 11/27/25 at 11:37am, Andrew Morton wrote:
> > > > > On Thu, 27 Nov 2025 18:26:44 +0000 Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > > > 
> > > > > > Commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > > > > > introduced the kexec_buf->random field to enable random placement of
> > > > > > kexec_buf.
> > > > > > 
> > > > > > However, this field was never properly initialized for kexec images
> > > > > > that do not need to be placed randomly, leading to the following UBSAN
> > > > > > warning:
> > > > > > 
> > > > > > [  +0.364528] ------------[ cut here ]------------
> > > > > > [  +0.000019] UBSAN: invalid-load in ./include/linux/kexec.h:210:12
> > > > > > [  +0.000131] load of value 2 is not a valid value for type 'bool' (aka '_Bool')
> > > > > > [  +0.000003] CPU: 4 UID: 0 PID: 927 Comm: kexec Not tainted 6.18.0-rc7+ #3 PREEMPT(full)
> > > > > > [  +0.000002] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
> > > > > > [  +0.000000] Call trace:
> > > > > > [  +0.000001]  show_stack+0x24/0x40 (C)
> > > > > > [  +0.000006]  __dump_stack+0x28/0x48
> > > > > > [  +0.000002]  dump_stack_lvl+0x7c/0xb0
> > > > > > [  +0.000002]  dump_stack+0x18/0x34
> > > > > > [  +0.000001]  ubsan_epilogue+0x10/0x50
> > > > > > [  +0.000002]  __ubsan_handle_load_invalid_value+0xc8/0xd0
> > > > > > [  +0.000003]  locate_mem_hole_callback+0x28c/0x2a0
> > > > > > [  +0.000003]  kexec_locate_mem_hole+0xf4/0x2f0
> > > > > > [  +0.000001]  kexec_add_buffer+0xa8/0x178
> > > > > > [  +0.000002]  image_load+0xf0/0x258
> > > > > > [  +0.000001]  __arm64_sys_kexec_file_load+0x510/0x718
> > > > > > [  +0.000002]  invoke_syscall+0x68/0xe8
> > > > > > [  +0.000001]  el0_svc_common+0xb0/0xf8
> > > > > > [  +0.000002]  do_el0_svc+0x28/0x48
> > > > > > [  +0.000001]  el0_svc+0x40/0xe8
> > > > > > [  +0.000002]  el0t_64_sync_handler+0x84/0x140
> > > > > > [  +0.000002]  el0t_64_sync+0x1bc/0x1c0
> > > > > > 
> > > > > > To address this, initialise kexec_buf->random field properly.
> > > > > > 
> > > > > > Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > > > > 
> > > > > Thanks, I'll add a cc:stable to this.
> > > > 
> > > > This has been fixed in below series from Breno Leitao.
> > > > 
> > > > [PATCH 0/3] kexec: Fix invalid field access
> > > > https://lore.kernel.org/all/20250827-kbuf_all-v1-0-1df9882bb01a@debian.org/T/#u
> > > 
> > > Right, these fixes are on 6.18 since day one.
> > > 
> > > Yeoreum is hitting another code path that I haven't fixed, it seems
> > > (through image_load()).
> > > 
> > > That said, I think the fix should be similar to commit 04d3cd43700 ("arm64:
> > > kexec: initialize kexec_buf struct in load_other_segments()"). I.e:
> > > 
> > > 	--- a/arch/arm64/kernel/kexec_image.c
> > > 	+++ b/arch/arm64/kernel/kexec_image.c
> > > 	@@ -41,7 +41,7 @@ static void *image_load(struct kimage *image,
> > > 		struct arm64_image_header *h;
> > > 		u64 flags, value;
> > > 		bool be_image, be_kernel;
> > > 	-       struct kexec_buf kbuf;
> > > 	+       struct kexec_buf kbuf = {};
> > > 		unsigned long text_offset, kernel_segment_number;
> > > 		struct kexec_segment *kernel_segment;
> > > 		int ret;
> > 
> > FWIW, I completey agree; your proposal is a much better solution.
> 
> Yes, maybe Yeoreum or Breno can post a new version to fix it on arm64.

Yep; I hope that Yeoreum will spin a v2 to that effect.

> > From a quick scan, it looks like loongarch also has some more dodgy
> > instances:
> 
> In the latest mainline kernel, the problem on loongarch has gone.

Ah, yep, all the loongarch instances were fixed in v6.18-rc6 by commit:

  df16b8956cae9700 ("LoongArch: kexec: Initialize the kexec_buf structure")

Mark.

