Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128BCC02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 13:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUhsDBP3PI1peJSiZ0tyfUXTP0DbU925UTAxtrc4x+Y=; b=SibwE/83+eO0WyYzriI8A4biSw
	fEfrWRSOLuU4vTXFSyB4cq5Cm75z53JILUjAQHSClPJFIHgKdKvE11nxaquGB9Z9oqJWVeYYAVXMU
	nYMPfhGdqlm4cnDj7QD08Fz0PSmKgTB2akXy8/KXLRRmYXJVamjd26vGDWn9ac5DyN0WUSrCO7xvY
	kxBCutZSsqPn9O+bkzI+9h2TwGkuAN4SEfPUnbwoK6TrZH+PO5vNIwGbtMoNamlqWFxShpOWZIQtb
	sX/WlXEaFCDsZpPOkfCP6jq5IZg5xtBYrCL+5aScn7JG5zLeZ06W/yw4b0Q2bXNFA0fsvXN4tig86
	j+1aYFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQHQ-0000000F31i-2CE0;
	Thu, 16 Jan 2025 13:51:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQGA-0000000F2ui-0H9u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 13:50:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 494ED106F;
	Thu, 16 Jan 2025 05:50:35 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5B313F77D;
	Thu, 16 Jan 2025 05:49:59 -0800 (PST)
Message-ID: <e79c78a7-24a3-42e6-a217-ec64f8320e91@arm.com>
Date: Thu, 16 Jan 2025 13:49:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: arm64: Fix the upper limit of the walker range
To: Marc Zyngier <maz@kernel.org>, Sebastian Ene <sebastianene@google.com>,
 Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 oliver.upton@linux.dev, will@kernel.org, Aishwarya.TCV@arm.com
References: <20250114145050.563658-2-sebastianene@google.com>
 <14cce00c-29bd-4feb-b7d0-7aae6e948d1e@sirena.org.uk>
 <8634hjvxi2.wl-maz@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <8634hjvxi2.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_055010_154501_80139056 
X-CRM114-Status: GOOD (  14.08  )
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

On 16/01/2025 10:55, Marc Zyngier wrote:
> On Thu, 16 Jan 2025 01:16:40 +0000,
> Mark Brown <broonie@kernel.org> wrote:
>>
>> On Tue, Jan 14, 2025 at 02:50:51PM +0000, Sebastian Ene wrote:
>>
>>> Prevent the walker from running into weeds when walking an
>>> entire address range.
>>
>> The KVM page_fault_test selftest started failing in next-20250115 on
>> at least n1sdp and TX2 in VHE mode and a bisect seems to point to this
>> change.  The bisect only just finished, I've done no further
>> investigation.
>>
>> When the test fails it generates backtraces like that below:
> 
> [...]
> 
> Thanks for the heads up.
> 
> Given how close we are to the merge window opening, I've dropped this
> patch from -next.
> 
> Seb: it looks this breaks a bunch of existing assumptions. Let's
> revisit this before -rc1, if possible.
In kvm_pgtable_walk() we set the walk_data.end to PAGE_ALIGNED(start + 
size), where size is BIT(ia_size) and start = 0, for 
kvm_pgtable_stage2_destroy().

And subtracting the limit in _kvm_pgtable_walk makes things go bad,
  returning -ERANGE.
Given the kvm_pgtable_walk() passes the "end" as the top address (not 
including it), and is always PAGE_ALIGNED, we should probably leave 
things as it is in the code.


Cheers
Suzuki


> 
> Thanks,
> 
> 	M.
> 


