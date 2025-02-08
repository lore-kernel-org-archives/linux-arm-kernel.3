Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5A6C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 03:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bXsoVb49IoYpLimFHVX1TtKxtLgXJzuvc+JHpYXHaWA=; b=zOvifWGmE2C+VLilVYqykavyiQ
	8QjakixtDR4/2Adf1rRCZsWjDIKUEgt0/gCpGblBqbQN/aJtOo15uzY83pjNq0Dsu3HbS+WWaKl8Z
	Q2MUgaf0qOYo7glciZqxYpyVY70VtUSHblG+oiUcUWoz+PqNaiXtBFbtOXx2AoYhH7x1LL1MHfZGd
	lmxshjU/GLovvm167vUM8Bcc++3QU8qJY+M3N3u9+gRZs1lAgsWTQP5vMsyLbJZnDIK+VAx2eurUW
	4ki9yJj1T3gPrDUf04aKHXEW5ibKeKvs9Y4C6uFQIZzXXWWxnGfH/EshxcRsgceFIDEv+USJqpts8
	zHsht8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgbBV-0000000Byu1-04TG;
	Sat, 08 Feb 2025 03:07:09 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgb9f-0000000Byb1-1X9W
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 03:05:16 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ab7917fc0c2so174359166b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 19:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738983914; x=1739588714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXsoVb49IoYpLimFHVX1TtKxtLgXJzuvc+JHpYXHaWA=;
        b=P9cO60Ay9VffZSMbA0xLS3lvTpAPNsJPKELL0Gg/BTpVUSOXAoRdL6Ah+j84CQYkkG
         Ipp0pqCMPEhurpVFEUr7tuenq6T6isrymq+6BnPOHRhGDruRNnS1UDhA9DS1Sh9CtP1c
         Dhg9JGkAEjXZxIPTAkmWTXDuSGtNr3q956O63Q9aMtb6ipPkWqVCqqaCBFpfGWodNGqJ
         WA5DMGS5hBBCGUQ+x/HmLn3xkAWeB0YWZfH3vGt+GVG/UAGkvkmJ6fNqRv57AiiZeyzW
         8T1jSnq9DB3/KBPzsPc7yZHMojqaEdNGQo7bCMM4qp0WGn1imshv7Loh3v8/WSujVY1c
         nY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738983914; x=1739588714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXsoVb49IoYpLimFHVX1TtKxtLgXJzuvc+JHpYXHaWA=;
        b=OGghBR1AFb1agrWFF/bGWWoXe0RxKlYdxVbFfzw+5S9kGuugZKhgmNbjT3j04iZn4h
         XBkunBf/W02l5d89VmUj2JFoOhJQ7XpcSWFsw7cR6beXCxLmgizhWYEKafe8LX9XPcKa
         5Py98P//r+GxJ04DeEAuWOZMYBW2CWumS2yuIcWI3QwCyc0PAD/IVX+FMG0hq1PXb02D
         yL/FeyrdFvp2Oe0BSjk/vAf+jqzdyOMClDR25pYwSrKiutNAL2irOkIqMACY5f93rKL1
         ZTCZ07l8k0MqjkY54PtbxUAyltYvdUikCn18gyv1GXv4MQabE/AX8tkncEL68VrWnBIH
         syqg==
X-Forwarded-Encrypted: i=1; AJvYcCVDSHH6rieNGgL2h1vWeg7GoeeKY6pxG0BN9RflN1d5aVZRwbhzHiN7mdLreqeGEwTOSeWctcb726ptb1Fw81fQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3c5sWyQVNMQgTf7xR6wv94GzuBIzqUvjWZRFMOTeRu39cDInm
	Zlg5hLQiPLyfClz9/mQre0N5aQgme45fBtmL7kGDbD8GFWawcLWrSNXOmCXkCiMMrOsUmit+dq+
	b4NRWQZduXL326mE7O5YQg2347ro=
X-Gm-Gg: ASbGnctkpyoQNFypWCBAxYXd2uIKSADVAyRB8+bmcbGxh5gs2ugii2wEaFhwWz60xEn
	1eYh3PhZHPaiq7J8aQkDqfc9o+8n4g1WbKz5wKDQFFNFuottZQpIe7IGncpChu0DIHIRpFzhzNf
	8=
