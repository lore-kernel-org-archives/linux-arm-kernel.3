Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5540CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mSkBMDtmSXT+SD6Rqrl6ORDllRpYLgcACmxMG0DYZs=; b=WnLRku1KvSWC4u7qKKCbxRKXps
	cwPT4jKMKgM/0lyBEWqQf1+VtCjCho3UTCrakmp6jntHTkPEIV3HwdUCm66TLLJ/wfGx3SN2RG5bP
	yF2DYuLlf+IQiqL89Qez7tz6eSs9pMLQTvIaLFeNPn4Ca+bI/8qYrKP7Jp48RdS1nebDxPg0rMARy
	4RmJiBIVHGe75TxNZ9fZsKTRehSkWtwUiH7y9N16OkqVvBgjOAKIo/tCn8EQ9qGrQ8a/9zR9mms/2
	4xnXcJD6x9ZuIwR/6epJNa60MpnaNILLEWs1Cp99F1HyFpWRa/9pcquRHC7sqbrerkzWxiB8cEpwj
	hYIJOqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yq-00000008sQ2-1Wgi;
	Tue, 09 Sep 2025 17:18:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvy7W-00000007I4P-0fVi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:10:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45de54bfc36so149385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757423448; x=1758028248; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6mSkBMDtmSXT+SD6Rqrl6ORDllRpYLgcACmxMG0DYZs=;
        b=2OGxP8u1PpYyCNJf0oAKvPGU070dxJ2oI2XYmjM2s6ZQ97qcuQZH6ukFkyq65pj0ME
         ea65BRHctSTQNhQPH2uj5HFdFfQv5t0ddZwDpmAlWSAj1QIi1d/m5cT315x7LkcbhKI4
         x412bacbQMcCXioAYYFnXAeXcuhEDAKTGWfoWnOy1Wg5FH3oYWqSaTrD+xr17UuUEWhw
         0efQcctravjDRBR5DIMYD3AddSxyUClwuN7gnmOlTpvgu8NGLxeNNg/lI9l3Oox0kMIP
         peAG+R84QCQ0uaj8lgJ+yxaNzK8bMPpV66MRmWStIuF8ebOvo21YesFlUYZ8gwkftn7g
         6qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757423448; x=1758028248;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mSkBMDtmSXT+SD6Rqrl6ORDllRpYLgcACmxMG0DYZs=;
        b=JSNsOAVZiuycl8kM80vHVWl1wwS6n5y/d/YdJNOGAtDEs8+DZ/rIkJCiQOC97hiT4D
         y1XTYcuKBubjChAdnN34b8fjML9T674CdRc0FG5PXeAU+Y9G6xeboDM2591bkqDvEmgk
         DBwuJjULr1XhlF84EFcY2j/nwQV1WiMOlNQ9VirK6c405ItY68YAvpmFzsx2wSW2veym
         NY0uAgtgJLb8nsckogZuzeWWd5mlQJOBt5QsHMlLgC2QUGYUiji+qW4wJyY/ex45ptyx
         S1Uz7uARRiPS5NMJa72LTjC6zVowisv5oOhV/VGU/P0tJBf/QIXOCdz+z2UrJpfVClFI
         gpIA==
X-Gm-Message-State: AOJu0Yxab2bphvLyo2FIXuchxvNbCb0wjK3ci8DrSkul+nt/BKqa6o8d
	CV3TQ7L6kGQ25lUfn1bHLU+Q79YsnkzmAgyCkukPCehYRtJt02RnpQJN7GCaKEpyfxC0qloDULX
	BWuVWOg==
X-Gm-Gg: ASbGncta2U0EES/st64RyZrWuc5ZqiaiLVB/PrHpZXZNv4p2eyKji2qRXlMmeujtdVo
	Oha9PSicgkCt85JHTEaOhdd1gwBbcRLSqm4ulXD5kdHyQTko0zQBAlJKhmnhqcqi1S7FAyrNaJ7
	2s5iuURGHoiyXgWEiFiFw32CPcxS7PVwSqXp5uDcnphQWLzy7l2I9MnR4FWSQXtfez+UUAq+tNl
	JMW0omBou4BR+4fd9XGq/9eNplBrs4vEHTkhUT2yH0uCIhpxysMdgZox/PuZXcQZcSI1hgdC58G
	G1D3MvSTeHZ+lLS+rHJFoFEFIIcMpl9GrGBqU5AhXEj8iMVD+HRsEaq2HaNuvPnZzeRERIuTUad
	ixJDGdjU9HeZ0EiWubmyTK6QFxq7njBSaivS4WWGsaefNyeko+UcGLRp0K0xZkPRMsVg=
