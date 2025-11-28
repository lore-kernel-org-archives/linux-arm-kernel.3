Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85327D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 13:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+NSL005NM4YnGcdzn7j+10+htbiU0hmC/YX6BE4WlE=; b=ClaT0HhmQ3aiq0AevNQd8uiCks
	hw+Aak+W+e3njrap2yWB4EPu961r1eRyIThdzB+vJCjf25zzDTJzle8j9yXkpv3ar49u5+tczPASQ
	5Xn0yZ0nelxdd7Hzqt7/tVKIcf/GCzCJoZnrBrpv1f0DFpKJs7cSmpcJ9urd4C9d1Z97f+nf3JNNK
	Eqf2uL/+mBRfzIa8LvgABynPmFIdPQG8QRs4o8ILKHNXs2o2UCYJ5knZgpgzX7rH4QGyBjw1JwMqh
	Bwq3A4rv/S1WpJqrVACBx7blpKlGr92fI3sXqWQ8B0WdKK5RsLvgw9rUD/Rd1H4Gtq4esqKxPsYyN
	EDEqldBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOywc-00000000VTp-3o0M;
	Fri, 28 Nov 2025 13:55:30 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOywY-00000000VRx-0yTw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 13:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R+NSL005NM4YnGcdzn7j+10+htbiU0hmC/YX6BE4WlE=; b=RMTSlrq8t4udaY24AJgVh116iI
	mZH8uVlgWjo5qhqnPG0fFcM2m93mxSNWHzsEj8fKC8TqUiIORo7mLYiVZHY+m+F7bU6rMTKGWVK9H
	+Kcf7/DBwBaaotw45sbtyBxwQAUx4amGYFjH19j+/ZzScf5jbGaJrTlCNqBGafHYYCcgOyq2IYyVi
	2OzGQOuvA4s9r9lnAInfppBZEKWMmZ8RwpjtRotEkz8yw9FmOHQQTqK7XSWqh80csj7/cEiBmw2fY
	wczij/Cp24EMF/9bPCcDBUKbUm9m0V1pHH26Ua93YP57jqGuDwYrz5CEo1aP6C4egiZ5ACLG3aKm1
	kWVSxP2Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vOywI-005tub-KH; Fri, 28 Nov 2025 13:55:11 +0000
Date: Fri, 28 Nov 2025 05:55:05 -0800
From: Breno Leitao <leitao@debian.org>
To: Baoquan He <bhe@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, pjw@kernel.org, 
	Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com, will@kernel.org, coxu@redhat.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <5wel6vqjwwf25hryvg6s7z6aaog7xc3zxjevupt3jn4gntme6d@74wwwmhvvelt>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
 <20251127113706.d89a84f277dab3ad273dde75@linux-foundation.org>
 <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSjqEQDv7V79V3Na@MiWiFi-R3L-srv>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_055528_586600_507DF190 
X-CRM114-Status: GOOD (  17.64  )
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


On Fri, Nov 28, 2025 at 08:17:21AM +0800, Baoquan He wrote:
> On 11/27/25 at 11:37am, Andrew Morton wrote:
> > On Thu, 27 Nov 2025 18:26:44 +0000 Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > 
> > > Commit bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > > introduced the kexec_buf->random field to enable random placement of
> > > kexec_buf.
> > > 
> > > However, this field was never properly initialized for kexec images
> > > that do not need to be placed randomly, leading to the following UBSAN
> > > warning:
> > > 
> > > [  +0.364528] ------------[ cut here ]------------
> > > [  +0.000019] UBSAN: invalid-load in ./include/linux/kexec.h:210:12
> > > [  +0.000131] load of value 2 is not a valid value for type 'bool' (aka '_Bool')
> > > [  +0.000003] CPU: 4 UID: 0 PID: 927 Comm: kexec Not tainted 6.18.0-rc7+ #3 PREEMPT(full)
> > > [  +0.000002] Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015
> > > [  +0.000000] Call trace:
> > > [  +0.000001]  show_stack+0x24/0x40 (C)
> > > [  +0.000006]  __dump_stack+0x28/0x48
> > > [  +0.000002]  dump_stack_lvl+0x7c/0xb0
> > > [  +0.000002]  dump_stack+0x18/0x34
> > > [  +0.000001]  ubsan_epilogue+0x10/0x50
> > > [  +0.000002]  __ubsan_handle_load_invalid_value+0xc8/0xd0
> > > [  +0.000003]  locate_mem_hole_callback+0x28c/0x2a0
> > > [  +0.000003]  kexec_locate_mem_hole+0xf4/0x2f0
> > > [  +0.000001]  kexec_add_buffer+0xa8/0x178
> > > [  +0.000002]  image_load+0xf0/0x258
> > > [  +0.000001]  __arm64_sys_kexec_file_load+0x510/0x718
> > > [  +0.000002]  invoke_syscall+0x68/0xe8
> > > [  +0.000001]  el0_svc_common+0xb0/0xf8
> > > [  +0.000002]  do_el0_svc+0x28/0x48
> > > [  +0.000001]  el0_svc+0x40/0xe8
> > > [  +0.000002]  el0t_64_sync_handler+0x84/0x140
> > > [  +0.000002]  el0t_64_sync+0x1bc/0x1c0
> > > 
> > > To address this, initialise kexec_buf->random field properly.
> > > 
> > > Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly")
> > 
> > Thanks, I'll add a cc:stable to this.
> 
> This has been fixed in below series from Breno Leitao.
> 
> [PATCH 0/3] kexec: Fix invalid field access
> https://lore.kernel.org/all/20250827-kbuf_all-v1-0-1df9882bb01a@debian.org/T/#u

Right, these fixes are on 6.18 since day one.

Yeoreum is hitting another code path that I haven't fixed, it seems
(through image_load()).

That said, I think the fix should be similar to commit 04d3cd43700 ("arm64:
kexec: initialize kexec_buf struct in load_other_segments()"). I.e:

	--- a/arch/arm64/kernel/kexec_image.c
	+++ b/arch/arm64/kernel/kexec_image.c
	@@ -41,7 +41,7 @@ static void *image_load(struct kimage *image,
		struct arm64_image_header *h;
		u64 flags, value;
		bool be_image, be_kernel;
	-       struct kexec_buf kbuf;
	+       struct kexec_buf kbuf = {};
		unsigned long text_offset, kernel_segment_number;
		struct kexec_segment *kernel_segment;
		int ret;

Thanks for fixing this new instance,
--breno

