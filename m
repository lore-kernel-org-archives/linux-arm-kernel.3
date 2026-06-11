Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DE3CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 04:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mhnWDDxjM/RESZCI3jx40tanGqS+UOFdvF02IHkq1I=; b=iOggeCrV7Qi4QAsdv1WFJsFdVM
	UqUS3OdnCw1NwII7cYX5d6NpeS7hhrHgvEQsBAFZx+5Jkf1WDTHlyOVl2BAsDmt7Giz1ZJtn7s+X1
	hyPpDkegVvfMOLLQK+TVmPfjMJym6X2+ZIE27yovNDpIgJM1oIW5icAExm+dFRxJcYu7GI6aWZ1jM
	OXMnvuikoSq1M+5EMBJFuReFdf1mG8w69eLKSxAUgLMk7N8Io35bNxgkQbDmMYSGVtjNAi6e3H+LG
	bpvqBVATClS3ywb7awRwxiiFYuYSCW+XGRbzRRMEfj0nGEX4r7SKFkoX63yY9RvSM9h2/9T1FfA1R
	m95gAhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWgs-00000008epo-2F5p;
	Thu, 11 Jun 2026 04:06:50 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWgp-00000008eo9-1tAY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 04:06:49 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gbTb46rZQzKHMZD
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:05:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 1F0AB4058C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 12:06:31 +0800 (CST)
Received: from [10.67.111.192] (unknown [10.67.111.192])
	by APP2 (Coremail) with SMTP id Syh0CgBn3oNFNCpqRKCDBQ--.52639S2;
	Thu, 11 Jun 2026 12:06:30 +0800 (CST)
Message-ID: <1bc99f2d-3d79-4680-ba67-bafc6ebf0a48@huaweicloud.com>
Date: Thu, 11 Jun 2026 12:06:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: ftrace: prepare ftrace_modify_call() for use
 without CALL_OPS
Content-Language: en-US
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev,
 bpf@vger.kernel.org, Florent Revest <revest@chromium.org>,
 Puranjay Mohan <puranjay@kernel.org>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
 <20260609-arm64-ftrace-direct-calls-v1-1-4a46f266697f@linux.dev>
From: Xu Kuohai <xukuohai@huaweicloud.com>
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-1-4a46f266697f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgBn3oNFNCpqRKCDBQ--.52639S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF18Cw4ftFWUKF1UZFy8uFg_yoW8Zw4Upr
	WSk3Z8KrWUuF4vkayIg3W3WrWqkw40yry3KFWDW34Y9rn0vrWrKrsxC3ZrGrWDK3s7WFW7
	ZF1xZry5AF1DZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_210647_876392_FD026260 
X-CRM114-Status: GOOD (  16.76  )
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

On 6/9/2026 1:19 PM, Jose Fernandez (Anthropic) wrote:
> ftrace_modify_call() is guarded by CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> and calls ftrace_rec_set_ops(rec, arm64_rec_get_ops(rec)) directly,
> which only exists when CALL_OPS is enabled.
> 
> Generic ftrace also needs ftrace_modify_call() when
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is enabled, to retarget a
> callsite between two non-FTRACE_ADDR destinations, as happens when a
> direct trampoline is modified. The next patch allows DIRECT_CALLS without
> CALL_OPS, so widen the guard to cover both configurations and switch
> the body to the ftrace_rec_update_ops() wrapper, which already has a
> stub for the !CALL_OPS case. ftrace_make_call() already uses the same
> wrapper today.
> 
> No functional change: with CALL_OPS enabled, ftrace_rec_update_ops()
> expands to the exact call this replaces.
> 
> Assisted-by: Claude:unspecified
> Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
> ---
>   arch/arm64/kernel/ftrace.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
> index 5a1554a441628..e1a3c0b3a0514 100644
> --- a/arch/arm64/kernel/ftrace.c
> +++ b/arch/arm64/kernel/ftrace.c
> @@ -409,7 +409,8 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>   	return ftrace_modify_code(pc, old, new, true);
>   }
>   
> -#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
> +#if defined(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS) || \
> +	defined(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)
>   int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>   		       unsigned long addr)
>   {
> @@ -417,7 +418,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
>   	u32 old, new;
>   	int ret;
>   
> -	ret = ftrace_rec_set_ops(rec, arm64_rec_get_ops(rec));
> +	ret = ftrace_rec_update_ops(rec);
>   	if (ret)
>   		return ret;
>   
>
Acked-by: Xu Kuohai <xukuohai@huawei.com>