X-Google-Smtp-Source: AGHT+IH+u0DJgHIFy6cMKe7xSpOobqzObKFJnY4/liHGfEZfRkJ/HR3MdmvlukXa1RXp5MtkjRU4Cw==
X-Received: by 2002:a05:600c:1c81:b0:45b:9bcb:205 with SMTP id 5b1f17b1804b1-45dde17da47mr5535315e9.5.1757423447377;
        Tue, 09 Sep 2025 06:10:47 -0700 (PDT)
Received: from google.com (26.38.155.104.bc.googleusercontent.com. [104.155.38.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dda2021dfsm178871185e9.24.2025.09.09.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 06:10:46 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:10:43 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 1/2] KVM: arm64: Dump instruction on hyp panic
Message-ID: <aMAnU9ddUZPvjZIJ@google.com>
References: <20250717234744.2254371-1-smostafa@google.com>
 <20250717234744.2254371-2-smostafa@google.com>
 <aL7JLbljvX1JATP3@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aL7JLbljvX1JATP3@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_061050_199782_5EAD3DCD 
X-CRM114-Status: GOOD (  29.55  )
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

On Mon, Sep 08, 2025 at 01:16:45PM +0100, Will Deacon wrote:
> On Thu, Jul 17, 2025 at 11:47:43PM +0000, Mostafa Saleh wrote:
> > Similar to the kernel panic, where the instruction code is printed,
> > we can do the same for hypervisor panics.
> > 
> > This patch does that only in case of “CONFIG_NVHE_EL2_DEBUG” or nvhe.
> > 
> > The next patch adds support for pKVM.
> > 
> > Also, remove the hardcoded argument dump_kernel_instr().
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/include/asm/traps.h |  1 +
> >  arch/arm64/kernel/traps.c      | 20 +++++++++++++-------
> >  arch/arm64/kvm/handle_exit.c   |  5 +++++
> >  3 files changed, 19 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> > index 82cf1f879c61..0d7e86a95d62 100644
> > --- a/arch/arm64/include/asm/traps.h
> > +++ b/arch/arm64/include/asm/traps.h
> > @@ -30,6 +30,7 @@ void arm64_force_sig_mceerr(int code, unsigned long far, short lsb, const char *
> >  void arm64_force_sig_ptrace_errno_trap(int errno, unsigned long far, const char *str);
> >  
> >  int early_brk64(unsigned long addr, unsigned long esr, struct pt_regs *regs);
> > +void dump_instr(unsigned long addr);
> >  
> >  /*
> >   * Move regs->pc to next instruction and do necessary setup before it
> > diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> > index 9bfa5c944379..d692c05e3686 100644
> > --- a/arch/arm64/kernel/traps.c
> > +++ b/arch/arm64/kernel/traps.c
> > @@ -149,15 +149,11 @@ pstate_check_t * const aarch32_opcode_cond_checks[16] = {
> >  
> >  int show_unhandled_signals = 0;
> >  
> > -static void dump_kernel_instr(const char *lvl, struct pt_regs *regs)
> > +void dump_instr(unsigned long addr)
> >  {
> > -	unsigned long addr = instruction_pointer(regs);
> >  	char str[sizeof("00000000 ") * 5 + 2 + 1], *p = str;
> >  	int i;
> >  
> > -	if (user_mode(regs))
> > -		return;
> > -
> >  	for (i = -4; i < 1; i++) {
> >  		unsigned int val, bad;
> 
> I'm a little worried that this function might be used to try and dump
> instructions from userspace now that it just takes an address.
> 
> Maybe we could:
> 
>   - Keep the name unchanged, e.g. void dump_kernel_instr(unsigned long kaddr)
>   - Inline the user_mode(regs) and instruction_pointer(regs) calls into
>     __die()
>   - Check is_ttbr1_addr(kaddr) in dump_kernel_instr()
> 
> WDYT?

Makes sense, I will do that and respin v2.

Thanks,
Mostafa

> 
> Will

