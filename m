Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2533D16818
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8T/N0YjJdMPLkCw5fXXL5pxg8eGLGcQ3fujG7tmwcHw=; b=wVrB9OVdQQgNANotcYLuxhATD/
	cfzcBX3Pdw1LKsGDHJB7mQhrDxqSrz68iCVL79wfMLrRFbkNL5lRzAg8K0DbabVKsDGMh92AMQMVN
	ZwhfilqJ8ZBg3jFD0jeO5MVF9GU+hlmGIbpcXHg0PLU4sOSSKYSkZHIr+n3ziDE990UPeucM0tp7x
	s/ftZMlIcjz70Y3CyWD4HwLszSyso2t9qWNsuuhhJvHk7j9vqeJH0kRS9c3l5A9zUfYxwDUpeX9eO
	2z3w8o0jz6km47n9pjLbmsPUrrG/RdV5ngJg0mZY15kpiCSRdsO1Ztf8sW1y1FvMLMoiv08ensf3+
	QSAPhF2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBAt-00000002GnQ-3Fgr;
	Fri, 09 Jan 2026 12:01:05 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veBAr-00000002Gmb-0gDQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 12:01:02 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-11f42e97340so346826c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 04:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767960056; x=1768564856; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8T/N0YjJdMPLkCw5fXXL5pxg8eGLGcQ3fujG7tmwcHw=;
        b=u72Ouufw93KI56qIno6+fM0MSQ8UksKzHvK8sqVXlql7yCf6Wp7Wa4KAhubrQY6fZE
         Vn57GkVvJW2wyKkuDUtUnoS6iiZPc0Xq1FtRg6InxNsfmvdjRXEeQK7tqsPPC1IrGPPx
         UCqEMC8IaIfOM3AbLXs5ytCGpq0hsdocz+dMP9m3/mbGneRdReFH/2ZdJCoQYGKx1P2v
         t8mcy5L5M/ArXemRFcujT2c5OZEaNfCoNoz2zuwi9W28Kg6Tju5VPLGzT/kSKjpbXBFI
         SjK6/1T5tKRuUYk2oybM9TrTZpxgrSjG/ovnq58UfPEDkyarnQeDVnB7Uv5piDhhI4dC
         4Psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767960056; x=1768564856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8T/N0YjJdMPLkCw5fXXL5pxg8eGLGcQ3fujG7tmwcHw=;
        b=FQ7CzHbgWS5JON2oJL+BfFWQYhOrdvev6KdX3s0S/n4H2nUB5dhD14Bgs5VnpcEqE6
         wgmKF3NeS0qHg4apCna/OCuRLdO/3dlEcXt2uMyl5SOO7QHmzoXqN7CXZv19uQaZAWof
         LVyBpNXw7wr3gUMCqnSNVW1xCIdtdscOD9h3rA+WFhHodAJ5dYlHlx7kblbUGNkBqrDL
         Llb0rncd3FsSEEBWF2sOCMYCT1qT5Q7ZvH3Vzzs+s/H24yK9YmqDpukdTqdLtEbB9ZTU
         dSFhhT9hjheiiCKObuXXsRqwbRtFtXdNiadEFhJBwIR3LJcfJY1zGGY30MjII2TuqJ26
         sk4w==
X-Forwarded-Encrypted: i=1; AJvYcCXU4gVK253KVYn8G+qo/aXyC5a3nPCzE1ZWu6d74ScTKAMlLTPGn373LZVTXNeamb2CjsDHM8GtBtyhnsqh97Ri@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+mVw2SSN1hubYR7ClYJ05Q0/DuZwXAVwaz17C0YwiqXOji6jP
	f4JgrYWJRnj5WVT5Bi6X0OjEp+ilKWzv66mgK3JYJjAKNgBE1t1JGfqWkh5Gt3cBRPbV1xJyLTt
	FxUVKcf0/FS/KQHslspl8dhPH1EMoG9K/TPk3fMpn
X-Gm-Gg: AY/fxX6BVbyxAhQWzTAa7msMNYRclrFQhx3/Zxk9yNBOIPB0U8Aaohl3KAgUXlRKVIY
	XPnC2SdDZwD54b3GZR0dau+OH12ih651Pd7DkZKLuwU0Q8t3CSBk0PZPVcZIJdmCZUgxFqxGgmF
	UfAXhk01GB07FlliJNKgzZGB9nu6px5T9jICJ9M4PHPnWlCCC/epz1URIc+cudc24qZktu58LeU
	+ddyGDSaELUytmTkeCNBkT7tvYCFkdFUFgqufNUU52Jo5cEEnOipZOqFQoTQvv6/UAhjLE3Edb7
	R4rmAVoGbQneaL2VEbKibIdm1ag=
