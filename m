Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7DFF44871
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFTHSJoWbrwAI/sIqoC5vjF60iw/CEInfS3ou5ySm6g=; b=4HcFWjuu2zqMqlL0dcuADeUz1a
	c4u+fyufdAh9UPkgULHlFiP8BVrHn6xnzQ4xwbm4i0O/+RUSyO6fh3ko3tdetHng82PCVV3fFaTwN
	vCyQa1QITAkNRF5CGJ3ffFgWkn2D4V59YXV1XBMj/D1e7qnqidGWJNVgVykJW7+A3hpzq7Zp+NFUo
	CgzpFzVlLbeM+qx59YoVGy3D1S3OOdpeDTYg+V76J3yW6KLuKaH/4sFIrZRcM45ipDdJmTBnvD3tE
	P/E1JvsS9y51BNdRoQ/JN2W/miFMreCcSEil+EkqjLfVjr7BgXMWUiYxaUMiJYH1jxK3ktEuMdyth
	oM+GXrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCIC-0000000CLVO-3mhK;
	Fri, 10 Apr 2026 13:53:04 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCIA-0000000CLUh-3rSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:53:04 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-488879dcbc3so270105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775829180; x=1776433980; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uFTHSJoWbrwAI/sIqoC5vjF60iw/CEInfS3ou5ySm6g=;
        b=plxK44v6JOyy3g+BsyOsxDnFVazcxpKAsaq+4UNUHg5WWD3F5Y5h9i3THCxYzJaln2
         6p7rl1ssfMnBF0IsI+Vu+VWUBFfoMUNEDlYW4QuLbQtlhDy5zPdWwDNozd2DnRE1ZTM+
         uTMd6dJW0bSnNYqx+Q0W7j3NUIsBgoD9tz+olfe15HTX1VvfVwCe5XVbJyugzegdKTu3
         agjAm/eymGXv1CsZTycr4YbDCCPTzq1iUWjaSdD33S029qRMSVp22pYtfih9qHMce0Uo
         73+3aKjk8iBXhWCLynnqfOS5PYOS6kq+9WR5Njz7CEP0IxmR9NI9SOz+SEiknGTH0NQZ
         Mgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775829180; x=1776433980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFTHSJoWbrwAI/sIqoC5vjF60iw/CEInfS3ou5ySm6g=;
        b=esOUALh0leGW1TsD+te+yHupS+NbNWavbJuM2KjXgYyfDpNlkSljE6eTpLvmuMoHk6
         dvTuAkyu1/l686P7d4pHmMjQheCF7qQia/f+5lEjrbY+yKyMU+v/KL2GUaWfO1IBadaU
         sZ9XEjG+wa1fGrDhYUGdMrsblW6i6U+wHqfexSEvWAq3LdeTgRs9S/Rqh/rBhdsyZzJ1
         aB0hQGhGcwf+OT24H+898egMvaFYTHeMogq8RfxRo5/gMi6KgydJvCGceNF+HUsYqOic
         HqthEq8V2ZvfXVZ53Grz0tlOSEQ//PgpTHBdwyJjd0gJshb2n+DP3eLWUE2LwwmHYUWi
         t+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHmY6kK583Tt2J1FGuUMwHWAs8gJRypaPiH2R5Fn1THWO/3xAmnrbh2HwB4iGc7LDrGbViI1XZbYOBoGQdLZEo@lists.infradead.org
X-Gm-Message-State: AOJu0YxvVoWVGZ/zDUqlIChzXEJW0m+PvuuGO40prXrQsq6H8/EQ3g6n
	RkdSTXE+HUlmWiVIURUFtYsu9GTZjWeUEd3jzkmxWwPLHW82QbblWKzz9spGcozymA==
