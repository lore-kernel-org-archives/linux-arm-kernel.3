Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D0EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Kbji2sayN/ZCQ8yYAe9FFIWnzya+4WbBU4GO1OL5gw=; b=QfrvCYmp2Q/zfU
	OfY3asEYvFyKex6uBAPT2UNlMn5tbHIQ3xg2rD/JBPNkWbzclFs6jV60sP17hgpzEEHBexC7A4tIB
	VlEqygJxRCSo8hlvvh0cJCO7GUe7SlJuIVIdkiF4iXcl9ZzO/vYq6nz7mHH2aIUCTicOLuhXlgFr3
	w18go2w1Ak+awLyUqh6MTMRKrgtXeDcrn8dJWQtEE2bvulPx9Da2thknThJlFWhW60Tx9G/Y3Oemq
	ydc3V3qnht7NjhSQM1OmDSnNWDo+6gItkCTWM/vqN+xG86HWADtyp1f1cpNvGYNFoICUob2Uo+jVI
	/RpkCqItUWnnxWmxBf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcbR-0000000C01T-02ur;
	Tue, 14 Jul 2026 12:51:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcbO-0000000C01A-2A0F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:51:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC141477;
	Tue, 14 Jul 2026 05:51:05 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F26F23F7B4;
	Tue, 14 Jul 2026 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784033469; bh=M15q9K1rH4f+4PzYaCuSN/pFVzEJ7RsnoqK80QhsIcI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BbjhatgUgQ4E2V60NXSDjN73fvpSA8OdFtT97s4ji4xERFAqN2drgltT0oup/LgmG
	 B2IJDKbvdLKr153wGgjnA8ye6wiDa5ySmCowoo6ednAHFET0/x2ldXoN7/9CSgkmBS
	 npTaS4YvpIkXK2eZBiifpgItBSkoOeqIRxAI1EPE=
Message-ID: <0111c537-bf49-4ccb-b37f-10ce212bafe5@arm.com>
Date: Tue, 14 Jul 2026 13:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/36] arm64: cpuidle: use new helpers to bypass
 interrupt priority masking
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-17-vladimir.murzin@arm.com>
 <d47d4a67-6bca-49a0-87d6-a82816566045@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <d47d4a67-6bca-49a0-87d6-a82816566045@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_055110_690096_2FD0AFB9 
X-CRM114-Status: UNSURE (   7.39  )
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

On 7/13/26 09:28, Jinjie Ruan wrote:
>> diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
>> index 2047713e097d..0c7ccdaf1832 100644
>> --- a/arch/arm64/include/asm/cpuidle.h
>> +++ b/arch/arm64/include/asm/cpuidle.h
>> @@ -5,22 +5,17 @@
>>  #include <asm/proc-fns.h>
>>  
>>  #ifdef CONFIG_ARM64_PSEUDO_NMI
>> -#include <asm/arch_gicv3.h>
>> +#include <asm/interrupts/masking.h>
>>  
>>  struct arm_cpuidle_irq_context {
>> -	unsigned long pmr;
>> -	unsigned long daif_bits;
>> +	arm64_exc_hwstates_t arm64_context;
> Why not directly replace the arm_cpuidle_irq_context structure with
> arm64_exc_hwstates_t?

struct arm_cpuidle_irq_context is used by psci_cpu_suspend_enter().
Since that function is shared between arm64 and arm32, we have to
keep it for now.

Cheers
Vladimir

