Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706FCC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 18:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVFFcWh5dZoKRR9sK5sDoRV9h4cdUzLL2+BzZ81kSD4=; b=PqzCmXIfzwhmJVKsEP2/wivHlT
	4O6H0VVtfeQR/KnMoH27uha+WGWMtJuFh6cDGMBBoS3ILKDGJbVd8UxUwdFj+yY9jqUT7oWyRqtok
	+y3sNBb0JE8XJeqZAfgYW+HkR7a4IDXVxvo03eF//dSo4eHy5DbQlXFogiGEs3Ra+hi78BHn840yc
	fgM/JusLTq/Dv2nOSaHnSQp0MJv70FkhHbbor8XmUGuzs440TausSGetNfPc4IVj/IUSO2FmWWtZp
	99RnQU43YSPYlZ/wydNRNQ2KbLvkQgHxOyCnyquoWEFxnuMBNsOvtnQjCKxHzQxgyHVeT5Ft+yzvz
	yxdwhGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twml1-00000003yCV-43Vz;
	Mon, 24 Mar 2025 18:42:43 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twmjI-00000003y3m-46eh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 18:40:59 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-47666573242so82061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 11:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742841655; x=1743446455; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVFFcWh5dZoKRR9sK5sDoRV9h4cdUzLL2+BzZ81kSD4=;
        b=k40Ld3+PKsh2Dw9MEFJucJg6xRDcrjTHUIsuWpycKSJCCIsrgQl5QtiIiAvtxOjxTW
         FfilsXAvt+kgOpe/JQJHYv0R1d6PL+bG1DY7UWokXt0HKHnNDt0yYMRbtlWeXu2rbU9S
         QALlgPjwfMfuAb/a68OLkjZ7AUsEIITc0SD2FisbhlkPCO8jQmBW5N2oIQZ6a896vR5E
         3BhVJckZNmqNYDrjCQWw8nBbC3IcR825VEWPbkvi6PhgdiUL417CJmsqft+g07OB0/4r
         A2NS/DIDufvmaIRw9259Tq7qrIZCJUqZCCiBfndIzJT50si6ZcdAS10k2fYXLRSNaWtL
         5aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742841655; x=1743446455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVFFcWh5dZoKRR9sK5sDoRV9h4cdUzLL2+BzZ81kSD4=;
        b=mqPOoRimErMiUk7I76bigb9xI/DhJKX/D2MCptrpokVn6qrmiwkDfJxfumCbayPgJG
         CDVpeF2thVPBOwV44fsZrZQkzUBbfZjnMKAr392FjI59DcgjiJwLR9VX2yESS+KtlEJ4
         yc+Y64YUmF+pFjtWAPNFI2xl4SM4BaAWnfjUmlY0PfdFUiof8h86c+opRSLiOsI2h/mD
         xOHYpBJCDnsPFmqaEAHgy0f+AyMkkfPx/ILg/p84WPwMVEs5AHJX9FDVNIofzIY9v1Nq
         0TObnM7vCO+ldezN9cN2TNuV0TTwOQW4lgPKzYtRdx/aS+tKn7MtuMmcd15oQtwm6J/O
         XyDg==
X-Forwarded-Encrypted: i=1; AJvYcCXCWs7p9vQyHMgdGMf1mOaTGqZeqzFRU/nfxKjzC+Eua/0unzmEP1Xzz1rsOiqzvNCXQGjEMcnyOxqszEpZ0KJh@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8DknntYkwN6jYgzz/cJ0bNfV0NLac72fjqsBkdi4e0b/GgS//
	7PL2NmARaj6xn/5jEUV+W292FQpXU783/TN9hbkaUN12WninYlw4tCOrG66XrO4yl8A0tLfIeU1
	0vo81N0vQtctTiObAfCKQqPSF4Wq46Xq3F5c0
X-Gm-Gg: ASbGncuMUHY4d6bYn3eOaA9OR+xEoY8McJ39QOwiqUfeYJMQdsZR+gPpdS8+HxM+BYg
	yLbCmijwNS6VnAGk1sN917GrfPxJB3IAKXQo8ggvJy8ERuxKFRAgnWN+R/ax/sbRBOfpDQacp33
	OXpndgPmCNbrbrgWwTaXjjauw=