X-Google-Smtp-Source: AGHT+IH8ynq3kX2SXHDaNclM5UaiOBAlcWVm1t3XkbaGQlkH/s3K+JRKmKWgLtG+LKW2WuSR9LMpnrIQ5UKtss3Fd3c=
X-Received: by 2002:a17:907:c04:b0:aaf:74d6:6467 with SMTP id
 a640c23a62f3a-ab789cbe9d5mr626346266b.42.1738983913450; Fri, 07 Feb 2025
 19:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-18-memxor@gmail.com>
 <CAADnVQJFRgidWdA72Op762HXg9y1s4CJQB_5rmB9iqCNzGEuWg@mail.gmail.com>
In-Reply-To: <CAADnVQJFRgidWdA72Op762HXg9y1s4CJQB_5rmB9iqCNzGEuWg@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 8 Feb 2025 04:04:37 +0100
X-Gm-Features: AWEUYZnsIBx9dn-klfxb-EQ9WKLOzaRhZbxIO6uDw6vw94PBIsvzKyoWXDR1-io
Message-ID: <CAP01T76xXrr9OzJn82S36t++S8wjiaZS5RXEKJ5V7EpD1wqinA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 17/26] rqspinlock: Hardcode cond_acquire loops
 to asm-generic implementation
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ankur Arora <ankur.a.arora@oracle.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_190515_413615_01494A6A 
X-CRM114-Status: GOOD (  28.53  )
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

On Sat, 8 Feb 2025 at 02:58, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Feb 6, 2025 at 2:55=E2=80=AFAM Kumar Kartikeya Dwivedi <memxor@gm=
ail.com> wrote:
> >
> > Currently, for rqspinlock usage, the implementation of
> > smp_cond_load_acquire (and thus, atomic_cond_read_acquire) are
> > susceptible to stalls on arm64, because they do not guarantee that the
> > conditional expression will be repeatedly invoked if the address being
> > loaded from is not written to by other CPUs. When support for
> > event-streams is absent (which unblocks stuck WFE-based loops every
> > ~100us), we may end up being stuck forever.
> >
> > This causes a problem for us, as we need to repeatedly invoke the
> > RES_CHECK_TIMEOUT in the spin loop to break out when the timeout
> > expires.
> >
> > Hardcode the implementation to the asm-generic version in rqspinlock.c
> > until support for smp_cond_load_acquire_timewait [0] lands upstream.
> >
> >   [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.aro=
ra@oracle.com
> >
> > Cc: Ankur Arora <ankur.a.arora@oracle.com>
> > Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > ---
> >  kernel/locking/rqspinlock.c | 41 ++++++++++++++++++++++++++++++++++---
> >  1 file changed, 38 insertions(+), 3 deletions(-)
> >
> > diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
> > index 49b4f3c75a3e..b4cceeecf29c 100644
> > --- a/kernel/locking/rqspinlock.c
> > +++ b/kernel/locking/rqspinlock.c
> > @@ -325,6 +325,41 @@ int __lockfunc resilient_tas_spin_lock(rqspinlock_=
t *lock, u64 timeout)
> >   */
> >  static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
> >
> > +/*
> > + * Hardcode smp_cond_load_acquire and atomic_cond_read_acquire impleme=
ntations
> > + * to the asm-generic implementation. In rqspinlock code, our conditio=
nal
> > + * expression involves checking the value _and_ additionally a timeout=
. However,
> > + * on arm64, the WFE-based implementation may never spin again if no s=
tores
> > + * occur to the locked byte in the lock word. As such, we may be stuck=
 forever
> > + * if event-stream based unblocking is not available on the platform f=
or WFE
> > + * spin loops (arch_timer_evtstrm_available).
> > + *
> > + * Once support for smp_cond_load_acquire_timewait [0] lands, we can d=
rop this
> > + * workaround.
> > + *
> > + * [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.a=
rora@oracle.com
> > + */
>
> It's fine as a workaround for now to avoid being blocked
> on Ankur's set (which will go via different tree too),
> but in v3 pls add an extra patch that demonstrates the final result
> with WFE stuff working as designed without amortizing
> in RES_CHECK_TIMEOUT() macro.
> Guessing RES_CHECK_TIMEOUT will have some ifdef to handle that case?

Yes, or we can pass in the check_timeout expression directly. I'll
make the change in v3.

