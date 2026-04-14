Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47BCF9D0D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 15:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=; b=wucIcHEyuMZ9Ga9Q/amF//rY3h
	qFVhKTILQQYMYJATBvGXiD7U2uHjpoTNps8SxwSNV+TUnT1a1XTuyg3HjzalCyI0e7zIV74+67M5P
	R2OT0Ytw59vO3FMFTaDJI5uZBhq0+ZRhXcb81C5krYy8rAwcynRwBt8zTVWhhQ9233SdQsSbdU4f7
	GtnOIkAQO/TWv41U0mz9vPUVlQSsmHgAkWvNsm2c4tGQQEwJOlfQvIC+3kbEen+FDAxkN16s0TUsz
	PBDtwB/vJ3hWl9A/jH4QRZPyCw+vdedfCWxfIzJpsgLfciUt+7cNZrkgeIQu3Re23tR7z8Ernj0wx
	AsuuiJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfPF-0000000HV4e-2RtE;
	Tue, 14 Apr 2026 15:10:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCfPD-0000000HV4B-1Evh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 15:10:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43d75312379so1645736f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 08:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776179421; cv=none;
        d=google.com; s=arc-20240605;
        b=V/HPnj82MmfWgg53K1SErKRWqVa2aeT4RjRsTOzVfD++uyaH28riCaov5vVqh7wpGN
         Kbwi3XNkC9cxYa2duCs4ophofgAoccaSA1wEtnxzKULNMedx8kynDsIKTj+Pqe99Ki+G
         RrWG4cLMchXt32ev6iKsWttWXLRN83YlPi2y0QjZbKT6LUD96jzLBPiHOX3N5bqVpapT
         vuviywqH9a/P7F8XPghlOHsBlkTWEIKaCAxqY7QaLLaTZFHQV/XhslH6DfcdtFLt2b7+
         HYUpolOenbWo0gO3JJXBD9LZb0rYahyMJaL7ln+RXIqTi41Zau2Cj+/cKX2kLlZrBKNZ
         nWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
        fh=K5LAWYWmHJXuvpZubeaQSq0QjTs9ilhdONYY+iGb81E=;
        b=XJn+CS2i5NcSZadh1b+RLZFMaO0PIcNBTZCVDO/gPU3+ndjyP3J500WsL19DzvaYsa
         eHeEfokDQOIMyBI7MtAZ6AeHKCQ5M9Zl1RJNglxl5fSA8Tmmz/vtAZX7softD2TSg5f5
         nBIRAr1fh3u0L5PzF6SLtkt2PoqCfXtczBqOKVMUFNMfcsbRDqgTmtnzVx9tofi6KbrS
         1uSJCitvUZLThgvvUAKPxLsZ3jDB7cjZSxE4vJQvseFRz0oFoWye7BgbWiH8Cjwmt82P
         HeqeMT+3gPVLujEmXFNjEViWiZWfYvPt9Yd16bAcJS+/u+hn9Rsg9L6wPtOoDRtQKWHt
         qo3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776179421; x=1776784221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
        b=JTVGE5NMxFtH6tS7UhH7oBQ1lY34YzorpilLjUlpU1T53O+o5WtytTdDbmesomVeYI
         FgOjnHhNpMbWG+xftGNwUYjTNIGAdOT3YFnk/7NQDLWK35R3mlFzUEuUtm77nh1k6SJA
         BRTO+KBsY0vOjOnlHrjyT4tWQJjO9jl33yNuKdUbaiAUBWsSNRF23NRIq6ORx2ltjN7y
         S4sAXUYYjY66KC1UmOec3IiZ8nqlUafhoEW9xEnYqfwUR1Km3glvwlTkdTyaWIVfdy4x
         CTuH+sm0MOSyn+n9Cha1SUI2tUmlerA9vu/cQ29LxLs1zzZ/bgLzk5ng7S/guEpIQLrP
         HkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179421; x=1776784221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7c7tKPqaKq3NgFiv2DNK8q/BvKoh1wbxDHgCCrA1+c=;
        b=FKtRTSlr4gntT4uTOpp8cUfXIkHJsLC3+sHxUBETrJvOD4mcKkrJYaS6nF0yotuDF6
         d1ejRIvO4gBVJ8N0vIO+9lyRMNRfGRsn6zM3541gqhX5EkGAhx83kM1RKxzaI/VMGwyY
         Byt+70EL6b3kKj0a3w+40Ds2c0wBNotpKOU7IsKtiwH26TPBGxugsz5HlGo5ZZGGeXhk
         zZP9U1TsvMUgBrIuqPBvTc+oL4MDY7NwKlPTnIaWUUlZVbHVZF5gO+xOCeqQAIrD6hrw
         OYKNM8RUPI1noFJaXRWYw3A5HN/fHhcGfwcCFu58iJTEypF8uOWBlGyV4n8HFTKE2AJe
         tVRw==