X-Google-Smtp-Source: AGHT+IE5+gZ94fZfEMa4/mu+5y69Keqgf6GYglfVDQZk9TGfgwTjD/V2nGDREwNflvI0c0qaa+IqDh+lZikxQgFL/jU=
X-Received: by 2002:a05:622a:17c4:b0:475:1410:2ca3 with SMTP id
 d75a77b69052e-4772be23f26mr9607281cf.15.1742841654660; Mon, 24 Mar 2025
 11:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com> <20250320015551.2157511-8-changyuanl@google.com>
In-Reply-To: <20250320015551.2157511-8-changyuanl@google.com>
From: Frank van der Linden <fvdl@google.com>
Date: Mon, 24 Mar 2025 11:40:43 -0700
X-Gm-Features: AQ5f1JqgK3t9nzg4mdWiXWpH_sA43D2BNXiBuTZpvx6PAjAQCpPGjdYAtW64c_s
Message-ID: <CAPTztWbFXajArSN8yKu32eSoR=xsk1CHM_4V7MJ0eQxydFqPUQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
To: Changyuan Lyu <changyuanl@google.com>
Cc: linux-kernel@vger.kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	luto@kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_114057_010088_D53A1A21 
X-CRM114-Status: GOOD (  27.44  )
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

On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Changyuan Lyu <changyuanl@google.co=
m> wrote:
>
> From: Alexander Graf <graf@amazon.com>
>
> Add the core infrastructure to generate Kexec HandOver metadata. Kexec
> HandOver is a mechanism that allows Linux to preserve state - arbitrary
> properties as well as memory locations - across kexec.
>
> It does so using 2 concepts:
>
>   1) State Tree - Every KHO kexec carries a state tree that describes the
>      state of the system. The state tree is represented as hash-tables.
>      Device drivers can add/remove their data into/from the state tree at
>      system runtime. On kexec, the tree is converted to FDT (flattened
>      device tree).
>
>   2) Scratch Regions - CMA regions that we allocate in the first kernel.
>      CMA gives us the guarantee that no handover pages land in those
>      regions, because handover pages must be at a static physical memory
>      location. We use these regions as the place to load future kexec
>      images so that they won't collide with any handover data.
>
> Signed-off-by: Alexander Graf <graf@amazon.com>
> Co-developed-by: Pratyush Yadav <ptyadav@amazon.de>
> Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  MAINTAINERS                    |   2 +-
>  include/linux/kexec_handover.h | 109 +++++
>  kernel/Makefile                |   1 +
>  kernel/kexec_handover.c        | 865 +++++++++++++++++++++++++++++++++
>  mm/mm_init.c                   |   8 +
>  5 files changed, 984 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/kexec_handover.h
>  create mode 100644 kernel/kexec_handover.c
[...]
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 04441c258b05..757659b7a26b 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -30,6 +30,7 @@
>  #include <linux/crash_dump.h>
>  #include <linux/execmem.h>
>  #include <linux/vmstat.h>
> +#include <linux/kexec_handover.h>
>  #include "internal.h"
>  #include "slab.h"
>  #include "shuffle.h"
> @@ -2661,6 +2662,13 @@ void __init mm_core_init(void)
>         report_meminit();
>         kmsan_init_shadow();
>         stack_depot_early_init();
> +
> +       /*
> +        * KHO memory setup must happen while memblock is still active, b=
ut
> +        * as close as possible to buddy initialization
> +        */
> +       kho_memory_init();
> +
>         mem_init();
>         kmem_cache_init();
>         /*


Thanks for the work on this.

Obviously it needs to happen while memblock is still active - but why
as close as possible to buddy initialization?

Ordering is always a sticky issue when it comes to doing things during
boot, of course. In this case, I can see scenarios where code that
runs a little earlier may want to use some preserved memory. The
current requirement in the patch set seems to be "after sparse/page
init", but I'm not sure why it needs to be as close as possibly to
buddy init.

- Frank

