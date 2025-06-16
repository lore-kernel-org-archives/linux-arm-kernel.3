Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB7BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0uYI/Yt9kTpet11sTd2e5MM0JBZfWAXMdid3EX/Ftw=; b=T9K/Mq8cJtmi22
	m64SZHeBc4Qre1KqLbcXylYjZr1WI+Gw9rGEymCjx2eVTLHvwig4TvVOVIU7c5RKw32kdPvmGo09C
	kCoZ1GgYcP9JGp7nl4LykgmK1tVIfLoeyX5XcQaY9SAudwwWGunI1SGckkKyZUQkTNxUoD3zEsVC5
	IfT3xeXnJE9z95BXyrjG/wVPJ5nIdhw+r/T0tV9YcNuNW8CCQtY3biGRsMk6IWVLpk80lSATccYu6
	OgRkC4jGxgpsjmJOEefM/rndYK0YijEnnI3EcuoJGoLYyYVAP6GEiqMkAYvhPtgampjy1TjMWrw4b
	sAimWtzEAXH+WX3f4pfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLL-000000054qm-0V7P;
	Mon, 16 Jun 2025 17:09:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBQf-00000004nZF-0FuW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 15:07:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D41C150C;
	Mon, 16 Jun 2025 08:06:56 -0700 (PDT)
Received: from [10.1.26.178] (e137867.arm.com [10.1.26.178])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40E3D3F673;
	Mon, 16 Jun 2025 08:07:16 -0700 (PDT)
Message-ID: <faff5bb7-522c-467f-8e3a-c58f3439de8b@arm.com>
Date: Mon, 16 Jun 2025 16:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] arm64: debug: remove hook registration, split
 exception entry
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
References: <20250609173413.132168-1-ada.coupriediaz@arm.com>
 <aEsZ6pwRcoI_wUqe@uudg.org>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <aEsZ6pwRcoI_wUqe@uudg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_080721_172700_F2FD6AC4 
X-CRM114-Status: GOOD (  17.29  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 12/06/2025 19:18, Luis Claudio R. Goncalves wrote:

> On Mon, Jun 09, 2025 at 06:34:00PM +0100, Ada Couprie Diaz wrote:
>> [...]
>>
>> PREEMPT_RT
>> ===
>>
>> Of note, this allows us to make the single exception handling mostly
>> preemptible coming from EL0 in patch 9, fixing an issue with PREEMPT_RT[0].
>> The commit message details the reasoning on why this should be safe.
>> It is *definitely* not preemptible at EL1 in the current state, given
>> that the EL1 software step exception is handled by KGDB.
>>
>> CC-ing Luis as he did a lot of testing on v2 and originally
>> reported the issue.
>>
>> Cc: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
>>
>> We can do the same for the software break exception coming from EL0,
>> which works in a very similar way.
>>
>> However, the hardware breakpoint and watchpoint exceptions also have
>> a sleeping while non-preemptible issue with PREEMPT_RT, but this is
>> much trickier to fix, so this won't be fixed in this series.
>> A bit more details in [1].
>>
>> I hesitated to add comments within the BRK64 and single-step handlers,
>> on the EL0 paths, to highlight that they would be preemptible and to be
>> wary if modifying or adding to them, but I opted not to in the end.
>> (Partly as I didn't find a satisfactory way to do it !)
>> I would be happy to add some if anyone finds it would be beneficial.
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
>
> Works as advertised, fixes the reported RT problem, fails on the specific
> case Ada described above. :)
>
> Best regards,
> Luis
>
Thanks again Luis for the thorough testing and reports !

Best regards,
Ada


