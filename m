Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA502F589AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=; b=sEDZMLqocKOyaM+/FFwogkFviP
	ZTd33c4bL/0fvdy8VXaMQ+31zvLYOyJu8w0kRpDBO18IAvLDjAjVPnmt/StJcrX/YSTbkvSMhQxU2
	VHxwxpeFpzvc8LPQTUaDBdMBQAWGrp6KyngOeW6SKaB0Q6z9EJbpk/nSypNf6w4aV+u5BI7r+lGhq
	SexdrA5Xpc349oJpTUpx4Z8u5bTgPSjQMSZiDr0DlWwohRhw3C1wMvWCiOkbmzx9e/CuJRy1cKVkA
	H2WAKx5866FrguAKOzPVtnPg9hEfFfrHbSROCfVKbPG63ZvUOgKbR74WyF0RjkQwZGbxDP5t6ZJVB
	/X8JPDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtIL-0000000Bd1r-2DRd;
	Thu, 23 Apr 2026 12:36:37 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFtID-0000000Bd1S-2W6S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:36:36 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-38def541b0bso57592251fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 05:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776947787; cv=none;
        d=google.com; s=arc-20240605;
        b=RzkAvi/dz5XdYwrXHkEJrDIav4TC3dyvTk50eK7poJbnS69y779QMftfPUl+I/yX38
         6BaJ07BF0eOU5wVYRlC1zUxYYUd8Q5kRaTkgOe/OZvzmdp355cFbWpEuXWRyPLsVgqlK
         pC+UwfykpGSe7Tm4gZBkBxfVvb2JyzGU0E7OFrCN6XJcOcTB6raLHCkO1zUi9X5c30Zv
         iKSb5TRRjTjiARJ0/PupvGgfLW2IjV9SIWISGb8iK+v48RTu6KMC+T7E0XvIOAbv1Wae
         Fr8Kk3F4V3bEq3vFyepjv/HUNhr8ZBUBH/P7bu7Q5Vs/USLuxaEONquuTjCFWUp+uf6k
         549A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=;
        fh=9o8GjOIlmStJS+4oVEjovUlUmcztotb5CWxp4j2tMLw=;
        b=VoUpwUtIfMHTWymNndagA+zDFVnO6TuNjACPnbQTJ/bZMQjhYfUADqooccyKBk0no3
         pvcyn5fFYay+tK8NIARJLxqVi4ooG24tdhSpiHMv0bAutBJFoEojfQiadFNzAYz5+v4x
         w7W5qAahhMugMyZw2pTai9gwx4UiuKJ+mfYOXP0AmXg91qkL4X7gkTS/MHyrVHSZyQtA
         G46cXPGaCoqprzGUUDP6YqczFAyp8zUHuER6vrzbSG2BnckggkUHBweagTWQezGD/dJr
         P+MmLmpat+qxi7CULOKdKDHH/DL9dEMESD3QF6dEc7MBQc4yIUBhKd65YpgF4cIKuBg8
         2bKw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776947787; x=1777552587; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=;
        b=ZRKPIGk3/8lsHAq4KX5SBKeth9uFZdCoTbGXEm/96kRijYBn0XFMh/eBzR6Dz5sMTL
         xOAh2TCh3fsDlTXjLDRBeE5eTnJscRru3mnBIyQJSXdQi1OVLuhe6X5T5KbE2r0CEfXl
         CGpUuKisRuQPe9ydMNJVs/dUUzqh05bxglSnqxZ9AGV/MyMFL9hfPDicU4V+NkVWE1D2
         18IJWBp/X9qIhaBI+RmtuovUtWdBZ9XHLITQtflIMgoAmYFG+boU7GVQuSmcRRr1HNgb
         ZZSz+2y3wfukj49X8P+CwDgOWmcBb2F4KY2A2l2FgrfBTYdknXKZpUq+00z8Do5wJRKE
         JcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776947787; x=1777552587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3l35eJicdA9ttVOYKMPZgwAhNep30y27OnDLG1eCTQ=;
        b=E+BbigtA/eXbHg30CSPeDvLHK6SWbvO6t8oo3gZ2USm09ENInlGLg4c1ZC8TvDbNSm
         G20R3KFNp+ZA1v3IvLrJ7Qi1Wvxh6zOAwBi8cf91p7oMl7sj2CW0D3Ek2U3riRoCjrWr
         mlBfwDBiSryvCkPmIUJyshrOhhgIdYDzl1XRU/Sn0D/sxjnd99bnh05SnHksZSExcXae
         Go0xcUDdCpIlxF/CIVLU57vkJeKndad7Wp4StufuBCjpq+5achno0dPLbw3qYn0z3m2B
         AhG3tgXanWOgVHytqUdlFS6u368Hac7vVPj6NcnmDLq/0yEx9WLUOZJdkSu47yV7F4xb
         38uw==
