Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA7BC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBox1Ru0/q1X9mfxYYqhzob8E2RrC/ujp4XTiHzvfE4=; b=TDiOit8QSkIIdm34W2dprLef1X
	gItN1yy8IzVT47GqmA+XCszd2ZKfDhCzu55wJfFPOm/1v2hmFhNPvztCSsVaNBZqFkUdoS+9fptE7
	4gENy/VLhYJ7g5oE47DU/ar9N8l6ofoP3/LWzH8Zy/t3kR8upntKwE+zV+d/bs9LUahfR5jrujQlp
	KbL64q6gtc1QWQnxxouHxIwMIoOSHcsxIuDqw2jaCrfFrzdr/06C7i8J3ymIQ868LUxE4fI8+o0Vi
	+m4Q6dVLshYyr38zcIlIDCU9L6sYrZKIHMmq0Ry4y5O50nbgZOFod41RzLA7hL65SlwKzVrmbleig
	fY7wchBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgbCq-0000000Bz46-2mIB;
	Sat, 08 Feb 2025 03:08:32 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgbBP-0000000Byqg-0RHK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 03:07:04 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-5de3c29e9b3so3203036a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 19:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738984022; x=1739588822; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBox1Ru0/q1X9mfxYYqhzob8E2RrC/ujp4XTiHzvfE4=;
        b=XXSPQBM7JAWHLLzC/JKiCgDsSCEgmStdXIF4OysKjgwUzFwl+hmXs/uSKDsuxAReIu
         Me1M/qI+XESxkLN31fLLn3hT3W+uz7vuxKi3AY3DY8yvLx30RYy6fkU6r3H4Uodnmr/v
         BGKfco6TzlLGjIgcMJydDa15PFFYILaxmBBVS2vTBYeKI6EK3jWGad62MoMYI6qszOvH
         Ye8UiYoUc3mfE+Kh9MW1TVQpJ40844c6fyGRThsFxIB/PY/BYCiHxqo7D3fFXT935vkT
         02sr5CVeofGFYnPbZNn2yFKaso91EBfvN7OSchbktS/9dpaBLsVvlSwIh39+MfDrUtdg
         6RoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738984022; x=1739588822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBox1Ru0/q1X9mfxYYqhzob8E2RrC/ujp4XTiHzvfE4=;
        b=fglU1hdPobWBcbdqgIHm5OQiSULK7gVSeEcqheXshDDlsFXSVRwU9XOKWpfvw4dzGM
         0yPZfVAVo+f7/xbZNMoTSJZYH1ZCz0bBv8S0N8Uv+pBnQSn1k9OppzbPQsIMErw6Gd4N
         oISbuCeWoHCp2ZN+7QJxdCCNWzrTe+gdETiQXEtfQ+zdFqwgF6l03yynGtmVW1sElITs
         zOFsceiHw83unZ6XIvW2/wDzl8bbB0YwmyrNd1Gp8Mh9KAhEHCeVBbuoaZsgf40RTCiD
         qonHhuJkXWGCetES44McIWxilRd71tQ0INSiAzW5fUFPNLuqOMrwn6GB0MTX4DmLaCuG
         ZXTw==
X-Forwarded-Encrypted: i=1; AJvYcCWmCQUVTdFQki8GzwFfOt0Zml7YjDkAaOAghKWEp2O5NWsF0DAZ/Icliw4bSLswf0Q/HMHTV7uJv/LcCkZ9yv72@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3qcVsb6yKbg9fVg1xy/NuWw5lr6VaRopTYbX/CDOsGCwuJkMz
	j+t8Sv5fxKTT7f6doW95y7Exq0Hjq3o/OleRzugDr0BuUpLYp8QM0GPqxXAQlpfAqc1c+PXaBi3
	trjv9YNbsq9Af/13aku6xKsACOKev3fe+uXA=
X-Gm-Gg: ASbGncvMFfkJzWbjDi3HZIDFOYJRh/+Qr8p1vKDd0Hnf7Wqx0ziGM7P2B+/RwYAoNv2
	9yXCwj93Q9SMeL10EVoW2N42nyCJx7PMAs5mYvj5+JpM9nTfXSy2qL94zlCa4/5eicmn6sMIiI0
	g=
X-Google-Smtp-Source: AGHT+IE/yaD2Q6lmC5n7VIivqrMKarHxR7halFuBWdgQHjxnRem/0Src24G3aPVG9tKLdsgtnMmFxGpaJdRV2csNbJw=
X-Received: by 2002:a05:6402:4606:b0:5dc:d443:2460 with SMTP id
 4fb4d7f45d1cf-5de4508d723mr6339553a12.25.1738984021499; Fri, 07 Feb 2025
 19:07:01 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-20-memxor@gmail.com>
 <CAADnVQLNovQYGy6_zGDi75vmNHfZ-hKz4G=gWF4Bis8b6iTYew@mail.gmail.com>
In-Reply-To: <CAADnVQLNovQYGy6_zGDi75vmNHfZ-hKz4G=gWF4Bis8b6iTYew@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Sat, 8 Feb 2025 04:06:24 +0100
X-Gm-Features: AWEUYZlxE5io8QCZeMIMt4H7zuhUJpJx7vxq6S4IL5pYrj3V1cbxu0WKSn3cq4M
Message-ID: <CAP01T75jGfMXRrqpff4y5B5wrGBQeiJtJpTu6BpSFMg+AV1jaw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 19/26] bpf: Convert hashtab.c to rqspinlock
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
X-CRM114-CacheID: sfid-20250207_190703_141057_12C2EC54 
X-CRM114-Status: GOOD (  16.67  )
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

On Sat, 8 Feb 2025 at 03:01, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Feb 6, 2025 at 2:55=E2=80=AFAM Kumar Kartikeya Dwivedi <memxor@gm=
ail.com> wrote:
> >
> > Convert hashtab.c from raw_spinlock to rqspinlock, and drop the hashed
> > per-cpu counter crud from the code base which is no longer necessary.
> >
> > Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > ---
> >  kernel/bpf/hashtab.c | 102 ++++++++++++++-----------------------------
> >  1 file changed, 32 insertions(+), 70 deletions(-)
> >
> > diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> > index 4a9eeb7aef85..9b394e147967 100644
> > --- a/kernel/bpf/hashtab.c
> > +++ b/kernel/bpf/hashtab.c
> > @@ -16,6 +16,7 @@
> >  #include "bpf_lru_list.h"
> >  #include "map_in_map.h"
> >  #include <linux/bpf_mem_alloc.h>
> > +#include <asm/rqspinlock.h>
> >
> >  #define HTAB_CREATE_FLAG_MASK                                         =
 \
> >         (BPF_F_NO_PREALLOC | BPF_F_NO_COMMON_LRU | BPF_F_NUMA_NODE |   =
 \
> > @@ -78,7 +79,7 @@
> >   */
> >  struct bucket {
> >         struct hlist_nulls_head head;
> > -       raw_spinlock_t raw_lock;
> > +       rqspinlock_t raw_lock;
>
> Pls add known syzbot reports as 'Closes:' to commit log.

Ack, I've found [0] and [1], I will dig for more, see which ones this
applies to and add them to the commit log.

  [0]: https://lore.kernel.org/bpf/CAPPBnEZpjGnsuA26Mf9kYibSaGLm=3DoF6=3D12=
L21X1GEQdqjLnzQ@mail.gmail.com/
  [1]: https://lore.kernel.org/bpf/CAADnVQJVJADKw0KC6GzhSOjA8DJFammARKwVh+T=
eNAD7U3h91A@mail.gmail.com/

