Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C0FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tohhmJpLnU2OZqryKv4/8WdFOQ07N2VycEhxl34l3PI=; b=PRl/9MG76KdOTpAm/5CJEFUD51
	dqq9+WbVTHiF0JRK4annvppFGunE2UL2ArBZsEWv19WMQCSjo9/Juhm6hq+bah1JLWEXjdfVQPcTx
	U4MlGPkXR/NRXO30Lp8Lg0T1xnfDAoKT7sCLX4hZfnjtK+jbZZ4eLKAD03jzIEkwKCHHuA7kAjPs9
	YfRpNmjLZE+MTYIXEdLUYAaUy9deHpgCGF3eHw7VmAwKlHhAU58gZ4YmNcHy6MnZmhAOfjMIiaDVt
	EfdeW5AbX0II/UCr1MyoiosqCh06vxv6p3B8iRPUq9ZGNUlc84tNcYa7rCi1iLVxkvDtiuafiNODw
	ShBk+9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGuP-0000000D9wE-0hOj;
	Wed, 10 Sep 2025 09:14:33 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGuM-0000000D9vU-174u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:14:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6188b72b7caso7251024a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757495668; x=1758100468; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tohhmJpLnU2OZqryKv4/8WdFOQ07N2VycEhxl34l3PI=;
        b=B83GNq132n2M3pnJOXrv8F7hHfJYwGA8VusLb62V11PS3REyPs6PX+Zr7NDIcylD8p
         W/PzCvx7E37UYlUdsIrrK96dYZplq7DK9LISYsy045GV/y5MN6nNNzB+yHZOWLnuiSeT
         P30oVwxBK+lcPHb0poHAsbWmPnHipLA+GjCks/BGEY5dTxJnB6eUxNTt+2YueC9TCB6R
         XexCQZ1e6V+DBnyv+4+fCCTIYy741z3CF6K/HJYtFHFKvmFie1gD+vK9mKKg0R2aQz92
         tTNTFcfxClHlMnSuQdi4zyfEIOMO2PMiR90O3+eyB+nGx9xDHs6G7kftLvHJwtt2+WkV
         E1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757495668; x=1758100468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tohhmJpLnU2OZqryKv4/8WdFOQ07N2VycEhxl34l3PI=;
        b=hkdX6aIl5KTn4PEqmxl9T+IsD1cxUVdP0WMgXzYpfh0cBTrSn1WKmvEkcjET58Ld4n
         dqXfNZuJiKz//RL1HAF93UZ7EfBYEWNnOlKduOtonIjrzTF2F8fGac6Fy5aY6lsqt12O
         gpAPUp1L6bcF0Vp2llvLlIk2NMt6q0kXNqJbastcOIAjdQcXVtywtPC+C+TK4w4R9LMB
         MTP0ZxwWgx2g8ZrSOdx8h6XqbVcw04pfIO27aq2b2V0iVVklyGOCZ5MARNLBdkmUqWpv
         1+zuWcfHhnPu/mUBtQKVOS6QTCvBJrPGCQh0Nksk8nfuoiFr3ZREhCc/jPSQsHc64Q21
         fIjA==
X-Forwarded-Encrypted: i=1; AJvYcCXqLhjqUa8mxu85WJt9NslS3OJJJfA7EZXJ4NhdEoaWShO8JYdV1ZIrw5AeUisyknxM7iScrRXvNHjS98JCA2MT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm7cKohb3QYj0iTtUilRyQzO4WSRzVIKFr4H1Di60dIRxWFkoJ
	AbQMxQ/jBBA8BCvXiRz6yxdwrfSGwqIPtDHlSBDw1jmlPmEu8FeCVJPkhxDB9hJdH3Ywo7KCovi
	Inh29rCc2Z3cUREZzuMlYT1VB92fID9c=
