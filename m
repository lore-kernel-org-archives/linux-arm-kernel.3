Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCQMEH7PouwNeeATuqvAGHOjbplmN1AXdX8WUSz18Yw=; b=zHqfWbk0e2+J9wNoBHczXvMjDs
	xqjczCHqfDCFudGcAjqLipP/0z0CQ4EamxLKrpqOun0qSczZV4dAD1lQQOqkxpRSrKNBUPGQiaXAG
	AmvFOG/KSXFH+kgHR5bdsXwUAYieqTh7EIZ5xfponrao74pH5HQx4/eKjpm1VGGazQckFrIRFkard
	DnTlSUrs9xBGqqeQJdOGC34+HGc4GFlL0KjT4I7utQkiLnJh6j+gYCKgNGtFRL6HgAmAIZbGW9VEd
	XRcujwhqU+WKaiXmbX7JkcJyTsDv87TB9+GB7CQFj4uR2zSV6Vp5nB/S38JTb065uzA3M7oAPindK
	j05Jchsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trewz-00000003A2n-3Q5c;
	Mon, 10 Mar 2025 15:21:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdvf-00000002uOw-1PJT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:16:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0A6316F2;
	Mon, 10 Mar 2025 07:16:35 -0700 (PDT)
Received: from [10.1.37.175] (e126864.cambridge.arm.com [10.1.37.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A79DC3F673;
	Mon, 10 Mar 2025 07:16:22 -0700 (PDT)
Message-ID: <1210b66a-ed75-4bc1-bbaa-d3277c290267@arm.com>
Date: Mon, 10 Mar 2025 14:15:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: mm: Handle PAN faults on uaccess CPY*
 instructions
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Tong Tiangen <tongtiangen@huawei.com>,
 James Morse <james.morse@arm.com>, Robin Murphy <robin.murphy@arm.com>
References: <20250228170006.390100-1-kristina.martsenko@arm.com>
 <20250228170006.390100-3-kristina.martsenko@arm.com>
 <Z8s-4OPE2DNSogwB@arm.com> <4c621070-688a-4a75-9134-ea19b6d20f04@arm.com>
 <Z8tnARR2jSJEruLw@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Kristina_Mart=C5=A1enko?= <kristina.martsenko@arm.com>
In-Reply-To: <Z8tnARR2jSJEruLw@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_071627_441114_A4981E4B 
X-CRM114-Status: UNSURE (   9.96  )
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

On 07/03/2025 21:37, Catalin Marinas wrote:
> On Fri, Mar 07, 2025 at 06:53:37PM +0000, Robin Murphy wrote:
>> On 2025-03-07 6:45 pm, Catalin Marinas wrote:
>>> On Fri, Feb 28, 2025 at 05:00:05PM +0000, Kristina Martsenko wrote:
>>>> +bool extable_insn_may_access_user(const struct exception_table_entry *ex,
>>>> +				  unsigned long esr)
>>>> +{
>>>> +	switch (ex->type) {
>>>> +	case EX_TYPE_UACCESS_CPY:
>>>> +		return cpy_faulted_on_uaccess(ex, esr);
>>>> +	default:
>>>> +		return true;
>>>> +	}
>>>> +}
>>>
>>> Not a problem with this patch but I wonder whether we should return
>>> false for EX_TYPE_LOAD_UNALIGNED_ZEROPAD for completeness
>>
>> Or maybe rather, true for EX_TYPE_UACCESS_ERR_ZERO and then false in the
>> default case?
> 
> Yes.

I thought you said in an earlier (off-list) discussion that 
EX_TYPE_KACCESS_ERR_ZERO shouldn't return false here because 
__get_kernel_nofault() may get called with untrusted addresses? Or did I
misunderstand?

Thanks,
Kristina


