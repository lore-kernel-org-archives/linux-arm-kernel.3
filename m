Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFBBCD583F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 10:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMgf5hJ4IKNNMz4AXzwjIZRiRJuMg1ZSImwzAOyBx7g=; b=IVujCO5vmmyf1/FRW+USue58lQ
	rWBfn5ynoTTsyjBIb+EqBpUr2YDCB9TT+T85+VUTqo+yF6g3TJpDx9pakr6n2qPzLrHIa/z6mEjhj
	Zo/IvwA6Oja2kGTySw8t9o1M81IXcfN0IiHMBuUYqav2P2rSHkLNs6JUfuO/k6BGDsD7a54NMgGNl
	NBw72IzevURVDKonMCTcRSNF0wllNplSapIye5VKq4dZt+ZJBL00Pwk+fI1hszEmL4JeSCmwWmrZo
	f6ZupvTTZkqZdH3xZBqpTSTFHeSnwgmtdX1kxuAaSMCi2m7Qdi68T/TSKd6W81zxrikcmdJo1OO6z
	DN3tuBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQng-0000000Ei23-0DGM;
	Wed, 07 Jan 2026 10:30:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdQnb-0000000Ei1U-37mz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 10:29:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A4D497;
	Wed,  7 Jan 2026 02:29:47 -0800 (PST)
Received: from [10.57.49.120] (unknown [10.57.49.120])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DAC43F6A8;
	Wed,  7 Jan 2026 02:29:51 -0800 (PST)
Message-ID: <f555454a-3eb9-4537-8f69-66ec36931966@arm.com>
Date: Wed, 7 Jan 2026 11:29:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: fix cleared E0POE bit after cpu_suspend()/resume()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org, pavel@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, anshuman.khandual@arm.com,
 ryan.roberts@arm.com, yang@os.amperecomputing.com, joey.gouly@arm.com
References: <20260105200707.2071169-1-yeoreum.yun@arm.com>
 <af65f271-5af9-432d-bec9-e44638db9b9f@arm.com>
 <aV4uDW2p+WBCitwl@e129823.arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aV4uDW2p+WBCitwl@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_022957_491401_1CA3C300 
X-CRM114-Status: GOOD (  11.74  )
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

On 07/01/2026 10:57, Yeoreum Yun wrote:
>>> @@ -97,8 +97,11 @@ SYM_FUNC_START(cpu_do_suspend)
>>>  	mrs	x9, mdscr_el1
>>>  	mrs	x10, oslsr_el1
>>>  	mrs	x11, sctlr_el1
>>> -	get_this_cpu_offset x12
>>> -	mrs	x13, sp_el0
>>> +alternative_if ARM64_HAS_TCR2
>>> +	mrs	x12, REG_TCR2_EL1
>>> +alternative_else_nop_endif
>>> +	get_this_cpu_offset x13
>>> +	mrs	x14, sp_el0
>>>  	stp	x2, x3, [x0]
>>>  	stp	x4, x5, [x0, #16]
>>>  	stp	x6, x7, [x0, #32]
>>> @@ -109,7 +112,7 @@ SYM_FUNC_START(cpu_do_suspend)
>>>  	 * Save x18 as it may be used as a platform register, e.g. by shadow
>>>  	 * call stack.
>>>  	 */
>>> -	str	x18, [x0, #96]
>>> +	stp	x14, x18, [x0, #96]
>> If TCR2_EL1 isn't supported, we store and reload an unused arbitrary
>> value. I think it'd be better to make it all conditional and add it at
>> the end, something like:
>>
>>     alternative_if ARM64_HAS_TCR2
>>         mrs    x2, REG_TCR2_EL1
>>         str    x2, [x0, #104]
>>     alternative_else_nop_endif
>>
>> Same idea on the resume path. This also avoids the noise of renaming
>> existing registers.
> IMHO, I think it would be better to sustain the change since
> it seems more simpler to maintain  and x12 is temporary regsiter
> so leaking whatever was in x12 does not really feel like a concern...

Leaking is not a concern, but I don't think it's really easier to
maintain. We can have all the conditional registers grouped together,
like DISR_EL1 and soon SCTLR2_EL1. This avoids renaming a bunch of
registers every time we save/restore a new register here.

- Kevin

