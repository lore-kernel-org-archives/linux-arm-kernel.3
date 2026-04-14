Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90307F9D0EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=; b=d66HaDhrSTIj8rgNrR0bSdJ15v
	I3cc53XAywhL19Gr4Dw7OSOvOeA+qqL9r/OXAZHFyAIHh2YbY+ME7kOdkjOuLhXcTW5NJ+yX+3qPk
	7Vm5OJDE+jPWXOgR3SY1oLjmHqMKnmHIodg9A9+7932s6bW08xHN0QA7AnYxVziuJhxQ9gC4gmV8w
	Mlkzb+TpYNFo0zZ4Y9q0apyKbotBkBp7Weo9Zyxfs3hQLlGbxTPJIho031cte+r+lpVoFUk9GQX7D
	+0G+1zcELXfNzNGz8MY38ycWKziDlP0oC1fbn/WphTtULmby4e0EmzGyPH7CYRKuHO/n6DaPu7Aw0
	3z0qj3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjFF-000000008VK-3EXg;
	Tue, 14 Apr 2026 19:16:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjFD-000000008Uj-0fwt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:16:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso72747765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776194177; cv=none;
        d=google.com; s=arc-20240605;
        b=b4oq88VJ06ctaWgL56Jq+QTHKiF2Y+MnBqQr5QxEeNg2vuZl99tyn+9m09GShsrWRT
         NtGY5TYDamM0ZEzuCuhVQkuPJ0F15sNy8CXOBbi0vgTLLJkKKR36qsYq2LVp/hMCj7at
         W+87dZgB+M/0l+3aXzISIQdNHgRrlu5BVWbwS/RiPZMuoU3yuJF/dkK4hdoU3CedI1Q1
         zLfYCIp/EO/LLtJ0B+YjFyXe30nYQ83Oq+oFT5fSYDSUgX63xaADAUYtZSYPCzs1PoK3
         1ato+c2MIpo/KVuazyWcHcnfvBH1wHqp7Yv0Er+vJSvh2eHitpe06k7+Ror3pnszfWpA
         QSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
        fh=Cqbj9ZH1GMjcYu5/+/qsE+O47M43oURmn2yYfzdSrrU=;
        b=LrZJe0gqr9cJ20tW2VllCWnUkyHiUIcTFmY33mWLwGV/ex6Dhim2/NNbAs8zg+l/uM
         qyzwgPWIwbyDmiQ/gulVmtPj2ZaFWo6DcuhVw7ktVTtLaVk/QxxxLOGgphQeLyVXnMuk
         I3wKXuWXH4/PLdDzWNtOYJaojzwZDLcuRsqahJ4DdPbHm/cBd0ROla+bPwOpXngdMUQI
         2Z+6xfc92KSfFe/apqUvJiO0h9vt+xIXNsh04z2Dyz479ryUUKGPYPynNBhl7if93RzG
         7qPWcxHpwW+IxejlVmBvq/CermKp8l6KFHwinBgumk+ADs/E5s0wDg7y3IKXKpmIf01I
         iLVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776194177; x=1776798977; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
        b=WHf6VXWeouSg0C4l6xA8rSRtzdkAFZAvk19jhLsQUR2e1Y3w0e2pQyo+uyYKH6nazB
         Ivxj/pZwTFFqAtdlPGzIUATH2OuEz9So08/QdZ1kcn5UEAaJeSkcJEftPCI/bYq50xQd
         lBWDv/2yXAGnfE7D8B5+CFNmGHDP8iRlQkqKJ1UW7WmVtRbkZ5fCPl5fFoCN3mw0Yo41
         zPFvcGHaLPkRvmUzDm70Q0iXqh2coiKJrPV63RWqRIwx/rLriOSsFAYzpHOLWQ7+KnRp
         f1D7GjbyMBEQWe1lUqwLeiLmYxSe5mIggYGGGM4dJb40/TTTQZ7M8iMDpob+2wcee5RO
         nELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776194177; x=1776798977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pa9Tyq9G0aEPQgad+vwhYFPvxVvYUvSmDxYTMccNEa8=;
        b=ceZ5gcImj7QER0scUDNysOLEs5+6M5S0bmj5beLDssIpKTC5PIbihvN7JBXapK2HT5
         BDwcv66Ko8JPml4F4mDeUsnSunpEUXK+KWjZCgWcIxSsJU+xqeiNUK/Ambm+9y28deAs
         05ceA4talwiv4rAdsQZ1Gl6tS8mKFs7VONf5YREYAtLNA5Ksl75EDkxlYWyRc2xGNKOQ
         7w0w6MffvRaWn0Bf+NZEYHWrbMKGNXRkjnnsiRAYosONWVBeVARHND/uK/CiIoGKv3/4
         NcxCF0O1uEO03uBNHxvuW4nDXetAhNl32jwGkDEy6FqBlgt/v3DReIFtwq1JwNEgOepr
         vgkg==
X-Forwarded-Encrypted: i=1; AFNElJ9X2NbvE2h8ip7IjlTYdPyajWgND/cz6e5Q1xcMYFtZOwRJ02VVuNQbC9j1aw+UBWEfphYQrK7dmKsX8sSLEx8N@lists.infradead.org
X-Gm-Message-State: AOJu0Yx19d6ae89Oc7RZWoyfXZWZnU9Y0JddjY8dsno4suj8tjfNvbyS
	btP8t4eYYi+IIbR9Uu2z+UgBBf/ZpNCc+tBQFonIqYSv0Y/iNoEYNj7zS1hwaIZ3tnYScN8WAm1
	+hrm07hV4TuWDRJGodCf4tR7OrFqxaRk=
