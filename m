Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D18EA71AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 22:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=; b=Alw/cU8grI/eoVylw3C62L8sL7
	7uicW2BZhwin5skhUztD82Q5SN2FEqqb+DxvsUlppkysaW+n9qynuHUU5+6izX1T7t7Tjtzipx0rm
	PtvIKdLvZ+yKV3RhX38rEb4miByUePK6ZuABihcQe1Lj9ILs6bXulrwYw/8rAgR73f3fR+UpoU0Rt
	OOKAznU0nuBijfzGeendDKqU9okcDiufSsuReiHIlJoinafPi7Xoq/1+7rmmyZn3oQRKoeTC8m75U
	aOJUqy0+V72Af2CIxW8WSVXoliqBDqpAiBGA/zHmyEc80AlKwbKhh799PAA3OAEmf1t1tacygDCcO
	8uwayeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEazR-000000068la-0Hyc;
	Sun, 19 Apr 2026 22:51:45 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEazO-000000068lF-2Ovd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 22:51:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43fe62837baso1340117f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 15:51:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776639100; cv=none;
        d=google.com; s=arc-20240605;
        b=QcvmomhN6fbSKnpm3oCAwoJZqjSy3nrL+VA32JgL6YF4yB7ROeuZdzpZ96LDW1S0cZ
         6SNw1NX1MwQ3E4g5n6Yp/aV+L/D/VoAh53PFV6pYBkASwBl1sXs80skUWOz+RrG1Bn6a
         ZXLfCPuF8L4LfV+jQW0V9Iw8yOUjd9pc0HvfCllTPwYBbsRzdWj2uEPi01u0BsxffYoi
         7yltQPgajfETEG7tldpMmngHz4laFdqbESLVP0o5WqJvvxd/KNfAuPAZgKFt9GCwXdFc
         7bEBCo6DqFV7WOSF7UU6R9HP45zjDjN0YgB3vDLSDX4tXn61rqwQJ7A4pInzdrgdFAzX
         CWew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
        fh=E+89ps01e0mn54ln4keXkhTrE16QUuQR6pmpZsePZyM=;
        b=ZH3FiIeW0boShmTVLDnm0JckABq1ubdgfNXLp9xmVTpuQPQY+k32+4Bc3ZkYg3mKIU
         vru8DNhjFKgQSIDPmZyMg+yJzcfF1oTAF/TwN4N5xyHlKA825gNntkJn+e0SWVQ3o0xW
         W9kRzJtD4PgW7RP9dCFPE30+21QmVkMs+dGIHpqr3vHbWGmUmuAX+cW7UYVWFgzBnUPG
         C27MuYmnAn12fPY+C21XsbE19XmZJtl6y7kd93d5/wyNz2n8UBB00F2HP5sjZRcW9vzr
         dTY9dramEvJvVfvMWIEJBgkwCuEgaiBum2mz7eE/5WBYRItM18XZcs/+CQKfQWDVFlWL
         Ci8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776639100; x=1777243900; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
        b=ARH1ITbLzYdgMR8rk+VA34VKhJpPLQH6mGKjr3ixWagblVCSeLufUKgSkVYcNAEFRL
         3MBVP74dpA1gqfOcHSvF8O9MIHAM8BnzMguQm7QCDo5yhXNIWPjVtIt2leNscFCwObU4
         Q2zIMpFoif1tt+1avc/HJJhn3EVzaA1ZamAV2yeWBkFzHk+K2ivRdWCdHpKXU3B/m4WH
         kirUIHmCw1kJQIYMlSM9cjYoZydxq5gXHPyuLNJ77OpIWMmc4aS+CLiNHYDR4Pd6VyR8
         xv/h9TRvFAzRgYpRbnJf/1PObENpGPYIrlh+JnPH3uaP0xcAWvXVilOeYr+bubbO8Mn7
         PEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776639100; x=1777243900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
        b=q0w/lH0bRqxuIXubgdMnz9ZWd0gXcH+rzHha+ApAbgmaseRywnsSGD4XLa6RqmX1sP
         hRnWgSqt1iANwGEmQ2+dM5sDqEslXqBcp2JzTilsRaCjto5z9Q40+m8NDUeVSeTmHnng
         vl/xoRxLDr7Cc6Pywi9Q3N78pHXUhrBFrNQXocSfUcir4J0QRKN6HXOfVa6slCcKIvnx
         dbhgTp301llYvea5dz9hAx3pn5kwX5s4OBGtUxnE0ZSuS9FzXH+ZN2NS7nUm8sFqIy3q
         X+UkD29B9gmQ0BBeVpyhSe+HCzT/zC73Ry0ssDtnhvxfa2LB6u0TUzUgQrh2/uWNNoA8
         Q6Gw==
