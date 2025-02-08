Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE95C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1YcpkTOPRywGB38WZqSFXRMZdWBJFK04OWzPaUWZ0U=; b=CDQvuJCZt8jy1h5ExtDFIQuXPr
	giX5TD4AW5wvRCMFig9hipaXqjnfvCbsS9x2uypfKLBXBNcC8pDUUMowD/k+LiMjRUJIJXTpFxqon
	+9DXWfmVm98lccuQmlA9kcRO/g5wlErO4iey5SAdLhCrx77k/DBwLqivG9BTh02PhXiaZ3itGEnLV
	wgnOpqV5ckRPBNI/VYyqJ6VpjpJp1MR+Wjkh5D7OjVBuNgWP3LqBH3iEsAB17p4P9OiqBKOM5lexU
	GfQBHXZ/IXRCxb6G+wPuMo+lyvk9u/RVX9WStsFD3eLuFi53lSQsiUUKAVlfMW3pczgaVMzmDowEu
	bPo13Kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaCF-0000000Brxh-2lEO;
	Sat, 08 Feb 2025 02:03:51 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga6s-0000000Bqxi-18Hg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 01:58:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso939584f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 17:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738979896; x=1739584696; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1YcpkTOPRywGB38WZqSFXRMZdWBJFK04OWzPaUWZ0U=;
        b=Rzaxgsn7ArLRJX7NgFzyXVBv6i5sqB/8yiPfmsteFSZ7KjZuuW5jeeuxM0NJAgqwSB
         xOOk8CVz82qpPq2WftFJnwQvQiUL9S1Ioo9wLes5VOahFnx2LOaGc+alnKQvPnMpm8/F
         TUztREnfRWg7v+wrGWqQY99C7DFBfm86YMLGKRy0NyMqEMU+DqAx8qbGgqPSIFxnOCda
         hrfnnK72N76zkH82HAMhTUWoyEE9A7xYdgGYKF/d4iI77/xhpQ/5VNPY1C1Z4y3qm54+
         zAgUBubpbUhGddQ70i/qt6R4ZuAuO6LZrMbtHaAX5OQ1cMKmjvDJ6KJ5OkylwVi0GeNx
         Cm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738979896; x=1739584696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1YcpkTOPRywGB38WZqSFXRMZdWBJFK04OWzPaUWZ0U=;
        b=PqTHQAY0hIWKIwsbTZTlTgTLxhHHME9bUPEiWDC20qP10ufMknDAsfctu2DavyuCmg
         xFyYNBmRxdSKFBEKtqG0Q2EBdINK9ski3Js+hEwRwP8T7WNdgAmyj87Z1o/CVh1aB0Zi
         zQYkedOT8FesGjQ4+ENTovKFEv/0Axzyiw9xzjnDw2QOpExCK3Ay1lEdHyvO5o7eE0je
         WMYETWxCSVNy89ynv3k5hzOVf5VWODGh3QWGKw5kBInpSxYWpSYr917G1juGBTRLm5lN
         PdUkcHPvvQRai1jCxzLvpmIZUz1p5Rlp3JncSwR/8GW/626F9v1ufpepWmalcLRL+eZN
         k17w==
X-Forwarded-Encrypted: i=1; AJvYcCVdcnHFAWnXrsOp7VsUolliurQEoqN2s3e9cDO72PzXl8J4N5zkG93Ywg7Cb6IC5yxLdurHLj+wO5Rol6MojafV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4p1adFnZqAxXlBSFjlwRPOQ3UL64o7x1+cetl4jiKg2zUG359
	MIN+hyA/212Ob8lIlFnaB2FDuSR0EHt5rWCT5xCO/7FD1t0i5UX5srDmpMDuQskrHWBLbdBD6lz
	ttgMgGEWl8rPdrpFriRiUKOSF+qg=
X-Gm-Gg: ASbGnctmI3GJznDqAKjvH5SWlpFzY94xFxhkAKdOcuH8vtN8ieGqK6KcrppJKvqOQ1K
	DkMI8+h2ZtbnEfT0l8jRg4VYX4tsBGfIlBCp2BaG02YhTwELTrEI8a+GJ9Lt2+T2BSl3CK/MiFy
	3cIrd4QOo81oYBTGuzav+c9v6zq7qc
