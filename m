Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868ABC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8gs1eFT2kcTigsEaDxM7aO9zrXV1nvZcJgmjCeGg/s=; b=JcEWqiZgiu7Et+m6xWqVObDwFw
	9BeNtE6MEWEzGjgzInQJHoZSfMZyRhK7W0P3OfhpKjtNmsd1yHwli0S+zxgLjLZbPndh+/psMP5w3
	5i5nI93kKz3yTTUsoCGMmeSBxOm7N1t9MKbEy11oQ5MJI+Idyepyi4uOx4hSEXG0ziHAwRD1PLRPa
	8xHektPD2xDjJRbiVKQ3GSoU3J9TAiK+do6rASFjF4/F/o0OwI+SXATT7rmdltXl6hU/oCfHeKfUm
	zQXQ22sbjU/u+fvuWt7GVoukQ2fy7CfT4rlW7LCQvijN+Z1OpOq9S2Qd7JOXSnWHFadA3cfQD3WIx
	jpnjp6qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u85oN-0000000FXUW-29M1;
	Thu, 24 Apr 2025 23:16:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u85mX-0000000FXLU-0CgS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 23:15:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1173945f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745536499; x=1746141299; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8gs1eFT2kcTigsEaDxM7aO9zrXV1nvZcJgmjCeGg/s=;
        b=m9Oj/f9vBQNcbXa8u5M+IAvgExwgjguvofoDX/X2QBTB+cs16ORAgCrZIH4qPZOHQD
         WIt5Ttu3wPlSu+s2r0gdk5oWswxxMOmDMDpIuYGXet28wQlXRELEWSipYY/lcltFarPx
         DPzOqesus2O2e7bdVjLtVuMwagkzoqfU9z8j0F42vrLxmc/rSUl9Rpj/V/mgxrjtVOP+
         YA57WmqxikhI+dHDhneHb3elWqWx42dWoFoXf+JSLCmutumMwNINe7HDwJEP2XIFVtRk
         72iaALXqRK62QLJWawUbwD5cBfO02a3thFluf19e0FxhRIEq3An6eNNyNZz/mSeJQnbB
         b3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745536499; x=1746141299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8gs1eFT2kcTigsEaDxM7aO9zrXV1nvZcJgmjCeGg/s=;
        b=oCN2Pv9CY06qdvQpMQNulHp76QvyAJlmUOq2NTLyW45k/E/Uo4sMmKUcqJIDLSO0Zq
         Zh3TlJQvr1TRoD4bYmLbnAcE7Rcu+BqzhDHkgkilYEfXw9TtMLKu8Q9BNYXRfqa+aUDC
         rBKVGQUn9LqPK9kCWtFEcFbzTp2YQ8/gU2eFac2q1e6UFJ/EjX3qQ9G2sX0ioqYE73MD
         wyKjglM5rUJ+P9aAR2HlAYJVRRPLHs09e0wQBSZ3VgbUIjkzFvokZQ1iAT//CA5S8qur
         a2Ha4wXzGKB/teRlxscl/7RsQ0SK9ZjERE/Nb1f1Ld0HEZGReJlOAssqL959Q2CvEV3k
         p3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWs340LeZDD1Fc377Ne40sud9Kdcf0iIcDh2MfGsDfnCbG92No4zmzZ9JrL2qVEB/6mk8v9qfWtxNxPmvaEmr/@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ4BNkRdZcwdLZfFnJDTILLmT8sZMU6h/hp3sp3By8fHPpdqOW
	MCGWoQZUtrv+MQlCt1Zp4Z1Fn+QQGvxPOngNd9mdFj6nHun9qoaEv3jm1K0aSkj6S8oMddAQEXw
	OgEO6lQ0m+nCOJV5568MSER1RIc0=
X-Gm-Gg: ASbGncv1utyPzta6cSAizDdeeu3glOQJW2DcCgRLTpD48ERfWcZ6MMJi+qg4yojpNI6
	Tvnw0qWHj0kzCVQU8v/CEzjTlMStOWJtxBfAd8QxnI5VQAJi7REIAbZ9HcKaQonHtqMZqZr5KVc
	YKE7oQPEkBTisfUnGoQPhiZPOmRR8Nzw/WcPvZEw==
