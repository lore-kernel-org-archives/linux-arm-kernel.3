Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4321FC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXqH3/APdtQJoO7o2nnXO+aSVxcwfTQhNjLKJExRtA4=; b=SZkagmwoNE81nZpBRaG8Po37xp
	jFeI+DuEMna86j/u15XTIT8K7rRDa6rUonud7qcHgEdxKcStML+KMTsZZxmDjnxFg5wMLFk7S1rZn
	SYqFTw+8IHOUtMVq+kCI9DZKSIfq3BB3Eid9A1PPJlqdwXsqIoMjUwf5Sf2+zZbKCnYwaHZzWcvle
	d4ZsokPTVO3eNjwc4Kl2BNKiDpSu6PYAB23Mqo+h+8ONPk1Ica4hTUdDqQE99Z/swWw2AGb9mz2oM
	YAjbY245u3TMGR5UkPlIiRUE+a0HPIkTqjWPPxunPSrmoZyo5dBdL1SajbCbxBImNlSz4wag1Fixp
	QkJK3TKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eLA-0000000BRC0-0g0K;
	Wed, 23 Apr 2025 17:56:56 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dhI-0000000BEVj-21hl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:15:45 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2286210a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745428543; x=1746033343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXqH3/APdtQJoO7o2nnXO+aSVxcwfTQhNjLKJExRtA4=;
        b=V4kQB0jekHS8CQNRUF6RL1VP9n6GeYfNbIeDXw6B4R5HkttwhmJ0YS19CltrnEwNHS
         gCqnNluEzyf/4oFQEH3CCSGoWfZWGc2iWQipz5ciwRcT7a/tGXIxGnR0Xsmfvz8Sm7nb
         HFiI7Uh3F8TmSdPlEQ8CFbpTXXUVs67lYgabNoKfGLz4K2ZGXOatb8s+VFM3123pE0lX
         3DX5Ay/bydJ/dJ5PLQLNAUC+IupU3cWuodqeVPqxk1KwgWs0PWEv8Oj+tSGvofBtaEYI
         R+P3JPtWZ/6YCinPaOoj2TPEVc0PIa+CfOntJRKfsD2pb4QnXxvcX4w4yQPmmbY/RSTT
         zU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428543; x=1746033343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXqH3/APdtQJoO7o2nnXO+aSVxcwfTQhNjLKJExRtA4=;
        b=p+vBAPzJJK7DMddrEdPucSYV28CcXH0VAyZaDGhxLL9n7ywCjEhwnrKgfLmUKe8RZl
         r8zkFEtBbnunPtdpiM3FbcQWqzJO3F9kv2zRCHfDFygKhUV8mnD+PgCoCf69RTP64KRR
         bpIME8wRIRzzRnDhkfrDIjvoMIvTuW1V6xvB5qzgfW1xu0//dgxJBW6fY24ar5en6LvJ
         /3E+/WvcD1jhtXSqsffzYLWsTDqRT4XzpxBg2K03J5w66Xxb4OzGLKQZ5t5kxDHMmSFb
         4/CUFfdYULFBJ7Q2e0TqRJdLMcT47C2AE8ELlR8mkyuuhoKE+IOnKi8qWU9cbUjRu9Py
         tdVw==
X-Forwarded-Encrypted: i=1; AJvYcCUIZkrxp7JFQf+9OoaTK+Fa+f/jRr0YZA3CFZJ7nFzPase22AOTsaOQlPUNdi0bRhM+ChpP+EZhkAScvU0zADw/@lists.infradead.org
X-Gm-Message-State: AOJu0YzKDNmlGposoPjsLVAyBH31IQUFRSPc6V+mD+ihAyEX0U6mbWv/
	BPbgioRYIWw9O8qa9f6r398a0+RoAU6wotaStvVcodsyvj67FWjRls/Veqh8yhwxnMs5Er8qh/Z
	ALODDwyGs2DpyrfBth3SJiyeR6jBtxiR4
X-Gm-Gg: ASbGncuQrEDU2eG8bzfdgEU0Lc+TQLsSrXQVoZJmXc4bphelMoODDi4larS/3Q8pEUI
	gOZjHRzQCQjJu6E4EJmzmdz6U5c8d8hqDMIXzUZrI1fakdS1+UmlFgXw9wbrOXZZ5gGlRqWTMFJ
	mXVmwDTBKOhnuQpY/ZMhfIS4lLNS61tuheKvBX1g==
