Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=00K+JDhU;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YEc9uOwK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=voXWE43TKZzjj6nJV8gFDultxRVrBwVOyi5RshFaUXQ=; b=00K+JDhU+hf7TY
	q4s8D2R9rqOWZJb2jGh6MGDlwgipIAdLNs3cRc4X+KY1dDx6BvfQrZaLl/Bo2d78I3dYChIxPvqPy
	oldmYXVcphl8Hr/1BTA/wEQotR5MyUg6wgiD5VyLudqfc9wweUWM+bGPyZjhqPqgBcGlxU7tMvtjv
	Ma03SEzcMP6VxfT8Zkn7Anj3EZrttNcqgEttJQEUHv/10ECp714R5UeXCMRy28wXCQ5+m6bVs6nmu
	bXhWN2IGmM08tGTXfBJLH/lJfMQ4pw+KmbD72DBglC7GNBP2yV0vxkH4EHuMmB9v087rncuUdT+t5
	skBmJfztfAW6UXn1A+sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgx-0000000881i-0TZY;
	Thu, 05 Nov 2026 08:19:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsgd-000000087rF-3xwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:19:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63EAF15A1;
	Thu,  5 Nov 2026 00:19:01 -0800 (PST)
Received: from [10.57.17.66] (unknown [10.57.17.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D64D83F673;
	Thu,  5 Nov 2026 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793866744; bh=bTT01ldQJro64DbDN3GZnqw1GrxcI2GgeVkpWVQKF/w=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=YEc9uOwKpkG3VIo8BNC1Jc7JWkHGwFeOGrZAhgcSe9JSpicwMRNHh7/SpXxFugEKd
	 E/6WcZEpwSmKf6a6pwXYQ7KDsDvx2WH4QQu0QPTrI2+4h5in1ky6m7xvJKypoPzaYn
	 wAB7G83GeLBT0zBXUpBtBuY78ekPLBN/1DQrDT3s=
Message-ID: <d0e63c8c-ac81-4daa-b359-622f16e91d67@arm.com>
Date: Thu, 5 Nov 2026 09:18:38 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v9 08/25] arm64: Initialize POR_EL1 register on
 cpu_resume()
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Linu Cherian <linu.cherian@arm.com>
Cc: linux-hardening@vger.kernel.org, Andrew Morton
 <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 =?UTF-8?Q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Ira Weiny <iweiny@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
References: <20260818-kpkeys-v9-0-743ad31b2c8f@arm.com>
 <20260818-kpkeys-v9-8-743ad31b2c8f@arm.com>
 <apkMDaRKqX3TTINV@a079125.arm.com>
 <139b273a-d868-4d82-92b6-cccfb0048c44@arm.com>
Content-Language: en-GB
In-Reply-To: <139b273a-d868-4d82-92b6-cccfb0048c44@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001908_142473_29EB9761 
X-CRM114-Status: GOOD (  15.99  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/09/2026 18:45, Kevin Brodsky wrote:
> On 03/09/2026 07:56, Linu Cherian wrote:
>> Kevin,
>>
>> On Tue, Aug 18, 2026 at 03:08:50PM +0100, Kevin Brodsky wrote:
>>> From: Yeoreum Yun <yeoreum.yun@arm.com>
>>>
>>> The POR_EL1 register is reset to an unknown value after cpu_suspend().
>>> Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
>>> initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().
>>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>> ---
>>>  arch/arm64/kernel/sleep.S | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
>>> index f093cdf71be1..e0a6ad85cd24 100644
>>> --- a/arch/arm64/kernel/sleep.S
>>> +++ b/arch/arm64/kernel/sleep.S
>>> @@ -3,6 +3,7 @@
>>>  #include <linux/linkage.h>
>>>  #include <asm/asm-offsets.h>
>>>  #include <asm/assembler.h>
>>> +#include <asm/kpkeys.h>
>>>  #include <asm/smp.h>
>>>  
>>>  	.text
>>> @@ -134,6 +135,17 @@ SYM_FUNC_START(_cpu_resume)
>>>  	/* load sp from context */
>>>  	ldr	x2, [x0, #CPU_CTX_SP]
>>>  	mov	sp, x2
>>> +
>>> +#ifdef CONFIG_ARM64_POE
>>> +alternative_if_not ARM64_HAS_S1POE
>>> +	b	.Lskip_por_set
>>> +alternative_else_nop_endif
>>> +	mov_q	x2, POR_EL1_INIT
>>> +	msr_s	SYS_POR_EL1, x2
>>> +	/* isb can be skipped since cpu_do_resume() will do it. */
>>> +.Lskip_por_set:
>>> +#endif /* CONFIG_ARM64_POE */
>> Would it be better to move this under__cpu_setup ?
> I didn't think about that, that's quite neat as it avoids having to take
> care of the resume path separately. It also feels fairly logical as
> POR_EL1 should be configured very early (since it impacts all accesses
> once enabled). Will do in the next version, thanks!

Turns out there's a complication here: __cpu_setup() always runs at EL1,
even when we will run with VHE at EL2. To make that case work, we would
also need to amend __finalise_el2 to transfer POR_EL1 into POR_EL2.

Overall it doesn't seem to be easier, and my impression is that we avoid
handling registers in __cpu_setup/__finalise_el2 if it can be done at a
later stage. I'll leave the approach unchanged in RFC v10.

- Kevin

