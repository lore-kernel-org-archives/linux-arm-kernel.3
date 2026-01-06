Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40361CEFCF8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+fw2uOH7rfXDKHv296LmegV1D5QyXRSiBc8OZxA9qs=; b=tXzIG9pzBlLAfNj2EJFHC455aK
	X2/fQR8I+DMfuFP8tAqW9AFldleEUDyBcq0Vk9wMnDXnYCVj+L72LAWt4cLHI19my0Qt3BoG8lawP
	O1rYorLAabnXu8zddVuG77hgSjjCKdfTCNgpBEyYjnzSzGOYDGwA8meBtKxrRCm+7GNKeRCIAGwzl
	QatoU5k9lfK0mbRLUzvGOnsCRzHLJ1DGTY9YBiU+9oDP3uoUqy1gNZF9n9Mtsl7M0Q4U0JANKJVI0
	e3N21Hi5VFs/2m80599EgqF5dggAdqTYTK4xPX8e89vkblEnJHKrX4N89CqpizbTzZYgOersXYabS
	jW9RsbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCk6-0000000Dkz5-3iIE;
	Tue, 06 Jan 2026 19:29:22 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdCk4-0000000Dkyj-009P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 19:29:21 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-121b14efeb8so797615c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 11:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767727758; x=1768332558; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+fw2uOH7rfXDKHv296LmegV1D5QyXRSiBc8OZxA9qs=;
        b=pfNseN4Wvbg0N6RTUJm6UpYswG3n9MHgvDy4H/UbM4IrUJEVNVw4sp+aRgq4U9iPRa
         V7FFItuR5Aix9bZuL3XZ26fPBP3o4H33aajB3q97luj88HblUmlg1REYyNkHCLlhk1G5
         9sQyhlbqPgVaQuSWENXP463swxKcchWUAJLN2D1muzncCApJBQIAIMAPb7HYYHcCOWwh
         XQvDMB1wqypk12QfuoyXJGPkwU3vJMS1YSNv5jyukqb1pZPCOkP0T3rtBXlDc/kT9m1A
         exrxbCrt7nCzykXK1XAH6xSO0POy9RybsOnmUYN+nZBtpXCQX1y3utifBByJFAPKdRqj
         r2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727758; x=1768332558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+fw2uOH7rfXDKHv296LmegV1D5QyXRSiBc8OZxA9qs=;
        b=v5Mh4Fo5Rhtki/FlzTiv7LJ1HEazz7jzqaKYuiT0VdfVzpZMfhmmJMD2JAi1Yil3uo
         jC2Dy8uJG4s/FKSHvb6AQdM3KYv/mCzplyocKnE0zh2WS2JOKtZ0gaATbWwFkemOeRlQ
         hfmHP1waP7jifSyyKxa6WHFCAmG/dWrnj5hcoYmnbkUyg/yqqkB2dMPdUOIDOeHJm+lB
         ooj91fdVKphk+XhSrket8At/uhe25FVkMCibuaXHu6RclRB7asxcnjvNWcQf6nBiBDi4
         f6smuzPMyuDNsJcYiqj+JoAA406ocqrp7cQW3oXNa64y+CYk6WV8GQODlHujR7jk8Eoc
         DTtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYjQuepfqD0ACgn253NdS7C3KUDEqztE8mZmu29Vpc7kOgnzDR3hWyz+KABnMWRavO1zTQ5uVI4FiVTQnB/kPX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9XZ5SHWl0wnCvfnIp1PeNPIqwX91cbCiFEp0Y1sb7y7VucxTm
	jPKTeFg/hQM+oX6KA5WTOvDtF1lcklUS4Tex2zbRV9fy3pDdvgZpv+XlZ4edyMVa5f0TtfM9/69
	jDIKiLQ61+YfqpoSSHO/qquT/rnefO+pVQQkW3heM
X-Gm-Gg: AY/fxX5KyCvXACNKcg4J8N9i+q1VnflpE0Se1OtjVIzAQLB5HTiISbiA8HpholIzolf
	1zmQTCC/jzPNXX3WOvu6WXZEuT3FqqGpmsIbEGyJM3w5mo/F7iFCFFMATTeKPwHSRz4ndS1uVzf
	ZmB+DCNGYqasEBOybCakAGPAXMBSjMR2P7BOif+LXfFtUPE0SL+TGQhuyfkweZH2DQtqcVs+vVA
	X3J15sv/lB+DSc0YKN97FI630i57CjWe3iIeIACuBRTsCd0Kn5BVqc2IttRfjZGKxHkOta4L2VA
	/Cs+kZm4ZRf+2/segri6W2w1TSY=
