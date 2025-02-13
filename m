Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D239C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZREzq3IEp4MhIgLpCQw0VzNgzIUCNp3BPGLpVe9IMHg=; b=jeq52C9yXITAcgxJR4gIKp4nD4
	FgMJJ5lNVSasZ4OSOH6p58Jectt86qC1wZDYa7upxa8wddHx8AiOjw9bvYvHHQJ+GZ/0yBFZfNSgW
	356pIsp0W7qguznpuQGQiH67R6E27WTmYhGuE79B6RFz4MLC701Y62lyhr59mJa2+jL/2ouGOpsTw
	e1hVObeE8ED5MtPtcaJW+liBUElkAuuI0TF53iPu/x+T2+zfhWf2JlfRjFToXyDfFECnw57UimSlN
	cPzH7FvVd+dabpeuYPsFePekJvhK2ryMNsrKD75lWwUiFr/xn2vzwTY3w/tnuyxS6a6ZeEoV7ndaY
	wVnB4XAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiShP-00000009wRU-0M1q;
	Thu, 13 Feb 2025 06:27:47 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSfy-00000009wAb-3mEn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:26:20 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-aaeec07b705so70854066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739427977; x=1740032777; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZREzq3IEp4MhIgLpCQw0VzNgzIUCNp3BPGLpVe9IMHg=;
        b=QZ7PZJDFZ6o6OTCGiXjv6qNBF6hJhCVYVF8G8HlXbfKvgXIglCX2NxZQ4sS/nCtq3B
         sf0bmQ1FyyyhSfol26zz+3oXHQVd3GsgDRfkRPjRq36l2orLx2+5vbL6AQfcTW4D+hKp
         QnAU6zPJOJT/Z2mt3Fbn7OMafEUQVjpHt73rpyVMUo61ZBwuqQUki4WBWR+BrcAexVjJ
         R6tC35oj4Kz+CAULG4KhvJX16JeLeLyu8/hQleeN/sZbor1Y1R7ZURTTr9/h//4tO3Zv
         h4IarfAMJSKKoMW15r39CnNBnPudnpco2lhhlVKRhR6QtkoEkoz6QP3ECnHCp3rDRdKw
         fesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739427977; x=1740032777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZREzq3IEp4MhIgLpCQw0VzNgzIUCNp3BPGLpVe9IMHg=;
        b=tgcGhNr62l0atFfpJyv15sgq4frWEXHBkyQhCIIyc80kr237A7XYaIsi7Ke9IdIlrp
         6LpVacK148IIFxmp53LXa97KAVzxvWzXBmjnbLvUj3FalC4f2K6N3Ks6fKqGNhrkMpPA
         n6yCyPRfz/f28cDT1g72cZIXLDx7MIiUFXLlI4snt5bYlnkKyC1gC/zef4+rOz+Utq6b
         2BSnOtv6NnGDfEkKkfGD81TXwjAxrqQPkkdhV9tpPv14OBrPOWfK08G6v4si0/oBKr+A
         o1+oEnAnt3ioCH80DyvHdSHGXuqNEEYJoiG3eDfsAb7AhOKhOGVwUqHVDoDqdlh3y1H0
         LPow==
X-Forwarded-Encrypted: i=1; AJvYcCWOhnP25HqoY6cl+5+zsTZz7MIpLKPnsI9sMpj1oRTsVckgt+TdLbLPXfFH6Jh0cq5IVWUgW8us/L0vSXMwQ/Bs@lists.infradead.org
X-Gm-Message-State: AOJu0YwajwEh/aMHa+17XV1QBogCJcTbolwxX3pcV+0xPTg2BXqnq4kN
	FXaz3pnKNJObx4XtGNSy0QwjiXUncg+DT9MB0t5FnuDRMzbmhQiuYwRyB1WUDD//ewfDIGCKQCa
	u0tWvFTTPzzSa1NImnzqR5/S5+yA=
X-Gm-Gg: ASbGncv/2u4XGqqiIzGUpmfSFtw/9o2ApLY2LR/I/oW6KP/5ZiwBwfYksjain8F27HG
	idmHZZxTWdyrkU797G54XQlmdeeb82w/0jTqYmwBuj1OjRkV07axk/n5blKl5bzEEKIrX4oSSJg
	==
X-Google-Smtp-Source: AGHT+IHeb1K3PBZ3graH5b9Lm2ijGQ2AdV5iQKZp155aI3Aj4n2GlguI8ATXIyzS2yYccB1m7DwfPzkJTax0FB3l/cw=
X-Received: by 2002:a17:907:97c8:b0:ab7:e943:4c1 with SMTP id
 a640c23a62f3a-ab7f3370d9cmr601262766b.11.1739427977003; Wed, 12 Feb 2025
 22:26:17 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-27-memxor@gmail.com>
 <40cb834c2e034dc991a6b0c8140608dcd2e9e5fb.camel@gmail.com>
In-Reply-To: <40cb834c2e034dc991a6b0c8140608dcd2e9e5fb.camel@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 13 Feb 2025 07:25:40 +0100
X-Gm-Features: AWEUYZnLf59qz2tS1fvIHgj3GabrMeOcjDCQIlhr1La0qsWXI2o04402F4THTm8
Message-ID: <CAP01T75UgmzoB=AiOzFz0jyrTAQ6F=r6rVPjjjhfX=Be9nc1uQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 26/26] selftests/bpf: Add tests for rqspinlock
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_222618_951400_715B7335 
X-CRM114-Status: GOOD (  12.74  )
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

On Wed, 12 Feb 2025 at 01:14, Eduard Zingerman <eddyz87@gmail.com> wrote:
>
> On Thu, 2025-02-06 at 02:54 -0800, Kumar Kartikeya Dwivedi wrote:
>
> [...]
>
> > +void test_res_spin_lock(void)
> > +{
> > +     if (test__start_subtest("res_spin_lock_success"))
> > +             test_res_spin_lock_success();
> > +     if (test__start_subtest("res_spin_lock_failure"))
> > +             test_res_spin_lock_failure();
> > +}
>
> Such organization makes it impossible to select sub-tests from
> res_spin_lock_failure using ./test_progs -t.
> I suggest doing something like below:
>
>         @@ -6,7 +6,7 @@
>          #include "res_spin_lock.skel.h"
>          #include "res_spin_lock_fail.skel.h"
>
>         -static void test_res_spin_lock_failure(void)
>         +void test_res_spin_lock_failure(void)
>          {
>                 RUN_TESTS(res_spin_lock_fail);
>          }
>         @@ -30,7 +30,7 @@ static void *spin_lock_thread(void *arg)
>                 pthread_exit(arg);
>          }
>
>         -static void test_res_spin_lock_success(void)
>         +void test_res_spin_lock_success(void)
>          {
>                 LIBBPF_OPTS(bpf_test_run_opts, topts,
>                         .data_in = &pkt_v4,
>         @@ -89,11 +89,3 @@ static void test_res_spin_lock_success(void)
>                 res_spin_lock__destroy(skel);
>                 return;
>          }
>         -
>         -void test_res_spin_lock(void)
>         -{
>         -       if (test__start_subtest("res_spin_lock_success"))
>         -               test_res_spin_lock_success();
>         -       if (test__start_subtest("res_spin_lock_failure"))
>         -               test_res_spin_lock_failure();
>         -}
>

Ack, will fix.

> [...]
>

