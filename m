Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B9C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgKlPbWZZXKeznfsYICDciTjPFizLXKBxvlDVfuQxck=; b=fi137bt6pDOeTMd+FlY8bBX9tP
	NmifUoSvgI0nm8ETcU064n8js2Coyy25BfeeNrKH3TRpKVbJI7K61hVpD8CmhfCgtCiv1DQsFRcJz
	I8ubWS90uwJj8Tu0t4d6Kfvv4n3THX+gouNraZbFC9kKRqQ0TfWjBbAn/HJ/XMsXVtwkclmcOCWRm
	hxloMvuZBn8uY33cIVJYoXq0voRC/lmWRuXbwGFnA7iWfuEL5VivrINmxYaEpdv6b9h4pCg+NGGqv
	dVEmpm9kd2rymjSlxf44d0S7TqyurUHCV3ePAp9PPdjvT6OxNfn0cplNA5SBVosPpQg6vYeUGHPGR
	iS9FO73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWZz-00000004fCp-3bik;
	Wed, 23 Jul 2025 10:20:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWHB-00000004bKa-21ut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 10:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D58BA45D40;
	Wed, 23 Jul 2025 10:00:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5A8C4CEF5;
	Wed, 23 Jul 2025 10:00:36 +0000 (UTC)
Date: Wed, 23 Jul 2025 11:00:33 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/8] arm64: probes: Add GCS support to bl/blr/ret
Message-ID: <aICywZ55EKfSYSIY@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-6-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719043740.4548-6-jeremy.linton@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_030041_543741_D5B0FA9A 
X-CRM114-Status: GOOD (  20.50  )
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

On Fri, Jul 18, 2025 at 11:37:37PM -0500, Jeremy Linton wrote:
> diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
> index 09a0b36122d0..c75dce7bbe13 100644
> --- a/arch/arm64/kernel/probes/simulate-insn.c
> +++ b/arch/arm64/kernel/probes/simulate-insn.c
> @@ -13,6 +13,7 @@
>  #include <asm/traps.h>
>  
>  #include "simulate-insn.h"
> +#include "asm/gcs.h"
>  
>  #define bbl_displacement(insn)		\
>  	sign_extend32(((insn) & 0x3ffffff) << 2, 27)
> @@ -49,6 +50,20 @@ static inline u32 get_w_reg(struct pt_regs *regs, int reg)
>  	return lower_32_bits(pt_regs_read_reg(regs, reg));
>  }
>  
> +static inline void update_lr(struct pt_regs *regs, long addr)
> +{
> +	int err = 0;
> +
> +	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
> +		push_user_gcs(addr + 4,	 &err);
> +		if (err) {
> +			force_sig(SIGSEGV);
> +			return;
> +		}
> +	}
> +	procedure_link_pointer_set(regs, addr + 4);
> +}
> +
>  static bool __kprobes check_cbz(u32 opcode, struct pt_regs *regs)
>  {
>  	int xn = opcode & 0x1f;
> @@ -107,9 +122,8 @@ simulate_b_bl(u32 opcode, long addr, struct pt_regs *regs)
>  {
>  	int disp = bbl_displacement(opcode);
>  
> -	/* Link register is x30 */
>  	if (opcode & (1 << 31))
> -		set_x_reg(regs, 30, addr + 4);
> +		update_lr(regs, addr);

Why not pass (addr + 4) here and skip the addition in update_lr()?

>  
>  	instruction_pointer_set(regs, addr + disp);
>  }
> @@ -133,17 +147,26 @@ simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
>  	/* update pc first in case we're doing a "blr lr" */
>  	instruction_pointer_set(regs, get_x_reg(regs, xn));
>  
> -	/* Link register is x30 */
>  	if (((opcode >> 21) & 0x3) == 1)
> -		set_x_reg(regs, 30, addr + 4);
> +		update_lr(regs, addr);
>  }

I can see why this function was originally updating PC (in case of a blr
lr) but updating the LR was not supposed to fail. With GCS, I think we
should follow similar logic to simulate_b_bl() and skip updating PC/LR
if the write to the GCS failed (assuming that's what the hardware does,
I haven't checked the spec).

>  void __kprobes
>  simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
>  {
> -	int xn = (opcode >> 5) & 0x1f;
> +	u64 ret_addr;
> +	int err = 0;
> +	unsigned long lr = procedure_link_pointer(regs);
>  
> -	instruction_pointer_set(regs, get_x_reg(regs, xn));
> +	if (user_mode(regs) && task_gcs_el0_enabled(current)) {
> +		ret_addr = pop_user_gcs(&err);
> +		if (err || ret_addr != lr) {
> +			force_sig(SIGSEGV);
> +			return;
> +		}
> +	}
> +
> +	instruction_pointer_set(regs, lr);
>  }

What happened to the RET Xn case?

-- 
Catalin

