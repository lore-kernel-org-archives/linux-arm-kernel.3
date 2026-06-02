Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A80ECD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS6ea5e+boCoHooIbVw7mD45Syl0wnThHA5f4J7jlpo=; b=gE96SXYU6jKIvfIn/YCggSbDtg
	T6bN5Wx36BTtRXzyEApbPIdh/eyNXJNIlIppjYaV9VIfIekFOIX6FaYQ8kLlGKgprRtRLXCWUp6oH
	GtLa0O/qk8JA2QvApa1YpxV8kbMFlT4WTuaoolBhpDK7MgrDOGcjNaSdRQC9dJRhHitgjXLx0OeVS
	NpB3qsrm+4zQ/zMMsM2iWFwN/zY5oKebhiUvYuFrFbb9PO2i4Oi3e6r9m56YHYLi92vTPUg6QsUPV
	WWWVxqZI+BzBTPaU5GWLrfgBVv3jdilLbKdvXBUxhMDWtXmecn1JYld+MY/gh2NzQqKGMNRprnbJz
	2llBYaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURMK-0000000DMZF-2ufQ;
	Tue, 02 Jun 2026 15:48:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURMI-0000000DMYn-1UF1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 15:48:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67BD23593;
	Tue,  2 Jun 2026 08:48:44 -0700 (PDT)
Received: from [10.57.23.208] (unknown [10.57.23.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D543F7D8;
	Tue,  2 Jun 2026 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780415329; bh=nHus5Ro3nDGtQX8vZnUZpgQi9wlcfRYljtOsSzl7VF8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aRYRL+m7pib679WObYThgfpkkq7IZXrWIMDe4Bn9kf/cNblMMPmpREr9hM/2VAlzK
	 AolkM0UheNJiTo5dHWqdjmREm9p7r3ccxJNEK3Ahl+G45Px/lLhurgU2wVonUcZNdO
	 RmJIWVyrIJBHLzsaDltNXl6urGe695Zw6Xc521Kc=
Message-ID: <41ab4dfb-b91c-46df-99a0-de36686c8fea@arm.com>
Date: Tue, 2 Jun 2026 16:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Sami Mujawar <sami.mujawar@arm.com>, Gavin Shan <gshan@redhat.com>,
 Steven Price <steven.price@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260519101217.155740-1-enju.kohei@fujitsu.com>
 <ah638FZAyCSqtzMi@willie-the-truck>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ah638FZAyCSqtzMi@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_084850_435059_C6B2C0AF 
X-CRM114-Status: GOOD (  16.42  )
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

Hi Will

On 02/06/2026 12:01, Will Deacon wrote:
> On Tue, May 19, 2026 at 07:12:08PM +0900, Kohei Enju wrote:
>> With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
>> debug_smp_processor_id(). This debug function complains when certain
>> conditions that ensure CPU ID stability are not met, specifically when
>> it's called from a preemptible context.
>>
>> In arm_cca_report_new(), which runs in a preemptible context,
>> smp_processor_id() triggers a splat [0] due to this.
>>
>> However, the CPU ID obtained here is used as the target CPU for
>> smp_call_function_single() to designate a specific CPU for subsequent
>> operations, not to assert that the current thread will continue to
>> execute on the same CPU. Therefore, snapshotting the CPU ID itself is
>> correct, and thus there's no actual harm except for the splat.
>>
>> Use raw_smp_processor_id() instead, to directly retrieve the current CPU
>> ID without the debug checks, avoiding the unnecessary warning message
>> while preserving the correct functional behavior.
> 
> That's pretty disgusting imo so I'd like to see some more justification
> for this approach.
> 
>> Note that while migrate_disable() would pin the task to the current CPU,
>> this path should not block CPU hotplug events. Therefore, we snapshot
>> the current CPU ID and accept that smp_call_function_single() may fail
>> if the CPU goes offline.
> 
> Why shouldn't it block CPU hotplug events? What happens if the CPU goes
> offline and comes back online again during the loop of continue calls?

It need not. It can continue the calls. The RMM keeps track of the 
internal progress in the "REC" object for this "VCPU". Hotplug ON/OFF
doesn't change the REC object in CCA Guest. So, a REC can come back and
execute it. But the Linux could fail the operation if the CPU isn't 
available for fetching the report, after we do a RSI_ATTEST_TOKEN_INIT.

Suzuki



> 
> Will


