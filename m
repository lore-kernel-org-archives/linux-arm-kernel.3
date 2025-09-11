Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9434CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKzSBV54qKINKYkwNfMm0waFGlIorIbBcEZzxuCJBtU=; b=QWfvhEjxZidYJiBaU/lNSytHGv
	tF8PkjjhqoXpyHCFqasflePWBGKV5aXLBAS0zbDpnimNxhQfvnftHixp5+ys8HlqLmnSo5k0YOJW5
	06JioHFSgrrIp+0l6Xj6vXvUGojxPoQzUd+cVmuScV+eSryiO85NMFhvKRmI2GstJ/8frKqN2e1ut
	qwqiqu/KUTc9aQ7wVOqmvmHgAavZ1uI/UIwlJ316/SZq97T7mgQzf+Eu8GxXEVnvdqf+kfxFKsqOb
	zZnKcp2vMC6I5F5FtwNi+yE/l7M8WBsE9aIzazEyvTI+v8Qg5yzuR4G2tmPHX5KqAMUM89Ooq/Nbf
	kg6GMHAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweuY-00000002Ttt-2hYI;
	Thu, 11 Sep 2025 10:52:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweuX-00000002TtL-1MrI
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 10:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eKzSBV54qKINKYkwNfMm0waFGlIorIbBcEZzxuCJBtU=; b=pQlELqJcKZBYgli0A+BjWJrxop
	0efmR3oNw7iUj1N558et+oxAh2yeMW6/gJJ67h+2AqRnEPkLFoevoyQqtipWWVVYzl1t2FWSXw1Xq
	1wBVYmVhkpCJBENa/weXANVb/5qSMr/sZiVzUx5wjQd7LzvA5wd8hk2cK5zZE4sDbJ71rEyqRZ8Wg
	m9Q47rXpdwMockB3q9QCUvBTgSmG6UlGubfynlIN//95/UgJq7Byz0HzI0tZHjDiuMHItLAhFBVlq
	GS6v95qCUkQ8/fwy3jfaNnUDYzDXIvoa1naVlKCm8jhqx/0ruhyRyR3ZfIWAYVja5qB8ejlIKDywu
	cHvd0c5g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweuR-000000063zL-47hk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:52:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E965153B;
	Thu, 11 Sep 2025 03:52:00 -0700 (PDT)
Received: from [10.57.70.14] (unknown [10.57.70.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A66F3F694;
	Thu, 11 Sep 2025 03:52:05 -0700 (PDT)
Message-ID: <b0b11c57-e45b-4a53-8dba-93e8ce5800c1@arm.com>
Date: Thu, 11 Sep 2025 12:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Move KPTI helpers to mmu.c
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>
References: <20250910104454.317067-1-kevin.brodsky@arm.com>
 <CAMj1kXHR34kpL1qLgeEgEmRZN1o=umWzjZEzmSV+X2AX-4CvVg@mail.gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <CAMj1kXHR34kpL1qLgeEgEmRZN1o=umWzjZEzmSV+X2AX-4CvVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_115212_316935_3A70F80F 
X-CRM114-Status: GOOD (  10.48  )
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

On 11/09/2025 11:19, Ard Biesheuvel wrote:
>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>> index 49f1a810df16..624edd6c4964 100644
>> --- a/arch/arm64/include/asm/mmu.h
>> +++ b/arch/arm64/include/asm/mmu.h
>> @@ -104,5 +104,11 @@ static inline bool kaslr_requires_kpti(void)
>>         return true;
>>  }
>>
>> +#ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>> +void kpti_install_ng_mappings(void);
>> +#else
>> +static inline void kpti_install_ng_mappings(void) {}
>> +#endif
>> +
> Nit: you might just keep the former declaration, and check for
> IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0) in the function, rather than
> propagating this distinction to the header file.
> But either is fine with me.

That's an option, but that would mean removing the #ifdef around the
functions defined in mmu.c. They would probably get eliminated by the
linker if the CONFIG isn't defined, but I'm not so sure about the static
variable (kpti_ng_temp_alloc). Probably not a big deal but I feel
keeping the #ifdef is more self-documenting as well.

- Kevin

