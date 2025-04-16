Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DACC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 21:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jVAyA2MpizhxtQwsOdID7gg2xhGq08cVN7SZQ9jXqk=; b=ZMPsfRYXC0NAZQ46lwNau/T5kf
	uxJsbQno1cRHYbrYxPgIb3DPK73HalphduDE1TK1hDNWE+KCKS0za9B55Gqku9E5RsQ5QRhZaRdPC
	BsA3xYiJf8aL4VYhNij14mVOlugZMyIgUd53D7Qc1Wo8Oa115pSn7q72Tg0w6smIS2Ix7vXhOMLwC
	vCr5HhJyxTLOVjthbndohw0hNwXEnvr86o8wcxQFxmzoyuFVWbX2DMtuTSEmKV0DQJzqsUjx/vmyC
	7xB5Go1vZ6bl8WNUjmbloSi+tfBhlgJRcjSt+EgzWtJBARZGxOcypDn5aQz1JeUr8NN50whLWf3bN
	a2hrC9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5AH9-0000000Avay-0k2K;
	Wed, 16 Apr 2025 21:26:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5AFJ-0000000AvOe-1K8w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 21:24:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736b34a71a1so75770b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 14:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744838676; x=1745443476; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jVAyA2MpizhxtQwsOdID7gg2xhGq08cVN7SZQ9jXqk=;
        b=OwvZhl2jsD9aw/4yxSOaWyaw/xOu1d499+ee6qQSc70sgeh8zljDdhWulI9zebo8C5
         fFA8vG53QHEH7hgyLXlGrmm/9Sp5S7jTIu4xm70XmnFAvvDU4BazukWK1iQdEiPb69dM
         TKrjLR5CjitiI5NbtLo4KiZdBnw7Za512s9xX4Jgpk6b53cCVfGWOqFSEDw8b4S8nZDa
         UDFxk+5exsyRvy/4D4XChuFLX/MlhG28X8lpl0NXf5/P6bZaQg88GRKY5ILzEt/pFFXU
         YBmvJYka+39qPPQSp1f1L8OYXC5Hv5YsYkqeinp2cBhYlRXyN7ZaMl028IGJFrV9Xgq3
         ezIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744838676; x=1745443476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jVAyA2MpizhxtQwsOdID7gg2xhGq08cVN7SZQ9jXqk=;
        b=uNj7PF6KIWgpF67yyfguqJRIRpRaN5eaFkyRlkVfNzMF2s6qHGQyeP/iT0m8EAWjZt
         GQXtbLBbZW4/zHIZThGfXqoKzaPCRZ/84w1LlOchdiwdJPCtDMXVNhfTyYEynIRea0mx
         UPS3RA8NXYGwQBb8b4zIf7XgH3YX2EzMXq7HlVnCF5WH7fbQTFYUTLGXZIjg2z9p2loV
         0etDn6uoFsonMkkNwJUgz1CoezVMwTPgj6IhjL3R5YfDCrdHpUGNlPRqI7+eTTwtoqUZ
         Q5kGL+klNOThGN6owshDTbmQlpVR2A24HYn/HN3XboTuVzXtLWEDllUhzSkrbmCfe3lD
         IkpA==
X-Forwarded-Encrypted: i=1; AJvYcCVVtba+j7VEVem5qgK17jJHOzK2hbV7xPiBUdOqWs2zKXqZTCnZX8C8ejWkqIXPd0FO5RiVDufBm1ZPff13jS1f@lists.infradead.org
X-Gm-Message-State: AOJu0YwGXXCIXn0KjccyrqfuXGZ32bsp/UCnl1uVTETzszk+eJ+Qh6vQ
	/VYe6Pjfc1ZybN5qiloQfN2Qn+vCQwgk2Wl1ek8DFcWvuhcAQrqbzowt8No4P+2RBrMNt/BAdjx
	OSRDlThVYmBzPo0aGXqyrJMAMU/k=
X-Gm-Gg: ASbGncvZBRD1mJnjZ9I79YU8BQW/z1IdfvkogI1nNcYChagmTIQx8xtAM2WFUju+Zxd
	pSz37VGpJ83mzHpiJZ8hPf3vGKN4SQrVV39LGyZkGjqX5RROHHsVaU1SiUBxIrslduQF/GwwTGc
	rN0kLAABUpWohl4KpT1Rw50J5M4uVJupGbfX1Yog==
