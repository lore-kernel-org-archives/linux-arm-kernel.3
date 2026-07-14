Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46545C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekTn3UMJic44VT5Ls673Az1lxgbjw95C1C5IWJSyBYM=; b=gTkMm2p5+nbfUW5SJOGlWIC3L4
	/TcXpmZOViDwb312zgb2fYcP2I50r+PbgnICeZuLnLihmZVXSzJaTgFyS01PlWsnhstjGT0ToAWUT
	k/Snxvs+OlTxGhpYU27zgergbV7+usv9rz2iJHgt1CFUXgUumaXSAwsIPWtEgvnqoXHcEy9NVgx5E
	RLH3JS+sUgF/K0zRxU6KKhOjKEb18mZOnLWun46i0vAt9PfNXkNV88YDgDN4dyaOz04d1TlqwW/Vz
	n5SzdA8SbDbvXtYwZcJDsRh+/7CzZE3bbtLgoBz6x3J+BMBZ0yYumkHYr9ViXxMpI7efAtIvvbQ+u
	15FBHkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWBf-0000000Azgb-3kMi;
	Tue, 14 Jul 2026 06:00:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjWBc-0000000Azfm-3GiH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 06:00:10 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cad4170e8eso45754705ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 23:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784008807; x=1784613607; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekTn3UMJic44VT5Ls673Az1lxgbjw95C1C5IWJSyBYM=;
        b=sJikCkDoywk04lTWzc1wwhirSaL/5EjKAMs+lVSw+tw6BllsNdI20x4oF6aQZ1jBDA
         YbvYuNABuU6+McEKW/Srj8yBuq6hQas8EryUuIW2Ts3L61ltq2iMFkPoPmBqFuZPtXBV
         dUppE3mBwnAZCmw+eX4DVoi+qYxc7oViSCkMYiKi4dXfptcn4hBC8/v/mcfp/iL5lPy9
         PdCFwoi/IBJWh39MKx9Y/4La9Agg2LoKS83CdbxspwCf8KoIHfNj5BTiL0lS22Kq/cEM
         jaghHRQCB1vnlGl245EwPUg9STSubuhWneYsAQocTkXfWVi2JV7PFsbsFIe64hqIkejc
         u3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008807; x=1784613607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekTn3UMJic44VT5Ls673Az1lxgbjw95C1C5IWJSyBYM=;
        b=rMCDdtJiA8pvInXd1Lbs2e4PLC8riFZt6qfhvMWPZEn3u9Q8G/SedCReQVqWy6YbxH
         8SXazzU9AUAnGE3rxwtvsDs1IDWgTx/QQ906Yz9nvAQQmFnkAFcZU4FS0krBjvTiyNv0
         THuJyLOmU/c/fKNyxtWHwQEWcXKxfvtb/i9TGfspDhSzOm3ZwlGGBbSmSPTQy54s5P5n
         xjt2XZFEB18Ni2IfRUbUR3FyQrv4RU+gwuEMwTwSaI1x5CgwaUbMm/ffKuod1ZPaTk7C
         JE02egwApxgmLwPKwmsagXtE7gjRU8tVlv1xjSm1Ea2fxsRRG/LfeDqY/ApLqWMyj02j
         00+A==
X-Forwarded-Encrypted: i=1; AHgh+Rp8KDN/akc2+IfpMcUIs5tk67OUPfktZZ/0nKeMfOLj+gb4aYBi1KLg8p2KeV0R+T4QDcCNeHWabogsH6dq+9Up@lists.infradead.org
X-Gm-Message-State: AOJu0YygfTKEX5/xu+YksEn6e6nDN2lfeEBxja42la2Td8s8qP1keuDq
	HgUdfkqEmfd5OHBvO2AkRi81+YK5XAiggy4pQY7sLPQtP93Y9gYHH+QV5Jx3bjqP