X-Google-Smtp-Source: AGHT+IE/YHe0tNhYaMF75gOnF/79ImQh8cJXhRvuuQQVkEf5Rbn7XpEgOWmmcxAdQyOyipX96Oi3C6Ci8VDp5VFlVyI=
X-Received: by 2002:a5d:47a9:0:b0:39a:c9ac:cd58 with SMTP id
 ffacd0b85a97d-3a074e37565mr6270f8f.29.1745536498767; Thu, 24 Apr 2025
 16:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com> <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com> <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com> <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
In-Reply-To: <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 24 Apr 2025 16:14:47 -0700
X-Gm-Features: ATxdqUHSd3r3JNAn_frzfTxFj2BJG7Z5GLEC-zQw6e4_nKCYPS6OLcRLFS8EitM
Message-ID: <CAADnVQJjQLdc_Chvz9v2-huCb9rmi048heK-eEX30AtW10H+-Q@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/4] bpf: add struct largest member size in
 func model
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Xu Kuohai <xukuohai@huaweicloud.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Florent Revest <revest@chromium.org>, Bastien Curutchet <bastien.curutchet@bootlin.com>, 
	ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_161501_088689_AD58174E 
X-CRM114-Status: GOOD (  22.44  )
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

On Thu, Apr 24, 2025 at 6:38=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> Hi Xu,
>
> On Thu Apr 24, 2025 at 2:00 PM CEST, Xu Kuohai wrote:
> > On 4/24/2025 3:24 AM, Alexis Lothor=C3=A9 wrote:
> >> Hi Andrii,
> >>
> >> On Wed Apr 23, 2025 at 7:15 PM CEST, Andrii Nakryiko wrote:
> >>> On Thu, Apr 17, 2025 at 12:14=E2=80=AFAM Alexis Lothor=C3=A9
> >>> <alexis.lothore@bootlin.com> wrote:
> >>>>
> >>>> Hi Andrii,
> >>>>
> >>>> On Wed Apr 16, 2025 at 11:24 PM CEST, Andrii Nakryiko wrote:
> >>>>> On Fri, Apr 11, 2025 at 1:32=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF F=
oundation)
> >>>>> <alexis.lothore@bootlin.com> wrote:
>
> [...]
>
> >> Thanks for the pointer, I'll take a look at it. The more we discuss th=
is
> >> series, the less member size sounds relevant for what I'm trying to ac=
hieve
> >> here.
> >>
> >> Following Xu's comments, I have been thinking about how I could detect=
 the
> >> custom alignments and packing on structures, and I was wondering if I =
could
> >> somehow benefit from __attribute__ encoding in BTF info ([1]). But
> >> following your hint, I also see some btf_is_struct_packed() in
> >> tools/lib/bpf/btf_dump.c that could help. I'll dig this further and se=
e if
> >> I can manage to make something work with all of this.
> >>
> >
> > With DWARF info, we might not need to detect the structure alignment an=
ymore,
> > since the DW_AT_location attribute tells us where the structure paramet=
er is
> > located on the stack, and DW_AT_byte_size gives us the size of the stru=
cture.
>
> I am not sure to follow you here, because DWARF info is not accessible
> from kernel at runtime, right ? Or are you meaning that we could, at buil=
d
> time, enrich the BTF info embedded in the kernel thanks to DWARF info ?

Sounds like arm64 has complicated rules for stack alignment and
stack offset computation for passing 9th+ argument.

Since your analysis shows:
"there are about 200 functions accept 9 to 12 arguments, so adding support
for up to 12 function arguments."
I say, let's keep the existing limitation:
        if (nregs > 8)
                return -ENOTSUPP;

If there is a simple and dumb way to detect that arg9+ are scalars
with simple stack passing rules, then, sure, let's support those too,
but fancy packed/align(x)/etc let's ignore.

