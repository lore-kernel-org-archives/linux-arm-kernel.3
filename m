Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7D1CCF2F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=; b=hA5XPxXgIlNcR4dCTmCf2hFxg7
	ji6YCDNaCXOt539fFRAV/XUnL896b2Z0LWDTOeosZWnayoLumuCED/JlGQHVKLeBJAn87fhpFGs4G
	lBcdmfjfLRLrmEPZb64vMdKSLBRQGeLWeHBrJsYUFjLezFKb6OMXdTTqXxUIkczfQHWzdRS6AwEdo
	olE4K8fGtT81N1synkSW0lvcChyOp96YxslEDO4BYNq/tNMf0dmeO6J4YzzlguxI3x6fO7qLXQ+5X
	SJUXgLbwmvTOpznqU3S6dgnHoq98smGxUVjRJvOqnFVwBtATg6B/2U0YL+sn7DYY8O/y+6hcAyO7Y
	ElouxKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoHa-00000001zmJ-2BXm;
	Mon, 19 Jan 2026 12:22:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoHX-00000001zkk-3sk5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:22:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so17390225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 04:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768825373; x=1769430173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
        b=UUjXpFnMK0ceni7hUHUzIFHNhHYJ+1ok1H3xgfVLsMiO83hy//42ncN8CQ1OD/Ey4/
         E43AtZvnbmAZd9rN9EfuUCnWGKrKqiG+Cs9MFuqmsGaNXWNadklExj/HnpxKxKZPA7Ww
         7tjOdej/a/1Bp1cqxIaVv+Ccswb5+A6/z2uScC4mn33NIBtSR6Zmi6VIyo2wOoGutF+K
         8/dx7Ec2MyJT0aUIGplz19AJ4cMzv8ouCdH/DDQy0TjZgjdqUsLOmpzf1pVKeAnDaxhM
         9zISSgQUo4QFRdzqRxdq4N6dOjEhrhM/zan0LDQ1+tLdUC/uOEbM9y/sCVOFDJbp4mmH
         3STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825373; x=1769430173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hizH6Y0dclm/GlFu897aCLzhsPW9G/RqQepyEMFpeE8=;
        b=tdfMUCBEw6YP7KKLtPR55IcHSHTw+zYVeFk+Rn7HDZQ1y5LtpQDog4QFA5DealS11O
         j9S4WEg2Q7RREiWiTq7nJ80WXDqj+zuJICunbFW2C0n5QoOFl7rPrIpNo7rNR2y4uwsl
         lJr31RsxwZMwJt4Vr+evK/hUb4Y4CSiL43CAQ6sANkMt3pz58qYpOmmqkfodsJqhshcB
         TCQ1vpHVodE/OudWamWMtuZJIRXBXuI/P9FBJMliqpF+W4K2n2ckvpkNACKBJHO4dkI3
         ukZE6u5sZHlCnZv06Fvgjsi95YchaaPi39YLU3Ma63b5qf0hyqtZFg2H8z7y5uNveLT8
         0F/w==
X-Forwarded-Encrypted: i=1; AJvYcCXfEysQ3g9hkaH1hOQz328WdUt20181A2B9IlVufgXQja1OpUQbokvIL9p5I9qKBeve1a4Db7Xig5zHtvmvAtlL@lists.infradead.org
X-Gm-Message-State: AOJu0YyIxFh2Q+huRCxGyOspKW9mFrUaO+FjeBC0zu7ffzL/YgzCt90t
	j+HWAQizQbACgR+TbRKtbQzFzC28rvatdB6cHdhLv21zsPVMHMrhBJ7U
X-Gm-Gg: AY/fxX4w8uGf6dkLLlB/UT4uuveXMNAFqrVsepNwDZh0t5CjD6gLlgnRiIsfB9YSRRQ
	9RCJ33ep/S/DQ966Ow3TE/vsVfPIzjVM+xw26jZitI9niGzU3ALoz7b2XBws3jPRB2IwN/VIbsM
	RvAUYVKgP22hEIZ63xfNraGsug1AcbqVjRtTayHLzWG/g9baDb3sEZDX5iiJEshsT+aVNjml1QT
	OxGGtQ9NFMfbeP7rNGJDt3shJHJBSlPS6JMiRk3njCy/NL1FJW4+5IQVfmPb8SRgqBokZ66csBg
	XoUlNX2mLC37jdeAq7UfDB4AL1yqxvlGTofI9knX4aCbLEITfm6rrh5WCfl0LwIuDSBux09hbmn
	1zlavP2rHsanZlbxXUsPRGDsv/b4OgvynrIqGeDXiShWEVqL9J28iT26UeJmRKkfLp93vuxV3zg
	QhU1OQVmKb7sepgQKQVIIW/63WCFotRh6mIpxOu5hKxKM5P/nOvCLh
X-Received: by 2002:a05:600c:3509:b0:47a:94fc:d057 with SMTP id 5b1f17b1804b1-4801eab54e2mr107589925e9.2.1768825373288;
        Mon, 19 Jan 2026 04:22:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe67780sm78105625e9.16.2026.01.19.04.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:22:52 -0800 (PST)
Date: Mon, 19 Jan 2026 12:22:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Kees Cook <kees@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo
 A. R. Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260119122248.30974c78@pumpkin>
In-Reply-To: <aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<aW4NC9P3K7Ab_e8j@J2N7QTR9R3>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_042255_995821_128BC22E 
X-CRM114-Status: GOOD (  27.19  )
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

On Mon, 19 Jan 2026 10:52:59 +0000
Mark Rutland <mark.rutland@arm.com> wrote:

> On Fri, Jan 02, 2026 at 01:11:51PM +0000, Ryan Roberts wrote:
> > Hi All,  
> 
> Hi Ryan,
> 
> > As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> > and, on arm64 at least, the performance is poor. This series attempts to fix
> > both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
> > propose a performance improvement approach.
> > 
> > I've looked at a few different options but ultimately decided that Jeremy's
> > original prng approach is the fastest. I made the argument that this approach is
> > secure "enough" in the RFC [2] and the responses indicated agreement.  
> 
> FWIW, the series all looks good to me. I understand you're likely to
> spin a v4 with a couple of minor tweaks (fixing typos and adding an
> out-of-line wrapper for a prandom function), but I don't think there's
> anything material that needs to change.
> 
> I've given my Ack on all three patches. I've given the series a quick
> boot test (atop v6.19-rc4) with a bunch of debug options enabled, and
> all looks well.
> 
> Kees, do you have any comments? It would be nice if we could queue this
> up soon.

I don't want to stop this being queued up in its current form.
But I don't see an obvious need for multiple per-cpu prng
(there are a couple of others lurking), surely one will do.

How much overhead does the get_cpu_var() add?
I think it has to disable pre-emption (or interrupts) which might
be more expensive on non-x86 (which can just do 'inc %gs:address').

I'm sure I remember a version that used a per-task prng.
That just needs 'current' - which might be known and/or be cheaper
to get.
(Although I also remember a reference some system where it was slow...)

The other option is just to play 'fast and loose' with the prng data.
Using the state from the 'wrong cpu' (if the code is pre-empted) won't
really matter.
You might get a RrwW (or even RrwrwW) sequence, but the prng won't be used
for anything 'really important' so it shouldn't matter.

	David