X-Google-Smtp-Source: AGHT+IENhXSbehQqfBW1svYcq0D4UIHBuJbvet0xcZ1l8BgXjBl9sSRbuFPUI4WEPm1PyA5ibhgYTL9d/lGV71q9Wms=
X-Received: by 2002:a17:906:942:b0:ac7:3441:79aa with SMTP id
 a640c23a62f3a-ace5459c3b0mr1838766b.13.1745428542340; Wed, 23 Apr 2025
 10:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com> <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
In-Reply-To: <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 23 Apr 2025 10:15:20 -0700
X-Gm-Features: ATxdqUE91QmVoMb8-9fNRcAVpV6sKAYDYDexZM632tte0cXJZXh3_ehQWPpgTAs
Message-ID: <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
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
X-CRM114-CacheID: sfid-20250423_101544_526930_0A68245F 
X-CRM114-Status: GOOD (  34.42  )
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

On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hi Andrii,
>
> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
> > On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Found=
ation)
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> In order to properly JIT the trampolines needed to attach BPF programs
> >> to functions, some architectures like ARM64 need to know about the
> >> alignment needed for the function arguments. Such alignment can
> >> generally be deduced from the argument size, but that's not completely
> >> true for composite types. In the specific case of ARM64, the AAPCS64 A=
BI
> >> defines that a composite type which needs to be passed through stack
> >> must be aligned on the maximum between 8 and the largest alignment
> >> constraint of its first-level members. So the JIT compiler needs more
> >> information about the arguments to make sure to generate code that
> >> respects those alignment constraints.
> >>
> >> For struct arguments, add information about the size of the largest
> >> first-level member in the struct btf_func_model to allow the JIT
> >> compiler to guess the needed alignment. The information is quite
> >
> > I might be missing something, but how can the *size* of the field be
> > used to calculate that argument's *alignment*? i.e., I don't
> > understand why arg_largest_member_size needs to be calculated instead
> > of arg_largest_member_alignment...
>
> Indeed I initially checked whether I could return directly some alignment
> info from btf, but it then involves the alignment computation in the btf
> module. Since there could be minor differences between architectures abou=
t
> alignment requirements, I though it would be better to in fact keep align=
ment
> computation out of the btf module. For example, I see that 128 bits value=
s
> are aligned on 16 bytes on ARM64, while being aligned on 8 bytes on S390.
>
> And since for ARM64, all needed alignments are somehow derived from size
> (it is either directly size for fundamental types, or alignment of the
> largest member for structs, which is then size of largest member),
> returning the size seems to be enough to allow the JIT side to compute
> alignments.

If you mean the size of "primitive" field and/or array element
(applied recursively for all embedded structs/unions) then yes, that's
close enough. But saying just "largest struct member" is wrong,
because for

struct blah {
    struct {
        int whatever[128];
    } heya;
};


blah.heya has a large size, but alignment is still just 4 bytes.

I'd suggest looking at btf__align_of() in libbpf (tools/lib/bpf/btf.c)
to see how we calculate alignment there. It seems to work decently
enough. It won't cover any arch-specific extra rules like double
needing 16-byte alignment (I vaguely remember something like that for
some architectures, but I might be misremembering), or anything
similar. It also won't detect (I don't think it's possible without
DWARF) artificially increased alignment with attribute((aligned(N))).

>
> >> specific, but it allows to keep arch-specific concerns (ie: guessing t=
he
> >> final needed alignment for an argument) isolated in each JIT compiler.
> >
> > couldn't all this information be calculated in the JIT compiler (if
> > JIT needs that) from BTF?
>
> From what I understand, the JIT compiler does not have access to BTF info=
,
> only a substract from it, arranged in a struct btf_func_model ? This
> struct btf_func_model already has size info for standard types, but for
> structs we need some additional info about the members, hence this
> arg_largest_member_alignment addition in btf_func_model.
>
> Thanks,
>
> Alexis
>
> --
> Alexis Lothor=C3=A9, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

