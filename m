Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAC4CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 04:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Date:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=; b=YbvGoju+MN1zHpqqDGOIoHbyg+
	nCY4AQh/Ix2MkWWjDI0fSDrt/8OteLfEXCoEPgja1HvOV+1oZ2KR8kzXCKj0W7PbMTNQGDVN/zqbj
	/TkK+jJin9nDapdpYirNeQ9BwLjPWLC/6Te9C00TaGSpJDPO5SJdLKLGsJCb+4gqortTL+wCTkrHX
	Xq4jzPcPVv4TtPJJrsXOWc45eWV6cekIpB24rqb8iHDdS91wm0Aom2b82VtOfeA1VULjJWgFpyU8o
	KJRx58R58V4Tq5Bhztx8ONb6nG/jToDu8pjzjqaL4r7Ze8aV1xhZ9rtNduIEvo+2Fg9pfJckuGvRc
	9PasT/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGVRv-0000000D0rn-0l10;
	Wed, 05 Nov 2025 04:48:47 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGVRr-0000000D0rQ-3u4d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 04:48:46 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b679450ecb6so4749477a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 20:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762318123; x=1762922923; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
        b=BcnTeOu/GPHKyViSd2YKz05Kqpw1NNuw5RUYA7qhFjVevofZ0MosDw4+8iFl576ZuP
         hoe7PyhEMKehzFBIHjpxXFrKlTw30oy5PhqIcGR1x4vyNRhivC8+1CbpNtLIQtc/5CF+
         0RuUDpqgJ+CALJ7pQ0FboFMPvNU2TgXq6wuoD/8z4U6pF43PkiQAIPCfQJuDkTr8pc6o
         BnQJvKU2saqRRPna6CIDcO7VXTRS56IqCG8sS4NvATvEiz/2F0ZqVgv2OoXUtZbEJYgI
         jk+CnOJjcaKTQnI3TYZKukgAcKc7ZIEGbNIhwLKtNMNdQUGm5Zb0GaQBYhFxsjbVOVuW
         0Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762318123; x=1762922923;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YULlj58qL4zgqYnaxIvN0IRxkfnew4hxgBmocTGIAOg=;
        b=BYqPVZzJxqIL9a0bo+3O/6wAkLxAj0uTNh5W9X1O75x+wsDx35xL8gezhlI60zeF/L
         hIz+qLuN1W9sxn/D0aQ/QpEu5yarGsCvzWPIOL6f0RFJrKuUebZCflsX0hjae2j3iS0V
         0ftVybEblvy5ryQB5rkX7/k04OJZtiC2zyuS4ND+91SRe2zvBAX5Ik9RNEPMPB1M/CPF
         TaWIH/1NuDGuvnuNYEK49JQ1kMokBiOhvzY147dLIYDalCPgjS2/nweYIYQVd1dtwwh2
         2avrc0sf8ChAIHeWAAmpRzkI/LW9sQQid+humX8QVrHCpfyvJ+i521/yWto5qQfnFLgr
         vOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2ExnB+3PDm28CbYP5bpADwvNnteGMCAqa0phgbe56EE6or5Sd+OdgAocYI35+8vTf2HWwFWDWnL7+5mbNpf7Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7w3zCf7fJ6+naj7iAL6lR0hDJX5IAPKRZYgdZ7K1xizhmseiU
	OS3wUxHu2bxDOZcI7z3c1z2VL8ubLgRJBaYXZrxF+dl9BQrciNT3jfHq
X-Gm-Gg: ASbGncuSADa1o1COO1PTOcjG6e3mubPq3d/Ge/wH3I71H7t1oRQZh+6o68meoRbs/KU
	qMgPnC+2oKFDvwvfbGZ7G2O13diIu4SrJOFyNjOjqGK0lSbSs4lO9VD/MfeXFd0sLohjFJJYlK0
	zw6MgJ6NIKrHrysMpbbrID/DuEOJjS7vgQo1thx6SNyS6QV3OFHJYxJr4KREYbCeCdWZ2TYcXHh
	Ajw0iWxmwgDTc7Mz4onzWTz2NC7Y7R+QUjDydHhzgiuHmcdnC5E1KRtS8gFy2EAS0uaKEV77U1V
	4JGsgPKKCGT3MiQPi6vBy3Db6S5eCD7un0WZIfLEYucAC6kHvA2O8FEtRpoG3JzUtXH26Ylu6KD
	0bMA4R6owdr+uY2wJK9AqSR5jGByvS5I5GLgoZ3XXTImt1t16w+w/CgtExPA69l597kjtQA==
