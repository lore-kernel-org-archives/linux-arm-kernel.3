Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD893C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 03:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjC+K99sHuLBC1SWOWdiNm+irY8tDwRsTBF9CpEJdmk=; b=bxQCE6CAU3RAWUMRs3l4OaL0se
	LckCbChKMuYrsanHzIbPWloIboGRRiuQ1hCg2pctG5ti+ByxTw4Yn36Sx/hx04QNXFo++EHlBnfnZ
	tgwIf9l4fPh3SoztSbFSdAIMO1wdzfmuGHX0XpM0PBKxeVvIlgRNe/m4JpZSuvlJi9Is8y2H2WlLa
	HJCog/do6mRtrvpTmop1Vh1AIGKHZMGfTxuQ+XMgpYJN/nm8dkqTgI6bWzwZZcC/5KpUe+XkCzrRs
	ahLBMxil/6tIK1iTJ/TXo2EPyFy8/6JxJ78vIJ8BnAcJtlw+wJE7H5gpBxYxWpRYioJpWSLeiW+63
	rVUOETFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgbA8-0000000Byfr-1jAh;
	Sat, 08 Feb 2025 03:05:44 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgb8j-0000000ByUJ-2xLY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 03:04:19 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5de594e2555so872813a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 19:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738983853; x=1739588653; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yjC+K99sHuLBC1SWOWdiNm+irY8tDwRsTBF9CpEJdmk=;
        b=eNlugNXv3lkbI8VkFTJveaMgG2s2JlRmmmutc6fN5UgTwOWjxnJ9KFBO54wxE63iN2
         jOJU/YSyWT9wLSuBPvg6awzJitJs7xd8xbDbch0cu+CYJlokbxx36ImQ9KDO5RyNYiBg
         sNBO2m9Rp/EHCt0w+ZPGD2nqbyTNRuUtYe3xKKR+Z/lwkd3qwckUDBk2sGFnJF6/tn3p
         CmHKVssgAnAC3nOZMjzD5gEoO/UlWUgptzxOPN3tgYLcQBqHTEHwbc60U1IA7vEpV9T0
         3wbkz491IwEemjZXLuGhwe0uCHTMH6cNkXVxIGLR/Wcx9nJYcqILh2fBPoxQLAPI3FNZ
         OBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738983853; x=1739588653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjC+K99sHuLBC1SWOWdiNm+irY8tDwRsTBF9CpEJdmk=;
        b=YAW7s3UwkWI7UUKPb2XarcoyxBlB9BBkVOwTfPPQ0dEbXgB4JPCM/tq6wvhefStE0+
         E+Ef8ehSN7uJ2Modmrg0RS4ZlK/6IE4ZVO/WF1dBMeaRbPBamsB/+EwYS8KY21Reklfm
         GEZydrzzdiVr9dhfFa+dEzvVvN9ltLEdwRGc30y60Lp+WUPEKk0QeSGfXQh+qvpDqQj2
         CmGTWYPLfyD8hJ6C6NSoaTDPX93jeGd+LAq4haWJhSSX3gMkT+xi+K73pd+KPMPf7uEq
         9QUBLABB/50kx6nKE31qp4Of1bTpoLqnpPMzZAxxsNvzCXwqqT1+6umQk37DWI/felR+
         JtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUi26fFapC0h46zbzqP7GOrQQXQGTGjzQYAZNlBr/rfaiois1zFKJ/Z78St/kK6Gocdn7qoe7ki/YN3DWu/09M@lists.infradead.org
X-Gm-Message-State: AOJu0YxgbdpVSQQXzduWzzO4nUkAgKM4vNrLsLM9eTuR9N06rz3fokYQ
	E7NzeW0aBB0opV6TBemBTwRPyWHKLaKxAwGlPzgUjrQTBlgGI23nhxjWnxo+AIb7oHapcPXxw+r
	ACAgojcnWLF1ga6haKEDydRRXw5c7T7XA