X-Gm-Gg: AeBDiev746q/cujaVxpT82yA76+ZGaagiFIK+MVTYUTNmEGi/eAFgUgOGNqaKWewXGV
	s6r2949M2s+1kYlZmMVscF5QqIpqbFN2NAU+dMsHicYW2ynXMr4sa2vVk07Tqp2THc26/WB86OI
	ALuhlHoavqjiSZdYcPiEE44iP1q1oQsYzYLJmNgesHcNp+TL1CQMGaUEJIW9Y41WA7gSR6llLWk
	ZJCUFWHfRsS1cCfwyudbVewHKZEW5+837vCLGffIVNVHFvLfvnVP5DrCBmbqbn0hlf+B4W9pT01
	gOE3n34f0cIj7gt8CV4d4mKx4vnMBeP75iWmThXFV1Q4gtgNWKwgLkSrEBoKPzlIs9rAnqNy/Ud
	NBPnn9CilRCRttdD39ldw7Kg8TNAiBSIrRrFzlmrOSOMT6+OKwAMfzRyZexP3TcDIOD729q+NJc
	UJcaRONjsKpA9dD/sj3Y2QhsgMw5dMouXS4WCVHOLst70mfX1M3mlmOANUOE+UcEcLV7nDM545I
	iwaSIp0QOBxmNH3
X-Received: by 2002:a05:600c:474b:b0:477:95a8:3803 with SMTP id 5b1f17b1804b1-488cf2ccc1dmr2385245e9.13.1775829179778;
        Fri, 10 Apr 2026 06:52:59 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538c03esm74889465e9.13.2026.04.10.06.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:52:58 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:52:54 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: alexandru.elisei@arm.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org,
	oupton@kernel.org, perlarsen@google.com, qperret@google.com,
	rananta@google.com, smostafa@google.com, suzuki.poulose@arm.com,
	tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com,
	will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH 07/14] KVM: arm64: Restrict host access to the ITS tables
Message-ID: <adkAtvBiYDH3_xSA@google.com>
References: <20260310124933.830025-1-sebastianene@google.com>
 <20260310124933.830025-8-sebastianene@google.com>
 <CA+EHjTxUbLBnyBGg58wsJQvTXPN0FTbj53H5r3sC9_TizpjvdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxUbLBnyBGg58wsJQvTXPN0FTbj53H5r3sC9_TizpjvdQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_065303_108726_FA2D5C48 
X-CRM114-Status: GOOD (  52.94  )
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

On Mon, Mar 16, 2026 at 04:13:59PM +0000, Fuad Tabba wrote:

Hello Fuad,

> Hi Sebastian,
> 
> On Tue, 10 Mar 2026 at 12:49, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > Setup shadow structures for ITS indirect tables held in
> > the GITS_BASER<n> registers.
> > Make the last level of the Device Table and vPE Table
> > inacessible to the host.
> 
> inacessible  -> inaccessible

Applied fix, thanks.

> > In a direct layout configuration, donate the table to
> > the hypervisor since the software is not expected to
> > program them directly.
> 
> This commit message is too brief and doesn't fully explain the
> problem, the impact, and the mechanism of the solution. It also
> appears to contradict the actual code changes.
> 
> For example, could you elaborate why must the last level of indirect
> tables be inaccessible?

For device table, a malicious host can write the ITT address that points
to hyp memory and then use MAPTI to write over that memory.

> 
> Can you also please explain the mechanism? You are parsing
> GITS_BASER_INDIRECT to determine if a shadow Level 1 table must be
> shared with the host, while unconditionally donating the original
> physical tables. You also explicitly exclude Collection tables. The
> msg should briefly justify why Collection tables are safe to leave
> accessible to the host.
> 
> There is also a contradiction in the message. You state "In a direct
> layout configuration, donate the table...". However, your code donates
> the original hardware table unconditionally on every iteration of the
> loop, regardless of whether GITS_BASER_INDIRECT is set. Please ensure
> the commit log accurately reflects the code implementation.
>

I see no contradition, I only need to shadow the first layer of the
indirect tables. Shadowing implies donation and sharing:
because we are donating the original tables from host -> hyp and we sharing the
host view of the tables with the hypervisor (which is a copy).

> Maybe you could say that the problem is Host DMA attacks via ITS table
> manipulation. Whereas the mechanism is to unconditionally donate

This has nothing to do with Host DMA attacks, it is just the AP that can
write to memory.