X-Gm-Gg: AfdE7ck2Ew/QaacnFHOWH1ng00+Smi+ZvyXn3jK5f0SAig/VnsO82YJ+6eLY6D3ItFK
	dscIa+ZO93EVWp4o/3mFnC1BzTMOXACxl7Er21wafO0Zp56hAwgUQdd6iWppqFumNDgMCGRTujw
	INXRK7iCfp3RNazri864MW7uvNMHm1gFcFMPv8CkU3EeYWj+7/vMIjlpoM+Q+l0JtzJ9ekU8gwJ
	li9rvA79lz/MpRjemTfJEqfveaCVPGJ9jOjRnjyhdWJhMMj6iE88uxacrcKDVYhLsI0lXnbxggh
	lhNb4puzRijbZrbIWv4G6gHUhIytrg+corW1m/V+Ak9S/0JdRglwwx1TpkDwRY0ydKxTfoEAOuR
	3HwIY41D3mYhFPHlA5WQfF1enEME2tzouCzcg2+8OJFrrijI9S2g/yRz2npBv7ls3IS0LRYJ0JE
	XRI4DCT19Pr+/2jxB8Jg6TBZA1QTbEGyGV
X-Received: by 2002:a05:6a21:8cc1:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c3571d0438mr1375652637.38.1784008806472;
        Mon, 13 Jul 2026 23:00:06 -0700 (PDT)
