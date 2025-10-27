Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5194BCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grIP23gGuuKGzwfFND3Q+tCIFmh+AdoDGop/e+5kChA=; b=G4y/RyjGglKhdfgd9EeU5LoX4x
	KNn0qUpCjRS19UgdU+J70x7jSB6lYtZ5z9PE2JqCb+UZFrG2wThMD35i5D7QPGm50V+NvnZvrx//b
	0ZLDk7GB4p8fPR0OAFNXmSBuNVgZspo40B0VvL6tgsAQNzVqHbFjqMZMyoEnDSVEB5wiUEDy/oS8S
	f6qLpxS7Iaxc839h8ivsA7QKzCPMBLHP/NsWAzAFbQ+q9YrImKXG2Jkt7rKetncMXFQBjcF4lNys0
	UsWSS/Eaf6ocyD5kKz+GqeYtLDms2dxCzjMWSlj1yC35aR9h2VwpnApnvktxI/mZfhzxK8Rdb22+r
	WKt+UpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBoO-0000000Cvzk-3wUW;
	Mon, 27 Oct 2025 01:14:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBoM-0000000CvzF-47n0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:14:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A346113E;
	Sun, 26 Oct 2025 18:14:03 -0700 (PDT)
Received: from [10.163.70.164] (unknown [10.163.70.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86CEA3F673;
	Sun, 26 Oct 2025 18:14:08 -0700 (PDT)
Message-ID: <d4d2086b-8fd1-4e52-8e5d-24b2447335f7@arm.com>
Date: Mon, 27 Oct 2025 06:44:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
To: Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
References: <20251024040207.137480-1-anshuman.khandual@arm.com>
 <20251024040207.137480-3-anshuman.khandual@arm.com>
 <95ee2490-6904-4a24-93db-411c489bd2b4@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <95ee2490-6904-4a24-93db-411c489bd2b4@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_181415_073453_9D384AFD 
X-CRM114-Status: GOOD (  14.34  )
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

On 24/10/25 2:26 PM, Ben Horgan wrote:
> Hi Anshuman,
> 
> On 10/24/25 05:02, Anshuman Khandual wrote:
>> Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
>> While here replace hard coded page size based shifts but with derived ones
>> via ilog2() thus adding some required context.
>>
>> TLBI_TTL_MASK has been split into separate TLBI_TTL_MASK and TLBI_TG_MASK
>> as appropriate because currently it simultaneously contains both page size
>> and translation table level information. KVM on arm64 has been updated to
>> accommodate these changes to TLBI_TTL_MASK.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Oliver Upton <oliver.upton@linux.dev>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: kvmarm@lists.linux.dev
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
>>  arch/arm64/kvm/nested.c           |  8 +++++---
>>  2 files changed, 23 insertions(+), 11 deletions(-)
>>
> The code looks correct to me, no functional changes. I however, don't
> have any experience with this code and so don't know whether the split
> of TTL into TG and TTL is a good idea or not and if the kvm naming is

TLBI_TTL field contains both encoded page size and also page table
level information. This split in the mask makes the code much clear
and explicit.
> best to stay the same or be updated to match this.
This proposed patch keeps the KVM code churn to the minimum while
also adapting to the mask split as necessary. But further changes
to KVM if required can be done subsequently later.

