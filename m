Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0E9CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbPyBXQWWdx+WR4mApd/1BAvw/8yGwJkkCydKu+HaaU=; b=VJaHoc9kKDkAQHL+gZB32O0dqj
	b2zuWzePbPrLjaZvNrEAiOvC/n9RTfoo5QDjb0gclU1bFzAqZ2/dPQWA4E2lIm+LrZbNAe9/Ruwd8
	XH1LfDqGImiBUJ8MHdhaTebVBeQTvJAHleGa7vAix6qBNn4Z7X5m0UKNAj5QGOdfomhW9uPrP7ZJ5
	zwAiUzlRnnyO1gld00QqIUzdh5b7ondgxuiqXv3SwhXiUPz+UnzerWDgHMHgG+uVn/ahl+ra/kEzg
	YVLJbmmqHqmbSRBXA/6rFvSVq0L07h/wjEvRHiWD9d9rYeXYaK+9qJQBOfEjga+rLI8DdQcpuAnEs
	kuSyRBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwUM-000000090VU-0ujq;
	Fri, 15 May 2026 17:38:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwUJ-000000090Um-3KrL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:38:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B1D2938;
	Fri, 15 May 2026 10:38:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 207583F85F;
	Fri, 15 May 2026 10:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778866692; bh=XEycm8eYssAjnCZNLbDv7JJVATYjSdnsuzYgO1XDp+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MI3w3dH+UPzim1X/P6jFkXTnuyVGjynvC+VfRg4w8eS7ebQbTs5p9g7QbcoJHg2Dy
	 fSbotGF1UsN//t/yzvEpx256db/FNoZdZOTq4+uAHPNjhoAZPG6I1vKXk+ATi2LlDT
	 MU+glhWSARJAtcjlz0XJiN/VZKfFoSPo0LJNAxPc=
Date: Fri, 15 May 2026 18:38:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Qi Xi <xiqi2@huawei.com>
Cc: will@kernel.org, sunnanyong@huawei.com, wangkefeng.wang@huawei.com,
	benniu@meta.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Faster Arm64 __arch_copy_from_user and
 __arch_copy_to_user
Message-ID: <agdaAPtmPekOKzCx@arm.com>
References: <20260316123100.82932-1-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316123100.82932-1-xiqi2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_103815_971306_E9817B00 
X-CRM114-Status: GOOD (  27.11  )
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

Hi Qi,

On Mon, Mar 16, 2026 at 08:31:00PM +0800, Qi Xi wrote:
> Based on Ben Niu's "Faster Arm64 __arch_copy_from_user and
> __arch_copy_to_user" patch [1], this implementation further optimizes
> and simplifies user space copies by:
> 
> 1. Limiting optimization scope to >=128 bytes copies where PAN state matters.
>    For <128 bytes copies, the implementation uses non-privileged
>    instructions uniformly, simplifying the code and reducing maintenance
>    cost.

At least this part makes the changes more manageable.

> 2. Adding "arm64.nopan" cmdline support using the standard idreg-override
>    framework, allowing runtime PAN disable without building separate
>    CONFIG_ARM64_PAN=y/n kernels as required by Ben Niu's version.
>    The implementation maintains separate paths for PAN-enabled (using
>    unprivileged ldtr/sttr) and PAN-disabled (using standard ldp/stp), with
>    runtime selection via ALTERNATIVE() at the large copy loop entry.

I think you got them the other way around. Your new code requires PAN=0
to be able to use the privileged STP/LDP. However, disabling PAN does
not mean STTR/LDTR are no longer needed and the kernel should use
STP/LDP for uaccess.

Even on hardware without PAN, having STTR/LDTR is still very useful (we
had them on get/put_user() from the start; later fully used in the user
copy routines once we got rid of KERNEL_DS). They prevent accessing
kernel location with a user-controlled address if somehow they escape
access_ok() (and we did have bugs in this area). This has nothing to do
with PAN.

You don't even need PAN disabled globally for your code to work, just
toggle PAN briefly for the routine, similar to what we had since commit
338d4f49d6f7 ("arm64: kernel: Add support for Privileged Access Never").
Presumably for large copies, the PAN setting is lost in the noise.

That said, I don't think we should reduce the security in mainline for
this optimisation. And we should definitely not gate it on arm64.nopan
(more like a less_secure_uaccess_but_faster_on_some_hardware=1).

> 3. Retaining the critical path optimization from the original patch:
>    reducing pointer update instructions through manual batch updates,
>    processing 64 bytes per iteration with only one pair of add instructions.
> 
> Performance improvements measured on Kunpeng 920 with PAN disabled:
[...]
> Real-world workloads:
> - RocksDB read-write mixed workload:
>   Overall throughput improved by 2%.
>   copy_to_user hotspot reduced from 3.3% to 2.7% of total CPU cycles.
>   copy_from_user hotspot reduced from 2.25% to 0.85% of total CPU cycles.
> 
> - BRPC rdma_performance (server side, baidu_std protocol over TCP):
>   copy_to_user accounts for ~11.5% of total CPU cycles.
>   After optimization, server CPU utilization reduced from 64% to 62%
>   (2% absolute improvement, equivalent to ~17% reduction in
>   copy_to_user overhead)

I agree there are some small improvements but it would be good to
reproduce them on other hardware as well.

> +	/*
> +	* interlace the load of next 64 bytes data block with store of the last
> +	* loaded 64 bytes data.
> +	*/
> +	stp_unpriv	A_l, A_h, dst, #0
> +	ldp_unpriv	A_l, A_h, src, #0
> +	stp_unpriv	B_l, B_h, dst, #16
> +	ldp_unpriv	B_l, B_h, src, #16
> +	stp_unpriv	C_l, C_h, dst, #32
> +	ldp_unpriv	C_l, C_h, src, #32
> +	stp_unpriv	D_l, D_h, dst, #48
> +	ldp_unpriv	D_l, D_h, src, #48
> +	add	dst, dst, #64
> +	add	src, src, #64
> +	subs	count, count, #64
> +	b.ge	1b
> +	b	.Llarge_done

This changes the semantics a bit, especially in the copy_from_user()
path. With your patch, we can write into the kernel buffer until, say,
offset #32. On the offset #48 ldp we get a fault but #dst has never been
updated, so we report nothing copied (almost, we have the fault path
attempting one more byte copy).

For copy_to_user(), we have some imp def behaviour already where a
faulting unaligned store at the end of a page may or may not write the
end of the page. Past discussions concluded that under-reporting on
copy_to_user(). Whether that's also fine for copy_from_user(), not sure.
I think Robin tried to address these at some point. There's also a
proposal for a kunit usercopy test for boundary conditions but we
couldn't agree on the semantics (architectures behave differently here):

https://lore.kernel.org/r/20230321122514.1743889-1-mark.rutland@arm.com/

We do run these internally but it would be good to get them upstream
before any other changes to this code.

-- 
Catalin

