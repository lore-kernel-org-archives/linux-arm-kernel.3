Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382FEF588E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CxDCNUG5qjJktCQIXsGg5yAN9JKuAtZahZxUMTkSBs=; b=dNK0v3mlEM6P9cD27rqdEHu2Pe
	CYG/xdHFSneTEL1hwZkPov05cLIaL4BKpZxwXMXrpZOeWVJ7vvIl0f+t9xCd96bIFgb+XOZGinERs
	JKi9CRiPWSFynPh6sN+htUAZ/9+b37630EhF27iQV8GVbIMJ208+TQwRE/BBxWG6fXDdBxm2tDV8Z
	uqV0RjrE6wXJJEZSrHO9PnFMQj/jU4gH29xhxR1nwNW/ZL7N4nc9yGJQf0aOyeJoclHKK5WO7INxx
	O9tSFjAK8OEsD6/+4kfiC3v8Bgl0b5TKqCo8E4VolwrDDmNlR7dKYQRkkVt4ChE5K+PxF4TLk84ib
	9rI0PzMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqIp-00000007E7m-36bc;
	Mon, 20 Apr 2026 15:12:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqIo-00000007E7Z-1DsS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:12:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9516C60145;
	Mon, 20 Apr 2026 15:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D006C2BCB4;
	Mon, 20 Apr 2026 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776697965;
	bh=AkblC8kko4q96b7WJ+PNC2zvLeLeNj9THfCDY3hArU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KI7W8t5/ljbsJM5Tc2oIgbBUVLkMg3SXyCjhscPwrECFw59NFmudoplIVD2+dGLGT
	 /6wkTTvcNyKsAtFe56JTM1Fwf1ntfRyk5dHtILh8aDNPHTiYBsoNfJFmzc0RR+EIUd
	 Q6NQTY4tu6aAi1nHP+wZ4/ZP01FyrUvZyEvGdEtznlxv3YcKF/dRfw/B4Oh+9iqj91
	 cSZv5l4fVjO/FZAvxo+cjuABOUEcn8WP1dCPr8Nl2i1s8T9vybTQK4/gGjNfzl0+5z
	 fd+a73D7/SaFCI3paj2KLhlYRwIgahSdcKapzBUAITpasQvHRGB98G3VOU1IQjpx23
	 9BhP+0IqF1KPw==
Date: Mon, 20 Apr 2026 16:12:38 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Huisong Li <lihuisong@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, pjaroszynski@nvidia.com,
	rmikey@meta.com, kernel-team@meta.com, stable@vger.kernel.org
Subject: Re: [PATCH] ACPI: arm64: cpuidle: Tolerate platforms with no deep
 PSCI idle states
Message-ID: <20260420-sturdy-unique-shark-c4ca8c@sudeepholla>
References: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-ffh-v1-1-6b4c10fec442@debian.org>
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

On Mon, Apr 20, 2026 at 02:27:13AM -0700, Breno Leitao wrote:
> Commit cac173bea57d ("ACPI: processor: idle: Rework the handling of
> acpi_processor_ffh_lpi_probe()") moved the acpi_processor_ffh_lpi_probe()
> call from acpi_processor_setup_cpuidle_dev(), where its return value was
> ignored, to acpi_processor_get_power_info(), where it is now treated as
> a hard failure. As a result, platforms where psci_acpi_cpu_init_idle()
> returned -ENODEV stopped registering any cpuidle states, forcing CPUs to
> busy-poll when idle.
> 
> On NVIDIA Grace (aarch64) systems with PSCIv1.1, pr->power.count is 1
> (only WFI, no deep PSCI states beyond it), so the previous
> "count = pr->power.count - 1; if (count <= 0) return -ENODEV;" check
> returned -ENODEV for all 72 CPUs and disabled cpuidle entirely.
> 
> The lpi_states count is already validated in acpi_processor_get_lpi_info(),
> so the check here is redundant. Simplify the loop to iterate over
> lpi_states[1..power.count). When only WFI is present, the loop body
> simply does not execute and the function returns 0, which is the correct
> outcome: there is nothing to validate for FFH and no error to report.
> 
> Suggested-by: Huisong Li <lihuisong@huawei.com>
> Cc: stable@vger.kernel.org
> Fixes: cac173bea57d ("ACPI: processor: idle: Rework the handling of acpi_processor_ffh_lpi_probe()")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/acpi/arm64/cpuidle.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/cpuidle.c b/drivers/acpi/arm64/cpuidle.c
> index 801f9c4501425..c68a5db8ebba8 100644
> --- a/drivers/acpi/arm64/cpuidle.c
> +++ b/drivers/acpi/arm64/cpuidle.c
> @@ -16,7 +16,7 @@
>  
>  static int psci_acpi_cpu_init_idle(unsigned int cpu)
>  {
> -	int i, count;
> +	int i;
>  	struct acpi_lpi_state *lpi;
>  	struct acpi_processor *pr = per_cpu(processors, cpu);
>  
> @@ -30,14 +30,10 @@ static int psci_acpi_cpu_init_idle(unsigned int cpu)
>  	if (!psci_ops.cpu_suspend)
>  		return -EOPNOTSUPP;
>  
> -	count = pr->power.count - 1;
> -	if (count <= 0)
> -		return -ENODEV;
> -

Does it make sense to retain this check like
  if (pr->power.count < 1)
  	return -EINVAL;

Though I see the assignment to pr->power.count in drivers/acpi/processor_idle.c
is through unsigned int. So I am fine even without the above check.

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

