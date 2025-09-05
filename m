Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE99BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSXdQvhjLqn/cnLmBxmZ8XUh4olkXbYzp0sAqc3/Ow4=; b=TYOwRcS13Y77JVj/4IHCBdC3os
	zL8qJHpv/bWai1PIas96gTiFtlIIeIBgGA3KKbEdC4xt6RxD1BspKvhUii2/t72Ay7iazNob7sxGb
	MATAJf16Gn9amImGm5fUq0iJBqb4sMzvwG9pKQpNu2Bv88Lfq1YzR/nzgMLGMQWLy+pZhuY9gKxsI
	UWeLWDQc7e+xI/ic1PR2macPVOegoettUfN+qpoqMOaVEo1SH23ZITCTxNdSm6a7YDTNKbHnPVlcA
	BGG513J0npPGfuV0yqK4pNrxHQzq2wDSP8ZyXV7MQu54p5khnSKlnS/qrxabkXdn1oFfhLdTzStww
	kHeMPmfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugW7-00000005SrQ-3As8;
	Sat, 06 Sep 2025 00:10:56 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuao5-00000003fU3-2KDL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 18:05:09 +0000
Message-ID: <3e113599-2d99-4585-af14-a93cafe11d33@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757095500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSXdQvhjLqn/cnLmBxmZ8XUh4olkXbYzp0sAqc3/Ow4=;
	b=dfTqhICYs5bofpSfYNxjoM/fGywq3OzgNiQFG5yvYF11d9CeT3Vr10t4WSBJ0QFkHWxCX+
	xtx8N7PkiYSt1x6cDmZo5fRgu9Ab7wTZ0C/m1nJZEJ/OleEqCkOlIQC2A2mqiX0dbDBwqy
	HNi1WtovwHMzIWb4Vjc8YqoPllsRUcc=
Date: Fri, 5 Sep 2025 11:04:55 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] drivers/perf: riscv: Remove redundant ternary operators
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "open list:RISC-V PMU DRIVERS" <linux-riscv@lists.infradead.org>,
 "moderated list:ARM PMU PROFILING AND DEBUGGING"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250828122510.30843-1-liaoyuanhong@vivo.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
Content-Language: en-US
In-Reply-To: <20250828122510.30843-1-liaoyuanhong@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_110507_728419_FA525075 
X-CRM114-Status: GOOD (  13.22  )
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


On 8/28/25 5:25 AM, Liao Yuanhong wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>   drivers/perf/riscv_pmu_sbi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 698de8ddf895..c18dbffa9834 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -339,7 +339,7 @@ static bool pmu_sbi_ctr_is_fw(int cidx)
>   	if (!info)
>   		return false;
>   
> -	return (info->type == SBI_PMU_CTR_TYPE_FW) ? true : false;
> +	return info->type == SBI_PMU_CTR_TYPE_FW;
>   }
>   
>   /*

Reviewed-by: Atish Patra <atishp@rivosinc.com>