X-Google-Smtp-Source: AGHT+IHkqsIfmF0FluQuDu53MIRkzwgbeeQdzuawZsTGXquSsN/434sV7j/4310j+FEbQ9rNU7DnJdRzHaNlwPlcWDM=
X-Received: by 2002:a05:7022:4199:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-121f8b67cc0mr8303949c88.40.1767960054556; Fri, 09 Jan 2026
 04:00:54 -0800 (PST)
MIME-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231151216.23446b64.gary@garyguo.net>
 <aVXFk0L-FegoVJpC@google.com> <OFUIwAYmy6idQxDq-A3A_s2zDlhfKE9JmkSgcK40K8okU1OE_noL1rN6nUZD03AX6ixo4Xgfhi5C4XLl5RJlfA==@protonmail.internalid>
 <aVXKP8vQ6uAxtazT@tardis-2.local> <87fr8ij4le.fsf@t14s.mail-host-address-is-not-set>
 <aV0JkZdrZn97-d7d@tardis-2.local> <20260106145622.GB3707837@noisy.programming.kicks-ass.net>
 <7fa2c07e-acf9-4f9a-b056-4d4254ea61e5@paulmck-laptop> <CANpmjNPdnuCNTfo=q5VPxAfdvpeAt8DhesQu0jy+9ZpH3DcUnQ@mail.gmail.com>
 <b0f3b2a6-e69c-4718-9f05-607b8c02d745@paulmck-laptop>
In-Reply-To: <b0f3b2a6-e69c-4718-9f05-607b8c02d745@paulmck-laptop>
From: Marco Elver <elver@google.com>
Date: Fri, 9 Jan 2026 13:00:00 +0100
X-Gm-Features: AQt7F2pBr33IaeEZzEbVtkwEGkq72MjCI-S9aarJ4oQjqFT6bTaIuZHUMWVHI0k
Message-ID: <CANpmjNNSCNm+A=nKdeSDAkcgiKXMEdcQUeMb4PZxWoP2t-z=3A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260109_040101_246419_981DE5E0 
X-CRM114-Status: GOOD (  32.50  )
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

On Fri, 9 Jan 2026 at 03:09, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 08:28:41PM +0100, Marco Elver wrote:
> > On Tue, 6 Jan 2026 at 19:18, 'Paul E. McKenney' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > > On Tue, Jan 06, 2026 at 03:56:22PM +0100, Peter Zijlstra wrote:
> > > > On Tue, Jan 06, 2026 at 09:09:37PM +0800, Boqun Feng wrote:
> > > >
> > > > > Some C code believes a plain write to a properly aligned location is
> > > > > atomic (see KCSAN_ASSUME_PLAIN_WRITES_ATOMIC, and no, this doesn't mean
> > > > > it's recommended to assume such), and I guess that's the case for
> > > > > hrtimer, if it's not much a trouble you can replace the plain write with
> > > > > WRITE_ONCE() on C side ;-)
> > > >
> > > > GCC used to provide this guarantee, some of the older code was written
> > > > on that. GCC no longer provides that guarantee (there are known cases
> > > > where it breaks and all that) and newer code should not rely on this.
> > > >
> > > > All such places *SHOULD* be updated to use READ_ONCE/WRITE_ONCE.
> > >
> > > Agreed!
> > >
> > > In that vein, any objections to the patch shown below?
> >
> > I'd be in favor, as that's what we did in the very initial version of
> > KCSAN (we started strict and then loosened things up).
> >
> > However, the fallout will be even more perceived "noise", despite
> > being legitimate data races. These config knobs were added after much
> > discussion in 2019/2020, somewhere around this discussion (I think
> > that's the one that spawned KCSAN_REPORT_VALUE_CHANGE_ONLY, can't find
> > the source for KCSAN_ASSUME_PLAIN_WRITES_ATOMIC):
> > https://lore.kernel.org/all/CAHk-=wgu-QXU83ai4XBnh7JJUo2NBW41XhLWf=7wrydR4=ZP0g@mail.gmail.com/
>
> Fair point!
>
> > While the situation has gotten better since 2020, we still have latent
> > data races that need some thought (given papering over things blindly
> > with *ONCE is not right either). My recommendation these days is to
> > just set CONFIG_KCSAN_STRICT=y for those who care (although I'd wish
> > everyone cared the same amount :-)).
> >
> > Should you feel the below change is appropriate for 2026, feel free to
> > carry it (consider this my Ack).
> >
> > However, I wasn't thinking of tightening the screws until the current
> > set of known data races has gotten to a manageable amount (say below
> > 50)
> > https://syzkaller.appspot.com/upstream?manager=ci2-upstream-kcsan-gce
> > Then again, on syzbot the config can remain unchanged.
>
> Is there an easy way to map from a report to the SHA-1 that the
> corresponding test ran against?  Probably me being blind, but I am not
> seeing it.  Though I do very much like the symbolic names in those
> stack traces!

When viewing a report page, at the bottom in the "Crashes" table it's
in the "Commit" column.

