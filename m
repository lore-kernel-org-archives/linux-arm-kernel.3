Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02245E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN91wbXZDrf9l6dAVjMyMzi5Pztby6PUjas/X5z1E7s=; b=hbjKg89Ze2XCfwHUAT91wFRjKs
	AEcqhYBekzcciR4fHVPpZGknQsGyLKGwdnPtvoAGTTYCIqsAIMy4ox+xZhkMVRZAcNtreIW0wevhc
	1kMAbihyyMipl9bfRqSFlTTvTDXYmIitobJGa5oFx081L+bxrrRtCnqM0Ua+NmVF/thsRjeuZ7F97
	dHSKlwUzO5zWpWdF6gYAaH81hCCzEeTulZAnnV3mJB9eXa1qwa8hxFMtVAz9SSANrSq+JAo33hg5J
	iBEV8WFCuYp2o5B4PxC05OqIKSWBxzNjMQHlebpbBA05B/PZOusV7I8xMhbQ+BuI6FqI+uCY/eAeV
	8z3uV48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvnq-0000000AkJV-1IfX;
	Tue, 10 Dec 2024 08:41:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvlE-0000000AjpU-498x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:38:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7230B113E;
	Tue, 10 Dec 2024 00:38:55 -0800 (PST)
Received: from [10.163.48.173] (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 426E93F720;
	Tue, 10 Dec 2024 00:38:22 -0800 (PST)
Message-ID: <0224b253-5eae-4921-a066-308033396a73@arm.com>
Date: Tue, 10 Dec 2024 14:08:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: refactor the rodata=xxx
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, patches@amperecomputing.com, cl@linux.com,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, inux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241209072020.4743-1-shijie@os.amperecomputing.com>
 <20241209072020.4743-2-shijie@os.amperecomputing.com>
 <d13f1879-7fbc-458d-8fd3-4340b51165fd@arm.com>
 <CAMj1kXFJhFfhy=Gwm=QrdN6XPUd=7SKNKFBF_Z4eQ30r509BCg@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAMj1kXFJhFfhy=Gwm=QrdN6XPUd=7SKNKFBF_Z4eQ30r509BCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003829_075134_2F7401A5 
X-CRM114-Status: UNSURE (   9.77  )
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



On 12/10/24 12:51, Ard Biesheuvel wrote:
> On Tue, 10 Dec 2024 at 08:17, Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>>
> ...
>>
>> Reformatted and cleaned up the above comment a bit but feel free to
>> improve it further.
>>
>> /*
>>  * rodata=on (default)
>>  *
>>  *    This applies read-only attributes to VM areas and to the linear
>>  *    alias of the backing pages as well. This prevents code or read-
>>  *    only data from being modified (inadvertently or intentionally),
>>  *    via another mapping for the same memory page.
>>  *
>>  *    But this might cause linear map region to be mapped down to base
>>  *    pages, which may adversely affect performance in some cases.
>>  *
>>  * rodata=off
>>  *
>>  *    This provides more block mappings and contiguous hints for linear
>>  *    map region which would minimize TLB footprint. This also leaves
>>  *    read-only kernel memory writable for debugging.
>>  *
>>  * rodata=noalias
>>  *
>>  *    This provides more block mappings and contiguous hints for linear
>>  *    map region which would minimize TLB footprint. Linear aliases of
>>  *    pages belonging to read-only mappings in vmalloc region are also
>>  *    marked as read-only.
>>
> 
> If linear aliases are marked as read-only, how does 'noalias' differ from 'on'?

Right, the last sentence can be can dropped.