> hardware tables to EL2. For indirect Device/vPE tables, share a L1
> shadow table with the host and strictly donate the L2 pages to prevent
> the host from writing malicious L2 pointers.
> 
> >
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/its_emulate.c | 143 ++++++++++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> > index 4a3ccc90a1a9..865a5d6353ed 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
> > @@ -141,6 +141,145 @@ static struct pkvm_protected_reg *get_region(phys_addr_t dev_addr)
> >         return NULL;
> >  }
> >
> > +static int pkvm_host_unmap_last_level(void *shadow, size_t num_pages, u32 psz)
> > +{
> > +       u64 *table = shadow;
> > +       int ret, i, end = (num_pages << PAGE_SHIFT) / sizeof(table);
> > +       phys_addr_t table_addr;
> 
> RCT, mixing initialized variables and uninitialized variables, plus
> variables of conceptually different "types" in the same declaration.
> 
> Please use sizeof(*table): sizeof(table) evaluates to the size of the
> pointer (8 bytes), NOT the size of the array element. In this case,
> this happens to be the same, but it's still wrong.
> 
> Maybe the following is clearer:
> +        int end = num_pages * (PAGE_SIZE / sizeof(*table));
> 
>

Will use the suggestion and do the same for the
pkvm_host_map_last_level.

> > +
> > +       for (i = 0; i < end; i++) {
> > +               if (!(table[i] & GITS_BASER_VALID))
> > +                       continue;
> > +
> > +               table_addr = table[i] & PHYS_MASK;
> > +               ret = __pkvm_host_donate_hyp(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT);
> 
> The ITS-configured page size and the host page size could be
> different, but the number of pages to donate for Level 2 tables is
> calculated based on psz (the ITS).
> 
> If the ITS hardware is configured for 4KB pages, but the host kernel
> is using (e.g.,) 64KB pages, psz >> PAGE_SHIFT evaluates to 0.

I need to revisit this, thanks for pointing out.

> 
> You need to account for mismatched page sizes, perhaps by using
> DIV_ROUND_UP(psz, PAGE_SIZE) (or something similar) to ensure the
> containing host page is donated.
> 
> > +               if (ret)
> > +                       goto err_donate;
> > +       }
> > +
> > +       return 0;
> > +err_donate:
> > +       for (i = i - 1; i >= 0; i--) {
> 
> Please use the while (i--) idiom for rollback loops.
> 
> 
> > +               if (!(table[i] & GITS_BASER_VALID))
> > +                       continue;
> > +
> > +               table_addr = table[i] & PHYS_MASK;
> > +               __pkvm_hyp_donate_host(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT);
> 
> Please wrap this in WARN_ON(...). If donating back to the host fails
> during a rollback, we have a fatal page leak that needs to be loudly
> flagged, similar to how you handle it in pkvm_unshare_shadow_table.
> 
> 
> > +       }
> > +       return ret;
> > +}
> > +
> > +static int pkvm_share_shadow_table(void *shadow, u64 nr_pages)
> > +{
> > +       u64 i, ret, start_pfn = hyp_virt_to_pfn(shadow);
> 
> Same comment as before with RCT and the mixing of declarations.
> 
> 
> > +
> > +       for (i = 0; i < nr_pages; i++) {
> > +               ret = __pkvm_host_share_hyp(start_pfn + i);
> > +               if (ret)
> > +                       goto unshare;
> > +       }
> > +
> > +       ret = hyp_pin_shared_mem(shadow, shadow + (nr_pages << PAGE_SHIFT));
> > +       if (ret)
> > +               goto unshare;
> > +
> > +       return ret;
> > +unshare:
> 
> Please use the while (i--) idiom for rollback loops.
> 
> Also, please use consistent naming conventions for the labels. Here
> you call it unshare, and earlier it was err_donate.
> 
> 
> > +       for (i = i - 1; i >= 0; i--)
> > +               __pkvm_host_unshare_hyp(start_pfn + i);
> > +       return ret;
> > +}
> > +
> > +static void pkvm_unshare_shadow_table(void *shadow, u64 nr_pages)
> > +{
> > +       u64 i, start_pfn = hyp_virt_to_pfn(shadow);
> > +
> > +       hyp_unpin_shared_mem(shadow, shadow + (nr_pages << PAGE_SHIFT));
> > +
> > +       for (i = 0; i < nr_pages; i++)
> > +               WARN_ON(__pkvm_host_unshare_hyp(start_pfn + i));
> > +}
> > +
> > +static void pkvm_host_map_last_level(void *shadow, size_t num_pages, u32 psz)
> > +{
> > +       u64 *table;
> 
> RCT, and you forgot to initialize table:
> +       u64 *table = shadow;

Fixed this, thanks. I never ended up on this code path during testing,
maybe I should create a test for it to trigger it.

> 
> > +       int i, end = (num_pages << PAGE_SHIFT) / sizeof(table);
> 
> Same sizeof(table) pointer-size bug as above.
> 
> 
> > +       phys_addr_t table_addr;
> > +
> > +       for (i = 0; i < end; i++) {
> > +               if (!(table[i] & GITS_BASER_VALID))
> > +                       continue;
> > +
> > +               table_addr = table[i] & ~GITS_BASER_VALID;
> 
> Inconsistent masking logic, since in pkvm_host_unmap_last_level you
> correctly used PHYS_MASK to extract the address, but here in the
> rollback path you use ~GITS_BASER_VALID.
> 
> While both currently work because the upper bits and lower bits (below
> the page size) are defined as RES0 in the GIC spec, ~GITS_BASER_VALID
> is architecturally fragile. If a future hardware revision repurposes
> the upper RES0 bits [62:52] for new attributes (e.g., memory
> encryption flags), ~GITS_BASER_VALID will leak those attribute bits
> into the physical address calculation.
> 
> Since PHYS_MASK correctly handles the address extraction across all
> page sizes (relying on the lower bits being RES0) and safely masks off
> future upper attribute bits, please standardize on using table_addr =
> table[i] & PHYS_MASK; for both functions.
> 
>

Fixed the inconsistency and used PHYS_MASK everywhere.

> > +               WARN_ON(__pkvm_hyp_donate_host(hyp_phys_to_pfn(table_addr), psz >> PAGE_SHIFT));
> > +       }
> > +}
> > +
> > +static int pkvm_setup_its_shadow_baser(struct its_shadow_tables *shadow)
> > +{
> > +       int i, ret;
> > +       u64 baser_val, num_pages, type;
> > +       void *base, *host_base;
> > +
> > +       for (i = 0; i < GITS_BASER_NR_REGS; i++) {
> > +               baser_val = shadow->tables[i].val;
> > +               if (!(baser_val & GITS_BASER_VALID))
> > +                       continue;
> > +
> > +               base = kern_hyp_va(shadow->tables[i].base);
> > +               num_pages = (1 << shadow->tables[i].order);
> > +
> > +               ret = __pkvm_host_donate_hyp(hyp_virt_to_pfn(base), num_pages);
> > +               if (ret)
> > +                       goto err_donate;
> > +
> > +               if (baser_val & GITS_BASER_INDIRECT) {
> > +                       host_base = kern_hyp_va(shadow->tables[i].shadow);
> > +                       ret = pkvm_share_shadow_table(host_base, num_pages);
> > +                       if (ret)
> > +                               goto err_with_donation;
> > +
> > +                       type = GITS_BASER_TYPE(baser_val);
> > +                       if (type == GITS_BASER_TYPE_COLLECTION)
> > +                               continue;
> > +
> > +                       ret = pkvm_host_unmap_last_level(base, num_pages,
> > +                                                        shadow->tables[i].psz);
> > +                       if (ret)
> > +                               goto err_with_share;
> > +               }
> > +       }
> > +
> > +       return 0;
> > +err_with_share:
> > +       pkvm_unshare_shadow_table(host_base, num_pages);
> > +err_with_donation:
> > +       __pkvm_hyp_donate_host(hyp_virt_to_pfn(base), num_pages);
> > +err_donate:
> > +       for (i = i - 1; i >= 0; i--) {
> 
> Please use the while (i--) idiom for rollback loops.
> 
> 
> > +               baser_val = shadow->tables[i].val;
> > +               if (!(baser_val & GITS_BASER_VALID))
> > +                       continue;
> > +
> > +               base = kern_hyp_va(shadow->tables[i].base);
> > +               num_pages = (1 << shadow->tables[i].order);
> > +
> > +               WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(base), num_pages));
> 
> The sequence of rollback operations here creates a TOCTOU vulnerability.
> 

