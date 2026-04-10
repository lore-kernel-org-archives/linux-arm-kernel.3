Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF536F36BA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pvQL6DBxdgPUZVp7bF95+XhXSCx213mQ8nPOmWc+k4=; b=of6rHrkxX0Qq6g+BhIiTnOY/ql
	3ciIskqrXjgUOQuvqkZxdHNPq3a9MUf2q9HazNuV3NBqZiKc0i3h9uvtMkwPWXjwFl6q7w9Ft+wpm
	YEWvBXVPZ7N4dj/xYo8Ujbx+LzL4MH9pvOc5WjSbyDy1z36WpdK9gVZBcGHbqOtItLFv4a93pbM5a
	dLRSpmowwqKtW7jc8whz3v8sPiq+nAHFLXkFqlSN3+Q8mQXip3ekxE2STFVdH8L0mldbKtU6VnQUo
	viPog6sKuTWfBcA9oTReYhWLMf0yQG+Kd0QPu74d6R9L+rPmKweWjhftudrJvKwNq51fbR1EXYqAE
	OOSbUDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3pU-0000000BbZt-2Fzq;
	Fri, 10 Apr 2026 04:50:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB3pS-0000000BbZY-0kdh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 04:50:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69FD72008;
	Thu,  9 Apr 2026 21:50:42 -0700 (PDT)
Received: from [10.163.181.174] (unknown [10.163.181.174])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 088823FAF5;
	Thu,  9 Apr 2026 21:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775796648; bh=vXofvo1m8OBdJOMnjG/myR5+E0MqcahYsCCk38Vlw9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GZovmfCj6dNyFwOVOI79CkD3FW9Uw+uSnlvictrhFQKqouJTQQ0FHHOD8AstrTPIu
	 rvLZ1fl5GnWdFoPMKMst59k1jcr5ZZlsMyG2I7CkGovwCmZaqx/DpKIKuBgK4yTb6l
	 fZkGjrOSgc9V3KEUiFXZi9FgJnTBf3kxNwuk7Ywc=
Message-ID: <6d91c17f-2027-482a-b0b2-98ad258f1687@arm.com>
Date: Fri, 10 Apr 2026 10:20:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 06/16] arm64/mm: Convert READ_ONCE() as pudp_get() while
 accessing PUD
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <20260224051153.3150613-7-anshuman.khandual@arm.com>
 <b1e1783c-3621-41e4-b65d-38cf66a1124c@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b1e1783c-3621-41e4-b65d-38cf66a1124c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_215050_295919_3BE7B79C 
X-CRM114-Status: GOOD (  10.05  )
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



On 08/04/26 5:45 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> Convert all READ_ONCE() based PUD accesses as pudp_get() instead which will
>> support both D64 and D128 translation regime going forward.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kasan-dev@googlegroups.com
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
> 
> I was wondering for a second whether it would be better to structure
> this as "convert READ_ONCE to use pxxxp_get() in fault.c" instead,
> essentially, to touch each file only once.

But will not that create too many patches ?

> 
> Anyhow
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 

Thanks !