X-Gm-Gg: ASbGncsKs+HZuz15O+EOqM7KNK3YBsx24/TdjxNHRT/8S4/XoG23MqL37F6+pyFri1v
	jFcFqRnmXF/d8fTh4D/uT+T/bk0yiOIzGwZC7N4t498rVPTztPtj9hrnYYxYx7LgNPIlF6MdULr
	Y=
X-Google-Smtp-Source: AGHT+IEpffqioYc8FzNyaf4qBzxtDg8xfAqMVbDjSBfvR4Oecfrwg3Vz7TAhEDmRxRydbVIiW+4rwwYQefd9K+hSBv4=
X-Received: by 2002:a05:6402:194b:b0:5dc:7fbe:730d with SMTP id
 4fb4d7f45d1cf-5de44fe9d71mr7386616a12.6.1738983853264; Fri, 07 Feb 2025
 19:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-12-memxor@gmail.com>
 <CAADnVQL=E3F5-Uwa5_508e+OKzLnLGJGtAMhv1WW8kHobzBMgQ@mail.gmail.com>
In-Reply-To: <CAADnVQL=E3F5-Uwa5_508e+OKzLnLGJGtAMhv1WW8kHobzBMgQ@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 8 Feb 2025 04:03:37 +0100
X-Gm-Features: AWEUYZmo5Th1l7iYtvIDvAaFSUXU6ssq4vkO0stPQeynM7x5qg3kIxSA0EMK9Fs
Message-ID: <CAP01T77XaGH=EDc=m2uL6gLWCM8jm5ycPgmZavXnThpDF6bY8g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 11/26] rqspinlock: Add deadlock detection and recovery
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, Barret Rhoden <brho@google.com>, 
	Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_190417_752354_D555DEE3 
X-CRM114-Status: GOOD (  24.86  )
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

On Sat, 8 Feb 2025 at 02:54, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Feb 6, 2025 at 2:54=E2=80=AFAM Kumar Kartikeya Dwivedi <memxor@gm=
ail.com> wrote:
> >
> > +/*
> > + * It is possible to run into misdetection scenarios of AA deadlocks o=
n the same
> > + * CPU, and missed ABBA deadlocks on remote CPUs when this function po=
ps entries
> > + * out of order (due to lock A, lock B, unlock A, unlock B) pattern. T=
he correct
> > + * logic to preserve right entries in the table would be to walk the a=
rray of
> > + * held locks and swap and clear out-of-order entries, but that's too
> > + * complicated and we don't have a compelling use case for out of orde=
r unlocking.
> > + *
> > + * Therefore, we simply don't support such cases and keep the logic si=
mple here.
> > + */
>
> The comment looks obsolete from the old version of this patch.
> Patch 25 is now enforces the fifo order in the verifier
> and code review will do the same for use of res_spin_lock()
> in bpf internals. So pls drop the comment or reword.
>

Ok.

> > +static __always_inline void release_held_lock_entry(void)
> > +{
> > +       struct rqspinlock_held *rqh =3D this_cpu_ptr(&rqspinlock_held_l=
ocks);
> > +
> > +       if (unlikely(rqh->cnt > RES_NR_HELD))
> > +               goto dec;
> > +       WRITE_ONCE(rqh->locks[rqh->cnt - 1], NULL);
> > +dec:
> > +       this_cpu_dec(rqspinlock_held_locks.cnt);
>
> ..
> > +        * We don't have a problem if the dec and WRITE_ONCE above get =
reordered
> > +        * with each other, we either notice an empty NULL entry on top=
 (if dec
> > +        * succeeds WRITE_ONCE), or a potentially stale entry which can=
not be
> > +        * observed (if dec precedes WRITE_ONCE).
> > +        */
> > +       smp_wmb();
>
> since smp_wmb() is needed to address ordering weakness vs try_cmpxchg_acq=
uire()
> would it make sense to move it before this_cpu_dec() to address
> the 2nd part of the harmless race as well?

So you mean, even if the dec gets ordered with inc, the other side is
bound to notice a NULL entry and not a stale entry, and we'll ensure
the NULL write is always visible before the dec.
Sounds like it should also work, I will think over it for a bit and
probably make this change (and perhaps likewise on the unlock side).

