Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9700AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 04:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5gtSemNRL51B059zq8J3ohSiMSjlcwUy2BSTTUkS90=; b=pEbKokw604UmPF
	gzI1d4uEoAf5UnJC/M6pDLM5vxevXpX9XXB15wVUHNTkF+VdrFY0+h3OrnlS0mdaxiS3lsRN7CdLh
	/OlofkzgrLaJv1qJ3zBxhHDPUg2OCnapxRqDrc2IY44AVp/B57PtzQAbVqPB6T5tS5q9FdTkznwDd
	Ro6Vr2B5VSVsZ2k1AiMVo8IaZHzOLa0/ZzW/yZyE7B8g8vWqTWQhORFapS3vgMiNvvmx9wIzEgZkj
	8B9aEtOTXXF5wCDJKOGllHvA2mJjUUwTSG+zVO6+7qXDn6lQJLBlLc2a/xICs1nPiD8RhB2redN6k
	p3k3qnreggggrN7/ok1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovUy-00000006nsr-0wvd;
	Wed, 29 Jul 2026 04:02:28 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovUu-00000006ns6-2Slm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 04:02:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=w5gtSemNRL51B059zq8J3ohSiMSjlcwUy2BSTTUkS90=;
	b=ZfKoZUTybESeEONtqqnvHd+6/Uf95MSzdaH1cxT7igMiKQ1FqwRUGMM7/JfMF8BceLXc/dfhl
	LhSwvew0VTuvbh+XGbR4H5+LGA7LPsOO60fz5fs14BIqgTuuMMNBxpfxvNl8Nobgc8F7sQnSaAP
	16FH+pObtb3MiU9yi5DzHqE=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h8z1v04swz1cyPB;
	Wed, 29 Jul 2026 11:52:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 7261D4057A;
	Wed, 29 Jul 2026 12:02:16 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 12:02:15 +0800
Message-ID: <ffcf7916-e1d4-464f-b30e-50ce07035b69@huawei.com>
Date: Wed, 29 Jul 2026 12:02:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/13] arm64: ptrace: Always inline
 pt_regs_[read,write}_reg()
To: Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260728123859.2911495-1-mark.rutland@arm.com>
 <20260728123859.2911495-4-mark.rutland@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260728123859.2911495-4-mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_210225_005516_5FDDED1F 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: vladimir.murzin@arm.com, peterz@infradead.org, maz@kernel.org, hca@linux.ibm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/7/28 20:38, Mark Rutland 写道:
> In subsequent patches we'll want to use pt_regs_read_reg() and
> pt_regs_write_reg() in noinstr code.
> 
> To ensure noinstr safety, both functions must be inlined into their
> caller. As both functions are marked as 'inline' rather than
> '__always_inline', that's not strictly guaranteed, and the compiler is
> permitted to generate out-of-line copies.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Mark both functions as '__always_inline' to ensure this.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Vladimir Murzin <vladimir.murzin@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/include/asm/ptrace.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
> index 39582511ad72f..a1aa668aad50e 100644
> --- a/arch/arm64/include/asm/ptrace.h
> +++ b/arch/arm64/include/asm/ptrace.h
> @@ -268,7 +268,8 @@ static inline u64 regs_get_register(struct pt_regs *regs, unsigned int offset)
>   * Read a register given an architectural register index r.
>   * This handles the common case where 31 means XZR, not SP.
>   */
> -static inline unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
> +static __always_inline unsigned long
> +pt_regs_read_reg(const struct pt_regs *regs, int r)
>  {
>  	return (r == 31) ? 0 : regs->regs[r];
>  }
> @@ -277,8 +278,8 @@ static inline unsigned long pt_regs_read_reg(const struct pt_regs *regs, int r)
>   * Write a register given an architectural register index r.
>   * This handles the common case where 31 means XZR, not SP.
>   */
> -static inline void pt_regs_write_reg(struct pt_regs *regs, int r,
> -				     unsigned long val)
> +static __always_inline void
> +pt_regs_write_reg(struct pt_regs *regs, int r, unsigned long val)
>  {
>  	if (r != 31)
>  		regs->regs[r] = val;