X-Gm-Gg: ASbGncthMZR7rizhnx5dl5qupqKleqzVt6tAytZKlu7AThe/WyGbYxcXBb/1Hp7xoqn
	86Wk6TcOhjtXQCGr8r0nBt0YY/rrBKffcfaA1h1CJ4lmyMy5iIrMvneN+BWxdnDGZAQXSk7bHFj
	P9mYtMptDw5cbaUucMS0xN+4twdkf5jATmeG+TEGTaQiDipPmP4RmBUoVkMTQpZA05onpWVD5et
	E6VzA==
X-Google-Smtp-Source: AGHT+IHt5OMfq3RnvcklD+ff+bOSHuLwNzni+Ry6n9qQYdWO5mBITPRPkPB5JSUgezT5cNBUF8jT6J1EG+4oUU+F/IM=
X-Received: by 2002:a05:6402:280d:b0:618:20c1:7e61 with SMTP id
 4fb4d7f45d1cf-62378833026mr13983611a12.27.1757495667975; Wed, 10 Sep 2025
 02:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240730091322.5741-1-linux.amoon@gmail.com> <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com> <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org> <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
 <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org> <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
 <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com> <4453695a-9f31-455b-b118-4084f0367cb3@kernel.org>
In-Reply-To: <4453695a-9f31-455b-b118-4084f0367cb3@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 10 Sep 2025 14:44:10 +0530
X-Gm-Features: AS18NWBdjpBUe9RFBFcPJVLD2d1QZEmgBiuDkbK1apG0d-9f9dyb4w2ne2YPcFc
Message-ID: <CANAwSgQZSGnoT9kyjVtZ=chgb_L+k4S+ynZoFjS3QPQsazJJdg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_021430_345480_1CD63D36 
X-CRM114-Status: GOOD (  37.75  )
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

Hi Krzysztof,

On Wed, 10 Sept 2025 at 12:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 09/09/2025 15:59, Anand Moon wrote:
> > Hi Krzysztof, Marek,
> >
> > On Tue, 30 Jul 2024 at 20:32, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Krzysztof,
> >>
> >> On Tue, 30 Jul 2024 at 18:53, Krzysztof Kozlowski <krzk@kernel.org> wr=
ote:
> >>>
> >>> On 30/07/2024 15:20, Anand Moon wrote:
> >>>> Hi Krzysztof,
> >>>>
> >>>> On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> =
wrote:
> >>>>>
> >>>>> On 30/07/2024 14:06, Anand Moon wrote:
> >>>>>> Hi Marek,
> >>>>>>
> >>>>>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsu=
ng.com> wrote:
> >>>>>>>
> >>>>>>>
> >>>>>>> On 30.07.2024 11:13, Anand Moon wrote:
> >>>>>>>> As per the Exynos 5422 user manual add missing cache information=
 to
> >>>>>>>> the Exynos542x SoC.
> >>>>>>>>
> >>>>>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
> >>>>>>>>       32 KB of L1 data cache available.
> >>>>>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
> >>>>>>>>       32 KB of L1 data cache available.
> >>>>>>>> - The little (A7) cluster has 512 KB of unified L2 cache availab=
le.
> >>>>>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
> >>>>>>>>
> >>>>>>>> Features:
> >>>>>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus wit=
h
> >>>>>>>>    L2 cache snooping capability. This hardware automatic L2 cach=
e
> >>>>>>>>    snooping removes the efforts of synchronizing the contents of=
 the
