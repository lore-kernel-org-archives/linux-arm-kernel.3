Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D9D109C05B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xbLSrdYpjpwOAwc60D31b27IF6Zr0PDhPWePECVS50=; b=uzdrUGooH1KicrdNuWN+LzbdBq
	XunILhDlhQVhvJyRo/5kHWuRZectvKDNHMVXmhFxPcN6NOBd4NrYWdcF7X5R5fkAyTedeSegf1Y5J
	OYeePN545wc9L0kKFU4c/v1bbZU2FRRRYEcTceyH/xCEMhTqNB1Q1ilyvFxNuV6aKN0WGRGraA+Kg
	7uGLS4AP8+yzGwJexnRK3py3tlboJM678JI0D6KWefaU5qq25hF9JWXNNbynwuy/jWuqOh36yWLmc
	wXgYPffnz+UFqbxqnCosQTQ8EXpySOfPma5Yim0WFR6hVxeJp9+HvH6nA0Klt+xt7g8lvOaAk8UZL
	4HQxd6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U1Y-00000004A5c-0OZE;
	Wed, 25 Mar 2026 19:36:16 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5U1W-00000004A5E-0Hg6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 19:36:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so143217f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 12:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774467372; x=1775072172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xbLSrdYpjpwOAwc60D31b27IF6Zr0PDhPWePECVS50=;
        b=cdDOrONFBvnM7CPcM1dE3Q6D8i9DbaMbSxHAllkQ+Nj/WQ49JN+wCGz6U3GWKHC0T7
         r4pQ2dVT7DzALt/YbXItzc7uO4jW9PiHj+dGJ0fzdxnnbpncVLkm8MWWUuhXAtAgzxDS
         AktrfNAsjGqrHaSaNl+22rCnFiC6Qq6ZeAtG45K/dUqsu/7snKrtfoz8kx7S+JPRmsLD
         SIAViW8eRRgTOuvBDau6bOdi3Wij1btwJI7lM8M75K+Z9Wo0iRogZMW6DLZ9yWWoEzzg
         l0thZSwbVO+E17OcH2HArrV9W1hMv7qvTMx/Fv0DeNRfPkzctRcK8cyi0xhM4tAq2uLO
         pvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774467372; x=1775072172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0xbLSrdYpjpwOAwc60D31b27IF6Zr0PDhPWePECVS50=;
        b=aCm1Nk54AwBpipQBJsbZ19kyI9X0UsnIJUkJtZ1MgwSxHfBAwq9SmWXq8YkcPdj2L9
         TdnQxP2aE87iZftRd9egOpLOmNtG3T1OILULq059NntfIzbJhSmu25BY5eD1MNRAZunJ
         IiBkO4W0Tbb6N1igLvjPV46/Uhpi9fUDGhN0d+7YoKoxhJZBYi9OW1uhlmacLsT2/UWq
         xkVZDogAbr7hHDyegv/QPJO/weZacyk2ooN+WX32x9bi0j2ImallIHmHrMhX2yLwSCE1
         Wc3XULQXtgcHwX2yVJwRxHYURfsrTc2NKWgem+4Q50VA+yzbZ9d0pNDIRj0TuHTO0yiy
         DL7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLytdcV3vAg8pRu9gOrxu4Ki3g2zlgKoD9ha4sV7esBUf2mqUh1qL/iCnY8UM3/0rAmsENpnQT2Ny6q4sMtQH5@lists.infradead.org
X-Gm-Message-State: AOJu0YyzoIlK27RI0BB0Sp16LgAUBYt+tLaUC/ExDpyu9HT+Zy0I1aBA
	24Atqp7R0cXUv12qcTHFPYi1fzyd1MUiPb7xCU1uTRKlrIwDU4bPlJg3
