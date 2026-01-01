Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585F3EEB577
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALybukQ368MxKZuRBiA6l9FsoHeskqo5LiIi7UTqkwI=; b=YKEDjep0qX5df4D42DlaUJ/Idt
	mkyAWHA9cUDS72vQydByfl0KdA7ZZOTh+D4VUN+is1rAcw728YII82Ie2F+/LK02kgI0gqaBBCtOe
	y0vmiJGGmy7EqrYsHLzqP8VM85rtvUXPy8YQ72eO0rAtn8Sfl02hOkSZa4JGtGyoTOcSc5KJcUXqR
	h9/3ycqNK1RyE8l/G331nemKRigBB2FaNo5tVIJyKYXyiBQF7w2fmKA3dK9yRK0JEQSAPt5qmAz1k
	T/NXt9HV+JVnzOrdN93bi6GC9DIQdKOMkQKmfxSuLjv7vOspqvjARIarGQTAyP2P7PWYmlKlFZyi8
	qoExQ/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6wm-00000006TdE-3Noa;
	Thu, 01 Jan 2026 00:53:48 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb6wh-00000006TcM-2DEQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 00:53:45 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b72de28c849so985494266b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 16:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767228821; x=1767833621; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALybukQ368MxKZuRBiA6l9FsoHeskqo5LiIi7UTqkwI=;
        b=LScl5IfgswaHXByz274fzIkSRjexXZ2ZDjy1sjaiZzQnJzTpJSXZW5azgBe7RQjYGx
         fjkd9UThC+g/xQUKPt2adgyEaZay3F8P6vQPQs9tkE2JENj9Cp3rvrvYNQjEhmQyKKMm
         PWlXGZDkjf5z34FCTFBspH7u3VYWpjULIfQ2U3f2SWs+JI0yn5VWyLj4NxOYmZd+ZY9w
         /sntEfOT6xMuaP8ZCFVWYNC2SAl4qV7WbHcH/w2sOl2R9ArDj5OlaMFUXHX3fTspQ2KA
         4HzhdBJtpoejK7D3g1zOz4/oShLlwJy5Yg845oZy1MatrpVYUqCfwHfwJbi2ZhrMXreK
         r7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767228821; x=1767833621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALybukQ368MxKZuRBiA6l9FsoHeskqo5LiIi7UTqkwI=;
        b=rOg27kAgSrrYRTDUyAWB9HVRf33/7oQ3sKL4+t04YYjwAJ83/+FUfEJBovS1+RDvSZ
         awLpVwcUN9XQd5cEl/jI0iDdNHX8N38ptsT1/CTX8PEH9XaMEIbFURoeZs3CxIUrkIW/
         Bf1K4VApcXPJykmWgJRWTRaWHOt9DnENztwZ9DJHaScHsgSDz0svvRhSlqDPNUxKFYub
         nav6vcbAeYhk4JMqHujgYhRzZG9gW9gMvH544XCoAAq2PMLGjclxPwfS0scvUIFtZgZ9
         rnWky2GbN3O8zwemxYggcrpDR92AY2ZK4/B/8lHyqmjcNlOAptaqSxMmD9ih++6YnpqZ
         h8pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxlyNv6yJBJbpUQF2UfmdTryT1FuiYFJqus0X8TJZfY0WdIMdcQ+bUH7RnAZGHQJaWqqDidX6OvGtRYKX4hTnz@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwk7V1ISVDFmhSrC1N6Eod+VI0s1aCPUyqFjh8FboFuJyP28yR
	Gft3RpeKNF/Jg6eEQbdtD1fvGmkDk4ZISxxyeMNquuKjpOeShoKoYc9L1ODDT90j+0SPWvHLh8e
	TLpCwcXgv5axpVFUxuw==
X-Google-Smtp-Source: AGHT+IEWmy8RAXCgqnhUehDWXxrrCi36bifjxhWe3kp7T+r3sxEL7vClkSWEcaAst8kVOoT68CYG7PpgofIxyHk=
X-Received: from ejcul5.prod.google.com ([2002:a17:907:ca85:b0:b7f:fed7:3bc2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f23:b0:b76:6020:ed2b with SMTP id a640c23a62f3a-b80371970a2mr3724571266b.45.1767228820647;
 Wed, 31 Dec 2025 16:53:40 -0800 (PST)
Date: Thu, 1 Jan 2026 00:53:39 +0000
In-Reply-To: <20251231151216.23446b64.gary@garyguo.net>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231151216.23446b64.gary@garyguo.net>
Message-ID: <aVXFk0L-FegoVJpC@google.com>
Subject: Re: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_165343_609495_42309679 
X-CRM114-Status: GOOD (  23.58  )
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

On Wed, Dec 31, 2025 at 03:12:16PM +0000, Gary Guo wrote:
> On Wed, 31 Dec 2025 12:22:24 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > There are currently a few places in the kernel where we use volatile
> > reads when we really should be using `READ_ONCE`. To make it possible to
> > replace these with proper `READ_ONCE` calls, introduce a Rust version of
> > `READ_ONCE`.
> > 
> > A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
> > that Rust is able to use conditional compilation to implement READ_ONCE
> > in terms of either a volatile read, or by calling into a C helper
> > function, depending on the architecture.
> > 
> > This series is intended to be merged through ATOMIC INFRASTRUCTURE.
> 
> Hi Alice,
> 
> I would prefer not to expose the READ_ONCE/WRITE_ONCE functions, at
> least not with their atomic semantics.
> 
> Both callsites that you have converted should be using
> 
> 	Atomic::from_ptr().load(Relaxed)
> 
> Please refer to the documentation of `Atomic` about this. Fujita has a
> series that expand the type to u8/u16 if you need narrower accesses.

Why? If we say that we're using the LKMM, then it seems confusing to not
have a READ_ONCE() for cases where we interact with C code, and that C
code documents that READ_ONCE() should be used.

Alice