X-Google-Smtp-Source: AGHT+IHpQgX94A0FosDyS+sPj+7+y0MjVyp5Vl8pFYoOt0ryrG7ep2EbT2QWb1VNe2LbKYkHGL+NGYYFucNAFeoNlL0=
X-Received: by 2002:a05:6000:1889:b0:38b:f4e6:21aa with SMTP id
 ffacd0b85a97d-38dc99095a5mr3468207f8f.5.1738979896380; Fri, 07 Feb 2025
 17:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-18-memxor@gmail.com>
In-Reply-To: <20250206105435.2159977-18-memxor@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 7 Feb 2025 17:58:05 -0800
X-Gm-Features: AWEUYZnChx1s7fxsHJqTe9Us5tAvAetd4ErFLCNbt2tgL6nIpdAsrcoarJ_P1Lw
Message-ID: <CAADnVQJFRgidWdA72Op762HXg9y1s4CJQB_5rmB9iqCNzGEuWg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 17/26] rqspinlock: Hardcode cond_acquire loops
 to asm-generic implementation
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
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
X-CRM114-CacheID: sfid-20250207_175818_320313_A0D194C8 
X-CRM114-Status: GOOD (  23.58  )
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

On Thu, Feb 6, 2025 at 2:55=E2=80=AFAM Kumar Kartikeya Dwivedi <memxor@gmai=
l.com> wrote:
>
> Currently, for rqspinlock usage, the implementation of
> smp_cond_load_acquire (and thus, atomic_cond_read_acquire) are
> susceptible to stalls on arm64, because they do not guarantee that the
> conditional expression will be repeatedly invoked if the address being
> loaded from is not written to by other CPUs. When support for
> event-streams is absent (which unblocks stuck WFE-based loops every
> ~100us), we may end up being stuck forever.
>
> This causes a problem for us, as we need to repeatedly invoke the
> RES_CHECK_TIMEOUT in the spin loop to break out when the timeout
> expires.
>
> Hardcode the implementation to the asm-generic version in rqspinlock.c
> until support for smp_cond_load_acquire_timewait [0] lands upstream.
>
>   [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.arora=
@oracle.com
>
> Cc: Ankur Arora <ankur.a.arora@oracle.com>
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---
>  kernel/locking/rqspinlock.c | 41 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/locking/rqspinlock.c b/kernel/locking/rqspinlock.c
> index 49b4f3c75a3e..b4cceeecf29c 100644
> --- a/kernel/locking/rqspinlock.c
> +++ b/kernel/locking/rqspinlock.c
> @@ -325,6 +325,41 @@ int __lockfunc resilient_tas_spin_lock(rqspinlock_t =
*lock, u64 timeout)
>   */
>  static DEFINE_PER_CPU_ALIGNED(struct qnode, qnodes[_Q_MAX_NODES]);
>
> +/*
> + * Hardcode smp_cond_load_acquire and atomic_cond_read_acquire implement=
ations
> + * to the asm-generic implementation. In rqspinlock code, our conditiona=
l
> + * expression involves checking the value _and_ additionally a timeout. =
However,
> + * on arm64, the WFE-based implementation may never spin again if no sto=
res
> + * occur to the locked byte in the lock word. As such, we may be stuck f=
orever
> + * if event-stream based unblocking is not available on the platform for=
 WFE
> + * spin loops (arch_timer_evtstrm_available).
> + *
> + * Once support for smp_cond_load_acquire_timewait [0] lands, we can dro=
p this
> + * workaround.
> + *
> + * [0]: https://lore.kernel.org/lkml/20250203214911.898276-1-ankur.a.aro=
ra@oracle.com
> + */

It's fine as a workaround for now to avoid being blocked
on Ankur's set (which will go via different tree too),
but in v3 pls add an extra patch that demonstrates the final result
with WFE stuff working as designed without amortizing
in RES_CHECK_TIMEOUT() macro.
Guessing RES_CHECK_TIMEOUT will have some ifdef to handle that case?

