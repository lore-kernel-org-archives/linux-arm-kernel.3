Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E554C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzXVF5KUuRacJG+OXpAodbh9mrHr8/04JZZNeCB9S5U=; b=BGhf+9R/ldzFdI
	N5Z2oDqIQzyQXnW7k+LMeXhBA4jWuW7au4knpYEkS7RJ4kpU1krNCbMO5rFlcAHwOf6MTr94Nr7gw
	1UWlXcZr662KCTHYubc1OV9mtTDd1vyjNSSesVFhz+wh1+z3eWCRc9lyFl6qw74BojkKncagwNh0k
	L4e2qHRQScKlppO+J72TbP49TI+vDyCrHkklR8HQE63tWXKFYnFQSfH7bh5hmByTFU+3wdl3NcsGo
	H0z6vsp0UPpjAwu3zlSga3V4ctQnd2nS/TIotoo+c6+jY0Z9KoYVeUaCA7+22AlpdCkstjJEpiSzZ
	ZrkWL3LhLksg9VPkQ3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjymP-0000000EoAP-1W3T;
	Wed, 15 Jul 2026 12:32:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjymN-0000000Eo9n-2soP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:32:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7592A1477;
	Wed, 15 Jul 2026 05:31:53 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EAE63F7B4;
	Wed, 15 Jul 2026 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784118717; bh=bXdqQjQeHM3ATxqlYN8Y11YKAHcGy5cQPaPkUOZjE2M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YDz3zFbgsjZ23vjnCG+I9eTk8MIbYGzJubZ+xuC8JU8LamqhY56eTLiZFnKQPqFdn
	 +puufKRNfMGg4oB15ebtS1gTAbFgUUHxtNgT+EIQjln3KSWbmS9hepE5TiaAaU2u3i
	 JpNQVEHzybtAL/RmKbbHWrxUvQtxNNy62fMzexds=
Message-ID: <33c1b5c2-3e64-46a4-88d5-2f589625e777@arm.com>
Date: Wed, 15 Jul 2026 13:31:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] arm64: entry: replace DAIF helpers with entry
 helpers
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-13-vladimir.murzin@arm.com>
 <5129a523-142f-4834-ba4d-6ff15278d12a@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <5129a523-142f-4834-ba4d-6ff15278d12a@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_053159_774773_0166813E 
X-CRM114-Status: UNSURE (   8.40  )
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

On 7/10/26 10:36, Jinjie Ruan wrote:
>>  static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>>  {
>> +	arm64_exc_hwstate_t hwstate;
>>  	irqentry_state_t state;
>>  
>>  	state = arm64_enter_from_kernel_mode(regs);
>> -	local_daif_inherit(regs);
>> +	hwstate = arm64_inherit_exc_context(regs);
> local_daif_inherit do not trace_hardirqs_off() but only
> trace_hardirqs_off()，but now arm64_inherit_exc_context() do it, is this
> a functional change?

When CONFIG_TRACE_IRQFLAGS is not set, there is no change in
behaviour. Otherwise, IIUC, we may continue to tell the kernel that
hard IRQs are disabled, but that should be harmless.

Could you please expand on your concern?

Thanks
Vladimir

