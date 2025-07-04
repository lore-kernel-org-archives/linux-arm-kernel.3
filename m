Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D55C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eU9A6sCtyHHWEDzOjJOjdCcUJnuYvsgXrCt0sIZbDwE=; b=O0O/l9ue2mil/weI8tCNrseyc+
	OLMTJsIYORTcoVlZO4NOjXhsPmH6rYQrkToZ8VcjSxadFmvvt+5cnjSkm4VIZJdwbMaB37XiR8bYt
	ydpBjjnS6JqoZ6/f+KBbUppUjcKyNmbHv3NQBDfwdPBilNuy0/tNT0UcB50G8mQNGAVV2ZOHsFJTY
	Cq4uYQgRX/C00+BLz5DAWf467xDzTAJDWdSvNxB7gYtJkVvqwLxXefej0js4qdxp/kafZplRN4eiO
	zp8/X7WfLx7cXUWH9gVetEdIsWP9yvwMVuVVIL9scaDJn7YLlAjv9fgQUZTb1SPgmfhb+pyh6ZGce
	Y5OAJHsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhK7-0000000EeyT-3G2R;
	Fri, 04 Jul 2025 14:23:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXh1z-0000000Ebk6-0njT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 14:04:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC0B61515;
	Fri,  4 Jul 2025 07:04:31 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EF303F63F;
	Fri,  4 Jul 2025 07:04:45 -0700 (PDT)
Date: Fri, 4 Jul 2025 15:04:43 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexandru Elisei <Alexandru.Elisei@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <20250704140443.GH1039028@e132581.arm.com>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_070447_275234_F125F99D 
X-CRM114-Status: GOOD (  20.72  )
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

On Tue, Jul 01, 2025 at 04:31:57PM +0100, James Clark wrote:
> DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
> buffer is enabled. Ensure that enabling the buffer comes after setting
> PMBPTR_EL1 by inserting an isb().
> 
> This only applies to guests for now, but in future versions of the
> architecture the PE will be allowed to behave in the same way.
> 
> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/perf/arm_spe_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
> index 3efed8839a4e..6235ca7ecd48 100644
> --- a/drivers/perf/arm_spe_pmu.c
> +++ b/drivers/perf/arm_spe_pmu.c
> @@ -537,6 +537,7 @@ static void arm_spe_perf_aux_output_begin(struct perf_output_handle *handle,
>  	limit += (u64)buf->base;
>  	base = (u64)buf->base + PERF_IDX2OFF(handle->head, buf);
>  	write_sysreg_s(base, SYS_PMBPTR_EL1);
> +	isb();

I know that you and Alexandru have discussed whether the isb() should
be placed here or after the out_write_limit label. I should have engaged
in the discussion earlier. Sorry for raising the question now.

My understanding is that isb() is not only for synchronizing the write
to PMBPTR_EL1. It also serves as a context synchronization event
between any other SPE register writes and the write to
SYS_PMBLIMITR_EL1.

Let me give an example (perhaps a rare one): if we use perf snapshot
mode or the AUX pause/resume mode, it's possible that the flow does
not trigger an interrupt via overflow. Instead, the sequence might
look like this:

  arm_spe_pmu_stop()
    `> arm_spe_pmu_start()
         `> arm_spe_perf_aux_output_begin()

In this case, to ensure that all SPE system registers are properly
written to the hardware, the safest approach is to always execute isb()
just before writing to SYS_PMBLIMITR_EL1. (In other words, after the
label out_write_limit).

Thanks,
Leo

>  out_write_limit:
>  	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> 
> -- 
> 2.34.1
> 
> 