X-Google-Smtp-Source: AGHT+IFiRHskLlnG7qWHcNDWY2mzjvXiWOgQovcFApO+FbQQhWbtyFRZOSXWqcX9YSAeO4iVY5BbmjGIzs+tTyqeQvA=
X-Received: by 2002:a05:7022:4199:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-121f8b67cc0mr18897c88.40.1767727757907; Tue, 06 Jan 2026
 11:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com> <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local> <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
 <aV0JkZdrZn97-d7d@tardis-2.local> <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
 <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop>
In-Reply-To: <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop>
From: Marco Elver <elver@google.com>
Date: Tue, 6 Jan 2026 20:28:41 +0100
X-Gm-Features: AQt7F2pduEl0iy3ZX0HLxlaIYaHR9bRxCAH-5viQta6DXK6OToIwGPr_JhTocFA
Message-ID: <CANpmjNPdnuCNTfo=q5VPxAfdvpeAt8DhesQu0jy+9ZpH3DcUnQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, Will Deacon <will@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_112920_044937_916A13EE 
X-CRM114-Status: GOOD (  28.86  )
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

On Tue, 6 Jan 2026 at 19:18, 'Paul E. McKenney' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On Tue, Jan 06, 2026 at 03:56:22PM +0100, Peter Zijlstra wrote:
> > On Tue, Jan 06, 2026 at 09:09:37PM +0800, Boqun Feng wrote:
> >
> > > Some C code believes a plain write to a properly aligned location is
> > > atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
> > > it's recommended to assume such), and I guess that's the case for
> > > hrtimer, if it's not much a trouble you can replace the plain write with
> > > WRITE_ONCE() on C side ;-)
> >
> > GCC used to provide this guarantee, some of the older code was written
> > on that. GCC no longer provides that guarantee (there are known cases
> > where it breaks and all that) and newer code should not rely on this.
> >
> > All such places *SHOULD* be updated to use READ_ONCE/WRITE_ONCE.
>
> Agreed!
>
> In that vein, any objections to the patch shown below?

I'd be in favor, as that's what we did in the very initial version of
KCSAN (we started strict and then loosened things up).

However, the fallout will be even more perceived "noise", despite
being legitimate data races. These config knobs were added after much
discussion in 2019/2020, somewhere around this discussion (I think
that's the one that spawned KCSAN_REPORT_VALUE_CHANGE_ONLY, can't find
the source for KCSAN_ASSUME_PLAIN_WRITES_ATOMIC):
https://lore.kernel.org/all/CAHk-=wgu-QXU83ai4XBnh7JJUo2NBW41XhLWf=7wrydR4=ZP0g@mail.gmail.com/

While the situation has gotten better since 2020, we still have latent
data races that need some thought (given papering over things blindly
with *ONCE is not right either). My recommendation these days is to
just set CONFIG_KCSAN_STRICT=y for those who care (although I'd wish
everyone cared the same amount :-)).

Should you feel the below change is appropriate for 2026, feel free to
carry it (consider this my Ack).

However, I wasn't thinking of tightening the screws until the current
set of known data races has gotten to a manageable amount (say below
50)
https://syzkaller.appspot.com/upstream?manager=ci2-upstream-kcsan-gce
Then again, on syzbot the config can remain unchanged.

Thanks,
-- Marco

>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> index 4ce4b0c0109cb..e827e24ab5d42 100644
> --- a/lib/Kconfig.kcsan
> +++ b/lib/Kconfig.kcsan
> @@ -199,7 +199,7 @@ config KCSAN_WEAK_MEMORY
>
>  config KCSAN_REPORT_VALUE_CHANGE_ONLY
>         bool "Only report races where watcher observed a data value change"
> -       default y
> +       default n
>         depends on !KCSAN_STRICT
>         help
>           If enabled and a conflicting write is observed via a watchpoint, but
> @@ -208,7 +208,7 @@ config KCSAN_REPORT_VALUE_CHANGE_ONLY
>
>  config KCSAN_ASSUME_PLAIN_WRITES_ATOMIC
>         bool "Assume that plain aligned writes up to word size are atomic"
> -       default y
> +       default n
>         depends on !KCSAN_STRICT
>         help
>           Assume that plain aligned writes up to word size are atomic by
>

