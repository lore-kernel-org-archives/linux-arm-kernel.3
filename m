Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62570C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k78uAyRpyrnNCcWPwivN1XUjba44ZawPnKOwQPdGBYc=; b=BPyleS+Am/oZja
	Xs2JLq2A1IoHR/QGQQGXpzbM52QYphZSOY1Cy7pMBCe0VKRi3ZlqrDrkswL8JwMHoZzQnbI4Pt1a5
	mJ/UcRcOZK/ds3njhLu/Nv+O61Oq6BitjKO8ubL/yu2aM7cj2+Qa5yTkSJ0j1322WQimzahawBDMj
	LWOqN/MhNxDiuyvYthQ8NieestX4lxgiK40j4Z4oZ/zlcXqYW8bMB2WZr9B6oc++daq4fhtcDSlP4
	8ZPfwbMH5WsotLQlN/TsBc/OJpRC73LnqhjEySNSsu/NOXSTmXCTJYLYhnlRYBw4T8xt9q4+J1v0s
	cW1+jPXw3TqvrWRiOarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNmG-0000000ATG5-0bmk;
	Wed, 11 Jun 2025 15:54:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIkM-00000009cgX-3C1D
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k78uAyRpyrnNCcWPwivN1XUjba44ZawPnKOwQPdGBYc=; b=eeUjmqQ0SuXZVUBqfu89nDLsyA
	9vdEa69vERZAsnO27OOfwWOzeTgSIOn5vk46vXxtztbC7d3Gp5OJG7cVb9P/rU7x/eySzq+bPd8Hc
	C8UZuKosacLxoJBaQ7WFPuiSs3/iphmHYpdh3LBbRFF/DTwdEs3B/qTrO6Z6j7Hrh/IMnAnxb9m1+
	ZK+Ox6lt2t0WRDoi8Mj8B+Qum61FYFbU3RRqZ/y+KB3c4mGtaPdQLNGsn/DsPyxV8GgHKlo8W5TYL
	5hjhEBe4SIlsqgKkw6UNaHJRPyXD7oo6MQS67qz2TV9o+6BeNWPqOnsvPnRddco1L7/S9UiFKWWsS
	ZSFNjQbg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIkK-00000002HFB-3AK4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:31:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68EBF1BC0;
	Wed, 11 Jun 2025 03:31:30 -0700 (PDT)
Received: from [10.164.146.17] (J09HK2D2RT.blr.arm.com [10.164.146.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBD423F673;
	Wed, 11 Jun 2025 03:31:47 -0700 (PDT)
Message-ID: <aa2fa283-528c-4658-9bd3-7092eac7a442@arm.com>
Date: Wed, 11 Jun 2025 16:01:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
To: Mark Rutland <mark.rutland@arm.com>
References: <20250610053128.4118784-1-anshuman.khandual@arm.com>
 <20250610053128.4118784-2-anshuman.khandual@arm.com>
 <aEhnzsXHfilVhJ1s@J2N7QTR9R3> <68d762d4-a755-4ede-976b-0616bf3aab28@arm.com>
 <aElRi0Usn8dH6O4m@J2N7QTR9R3>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aElRi0Usn8dH6O4m@J2N7QTR9R3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_113152_975693_F9F83005 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/06/25 3:25 PM, Mark Rutland wrote:
> On Wed, Jun 11, 2025 at 09:10:45AM +0530, Anshuman Khandual wrote:
>>
>>
>> On 10/06/25 10:43 PM, Mark Rutland wrote:
>>> On Tue, Jun 10, 2025 at 11:01:27AM +0530, Anshuman Khandual wrote:
>>>> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
>>>> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
>>>> macros become redundant and hence can be dropped off completely. While here
>>>> convert all variables handling MDSCR_EL1 register as u64 which reflects its
>>>> true width as well.
>>>
>>> I think that for now it'd be best to *only* change over to the
>>> generated MDSCR_EL1_* defintions, and leave the register sizes as-is.
>>
>> I had tried doing that originally but without changing mdscr register size,
>> there is a build warning because MDSCR_EL1_MDE is defined as GENMASK(15, 15)
>> which is represented as 'long unsigned int'.
>>
>> #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
>>
>> arch/arm64/kernel/debug-monitors.c: In function ‘disable_debug_monitors’:
>> arch/arm64/kernel/debug-monitors.c:108:13: warning: conversion from ‘long unsigned int’ to ‘u32’ {aka ‘unsigned int’} changes value from ‘18446744073709518847’ to ‘4294934527’ [-Woverflow]
>>   108 |   disable = ~MDSCR_EL1_MDE;
>>       |             ^
> 
> Please mention that in the commit message. As-is, the commit message has
> no rationale for changing to u64.

Sure, agreed. I had missed that, it was my bad.> 
> More generally, if you need to make a change to avoid a compiler
> warning, please describe that as part of the rationale.
Makes sense, will do.

> 
>> MDSCR_EL1 is a 64 bit system register as per ARM DDI 0487 L.A (D24.3.20).
>> Representing it as u32 does not seem right irrespective of whether the
>> extended break point support is enabled or not. Besides even arm64 kvm
>> uses u64 for mdscr register.
> 
> Sure, but that wasn't my complaint.
> 
> My complaint was that it was a logically unrelated change, because you
> had provided no rationale as for why it was necessary to change to u64
> as a conseqeunce of changing to the generated MDSCR_EL1_* definitions.
> 
> Please also note that *almost all* system registers have the
> "${REGISTER} is a 64-bit register wording", including things like DAIF,
> SPSel, etc. It's necessary to consider the context of use.

Understood.

I will add a rationale in the commit message for the u64 changes along
with changes related to the generated MDSCR_EL1_* definitions and then
re-spin the series. Thanks for your review.

> 
> Mark.



