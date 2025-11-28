Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CA4D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 12:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eV3DMGHKAc+dR//uzGFT/lJQENyL1NlTTEO9mqIUiwE=; b=3RqjMgOzlPLlCxMK+WWvNzMVIJ
	0o2U9wejFskKnkyr8SL8wz42u8w3wuZqfGzSjDQWrhZsCoduNZHdhL3OnB0FGFvGH9aWYPpGoU3jK
	UNPw5oBneqv7aNaZi2fjnzr8CnWZaRPEs8GyqHCs/e99/jyyIoUfJ0nRjjNukWhjRXokw5jnvm/5q
	dOWaqpxZ6m/O7UAjfohlYDvfszegFOk+g/+lFXT05YaAxBBQuRjC+xD49rlcM5B/z/0Br7GVAFWqG
	Ajf3KSUUBgu73rd571TSQ9HFCzSS42XhsR4meo6ipgEG9PpLqdz7DR3j+/AQ7DlMjGocxqJa5FbmE
	lUWE+cIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxOr-00000000PxF-1e2o;
	Fri, 28 Nov 2025 12:16:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOxOo-00000000PwQ-2CMR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 12:16:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8181B41ADE;
	Fri, 28 Nov 2025 12:16:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE09DC4CEF1;
	Fri, 28 Nov 2025 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764332189;
	bh=g4y7Hz328+8IEKpa4hdtQbueyA3WDjV4cr57ogp33So=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G37UNOEMVutj78J8T647ePZx7d1VxztQSsh1umig/8luofsMrnDLm0UwExHwKF9dP
	 laNDKvNkN4aVDE0bPRh24pdAM+yzwJBDRzVQeoD9UL18IY44VS3v35P/qX+kVF/VGa
	 fp2z8IiKHgmjfbah7KOxEgCtMAf4mS55b0UrC9MJIqoZ1LX6ROUzsKbs3glR+iZXp5
	 bIexMApL5XVic3oDZ6Ko5JG1DtlmXwgYvQ0+3XyCC93axjw3tvhVdmGIPeWFj0zwOE
	 LgX6lAEjv1kzJ3T0banFWSzAqmwpfQPbrg6aeaY92gAIQ+gSUx+R5JSZw1cfY9B6cH
	 vk7q9Aw02saFg==
Date: Fri, 28 Nov 2025 12:16:24 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, akpm@linux-foundation.org, bhe@redhat.com,
	leitao@debian.org, coxu@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kernel: initialize missing kexec_buf->random field
Message-ID: <aSmSmH5-8iXOErKw@willie-the-truck>
References: <20251127182644.1577592-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127182644.1577592-1-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_041630_627878_77BE597D 
X-CRM114-Status: GOOD (  19.02  )
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

On Thu, Nov 27, 2025 at 06:26:44PM +0000, Yeoreum Yun wrote:
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
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  arch/arm64/kernel/kexec_image.c        | 3 +++
>  arch/arm64/kernel/machine_kexec_file.c | 6 +++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
> index 532d72ea42ee..db6fb8c599a1 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -76,6 +76,9 @@ static void *image_load(struct kimage *image,
>  	kbuf.buf_min = 0;
>  	kbuf.buf_max = ULONG_MAX;
>  	kbuf.top_down = false;
> +#ifdef CONFIG_CRASH_DUMP
> +	kbuf.random = false;
> +#endif
> 
>  	kbuf.buffer = kernel;
>  	kbuf.bufsz = kernel_len;
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index 410060ebd86d..06f38866424a 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -94,7 +94,11 @@ int load_other_segments(struct kimage *image,
>  			char *initrd, unsigned long initrd_len,
>  			char *cmdline)
>  {
> -	struct kexec_buf kbuf = {};
> +	struct kexec_buf kbuf = {
> +#ifdef CONFIG_CRASH_DUMP
> +		.random = false,
> +#endif
> +	};

This hunk is pointless.

Will

