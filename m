Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDD5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 01:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgnCFalO1rVu1AXO1D06Gc1GDBlEbCjjlOcT3fgeh38=; b=GpY2CFQ7/OW0f2I3+2yifuqHg/
	4IZZ1xHTCPO997L7qfYfcnGXRSRxg0tk1V58UxkXH5vB/Wc9IuiHyyJGmCHfHtIh/FUQQkG1juIkq
	v6lXmsndBefN5oy5eOD+mHBBidFhjiS1H+F7WQ3JFD86lRW73ohypaoZIDUqPPOdqgSf6FjBr9DPz
	7+eRFo27fsz2uTSLE1T0lAwy/+7pbr47m6SLrPDTH+l9y/3bewtoGM08HNopOkurnteCtvCJZfn31
	9an6V45ET6suF58C8jX4Qo92qEqwggbIOMr5x4REoOE0wtoo4S9tRHBt1xnyql7MZ+h1K0V1O3kOA
	BaMnGodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpWY-00000009QfU-0HRd;
	Fri, 28 Feb 2025 01:50:46 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnpUz-00000009QMZ-2KSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 01:49:10 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7be6fdeee35so304741385a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 17:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740707348; x=1741312148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgnCFalO1rVu1AXO1D06Gc1GDBlEbCjjlOcT3fgeh38=;
        b=DMy+lp+CFUHnH88YEB88/HxmROGP50mgZ9F8v7M6nQifw9z3H7P58Hd/sly97nnaYc
         rK+GZYK4Ob/goBbSiWnr6rkbGy4eoc7aXMxHdQfMRIdAIs4E/C8MhKlXVBtx1V1i2ZJJ
         tq95IfcLQsbxAXAHR2nHqH/1Dzxx/zkQ+rsw0vyV5/zRNfGrvjxieHtl+nB+cfvB9mD2
         ENuklDN4RNub5MEbxfOTKo0VWYtVshA191hKi8cxFlonZnwdzi2V4pJHU/EadoR+ZILg
         L25jzXzQaprW5wKKJCOmw5FIzwZmGx0/gOfdPjkQQLG48jCN2REr6C+QBCDfAYqQfDev
         SmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740707348; x=1741312148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgnCFalO1rVu1AXO1D06Gc1GDBlEbCjjlOcT3fgeh38=;
        b=CYI2VVcla4ll5dlX1sP9x0Tww1p89uUKj6Y80anT0pC2PQWxF4OuY78oy+QHUevlCf
         +VOz4EsjgSfMNlgNzDj4N38Z4e3/oVd68a0DKgHge6mljy+5lwbwS21b2A8QYIztDST0
         DwxzDqVLvwrF9QPE08ImUERImt5yD9Mjte52m7SX0zEYmrStwxm1Kii/Lh245G7Vg4Oe
         /Fucal6LiNfxGxDrvK8N7FDG62b1e0L4q4/661BFvfUBhVIxRs+ODNGqnY4Ey74f78xn
         ljNgiSScyLX0zoJQQa5Qgb81G9ZCOnv9pyMDH8H5QZjg4ue0bG/6SKoS2B7vx8E7QPCP
         nRZA==
X-Forwarded-Encrypted: i=1; AJvYcCX+n3mY+b4BOMwUQXc0PPAHP1Qo2I/b/3j4eve4sNduWHVsdOqalnmhVbottImB1QU7QwTpKrvRaSPFBT72Fm9X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6ltl/vKgtVD4vUoK2LuEmWnevcK1Rfd4uS3oY1Ex5RcLKGDzS
	70taejxolDWitrWTV2q7fUhxMdGkHfFrMWUF+RR4OqiwXjRrZi5I
X-Gm-Gg: ASbGncuuqh9yl6WIUHUNUlUmwMYJD/2LPZV/7OndErr0tnoZ31qmyOOh5b3M9gUskQu
	XCY9GqLSerpXycssHk7MWR+zAMjkYOEtNr/2SAtbhPI+Ef+bFp3fmW/xSztZQadQQKFIUPT0bI4
	v9nPSgll4ZaGmFOdBExk/i66qoP33j0JwiXt4hwoRFa/Bsi0W5m3c8Gut5W0p8m6Nf4W36/B7pC
	6q7aDXqy9hGRvazapUBUf4RFYYagfmftkUTh4+rK4u3axMhv7UyeIVtSI9SI8VybBIOKer+E5y/
	+3ffbugKlgyNpFkm6wfTlT3FQOURzsLj+xlPmfvmi1XyzTPrKwAFJagrgj4VzpkogG1reDZMSUY
	XugSNyWSqA23TEkjM
