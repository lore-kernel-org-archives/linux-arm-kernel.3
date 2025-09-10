Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFDBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saC871Ra37ZYeLH0ht7Gn9MHUi7VAg/OSAptKB4+JI0=; b=nMx5XiGRYQp17idlmPShBKun9X
	s1MFgZMo1YP/UNxWO1TKfTvWOTD2sUEzArtbPDfLF0sWGAWNb73p85XGxkC72xM7M7RenJobrav9s
	LQAa7jEZN+f7CVdbTX+tD6uQSoQH2JHoqIKEFkt0IkUSxl2zcLFxnABTItAg+mf6sR4hI3YOHoRW+
	/zczlo+3C3dJjYzyaQmEZjDkWAseCSZqaikhEMt6ZlTHFXxwYMNb8ADcNyHqOeXmLCB43acBGOuMf
	CxCG0oZWuj3a3Q9Ve5QZpMT20/26WMcYOBfh4eH0hq7DrV+1x81YobXaPw18a5vajGIQj23HmaLex
	P/CMHDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNdt-0000000FTOZ-2fto;
	Wed, 10 Sep 2025 16:25:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNdq-0000000FTMA-1aDm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:25:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A713C16F2;
	Wed, 10 Sep 2025 09:25:44 -0700 (PDT)
Received: from [10.57.67.148] (unknown [10.57.67.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8EE83F63F;
	Wed, 10 Sep 2025 09:25:50 -0700 (PDT)
Message-ID: <bff6c831-68b0-4dbb-b54e-cbf349a942cb@arm.com>
Date: Wed, 10 Sep 2025 18:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Move KPTI helpers to mmu.c
To: Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Kees Cook <kees@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>
References: <20250910104454.317067-1-kevin.brodsky@arm.com>
 <6fd9df06-7120-4eef-9f02-70ba49266c75@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6fd9df06-7120-4eef-9f02-70ba49266c75@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_092554_471988_B85CED1B 
X-CRM114-Status: GOOD (  18.37  )
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

On 10/09/2025 16:33, Ryan Roberts wrote:
> On 10/09/2025 11:44, Kevin Brodsky wrote:
>> create_kpti_ng_temp_pgd() is currently defined (as an alias) in
>> mmu.c without matching declaration in a header; instead cpufeature.c
>> makes its own declaration. This is clearly not pretty, and as commit
>> ceca927c86e6 ("arm64: mm: Fix CFI failure due to kpti_ng_pgd_alloc
>> function signature") showed, it also makes it very easy for the
>> prototypes to go out of sync.
>>
>> All this would be much simpler if kpti_install_ng_mappings() and
>> associated functions lived in mmu.c, where they logically belong.
>> This is what this patch does:
>> - Move kpti_install_ng_mappings() and associated functions from
>>   cpufeature.c to mmu.c, add a declaration to <asm/mmu.h>
>> - Make create_kpti_ng_temp_pgd() a static function that simply calls
>>   __create_pgd_mapping_locked() instead of aliasing it
>> - Mark all these functions __init
>> - Move __initdata after kpti_ng_temp_alloc (as suggested by
>>   checkpatch)
> This is a great clean up IMHO; that alias has caught me out a few times in the
> past when hacking in this area. And this code clearly belongs in mmu.c.

Good to hear!

>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>> Note: as things stand, create_kpti_ng_temp_pgd() could be removed,
>> but a separate patch [1] will make use of it to add an
>> assertion.
> I'd vote for removing it and just calling __create_pgd_mapping_locked() direct.
> The next version of the other patch can just rebase on top of yours and add the
> assert in __kpti_install_ng_mappings().

Oh yes good point, not sure why I didn't consider that! It clearly makes
more sense, I'll send a v2.

> Either way:
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>
>> [1] https://lore.kernel.org/all/20250813145607.1612234-3-chaitanyas.prakash@arm.com/
>>
>> [...]
>>
>> +static pgprot_t __init kernel_exec_prot(void)
> nit: this change (to add __init) is unrelated; does it deserve it's own patch?

I thought I might as well sneak it in since it's still related to KPTI
and in the same block... But happy to split it off if that feels more
appropriate.

- Kevin

