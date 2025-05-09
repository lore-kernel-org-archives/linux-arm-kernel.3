Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81966C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+N6qYPtB7OJ/ORYUW6jjlq+jHbMXbgtwzLUCncXdlqs=; b=qu4f2ZTK11BrOVkc6TQnKya5iI
	b44LqVk/RgGUGr41HrxgPyzXFmyT8qYl3DoZrOY4HGny5umaaWyr7MmApLTSNk9KWBcuxa4pJaGJc
	IqjHm/U6pbHWxLLSOC9+x3y64hzk+KquPqz+9mJfcPIOM2PRYkQ0kikBYgTYZJ0ZiaxMu5X+OJaNG
	7Qp48DG7/+LjchVp2olqJDmg3EnnnWPTJXvGOPjmiGXyl2HWxDNyBZYbGUGz1TI4TAjyEwmriYNPL
	73Kn0RZSeNhUee7JHGTHzGoK66dmiPtgR5FEFFpiKjJoN5OVI7CeaMXicdkrZDOVnKJSRaJMG9pyz
	THKC36YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHUn-00000002e2T-11EW;
	Fri, 09 May 2025 06:46:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHS1-00000002dOI-0Tlz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:43:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6522D442A6
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 06:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AEFC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 06:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746772996;
	bh=ghSTPDMBmKNh6R/xiVJM8gT+jTFNIjQQaJPqghwpZjY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Eb/VyXosiYXHNnQAaqq5IlB7CzkTKtizXgAXVvm3bcJ0b/fuzwgRFfcWThnZEwNzl
	 QJXk0Fpw+RTQyZmVnBR6JLO7DLUGBFNciUktHOf678YDHkhk3U/Yh7cxIwIIvw3jCT
	 tOVurhBTyr7AVJgBC6bIjaR5fYWxXc5yVeCAI9G5fitxy1Tz14PUeK9mQdEZK9wt8s
	 Mq6Ws7w3trcXdnTV0TKHHEmlF51dUyvwIXPrbGl0HF9jBGl2QPESLA4K/yLVGi7qHl
	 smboDShLc3NgxO9/9Zj/RpoJ/n1UJBueb8G2IdoUIB4v8eKwplrjuZq2ZORl2AHhmT
	 zKEBq4Qkr6RBQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-326ca53a7e8so623891fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 23:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6tsVIXSHAp+ZUSlISvXHuIxNYaEikfVuSuq+xCaEF0WAOQVx571MSNBPjJoIzlQS6bZp89f2xD5W6LS/aB3Ef@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1YLpUt4WrkLL0rw3w6XIf9/LXo4FzsOn9/uGobbQ42DRI4zLX
	KqIukTngaDnZYERDKBuAsFKj1mcZAZGWXaSGDC+d4XHNO0icQN1uJxDpL9KS2pmqzxlmQVQ2Osj
	mGBETpEl4XfK77psMQLZfFSNrkVg=
X-Google-Smtp-Source: AGHT+IFsYIL6Kq1fR2rucdZEGan6DGCUAzRTPL9yxGMxy2vAM733bGMSlqsVKU81T1W52/p+1SZOBQJGywB2CW717ww=
X-Received: by 2002:a2e:bc07:0:b0:30c:c7a:dcc with SMTP id 38308e7fff4ca-326c45a9416mr9145701fa.20.1746772994563;
 Thu, 08 May 2025 23:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250508114328.2460610-5-ardb+git@google.com> <20250508114328.2460610-8-ardb+git@google.com>
 <aByy1CFUieJQeofl@e129823.arm.com>
In-Reply-To: <aByy1CFUieJQeofl@e129823.arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 9 May 2025 08:43:03 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE-VbdniRZ9Y+u9eaw9JM_qot+TJkQkfULX548YvKD4Ww@mail.gmail.com>
X-Gm-Features: ATxdqUFXQ6f01M85Uaq5BhYbSHW7aM9dCR1G5FmaZ6Jsmzse2QNK1itGcCJ8okg
Message-ID: <CAMj1kXE-VbdniRZ9Y+u9eaw9JM_qot+TJkQkfULX548YvKD4Ww@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_234317_195113_8ABDD755 
X-CRM114-Status: GOOD (  22.70  )
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

