Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89205CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 05:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPvEzMllSbsUeGZyzSL2DVJCIDjlLydKz1PcX2CIArY=; b=mTQrM5R1zu2UkPhrwLHPGY+6Zy
	3L2KsXN4qg2jbPW0JpFRB9t+y5rkEV+DVDT/wuBYexdDm/FKBvpR28hLrS6+tT1kqb6S9aIBlnx2D
	cFfHFjcM0ZDgHyi7k5ogdz9aUOpw5gttxSN8Io/sz43jKqNIxJkLMNpqC3DyITrtucZaWKGZPRkB5
	NVw4Zj+8C3jbHGoDPQsYEbnMnnOnSUkhMXB7QKSSEfcUhDPlyTHcSI9LZoHO9hqmo0AO26iACje6F
	21xAZPxbsIN1txRQ35pFQF7zJprdZbAaIy/YauOKKbLwzDIgI3qOVKD1I+2Sd+/fxzWjFbAjik0hb
	Kg0uAcJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteK-00000005iVI-3BKN;
	Tue, 23 Jun 2026 05:26:16 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbteC-00000005iRQ-1ctr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 05:26:09 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-30c23abc62eso3161602eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 22:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782192368; x=1782797168; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPvEzMllSbsUeGZyzSL2DVJCIDjlLydKz1PcX2CIArY=;
        b=FwzQ1kn+Kti8RQ5oCqTG2vzkcSOSD26On0ss3MS593QhPNz4xYX/HQJMpVxS4AfOmP
         wHX9mU/AM+sSBym5j/5ryQpmftWPKznAI20PQ85YsoD3fnqNyhGBMyN6pAd9mfYF7BVk
         gypJMlXnRtqBDsbKg8cNMQPMjcEonnc2ipTxjD7nvZFN9BukrYHpw66bdqBBY92w9ex7
         35j+l4v82AMLV8PS+LaEkoTKZZJOysbbjfZLtlAGmoGtNGXFlsvFvJAxp9863lHPLeO1
         s5epKAqB+ens8WuilZJA2DcK2u43W+n/brL6+la3jOWfqVXaYfneKL1N+Yo2FznHejRJ
         V2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782192368; x=1782797168;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPvEzMllSbsUeGZyzSL2DVJCIDjlLydKz1PcX2CIArY=;
        b=C9LQDm7L9BoClFE41tAEyTOEqHlzbibbyyV1GmBx0F+JAJlWQals68bUcrPToI+XbI
         HVmfScZ9agIx/bqkRhfOh4c71yHyrTgxlYojnrkVii0f+2+d10EsJCP8IWXrtLdIZ6HC
         HXeHGVgMQtgwYoXaVmlJmAlhocDrueTcW3BP0fNHrPmHhgxD8WJJG95ReRbwhhDANBqX
         0ciSfvPUcGvVM5MilfjXvrOXlHp/hVQqZapWpOtQG+fv6F1tgDHeabI+cP3v1gMEFxPL
         H3pJbTc9X+yKopV5vRo+We0+ikQIKck6mwTDkNy/D7JJArlltTqSRfRjooeQtVtMH0eg
         nzEQ==
X-Forwarded-Encrypted: i=1; AHgh+RryvNeqxsg/ZN0eeUTXfITfV1vBkLT+KJia+v9zxgTtyf9SO/g6nZgkfxwWaYcGdMnrBLXE80Z5JqJiv1+NZ4qM@lists.infradead.org
X-Gm-Message-State: AOJu0YxncABOLkTYk+cJwRcOu+WCexpeEdDb2591L+7fO/6j386YkK5V
	UgaNqb66O8LwcRkmu1eoMnjtFkaOwQC6HT/ngoqbRz05ZYGNkqaOB8w1
X-Gm-Gg: AfdE7ckmf4sznHuYWYsBiMkZeJfF/oxxuyJJmn1V5yaAxNVAwvEVzhzZZ5LmdkyKpUo
	niXFW3oDEo0v0H+4z1lvrVboIUx3tzU+hUfn299b1arGJv0nthajafHnqtvL4kYp2s+w3hp8H56
	/Lrri82pZ91xD2Z/1FPLh44pUBSwUqshGtR0BEHEtmUo2JBq4pEIoIVItutkBG2tjlT2kKI8VlW
	5h+O/BR4P+Hbq0iiGquJV0r2LgG2pfUilG/U70OhdLjyrLiYnlk2uLVVeg8080BcsO5YiF8yyqp
	+tKTZnmZJFsloUG+jSzjccR30yC0H56N3UBdOPvW+/CPnnsk7gAetXCgQX6edxGkx7U9BqoYE0Z
	lscHBSwpLt602uvqM1nMlhaqB78RwNQGYM3Oib8z9004pNVztzkMol9YOM1lrQVQshkqTXj4uwu
	S8duMzUPE=
X-Received: by 2002:a05:7300:d507:b0:30c:1276:cdf7 with SMTP id 5a478bee46e88-30c5bc78138mr708393eec.25.1782192367703;
        Mon, 22 Jun 2026 22:26:07 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1be4967fsm13102455eec.26.2026.06.22.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 22:26:07 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 5/8] riscv/runtime-const: Introduce
 runtime_const_mask_32()
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 Charlie Jenkins <charlie@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, 
 Charles Mirabile <cmirabil@redhat.com>
In-Reply-To: <20260430094730.31624-6-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
 <20260430094730.31624-6-kprateek.nayak@amd.com>
Date: Mon, 22 Jun 2026 22:24:56 -0700
Message-Id: <178219229643.10927.7189200920480581019.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782192362; l=1456;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=DjSs5oRw9rccbhTB4m6pdAGiet3QtdAO5qUM5zvUvsg=;
 b=Q7gZYCRpUNaR0P6LCnsW2BKyT1zjAR9X/QtNq425aoOkO4GWUw2wE2DMsLI9hCenc1NtUPLh0
 LKuQabhh/3jCnBFxJDuU/QtOQWYl5v1MrRasvhVADGKiAdB5C5B53hi
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_222608_458019_4E77A0BD 
X-CRM114-Status: GOOD (  14.72  )
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

On Thu, 30 Apr 2026 09:47:27 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Futex hash computation requires a mask operation with read-only after
> init data that will be converted to a runtime constant in the subsequent
> commit.
> 
> Introduce runtime_const_mask_32 to further optimize the mask operation
> in the futex hash computation hot path. GCC generates a:
> 
>   lui   a0, 0x12346       # upper; +0x800 then >>12 for correct rounding
>   addi  a0, a0, 0x678     # lower 12 bits
>   and   a1, a1, a0        # a1 = a1 & a0
> 
> pattern to tackle arbitrary 32-bit masks and the same was also suggested
> by Claude which is implemented here. The final (__ret & val) operation
> is intentionally placed outside of asm block to allow compilers to
> further optimize it if possible.

If the mask fits in 12 bits, we can nop the lui and the addi and just
patch an "andi" instruction with the 12 bits of the mask. We already do
this with the lui+addi block and nop the lui if val fits in 12 bits. I
would be happy to help draft that optimization. 

But I think the better solution would be to take the power of 2
assumption since that will also benefit arm. We should still only emit
an andi if val fits in 12 bits, but if it doesn't we can patch in
shifts:

slli    a0,a0,x
srli    a0,a0,x

Where x is the constant (arch_size - _futex_shift - 1)

- Charlie

-- 
Charlie Jenkins <thecharlesjenkins@gmail.com>

