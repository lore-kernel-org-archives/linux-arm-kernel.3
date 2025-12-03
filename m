Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB20D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zvn9HrRJdFSvUw/pGaMaIOGegy9462R/6im+1ui/l3U=; b=PZDNcc1/gUuiLMBUvLhUePagsy
	SHPht3ct9/CD9Sd0dXG4EftCuKBwG6MKwZHwqQT34qIlhjdKwSrLFrd9/e0IXobNxmL6weDdPGa7k
	HqI+BjS+fiAXgmVWb6vdTQrBWL9fddweGZtnLuCZPHq9H/JWvkDNvAes5EFj5dMIQyy6tO+waNndp
	n8hLUdSpaXwmAYauOhhoKGOkvYnwRDHYNDvH72Xg7iU8lrb9eXUScg22LN85ahAf8+3CUorVV8/Qz
	3kn/4vvbq6Egatvm5CBrA3YuzD4fcmKsBlSD/o8QwKg4at8SCE9mI6KSQ0lrvjHPAiYzTx+51Rze9
	2a5P625A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiy2-00000006NRK-1BGm;
	Wed, 03 Dec 2025 09:16:10 +0000
Received: from mail-yx1-xb141.google.com ([2607:f8b0:4864:20::b141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQixx-00000006NR0-0q9s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 09:16:08 +0000
Received: by mail-yx1-xb141.google.com with SMTP id 956f58d0204a3-63f96d5038dso5648926d50.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 01:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764753363; x=1765358163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zvn9HrRJdFSvUw/pGaMaIOGegy9462R/6im+1ui/l3U=;
        b=KsuH2h7AJ/4ZQ1IqaKPMUAh+kZbaY4uaoi7aGMSjPR6jo59rxNIQ8dlfxWSkoWXU1X
         8FJASLws9BEXelYS2uOSRNnnJPQtF2YaCe3DJlEqAOScwr2UdgmO2woBv5MAW0yvMhPy
         pT3ZKDzFw9bXJ+DuDXHKJkq5lkYoUBJdsJifaWaxahosATHvGz4F7NeVC/LDBcan9W6L
         j9+M3TN/GUcmbbwyasyY7strq8BDuDDOkQvDZyv0tWQ5HpPUqfvb97cPKNAjw/ctvQsr
         OejrhK8Zc6ymxItqMXhPV2pgi/POvw15vYU19P1skyOhda5fkExzJ0ubuKepAja7bdkg
         IOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753363; x=1765358163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zvn9HrRJdFSvUw/pGaMaIOGegy9462R/6im+1ui/l3U=;
        b=v1enazoK3GHtScOYEHrew3tfi+ExWrq8eqv+5bxEi76DxgjMqXgzCpU5DowYRMKBuM
         CIPKIzFhULLMGx9PKRvT1F9DyCATipVoNuPfbX9oPUkrEO6sdoxLO6S0jJ+rsMR04u3t
         p51m0D9A/9JFAG+fgjySA6a7XQqXQCobndsZ09XTIADGAQGN61TZnx5+Lyz6TqUA6hsv
         XBWbkHEM3RZ9hwVuBRN3aIXIzvYGxJ7RRhVDLgeRzIfXKgpc7g6orNhlutOKthL6WIv3
         +ro7Md0CUMfl6XO7RmeRZstAzBWhy7H4DlIu9Lrha9x0D041HUNZpVGCeSAfivQupLEw
         14+A==
X-Forwarded-Encrypted: i=1; AJvYcCW22k0X+kP77S9tv5A+J69QupyKviLtN3Hr4QjdX/ahECMdb9BeO6tL91xuvAFKbgdT+I4Am6fHJqSooqSMCrSl@lists.infradead.org
X-Gm-Message-State: AOJu0YwylsV/z/oyfKt/yEdwtu78kMdqH+zi6pQWyCIiwAJvQrb+HTan
	fxGYNtCtsFQ8V2nlw7/bTB93IRDFg+VRVOr/LYGFfy5LCffr5VaO6I6xwjFPmEvkHtZY7WAvd3U
	kU6Bd2Qg4as7IOQzww+3JCr6iTGbEto0=
X-Gm-Gg: ASbGncskUIfHt9U7dPZ+09OSJ5OYpfsddaSj7q3gGxWYDmZ+gjPoXgSPoWy07NJB7lH
	zg7VMq/qEy7XxtqUAlE1fmkk15/nxacvCt2QyBsEdx7NkUvt9/DpInDaTP1YJIAt2zACDKtIK5i
	s3xMcyF1A/Pc7qiNrJAMqHcnK9+pHG/fBu38gup4Q+prDkkXmANIeCVm4fTF6rEf3tCPs541y+l
	Oe14bBJZK66Izk6+Lbni+NyBUenOJWRszmOI0KxqP65fPa0lQVwumY2Vf+YzZteXwdCqwY=
X-Google-Smtp-Source: AGHT+IGzwDFZDWme46YAnVAYHhM1JFHKL7Q/q8FoGtyn85xl72liVPRXP4MJCYeiDce1hUNnHIbvdVJiL9cFbDX/sAY=
X-Received: by 2002:a05:690e:120e:b0:63f:b545:9960 with SMTP id
 956f58d0204a3-64436f6da37mr1340803d50.11.1764753363482; Wed, 03 Dec 2025
 01:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20251203082402.78816-1-jolsa@kernel.org> <20251203082402.78816-2-jolsa@kernel.org>
In-Reply-To: <20251203082402.78816-2-jolsa@kernel.org>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Wed, 3 Dec 2025 17:15:52 +0800
X-Gm-Features: AWmQ_bmG0tIamKx5RfhXBBYAUrUfUZzFDuU-aYWqrSdiQGfV8mSCyiAygQcVpgo
Message-ID: <CADxym3awpEbMiSKE5aDcyd2Cg1Cdo7++SLAMSuZmaggt3BSbUA@mail.gmail.com>
Subject: Re: [PATCHv4 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP
 ftrace_ops flag
To: Jiri Olsa <jolsa@kernel.org>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_011605_270072_AC4ECEC3 
X-CRM114-Status: GOOD (  28.24  )
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

On Wed, Dec 3, 2025 at 4:24=E2=80=AFPM Jiri Olsa <jolsa@kernel.org> wrote:
>
> At the moment the we allow the jmp attach only for ftrace_ops that
> has FTRACE_OPS_FL_JMP set. This conflicts with following changes
> where we use single ftrace_ops object for all direct call sites,
> so all could be be attached via just call or jmp.
>
> We already limit the jmp attach support with config option and bit
> (LSB) set on the trampoline address. It turns out that's actually
> enough to limit the jmp attach for architecture and only for chosen
> addresses (with LSB bit set).
>
> Each user of register_ftrace_direct or modify_ftrace_direct can set
> the trampoline bit (LSB) to indicate it has to be attached by jmp.
>
> The bpf trampoline generation code uses trampoline flags to generate
> jmp-attach specific code and ftrace inner code uses the trampoline
> bit (LSB) to handle return from jmp attachment, so there's no harm
> to remove the FTRACE_OPS_FL_JMP bit.
>
> The fexit/fmodret performance stays the same (did not drop),
> current code:
>
>   fentry         :   77.904 =C2=B1 0.546M/s
>   fexit          :   62.430 =C2=B1 0.554M/s
>   fmodret        :   66.503 =C2=B1 0.902M/s
>
> with this change:
>
>   fentry         :   80.472 =C2=B1 0.061M/s
>   fexit          :   63.995 =C2=B1 0.127M/s
>   fmodret        :   67.362 =C2=B1 0.175M/s
>
> Fixes: 25e4e3565d45 ("ftrace: Introduce FTRACE_OPS_FL_JMP")
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---
>  include/linux/ftrace.h  |  1 -
>  kernel/bpf/trampoline.c | 32 ++++++++++++++------------------
>  kernel/trace/ftrace.c   | 14 --------------
>  3 files changed, 14 insertions(+), 33 deletions(-)
>
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 015dd1049bea..505b7d3f5641 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -359,7 +359,6 @@ enum {
>         FTRACE_OPS_FL_DIRECT                    =3D BIT(17),
>         FTRACE_OPS_FL_SUBOP                     =3D BIT(18),
>         FTRACE_OPS_FL_GRAPH                     =3D BIT(19),
> -       FTRACE_OPS_FL_JMP                       =3D BIT(20),

Yeah, the FTRACE_OPS_FL_JMP is not necessary. I added
it in case that we maybe want to implement such "jmp" for
ftrace trampoline in the feature. But it's OK to remove it now.

>  };
>
>  #ifndef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 976d89011b15..b9a358d7a78f 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -214,10 +214,15 @@ static int modify_fentry(struct bpf_trampoline *tr,=
 u32 orig_flags,
>         int ret;
>
>         if (tr->func.ftrace_managed) {
> +               unsigned long addr =3D (unsigned long) new_addr;
> +
> +               if (bpf_trampoline_use_jmp(tr->flags))
> +                       addr =3D ftrace_jmp_set(addr);

nit: It seems that we can remove the variable "addr" can use
the "new_addr" directly?

> +
>                 if (lock_direct_mutex)
> -                       ret =3D modify_ftrace_direct(tr->fops, (long)new_=
addr);
> +                       ret =3D modify_ftrace_direct(tr->fops, addr);
>                 else
> -                       ret =3D modify_ftrace_direct_nolock(tr->fops, (lo=
ng)new_addr);
> +                       ret =3D modify_ftrace_direct_nolock(tr->fops, add=
r);
>         } else {
>                 ret =3D bpf_trampoline_update_fentry(tr, orig_flags, old_=
addr,
>                                                    new_addr);
> @@ -240,10 +245,15 @@ static int register_fentry(struct bpf_trampoline *t=
r, void *new_addr)
>         }
>
>         if (tr->func.ftrace_managed) {
> +               unsigned long addr =3D (unsigned long) new_addr;
> +
> +               if (bpf_trampoline_use_jmp(tr->flags))
> +                       addr =3D ftrace_jmp_set(addr);

And here.

Thanks!
Menglong Dong

> +
[...]
>

