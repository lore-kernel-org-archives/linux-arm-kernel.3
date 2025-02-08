Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4427FC02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGIrEua9iQ8bHgGdDw3wNHVLDjJrs0blGd4Py+scUxE=; b=TA44z61JqX5MJkEIDNsIFMFLOc
	x3/Q3rf4rg+FOmW81OzlXM4+zKb2mSp66kHlhpZn0iHsN6DfLwzQ5Q6CTv1/lHBaDKswKa22MEFrU
	0vyYd2251QzIeV3H0H0RhPbmjOCZ/8rZcN+TJitQ7zrzuOCiL7dzLC5wz6SCRhumq8lB+Msi4FZhu
	SRMJFfKbo8k+p04wRGvKnCpJdC/kgE1cwJcTpBz95PbMpYwxzc6aM33TUHV6JmNAxBEQojFITRu90
	gikDMh5OGdu2/2fjFcxU4Xh7fjs6IAeqwfML9fxIca4Ss+cf6RIMXmfu71d6R91Rc1sEgNKKgbAE6
	7G1ThbnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaKP-0000000BszJ-30uP;
	Sat, 08 Feb 2025 02:12:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga9x-0000000BrNv-27bb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:01:31 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so251036f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738980088; x=1739584888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGIrEua9iQ8bHgGdDw3wNHVLDjJrs0blGd4Py+scUxE=;
        b=dcn7V+6qqnDGNB0NgSLd6z8KmXdgxlnnY77AbD1z48HhKpJCnJjabRSxt3/zl+wyBA
         MmWbMg9v8iVGHQqrBU4DDKj1ZZ095ihCQbsvJYAm/n3vd3QZoNUdrXoTq6OBgCtSSl44
         wr8l7Sdp2Jf+OLJmM3DpTZ/Gh6+my6kb+IFukWPS3Fa2xntD+K7RWL3PxhPRixfOk/Bt
         JjJEYxQrmZXKGmSeYGIjADWPAITdOd92lZGPWhYUHvm8ypD0bWhkXrfo5z9TCtwDCiim
         qS45KT2yu0HzNm9EBqch5lvccnWaXBfszfAtEFyFuMf8O9xkXumQAIUD0yx8sGDYAjdD
         11rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980088; x=1739584888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGIrEua9iQ8bHgGdDw3wNHVLDjJrs0blGd4Py+scUxE=;
        b=ouXWQSfk5IBUwQ70aHYmLL9qDmNo0bVj0rqOwWrVH5bP1nysHuOQ6+VguLxRAtuql+
         0ubWEQaCHl/xAYhVOYygst4HZ40YMsN8clVoJZEi/q5EULZd2sCynlvYnOcRAVkaj4Q9
         q4o+7WtQXcStBzOvrNFI/f6lKZ48u3TMv/bphz6mzRQpQZWL236RE8uq0J80XVt8MUsM
         cBCHu2NQZtTuMIe+TPA0VDExQuT/cXOQDWA8CL+ItMEXD+Knj0G9KyJZeIsVqDWV28HC
         PLCldNsGxxOYMVBBdj9NOuLnFq4Rd3U+CAKJW8qRBN8YsdNrEsbEZNPP3pvdao0oBLgp
         GM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8rUQRgtuyTKL39mLoKrG7ufxMub+WLd5ajHQNwNN83dE5qcZqbTvN2FBOxyIPb/BQ+R183ZW7sWGxOkEGl7Yy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe3ha3Q4/UDnLOGgNmbGi0AzHJGuJsw+70jc5aUJ6kkNYWYX+c
	mWDq7QaYspf+Nu71dl4wb1AkE131xDjEPj0AArvUwkoxZawiNiUoD9r4TcUMZYFsxpPJlbzXWFO
	haeEVdMLE60C/SNks9xbWVkBADB8=
X-Gm-Gg: ASbGncv9aCym0bxQBhrgG7BUU6l+EhsJX6kiTMlp8vSaKkel3rDGt3EN7EIX9JeHt2y
	IkTQHQriz80Q8I8T00ZVcSuXXCJchg4uAIGl+aDrni8zGrMpNaL1ZunUjNpt9VjnB7f0kj0iSai
	nZ1I31OTENMZL6vygT5z5aFH3Mp3vW
X-Google-Smtp-Source: AGHT+IEoZCtmd/odsNY1AueL2/BylkudMbYiLPnq+yVpZr8qNoJRC0tBlsOa6xLF9KZbqMlXnsMGY+t/Q+QTxpioknQ=
X-Received: by 2002:a05:6000:1865:b0:38d:bf57:f371 with SMTP id
 ffacd0b85a97d-38dc9373270mr4376973f8f.48.1738980087553; Fri, 07 Feb 2025
 18:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-20-memxor@gmail.com>
In-Reply-To: <20250206105435.2159977-20-memxor@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 7 Feb 2025 18:01:16 -0800
X-Gm-Features: AWEUYZnUTy2itNVn48BldfC4LoMr601PCDOaBo1fZL0B5Yg1x-9oEAhlPjMvVFU
Message-ID: <CAADnVQLNovQYGy6_zGDi75vmNHfZ-hKz4G=gWF4Bis8b6iTYew@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 19/26] bpf: Convert hashtab.c to rqspinlock
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
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
X-CRM114-CacheID: sfid-20250207_180129_576436_CE0EECCE 
X-CRM114-Status: GOOD (  14.44  )
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
> Convert hashtab.c from raw_spinlock to rqspinlock, and drop the hashed
> per-cpu counter crud from the code base which is no longer necessary.
>
> Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> ---
>  kernel/bpf/hashtab.c | 102 ++++++++++++++-----------------------------
>  1 file changed, 32 insertions(+), 70 deletions(-)
>
> diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> index 4a9eeb7aef85..9b394e147967 100644
> --- a/kernel/bpf/hashtab.c
> +++ b/kernel/bpf/hashtab.c
> @@ -16,6 +16,7 @@
>  #include "bpf_lru_list.h"
>  #include "map_in_map.h"
>  #include <linux/bpf_mem_alloc.h>
> +#include <asm/rqspinlock.h>
>
>  #define HTAB_CREATE_FLAG_MASK                                          \
>         (BPF_F_NO_PREALLOC | BPF_F_NO_COMMON_LRU | BPF_F_NUMA_NODE |    \
> @@ -78,7 +79,7 @@
>   */
>  struct bucket {
>         struct hlist_nulls_head head;
> -       raw_spinlock_t raw_lock;
> +       rqspinlock_t raw_lock;

Pls add known syzbot reports as 'Closes:' to commit log.

