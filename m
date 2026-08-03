Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCEEC55179
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pBge9jNymP1cfY1B4zQpIqkABJQaI2TRrQQikF3h88=; b=tZUpYqbbitUIe2rM0mifjG9ZL5
	XBqtzKDN52WKrSkOX+uNxEEwRfSVWETYImFBihLLfGLs6aMQgCyTq4rYlzuUE5cBkLsGuxOBvtxsN
	E98oe6t2sOmk+T96CpQ6RI3b5qlofSAm93c7wmngczyUX3aeAc2GXx1hYNVBxhKUkjtiWFeSf28um
	mwGEJaMGvAFdw+c/049n/BGlB21mnY16XFkiHoisjoTNzLm8ycHzx/mS+eDXIi+Z59SUgZYBaDaf0
	dnG+NWM7go/FPFkvkkY4zTRCXk9jUNmm42CLLMu6B9OhYtCix92TbMvn4ScxQKJCC5B7geasFYRXS
	R96bYI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrrI-0000000H2FO-2rYp;
	Mon, 03 Aug 2026 12:33:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqrrF-0000000H2F2-3jvO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 12:33:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD46143D;
	Mon,  3 Aug 2026 05:33:23 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805C43F66F;
	Mon,  3 Aug 2026 05:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785760407; bh=s3juHwRUrkZssk/ozMQpmsM6uPogbmE2d/PRMpal7cY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DtDyT23AC4/7KX+42TR2SSiNxeFraVPknriLM/GwEK3IpRrUt+mn23nrxw9MzklRK
	 s6yCse85pCBq46s4+H3K0DAZEHf00hMpf37z28QURRD+WFs74SqT6jzHXMBmEP5VfH
	 3+z9N7a2H1YbzJi08O4NDv+i+A/42yhnCK9QAaPQ=
Message-ID: <73f0c621-44ff-403f-9cae-d94095accf6c@arm.com>
Date: Mon, 3 Aug 2026 13:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 34/45] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-35-vladimir.murzin@arm.com>
 <f54fb8f7-2bf0-4fdb-bfc3-b11ccb924e64@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <f54fb8f7-2bf0-4fdb-bfc3-b11ccb924e64@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_053330_254823_3550D533 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

On 7/28/26 13:25, Jinjie Ruan wrote:
>> @@ -924,6 +967,20 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
>>  	 */
>>  	arm64_debug_exc_context(NOIRQ_CONTEXT);
>>  	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
>> +}
>> +
>> +static void noinstr el0_interrupt(struct pt_regs *regs,
>> +				  void (*handler)(struct pt_regs *))
>> +{
>> +	if (regs->pc & BIT(55))
>> +		arm64_apply_bp_hardening();
> It seems only after enter_from_user_mode() or irqentry_nmi_enter(), it
> is safe to call normal kernel code.

I do not think there is issue with that. Here is call chain:

arm64_apply_bp_hardening()           // always_inline
  -> alternative_has_cap_unlikely()  // always_inline
     -> cpucap_is_possible()         // always_inline
  -> fn()
      - qcom_link_stack_sanitisation // noinstr
      - call_hvc_arch_workaround_1   // noinstr
      - call_smc_arch_workaround_1   // noinstr

That's also in line with el0_ia(), el0_pc() and el0_softstp()
which call arm64_apply_bp_hardening() before enter_from_user_mode()

Cheers
Vladimir

