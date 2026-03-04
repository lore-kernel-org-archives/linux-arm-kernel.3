Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF77EDEC13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 06:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4jzwjHLv2KUZF1szEBLqYn8fq/YjRSK6XfOmgw2EUs=; b=llZVa0a6WXfr0nmlR7co2ICceY
	kvCjJSHFVdeLjhkpPsXV1jVKeXRJDFvXjhu+AROJ4e8Ti9ngWUBfRVaCDkgGAb9x9wl00swSRymEF
	B/Lno6GsgmgK/LD3mtjdND5wIGOAsJZonhTxtenaddIC+807bB2w+5EYXSBcsEUzEf0BRIc69eTaR
	cq5xn9E75x3NXh8CMm8jCjIvjhFiGqFW2586ohgSMaVG8xp6ae/aX74a1VqWZO3di9496pQkFEMIt
	Ynb4yyKnpvgwpY+qnyCxH0JmU4QSBkfyHizhPShgYI4JDZ9is/7S6KWk9xK0dKJUIZPE6AklMvXuz
	Zdf/Q4BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfMS-0000000GVZD-3Enn;
	Wed, 04 Mar 2026 06:05:32 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxfMQ-0000000GVYp-0E23
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 06:05:31 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso29713915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 22:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772604328; x=1773209128; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I4jzwjHLv2KUZF1szEBLqYn8fq/YjRSK6XfOmgw2EUs=;
        b=GZ3CleRf1UXa1q8cxsxyryr8O6WamoYqsahxeSZeB9jgWHgqmtM6aEBHV42E0dBPQ2
         h2I2VorPmkciVCxKvQVtSjZNHS7+aAHrg3XKjEJOcF0e2CBJIt+g4+cfOjidUj51n/ZE
         M39PtahHC7fnXRz7YAl7ovkUvgw4KNCt/jt2JQphz3f6EOV4lbOHNVBUaQBZltBoK1yB
         JgGuvRhrHUy/19m5STnhboej3Rb03Tu4btGDVR57+2lq4uOspXQuoyXDFLzQUCsObqmW
         nM0S8aIDxcepm6MjiPQkiAWXNmF6ltkccF9fimHHuyF6zDvlDLj2FzH4iKjH18MkIs5u
         O9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772604328; x=1773209128;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4jzwjHLv2KUZF1szEBLqYn8fq/YjRSK6XfOmgw2EUs=;
        b=VXATKcEUE9GjhdbPIUY94k7LismvvMTIxzTpAfieOuyBL4vunkFowX9SM8lBnXrwK+
         mvGoTnWryx2bKZ64aAzsyAUCTxs1g6C9wp6fStI/IldmaP7yR3q0YJzaYDD0vXoMxXsy
         3GNScsrmpyBpghBoL49jJVVAiMOU4ILPY2LAoieuqT1hQmMwJn1WTVPZTHu3SFKEYHez
         1PwIOw2afygdyXs2dYgS+WZ1cFmias+2AvjKpP6yLg9g2LBZkzZqEeCA8QfkwgdSzZ6b
         TLFKwN5iOQTCg7Toqw5kLyw+xHkfttG0JTzqi/1YlYSga3QJMZXVChCNPUyPjK+gVZIV
         nP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOOJcf+iEGTYOIT7IqRcFMftRWXM4ttQmg++xqG4KJeDcyUEHMVuzFHKoCpaVKZU6Ki78AChxx1z/HxLyNSBxc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk7bizYCWoQDMZqFiqwtdl/ABm3pI7raBqTuY5JTqn4kY3uVN4
	JtzzL5CnN1dlPuCCRhiGOTs6UxvTz0aEsGqn/PkW+qfcwiIT+LUfyPHa
X-Gm-Gg: ATEYQzwNMio9BcJTr77VGIwfWmk6MDd6Q2ERi4A0YHUw8JEwJqhFR9OpTEnwX7K44JQ
	aAJF+b6WP3KfRfHHHKPqbVeZGaRzIIbkpRABq75MHXS5ww2QiyPskhc6lXnjdrzjHE60j62hLQh
	+SGvUUJMfWNcSF0Cztz4M8ovyAIhgSBTtXVJUqgZV0U4iX7aWVCbwFZeXp5YpXfRgk5K8iju+sF
	RnCu9I/ASHU1NRUoJH9etqcOGL19keg6XQNcjPvLqor/7KUk6/g7hiWMLFB9sVA6YkktjTQK64L
	X8wBfKz4JZLAN+jgruG3HULKSPiMI7Q8ruSMnFQZr8Yw/P7f9u8At0QcyzIaF4uH/eUkjm11pRE
	Jw7u/vdc4RimJ20IPEYQz50M7dydKTk2V707zN86cHQfyWzcsq+w0i4SF0Rtcqmg8iuJfvWJOme
	c1e8RIaX+VXHQtfdZbfixSAVeYpLESt74I/RLoR8fRw5uv+wIOD7Mn
X-Received: by 2002:a17:902:d590:b0:2ae:456d:b836 with SMTP id d9443c01a7336-2ae6ab365damr11199975ad.47.1772604328378;
        Tue, 03 Mar 2026 22:05:28 -0800 (PST)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6f3436sm265491385ad.88.2026.03.03.22.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 22:05:27 -0800 (PST)
Message-ID: <fda9674c063db24cde39c2d97779e307943d4ba5.camel@gmail.com>
Subject: Re: [PATCH bpf-next v5 1/5] bpf: Move JIT for single-subprog
 programs to verifier
From: Eduard Zingerman <eddyz87@gmail.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song	 <yonghong.song@linux.dev>,
 Puranjay Mohan <puranjay@kernel.org>, Anton Protopopov
 <a.s.protopopov@gmail.com>
Date: Tue, 03 Mar 2026 22:05:23 -0800
In-Reply-To: <20260302102726.1126019-2-xukuohai@huaweicloud.com>
References: <20260302102726.1126019-1-xukuohai@huaweicloud.com>
	 <20260302102726.1126019-2-xukuohai@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_220530_131539_26E6B410 
X-CRM114-Status: GOOD (  11.55  )
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

On Mon, 2026-03-02 at 18:27 +0800, Xu Kuohai wrote:

[...]

> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index fc4ccd1de569..ab2bc0850770 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -26086,6 +26086,11 @@ int bpf_check(struct bpf_prog **prog, union bpf_=
attr *attr, bpfptr_t uattr, __u3
>  		convert_pseudo_ld_imm64(env);
>  	}
> =20
> +	/* constants blinding in the JIT may increase prog->len */
> +	len =3D env->prog->len;
> +	if (env->subprog_cnt =3D=3D 1)
> +		env->prog =3D bpf_prog_select_jit(env->prog, &ret);
> +

I probably miss something important, but would it be possible to put a
call to __bpf_prog_select_runtime() here and remove it from syscall.c:bpf_p=
rog_load()?
Thus avoiding the need for `jit_attempted` parameter.

[...]

