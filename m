Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34B7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcY1WuRhXouiGA4KCWU+G5cXctN3EhAkLVSQq5aIkDA=; b=QpLHFrSNF9kRhT5igZq6MXFajH
	wpS3tiFpfX3lbD0ALUIkA/tPetCNM24dFovbCb/tONhGga+IGbDxKeT7Ag3ft/z4cvkqoJw81t6rA
	oaz1n77hQqviSG9DBJ8paRkr3vH16Z+JfP0APlTZY2JCc7t27xyCGW3fuJL8Yk7KphsHWPWu8CwX+
	zOPFRK6bT74+/y0Sg9oA7g0p7J8gXS6tIEvqHhl8pDtqj3Pk8d+pVWbDX7IIBzRI8eAiiTDCTjOjx
	1fizgaRH/hhaQEXkjnSmnzGRcOi4DWh7uLmNCfaxsUGXLRgWAL7MDUKnwZD7Q7LB3bVQDk/ZpNi4S
	Z8p4Twqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9IJ-0000000GZH1-0Zbz;
	Tue, 21 Oct 2025 10:08:43 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9IG-0000000GZFn-12Ga
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 10:08:41 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-78485808eb3so36600537b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761041319; x=1761646119; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FcY1WuRhXouiGA4KCWU+G5cXctN3EhAkLVSQq5aIkDA=;
        b=GVKSCL540dWg3T2GpRmblRqAgSVn1KIZ+RIXrkcH4x9o0ADLAw54UDxwsl6j1ir+h3
         2+yIaSKVcpiaKSednYL49OKLNp2RL64UrJLgS548R2FkJ1PnxLL2qh/DEfef/EIVxDaI
         W08VYMJSqyQk07DBrU9qryVzS6NKyZ2wE8g3pl1rTg43eQqc7YH6P7IsWfIH0e/v/DDC
         17+w6lGVr6f2fMH5mghaF9JC5DiDVZy3SDlFiGmnxuJwsQ6z3LYZO96EIbQ4wnPRaYmv
         xcnVzpsoutNIClyPq0m3CdZ3sUyQFxkus4VHMCvao6/HQaL2kAZjGdw/UJuFhT/c6apP
         1BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761041319; x=1761646119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcY1WuRhXouiGA4KCWU+G5cXctN3EhAkLVSQq5aIkDA=;
        b=BiTmFfcJpXYbBzeVLhJbbG30A7IkEbWpyJuWnobOQcfg4QPrNMBwJ/V2VVSk0lnlXd
         MvlCW+YbFfcaiJ++PB8zx2NKo1WhR9VSzM7gtgNNw6FYDfrzZ8OJ1L7+aMfRq8KiQkKs
         1JnCWKOw9fUazrKihDS+Z2zYEJ04f0xkci1XwJ81MaqzpDuNano5Sa1Hw+0nKsKRs+/J
         RBbDm9HJgahenpkRVZC2CR/qWX+6EB5QUhtXsMFbiSRrNb5qLRhY1GpFQenk5Tgq+Fei
         KXjds76iVH2oAUz2vTG3M7nDY9P6OQobmnMchp0Ys3iRvEFZAV5gdPwzIoUtpUHBZS++
         U5YA==
X-Forwarded-Encrypted: i=1; AJvYcCWvQi8XG9JkIJo4+JiFvFNYk0G8yJ8APXpgvZ8Waw283aySzjdb0tQpv4Vkx1ykh2oAaxvRwJrvHfNxyA8nEZHD@lists.infradead.org
X-Gm-Message-State: AOJu0YxHnahBhCl84RfjPp0P5nzr6kkDViwRO8J26LYyMtpfxjBLEvw/
	cMJ0wlGtGEcHjSq3jhGU6cXvhYHgGeoljWLJxhf7mf5kDW9vi61S3BgSn7IiDgn0nF1vv/n5KiA
	luF0KwbvOJzq/5yXuhA48C3ZjVgxzR/f7tDtpJYu36w==
X-Gm-Gg: ASbGncuitlG+G8b6jv4ip1gyUrrviK0bi6UvNUR157f4ohYZRuFioVhcma9IC6faTZQ
	d5Kd/NfaHiRy6RHsb87NPbR9/uq8mOHA0YuaR5FuDjyNnxp/mvlX7WGA1G3419xwM1Cr2re0Yb6
	8ULXmrClnM+TPMkQHqgZtyNzQ7IKbwFhfn5djeGbQz0hcxY7x4w9k2ucRPtyGRZ9TZ7rzSon6EC
	IgnO/x0NUf/AnITYZfsiTiCpOCntH98asGo040uCpNiBCBvrVxwK6SpUl5iIQ==
X-Google-Smtp-Source: AGHT+IER588Lwab2jH1RPVxWEMKtc71AdHZ7rUDhw6Az9ENBa6h+mO9XQH92FP+m3bjNm6autc5uWg5ixjt23yxAFE0=
X-Received: by 2002:a05:690e:d51:b0:636:d3f9:6418 with SMTP id
 956f58d0204a3-63e1610c2eamr12824971d50.22.1761041319091; Tue, 21 Oct 2025
 03:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251020141718.150919-1-ulf.hansson@linaro.org>
 <20251020141718.150919-2-ulf.hansson@linaro.org> <a0120876-0f00-4e1a-aa17-5fe7c3512276@arm.com>
In-Reply-To: <a0120876-0f00-4e1a-aa17-5fe7c3512276@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Oct 2025 12:08:02 +0200
X-Gm-Features: AS18NWAG0JIz8WscydJtNeviSVU0idBmTgh-4-AojKeBaYrYkaU30tTtBYxU8G4
Message-ID: <CAPDyKFrY5kOsoOH-mcWFiaiggV4q84xOtiKHdNN4bMfFmYOQPQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] smp: Introduce a helper function to check for
 pending IPIs
To: Ben Horgan <ben.horgan@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_030840_308961_137DFCED 
X-CRM114-Status: GOOD (  24.47  )
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

On Mon, 20 Oct 2025 at 21:11, Ben Horgan <ben.horgan@arm.com> wrote:
>
> Hi Ulf,
>
> Only a comment on the naming rather than a full review.
>
> On 10/20/25 15:17, Ulf Hansson wrote:
> > When governors used during cpuidle, tries to find the most optimal
> > idlestate for a CPU or a group of CPUs, they are known to quite often fail.
> > One reason for this, is that we are not taking into account whether there
> > has been an IPI scheduled for any of the CPUs that are affected by the
> > selected idlestate.
> >
> > To enable pending IPIs to be taken into account for cpuidle decisions,
> > let's introduce a new helper function, cpus_may_have_pending_ipi().
>
> To me, "may" indicates permission, i.e. is allowed, rather than
> correctness. Would "likely" be better here, cpus_likely_have_pending_ipi()?

Sure, that sounds better to me too.

I leave it a few days to allow people to provide their additional
input, before posting a new version with the new name of the function.

>
> >
> > Note that, the implementation is intentionally as lightweight as possible,
> > in favor of always providing the correct information. For cpuidle decisions
> > this is good enough.
> >
> > Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >
> > Changes in v2:
> >       - Implemented a common function, rather than making it arch-specific. As
> >       suggested by Thomas and Marc.
> >       - Renamed the function to indicate that it doesn't provide correctness.
> >       - Clarified function description and commit message.
> >
> --
> Thanks,
>
> Ben
>

Kind regards
Uffe

