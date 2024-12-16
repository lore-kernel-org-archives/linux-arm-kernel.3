Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36116E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 04:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIcGSc48+FseMRl+tpLnHkDad0CMHtX+B0UpktC8MDc=; b=fQY5l6bG9ys3C3TnjsPhSgVLvV
	SIWOGa8UDRP/kTTIJ4ZrhQrUDi0CyGQPW90GHaGjmWJUqZ9dVp/w6MV+Xq6W463kf+Dt9afkkhNKv
	7i0bxam1acJm5JXRuWebtf7ijo6+t8JjoQQ9ersy/oy8mrvtFnz/AL2rpBCPbVYzok1qRTI7d0i5t
	L94wBV1TF3+4nZIirQ5OsSEAQD5YiiECpsT/UfPKLd8iOl5CpwYqxPCr5qL9OiX0BnAbL1JQh7fL0
	i95JBCcLMdKKXRMIFAG3bRaN93G9YIJWWeSahOGDo4DYZgwPXmBCEdgLUDMOFBSPT7eby6+UuDWSn
	T3EoSUUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2nA-000000091sv-3oDa;
	Mon, 16 Dec 2024 04:33:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2m5-000000091kb-06p0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 04:32:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C13111FB;
	Sun, 15 Dec 2024 20:32:30 -0800 (PST)
Received: from [10.162.16.49] (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABF8D3F58B;
	Sun, 15 Dec 2024 20:31:58 -0800 (PST)
Message-ID: <1bd6db20-7012-49d5-9e9f-38a84c3946a5@arm.com>
Date: Mon, 16 Dec 2024 10:01:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: fault: replace the behavior of fault_info[18]
To: Leesoo Ahn <lsahn@ooseel.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Suren Baghdasaryan <surenb@google.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241214091937.203842-1-lsahn@ooseel.net>
 <CANTT7qi=wZvOQP4PFEi7300MbNjsJ2q=WXceHch1BUrtL-WFDQ@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CANTT7qi=wZvOQP4PFEi7300MbNjsJ2q=WXceHch1BUrtL-WFDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_203205_174879_EF5EBDBD 
X-CRM114-Status: GOOD (  15.63  )
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



On 12/14/24 15:08, Leesoo Ahn wrote:
> I just figured out that do_sea(..) isn't the right function to deal
> with VMSAv9-128.
> Please ignore this patch.

Right, actual handling needs to be sorted out when 128 bit PTE is enabled.
For example, following change might be required to handle 128 bit related
faults but the handlers such as do_sea(), do_bad(), do_translation_fault()
need to be changed and tested for 128 bit PTE format.

--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -415,7 +415,8 @@ static inline bool esr_fsc_is_translation_fault(unsigned long esr)
               (esr == ESR_ELx_FSC_FAULT_L(2)) ||
               (esr == ESR_ELx_FSC_FAULT_L(1)) ||
               (esr == ESR_ELx_FSC_FAULT_L(0)) ||
-              (esr == ESR_ELx_FSC_FAULT_L(-1));
+              (esr == ESR_ELx_FSC_FAULT_L(-1)) ||
+              (esr == ESR_ELx_FSC_FAULT_L(-2));
 }
 
 static inline bool esr_fsc_is_permission_fault(unsigned long esr)
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 8b281cf308b3..3a35c580395e 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -823,7 +823,7 @@ static const struct fault_info fault_info[] = {
        { do_page_fault,        SIGSEGV, SEGV_ACCERR,   "level 3 permission fault"      },
        { do_sea,               SIGBUS,  BUS_OBJERR,    "synchronous external abort"    },
        { do_tag_check_fault,   SIGSEGV, SEGV_MTESERR,  "synchronous tag check fault"   },
-       { do_bad,               SIGKILL, SI_KERNEL,     "unknown 18"                    },
+       { do_sea,               SIGKILL, SI_KERNEL,     "level -2 (translation table walk)"     },
        { do_sea,               SIGKILL, SI_KERNEL,     "level -1 (translation table walk)"     },
        { do_sea,               SIGKILL, SI_KERNEL,     "level 0 (translation table walk)"      },
        { do_sea,               SIGKILL, SI_KERNEL,     "level 1 (translation table walk)"      },
@@ -847,9 +847,9 @@ static const struct fault_info fault_info[] = {
        { do_bad,               SIGKILL, SI_KERNEL,     "unknown 39"                    },
        { do_bad,               SIGKILL, SI_KERNEL,     "unknown 40"                    },
        { do_bad,               SIGKILL, SI_KERNEL,     "level -1 address size fault"   },
-       { do_bad,               SIGKILL, SI_KERNEL,     "unknown 42"                    },
+       { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "level -2 translation fault"    },
        { do_translation_fault, SIGSEGV, SEGV_MAPERR,   "level -1 translation fault"    },
-       { do_bad,               SIGKILL, SI_KERNEL,     "unknown 44"                    },
+       { do_bad,               SIGKILL, SI_KERNEL,     "level -2 address size fault"   },
        { do_bad,               SIGKILL, SI_KERNEL,     "unknown 45"                    },
        { do_bad,               SIGKILL, SI_KERNEL,     "unknown 46"                    },
        { do_bad,               SIGKILL, SI_KERNEL,     "unknown 47"                    },


> 
> BR
> Leesoo
> 
> 2024년 12월 14일 (토) 오후 6:20, Leesoo Ahn <lsahn@ooseel.net>님이 작성:
>>
>> Replace the behavior of 18th element of fault_info with the 'fn' member to
>> do_sea(..) and 'name' to 'level -2 (translation table walk)' based on
>> the information[1] of the latest reference manual[2].
>>
>> The information has described in the chapter, D24.2.40 of [2] and
>> DFSC[5:0] bit (stands for Data Fault Status Code).
>>
>> [1]: Synchronous External abort on translation table walk, level -2
>> [2]: Arm Architecture Reference Manual, for A-profile architecture
>>
>> Signed-off-by: Leesoo Ahn <lsahn@ooseel.net>
>> ---
>>  arch/arm64/mm/fault.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index ef63651099a9..b1c08289a5cc 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -863,7 +863,7 @@ static const struct fault_info fault_info[] = {
>>         { do_page_fault,        SIGSEGV, SEGV_ACCERR,   "level 3 permission fault"      },
>>         { do_sea,               SIGBUS,  BUS_OBJERR,    "synchronous external abort"    },
>>         { do_tag_check_fault,   SIGSEGV, SEGV_MTESERR,  "synchronous tag check fault"   },
>> -       { do_bad,               SIGKILL, SI_KERNEL,     "unknown 18"                    },
>> +       { do_sea,               SIGKILL, SI_KERNEL,     "level -2 (translation table walk)"     },
>>         { do_sea,               SIGKILL, SI_KERNEL,     "level -1 (translation table walk)"     },
>>         { do_sea,               SIGKILL, SI_KERNEL,     "level 0 (translation table walk)"      },
>>         { do_sea,               SIGKILL, SI_KERNEL,     "level 1 (translation table walk)"      },
>> --
>> 2.46.1
>>
> 

