Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B405AF532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 01:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNDeRudiFrfeaRo+PV5E/mL3K6Ey03i3VpH8rFuxUVc=; b=k6bBIPfRi8K/IkbyTQfyyhtWdq
	c8FwxdHSNgCzGadGrRkf5q/6d2MzhQ7yb7F75rs5DWX1uTOpS0lAd/JjwBCETXJSOdryPvTf/uHvE
	GrD6Q7s3v7VmnMIYum832tVohI65M4KBviyN05iPCLSiMDqNR6wHpm4/vLMLnFTC10niYiMLd9vA/
	8/w63qgFcpErYPtA93KZqo9zl9ELyKmsOp+YPZF8w0qr7gFlMMAXcKyBtKwL97cU5BhWOJ0tjp4kX
	dZwYMTfkpoS3lkH6lw39UGecxlM06RisrMKqz68tHtueziQY+UHQJFyO/OuAuoKBk9s995cP+VTyw
	WKHWbz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qwe-00000000KvY-2yfq;
	Tue, 24 Mar 2026 01:52:36 +0000
Received: from [113.46.200.224] (helo=canpmsgout09.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4qwa-00000000KuL-47tJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 01:52:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XNDeRudiFrfeaRo+PV5E/mL3K6Ey03i3VpH8rFuxUVc=;
	b=PPptQTkwUgKB6Gr7+OtkRJHbnt4JPP0wr3GXZX9ioXtlU5eVdCNi2nwPJ5gFSnnRlHNAqv8Mv
	FJyzQhxRskYx7El+HObXgYzVMlMzZwTp5P3Mxm7ePdynPIVAejqOoaooUTuvnYUUgFEHgkd8Zqx
	PeLF/c2rgt3gLpRncGFtcvc=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4fftDF5FW7z1cyPZ;
	Tue, 24 Mar 2026 09:46:05 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id ADB6E40565;
	Tue, 24 Mar 2026 09:52:09 +0800 (CST)
Received: from kwepemn200010.china.huawei.com (7.202.194.133) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 09:52:09 +0800
Received: from [10.174.178.56] (10.174.178.56) by
 kwepemn200010.china.huawei.com (7.202.194.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 09:52:08 +0800
Message-ID: <bc153304-1a0b-4e92-963b-1da00d571018@huawei.com>
Date: Tue, 24 Mar 2026 09:52:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Faster Arm64 __arch_copy_from_user and
 __arch_copy_to_user
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <sunnanyong@huawei.com>, <wangkefeng.wang@huawei.com>, <benniu@meta.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robin.murphy@arm.com>, <tujinjiang@huawei.com>
References: <20260316123100.82932-1-xiqi2@huawei.com>
Content-Language: en-GB
From: Qi Xi <xiqi2@huawei.com>
In-Reply-To: <20260316123100.82932-1-xiqi2@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.56]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn200010.china.huawei.com (7.202.194.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_185233_717999_AA8468F0 
X-CRM114-Status: GOOD (  23.59  )
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

Kindly ping.

Also add Robin Murphy to CC.

On 16/03/2026 20:31, Qi Xi wrote:
> Based on Ben Niu's "Faster Arm64 __arch_copy_from_user and
> __arch_copy_to_user" patch [1], this implementation further optimizes
> and simplifies user space copies by:
>
> 1. Limiting optimization scope to >=128 bytes copies where PAN state matters.
>     For <128 bytes copies, the implementation uses non-privileged
>     instructions uniformly, simplifying the code and reducing maintenance
>     cost.
> 2. Adding "arm64.nopan" cmdline support using the standard idreg-override
>     framework, allowing runtime PAN disable without building separate
>     CONFIG_ARM64_PAN=y/n kernels as required by Ben Niu's version.
>     The implementation maintains separate paths for PAN-enabled (using
>     unprivileged ldtr/sttr) and PAN-disabled (using standard ldp/stp), with
>     runtime selection via ALTERNATIVE() at the large copy loop entry.
> 3. Retaining the critical path optimization from the original patch:
>     reducing pointer update instructions through manual batch updates,
>     processing 64 bytes per iteration with only one pair of add instructions.
>
> Performance improvements measured on Kunpeng 920 with PAN disabled:
>
> The ku_copy microbenchmark [2] (a kernel module that measures
> copy_to/from_user throughput across various sizes by copying 1GB of
> data in each test):
> copy_to_user throughput change (positive = improvement):
> 128B: +0.9%   256B: +10.3%  512B: +23.3%  1024B: +38.1%
> 2048B: +56.2% 4096B: +68.5% 8192B: +74.8% 16384B: +79.7%
> 32768B: +80.7% 65536B: +81.3% 131072B: +77.3% 262144B: +77.9%
> copy_from_user throughput change:
> 128B: +2.0%   256B: +7.5%   512B: +20.3%  1024B: +28.4%
> 2048B: +38.1% 4096B: +39.6% 8192B: +41.5% 16384B: +42.3%
> 32768B: +42.2% 65536B: +44.8% 131072B: +70.3% 262144B: +71.0%
>
> Real-world workloads:
> - RocksDB read-write mixed workload:
>    Overall throughput improved by 2%.
>    copy_to_user hotspot reduced from 3.3% to 2.7% of total CPU cycles.
>    copy_from_user hotspot reduced from 2.25% to 0.85% of total CPU cycles.
>
> - BRPC rdma_performance (server side, baidu_std protocol over TCP):
>    copy_to_user accounts for ~11.5% of total CPU cycles.
>    After optimization, server CPU utilization reduced from 64% to 62%
>    (2% absolute improvement, equivalent to ~17% reduction in
>    copy_to_user overhead)
>
> [1] https://lore.kernel.org/all/20251018052237.1368504-2-benniu@meta.com/
> [2] https://github.com/mcfi/benchmark/tree/main/ku_copy
>
> Co-developed-by: Ben Niu <benniu@meta.com>
> Signed-off-by: Ben Niu <benniu@meta.com>
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
> Signed-off-by: Qi Xi <xiqi2@huawei.com>
> ---
> Changes in v3:
> - Limiting optimization scope to >=128 bytes copies.
> - Use idreg-override for PAN runtime selection with "arm64.nopan" cmdline.
> ---
>   arch/arm64/include/asm/asm-uaccess.h  |  22 ++----
>   arch/arm64/kernel/pi/idreg-override.c |   2 +
>   arch/arm64/lib/copy_from_user.S       |  17 +++-
>   arch/arm64/lib/copy_template.S        | 108 +++++++++++++++++++-------
>   arch/arm64/lib/copy_to_user.S         |  17 +++-
>   5 files changed, 114 insertions(+), 52 deletions(-)
>
> diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
> index 9148f5a31968..198a05d478fc 100644
> --- a/arch/arm64/include/asm/asm-uaccess.h
> +++ b/arch/arm64/include/asm/asm-uaccess.h
> @@ -70,27 +70,21 @@ alternative_else_nop_endif
>    * This is complicated as there is no post-increment or pair versions of the
>    * unprivileged instructions, and USER() only works for single instructions.
>    */
> -	.macro user_ldp l, reg1, reg2, addr, post_inc
> -8888:		ldtr	\reg1, [\addr];
> -8889:		ldtr	\reg2, [\addr, #8];
> -		add	\addr, \addr, \post_inc;
> +	.macro user_ldst l, inst, reg, addr, post_inc
> +8888:		\inst		\reg, [\addr];
> +		add		\addr, \addr, \post_inc;
>   
>   		_asm_extable_uaccess	8888b, \l;
> -		_asm_extable_uaccess	8889b, \l;
>   	.endm
>   
> -	.macro user_stp l, reg1, reg2, addr, post_inc
> -8888:		sttr	\reg1, [\addr];
> -8889:		sttr	\reg2, [\addr, #8];
> -		add	\addr, \addr, \post_inc;
> +	.macro user_ldst_index l, inst, reg, addr, val
> +8888:		\inst		\reg, [\addr, \val];
>   
> -		_asm_extable_uaccess	8888b,\l;
> -		_asm_extable_uaccess	8889b,\l;
> +		_asm_extable_uaccess	8888b, \l;
>   	.endm
>   
> -	.macro user_ldst l, inst, reg, addr, post_inc
> -8888:		\inst		\reg, [\addr];
> -		add		\addr, \addr, \post_inc;
> +	.macro user_ldst_pair_index l, inst, reg1, reg2, addr, val
> +8888:		\inst		\reg1, \reg2, [\addr, \val];
>   
>   		_asm_extable_uaccess	8888b, \l;
>   	.endm
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index bc57b290e5e7..ac26f1f3aad4 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -64,6 +64,7 @@ static const struct ftr_set_desc mmfr1 __prel64_initconst = {
>   	.override	= &id_aa64mmfr1_override,
>   	.fields		= {
>   		FIELD("vh", ID_AA64MMFR1_EL1_VH_SHIFT, mmfr1_vh_filter),
> +		FIELD("pan", ID_AA64MMFR1_EL1_PAN_SHIFT, NULL),
>   		{}
>   	},
>   };
> @@ -249,6 +250,7 @@ static const struct {
>   	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
>   	{ "arm64.no32bit_el0",		"id_aa64pfr0.el0=1" },
>   	{ "arm64.nompam",		"id_aa64pfr0.mpam=0 id_aa64pfr1.mpam_frac=0" },
> +	{ "arm64.nopan",		"id_aa64mmfr1.pan=0" },
>   };
>   
>   static int __init parse_hexdigit(const char *p, u64 *v)
> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
> index 400057d607ec..1f578c4d0ae6 100644
> --- a/arch/arm64/lib/copy_from_user.S
> +++ b/arch/arm64/lib/copy_from_user.S
> @@ -44,12 +44,21 @@
>   	str \reg, [\ptr], \val
>   	.endm
>   
> -	.macro ldp1 reg1, reg2, ptr, val
> -	user_ldp 9997f, \reg1, \reg2, \ptr, \val
> +	.macro ldp_unpriv reg1, reg2, ptr, val
> +	user_ldst_index 9997f, ldtr, \reg1, \ptr, \val
> +	user_ldst_index 9997f, ldtr, \reg2, \ptr, \val + 8
>   	.endm
>   
> -	.macro stp1 reg1, reg2, ptr, val
> -	stp \reg1, \reg2, [\ptr], \val
> +	.macro stp_unpriv reg1, reg2, ptr, val
> +	stp \reg1, \reg2, [\ptr, \val]
> +	.endm
> +
> +	.macro ldp_priv reg1, reg2, ptr, val
> +	user_ldst_pair_index 9997f, ldp, \reg1, \reg2, \ptr, \val
> +	.endm
> +
> +	.macro stp_priv reg1, reg2, ptr, val
> +	stp \reg1, \reg2, [\ptr, \val]
>   	.endm
>   
>   	.macro cpy1 dst, src, count
> diff --git a/arch/arm64/lib/copy_template.S b/arch/arm64/lib/copy_template.S
> index 7f2f5a0e2fb9..5ef6dc9bf7d8 100644
> --- a/arch/arm64/lib/copy_template.S
> +++ b/arch/arm64/lib/copy_template.S
> @@ -97,14 +97,20 @@ alternative_else_nop_endif
>   	cmp	tmp1w, #0x20
>   	b.eq	1f
>   	b.lt	2f
> -	ldp1	A_l, A_h, src, #16
> -	stp1	A_l, A_h, dst, #16
> +	ldp_unpriv	A_l, A_h, src, #0
> +	stp_unpriv	A_l, A_h, dst, #0
> +	add	src, src, #16
> +	add	dst, dst, #16
>   1:
> -	ldp1	A_l, A_h, src, #16
> -	stp1	A_l, A_h, dst, #16
> +	ldp_unpriv	A_l, A_h, src, #0
> +	stp_unpriv	A_l, A_h, dst, #0
> +	add	src, src, #16
> +	add	dst, dst, #16
>   2:
> -	ldp1	A_l, A_h, src, #16
> -	stp1	A_l, A_h, dst, #16
> +	ldp_unpriv	A_l, A_h, src, #0
> +	stp_unpriv	A_l, A_h, dst, #0
> +	add	src, src, #16
> +	add	dst, dst, #16
>   .Ltiny15:
>   	/*
>   	* Prefer to break one ldp/stp into several load/store to access
> @@ -142,14 +148,16 @@ alternative_else_nop_endif
>   	* Less than 128 bytes to copy, so handle 64 here and then jump
>   	* to the tail.
>   	*/
> -	ldp1	A_l, A_h, src, #16
> -	stp1	A_l, A_h, dst, #16
> -	ldp1	B_l, B_h, src, #16
> -	ldp1	C_l, C_h, src, #16
> -	stp1	B_l, B_h, dst, #16
> -	stp1	C_l, C_h, dst, #16
> -	ldp1	D_l, D_h, src, #16
> -	stp1	D_l, D_h, dst, #16
> +	ldp_unpriv	A_l, A_h, src, #0
> +	stp_unpriv	A_l, A_h, dst, #0
> +	ldp_unpriv	B_l, B_h, src, #16
> +	ldp_unpriv	C_l, C_h, src, #32
> +	stp_unpriv	B_l, B_h, dst, #16
> +	stp_unpriv	C_l, C_h, dst, #32
> +	ldp_unpriv	D_l, D_h, src, #48
> +	stp_unpriv	D_l, D_h, dst, #48
> +	add	src, src, #64
> +	add	dst, dst, #64
>   
>   	tst	count, #0x3f
>   	b.ne	.Ltail63
> @@ -161,30 +169,70 @@ alternative_else_nop_endif
>   	*/
>   	.p2align	L1_CACHE_SHIFT
>   .Lcpy_body_large:
> +	/* Runtime PAN decision for large copies */
> +	ALTERNATIVE("b .Llarge_pan_disabled", "b .Llarge_pan_enabled", ARM64_HAS_PAN)
> +
> +.Llarge_pan_enabled:
> +	/* PAN enabled version - use unprivileged loads (ldp_unpriv) */
>   	/* pre-get 64 bytes data. */
> -	ldp1	A_l, A_h, src, #16
> -	ldp1	B_l, B_h, src, #16
> -	ldp1	C_l, C_h, src, #16
> -	ldp1	D_l, D_h, src, #16
> +	ldp_unpriv	A_l, A_h, src, #0
> +	ldp_unpriv	B_l, B_h, src, #16
> +	ldp_unpriv	C_l, C_h, src, #32
> +	ldp_unpriv	D_l, D_h, src, #48
> +	add	src, src, #64
> +1:
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
> +
> +.Llarge_pan_disabled:
> +	/* PAN disabled version - use normal loads without post-increment */
> +	/* pre-get 64 bytes data using normal loads */
> +	ldp_priv	A_l, A_h, src, #0
> +	ldp_priv	B_l, B_h, src, #16
> +	ldp_priv	C_l, C_h, src, #32
> +	ldp_priv	D_l, D_h, src, #48
> +	add	src, src, #64
>   1:
>   	/*
>   	* interlace the load of next 64 bytes data block with store of the last
>   	* loaded 64 bytes data.
>   	*/
> -	stp1	A_l, A_h, dst, #16
> -	ldp1	A_l, A_h, src, #16
> -	stp1	B_l, B_h, dst, #16
> -	ldp1	B_l, B_h, src, #16
> -	stp1	C_l, C_h, dst, #16
> -	ldp1	C_l, C_h, src, #16
> -	stp1	D_l, D_h, dst, #16
> -	ldp1	D_l, D_h, src, #16
> +	stp_priv	A_l, A_h, dst, #0
> +	ldp_priv	A_l, A_h, src, #0
> +	stp_priv	B_l, B_h, dst, #16
> +	ldp_priv	B_l, B_h, src, #16
> +	stp_priv	C_l, C_h, dst, #32
> +	ldp_priv	C_l, C_h, src, #32
> +	stp_priv	D_l, D_h, dst, #48
> +	ldp_priv	D_l, D_h, src, #48
> +	add	dst, dst, #64
> +	add	src, src, #64
>   	subs	count, count, #64
>   	b.ge	1b
> -	stp1	A_l, A_h, dst, #16
> -	stp1	B_l, B_h, dst, #16
> -	stp1	C_l, C_h, dst, #16
> -	stp1	D_l, D_h, dst, #16
> +
> +.Llarge_done:
> +	/* Post-loop: store the last block of data using stp_unpriv */
> +	/* (without post-increment) */
> +	stp_unpriv	A_l, A_h, dst, #0
> +	stp_unpriv	B_l, B_h, dst, #16
> +	stp_unpriv	C_l, C_h, dst, #32
> +	stp_unpriv	D_l, D_h, dst, #48
> +	add	dst, dst, #64
>   
>   	tst	count, #0x3f
>   	b.ne	.Ltail63
> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> index 819f2e3fc7a9..9738ae96c823 100644
> --- a/arch/arm64/lib/copy_to_user.S
> +++ b/arch/arm64/lib/copy_to_user.S
> @@ -43,12 +43,21 @@
>   	user_ldst 9997f, sttr, \reg, \ptr, \val
>   	.endm
>   
> -	.macro ldp1 reg1, reg2, ptr, val
> -	ldp \reg1, \reg2, [\ptr], \val
> +	.macro ldp_unpriv reg1, reg2, ptr, val
> +	ldp \reg1, \reg2, [\ptr, \val]
>   	.endm
>   
> -	.macro stp1 reg1, reg2, ptr, val
> -	user_stp 9997f, \reg1, \reg2, \ptr, \val
> +	.macro stp_unpriv reg1, reg2, ptr, val
> +	user_ldst_index 9997f, sttr, \reg1, \ptr, \val
> +	user_ldst_index 9997f, sttr, \reg2, \ptr, \val + 8
> +	.endm
> +
> +	.macro ldp_priv reg1, reg2, ptr, val
> +	ldp \reg1, \reg2, [\ptr, \val]
> +	.endm
> +
> +	.macro stp_priv reg1, reg2, ptr, val
> +	user_ldst_pair_index 9997f, stp, \reg1, \reg2, \ptr, \val
>   	.endm
>   
>   	.macro cpy1 dst, src, count

