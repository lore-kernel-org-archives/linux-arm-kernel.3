Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01979CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYP2onSUJNHhGvq3oMvWn0G6NURkvkxAY3WWJ1PkhtM=; b=hwSbx+7tnrMqNm5Mt34a6p76QK
	UIGl5ff8T2LQKWhbZ7cAy67sO++va1ODdvGvvz021z9fmpUW4WSMQm0p4ftJigHC3jvbuO4mrFTQA
	2OnCUMB1XIA3AtiqZE/bWt5EM+LNrCxCESx4YzgDI52bz5LFw7+URDE6BDu/8rnBLzxLmK1xgGKjx
	80ONOSgb+pMKK9XvNupWPUBQC8AbpBxmqR5DO3xWsn+18KMT6Fd2GhfxuaXsvG4Gf5WbUsdJHqCPo
	fO9iQu36USlwkkiyc582UozbaMk74qKm051/c3ckiQr0jnYPH/iYup8L6guLc+OKOm88pG2Lv6tr0
	T5fRDnhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYoy-00000002ELs-1LtN;
	Tue, 02 Sep 2025 21:45:44 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utV2z-00000001FLU-1C35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 17:43:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3dad6252eacso411851f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 10:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756835036; x=1757439836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYP2onSUJNHhGvq3oMvWn0G6NURkvkxAY3WWJ1PkhtM=;
        b=G0e7mtKvH9fmsp15RXQtek3g6jAW2brllJkICAcOnPx+238OXWyEa2ZXdlJvyaHFFT
         I93CC6Hpw7oqDD4qtIaQFU+YAXzvceIC0jkaoXHGCXLHz7RZ9bQP0syl7pooNdLR/cax
         c554cjuSwreOh/7oYwjnHlzFoz2gP1dJI1qumt+Q+CtlTGY+VwlcxinrBlFmL1lMkWn0
         8hijfeU6po4ilYyuq9jCKv8dStT+tMRqBN5YLXNkqSEarKzel7BIrPsxHdhjXy34SLXm
         /cpz5/T7t64IdTjyAzZt7mtrHAsBAsgdOOKDMMrzKl87iuoLQ45f9/1vkiKDNQkDIVgD
         n46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756835036; x=1757439836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYP2onSUJNHhGvq3oMvWn0G6NURkvkxAY3WWJ1PkhtM=;
        b=hAn974fT2h22K+rpUKcmzATxTV4dAuegYG0ajyk1uUUBiL+MZ36op88wTTNf+7kFtA
         0Axb9/1isWQWZQQ+j0HGCG8N5SGCQJL3/BJ0VgVY5hiHjPOnMvCUD82r8uGjS8KTfUgr
         fjp2uoAUZg73ZOeCjFDY4Pgiw9x9p17pqaB7gZ//qveM+/iuBy9yWG6Ht9WvU2bXt/g6
         pfOH+6lkmmNQMMGcO0uMP50tqlJi/WrdhAN/qLFCN3TKzCuKud/FSjeYQPISSk4aZg6L
         XTg3sWZ3VrEeDpE8BoP4uTk8xo46Broq1T3nYwFnUElK4Z4zrxtVOFCRPopMhkWuKnHm
         YsbA==
X-Forwarded-Encrypted: i=1; AJvYcCWiJ4sqdSTuc821zO1HzNS7DL/ItKwBmnrtuplcgi2WBUZF7pOjkvnJQkhRC/+6PEtfxk3xtXXR5gw2J4CeAsQp@lists.infradead.org
X-Gm-Message-State: AOJu0YwNFTo1JYOJ2V0LdRj2BHLpMirVVtZtSmhDNtGO3LboKxaA7giU
	Y732/dL5zGeNh3YcZTm08kmHZXUMlRWK34Rmnrmzz3Wz3YjHNS0nNxFydN79SimChfpBaofhGc/
	XS8Be+YJxTs85SIu3ax0vTpG4T5NbqVY=
X-Gm-Gg: ASbGncv8OOQtZ3vFrJPTL1kfg2sMPuvnYpJmWN6qfP6UCyvnW9F9bZZH7zfR6hBnCeM
	ITrN0d6rH1igx07RJ/SFXYwbC9DP82NEHbnE6qEKH74lAEKamdvFTqYzW8Ayu/hbDjuXuu9weQD
	0hbDHCifhYoUkMGNjn9bVgZh9Mq320z0xC6NdGSD5KrzkNCMUMjifkbKjzD85F59gw+gXKLqmQB
	47+92K/yEwT68nqQj5ewNkEmJSaPKx5eg==
