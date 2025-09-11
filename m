Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2EBCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr9tX7pp1WDhvourRe0B/uP9WABiFIXN6KF2E46kYr8=; b=RWwBZAVNcj5pwcKn+3Ev67/q1U
	6s/Fb3QWhNv0dqjUEQGhyb00xhGny6h8AylVc+j/KWUrIQhdhw7cJiWD+TeFzsXaUFJmaO0iH6H+Q
	oi7uPjG9pZaUU9yFcYQkp/F2D6AdqlOiDtMXmpZ+v+nCcWBhderFDwFeIYfa4/rE6rtJ1i/YMj8zZ
	PxNbiv7kNk4vD15scuoOzHZzy4XhFmFtfc8RcNVm0gfc3jBa7hz/YBoqneyAhmnpk9zcpjpDLnLG4
	sCog1UJP07Z2nVuM39H9S5lLSwrRTddoEDOOCrQGdn+U8A3KH+WW+UBw06DSRcfdKJpd+NhJKE+4S
	99I1cYcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmTp-00000004rmg-1SiP;
	Thu, 11 Sep 2025 18:57:13 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwmTm-00000004rk6-1g4i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:57:11 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-62ed3e929d1so808373a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757617028; x=1758221828; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pr9tX7pp1WDhvourRe0B/uP9WABiFIXN6KF2E46kYr8=;
        b=Ljl94TyxT6Pi36Ckx1+5o2vpme/L2p/AaH4BpfWn+HiAjDsVNoGtvHF/7uGP5FnRqT
         7ZIe5wns8u2E+L9dp9fFlcPmowz7i9vc9wR7deNRHwhL6fIH6uapWazUwWpJIX0BqPPW
         Wy1B5qG+aIoLeRPDw0+rm3McRaMFNTMvnYtnTyjQt1KmExiOP7VF3ASLIHl4QxZ8hwiX
         IPVUKIRnr5KY7R4zMxKMXfuiQBGN0nZbq2srhP2lMuRRdj7WttJ/WU6UAK7idum57KzG
         /VZus3MKyaxVv3VYAQVxvQ21SJ3rQhgTtDa6BNOUzG9Hkr1LrcfgO8AY9dHvjq07otsW
         mJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757617028; x=1758221828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr9tX7pp1WDhvourRe0B/uP9WABiFIXN6KF2E46kYr8=;
        b=mSvitVrKhEXXHjQLT5EHZ3pyVYUFKQi468NnHHwxBaaBfxCi8/i38MBLUm6eyUeGq1
         1Or9V5BeSevlHthP21IL7YYxOxM0uO3OrUMwlCYU/1U2VhH/tHbmOeRRY4W9ikKdhsec
         emfi32mwmFxi4N//bIehLq5hc5yuDSiYEAnxSlUgU4z1JNOpl/SjGu1sCXbkVIDNmyZM
         ueCypgT0LU+4sLYzPoNPfN6Q+FCL49hkkmwU0h+cfqZ9lPcOpvLueBSPx6SKDSSh5sTp
         2rXuio4jy7ZhHgB2ofV3s85tgyRqPVtJ57amEZwLk1jV6bvmLYzG9u3Q75yUJ+oJtD2u
         RBLA==
X-Forwarded-Encrypted: i=1; AJvYcCVggrthn7jnwcE/9Uw53ehK8Y5wvwJK0VNnhdevY2X3ZL+nMsOR8q2uAxqFEju+2Zlnwck47CLpnCsoHlx/QYyd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx07hLyS2Z5xWEXU6p9vd8mt+4CguEeqUrYFXCBacg0HcCVn6r7
	s2J8xbTJLJ1vuDbGNTmkL8fcXFRaHk0eScvLOWPa3JR7zNVFzZ0Z/i3uj/IPM4IepGPXIqr0l0O
	VZc0j9+W9GdnmdwnLEONpvyDpABjeqEouSet6