X-Google-Smtp-Source: AGHT+IEGT+eOgR9ydzqm23BJtuNpA3RB5HWaj5Ha9KjzqVJ/S6kqSTkQbIaWCHaOF+SdxbuTbYvUtA==
X-Received: by 2002:a05:6a20:7483:b0:34e:63bd:81c1 with SMTP id adf61e73a8af0-34f839f5a57mr2604485637.3.1762318122822;
        Tue, 04 Nov 2025 20:48:42 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd6824811sm4742988b3a.64.2025.11.04.20.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 20:48:42 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
In-Reply-To: <20251029100909.3381140-6-kevin.brodsky@arm.com>
Date: Wed, 05 Nov 2025 10:10:33 +0530
Message-ID: <87o6ph3xdq.ritesh.list@gmail.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com> <20251029100909.3381140-6-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_204843_994313_4B860289 
X-CRM114-Status: GOOD (  21.41  )
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

Kevin Brodsky <kevin.brodsky@arm.com> writes:

> Architectures currently opt in for implementing lazy_mmu helpers by
> defining __HAVE_ARCH_ENTER_LAZY_MMU_MODE.
>
> In preparation for introducing a generic lazy_mmu layer that will
> require storage in task_struct, let's switch to a cleaner approach:
> instead of defining a macro, select a CONFIG option.
>
> This patch introduces CONFIG_ARCH_HAS_LAZY_MMU_MODE and has each
> arch select it when it implements lazy_mmu helpers.
> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is removed and <linux/pgtable.h>
> relies on the new CONFIG instead.
>
> On x86, lazy_mmu helpers are only implemented if PARAVIRT_XXL is
> selected. This creates some complications in arch/x86/boot/, because
> a few files manually undefine PARAVIRT* options. As a result
> <asm/paravirt.h> does not define the lazy_mmu helpers, but this
> breaks the build as <linux/pgtable.h> only defines them if
> !CONFIG_ARCH_HAS_LAZY_MMU_MODE. There does not seem to be a clean
> way out of this - let's just undefine that new CONFIG too.
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/Kconfig                                 | 1 +
>  arch/arm64/include/asm/pgtable.h                   | 1 -
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>  arch/powerpc/platforms/Kconfig.cputype             | 1 +
>  arch/sparc/Kconfig                                 | 1 +
>  arch/sparc/include/asm/tlbflush_64.h               | 2 --
>  arch/x86/Kconfig                                   | 1 +
>  arch/x86/boot/compressed/misc.h                    | 1 +
>  arch/x86/boot/startup/sme.c                        | 1 +
>  arch/x86/include/asm/paravirt.h                    | 1 -
>  include/linux/pgtable.h                            | 2 +-
>  mm/Kconfig                                         | 3 +++
>  12 files changed, 10 insertions(+), 7 deletions(-)

Maybe we can add this to ... ?

Documentation/features/vm/lazy_mmu/arch-support.txt

#
# Feature name:          lazy_mmu mode
#         Kconfig:       ARCH_HAS_LAZY_MMU_MODE
#         description:   arch supports arch_{enter|flush|leave}_lazy_mmu_mode()
#
    -----------------------
    |         arch |status|
    -----------------------
    |       arm64: |  ok  |
    |     powerpc: |  ok  |
    |       sparc: |  ok  |
    |         x86: |  ok  |
    -----------------------


As for this patch, the changes are mostly straight forward around the
configs part. This looks good to me. Please feel free to add: 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

-ritesh

