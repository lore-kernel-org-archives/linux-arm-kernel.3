Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6F3CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aU/NRL2oLxZ2DnXVkFd7+Bw/wjN5pvJIRFoHjvjfSfo=; b=rIShyiI3Nys6GWQ+Z7pVPBmtpF
	cz1JqsrNPHSzedp17Vs/23CkkKZDmdzi16IB8tPXXS0G1urZtdd0iv4PgnnaSRz9b4tcFONZt1kbY
	nKdmiSUlfOKAstr5OwPv+tg6Tl67gyrr9cxZejAQw3NjfXpqBhCQXYBVoMUb+UIluJb0M+PuoqS/p
	8ESs96O4/FVjVSe4h231Hq+TF9Szfo/4s0HcwZA4rODY0FCDn7fwPe7WP6B9rYyQsO2h2ryZlyppW
	QhbnFDRtz4Z8sm200ELXDJ2c8JoNrX7pYuQlqu/OEdg/DhOqPrS2otmfIEpGEg0oCkrxtMuWLOESn
	i+ejpN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfiU-00000001DNi-424U;
	Mon, 08 Sep 2025 17:31:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvc7t-0000000HRaz-3MpG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 13:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B33A41B2D;
	Mon,  8 Sep 2025 13:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26BEC4CEF1;
	Mon,  8 Sep 2025 13:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757338905;
	bh=5Y6zB1qVaCtl+YF3/faf9NgPIS00Q6EHARjCuoSy/qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g8W7qxmNLbGkQ93uu6yJqdVytHhALtWK7oEdZdybtGb4lyHpDwzbTzGFutE6320Z0
	 uumIRcToNZEJbKatO6LOzxCeaPS/L60s58s6t67vmdbvGSYSuCp7BrnP5cTtJrnwzV
	 /xPXoGkO0aW1r7cQpTodWapvivb0hotP+djAvzMkoIww8LvoLUmzAW9464/cZMdacJ
	 h5xXvc2C8EgwubOSbcJ7TgfWWoTARDTCcbkSaW48oR78SSd9CPfGB9jcYp3ttdZcNh
	 hQJ8VUxcMQMHHZTHRdlqwQJAw2MVhIBzjJsozWnqxNmHahiC+VeCK5wDR/Gp7fTNv8
	 /GjE+8diBybBQ==
Date: Mon, 8 Sep 2025 14:41:40 +0100
From: Will Deacon <will@kernel.org>
To: James Clark <james.clark@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
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
Message-ID: <aL7dFIzEgiEETcIb@willie-the-truck>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-james-spe-vm-interface-v1-1-52a2cd223d00@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_064145_864663_7472407C 
X-CRM114-Status: GOOD (  18.43  )
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


Hmm.

arm_spe_perf_aux_output_begin() is only called in two places:

1. From arm_spe_pmu_start()
2. From arm_spe_pmu_irq_handler()

For (1), we know that profiling is disabled by PMSCR_EL1.ExSPE.
For (2), we know that profiling is disabled by PMBSR_EL1.S.

In both cases, we already have an isb() before enabling profiling again
so I don't understand what this additional isb() is achieving.

Will

