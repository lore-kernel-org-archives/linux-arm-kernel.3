Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5441C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=; b=SuA9izk3/Z7ognB17SNjN49Xqv
	uP0MchgwcrfJ26BCkheGgtj39KlMuEupQL5Zq04zq6xB4FhSwmJaRd83Yhr0puq59F0xpZX+1w5lM
	CVt3eEsa4whv1G2TA22ZXQBGO/zGDSPxmFL5iOl5K8NyMFYkLCPfF2eGDieLL0vACt1CNl0w3CMIu
	9fmvNoqpYA7AkLVXekdqk2jJRY5vqa0kqhmrP7imT6vgLXhYJFoSSpEP8Ilqf9HOwNfKxTxAXFYrp
	CGwK+uyWPyNJD5vYSk4uMb2lixnFlewOvT2ir+aZssbBFBtBVo4eqoxUXZUAeylCvPh506EbcCt5j
	6LMWrQhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thoD4-00000003Uxh-2ri0;
	Tue, 11 Feb 2025 11:13:46 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thoAH-00000003UNI-1VSp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 11:10:55 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e549b0f8d57so4654405276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 03:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1739272249; x=1739877049; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=;
        b=roOeFUlRP7ACog7kNSXD30UZ7sl/4E5AGg+QqbXONWroWanE5a3RCiniqIgWMztsW4
         jDuVpxKF4OxDWLGsZPi2/K7lcr4cFXj3+CehIsfXe30Dj0K5oiXV0f7WlTlke9VZps7G
         PJVnUClN9XuHO57IqzEvI5ESWjGZe9u5NJvuf85HOJPQM4omkgQRCQ4eGau3J49RzTGD
         PdvnpYWntDKwFboTuCP0o2/QONtgyV9/TLBZVDt9aPXeU2p26bbCCA+/jaCCt4fYGsuk
         dlxW/+CqRAm42PkTwN1r+Xrc+VEXN8DPeQYkKwWdf41Ub8rpfHx8wjC1mQpnmCQ/hTxU
         YJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739272249; x=1739877049;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPNCIgpBAFQQZU10UukFXE6nijs336odSMhelfSJ0j4=;
        b=ExEJT/B3ewTRkaK2uRusE8I8jWY+hzuwd+RRpMm/AIRCzhrarJpRPEp4MiyXRXvtUc
         1pXDXlawkNhBGbVf5qAcDA5YcMvtpUSY869tRbfqKT1k0Mouxkc9nDc9hWOsu+yGTpHm
         7K8Vlv055P8V+r5SsM301xFKslEUdsMZERX7Xt2J4OmjmHCBJIe6kiIugdO/87bokrA9
         uxYK2POyW+s5M8AYKZVYLzo96DPWHriqkHwvqTv2/A6MlkB17WU0UpNnJv+dWr3sW3/s
         2R+I9eW5vt4tUpaymIO8TS1zTkgTipC+5xXYQCqXzxNqKgs8zxxM/I41BqXrKo8lLM6o
         5i9g==
X-Forwarded-Encrypted: i=1; AJvYcCUv2HX8Y5STPMxr2jGkFoDGfrJtDTRJczinuBY09+cAPBuTln7NU0rHR5QK7zUAS46UJxAViBC7tb4lEYBHWkmS@lists.infradead.org
X-Gm-Message-State: AOJu0YzW8NYZNhXYRXlxC0w59fIuei08NvaXfT4a6lEJi2k8AdcB+IoF
	vI8rODgMkeiVpZKcnkBJeXki8XgUTUPHxDOP8f3v5olAyTy6s0qmJ3/C1/N9p7HywjirmUEn0MH
	t+gDbavznrlrkhmr7Ceu8RvjI9+MxurRqjFGLkg==
X-Gm-Gg: ASbGncuaW0zBhWSLS+zLodAH4Iz/hD1zi8xbe2qHYtQypG2+NGKdzglHIUrcCgHKhoK
	PLbC9z6ONbRUxwrg1syuYLH9Ib9TEz05/WnQGnTBdXKGp4A2QflV32ZLCfmNq/p8+gqunDMwE
X-Google-Smtp-Source: AGHT+IGwcyBsYc46RWArEeADU77H8bXfVzk3irEgxqL38ZDIwj53ttNaZ+UD3iPTNd+DjLbLMEDFzT6kErsvcr/dhMw=
X-Received: by 2002:a05:6902:27c8:b0:e58:7aa:7de4 with SMTP id
 3f1490d57ef6-e5b462c2b38mr14587566276.45.1739272249457; Tue, 11 Feb 2025
 03:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org>
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 11 Feb 2025 05:10:38 -0600
X-Gm-Features: AWEUYZn351_k4v10MDh5azMViiAdx98NkshCWwsinZSeHh9hCB6x5oVItn12a_Q
Message-ID: <CALNs47uBcyTmBdTBAPXiBcAkE0-4tih9j=VAv1rRcTcf_c2yTg@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>, 
	Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_031053_509150_3451ABC7 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Feb 10, 2025 at 10:38=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> [1] about disabling neon in the aarch64 hardfloat target:
>
>     warning: target feature `neon` cannot be toggled with
>              `-Ctarget-feature`: unsound on hard-float targets
>              because it changes float ABI
>       |
>       =3D note: this was previously accepted by the compiler but
>               is being phased out; it will become a hard error
>               in a future release!
>       =3D note: for more information, see issue #116344
>               <https://github.com/rust-lang/rust/issues/116344>
>
> Thus, instead, use the softfloat target instead.
>
> While trying it out, I found that the kernel sanitizers were not enabled
> for that built-in target [2]. Upstream Rust agreed to backport
> the enablement for the current beta so that it is ready for
> the 1.85.0 release [3] -- thanks!
>
> However, that still means that before Rust 1.85.0, we cannot switch
> since sanitizers could be in use. Thus conditionally do so.
>
> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is =
pinned in older LTSs).
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Maurer <mmaurer@google.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Ralf Jung <post@ralfj.de>
> Cc: Jubilee Young <workingjubilee@gmail.com>
> Link: https://github.com/rust-lang/rust/pull/133417 [1]
> Link: https://rust-lang.zulipchat.com/#narrow/channel/131828-t-compiler/t=
opic/arm64.20neon.20.60-Ctarget-feature.60.20warning/near/495358442 [2]
> Link: https://github.com/rust-lang/rust/pull/135905 [3]
> Link: https://github.com/rust-lang/rust/issues/116344
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

This is consistent with what has been discussed for a while on the Rust sid=
e.

Reviewed-by: Trevor Gross <tmgross@umich.edu>