> >>>>>>>>    two L2 caches in core switching event.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>>>>>>
> >>>>>>>
> >>>>>>> The provided values are not correct. Please refer to commit 5f41f=
9198f29
> >>>>>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch betw=
een CPU
> >>>>>>> cores"), which adds workaround for different l1 icache line size =
between
> >>>>>>> big and little CPUs. This workaround gets enabled on all Exynos54=
2x/5800
> >>>>>>> boards.
> >>>>>>>
> >>>>>> Ok, I have just referred to the Exynos 5422 user manual for this p=
atch,
> >>>>>> This patch is just updating the cache size for CPU for big.litle a=
rchitecture..
> >>>>>>
> >>>>>
> >>>>> Let me get it right. Marek's comment was that you used wrong values=
.
> >>>>> Marek also provided rationale for this. Now your reply is that you
> >>>>> update cache size? Sorry, I fail how you address Marek's comment.
> >>>>>
> >>>>> Do not repeat what the patch is doing. We all can see it. Instead
> >>>>> respond to the comment with some sort of arguments.
> >>>>>
> >>>>
> >>>> Ok, If I am not wrong  icache_size is hard-coded in the above commit=
.
> >>>>
> >>>> +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
> >>>> +.globl icache_size
> >>>> +       .data
> >>>> +       .align  2
> >>>> +icache_size:
> >>>> +       .long   64
> >>>> +       .text
> >>>> +#endif
> >>>>
> >>>> In the check_cpu_icache_size function, we read the control reg
> >>>> and recalculate the icache_size.
> >>>> if there mismatch we re-apply the Icache_size,
> >>>>
> >>>> So dts passed values do not apply over here,
> >>>
> >>> So you provide incorrect values in terms of them being ignored? Then =
do
> >>> not provide at all.
> >>>
> >> I will drop the icache and dcache values and just pass the L2_a7 and
> >> L2_a15, value
> >> Is this ok for you?
> >>
> >> Earlier, I have tried to verify this information in /sys and /proc
> >> to verify the changes as ARM does not populate this information.
> >>
> > Here's an article that provides detailed insights into the cache featur=
e.
> > [0] http://jake.dothome.co.kr/cache4/
>
> Here is Korean Wikipedia article about Sugar glider:
> https://ko.wikipedia.org/wiki/%EC%9C%A0%EB%8C%80%ED%95%98%EB%8A%98%EB%8B%=
A4%EB%9E%8C%EC%A5%90
>
> I guess we are putting now random references in Korean to our emails.
>
That wasn=E2=80=99t my intention=E2=80=94I was simply trying to elaborate o=
n my thought process.
If the reference came across as random or unclear,
I=E2=80=99ll make sure to be more precise going forward. Thanks for pointin=
g it out.
>
> >
> > The values associated with L1 and L2 caches indicate their respective s=
izes,
> > as specified in the ARM Technical Reference Manual (TRM) below.
> >
> > Cortex-A15 L2 cache controller
> > [0] https://developer.arm.com/documentation/ddi0503/i/programmers-model=
/programmable-peripherals-and-interfaces/cortex-a15-l2-cache-controller
> >
> > Cortex-A7 L2 cache controller
> > [1] https://developer.arm.com/documentation/ddi0503/i/programmers-model=
/programmable-peripherals-and-interfaces/cortex-a7-l2-cache-controller
> >
> > These changes help define a fixed cache size, ensuring that active page=
s
> > are mapped correctly within the expected cache boundaries.
>
>
> As with many previous attempts, you do not understand comments and
> questions and you do not reply to them. This makes conversation pointless=
.
>
> To prove it:
>
> 1. No one asks for performance numbers.
> 2. You give performance numbers.
>
I realize my explanation might have been confusing.
What I meant is that my changes take a different approach,
but they=E2=80=99re safe and don=E2=80=99t break the current codebase.

Specifically, they do not break or interfere with the behavior
introduced in commit
5f41f9198f29 ("ARM: 8864/1: Add workaround for I-Cache line size
mismatch between CPU cores").
> I am dropping this patch because you did not address actual comments. I
> also do not plan to give thorough review to other of your patches,
> because you wasted a lot of my time in the past and this example here
> proves you keep wasting.
Thanks for the feedback. I understand your frustration,
and I regret that my response didn=E2=80=99t adequately address your commen=
ts.
I intended to clarify my understanding and contribute constructively,
not to waste anyone=E2=80=99s time.

I=E2=80=99ll take this as a cue to improve how I respond to reviews going f=
orward.
Appreciate the time you=E2=80=99ve spent engaging with my patches.
>
> Best regards,
> Krzysztof
Thanks
-Anand

