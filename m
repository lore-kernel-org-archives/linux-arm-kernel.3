Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6694DC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=; b=YYjyYdqKmh1pyEaCpgNXVkMyCZ
	GOpyPQTXkCni3e2WYK/+OmZD25M88+JDpJkpDOPAOq5uX4kf8ia20ovmh2vToutr8WOj3JfT+rpC5
	0yuLE0Kgl0apBxBnFKCxsR+0hO7ZBkUlDh4kNyS6qRzMZHjls0/pzVpKoZDMMKiiZp7uNZ3qtujqs
	u351KDQrVj9qKei46AXsUpHBvc5DgmiIx4R0//SN6vAStGkD22SPfRRe+EsPmAXfNUIPc3HDEL79q
	vnV1r02LciXMEzVYmCRmZ6cFCO1+i8GGDJGUEW1hLqnq4QDm+pokNteAhDE4fmeTlkNIqMTwrfZxp
	H8TxhiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSua-00000008oAE-0uN5;
	Fri, 07 Aug 2026 22:19:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSuX-00000008o9u-3BaG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:19:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d027b7c8easo236315ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 15:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786141169; cv=none;
        d=google.com; s=arc-20260327;
        b=aFdEgRfzfkZlIdcGSwggwiZedCIRqIPRGtNriHwNby1YRopQcTA6ruAU0QzWD5eRBF
         +wHxnp/Rj4cwzHJvmEIPLQE1hsxVaA0/hEPdjDg95Kumptsa9PV5K+QQffxY/jsIY7FY
         pIhiPj1LeUdTldO8cLPdQ8H6XoCqvwDR7SmnooG1QkpUNi4v03rNoHx7r7/rscMXmyab
         y2Q4gkw/WqgPqYoueyjZXiodQ9ZVUEq8EKQziVwrrPV8QWC1pr0Gj1n/noHxzloda9bl
         ftfLk2mmQypO5bbvJzpVjIzn/3cpkk2BxW6wM/eLCRn2VMtdWaTrIXCUPVIfsY7e+OXI
         9ySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        fh=du22Ctjnd2iBpx3VoZh7vo+U25ysvfI97Rw113I8Im8=;
        b=sWLXNlMtNMSTkMYsRN90aeZvZqRXrzDlsNZXcyfyXH/OyW7c9h+ykshA3YQRvD6NDy
         seHa0RUWlKXNXKRqdVeqpXMXaX/5Uo1e3w5O65dbw1mOiz2VGkVbCj6wNg9JNKj8XWe6
         K6aH7VxnDBGydZwEbB7wF7GGioSfXvB4+5YIWtHiTToZPb15wpiUKIvZPLWvMfAqYb+v
         U+o5wVui7sKMeMvz3ZHQgwU7mJsj7K7xGc8nStqCjCrq1a/ooyt6JpB5AXghyiWan8I9
         O5IuFX5Z2Tf84MCxVM7bvgkZQ7tGLfo3naReCgZXHfujA3fsmOTc4jERM0zX3N3mH4GU
         z5Ng==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141169; x=1786745969; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=koGCSFEBiQrQoPm6uvZfmAMuU3RIp5VI16aNNI9m3echiXPyp7kPM5vGVw6ZwHxcCi
         CntiwdUgmSXnRqolG6B2OTKczMma1MyiDv/SEA9Py1SGUtaptIIFnlvqfABt45kn4DD5
         uDtTjRM9cwEXQrcbz2F+YuznX7cy1gd7AeFbLoeowgNMFtBrIoM+Vy0So4ythKJimZlf
         EdO0ki5tLgVPKoyqMsu8aaOCJURAtdtJcK7+JzTwJmd9F++KGExpSrp5TV94e2mbbZEv
         /WzLQYeSRLMHaweBjsCMuNAb46cLc/pzztXCEvPr6g0fFpK5Bt1c94MprR1ObSLypwX7
         eQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141169; x=1786745969;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9kg8y3o57QGeppntQHDvu4FgsLPM5YrqCaAU724RNaQ=;
        b=Il0y14qviidnuFAq0gAxW59MdmtmkNuKCPXPoEeUJlW8og+6G0Be57dsIBliuHUkH5
         hrbOaFV1QVmHHIyciDJaIvEju1iVyFcGJyJpqJYq3Swqoyt4hjBB8+LYu8JEJMo5zMOB
         bsqNRZhtTxPdtqybWem0v8ufkj9q6hrSCQTZ6MOgmU8zEPX/Fl9IaRZBQsqNwec06MPE
         /hXfQ5v67N4zS8ARKi8rFvX1bOTfya97bMqqeR/+WM6i18r0mIzy9geTF5YS5OyNe76N
         PsHbFyTgZ3sZGYg+GafDPGjTLGWkVDHejvib9X2YTov8lDSAbX91RRzMLs7LHMGmOOH6
         qHvA==
