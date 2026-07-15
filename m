Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE23C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w99Cp+XWrdkMKPdohFNoYlWkxPIEzuGD9IUtizDtkRE=; b=TQ9KckzsgnlQ+V
	jhRppAKWFIjNXkcCyAyCj/mQ9NUK8lbBSLUMV4x8vuTg0furnNT6/VSehjpm+Urq3zFLGheX6rIUo
	EKQr6KYrcipRFeYoL7PJElPRIayZ3HudaBRIpFQpDqapR7sfXBraBfoy/VIxq9PgXk5M2lsjq5zDU
	cTJFoIrXPSgjfj/2RGWNlqxFCsxYiU9O/KUmEKTqZYeLgyr29p/5O6Psjjq14uvnXHjZsh/mFwBab
	meXjX96rrc8wClj80UZ+vPXBcDBMaVWAD9rW9/0DM4UyvGVYd4T/nPhqwosEkEAYsRteVBhzewFUH
	BIGbjQG+LbXaOb4Gpalw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz1G-0000000Eq1o-3Iv9;
	Wed, 15 Jul 2026 12:47:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz1E-0000000Eq1C-2Bj5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:47:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7211477;
	Wed, 15 Jul 2026 05:47:14 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7FAE3F7B4;
	Wed, 15 Jul 2026 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784119639; bh=/NST2K74OLJ5nBmJAAAejogeD4vbvLZi+9Z7MWmvC/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kubc/kEZVfXfo3OCRls345CiUIu54S6MXEI2q2nJMqED7rjR7zSwpXvpKHxO1AIPP
	 OepYRhYtAoKa/O2JPO6m3RxP2UzfwgQ2OZFZtsjwUAPrld+2MnrckZ0hLwBT+nL+xU
	 X/muppTnHgNJjDP+/Bak0r/zXOurZxgpShHaL098=
Message-ID: <9b6f47e9-6391-412b-b807-cdcb83c773d5@arm.com>
Date: Wed, 15 Jul 2026 13:47:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 14/36] arm64: interrupts: introduce generic interrupt
 masking helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-15-vladimir.murzin@arm.com>
 <4a035503-bda3-4a7a-a7e2-24c37702170c@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <4a035503-bda3-4a7a-a7e2-24c37702170c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_054720_628646_5768C0D8 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/14/26 13:45, Jinjie Ruan wrote:
>> +#else /* CONFIG_DEBUG_IRQFLAGS */
>> +static inline
>> +void local_all_irqs_cpu_init_mask(arm64_exc_context_t context)
>> +{
>> +	if (context == PROCESS_CONTEXT)
>> +		trace_hardirqs_on();
>> +	arm64_update_exc_context(context, true);
>> +}
>> +
>> +static inline void local_all_irqs_final_mask(void)
>> +{
>> +	arm64_update_exc_context(CRITICAL_CONTEXT, true);
>> +	trace_hardirqs_off();
>> +}
>> +#endif /* CONFIG_DEBUG_IRQFLAGS */
> The implementations of local_all_irqs_cpu_init_mask() and
> local_all_irqs_final_mask() are partially the same when the
> CONFIG_DEBUG_IRQFLAGS switch is enabled or not.
> 
> Should we provide only one version of the implementation and use
> CONFIG_DEBUG_IRQFLAGS to isolate the debug-related code?

It seems that for the debug code I either need to find an alternative
implementation or move it into a C file.

Thanks
Vladimir