X-Gm-Gg: ASbGnctwwSfj7ohz9RWtI7+hgoiDQ5rmqwBtqDc7pxjcuwOBzUi5VEY4ebQy05YX1cl
	A1+DBNqb5+aXRc3TrI6jP781tf2RSeIdD7NVfcXL0ImHcd5Bs8NgMZIyBM2+ljv1ON7P20wgz/L
	RXiC1pQGmulYri7w296qapezwe5f65TmxqznJtlriXkWHhmJRWlDiCAuU+qsCcsGkCt5YkQOJpX
	26VgNv6INH0e2UMjVO5yqAcbRrDwxqPLudLtSIf/IYPBFfeC4Y=
X-Google-Smtp-Source: AGHT+IGKxDih6ERXHwgyq0yZdSI3KYy7AT+aqJ67B4OiUGV2Ac/JxHPP/UIhhWHfeURuCo8qEbRbLD4HPdE5MiweW1U=
X-Received: by 2002:a05:6402:40d5:b0:61d:2405:b47c with SMTP id
 4fb4d7f45d1cf-62ed864bcc9mr495434a12.37.1757617028259; Thu, 11 Sep 2025
 11:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250911034655.3916002-1-ankur.a.arora@oracle.com>
 <20250911034655.3916002-6-ankur.a.arora@oracle.com> <aMLdZyjYqFY1xxFD@arm.com>
In-Reply-To: <aMLdZyjYqFY1xxFD@arm.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 11 Sep 2025 20:56:31 +0200
X-Gm-Features: AS18NWD_vDg9CGLpqBo3-WZ0dCqpbP__-WdZRDuhupRZ7xI3H77I9oF8KLziKGM
Message-ID: <CAP01T778qzHqNYanGtQ_UB9av9BtxLYdf2xWnJWtsf=-w=gANA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] rqspinlock: Use smp_cond_load_acquire_timeout()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org, peterz@infradead.org, 
	akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
	cl@gentwo.org, ast@kernel.org, zhenglifeng1@huawei.com, 
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_115710_446559_41C8C8FF 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, 11 Sept 2025 at 16:32, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Wed, Sep 10, 2025 at 08:46:55PM -0700, Ankur Arora wrote:
> > Switch out the conditional load inerfaces used by rqspinlock
> > to smp_cond_read_acquire_timeout().
> > This interface handles the timeout check explicitly and does any
> > necessary amortization, so use check_timeout() directly.
>
> It's worth mentioning that the default smp_cond_load_acquire_timeout()
> implementation (without hardware support) only spins 200 times instead
> of 16K times in the rqspinlock code. That's probably fine but it would
> be good to have confirmation from Kumar or Alexei.
>
> > diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> > index 5ab354d55d82..4d2c12d131ae 100644
> > --- a/kernel/bpf/rqspinlock.c
> > +++ b/kernel/bpf/rqspinlock.c
> [...]
> > @@ -313,11 +307,8 @@ EXPORT_SYMBOL_GPL(resilient_tas_spin_lock);
> >   */
> >  static DEFINE_PER_CPU_ALIGNED(struct qnode, rqnodes[_Q_MAX_NODES]);
> >
> > -#ifndef res_smp_cond_load_acquire
> > -#define res_smp_cond_load_acquire(v, c) smp_cond_load_acquire(v, c)
> > -#endif
> > -
> > -#define res_atomic_cond_read_acquire(v, c) res_smp_cond_load_acquire(&(v)->counter, (c))
> > +#define res_atomic_cond_read_acquire_timeout(v, c, t)                \
> > +     smp_cond_load_acquire_timeout(&(v)->counter, (c), (t))
>
> BTW, we have atomic_cond_read_acquire() which accesses the 'counter' of
> an atomic_t. You might as well add an atomic_cond_read_acquire_timeout()
> in atomic.h than open-code the atomic_t internals here.
>

+1, and then drop res_atomic_cond_read_acquire_timeout from this file.

> Otherwise the patch looks fine to me, much simpler than the previous
> attempt.
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

