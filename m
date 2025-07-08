Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F4C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+wbnEjzJXQXVA/vf7SiUsb6uKq6onYprcXLKK/yVOY=; b=m1cjSwzeQk+HAhbk6yCbLsdDQh
	Cg8Q5iLEWP6jgmhiu4aZ9+sNegCpya+Q/1SjEhOjaXEGQSsuJozoDQLoXWf3CioR7kEJpgjr+Jgo8
	eKUzaJyMBedaVBsgfwCKJ12yEJ73k3h2JS2A/NlDtUpPyiqo6k4N8w23Hcqn3rrCua1TDZbhl9U+k
	tZcuWEA3tVyPZ64xlgYdDV11ka/ceuCSWHARFE04WAq5aPUmEIlz4g1PcO9kGsfLYT6cQ4l1qGatg
	Wbmknunuz7Nl2oZ1BK/3P5anOcHjNu8xm+bGGLqFnSL1Y/86xOal/SQHRvUExi2qiN9gTO8yDQu+1
	N4JH9Uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Ww-00000005dhj-2NJV;
	Tue, 08 Jul 2025 14:42:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ9Ua-00000005dHA-0wZY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 14:40:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F2B153B;
	Tue,  8 Jul 2025 07:40:04 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D20E23F694;
	Tue,  8 Jul 2025 07:40:14 -0700 (PDT)
Date: Tue, 8 Jul 2025 15:40:04 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <Anshuman.Khandual@arm.com>,
	Rob Herring <Rob.Herring@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	Robin Murphy <Robin.Murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] perf: arm_spe: Add barrier before enabling profiling
 buffer
Message-ID: <aG0tsz1EPbrDFTia@raptor>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_074020_306696_18F6D6C0 
X-CRM114-Status: GOOD (  22.32  )
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

Hi James,

On Tue, Jul 01, 2025 at 04:31:57PM +0100, James Clark wrote:
> DEN0154 states that PMBPTR_EL1 must not be modified while the profiling
> buffer is enabled. Ensure that enabling the buffer comes after setting
> PMBPTR_EL1 by inserting an isb().
> 
> This only applies to guests for now, but in future versions of the
> architecture the PE will be allowed to behave in the same way.
> 
> Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")

A note on why I think this is a fix.

The write to PMBLIMITR_EL1 serves two purposes: to enable the buffer and to set
the limit for the new buffer. The statistical profiling unit (I'm calling it
SPU) performs indirect reads of the registers. Without the ISB between the
buffer pointer write and the write that enables + sets limit for the buffer, I
think it's possible for the SPU to observe the PMBLIMITR_EL1 write before the
PMBPTR_EL1 write. During this time, from the point of view of the SPU, the
buffer is incorrectly programmed, and potentially the old PMBPTR_EL1.PTR > new
PMBLIMITR_EL1.Limit.

arm_spe_perf_aux_output_begin() can be called after sampling has been enabled
(PMSCR_EL1.E1SPE = 1).

Putting it all together, this means that we have all the conditions to break the
restrictions on the current write pointer and the behaviour is UNPREDICTABLE, as
per section D17.7.1, ARM DDI 0487L. I think it's worth pointing out that the SPU
can do any of the folling in this situation: writing to any writable virtual
address in the current owning translation regime (!), generate a profiling
management event, discard all data or don't enable profiling.

Thanks,
Alex

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
>  
>  out_write_limit:
>  	write_sysreg_s(limit, SYS_PMBLIMITR_EL1);
> 
> -- 
> 2.34.1
> 