Received: from blinky ([2601:647:4000:5070::76e1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm63657400c88.1.2026.07.13.23.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:00:05 -0700 (PDT)
Date: Mon, 13 Jul 2026 23:00:03 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v5 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
Message-ID: <alXQY4hgZYLmr8x7@blinky>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-6-kprateek.nayak@amd.com>
 <178366995930.1208691.2993932866462893112.b4-review@b4>
 <650c7050-2a77-4415-b597-3bb39ccfb1e8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <650c7050-2a77-4415-b597-3bb39ccfb1e8@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_230008_820049_34D40BBC 
X-CRM114-Status: GOOD (  39.66  )
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

On Fri, Jul 10, 2026 at 01:47:10PM +0530, K Prateek Nayak wrote:
> Hello Charlie,
> 
> On 7/10/2026 1:22 PM, Charlie Jenkins wrote:
> > [You don't often get email from thecharlesjenkins@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On Tue, 30 Jun 2026 04:55:28 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> >> Futex hash computation requires a mask operation with read-only after
> >> init data that will be converted to a runtime constant in the subsequent
> >> commit.
> >>
> >> Introduce runtime_const_mask_32 to further optimize the mask operation
> >> in the futex hash computation hot path. Since all the current use-cases
> >> are of the form GENMASK(n, 0), with n > 0, following sequence:
> > 
> > I really appreciate you spending the time to do this, thank you!
> 
> My pleasure! And I really appreciate you taking time to review and test
> this series. Thanks a ton for that!
> 
> > 
> >>
> >>
> >> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> >> index 1ce02605d2e4..dbf96c937dbb 100644
> >> --- a/arch/riscv/include/asm/runtime-const.h
> >> +++ b/arch/riscv/include/asm/runtime-const.h
> >> @@ -262,6 +279,33 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
> >> [ ... skip 24 lines ... ]
> >> +     BUG_ON(!val || width > 31 || (GENMASK(width - 1, 0) != val));
> >> +
> >> +     __runtime_fixup_shift(where, 32 - width);
> >> +     __runtime_fixup_shift(where + 4, 32 - width);
> >> +}
> >> +
> > 
> > It would be "optimal" to use an andi when the mask is <=11 bits since
> > andi can fit an 11 bit mask. What you have is good enough but I'll leave
> > my stab at doing the andi patching here in case you want to apply it.
> > 
> > From 9e5527aaddd464783af795aacdb6d094e11cc31e Mon Sep 17 00:00:00 2001
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Date: Thu, 9 Jul 2026 23:18:09 -0700
> > Subject: [PATCH] riscv: Optimize __runtime_fixup_mask for masks with <= 11
> >  bits
> 
> Peter seems to have merged the v5 series in his tree but If you could give
> your S-o-b, I can throw in a commit log, some testing along with a few
> cosmetic modifications, and send it for official review on top of
> queue:locking/core ;-)

I'm glad it got merged, I missed that! Here's my tag that I forgot to
add...

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

> 
> > 
> > ---
> >  arch/riscv/include/asm/insn.h          |  2 ++
> >  arch/riscv/include/asm/runtime-const.h | 29 ++++++++++++++++++++++++--
> >  2 files changed, 29 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> > index c3005573e8c9..0a34cd7305d0 100644
> > --- a/arch/riscv/include/asm/insn.h
> > +++ b/arch/riscv/include/asm/insn.h
> > @@ -141,6 +141,7 @@
> >  #define RVG_OPCODE_JALR                0x67
> >  #define RVG_OPCODE_JAL         0x6f
> >  #define RVG_OPCODE_SYSTEM      0x73
> > +#define RVG_OPCODE_ANDI                0x13
> >  #define RVG_SYSTEM_CSR_OFF     20
> >  #define RVG_SYSTEM_CSR_MASK    GENMASK(12, 0)
> > 
> > @@ -175,6 +176,7 @@
> >  #define RVG_FUNCT3_BGE         0x5
> >  #define RVG_FUNCT3_BLTU                0x6
> >  #define RVG_FUNCT3_BGEU                0x7
> > +#define RVG_FUNCT3_ANDI                0x7
> > 
> >  /* parts of funct3 code for C extension*/
> >  #define RVC_FUNCT3_C_BEQZ      0x6
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > index dbf96c937dbb..24a9b13081f7 100644
> > --- a/arch/riscv/include/asm/runtime-const.h
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -9,6 +9,7 @@
> >  #include <asm/asm.h>
> >  #include <asm/alternative.h>
> >  #include <asm/cacheflush.h>
> > +#include <asm/insn.h>
> >  #include <asm/insn-def.h>
> >  #include <linux/memory.h>
> >  #include <asm/text-patching.h>
> > @@ -302,8 +303,32 @@ static inline void __runtime_fixup_mask(void *where, unsigned long val)
> >          */
> >         BUG_ON(!val || width > 31 || (GENMASK(width - 1, 0) != val));
> > 
> > -       __runtime_fixup_shift(where, 32 - width);
> > -       __runtime_fixup_shift(where + 4, 32 - width);
> > +       /*
> > +        * A riscv 'andi' instruction can fit an 11 bit immediate, so the mask
> > +        * can be directly applied. Otherwise fall back to SRLI + SLLI.
> > +        */
> > +       if (width < 11) {
> > +               __le16 *parcel = where;
> > +               u32 insn;
> > +               __le32 res, nop;
> > +
> > +               insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
> > +
> > +               /* Replace the slli/slliw with an andi */
> > +               insn &= 0x000fcf80;
> > +               insn |= val << 20 | RV_ENCODE_FUNCT3(ANDI) | RVG_OPCODE_ANDI;
> > +
> > +               res = cpu_to_le32(insn);
> > +               /* Replace the srli/srliw with a nop */
> > +               nop = cpu_to_le32(RISCV_INSN_NOP4);
> > +               mutex_lock(&text_mutex);
> > +               patch_text_nosync(where, &res, sizeof(insn));
> > +               patch_text_nosync(where + 4, &nop, sizeof(insn));
> > +               mutex_unlock(&text_mutex);
> > +       } else {
> > +               __runtime_fixup_shift(where, 32 - width);
> > +               __runtime_fixup_shift(where + 4, 32 - width);
> > +       }
> >  }
> > 
> >  static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
> > --
> > 2.54.0
> > 
> > 
> > I would prefer including this, but I am happy to approve this
> > regardless.
> 
> Ack! I'll keep it as an optimization on top to retain your attribution.
> 
> > 
> > Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> > Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> Thank you again!
> 
> -- 
> Thanks and Regards,
> Prateek
> 