X-Forwarded-Encrypted: i=1; AFNElJ9iSSSR5ZPJAVTMZHX4S2tcSbgeu5Muf6h3WeFTaUbdtBb+Zju2wcNwL8vtaOYaheWPiCef9/BKCzoTKNJS5Cxr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr8BwRilL1ywlCQhsD2YfJkk1Dziy6b1vdO7nEDzm8v/CIrLGO
	5REe7k6tI9DswkDtEo+WjuOBsY8cqf4TQ73lkKmz/CtHNpyW+LsKKSVR+jI3hqvuiZoitpL9ZA5
	fZPtCXjxHjgM0VtT7Ki5z9ZhD24Knt6M=
X-Gm-Gg: AeBDiesBXdJKhkgaOzBAVvbU+CBb5z11m2qfuLohDXCz+PJxs63UjfNtwUTWymCFLax
	AoLSJJ9FGuGybRBnq0ScOc8tuyLAx3y5QoyYIH7WhmICBgLUVAQ+6/SPPWdj0zLn6ti6u+nnCW3
	bzPemJn+pbxhy3KCIsHnVdpYbm+9o1Mtp4xVhe3cQo1QfJSEHSFJ/CkATCTSlKJIkCuSxt1wceG
	PmDcHcv2NJwne6RFF0WoBEgs3fDqOxytmOh7EyNAZ3yTI9xEaPK3YKi0CUSc29mzG5KeML2ahKv
	iRVwlHNJlzpxekf1GXklxuGztkkt4OvqE9AFeUvE
X-Received: by 2002:a05:6000:4110:b0:43e:a8cc:89b7 with SMTP id
 ffacd0b85a97d-43ea8cc8c24mr1517128f8f.3.1776179420992; Tue, 14 Apr 2026
 08:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
In-Reply-To: <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 14 Apr 2026 17:10:08 +0200
X-Gm-Features: AQROBzAtXSFwPeCMpZ2dGca-DBLsSXREgEyBZSQFf7Waht1WxQ2QIbb8WTtAIYs
Message-ID: <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-CRM114-CacheID: sfid-20260414_081023_384752_942881E2 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue, Apr 14, 2026 at 4:36=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> > ACK, I'll try to use those kasan_check_read and kasan_check_write rathe=
r
> > than __asan_{load,store}X.
>
> No. The performance penalty will be too high.

With using __asan_load/storeX(), it will be one function call to get
to check_region_inline(): __asan_load/storeX->check_region_inline.

With kasan_check_read/write(), right now, it would be two function
calls: __kasan_check_read->kasan_check_range->check_region_inline.

I doubt an extra function call would make a difference in terms of
performance: the shadow checking itself is also expensive.

But if the second call is a concern, we can move kasan_check_range()
and lower-level functions into mm/kasan/generic.h and include it into
shadow.c, and then it will be just one function call.

To improve performance further, the JIT compiler could emit inlined
shadow checking instructions, same as the C compiler does with
KASAN_INLINE=3Dy.

> hw_tags won't work without corresponding JIT work.

You probably meant SW_TAGS here.

HW_TAGS will likely just work without any JIT changes (even the
kasan_check_byte() thing I mentioned should not be required), assuming
JIT'ed BPF code just accesses kernel-returned pointers as is.

> I see no point sacrificing performance for aesthetics.

With the change I suggested above, there would be no performance
difference. And the code stays cleaner.

> __asan_load/storeX is what compilers emit.

For Generic mode. For SW_TAGS, the function names are different.
Keeping this detail within the KASAN code is cleaner.


> In that sense JIT is a compiler it should emit exactly the same.