X-Gm-Gg: AeBDieszxcwk9CaGyxCjwi5rjSoTVRJAx7WHKyWAO/6iXkU/rsVBYASYgR1jr3RmxAr
	0A9MwHp8m1cu9KCGwgTnQQyvSslhHzlbzd+O1qhsbCH7b2LK/o4Xaplhe15471D4swu0jeFCeS3
	gA2Fo/NZauVEYNuYpFHqmID7cC0V5mB4b0Zb+xAYa/TNU8rUIw9zBxYhsDXXJZooHJTDhq06Qw8
	cSkYtHS9NXDqiGQOQtZi0C3fyRR61qpRdXtyWEU6pl6CrHgaQRQ7QgpUMT6I34JZv5LMAYXztnB
	xRTyEVQ6cIg0aIHdMC+Fjdo5b5pBqd3Uw9hboyAAnHoiKLnvuZ8GJ6ZHNsPyQQBKRH43gkWi3gz
	Au4gGLYOwZjGqgYe6xeLGxaacVv6IVIRyra+l
X-Received: by 2002:a05:600c:1f83:b0:488:b99b:4177 with SMTP id
 5b1f17b1804b1-488d687bf61mr256552315e9.25.1776194176915; Tue, 14 Apr 2026
 12:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com> <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com> <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
In-Reply-To: <DHT3JV7GTOBL.29205LGGNEDSH@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 12:16:05 -0700
X-Gm-Features: AQROBzCIKxzyzm1_jzBBwpYG5l-_Hq5ftS9HvYZuKsAkHlvW0CNWB1k5nfXPFjQ
Message-ID: <CAADnVQ+c9h_wuNwj8pjx885oNErGY7bxxCwKi+DiJ0XKSpyYfg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 1/8] kasan: expose generic kasan helpers
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260414_121619_244928_474BF761 
X-CRM114-Status: GOOD (  27.43  )
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

On Tue, Apr 14, 2026 at 11:41=E2=80=AFAM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Tue Apr 14, 2026 at 4:36 PM CEST, Alexei Starovoitov wrote:
> > On Tue, Apr 14, 2026 at 6:13=E2=80=AFAM Alexis Lothor=C3=A9
> > <alexis.lothore@bootlin.com> wrote:
> >>
> >> Hi Andrey, thanks for the prompt review !
> >>
> >> On Tue Apr 14, 2026 at 12:19 AM CEST, Andrey Konovalov wrote:
> >> > On Mon, Apr 13, 2026 at 8:29=E2=80=AFPM Alexis Lothor=C3=A9 (eBPF Fo=
undation)
> >> > <alexis.lothore@bootlin.com> wrote:
> >> >>
> >>
> >> [...]
> >>
> >> >> +#ifdef CONFIG_KASAN_GENERIC
> >> >> +void __asan_load1(void *p);
> >> >> +void __asan_store1(void *p);
> >> >> +void __asan_load2(void *p);
> >> >> +void __asan_store2(void *p);
> >> >> +void __asan_load4(void *p);
> >> >> +void __asan_store4(void *p);
> >> >> +void __asan_load8(void *p);
> >> >> +void __asan_store8(void *p);
> >> >> +void __asan_load16(void *p);
> >> >> +void __asan_store16(void *p);
> >> >> +#endif /* CONFIG_KASAN_GENERIC */
> >> >
> >> > This looks ugly, let's not do this unless it's really required.
> >> >
> >> > You can just use kasan_check_read/write() instead - these are public
> >> > wrappers around the same shadow memory checking functions. And they
> >> > also work with the SW_TAGS mode, in case the BPF would want to use
> >> > that mode at some point. (For HW_TAGS, we only have kasan_check_byte=
()
> >> > that checks a single byte, but it can be extended in the future if
> >> > required to be used by BPF.)
> >>
> >> ACK, I'll try to use those kasan_check_read and kasan_check_write rath=
er
> >> than __asan_{load,store}X.
> >
> > No. The performance penalty will be too high.
>
> Since we are mentioning it, I did not consider yet any performance
> comparision/benchmarking (and I am not really familiar with usual bpf
> performance validation practices for new bpf features). Is there any
> existing test I should take a look at for this ? Maybe some specific
> benches in tools/testing/selftests/bpf/bench ?

So far everything in bpf/bench/ measures bpf infra like
maps, kprobes, tracepoints, etc.
We don't have benchmarks for bpf programs.
So we don't know how well JITs are generating code
and how much inlining done by the verifier, JITs actually helps.

Puranjay is working on creating a SPECint like set of benchmarks.

For this kasan work we should make the best decisions from
performance point of view, like not wasting unnecessary call
and not saving unnecessary registers. btw in the other patch
I think you can skip saving of r10 and r11.
But we cannot quantify yet that avoiding extra call gives us N%.

You can micro-benchmark, of course, but gotta be careful
interpreting the results. It might be too easy to get into
thinking that JIT must inline __asan_load() for the sake of performance.

