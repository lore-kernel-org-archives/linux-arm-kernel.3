Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB91CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58JIz+T98xNuJ35TRUpFdQl+tGQMi+ETXxGZ5QmS7Es=; b=gYKYytOhh4unF8yqMamaiAEwpE
	EkNq6q8LufcUYznd3SV6Dc08cTdWTJX15qVNBCA2uiVnuRgyag++N9gu2Q7Hp2/2epLcJKXpF7UT7
	8kwPE5Dvqs0RrG9pp8IqPmcjfws6tjgPpOKwCMoX0ln86A8OR3szIrbtKq3HLjal8Um2qfGyQ9yg7
	5OYan2swKwqNTEVa1nsLqywCBBjs/azZi/BSB6Dr+5vXe1D49IQ5QOwBMJidJi7R3o96rfhNXSP5N
	3eanCJ/WQolpjWGq+gkzKj7v44NdXB1FdfpItGHHa2a0odzWbQ7sRd33oLEzyPlpaJ1wOgAE/bjhu
	80QUQkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcOW-00000003CZJ-2YnW;
	Fri, 19 Sep 2025 14:47:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcOU-00000003CXr-1TC9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:47:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3e9042021faso1652987f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758293244; x=1758898044; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58JIz+T98xNuJ35TRUpFdQl+tGQMi+ETXxGZ5QmS7Es=;
        b=QxiLq8bnTmjvCF0rJH82HpCZmynH8OQmS00ljCcde+72YogOzt08kM/Wl8Ggs9eFYP
         nfyazjgnNXCFbh2c5+ebRoY9haPv1WJ7CBLuzwD/Fc5shacpZCwopNkto5/29WHPZ+gR
         5VYGQi5L7dfr4fIFche+L8PwihEofmL6iFs1PjCFgmphGpgCGPkBTdZHnPAsq51RMzQ0
         GBmSJO10Q0TfTOLJYUEdmmLHASzFl+SALO0LIkyeqayin6nezJemo0S2afGnKPU80v9Z
         1w5ljY30qJc8nnS6EgvR3gqy3s3kr0qeVPbFwa0JdloCMP+ziIZNx1pi3eteu52S3Eo1
         hLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758293244; x=1758898044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58JIz+T98xNuJ35TRUpFdQl+tGQMi+ETXxGZ5QmS7Es=;
        b=wCiU56Kphn7xsLh79AnH1mv5rRBMjCx+npEennzqYpM2B2FocZrffbSeCe76QyOiWo
         vm680ue1C+cDo0u37z5BWUVR2IiaKUvlvTeKHzOkg+MnKbernUZT+VymLGWZvwDwmJPb
         JB9CDxHZQ4u3v14HEsDGgi+NZjQdK4YbeSD4dZU4R4kkNtl8i/lprMSjiLbXG4FHMy3/
         cMBLmHhbrGWizGFnm6YZXpCZNO4isHxdpuKw+Jim849/jDdh9ae09ilATylbzXbR/tcK
         z0jllUmgBrsz/YPmD4aTx26WzOP9EMaYhoYjRCpETDea8udV3BoISa1qXk/Q1kaSzLQl
         SpWA==
X-Gm-Message-State: AOJu0YyejojPnr6kJCRk5V/pLv2WhRiPEy97rpZT7z1ABCTcC9rjxpTw
	HKr2oF0U/pkHjX1fcxHc0FSA2N2MQeSrdWb4KZI5U0wVUUKhTXLylnuS5XEngzx9kA==
X-Gm-Gg: ASbGncv/8B1LeHZOd1+GthfEqoQG1Di/o+gi2xngh6Vc5o+TVoHdy1df6iwj4/JIBNJ
	/iWF4BarG6hdRYwEtdUjxaazqblQekQD6V736l9fHbe3BokL42vGjOx+osmTT5iXNQa9FOrcWJi
	IvXMo58cwEo4kRoj4Z7vKkONKknjFQjCZc5l39obhCA1KZEAuvCAonCkagfesHJGvHqs9EqQwbD
	cEjsJLHgFnVG6p654UB+ne/91/NT6FHaI4hiPK/1zgwQJZhoJ+m76q5rywku1sR2lPosy8lx6xc
	Dxf8HMDWROLQsRbHQRFnhdnfwHuTO7BFCuXrnNS24/vyx1O93Q/yAM9RuLUrBVzAap4GfqROS6L
	6VBMbh6+UWL4iq/8QCfYSx541PB0RnxfNIdBV4ofPhHo6xyGMQY3ed3cg
