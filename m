Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E333AD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tu+zEO5TOkBKXFztUIPVXvLAdzZuldCKDdzJCF1ev4M=; b=BlIrRjchrfXePZ+xuoJXZ3ERGA
	QgYlYvq+gNUcyEBUVco4TovlliRgt1eD7w8OdCMrTU1g9MuTna7fN6sMBvABrmQUY+kHsTQzrzoIO
	+XfQzaHiVJuFhRDafb6zXnAeKy2n70Y1wAqU/A4xY/sSiAxz2xmmyP5DY0WVTTLu5bdmA9Sl0JYRq
	70ZjG1lMu2D/X8shKs/IVJ6F01L9DuY0a4bTCR3+i8ZFuTWMbmR7tPCUjOq0nw3ECjp/EabiNFZtt
	YMZD7Jy3kDr+RPqgu/V3XF6u6igw0fryvZfUjhIh/u2ds7IKoeVswWGvjf2wzcMRonfyLP49i8sCY
	eAcI9KIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2HR-00000003TT3-1TAP;
	Mon, 01 Dec 2025 11:41:21 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2HP-00000003TSd-0rB9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 11:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Tu+zEO5TOkBKXFztUIPVXvLAdzZuldCKDdzJCF1ev4M=; b=vL1VDFsrqQNlkN5Oc2T82kOo0u
	ZyfXAi0lr2o+5iAi6NCziRKAomHRQqtpTgOBzxYxQ45eW4jQk/IjNTS+uwp3Sis+7jiZO4nrLXhEQ
	b61kTJHV7wsDbYjlTQ2Tdd5awFC/BysYexfkwArOGWTYUjN7/+Ttdsx8/0+tm27jS1Q5TrsZgXM7R
	7I/iZW4pW2Dh4k+ZW1GWAwrBalOVLmLFDD+arbgAGKZz0+3EcWh82YKEgsouS2aBpLFm/Lj9hFlOq
	MheFo7lliNOJ3OxuHNEF1lK6YS1LAx5NJ3Y3RR2etNfGCaoyxofqg+HSLpaRRO7quFOYE2slaINI3
	9SdcEFGg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vQ2HJ-000bzf-M1; Mon, 01 Dec 2025 11:41:13 +0000
Date: Mon, 1 Dec 2025 03:41:08 -0800
From: Breno Leitao <leitao@debian.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: akpm@linux-foundation.org, pjw@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, coxu@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: kernel: initialize missing kexec_buf->random
 field
Message-ID: <guxpoj5tie3qunqn5vsqbc5mtmcq5a77acbwl6wmdbyxf7gjls@m2dlxkiiysl4>
References: <20251201105118.2786335-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201105118.2786335-1-yeoreum.yun@arm.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_034119_270728_F78509E8 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, Dec 01, 2025 at 10:51:18AM +0000, Yeoreum Yun wrote:
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
> Suggested-by: Breno Leitao <leitao@debian.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Breno Leitao <leitao@debian.org>

Thanks for the fix,
--breno

