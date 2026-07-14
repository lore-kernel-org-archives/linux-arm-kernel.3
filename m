Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD4CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Toi87y86wvz55CZ6zcfjueSEUU4iZG9WGYqGEehZdGU=; b=cvPEf2DgJfkzew
	95yR1mvqWIJidGsLPbS0mNJUCaAF0GhqRF2+cBAvoWvw5h0oa+Bror7k5G1AFm5NxsL7qXBF22F2P
	gc4/cwiUuz4rKUzOZQ8hjYjAuvxpLBmm0cajtBTCZ3l9fvBWTQQzvygUBbQizk/Om9FdA5SwxPzbc
	pQG+EflhOXX8lQNNFrIRcJy94oG2xmp/ou1kHrAsDalliGNdmNa34U599Jq+Sfl0vyCtihoj0Hd6A
	cjEy+Rs9vX7NvDvKg+XJUiZS/imcST9TXzqafvjLkifiPINsQUWy6MsBpPCZcV8eOJCWwSqG/VPvw
	nyXQoVOd4j2355hjVqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZsY-0000000BVmq-1XSs;
	Tue, 14 Jul 2026 09:56:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZsW-0000000BVmD-0Rxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:56:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3232D497;
	Tue, 14 Jul 2026 02:56:34 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 047C93F93E;
	Tue, 14 Jul 2026 02:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784022998; bh=HzgkXrSkLJxO7Fe75H/GQtv8pmd2A3idvyY8QNezjCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uokejyd8lcDl/LS7LQEzDuiaCKPxVFEwaMqR1LWaU5Q20Ko353N2ESaHA8Nvjr9pa
	 NK3CGZ9ubx5A5QUoD1mAPSOFPx+EmvUXalAKZYaYje7LN0zbjfhP0X6FKHW+ofMwsO
	 p+AixYd+Mudi3a/kHhe5DVFazT+9coIjh8HEOPeQ=
Message-ID: <527030eb-98f9-493b-9fc7-79d3503565e7@arm.com>
Date: Tue, 14 Jul 2026 10:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/36] arm64: irq: introduce a helper for GIC priority
 initialization
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-7-vladimir.murzin@arm.com>
 <33d2b833-d0a9-4bb2-ba74-cfe681b02d71@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <33d2b833-d0a9-4bb2-ba74-cfe681b02d71@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_025640_190554_FBFFFE37 
X-CRM114-Status: GOOD (  14.49  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/10/26 08:29, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
>> interrupt masking via DAIF and switch to masking via PMR.  This
>> depends on a very specific behaviour of `local_daif_restore()` which
>> will clear DAIF if masking interrupts via PMR, which will get removed
>> in the future.
>>
>> As `setup_arch()` cleared DA only earlier, introduce a dedicated
>> helper that explicitly initializes the PMR to mask interrupts and
>> clears DAIF, switching to IRQ priority masking.
> I believe that the `local_daif_restore(DAIF_PROCCTX_NOIRQ)` inside
> `setup_arch()` should be directly replaced with the following code.
> Otherwise, since the pseudo NMI has not yet taken effect at this point,
> it could lead to ambiguity.
> 
> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
> index 23c05dc7a8f2..35c5310783f4 100644
> --- a/arch/arm64/kernel/setup.c
> +++ b/arch/arm64/kernel/setup.c
> @@ -311,7 +311,8 @@ void __init __no_sanitize_address setup_arch(char
> **cmdline_p)
>          * IRQ and FIQ will be unmasked after the root irqchip has been
>          * detected and initialized.
>          */
> -       local_daif_restore(DAIF_PROCCTX_NOIRQ);
> +       write_sysreg(DAIF_PROCCTX_NOIRQ, daif);
> +       trace_hardirqs_off();

That's what follow up patches do, no?

Thanks
Vladimir


