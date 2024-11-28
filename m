Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545BFD69107
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 13:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qz6Kmlg0d0OPRbFYwGdMjR/tRfl12Ao7QNMqs7DW0R8=; b=qxwK3PAU1la//6R0afnGrQ1Bv+
	UZiyvEynueSkoGvjT92WCrTeSJgujPZGhruN7xTnN/4buDS31n1bg7yliiUOKbCOpytrD7FReu5VM
	gymCwtz6vc8nLghwlezEy7wv3mqLbHaFEczui2YqcqhcuqXfF9mnTmvbUbVJYQhexjkZZajc83laG
	sUzLlAeky7xW+x3QmmYnwbhFiDtHOpXMDp2eOwfV2Mm0GtS6F9Votr+IPwpxiNJ1aSKFe+nIWJOJ0
	RYUnDLW9RFpOaiaW5HfPVhs4F4Tw169rtln4zK1UmEeukVCy942VIUag3XUFKCLnwdJ3C9djwF+bY
	av4OpnZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeJL-0000000Fb9H-1FnQ;
	Thu, 28 Nov 2024 13:11:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeIM-0000000Fb1C-3YLL;
	Thu, 28 Nov 2024 13:11:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3B1E60003;
	Thu, 28 Nov 2024 13:10:53 +0000 (UTC)
Message-ID: <77b7b44f-e05a-4845-8d45-0e0d831bb8e7@ghiti.fr>
Date: Thu, 28 Nov 2024 14:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drivers/perf: riscv: Fix Platform firmware event data
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241119-pmu_event_info-v1-2-a4f9691421f8@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_051059_148007_E1A14116 
X-CRM114-Status: GOOD (  21.24  )
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

Hi Atish,

On 19/11/2024 21:29, Atish Patra wrote:
> Platform firmware event data field is allowed to be 62 bits for
> Linux as uppper most two bits are reserved to indicate SBI fw or
> platform specific firmware events.
> However, the event data field is masked as per the hardware raw
> event mask which is not correct.
>
> Fix the platform firmware event data field with proper mask.
>
> Fixes: f0c9363db2dd ("perf/riscv-sbi: Add platform specific firmware event handling")
>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>   arch/riscv/include/asm/sbi.h |  1 +
>   drivers/perf/riscv_pmu_sbi.c | 12 +++++-------
>   2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 98f631b051db..9be38b05f4ad 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -158,6 +158,7 @@ struct riscv_pmu_snapshot_data {
>   };
>   
>   #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
> +#define RISCV_PMU_PLAT_FW_EVENT_MASK GENMASK_ULL(61, 0)
>   #define RISCV_PMU_RAW_EVENT_IDX 0x20000
>   #define RISCV_PLAT_FW_EVENT	0xFFFF
>   
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index cb98efa9b106..50cbdbf66bb7 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -508,7 +508,6 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   {
>   	u32 type = event->attr.type;
>   	u64 config = event->attr.config;
> -	u64 raw_config_val;
>   	int ret;
>   
>   	/*
> @@ -529,21 +528,20 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   	case PERF_TYPE_RAW:
>   		/*
>   		 * As per SBI specification, the upper 16 bits must be unused
> -		 * for a raw event.
> +		 * for a hardware raw event.
>   		 * Bits 63:62 are used to distinguish between raw events
>   		 * 00 - Hardware raw event
>   		 * 10 - SBI firmware events
>   		 * 11 - Risc-V platform specific firmware event
>   		 */
> -		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
> +
>   		switch (config >> 62) {
>   		case 0:
>   			ret = RISCV_PMU_RAW_EVENT_IDX;
> -			*econfig = raw_config_val;
> +			*econfig = config & RISCV_PMU_RAW_EVENT_MASK;
>   			break;
>   		case 2:
> -			ret = (raw_config_val & 0xFFFF) |
> -				(SBI_PMU_EVENT_TYPE_FW << 16);
> +			ret = (config & 0xFFFF) | (SBI_PMU_EVENT_TYPE_FW << 16);
>   			break;
>   		case 3:
>   			/*
> @@ -552,7 +550,7 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
>   			 * Event data - raw event encoding
>   			 */
>   			ret = SBI_PMU_EVENT_TYPE_FW << 16 | RISCV_PLAT_FW_EVENT;
> -			*econfig = raw_config_val;
> +			*econfig = config & RISCV_PMU_PLAT_FW_EVENT_MASK;
>   			break;
>   		}
>   		break;
>

It seems independent from the other patches, so I guess we should take 
it for 6.13 rcX.

Let me know if that's not the case.

Thanks,

Alex