On Thu, 8 May 2025 at 15:34, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
>
> Hi Ard,
>
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > BSS might be uninitialized when entering the startup code, so forbid the
> > use by the startup code of any variables that live after __bss_start in
> > the linker map.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/image-vars.h  | 62 +++++++++++---------
> >  arch/arm64/kernel/vmlinux.lds.S |  2 +
> >  2 files changed, 35 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index c3b4c0479d5c..a928e0c0b45a 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -10,6 +10,12 @@
> >  #error This file should only be included in vmlinux.lds.S
> >  #endif
> >
> > +#define PI_EXPORT_SYM(sym)           \
> > +     __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> > +#define __PI_EXPORT_SYM(sym, pisym, msg)\
> > +     PROVIDE(pisym = sym);           \
> > +     ASSERT((sym - KIMAGE_VADDR) < (__bss_start - KIMAGE_VADDR), #msg)
> > +
> >  PROVIDE(__efistub_primary_entry              = primary_entry);
> >
> >  /*
> > @@ -36,37 +42,35 @@ PROVIDE(__pi___memcpy                     = __pi_memcpy);
> >  PROVIDE(__pi___memmove                       = __pi_memmove);
> >  PROVIDE(__pi___memset                        = __pi_memset);
> >
> > -PROVIDE(__pi_id_aa64isar1_override   = id_aa64isar1_override);
> > -PROVIDE(__pi_id_aa64isar2_override   = id_aa64isar2_override);
> > -PROVIDE(__pi_id_aa64mmfr0_override   = id_aa64mmfr0_override);
> > -PROVIDE(__pi_id_aa64mmfr1_override   = id_aa64mmfr1_override);
> > -PROVIDE(__pi_id_aa64mmfr2_override   = id_aa64mmfr2_override);
> > -PROVIDE(__pi_id_aa64pfr0_override    = id_aa64pfr0_override);
> > -PROVIDE(__pi_id_aa64pfr1_override    = id_aa64pfr1_override);
> > -PROVIDE(__pi_id_aa64smfr0_override   = id_aa64smfr0_override);
> > -PROVIDE(__pi_id_aa64zfr0_override    = id_aa64zfr0_override);
> > -PROVIDE(__pi_arm64_sw_feature_override       = arm64_sw_feature_override);
> > -PROVIDE(__pi_arm64_use_ng_mappings   = arm64_use_ng_mappings);
> > +PI_EXPORT_SYM(id_aa64isar1_override);
> > +PI_EXPORT_SYM(id_aa64isar2_override);
> > +PI_EXPORT_SYM(id_aa64mmfr0_override);
> > +PI_EXPORT_SYM(id_aa64mmfr1_override);
> > +PI_EXPORT_SYM(id_aa64mmfr2_override);
> > +PI_EXPORT_SYM(id_aa64pfr0_override);
> > +PI_EXPORT_SYM(id_aa64pfr1_override);
> > +PI_EXPORT_SYM(id_aa64smfr0_override);
> > +PI_EXPORT_SYM(id_aa64zfr0_override);
> > +PI_EXPORT_SYM(arm64_sw_feature_override);
> > +PI_EXPORT_SYM(arm64_use_ng_mappings);
> >  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> > -PROVIDE(__pi_cavium_erratum_27456_cpus       = cavium_erratum_27456_cpus);
> > -PROVIDE(__pi_is_midr_in_range_list   = is_midr_in_range_list);
> > +PI_EXPORT_SYM(cavium_erratum_27456_cpus);
> > +PI_EXPORT_SYM(is_midr_in_range_list);
>
> small nit:
> Would you rebase this patchset after
> commit 117c3b21d3c7 ("arm64: Rework checks for broken Cavium HW in the PI code")?
> Otherwise, I experience boot failure because of SCS related code:
>
>   ffff80008009fbc0 <is_midr_in_range_list>:
>   ffff80008009fbc0: d503245f    bti     c
>   ffff80008009fbc4: d503201f    nop
>   ffff80008009fbc8: d503201f    nop
>   ffff80008009fbcc: f800865e    str     x30, [x18], #0x8 ---- (1)
>   ffff80008009fbd0: d503233f    paciasp
>   ...
>
> At pi phase, platform register initialized properly...
> So it makes panic on (1).
>

That commit is not in the arm64 tree, so it will be up to Marc and
Catalin to resolve the conflict.

Your commit

363cd2b81cfd arm64: cpufeature: Move arm64_use_ng_mappings to the
.data section to prevent wrong idmap generation

is not in the kvmarm tree, so the build will not even complete if you
rebase it on that.

For testing, please merge the kvmarm tree and resolve the conflict by hand.