X-Forwarded-Encrypted: i=1; AFNElJ9lvfXVMM9q8zXg1I6HboTr2+4O2cCX+N5cz3s8c3SJ4nKtJSC97qvc9hm5+w8WHo50YxTI8WqAKigKqAX3WP8Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwUEJMkA7gadhZ5R89wIU9S4kBS1EKhbqg33A/DyntA9jIXdVN4
	2l4rGk6xlveiS80za5ckZedkYAdB5iw32MmLjufV1QgSWcmyp/HT3cEKI3fbxfz//gvj+SMzszP
	7t/Vs7wEn4DxUvQhVZNBgIny4MbxP33o=
X-Gm-Gg: AeBDieu2S3LJBD/03Bd41yeO9BVnHEljMJENkjOKZxQD3/M71MVdZLmZGVKNBBaDsmw
	soZCi6cqRZulNR/JtwQTb9UgJ2mggGKhj+zLhkdyJZlH4Gzg+mOWquCoXROE8fpBqP1NlN2NGTS
	zeqNueGftthD76yfAJWfuDigEVxjbLM0Xa5U1ZHRXWuzxtrAD4I27GM/SdsRmorHbygyq1nuzNM
	GpcSiAqfbTNYZY0xwyRcWmosFtLZkCCk7YtVu9FjAZlbljE9FQyWREP/CwNzpmuB0m7oNs6nQC2
	CzV5qq0gNUIww6gxmQaiorL3K0cs6FrhSLHtSTlDYUreQcnVld2dea2Ll0W5+Uxdvu8fKpIGK4H
	dH1PxQcuwH8Rn9q4V5HiSw3qXvdoUah9Ae1H6
X-Received: by 2002:a05:6000:22ca:b0:43d:7883:87ce with SMTP id
 ffacd0b85a97d-43fe3dfd265mr15420059f8f.34.1776639099627; Sun, 19 Apr 2026
 15:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com> <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
In-Reply-To: <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 19 Apr 2026 15:51:28 -0700
X-Gm-Features: AQROBzDew-foTfJLq_z3E45rMJ3PdE7WT5G5Kb1cNLd7o7s_NLhMVNDGxKf8D94
Message-ID: <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xu Kuohai <xukuohai@huawei.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_155142_676476_1C2F9B76 
X-CRM114-Status: GOOD (  27.06  )
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

On Sun, Apr 19, 2026 at 2:49=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.=
com> wrote:
>
> On Tue, Apr 14, 2026 at 5:58=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > I think we're talking past each other.
> > We're not interested in KASAN_SW_TAGS or KASAN_HW_TAGS.
> > We're not going to modify arm64 JIT at all.
> >
> > This is purely KASAN_GENRIC and only on x86-64.
> > JIT will emit exactly what compilers emit for generic
> > which is __asan_load/store. This is as stable ABI as it can get
> > and we don't want to deviate from it.
>
> OK, I supposed that's fair. You did throw me off point with your
> performance comment. But if you decide to add SW_TAGS support at some
> point, I think this discussion needs to be revisited.
>
> But please add a comment saying that those functions are only exposed
> for BPF JIT and they are not supposed to be used by other parts of the
> kernel. And in case you do end up adding a new config option, guard
> the public declarations by a corresponding ifdef.

I feel concerns of misuse are overblown.
Being in include/linux/kasan.h doesn't make them free-for-all
all of a sudden, but if you prefer we can just copy paste:
+void __asan_load1(void *p);
+void __asan_store1(void *p);
into bpf_jit_comp.c

> > The goal here is to find bugs in the verifier.
> > If something got past it, that shouldn't have,
> > kasan generic on x86-64 is enough.
>
> FWIW, I suspect HW_TAGS KASAN already just works with JITed BPF code.

Ohh. Good point. Looks like modern arm64 cpus in public clouds
don't have that enabled, so one would need pixel phone to
catch verifier bugs via hw_tags.
So we still need this x86-specific jit kasan.
I guess eventually it can be removed when hw_tags support is widespread.

