Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A82CD6E7E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 23:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=; b=R81BeRZifP60D12yiZ1rSJUwlK
	DUxQWAiFKQUIp0tMa9dj9TDNyvPEjrfFdnxNiA89nd6rJVtjwAy8vyHgyLiWJW949ceM4t3FgKU+H
	yCEAkuj/2YlBz9fhKFzyyfVI6FPflsRHOaHhUIyJA0lSNoyzvdI65GCCKUeXl5m/HoqMOy2js7wKO
	Zri3uofyvisAy34BUMkxuCgMo21pTmDpdc3ycEzcEPJT509fuNDqf5z4fL/ksBzyAw2y8qFUJBhKJ
	Ww+uAVcjrP8l1APCyDdVUwNHGdonYMtt2KzH1zmef7HPPBDhEUtN1dARCbK/PBw4WHiY0m8oeve0M
	BkrC3agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVdqE-00000001JQ5-1i8I;
	Fri, 05 Jun 2026 23:20:42 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVdqB-00000001JPi-2aQ5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 23:20:40 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-69d7cdd3b8eso1103986eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 16:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780701638; x=1781306438; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=;
        b=WS3fVUslw1N5LNPgLqaMCLi7yUXkpQNYVfC85BMb9TnOWyvZvT1ZfbUb53dtiZna2a
         tvgznR7eBXfF7WR/Y0i+4MATZMm5Vf4FxOPY7ff5YbQFrqRkp0NXkwpbFXshC424vJlc
         XQSaDcHcqy8bIZddRcCMs7beo2gMywHhn1w2bPThq6ibiy+TWRwbItJiVD+0+BgFijM4
         nUaAmS9On6G4sm9lNW4vy5ptve5u06rDBJ8YXuDQr1TRCGhShMhLMmLInHr4XXW6/ksS
         Wk/kTp3SuBvu5tyOVV+I8fgBINSQLTxc0ggsyqPaFmbElM2ayVk+flOTzrrr1TblzAuq
         WSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780701638; x=1781306438;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4+iCAJCoPeoQjVniwPzyILoS4cYkcgjvk5RajaSaOvM=;
        b=d3NcHg4Km0ugq/sXVlB9HpMMjCRP11XV9EoHkI3uZmChcTePeYwSC1NjhsZ9bxD/Xe
         Q21et7YS2PRGpsYsgiIRp0jXhdonDY+y9d+SbOpneoMonMLhzbXFrAAVyrvwivlAc7Iy
         ZFVrpiHQLqLUPxxJJvl8pzzfrOeAbM8rEOz8QujBJjMQunIh7AFQ1af6MgjJ1YmOq3tI
         lX7ejz/XtDvLJxHkREtG7QvXjv2IDCR6trVUb939YFYowK/6qUXcxYgF5/hsOvHiOzZx
         6RgAS8knY9OP87JnsZ8xDbUjDL7yyc+B0If69+1Mw4WRLzq50UICh/9GnHnlQJRTwY2/
         3IIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9+BI3ai65uNAKKZHiTLng/ERr+kCvUJYs7SP3h2243jJqNpS5qxexfsfR/tsk3JVPFMv4prd4THfuITWxGT+5a@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7xHaCq76x8Jfp5eNYP/3+cO0ijQP3cl8xMiuIHT11lZzRKvay
	pjqkRxiq0f7HUXY3HIsT9g36SqbFFUxchwO7/kh1MIm7JYen0d4hvsZ3
X-Gm-Gg: Acq92OGSxPrtP+D/3Jb+6M49LAfcZwioTmpLAzF4ZSEgxwCsMAC7nVy9J0czAb8F4qz
	ourtZbmZOyYsZ3n9SO0NDVGbwdR+blSksEpao5hq62Mz86sGlT4c4ulB021danwT6BszUzUzOB4
	DD9beaHEsKXFOnuGFQuye14h9xNlcO0r+Q+B4m1P29YZm8RVj2pY/d+NTqubZ/FcK13f2jB/YEN
	jAmsFFln+kL+v/QE+YtCAVEojbwT2wNVkRa6k2Y/r/CBW1pNjW0M3aVybYVe3DMK9sDIwRFZqbW
	X4sjSYN2D3n+0ODWoUXJm3eKW5zCg4wXNQTCU8ez/KTNcPyfcvTWEF3jmGt+JqgiGxkFy4LVWpW
	+9xXbsbUjbqPtYlD/+eDGFulcrVw2Idr9vzr/D7XkMhfenqS2j5NFhvZJTgTp4ntwYQuO4uLaOI
	5EAbAmBvRni4KHzDckyqQmCXSZhh5rWMUIK+p2/uOcJhiUiYBgOYaXJepkcIgkKE10YpGHzgUyK
	HpmU9mjxZ0GHpJAOiAyZr1z+uTB
X-Received: by 2002:a4a:edcb:0:b0:69e:40a1:5fd3 with SMTP id 006d021491bc7-69e68b1b820mr3057943eaf.2.1780701637605;
        Fri, 05 Jun 2026 16:20:37 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:46::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d8465e00sm8002361fac.15.2026.06.05.16.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 16:20:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Jun 2026 16:20:34 -0700
Message-Id: <DJ1I1PI8PVFM.3KR1GSL838OMF@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>
Cc: <ebpf@linuxfoundation.org>, "Bastien Curutchet"
 <bastien.curutchet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH bpf-next v2 1/8] bpf: mark instructions accessing
 program stack
X-Mailer: aerc
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_162039_663721_1C721B90 
X-CRM114-Status: GOOD (  11.89  )
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

On Thu Jun 4, 2026 at 1:21 PM PDT, Alexis Lothor=C3=A9 (eBPF Foundation) wr=
ote:
> =20
> +bool bpf_insn_accesses_stack_only(const struct bpf_verifier_env *env,
> +				  const struct bpf_prog *prog, int insn_idx)
> +{
> +	struct bpf_insn *insn;
> +
> +	/* cBPF: we have no verifier state, do a best-effort check based on
> +	 * dst/src reg
> +	 */
> +	insn_idx +=3D prog->aux->subprog_start;
> +	insn =3D (struct bpf_insn *)prog->insnsi + insn_idx;
> +	if (!env)
> +		return insn->dst_reg =3D=3D BPF_REG_FP ||
> +		       insn->src_reg =3D=3D BPF_REG_FP;
> +	return !env->insn_aux_data[insn_idx].non_stack_access;
> +}

Let's skip this function and cBPF altogether.

This effort aims to catch verifier and kfunc bugs.
cBPF doesn't have normal verifier and has plenty of unpriv gotchas.
The kernel compiled with KASAN is for debugging, but I'd like to
avoid thinking about unpriv complications with cBPF and KASAN.


