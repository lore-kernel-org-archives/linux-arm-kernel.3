Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40909CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=; b=2iZPdTbsZ+AlEIoRvvcf7b93I1
	+USZNYuN1gft9VDulpaRNJ5h0l4RQ1/ncsh39cIhC2Bp9O/sVgvVzXvpBZcvlVTUhq065heMtbrGf
	co7yZyVwpO4z917Nkf0Y7cb5J9GF92PP7gCCiZGJ+DT0VIj8AlFTqXeUPvhzY6LzmFBn9cBJERcdJ
	RJMW4kDsJv+sM8qpuT3PzPXHyy6I1+dwD0eYmXNDaR7eBqYuKh1p54/hyzuxtxHmc7nSi+VVAv8Mx
	MTWBe/tUoMCz7EsoJ7OgJ1oKPI7bEtfaq/pwhSTZJS8Y666IgZcdTtPmYAHtjz8eioyxFT+uuslxD
	/BLlgjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmmR-0000000GLXN-0Tdn;
	Tue, 28 Oct 2025 16:42:43 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmmN-0000000GLWR-0m9i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:42:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-292fd52d527so63262555ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 09:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761669758; x=1762274558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
        b=ojzBdOl5+LTWiAAcX8/+g3k59k4hlJk9yQbWCGps7ARqPI/G1vL7khrnX02zvbGUP9
         q9FrwG9gIssU8rzkviTAi52kL7TJeIaBQLjc076zFfo9XJmJmykkuIrC9KAcc6ntqe7B
         qGzL8/sUoIWK06Ot4lFU8p3AKdHroYfBeVoPSGWKlFQiFHr03+qpmSJ0V4nU4DafeC9x
         cFGkcgrrfPVvxeCkLKDDA3WPgQykg6AVwh2QhOb13Eh8UXLcT85yUTidw2SnK/a+MESv
         QxBccmeWnA0HD5aWLxS/h/M+xiq6lxl7RZwMU2rlFtHZXWXXl045weclV+bVdntR/E/N
         0gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669758; x=1762274558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/gmStdv3FU0oGBzCptCijx3MdjTDsamveWiRrc2ft4=;
        b=qhnCSJMdkp1z5SlqL7NVw9YRhkyG5gwOpC4ouQ+M3vIOhh7dO3vkug/4vYTmIaS583
         rbGj0X+JfRBgqppAhBs+VJ94mYN2fbEtq16UA0QoziZ2sEswpMXx+6LT5Gn1f37cLyVq
         aPH49lftOTFcT6Z/oNRVjyiYBucABgqHkgbpX18oZkMWexH+A5SmqRszwRSfzI5ka+Sz
         IG5miTE08JfYcNx2Xc7NSHK0mpHLUQXbRPc8Cd974g09WYl+SNe1xb4uQhyhSjQ2EgNV
         fNoOiwUx0KxNsJ9lTFCYohPU1UHYA0nu6VVwiCJr25STRa8u9bO8Wf0Eg+/PyX7VuhO4
         D3pw==
X-Forwarded-Encrypted: i=1; AJvYcCUQqmOL1PufDeu0V5kcawUsr5o4wdDwCmYIybxZWp7I70zFOYThH61Rwoy1zQAgo7BrBjyW3CAN+Rw1nKI1CYj9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzth3C7hGNcosmXOx90GgWOh/Y9quVSCJw3PBdkqoYUqf56L9k2
	zbvyNZpdoki6/KxOF5+kl1yJ2gMNuDg8d2MhO+0pHo6GxixikqZ1DpM75sTeWpWimq5b+N8d9TY
	jY1cCtB7ZqPOo2ZYVb59QEL52TnSHtS2z7e+9I6EDjR980HwLZlCyHfnSxmc=
X-Gm-Gg: ASbGncuWogRDtnsYxU933sr/nDa1EgVX3gtUex7fhBgesvoheL3dRylkZ+tECpjklMy
	+PLZnYmcwdybVK/TuY7VD1m2l6iKE/VynMEi/F9zVEFNovGh9NzLgFdYSAZucvE+OSAFQmXVtKW
	pYPdbrxsSoDPc6+vyVMMj80rOXubWI7jxSLumJGeHlISJXjGh1cscbFKV6Q9FmLUgwlnMu9z2OZ
	Ps+YLjsWi3pdlaeCilSc5TaQb59yQrL3L4ul2SNtEbEQUkM3mM9U7QxdU8temQ098kClMNO0M24
	KhVwNKSzmth5H/QIkBmJblWjCA==
X-Google-Smtp-Source: AGHT+IEA9HqIHKBrDRAdapOaEhdj5ptHdSYRpb4qWqp0AQjJ5Y7jaBBFwbe3KRRyVBlj5jpvCvwUbXxGS+XHLaIF4JY=
X-Received: by 2002:a17:902:d484:b0:290:c0ed:de3a with SMTP id
 d9443c01a7336-294cb522c8bmr51946525ad.30.1761669757359; Tue, 28 Oct 2025
 09:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <ea7552f1-842c-4bb8-b19e-0410bf18c305@intel.com>
 <20251028053330.2391078-1-kuniyu@google.com> <20251028095407.2bb53f85@pumpkin>
In-Reply-To: <20251028095407.2bb53f85@pumpkin>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 28 Oct 2025 09:42:25 -0700
X-Gm-Features: AWmQ_bmNBvZgs1Mp1FllgTi4GNPibwKiayJAa04sxsmAaaKLfS_gUEVbDU0m9lw
Message-ID: <CAAVpQUARk-XeMdTeGy_s65sdwuLY2RzocGyJ=2_WkhsrFN-bUw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
To: David Laight <david.laight.linux@gmail.com>
Cc: dave.hansen@intel.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	axboe@kernel.dk, bp@alien8.de, brauner@kernel.org, catalin.marinas@arm.com, 
	christophe.leroy@csgroup.eu, dave.hansen@linux.intel.com, edumazet@google.com, 
	hpa@zytor.com, kuni1840@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org, 
	tglx@linutronix.de, torvalds@linux-foundation.org, will@kernel.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_094239_226285_2E439FEE 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, Oct 28, 2025 at 2:54=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 28 Oct 2025 05:32:13 +0000
> Kuniyuki Iwashima <kuniyu@google.com> wrote:
>
> ....
> > I rebased on 19ab0a22efbd and tested 4 versions on
> > AMD EPYC 7B12 machine:
>
> That is zen5 which I believe has much faster clac/stac than anything else=
.
> (It might also have a faster lfence - not sure.)

This is the Zen 2 platform, so probably the stac/clac cost will be
more expensive than you expect on Zen 5.

>
> Getting a 3% change for that diff also seems unlikely.
> Even if you halved the execution time of that code the system would have
> to be spending 6% of the time in that loop.
> Even your original post only shows 1% in ep_try_send_events().

We saw a similar improvement on the same platform by
1fb0e471611d ("net: remove one stac/clac pair from
move_addr_to_user()").


>
> An 'interesting' test is to replicate the code you are optimising
> to see how much slower it goes - you can't gain more than the slowdown.
>
> What is more likely is that breathing on the code changes the cache
> line layout and that causes a larger performance change.
>
> A better test for epoll_put_event would be to create 1000 fd (pipes or ev=
ents).
> Then time calls epoll_wait() that return lots of events.
>
>         David