X-Forwarded-Encrypted: i=1; AFNElJ/BoO4GxKUBB4BtceziwT8ULpNM3K/ip3ULhUw2PbZssaPdftIXDqF6qE2Wn5iq2nYjr8iusA/ndsvbOGETdaSX@lists.infradead.org
X-Gm-Message-State: AOJu0YyfZYVQ0TxyxP/ECgHkk5wpztEaaccFo8NdKQ8wN6pIcyav6UzT
	lHinr4EPDEMu16TH/rykT7zwnIxr1pQyAMyAAhFQxZ8a1bN6WqkKd7srqFb+YByQFJ0N2fSkety
	eyG08AKPlhhVnP4hETHNF8yuh5a05zILL4pbWmMqO
X-Gm-Gg: AeBDiesSwq8k6MohCuCHvIG46KKAXaFKFle8RChg30N6ipU/nGLlF6sQEbZY6vs/hrn
	FebuEEDlkQwf3O9km1OI1vh34WzWkQx14nHfqChBIauKoaRydiUxKggXi73Rp0KaFJjPMuqw2Gc
	S/WOF+N9MwN3r0pcMV6MI/DnL36OZvhfoWMjXbi6ob0qoG5isfLje6qKEDkD9XGu2I2tglnqKw4
	sTSAqCALmkXn8eBzu1KzrT/xjWZ2+7hHT091PMgW46JABPoD9KYq0r9+ChgoDdvXFR//g6Mn959
	OWPq6p6pD49NMXHmtitBpKwebKUfNlWY8LsrdwpD0oa+DMoYTRLerdaQV1WXP0bszB7EuGn7V59
	xJNzFTsZlZK9CAKqm9Sodhjbi8Q==
X-Received: by 2002:a05:651c:2129:b0:38c:4231:91df with SMTP id
 38308e7fff4ca-38ec7843861mr104639501fa.10.1776947786923; Thu, 23 Apr 2026
 05:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx>
 <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com> <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
 <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com>
In-Reply-To: <1e839a25-d15f-40d3-ad6a-20469fb6137c@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 23 Apr 2026 14:36:15 +0200
X-Gm-Features: AQROBzBeN0_imLCp4YRP1WQt-rdOLNehWGA1b8A-XdhmUjECxUTrglkEDT8uDp8
Message-ID: <CACT4Y+bMH+q2C7Xg9oHRP5ZbmvLpMpYzrdAd7B6XoXYc8=22sQ@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Mathias Stearn <mathias@mongodb.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_053629_689380_E62853D3 
X-CRM114-Status: GOOD (  22.91  )
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

On Thu, 23 Apr 2026 at 14:29, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-04-23 01:53, Dmitry Vyukov wrote:
> [...]
> > +linux-man
> >
> > This part of the rseq man page needs to be fixed as well I think. The
> > kernel no longer reliably provides clearing of rseq_cs on preemption,
> > right?
> >
> > https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241
>
> I'm maintaining this manual page in librseq.
>
> >
> > "and set to NULL by the kernel when it restarts an assembly
> > instruction sequence block,
> > as well as when the kernel detects that it is preempting or delivering
> > a signal outside of the range targeted by the rseq_cs."
>
> I think you got two things confused here.
>
> 1) There is currently a bug on arm64 where it fails to honor the
>     rseq ABI contract wrt critical section abort. AFAIU there is a
>     fix proposed for this.
>
> 2) Thomas relaxed the implementation of cpu_id_start field updates
>     so it only stores to the rseq area when the current cpu actually
>     changes (migration).
>
> So AFAIU the statement in the man page is still fine. It's just arm64
> that needs fixing.


My understanding was that due to the ev->user_irq check here:

+static __always_inline void rseq_sched_switch_event(struct task_struct *t)
...
+               bool raise = (ev->user_irq | ev->ids_changed) & ev->has_rseq;
+
+               if (raise) {
+                       ev->sched_switch = true;
+                       rseq_raise_notify_resume(t);
+               }

There won't be any rseq-related processing for threads preempted in
syscalls, which means that rseq_cs won't be NULLed for threads
preempted inside of syscalls.

