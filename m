Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2F5CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7Sjga0JGNejRHdwGG55kl0k5rSb2MvKolAPg+a2x6M=; b=TxzoafHsfcMyyfQRo3IwLIoV49
	8QbtQY4mrLXmR7vwTzwkYBBEBlju6Vp0uc0tpbTz5+hgyNZfcbEBBlm6FhYgTAck7TksUy5jbILLS
	/4Q61bJs0a+mqji8LhyunYDQbN94dLLDj7RtMPIo6rhvfR2WIPtGAcUeGVZMAZBZV1e6uf/PdDIz6
	1ZSzJ5xA+ulvAdyeYZAvqifjuikLy8Ke7KCevjktY7urxj4A9K9UEHR/kN3Mm3uFySKWzKrNKz0V0
	mlovV265wmBaEkw5Y7gZ9oWlKeHhjb3GCeeKRS9ux8qPr0zH0wy2DYbhuecvxlmiGXYUkxKM/VkKE
	3pRk4tkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDvt-0000000AK39-1AaJ;
	Mon, 12 Oct 2026 11:11:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDvo-0000000AK01-0JD1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:11:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D39011655;
	Mon, 12 Oct 2026 04:10:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3ADB3F882;
	Mon, 12 Oct 2026 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791803457; bh=EuhGFyfDPuJeXZiHjuHL7QF5dqQy0HkQsqlo1Kmryz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SP1FofXQDtL1YvrgZH9s5r9gVZFBCYSW0WkHTHvA0Fqu9uhmI0wEWVopWSIAzZg7A
	 Ni8AvttICf0V2oEgTLk4h+eCtZsqIcFHRntRB2imqgdfZtFxY3fib/VYNMaiGQB4A6
	 TMB6t/dZ13wWhaQyLlb1GuwPIDXX9mhSwtJJ4JG8=
Message-ID: <ded76345-d09f-44d1-8f62-1d9c6ebd4272@arm.com>
Date: Mon, 12 Oct 2026 12:10:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/23] arm64: cpufeature: Store every ID register with
 its overrides applied
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?=C8=98tefania_Ion?= <stefion@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Borislav Petkov
 <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Tarun Sahu <tarunsahu@google.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-9-will@kernel.org>
 <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
 <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_041100_162500_CE086821 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Fuad,

On 11/10/2026 08:34, Fuad Tabba wrote:
> Hi Ben,
> 
> On Fri, 09 Oct 2026 16:51:14 +0100, Ben Horgan <ben.horgan@arm.com> wrote:
> [...]
>>> the same way. Everything read with read_cpuid() goes through
>>> read_cpuid_with_overrides(). CTR_EL0 and CNTFRQ_EL0, which are read
> [...]
>> For completeness shouldn't read_cpuid(SMIDR_EL1) change to
>> read_cpuid_with_overrides(SMIDR_EL1)?
> 
> "Everything" should have said every register in arm64_ftr_regs[], and
> SMIDR_EL1 isn't one of them, so read_cpuid_with_overrides() would hit
> the WARN_ON() in get_arm64_ftr_reg() whenever SME is enabled.

Thanks for the explanation. If I understand correctly, SMIDR_EL1 isn't in arm64_ftr_regs[] because
there is no need to sanitize SMIDR_EL1 to give a consistent view across cpus. If and when support
for sme priority is added then a unified view of the SMIDR_EL1.HIP, highest implement priority,
would be needed and so at that point deserve a place in arm64_ftr_regs[].

Cheers,
Ben

> 
> Thanks,
> /fuad