There is a different problem here related to functionality rather than
this: donating the base to the host first and then iterating over it
will make the hypervisor explode. I fixed this.

> - First, you donate base (the Level 1 indirect table) back to the host.
> - Then, you pass base into pkvm_host_map_last_level().
> - Finally, pkvm_host_map_last_level() reads table[i] out of base to
> determine which Level 2 pages to donate back to the host.
>
> Because the host regains ownership of base _first_, it can be running
> concurrently on another CPU. A malicious host can overwrite the Level
> 1 table with pointers to arbitrary hypervisor-owned memory. The
> hypervisor will then read those malicious pointers and dutifully grant
> the host access to its own secure memory.
> 
> The order of operations needs to be reversed: you must read base to
> roll back the L2 pages, unshare the shadow table, and *only then*
> donate base back to the host.
> 
> Also, num_pages = (1 << shadow->tables[i].order); calculates a 32-bit
> signed integer because the literal 1 is a signed 32-bit int. If order
> is 31, this evaluates to a negative number. If order is 32 or higher,
> this is undefined behavior. Because num_pages is declared as a u64,
> you should use the standard kernel macro BIT_ULL().
> 
> Here's my suggested fix (not tested). Reorder the operations to safely
> rollback L2 before donating L1, use the standard `while (i--)` loop,
> and fix the page calculation:
> 
> +    while (i--) {
> +        baser_val = shadow->tables[i].val;
> +        if (!(baser_val & GITS_BASER_VALID))
> +                continue;
> +
> +        base = kern_hyp_va(shadow->tables[i].base);
> +        num_pages = BIT_ULL(shadow->tables[i].order);
> +
> +        if (baser_val & GITS_BASER_INDIRECT) {
> +                host_base = kern_hyp_va(shadow->tables[i].shadow);
> +
> +            type = GITS_BASER_TYPE(baser_val);
> +            if (type != GITS_BASER_TYPE_COLLECTION)
> +                    pkvm_host_map_last_level(base, num_pages,
> +                                 shadow->tables[i].psz);
> +
> +            pkvm_unshare_shadow_table(host_base, num_pages);
> +        }
> +
> +        WARN_ON(__pkvm_hyp_donate_host(hyp_virt_to_pfn(base), num_pages));
> +    }
> 
> 
> 
> > +               if (baser_val & GITS_BASER_INDIRECT) {
> > +                       host_base = kern_hyp_va(shadow->tables[i].shadow);
> > +                       pkvm_unshare_shadow_table(host_base, num_pages);
> > +
> > +                       type = GITS_BASER_TYPE(baser_val);
> > +                       if (type == GITS_BASER_TYPE_COLLECTION)
> > +                               continue;
> > +
> > +                       pkvm_host_map_last_level(base, num_pages, shadow->tables[i].psz);
> > +               }
> > +       }
> 
> You have duplicated the entire table decoding logic (calculating base,
> num_pages, checking INDIRECT...) down here in the rollback path.
> Consider abstracting "setup one table" and "teardown one table" into
> helper functions to make pkvm_setup_its_shadow_baser more readable and
> less prone to copy-pasta errors.
>
> Cheers,
> /fuad
> 

Thanks,
Sebastian

> 
> > +
> > +       return ret;
> > +}
> > +
> >  static int pkvm_setup_its_shadow_cmdq(struct its_shadow_tables *shadow)
> >  {
> >         int ret, i, num_pages;
> > @@ -205,6 +344,10 @@ int pkvm_init_gic_its_emulation(phys_addr_t dev_addr, void *host_priv_state,
> >         if (ret)
> >                 goto err_with_shadow;
> >
> > +       ret = pkvm_setup_its_shadow_baser(shadow);
> > +       if (ret)
> > +               goto err_with_shadow;
> > +
> >         its_reg->priv = priv_state;
> >
> >         hyp_spin_lock_init(&priv_state->its_lock);
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >

