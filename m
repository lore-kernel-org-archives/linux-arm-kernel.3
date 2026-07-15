Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD99C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/guU2YpDCUQnisrbwDbTkjavWP2d56VTFvbv0hG8e90=; b=3JD8Z7z6oUUt16
	IFPAb4g/Wm7Q7AT8f7+x19O9czMFPy9V2FecfwJt+yEu4Lk21I0fofjAJs631nWtG2ouB3QycGj5u
	MeqxpWQwSYJmY7Yb8Fx0E5nsp5+rHr25sVZkwoj0H32Ukv2MWfGbRjTP1XyKfTTPZpfRpRLFE1CaM
	ukue43hWawJ5DRDhzS3qX/w/qQMWWoyKB+DzhFFSV1GJwYUQmzhqYXDiiutD9379g5FY0LHtf7oSW
	1OGYdfI+W3/HcQk5Fvr7dZzVPvzGI4n8i4vxlLfxYfHUBS2Zrhm2rh2lrRHju3j+4KfFTVJGOQlGn
	lo5fhGKI2A71EgX3n0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Hz-0000000F40q-0pQn;
	Wed, 15 Jul 2026 14:08:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Hw-0000000F40J-2mVX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCA84152B;
	Wed, 15 Jul 2026 07:08:34 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56F4E3F7B4;
	Wed, 15 Jul 2026 07:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124519; bh=GnQcpR556D5qm5UAsO7cPNcPoms/3t+x3E2b03KtEog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hz7Gg5IUMFxljtDvYr5KC1gjkf/HVJtW2q+Yawj/+ljn5ASYLsZzP2KnC6+TCQ0l+
	 Y1YNn9LCClxJ4NZBSsYpkB7cup08AnqpVMjIxtcI8ywcJRZ7BMT1vzBwlzb3UGFa+D
	 3laO7WkR2XWWvrsuK4Zr9ScL5a3c/4KC/jTBqlcA=
Message-ID: <b25ffc41-c4c0-4a72-bac6-fb7c0abf8e64@arm.com>
Date: Wed, 15 Jul 2026 15:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 31/36] arm64: nmi: Add handling of superpriority
 interrupts as NMIs
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-32-vladimir.murzin@arm.com>
 <88a31062-f898-474f-b3a6-1a0b8586d5e3@huawei.com>
 <63cb9447-a219-4115-a6ed-c69aeaa45535@arm.com>
 <9fe11e2f-4f03-4d8b-ad9d-fea584431c9c@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <9fe11e2f-4f03-4d8b-ad9d-fea584431c9c@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_070840_751824_508B7FE9 
X-CRM114-Status: GOOD (  12.99  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/15/26 13:07, Jinjie Ruan wrote:
>> FEAT_NMI
>>
>>   We can distinguish between an NMI and an IRQ on exception
>>   entry. Thus, for an IRQ, we can immediately drop to NOIRQ_CONTEXT
>>   before passing control to the IRQ handler, allowing NMIs to preempt
>>   the IRQ handler. This corresponds to case 2 of the pNMI flow above.
>>
> I think this is not quite correct. When entering the __el1_irq()
> function, if only system_uses_nmi() is true, it does not necessarily
> mean it is NOIRQ_CONTEXT.
> 
> I believe the unmasking of allint, or NOIRQ_CONTEXT, should be delayed
> until gic_handle_irq() actually before we processes the interrupt as
> gic_unmask_pnmis() do it. At this point, it is still NONMI_CONTEXT to
> keep  hardware NMI masked as isr_el1.IS is not set.

It looks like your LLM needs the additional context from the
"[RFC PATCH 36/36] irqchip/gic-v3: Implement FEAT_GICv3_NMI support".

With that context, it should recognise that NMIs and IRQs take
separate handling paths and use separate hardware state, so they do
not interfere with each other. As a result, IRQ handling only needs to
mask IRQs. In other words, there is no need to delay entering
NOIRQ_CONTEXT until reaching the GIC.

Cheers
Vladimir



