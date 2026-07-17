Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F54C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3e7+w/4rLRrT1iV32BoYU8sfjj03xAoar971yOmdO4=; b=GX5nXXdllZHMlw
	PX4u5JftrY2zPvTG6dztiyo/sjpga+XyVBvE2F7SLWORkjT3HzsVlr74PJ/sXhvrpD1eUMCZ3o5HV
	NmfLmYAGvKISIhf7asP1p/q5/SVI3h7YG/lnAqw3qkDmWAIPTqUybdvSnD58B0+bHaGyc5Q8djgzB
	HRmFCsWrQvUTger9imGDnYfhVjDS4wq1+DF9me5r+s1YdBJdokaeib4iBfWgfxG+d28xKKxxjMtOs
	8J7fsTEj84G/gWNr7vrtdEYiHl32y524uBhCpyJy4Thtvh25ziVRU7DVJHdHI3gDRXjzojd0WDC3b
	uEPw7XSxgkDGBhQ9t3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpr-00000001yfP-0lSG;
	Fri, 17 Jul 2026 10:30:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkfpi-00000001yZr-3lcm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:30:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6994B1476;
	Fri, 17 Jul 2026 03:30:13 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 315A13F7D8;
	Fri, 17 Jul 2026 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784284217; bh=d7+JBlLkYfqcnfrytyqNrGc1utkimog2DLhJOhXsAgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gEbyest3gLJOI8IDuq+ujTa9ykjwD8OvgN+EB02+DZkrCUBfUFFeSQ8u8T1YJbQpb
	 6jv5L98o4/wiFMEe5QScafSfFpd/fZju+pBasrupCveCdjzkFknK1At7pkQPBJaviH
	 P17iqLfbUd6rLvyU3RFwV0EfrhFFyqfmv5kZ87tw=
Message-ID: <d6db2c79-858c-403f-8874-d74dfcf7c375@arm.com>
Date: Fri, 17 Jul 2026 11:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/36] arm64: irqflags: save and use both DAIF and PMR
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-11-vladimir.murzin@arm.com>
 <00f0b907-bab7-4f18-970f-25e2e7071b0a@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <00f0b907-bab7-4f18-970f-25e2e7071b0a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_033018_995238_C32977D1 
X-CRM114-Status: UNSURE (   6.75  )
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

On 7/10/26 09:47, Jinjie Ruan wrote:
>> -static __always_inline bool __daif_irqs_disabled(void)
>> -{
>> -	return __daif_irqs_disabled_flags(__daif_local_save_flags());
>> -}
>> +	if (system_uses_irq_prio_masking() && hwstate.pmr < GIC_PRIO_IRQON)
> This concept of being less than or greater than is not easy to understand.

IIUC, the original idea behind using less than and greater than
comparisons was to provide a safety net while we transition to the new
implementation in this patch series. However, after taking another
look, it seems we do not require them. More on that in my reply to
your other question about this code...

Thanks
Vladimir