X-Google-Smtp-Source: AGHT+IGP0KP8Iix57A7pNCwQp1k9B+JFkxfWiQwRVI0u7EuoGlinHX/1dVpIRADFn6P7r1WHtj3Ss+TZRQvR2I4Bbg8=
X-Received: by 2002:a05:6a00:aa8d:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-73c267f8ba4mr4955120b3a.22.1744838675753; Wed, 16 Apr 2025
 14:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com> <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
In-Reply-To: <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 16 Apr 2025 14:24:23 -0700
X-Gm-Features: ATxdqUE6pVn0ZTMRWW3NJojzYizvIX7ZuQkUbJrKxsRI8DDdQqgnpzQYLgypGws
Message-ID: <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Florent Revest <revest@chromium.org>, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_142437_354793_D2245CF5 
X-CRM114-Status: GOOD (  25.87  )
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

On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Foundatio=
n)
<alexis.lothore@bootlin.com> wrote:
>
> In order to properly JIT the trampolines needed to attach BPF programs
> to functions, some architectures like ARM64 need to know about the
> alignment needed for the function arguments. Such alignment can
> generally be deduced from the argument size, but that's not completely
> true for composite types. In the specific case of ARM64, the AAPCS64 ABI
> defines that a composite type which needs to be passed through stack
> must be aligned on the maximum between 8 and the largest alignment
> constraint of its first-level members. So the JIT compiler needs more
> information about the arguments to make sure to generate code that
> respects those alignment constraints.
>
> For struct arguments, add information about the size of the largest
> first-level member in the struct btf_func_model to allow the JIT
> compiler to guess the needed alignment. The information is quite

I might be missing something, but how can the *size* of the field be
used to calculate that argument's *alignment*? i.e., I don't
understand why arg_largest_member_size needs to be calculated instead
of arg_largest_member_alignment...

> specific, but it allows to keep arch-specific concerns (ie: guessing the
> final needed alignment for an argument) isolated in each JIT compiler.

couldn't all this information be calculated in the JIT compiler (if
JIT needs that) from BTF?

>
> Signed-off-by: Alexis Lothor=C3=A9 (eBPF Foundation) <alexis.lothore@boot=
lin.com>
> ---
>  include/linux/bpf.h |  1 +
>  kernel/bpf/btf.c    | 25 +++++++++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 3f0cc89c0622cb1a097999afb78c17102593b6bb..8b34dcf60a0ce09228ff761b9=
62ab67b6a3e2263 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1106,6 +1106,7 @@ struct btf_func_model {
>         u8 nr_args;
>         u8 arg_size[MAX_BPF_FUNC_ARGS];
>         u8 arg_flags[MAX_BPF_FUNC_ARGS];
> +       u8 arg_largest_member_size[MAX_BPF_FUNC_ARGS];
>  };
>
>  /* Restore arguments before returning from trampoline to let original fu=
nction
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 16ba36f34dfab7531babf5753cab9f368cddefa3..5d40911ec90210086a6175d56=
9abb6e52d75ad17 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -7318,6 +7318,29 @@ static int __get_type_size(struct btf *btf, u32 bt=
f_id,
>         return -EINVAL;
>  }
>
> +static u8 __get_largest_member_size(struct btf *btf, const struct btf_ty=
pe *t)
> +{
> +       const struct btf_member *member;
> +       const struct btf_type *mtype;
> +       u8 largest_member_size =3D 0;
> +       int i;
> +
> +       if (!__btf_type_is_struct(t))
> +               return largest_member_size;
> +
> +       for_each_member(i, t, member) {
> +               mtype =3D btf_type_by_id(btf, member->type);
> +               while (mtype && btf_type_is_modifier(mtype))
> +                       mtype =3D btf_type_by_id(btf, mtype->type);
> +               if (!mtype)
> +                       return -EINVAL;
> +               if (mtype->size > largest_member_size)
> +                       largest_member_size =3D mtype->size;
> +       }
> +
> +       return largest_member_size;
> +}
> +
>  static u8 __get_type_fmodel_flags(const struct btf_type *t)
>  {
>         u8 flags =3D 0;
> @@ -7396,6 +7419,8 @@ int btf_distill_func_proto(struct bpf_verifier_log =
*log,
>                 }
>                 m->arg_size[i] =3D ret;
>                 m->arg_flags[i] =3D __get_type_fmodel_flags(t);
> +               m->arg_largest_member_size[i] =3D
> +                       __get_largest_member_size(btf, t);
>         }
>         m->nr_args =3D nargs;
>         return 0;
>
> --
> 2.49.0
>

