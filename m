Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60479CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNcjT24O2pnr3CmgXPl9bkzDi/H2o2rcLD/IVi8N4j8=; b=iGMcvUEM2RbkkC+l8m2oFioztD
	bMrA6APmjiKwdvUG6Oy4I+4bLNjA7dKtQMcgNOlyI95S8yHD2jJkQIxBcd9G1pXXqish8hCLyPUsy
	qLIROYNFrOftqR6hZRBTbznQfL253QqprA44vLnNXgtyyXdFayM+vOWheTCo30rno5EQ73n3Ybp6k
	K7NNPZ7SDFoMS7WGW+maANN++ZFJ/j70LT0SLGpe4h+Wl2m0dcylKzfccoQj862CzA7eU4ZIdQKL1
	+QPPj3Is5i4q36uPnELUJt9Jk7IQ4o3JrkNnTrIietNVP/TfGG2QGPOqyMVSvPlEjKfzXpVBRSaOe
	Hzj2380Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtzK-0000000ExP9-2wwT;
	Mon, 18 May 2026 09:10:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtzI-0000000ExNz-0zfd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:10:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6E11CC4;
	Mon, 18 May 2026 02:10:04 -0700 (PDT)
Received: from [10.57.21.187] (unknown [10.57.21.187])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EA993F632;
	Mon, 18 May 2026 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779095409; bh=yM606txQr59MpoGECD5z9Drm2fKlG81Jw2FQOPDpgSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=seFe9iOYMIYwwiVKx1to9xsbDK/AbJWa6O0xL7bVnuRBEVde8M7ZKY1k/QCk1WurF
	 mgXoL6ChaGT0Ai73++XxpriqutOChwTmZIGCveUVeXoYM8ZTzMFuuQxhWXj8twIyRP
	 54O0g52gMAEWxRyBcLzZgT9AM04V7Dg2vSli7Xn8=
Message-ID: <721c3b69-52c4-44db-821e-55998beb5248@arm.com>
Date: Mon, 18 May 2026 10:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Content-Language: en-GB
To: Kohei Enju <enju.kohei@fujitsu.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sami Mujawar <sami.mujawar@arm.com>, Gavin Shan <gshan@redhat.com>,
 Steven Price <steven.price@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260518033157.1865498-1-enju.kohei@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_021012_477554_61B983CE 
X-CRM114-Status: GOOD (  21.33  )
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

On 18/05/2026 04:31, Kohei Enju wrote:
> With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
> debug_smp_processor_id(). This debug function complains when certain
> conditions that ensure CPU ID stability are not met, specifically when
> it's called from a preemptible context.
> 
> In arm_cca_report_new(), which runs in a preemptible context,
> smp_processor_id() triggers a splat [0] due to this.
> 
> However, the CPU ID obtained here is used as the target CPU for
> smp_call_function_single() to designate a specific CPU for subsequent
> operations, not to assert that the current thread will continue to
> execute on the same CPU. Therefore, snapshotting the CPU ID itself is
> correct, and thus there's no actual harm except for the splat.
> 
> Use raw_smp_processor_id() instead, to directly retrieve the current CPU
> ID without the debug checks, avoiding the unnecessary warning message
> while preserving the correct functional behavior.
> 
> [0]
>   BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/134
>   caller is debug_smp_processor_id+0x20/0x2c
>   CPU: 0 UID: 0 PID: 134 Comm: cca-workload-at Not tainted 7.0.0-rc1-gc74a64d12073 #1 PREEMPT
>   Hardware name: linux,dummy-virt (DT)
>   Call trace:
>    [...]
>    check_preemption_disabled+0xf8/0x100
>    debug_smp_processor_id+0x20/0x2c
>    arm_cca_report_new+0x54/0x230
>    tsm_report_read+0x184/0x260
>    tsm_report_outblob_read+0x18/0x38
>    configfs_bin_read_iter+0xf4/0x1dc
>    vfs_read+0x230/0x31c
>    [...]
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>

Thank for the fix,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 0c9ea24a200c..2d450caee3e4 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -108,7 +108,7 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>   	 * allocate outblob based on the returned value from the 'init'
>   	 * call and that cannot be done in an atomic context.
>   	 */
> -	cpu = smp_processor_id();
> +	cpu = raw_smp_processor_id();
>   
>   	info.challenge = desc->inblob;
>   	info.challenge_size = desc->inblob_len;