X-Google-Smtp-Source: AGHT+IEWBbhkJpfige+suf0vsNLGPkLiHAll4OeC7ziC+CAHJCVZxl4IjAKlTlNyPUIiZscBy0gVAw==
X-Received: by 2002:a05:6000:400c:b0:3ea:9042:e682 with SMTP id ffacd0b85a97d-3ee7c55430amr2895578f8f.11.1758293244246;
        Fri, 19 Sep 2025 07:47:24 -0700 (PDT)
Received: from google.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee1385adebsm6400131f8f.42.2025.09.19.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:47:23 -0700 (PDT)
Date: Fri, 19 Sep 2025 14:47:20 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dylan Hatch <dylanbhatch@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] arch: arm64: Fail module loading if dynamic SCS
 patching fails
Message-ID: <aM1s-I0gM_rAf5LU@google.com>
References: <20250919122321.946462-1-abarnas@google.com>
 <20250919122321.946462-2-abarnas@google.com>
 <CAMj1kXEVThBdH7H7NX+Ma8j0_85GevzczFgvvozK-TsqT2geFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMj1kXEVThBdH7H7NX+Ma8j0_85GevzczFgvvozK-TsqT2geFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_074726_430125_D0E46318 
X-CRM114-Status: GOOD (  24.92  )
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

Hi,

On Fri, Sep 19, 2025 at 03:59:21PM +0200, Ard Biesheuvel wrote:
>Hi,
>
>On Fri, 19 Sept 2025 at 14:23, Adrian Barnaś <abarnas@google.com> wrote:
>>
>> Disallow a module to load if SCS dynamic patching fails for its code. For
>> module loading, instead of running a dry-run to check for patching errors,
>> try to run patching in the first run and propagate any errors so module
>> loading will fail.
>>
>> Signed-off-by: Adrian Barnaś <abarnas@google.com>
>> ---
>>  arch/arm64/include/asm/scs.h      |  2 +-
>>  arch/arm64/kernel/module.c        |  6 ++++--
>>  arch/arm64/kernel/pi/map_kernel.c |  2 +-
>>  arch/arm64/kernel/pi/patch-scs.c  | 15 +++++++++++----
>>  arch/arm64/kernel/pi/pi.h         |  2 +-
>>  5 files changed, 18 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/scs.h b/arch/arm64/include/asm/scs.h
>> index a76f9b387a26..ffcfcda87f10 100644
>> --- a/arch/arm64/include/asm/scs.h
>> +++ b/arch/arm64/include/asm/scs.h
>> @@ -53,7 +53,7 @@ enum {
>>         EDYNSCS_INVALID_CFA_OPCODE              = 4,
>>  };
>>
>> -int __pi_scs_patch(const u8 eh_frame[], int size);
>> +int __pi_scs_patch(const u8 eh_frame[], int size, bool is_module);
>>
>
>Calling the parameter 'is_module' puts the policy in the SCS patching
>code, which now has to reason about how patching a module differs from
>patching other code.

Agreed.

>So I'd prefer to call this 'two_pass' or 'dry_run' or whatever, where
>setting it guarantees that when an error is returned, no function will
>be left in an inconsistent state.

Maybe `bool skip_dry_run`?

