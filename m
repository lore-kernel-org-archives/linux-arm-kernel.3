Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065C0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VO8q0AnAmxFNe/vm1uJoD+lgVkSql5cwRJ/sExdX4qc=; b=zXY+qevil87HLuRlXWt6xCtrQY
	h5czXJqAlmRyYn8TCBVXBTIgb43o5VgDiho6jJBWgK/TO/mesX0OI0GWZh+Ldl69dg+hSNpFoL5mj
	sehn/JkH8nxneKcWCmqjjgA9fUP0BQrgZMbvJi8BGBgwSwiMnJUWN34WtL28b5qymayWqyf3dO/p+
	MEKQk6aipfioC1Xdyv8SNAS+X88Qw2IdM2Mbem6Or0XH9G9gjWPauF20kN8AnfvpOq7rZutmRb+Lm
	ArE6Wv/c4GJxgBIpfG10uwyPFDzYvgyUxZLL6juJh2yxyAep/1DrEqLsPu5AfhdJmcJxRCmEhdpOE
	mxmi2VJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLgE-0000000COHl-1Ua2;
	Tue, 04 Nov 2025 18:22:54 +0000
Received: from mail-ej1-f51.google.com ([209.85.218.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLgB-0000000COHR-39bg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:22:53 +0000
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e9d633b78so19893866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:22:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762280570; x=1762885370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VO8q0AnAmxFNe/vm1uJoD+lgVkSql5cwRJ/sExdX4qc=;
        b=s+YFkPd4Ey0SHf/VubcRjRovc5WMzmDybigexFd/QfqPud8R6PMVzNOJVUTs7Kv8lJ
         ibl3LQYimvBfSy9aXwE1TLvsvNxKEfnItpupNGSX++x2/x6yBL7IuZc6Zli8FAuswqcb
         YGfB/QW7l7GbJIGUZvSvHGxwDJ6BsIQ/x9bux2MC5YZKM7PRUeQRW2PT6EI6BVi6jcrS
         Ci35b5WGP0POt5s2ib1Qm2guXmgQ9pru3eCtiHY6rO6ifd4sreBbdIQ2vMGsp0Ni91g0
         Jf7Ap1IL2Weff+2+pSsQszd3BjlMMNQayD5f4Q1uocLrwsVQKStPltV/Xc9CaXskQLmp
         Qg7g==
X-Forwarded-Encrypted: i=1; AJvYcCUhSch3wBpMjwXQ4jdRSpFJOu7koz80DmKBinYXcCV7jziO81uLFRklK8SpVADW0C42uKJPysSoIHm2+w830It/@lists.infradead.org
X-Gm-Message-State: AOJu0YyEWFhWYNfqTMFlkY9PHvtGOESeZysn68VGaapMC8I11zMwFaXc
	/W+nkFgxMG106RqxwkAxLtd+WOkn8XDFMZA8KJO++EchXSIWtVqfRRw7
X-Gm-Gg: ASbGncs2H+vKC1b3ygMVYef2xIR+QUTM6N0sGmpd+6p7n/1vAwPE3kWw2tOBrAKQHF1
	LEHW5HcQYRvBva1tsGaBx7AbsWK1e7ZeF5mnKgHa7K4XIB1X9svQw14LvxipRN3ACft7YLMjl5d
	/qUUT7QWKG3qGgAQrNFyUcBUr4BQKjcPcQ1hdFiK8GbEvr94sD8fBIQvF87+shydK0dor42d2rt
	pRMKnkb0gwDhl9wMnDHL0tRR+eDtR1+M1DQu7yjkAE8wNZJrCaUELMVeVXVLAWxM2K76aLNc5+i
	qcOz3tBY2rAnllOfvcrNRDd+/iVZFzPgasObUhxguuei9r9FxO0XTsLJisYFz6MNZAzsblzQftu
	L921fheowO2DS+Dyssle+DA28ob3L9cC0/Isc5MvfyJJHYx8VbaL+dxw9B7lmjbMPm98=
X-Google-Smtp-Source: AGHT+IETiSvF6/7s3LGjtgrQleGavpJvtpxgZOwP0BtzIu6DgGCgyTBOnQI/BXMVVATzTWmZ6L2DoA==
X-Received: by 2002:a17:907:3c8d:b0:b70:b9b6:9a94 with SMTP id a640c23a62f3a-b726323d57bmr53802466b.23.1762280569588;
        Tue, 04 Nov 2025 10:22:49 -0800 (PST)
Received: from gmail.com ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723d7030adsm279269666b.24.2025.11.04.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:22:49 -0800 (PST)
Date: Tue, 4 Nov 2025 10:22:46 -0800
From: Breno Leitao <leitao@debian.org>
To: Willy Tarreau <w@1wt.eu>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, 
	rmikey@meta.com
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Message-ID: <lmplvwfaipvflur6jhslgzy4thzvqtzivr2qj2nomypf5l6ef6@bwlotfsiso7v>
References: <e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop>
 <aQUAR9MRxP6_qtEH@arm.com>
 <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
 <20251104180819.GB20579@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104180819.GB20579@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_102251_816163_BD81E96B 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, Nov 04, 2025 at 07:08:19PM +0100, Willy Tarreau wrote:
> Hello Breno,
> 
> On Tue, Nov 04, 2025 at 07:59:38AM -0800, Breno Leitao wrote:
> > I found that the LSE case (__percpu_add_case_64_lse) has a huge variation,
> > while LL/SC case is stable.
> > In some case, LSE function runs at the same latency as LL/SC function and
> > slightly faster on p50, but, something happen to the system and LSE operations
> > start to take way longer than LL/SC.
> > 
> > Here are some interesting output coming from the latency of the functions above>
> > 
> > 	CPU: 47 - Latency Percentiles:
> > 	====================
> > 	LL/SC:   p50: 5.69 ns      p95: 5.71 ns      p99: 5.80 ns
> > 	LSE  :   p50: 45.53 ns     p95: 54.06 ns     p99: 55.18 ns
> (...)
> 
> Very interesting. I've run them here on a 80-core Ampere Altra made
> of Neoverse-N1 (armv8.2) and am getting very consistently better timings
> with LSE than LL/SC:

<snip>

> It now gives me much better LSE performance on the ARMv9:

I also see a stable latency for ldadd in my test case, also, better than LL/SC.

	CPU: 0 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.74 ns      p95: 5.81 ns      p99: 7.13 ns
	LSE  :   p50: 4.34 ns      p95: 4.36 ns      p99: 4.40 ns

	CPU: 1 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.74 ns      p95: 5.77 ns      p99: 5.82 ns
	LSE  :   p50: 4.35 ns      p95: 4.37 ns      p99: 4.42 ns

	CPU: 2 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.74 ns      p95: 5.81 ns      p99: 6.76 ns
	LSE  :   p50: 4.35 ns      p95: 4.80 ns      p99: 5.55 ns

	...

	CPU: 71 - Latency Percentiles:
	====================
	LL/SC:   p50: 5.72 ns      p95: 5.75 ns      p99: 5.91 ns
	LSE  :   p50: 4.33 ns      p95: 4.35 ns      p99: 4.38 ns

> PS: thanks Breno for sharing your test code, that's super useful!

Glad you liked it. I tried to narrow down the problem as much as I could, so, I
could could follow up the discussion. :-)


