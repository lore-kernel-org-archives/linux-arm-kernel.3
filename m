Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39F8C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR92sviDuMP49Exnp2unHYB4Rk8r3LT9Ft0ZTazEfX8=; b=OvOQEDEMEoZ7DzTE+r+KQL/Myb
	lgeYMfmUPIboH6zh+t2qPC83EBAM6M1U8GQqEuyQNJZ102jgq+am/ucPpC5BQQIa/es7O9Drp82sk
	8S012q6832i7aX+wCwNWSNDUvR4HxX3ctaYAz58bsOQyNiblUXT8qjLC8VMNeuuyaWIftFe0/zJ6+
	Ig5szUJMAs+xILx/lJ1qIG6wgSoXN+8iJUkATbrWWYGjmSj0X025KVbeTpH5HXxOmyO4+YcI9DKxq
	pO8CZKAi6KkaTwhQ44Wj3mBu0tOQaID6Qkd1IbgDMZDUpp67KrJtjgS5O3u793d4iqk1QkH1/Q0kq
	5flwVEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMMr-0000000D5KT-3wzu;
	Fri, 21 Aug 2026 10:20:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMMq-0000000D5K3-1UyB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:20:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 674F6153B;
	Fri, 21 Aug 2026 03:20:51 -0700 (PDT)
Received: from [10.57.68.59] (unknown [10.57.68.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A321C3F66F;
	Fri, 21 Aug 2026 03:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787307655; bh=kl6KGEpcxwAbbsxiVq/X1BLi4yYzm7hgKZsn1WcxruI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LdvCxw/z30YXJ9GTsn5gFArZG8Q12UJBJJ17kLV+iM6Tt+EZ1bJJrK+D46VfRzPE2
	 wc/LDe2vP4cD7js6Kf/XCiikwcuntz/4RxhVGHR378BV2vpbQlQkWku4QmKTJwPPDU
	 0X2mNgIPKsbLfMMd4N/TRPH0CyQ14IZ1u72/gfxM=
Message-ID: <1ce77a83-b5eb-4f7b-85bb-e846a412d107@arm.com>
Date: Fri, 21 Aug 2026 11:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 39/45] arm64: smp: Fall back to IRQ when IPI NMI
 request fails
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
 catalin.marinas@arm.com, liaochang1@huawei.com
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <20260727163453.7969-40-vladimir.murzin@arm.com>
 <ad3939ac-3f47-4fe1-8759-f55806b53ef5@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <ad3939ac-3f47-4fe1-8759-f55806b53ef5@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_032056_463871_05FFC1DB 
X-CRM114-Status: GOOD (  16.68  )
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

On 8/13/26 10:20, Jinjie Ruan wrote:
> 
> 在 2026/7/28 0:34, Vladimir Murzin 写道:
>> Existing IPI setup logic relies on ipi_should_be_nmi() to decide
>> whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
>> not supported, using an ordinary IRQ is acceptable.
>>
>> FEAT_NMI requires complementary support in the interrupt
>> controller. If FEAT_NMI is present but interrupt controller support is
>> absent, request_percpu_nmi() can fail.
>>
>> One way to prevent this would be to extend ipi_should_be_nmi() to also
>> check for interrupt controller support. However, since falling back to
>> an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
>> instead. Whether an IPI is actually registered as an NMI is determined
>> by the success or failure of request_percpu_nmi(). If the request
>> fails, fall back to request_irq().
>>
>> Track which IPIs were actually registered as NMIs and use that state
>> in the per-CPU enable and disable paths. This avoids calling the
>> percpu NMI helpers for an IPI that fell back to regular IRQ handling.
> Hi Vladimir,
> 
> Should we update the following comment and mention that "regular IPI
> will also be used when the nmi_bitmap is not set"?
> 
> 936 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int
> exclude_cpu)
>  937 {
>  938 >-------/*
>  939 >------- * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_"
> in the name,
>  940 >------- * nothing about it truly needs to be implemented using an
> NMI, it's
>  941 >------- * just that it's _allowed_ to work with NMIs. If
> ipi_should_be_nmi()
>  942 >------- * returned false our backtrace attempt will just use a
> regular IPI.
>  943 >------- */
>  944 >-------nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
> arm64_backtrace_ipi);
>  945 }
> 

Something like

-        * just that it's _allowed_ to work with NMIs. If ipi_should_be_nmi()
-        * returned false our backtrace attempt will just use a regular IPI.
+        * just that it's _allowed_ to work with NMIs. If we failed request
+        * NMI our backtrace attempt will just use a regular IPI.


> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

Cheers
Vladimir