X-Google-Smtp-Source: AGHT+IGnbXb7pZEEKjDl3Xb/VVDaXmOkLzTurvRIsV32P0sxrEfn6u8c4/IIuiIksHosRpAojQeaElZ2NxTEaXB5bnc=
X-Received: by 2002:a05:6000:22c4:b0:3ce:5408:3e9b with SMTP id
 ffacd0b85a97d-3d1de4bc312mr10005305f8f.32.1756835035509; Tue, 02 Sep 2025
 10:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250829080735.3598416-1-ankur.a.arora@oracle.com>
 <20250829080735.3598416-6-ankur.a.arora@oracle.com> <aLWDcJiZWD7g8-4S@arm.com>
In-Reply-To: <aLWDcJiZWD7g8-4S@arm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 2 Sep 2025 10:43:41 -0700
X-Gm-Features: Ac12FXxPt48d0DrkO5T5_o7KXQLuNvB-VRFsY3mAwjR3V9x2L6YyOpjWOTrBYoQ
Message-ID: <CAADnVQJf317mXSDLs=K0pzTDGqMA8vqSDoNm5=LvEst6kdAi6w@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] rqspinlock: use smp_cond_load_acquire_timewait()
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, bpf <bpf@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, harisokn@amazon.com, 
	cl@gentwo.org, Alexei Starovoitov <ast@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	zhenglifeng1@huawei.com, xueshuai@linux.alibaba.com, 
	joao.m.martins@oracle.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	konrad.wilk@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_104357_328082_0494D09A 
X-CRM114-Status: GOOD (  26.67  )
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

On Mon, Sep 1, 2025 at 4:28=E2=80=AFAM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> On Fri, Aug 29, 2025 at 01:07:35AM -0700, Ankur Arora wrote:
> > diff --git a/arch/arm64/include/asm/rqspinlock.h b/arch/arm64/include/a=
sm/rqspinlock.h
> > index a385603436e9..ce8feadeb9a9 100644
> > --- a/arch/arm64/include/asm/rqspinlock.h
> > +++ b/arch/arm64/include/asm/rqspinlock.h
> > @@ -3,6 +3,9 @@
> >  #define _ASM_RQSPINLOCK_H
> >
> >  #include <asm/barrier.h>
> > +
> > +#define res_smp_cond_load_acquire_waiting() arch_timer_evtstrm_availab=
le()
>
> More on this below, I don't think we should define it.
>
> > diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> > index 5ab354d55d82..8de1395422e8 100644
> > --- a/kernel/bpf/rqspinlock.c
> > +++ b/kernel/bpf/rqspinlock.c
> > @@ -82,6 +82,7 @@ struct rqspinlock_timeout {
> >       u64 duration;
> >       u64 cur;
> >       u16 spin;
> > +     u8  wait;
> >  };
> >
> >  #define RES_TIMEOUT_VAL      2
> > @@ -241,26 +242,20 @@ static noinline int check_timeout(rqspinlock_t *l=
ock, u32 mask,
> >  }
> >
> >  /*
> > - * Do not amortize with spins when res_smp_cond_load_acquire is define=
d,
> > - * as the macro does internal amortization for us.
> > + * Only amortize with spins when we don't have a waiting implementatio=
n.
> >   */
> > -#ifndef res_smp_cond_load_acquire
> >  #define RES_CHECK_TIMEOUT(ts, ret, mask)                              =
\
> >       ({                                                            \
> > -             if (!(ts).spin++)                                     \
> > +             if ((ts).wait || !(ts).spin++)                \
> >                       (ret) =3D check_timeout((lock), (mask), &(ts)); \
> >               (ret);                                                \
> >       })
> > -#else
> > -#define RES_CHECK_TIMEOUT(ts, ret, mask)                           \
> > -     ({ (ret) =3D check_timeout((lock), (mask), &(ts)); })
> > -#endif
>
> IIUC, RES_CHECK_TIMEOUT in the current res_smp_cond_load_acquire() usage
> doesn't amortise the spins, as the comment suggests, but rather the
> calls to check_timeout(). This is fine, it matches the behaviour of
> smp_cond_load_relaxed_timewait() you introduced in the first patch. The
> only difference is the number of spins - 200 (matching poll_idle) vs 64K
> above. Does 200 work for the above?
>
> >  /*
> >   * Initialize the 'spin' member.
> >   * Set spin member to 0 to trigger AA/ABBA checks immediately.
> >   */
> > -#define RES_INIT_TIMEOUT(ts) ({ (ts).spin =3D 0; })
> > +#define RES_INIT_TIMEOUT(ts) ({ (ts).spin =3D 0; (ts).wait =3D res_smp=
_cond_load_acquire_waiting(); })
>
> First of all, I don't really like the smp_cond_load_acquire_waiting(),
> that's an implementation detail of smp_cond_load_*_timewait() that
> shouldn't leak outside. But more importantly, RES_CHECK_TIMEOUT() is
> also used outside the smp_cond_load_acquire_timewait() condition. The
> (ts).wait check only makes sense when used together with the WFE
> waiting.

+1 to the above.

Penalizing all other architectures with pointless runtime check:

> -             if (!(ts).spin++)                                     \
> +             if ((ts).wait || !(ts).spin++)                \

is not acceptable.

