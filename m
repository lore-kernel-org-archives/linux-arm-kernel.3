Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF34D2505E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQZW1HeNEdAOSJluzrAfulfthbShQreZzjOj2Nm291c=; b=IT3A/Q24Aix8iuGX9wEuIo61u/
	KpITZ09U5R0Ilz1etOhFxGYsZZ8Byyi+TXv/jjsO3NYTUzUGg+qqaqIl8jKxKNe47Q816prYejaEe
	kCTIUhOUG4OybSiUkrKwWkxgjJg/i32euKCEJhBZBdxHlNM/n3tjQmOXN3mZT59pHZEyVhTTgrWwo
	wizb8QblmnjOXHhT3YjDF+lXNelL/dY4nw0YS7vJt4Q5x9uqnLDaMB5zcq0OMcFyc2pOV2lOqFSql
	oP5MEMTi9SHvlyH2or3WedQBVLRJoPGFW124F8d/rxocwwh71HuDzLd8JNquEPgvGlDboNB6BAYAE
	UGIo22Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEM7-000000055uE-3e3q;
	Mon, 12 Jan 2026 09:36:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEM4-000000055tq-3n2F
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:36:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 911E3339;
	Mon, 12 Jan 2026 01:36:46 -0800 (PST)
Received: from [10.57.48.185] (unknown [10.57.48.185])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 11C633F694;
	Mon, 12 Jan 2026 01:36:50 -0800 (PST)
Message-ID: <08af7447-1ea8-4513-907e-1902a661261f@arm.com>
Date: Mon, 12 Jan 2026 10:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: fix cleared E0POE bit after
 cpu_suspend()/resume()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org, pavel@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, yang@os.amperecomputing.com, joey.gouly@arm.com,
 stable@vger.kernel.org
References: <20260107162115.3292205-1-yeoreum.yun@arm.com>
 <846e1998-b508-4433-9db6-3a52ff23552f@arm.com>
 <aV6YPyLV1quaOkyw@e129823.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aV6YPyLV1quaOkyw@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_013657_013978_A74006FB 
X-CRM114-Status: UNSURE (   9.07  )
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

On 07/01/2026 18:30, Yeoreum Yun wrote:
> Hi Kevin,
>
> [...]
>
>>> @@ -144,6 +148,10 @@ SYM_FUNC_START(cpu_do_resume)
>>>  	msr	tcr_el1, x8
>>>  	msr	vbar_el1, x9
>>>  	msr	mdscr_el1, x10
>>> +alternative_if ARM64_HAS_TCR2
>>> +	ldr	x2, [x0, #104]
>>> +	msr	REG_TCR2_EL1, x2
>>> +alternative_else_nop_endif
>> Maybe this could be pushed further down cpu_do_resume, next to DISR_EL1
>> maybe (since it's also conditional)? Otherwise the diff LGTM:
> Sorry but IIUC, currently there is no DISR_EL1 save/restore not yet?

It's zeroed at the end of cpu_do_resume, but yes it's not saved.

> and I think current place is good where before restore SCTLR_EL1 which
> before MMU enabled.

Fair enough, and I can see that other registers are not restored in the
same order as they're saved, so we're not breaking an existing pattern.
Either way Catalin took the patch so this is settled :)

- Kevin