X-Gm-Gg: ATEYQzxphaRXlI9We2wcqsrtlWeN8ppjBQ9+lkzalrKS26ZnijAC/SNfFyAXfV/YLir
	sI10CgRt7IBRyyFVRnXtgQMP11Qj94/jjtjermHKMn8tsLBUbq4xp491x/bC7G8J0FEJeVzcciM
	0wdda786Q3cNKfqSBYuMjn0o9PABqEHuqFyK37kaE8YwIeG7J3sPDrWOZjq7hI0QAxfx7a1qUXI
	NqdiYkCtOr67xFPsPI+oC3KFwt9437NC20r/iUWtLLqzqnzyghB+34BrMfxaoTZo14WOxOmNWts
	QiDXhfku5GsaiUFyTD1akEYliGyu/r6ezTYUFigQR57RDad5ee8O15WQuOL3SF0OE38bo5jgLi3
	LmaRp3ZNZyH7nhLmsVhL4DECL6iMsvzi1zoT8Ktxk+xVLMIi7h7KTSlqdeb93neubdGlzygww7a
	nbv/fcYQJTSy738rwroMHLg6RbYhumBxUxcdIt5anjNjJ3952FDDKZj4YDNx/t8L7ohRKNBDLWC
	uE=
X-Received: by 2002:a5d:5f47:0:b0:43b:8823:c12b with SMTP id ffacd0b85a97d-43b887e6cb0mr7083427f8f.0.1774467371899;
        Wed, 25 Mar 2026 12:36:11 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919dfb54sm2097287f8f.31.2026.03.25.12.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:36:11 -0700 (PDT)
Date: Wed, 25 Mar 2026 19:36:08 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
 will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <20260325193608.10e9eca5@pumpkin>
In-Reply-To: <acQFaVR_bGZU2JmJ@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
	<20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
	<874imftol4.fsf@oracle.com>
	<20260316233712.7cbfac27@pumpkin>
	<acQFaVR_bGZU2JmJ@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_123614_127611_173FBFAE 
X-CRM114-Status: GOOD (  20.59  )
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

On Wed, 25 Mar 2026 15:55:21 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Mon, Mar 16, 2026 at 11:37:12PM +0000, David Laight wrote:
...
> > For osq_lock(), while an IPI will wake it up, there is also a small timing
> > window where the IPI can happen before the ldx and so not actually wake up it.
> > This is true whenever 'expr' is non-trivial.  
> 
> Hmm, I thought this is fine because of the implicit SEVL on exception
> return but the arm64 __cmpwait_relaxed() does a SEVL+WFE which clears
> any prior event, it can wait in theory forever when the event stream is
> disabled.

Not forever, there will be a timer interrupt in the end.

> Expanding smp_cond_load_relaxed() into asm, we have something like:
> 
> 	LDR	X0, [PTR]
> 	condition check for VAL || need_resched() with branch out
> 	SEVL
> 	WFE
> 	LDXR	X1, [PTR]
> 	EOR	X1, X1, X0
> 	CBNZ	out
> 	WFE
>   out:
> 
> If the condition is updated to become true (need_resched()) after the
> condition check but before the first WFE while *PTR remains unchanged,
> the IPI won't do anything. Maybe we should revert 1cfc63b5ae60 ("arm64:
> cmpwait: Clear event register before arming exclusive monitor"). Not
> great but probably better than reverting f5bfdc8e3947 ("locking/osq: Use
> optimized spinning loop for arm64")).

Could you change the order to:
	LDR	X0, [PTR]
	SEVL
	WFE
	condition check for VAL || need_resched() with branch out
	LDXR	X1, [PTR]
	EOR	X1, X1, X0
	CBNZ	out
	WFE
  out:

that closes the timing window for the interrupt provided the condition
check doesn't change the event register.

I must get back to the osq_lock code again.
I'm happy with the code - the per-cpu data is down to two cpu numbers.
(Apart from the acquire/release semantics in a few places.)
But the comments have got out of hand.
Writing succinct and accurate comments is hard - too verbose and they
hide too much code.

	David

