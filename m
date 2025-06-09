Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D4CC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngLRqOJu+QGW+8QQ+EmTlPD5rxHDKbXnUTJyrlcY6gE=; b=rXHnWQM6prhdx/cKKRm2xdabdw
	aVtXsNgDlD3tWXzI7Wz8vwa3mCWIXQQdyqKxMHx0eJJpZC6BUrvRZ0mibXm30CFweQLjU9x394GYv
	Hu277EkhmN615cZtXnrJOorRDAQyCL1ENii3YyxJ0+iByPMYib7JDfDoLBy2oUCduHGctI5NRU7eb
	H3IvHT8qjVlrUWeY2jbbSq96MQa3XQonQjW5iKU70sVAR/cseE4VQsfb77k3gZQXW47evFsOqGmFf
	y7k9HyuSjnDrOHyE3U5XgpayBaa6/egMuvVs09G2TTLirZObTfp9vDh1J58/PLOUEqUpOhepGPnaI
	l51FTORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOakC-000000041sH-0Wwb;
	Mon, 09 Jun 2025 11:32:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaSw-0000000407u-0SqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 11:14:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFFCC113E;
	Mon,  9 Jun 2025 04:14:34 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F9E3F59E;
	Mon,  9 Jun 2025 04:14:53 -0700 (PDT)
Date: Mon, 9 Jun 2025 12:14:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
Message-ID: <20250609111448.GI8020@e132581.arm.com>
References: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_041458_212346_FEBFCAA0 
X-CRM114-Status: GOOD (  18.86  )
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

On Mon, Jun 09, 2025 at 11:19:05AM +0100, James Clark wrote:
> DEN0154 states that hardware will be allowed to ignore writes to TRB*
> registers while the trace buffer is enabled. Add an ISB to ensure that
> it's disabled before clearing the other registers.
> 
> This is purely defensive because it's expected that arm_trbe_disable()
> would be called before teardown which has the required ISB.
> 
> Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130..10f3fb401edf 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
>  static void trbe_reset_local(struct trbe_cpudata *cpudata)
>  {
>  	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +	isb();
>  	trbe_drain_buffer();
>  	write_sysreg_s(0, SYS_TRBPTR_EL1);
>  	write_sysreg_s(0, SYS_TRBBASER_EL1);
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6
> 
> Best regards,
> -- 
> James Clark <james.clark@linaro.org>
> 
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org
> To unsubscribe send an email to coresight-leave@lists.linaro.org