X-Forwarded-Encrypted: i=1; AHgh+RoDDnbhESetn1+NA7JcZM4W4D0kW4e4/i2kA+oYy8Zyj8apb6Qyb/dX70xY1UiOtbSnBExFfvHx5ikJDlO+CLOr@lists.infradead.org
X-Gm-Message-State: AOJu0YxhdHIHctmdR/pHXktAReZfFd947Y0KYOQMutI206/5QjPkStt6
	A4oMnLuBqRvL5HcnrGdlrm0NuYCbY9aZmfAreJ/w5Ew3Bj1APj0HcL4wt93gxUQTM0nijNSv+BK
	gaMZlkR8UOQxM+21/GOUSSL3JfdmBr0M=
X-Gm-Gg: AR+sD13wANmQGvC3gIZmbUs6Q8iMgWqhKbv4oPxkOha6uoCCYiHwdMXiC5BaHZ5jGL1
	PjmO+y/7mF8PoJVJm81XcUT2PzzBMuEd1khnMJFIv+nlqqwB8QgfA+1YtaR+WPnx6g50IdFzEHW
	1WQA8596lww5OSz7po/jRYlu4UfwFA4sIfEmq/gQImCV8zIjxKgSSa0zyL2JJEsrjsRBixSUE8I
	FG5HkPERuOcPw9A6lvLMMcjb9XFG6Hyoi1uI6Aao5ow4C8TSb3gOXz306X7rYZ7dB8xb8kVT2bd
	X73b0vaR+jScCS+AM0rr0BzUbmY+HXmrzaSvAKH6Bt0/OX/O/2eonPQj2GWrPiR22Qa6H/o6HQP
	JQef53tDykHzdKpka6MiZstwd1zKILV3Wor0p1C7RsFGVaqTZK7b6dG3UEoff
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr199280125ad.1.1786141168638; Fri, 07 Aug 2026
 15:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org>
In-Reply-To: <20260807221429.155946-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 00:19:13 +0200
X-Gm-Features: AUfX_mwU-H5_dufTVjV8Trje33MyfE-Oane2tYYmAglrqJ8h4ShpzMvOIUP5krs
Message-ID: <CANiq72kz2Ec119ZW2uiu0-RPHr=Zy5-WRA5tSOYk5it6PqpH2g@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: Miguel Ojeda <ojeda@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, Drew Fustini <fustini@kernel.org>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, soc@lists.linux.dev, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_151929_804349_3845B9AA 
X-CRM114-Status: GOOD (  16.11  )
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

On Sat, Aug 8, 2026 at 12:14=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> On arm and loongarch64, or under `CONFIG_BUG=3Dn`, the upcoming SRCU
> abstractions from commit
>
>   59cf3a5bda61 ("rust: sync: add SRCU abstraction")
>
> use `warn_on!`, which in turn warns:
>
>     error: constant `WARN_ON_FLAGS` is never used
>        --> rust/kernel/bug.rs:126:19
>         |
>     126 |               const WARN_ON_FLAGS: u32 =3D $crate::bug::bugflag=
_taint($crate::bindings::TAINT_WARN);
>         |                     ^^^^^^^^^^^^^
>         |
>        ::: rust/kernel/sync/srcu.rs:106:12
>         |
>     106 |           if crate::warn_on!(
>         |  ____________-
>     107 | |             // SAFETY: By the type invariants, `self` contain=
s a valid and pinned `struct srcu_struct`
>     108 | |             // and `srcu_readers_active()` only checks the ac=
tive reader count.
>     109 | |             unsafe { bindings::srcu_readers_active(ptr) }
>     110 | |         ) {
>         | |_________- in this macro invocation
>         |
>         =3D note: `-D dead-code` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>         =3D note: this error originates in the macro `crate::warn_on` (in=
 Nightly builds, run with -Z macro-backtrace for more info)
>
> The reason is that `warn_flags!` discards both arguments in those cases,
> and so the `const` becomes unused. And since it is a macro, it went
> unnoticed so far.
>
> Thus fix it by simplifying by removing the `const`.
>
> Cc: stable@vger.kernel.org
> Fixes: dff64b072708 ("rust: Add warn_on macro")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Sorry, I forgot the Cc to Tomonori:

Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>

Cheers,
Miguel