>
>>  #endif /* __ASSEMBLY __ */
>>
>> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
>> index 40148d2725ce..5d6d228c6156 100644
>> --- a/arch/arm64/kernel/module.c
>> +++ b/arch/arm64/kernel/module.c
>> @@ -484,10 +484,12 @@ int module_finalize(const Elf_Ehdr *hdr,
>>         if (scs_is_dynamic()) {
>>                 s = find_section(hdr, sechdrs, ".init.eh_frame");
>>                 if (s) {
>> -                       ret = __pi_scs_patch((void *)s->sh_addr, s->sh_size);
>> -                       if (ret)
>> +                       ret = __pi_scs_patch((void *)s->sh_addr, s->sh_size, true);
>> +                       if (ret) {
>>                                 pr_err("module %s: error occurred during dynamic SCS patching (%d)\n",
>>                                        me->name, ret);
>> +                               return -ENOEXEC;
>> +                       }
>>                 }
>>         }
>>
>> diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
>> index 0f4bd7771859..7187eda9e8a5 100644
>> --- a/arch/arm64/kernel/pi/map_kernel.c
>> +++ b/arch/arm64/kernel/pi/map_kernel.c
>> @@ -98,7 +98,7 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
>>
>>                 if (enable_scs) {
>>                         scs_patch(__eh_frame_start + va_offset,
>> -                                 __eh_frame_end - __eh_frame_start);
>> +                                 __eh_frame_end - __eh_frame_start, false);
>>                         asm("ic ialluis");
>>
>>                         dynamic_scs_is_enabled = true;
>> diff --git a/arch/arm64/kernel/pi/patch-scs.c b/arch/arm64/kernel/pi/patch-scs.c
>> index 55d0cd64ef71..78266fb1fa61 100644
>> --- a/arch/arm64/kernel/pi/patch-scs.c
>> +++ b/arch/arm64/kernel/pi/patch-scs.c
>> @@ -225,7 +225,7 @@ static int scs_handle_fde_frame(const struct eh_frame *frame,
>>         return 0;
>>  }
>>
>> -int scs_patch(const u8 eh_frame[], int size)
>> +int scs_patch(const u8 eh_frame[], int size, bool is_module)
>>  {
>>         int code_alignment_factor = 1;
>>         bool fde_use_sdata8 = false;
>> @@ -276,12 +276,19 @@ int scs_patch(const u8 eh_frame[], int size)
>>                                 return EDYNSCS_INVALID_CIE_SDATA_SIZE;
>>                         }
>>                 } else {
>> +                       /*
>> +                        * For loadable module instead of running a dry run try
>> +                        * to patch scs instruction in place and trigger error
>> +                        * if failed, to prevent module loading.
>> +                        */
>
>Move this comment to the module loader, and explain why the two pass
>approach is not needed in this case.
>

Will do.

>>                         ret = scs_handle_fde_frame(frame, code_alignment_factor,
>> -                                                  fde_use_sdata8, true);
>> +                                                  fde_use_sdata8, !is_module);
>>                         if (ret)
>>                                 return ret;
>> -                       scs_handle_fde_frame(frame, code_alignment_factor,
>> -                                            fde_use_sdata8, false);
>> +
>> +                       if (!is_module)
>> +                               scs_handle_fde_frame(frame, code_alignment_factor,
>> +                                                    fde_use_sdata8, false);
>>                 }
>>
>>                 p += sizeof(frame->size) + frame->size;
>> diff --git a/arch/arm64/kernel/pi/pi.h b/arch/arm64/kernel/pi/pi.h
>> index 46cafee7829f..4ccbba24fadc 100644
>> --- a/arch/arm64/kernel/pi/pi.h
>> +++ b/arch/arm64/kernel/pi/pi.h
>> @@ -27,7 +27,7 @@ extern pgd_t init_pg_dir[], init_pg_end[];
>>  void init_feature_override(u64 boot_status, const void *fdt, int chosen);
>>  u64 kaslr_early_init(void *fdt, int chosen);
>>  void relocate_kernel(u64 offset);
>> -int scs_patch(const u8 eh_frame[], int size);
>> +int scs_patch(const u8 eh_frame[], int size, bool is_module);
>>
>>  void map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
>>                int level, pte_t *tbl, bool may_use_cont, u64 va_offset);
>> --
>> 2.51.0.534.gc79095c0ca-goog
>>

Thank you for a review,
Adrian