X-Google-Smtp-Source: AGHT+IH+ANmJBVtGY4D/p2Ms1Ijf1z4GnsONbS648U41oA9SZ64R8X5gd2eiXYMgM3MQubjTaAh0dA==
X-Received: by 2002:a05:620a:410a:b0:7c0:b81f:7af1 with SMTP id af79cd13be357-7c39c4c7052mr216558685a.33.1740707348135;
        Thu, 27 Feb 2025 17:49:08 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c378d9fe2bsm180028885a.88.2025.02.27.17.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 17:49:07 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 295611200043;
	Thu, 27 Feb 2025 20:49:07 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 27 Feb 2025 20:49:07 -0500
X-ME-Sender: <xms:ExbBZ8MZMzLo6wrs94z19Qna9HA9xNeyrc4pBglvufiqyimFpFKkOg>
    <xme:ExbBZy9GoWore1KeXe5TixiJYQ5ERVzDbIuOZf2LLKyFkaxkqU0kK_nXAk4E9R8RE
    cweDv8FBWeYqoq3lg>
X-ME-Received: <xmr:ExbBZzR0bbi4DNLW6yJmTJhWoxmtNOEUZq42CBvJMgutc1Gz6WTWqp1tog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekledutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvfedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhihuhguvgesrhgvughhrghtrdgtohhmpd
    hrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoh
    eptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeifihhl
    lheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgtrgeslhhinhhugidrihgsmhdrtg
    homhdprhgtphhtthhopehgohhrsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohep
    rghgohhruggvvghvsehlihhnuhigrdhisghmrdgtohhmpdhrtghpthhtohepsghorhhnth
    hrrggvghgvrheslhhinhhugidrihgsmhdrtghomh
X-ME-Proxy: <xmx:ExbBZ0ue1Fk-rzeaa9ghPHz3tDImUCTQRhkKbVOvUiILSX2jgeNDTw>
    <xmx:ExbBZ0eMJnkPghCpEqFTDlnOM67LJC_6Mnc_0ibrAZzsceLutZRZxA>
    <xmx:ExbBZ40gzJsSPQXSLvJLsE6Zzc8WNwCuOHNca4oa5wTpTUoWQMA2eQ>
    <xmx:ExbBZ48bwnUBk7F59BtYYCPJSorDpmTbgh3D7Vcm33kxiIe9NRK6Yw>
    <xmx:ExbBZ78C7frC_qb8BNNJIcxUYMBbt7-KUtM0u9RUa1NHtz6cAFLQYJgy>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Feb 2025 20:49:06 -0500 (EST)
Date: Thu, 27 Feb 2025 17:49:05 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
	Juergen Christ <jchrist@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
	"open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>
Subject: Re: [PATCH v9 2/9] preempt: Introduce __preempt_count_{sub,
 add}_return()
Message-ID: <Z8EWEe-zdPzKlOD8@Mac.home>
References: <20250227221924.265259-1-lyude@redhat.com>
 <20250227221924.265259-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227221924.265259-3-lyude@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_174909_597512_251A330F 
X-CRM114-Status: GOOD (  22.93  )
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

On Thu, Feb 27, 2025 at 05:10:13PM -0500, Lyude Paul wrote:
> From: Boqun Feng <boqun.feng@gmail.com>
> 

Lyude, please add something similar to below as the changelog in the
future version.

In order to use preempt_count() to tracking the interrupt disable
nesting level, __preempt_count_{add,sub}_return() are introduced, as
their name suggest, these primitives return the new value of the
preempt_count() after changing it. The following example shows the usage
of it in local_interrupt_disable():

	// increase the HARDIRQ_DISABLE bit
	new_count = __preempt_count_add_return(HARDIRQ_DISABLE_OFFSET);

	// if it's the first-time increment, then disable the interrupt
	// at hardware level.
	if (new_count & HARDIRQ_DISABLE_MASK == HARDIRQ_DISABLE_OFFSET) {
		local_irq_save(flags);
		raw_cpu_write(local_interrupt_disable_state.flags, flags);
	}

Having these primitives will avoid a read of preempt_count() after
changing preempt_count() on certain architectures.


Regards,
Boqun

> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  arch/arm64/include/asm/preempt.h | 18 ++++++++++++++++++
>  arch/s390/include/asm/preempt.h  | 19 +++++++++++++++++++
>  arch/x86/include/asm/preempt.h   | 10 ++++++++++
>  include/asm-generic/preempt.h    | 14 ++++++++++++++
>  4 files changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
> index 0159b625cc7f0..49cb886c8e1dd 100644
> --- a/arch/arm64/include/asm/preempt.h
> +++ b/arch/arm64/include/asm/preempt.h
> @@ -56,6 +56,24 @@ static inline void __preempt_count_sub(int val)
>  	WRITE_ONCE(current_thread_info()->preempt.count, pc);
>  }
>  
> +static inline int __preempt_count_add_return(int val)
> +{
> +	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
> +	pc += val;
> +	WRITE_ONCE(current_thread_info()->preempt.count, pc);
> +
> +	return pc;
> +}
> +
> +static inline int __preempt_count_sub_return(int val)
> +{
> +	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
> +	pc -= val;
> +	WRITE_ONCE(current_thread_info()->preempt.count, pc);
> +
> +	return pc;
> +}
> +
>  static inline bool __preempt_count_dec_and_test(void)
>  {
>  	struct thread_info *ti = current_thread_info();
> diff --git a/arch/s390/include/asm/preempt.h b/arch/s390/include/asm/preempt.h
> index 6ccd033acfe52..67a6e265e9fff 100644
> --- a/arch/s390/include/asm/preempt.h
> +++ b/arch/s390/include/asm/preempt.h
> @@ -98,6 +98,25 @@ static __always_inline bool should_resched(int preempt_offset)
>  	return unlikely(READ_ONCE(get_lowcore()->preempt_count) == preempt_offset);
>  }
>  
> +static __always_inline int __preempt_count_add_return(int val)
> +{
> +	/*
> +	 * With some obscure config options and CONFIG_PROFILE_ALL_BRANCHES
> +	 * enabled, gcc 12 fails to handle __builtin_constant_p().
> +	 */
> +	if (!IS_ENABLED(CONFIG_PROFILE_ALL_BRANCHES)) {
> +		if (__builtin_constant_p(val) && (val >= -128) && (val <= 127)) {
> +			return val + __atomic_add_const(val, &get_lowcore()->preempt_count);
> +		}
> +	}
> +	return val + __atomic_add(val, &get_lowcore()->preempt_count);
> +}
> +
> +static __always_inline int __preempt_count_sub_return(int val)
> +{
> +	return __preempt_count_add_return(-val);
> +}
> +
>  #define init_task_preempt_count(p)	do { } while (0)
>  /* Deferred to CPU bringup time */
>  #define init_idle_preempt_count(p, cpu)	do { } while (0)
> diff --git a/arch/x86/include/asm/preempt.h b/arch/x86/include/asm/preempt.h
> index 919909d8cb77e..405e60f4e1a77 100644
> --- a/arch/x86/include/asm/preempt.h
> +++ b/arch/x86/include/asm/preempt.h
> @@ -84,6 +84,16 @@ static __always_inline void __preempt_count_sub(int val)
>  	raw_cpu_add_4(pcpu_hot.preempt_count, -val);
>  }
>  
> +static __always_inline int __preempt_count_add_return(int val)
> +{
> +	return raw_cpu_add_return_4(pcpu_hot.preempt_count, val);
> +}
> +
> +static __always_inline int __preempt_count_sub_return(int val)
> +{
> +	return raw_cpu_add_return_4(pcpu_hot.preempt_count, -val);
> +}
> +
>  /*
>   * Because we keep PREEMPT_NEED_RESCHED set when we do _not_ need to reschedule
>   * a decrement which hits zero means we have no preempt_count and should
> diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
> index 51f8f3881523a..c8683c046615d 100644
> --- a/include/asm-generic/preempt.h
> +++ b/include/asm-generic/preempt.h
> @@ -59,6 +59,20 @@ static __always_inline void __preempt_count_sub(int val)
>  	*preempt_count_ptr() -= val;
>  }
>  
> +static __always_inline int __preempt_count_add_return(int val)
> +{
> +	*preempt_count_ptr() += val;
> +
> +	return *preempt_count_ptr();
> +}
> +
> +static __always_inline int __preempt_count_sub_return(int val)
> +{
> +	*preempt_count_ptr() -= val;
> +
> +	return *preempt_count_ptr();
> +}
> +
>  static __always_inline bool __preempt_count_dec_and_test(void)
>  {
>  	/*
> -- 
> 2.48.1
> 

