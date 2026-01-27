Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AC0D2F033
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KJeK2Zj+x31oYUW3i+CttmxKdqttRoZUDZv7DX+XaM=; b=N0w/srahY7KciNv/sqzeC30K0E
	zegURSxG1Q0xkUiBr0rp8gOCUZ25o224nXtZCCKeN0eK/Ep/8cjzUFVJiWeRh+CiAEFjR3QhrmIZn
	JHvW7UCfz3CyD6I54jA67bSNRmo3uj9Ff1VysSW5G3VXWyNiNigbGPyC6Gehr+HP1CDG8m6yQiELy
	BENJ7hNljhfRC49req1Xo+HIbfFhiNTCCAbSogZavowodVWJ4CDb1o1ly4qWiCPFow6bsJqSekfgK
	ELVzRxl8OK2IpGrQcwgPIAB0S0yx98/PR/5UQKn9jWA6wD0glLrzAgF1f3jajBQAEPn4OdlZOW+CN
	mXEWeNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmPi-0000000Eh8q-3bzL;
	Tue, 27 Jan 2026 16:59:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkmPa-0000000Eh5e-24vV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:59:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F4F1596;
	Tue, 27 Jan 2026 08:59:22 -0800 (PST)
Received: from [10.1.37.210] (XHFQ2J9959.cambridge.arm.com [10.1.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00FCA3F632;
	Tue, 27 Jan 2026 08:59:26 -0800 (PST)
Message-ID: <da0b8783-590e-42a0-8937-f786a2ebcafa@arm.com>
Date: Tue, 27 Jan 2026 16:59:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] arm64: mm: Permit contiguous descriptors to be
 rewritten
Content-Language: en-GB
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, will@kernel.org,
 catalin.marinas@arm.com, mark.rutland@arm.com,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org
References: <20260126092630.1800589-12-ardb+git@google.com>
 <20260126092630.1800589-15-ardb+git@google.com>
 <4965fa08-ce01-4848-bc30-5cc1b745683f@arm.com>
 <CAMj1kXFskBM-LT_ifX5HpxgQnt1E5tt2QA_5fYuxPQBiSWSDZw@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAMj1kXFskBM-LT_ifX5HpxgQnt1E5tt2QA_5fYuxPQBiSWSDZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_085930_581746_EC9420D7 
X-CRM114-Status: GOOD (  16.17  )
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

On 27/01/2026 15:03, Ard Biesheuvel wrote:
> On Tue, 27 Jan 2026 at 10:45, Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 26/01/2026 09:26, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> Currently, pgattr_change_is_safe() is overly pedantic when it comes to
>>> descriptors with the contiguous hint attribute set, as it rejects
>>> assignments even if the old and the new value are the same.
>>>
>>> So relax the check to allow that.
>>
>> But why do we require the relaxation? Why are we re-writing a PTE in the first
>> place? Either the caller already knows it's the same in which case it can be
>> avoided, or it doesn't know in which case it is accidentally the same and couple
>> probably just as easily been accidentally different? So it's better to warn
>> regardless I would think?
>>
> 
> Based on rule RJQQTC in your reply to another patch in this series, my
> conclusion here is that we can drop this check entirely.

Hmm, I don't think that would be quite right; The rule permits _some_ bits of
the PTE to change in a live mapping as long as the CONT bit remains unchanged.
If you change the CONT bit on a live mapping, you could end up with overlapping
TLB entries which would not go well on a system without bbml2.


