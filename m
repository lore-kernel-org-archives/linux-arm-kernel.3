Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39230CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=; b=X4pGX4Zo3REBw4kPqzURpfsspb
	rMECa7PzPERitxVtLpqCHxhwfkz1y4B/Fp9oKi0OAV61asMujDRxfOqGRw51IWrQU/24bpGRHO3Xp
	FX1qpti6nbV7gbR8sN31q91hwmzpcCXT/MymFbqQpRyBHQaibHHCvVtNqggMRBCyoFWlDGU1Onc+u
	2etYSzf62GZ36nWI3wtyrhsaF0uRJL3IhZ6rSIULoj91HZ1BrC8whc2Yo/WOqHTq+gM+iLGjPYkES
	Kwp2hU6s+YCpOVe/qhDDHhOBkNTh7nMMkXV8QBClIiNWY+sazK92EL3rCn1TL34clK2WImmNuCwXk
	SvEyKbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqm6-00000006owy-1BdJ;
	Fri, 29 May 2026 06:32:54 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqm3-00000006owF-3CfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:32:52 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-688b057233aso6229105a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 23:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780036369; x=1780641169; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
        b=XWtrFD5vpC4pXqCQqBMlrkhw8MxFFvMZjxa3OJNEW1p0e5UVxAayXcCQT1vIH7jqkt
         rOIOV9DziKcytvt6eeYtWi8M31CCH03QrnDfYbe/MXx4hNWblaSPV8pHne2/amcgqjp2
         JheZ/+L1v1z/7e3idMaonNrhO+SrpKnJ7gdw0dgou1xdsNauDio1KUdTCjGNsFLpanhc
         4JSyUMDNtJbFx18+F22c/NlMfPMOVm2JEL1iSmEOa/4eclAX0FCB9oHoL6CP/wqC1mVX
         0raa+iUcniq3mNlAAyp8a1SmAiHlnW8Qesy1YIpz3PzGpQScHrwFQJ8UVQtXB+8741ra
         mA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780036369; x=1780641169;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1Ac+5uIaszjTdXeXl70hvJYRphte1CL/Kiuce7KK8/k=;
        b=aySVbO3J4iR4dW6ANXfX0e3nS6BbiPLuCCw93H5lhlIn+dtvZdLMmQ4qAgTbFFTot0
         /6npCKMj+ILb5NarW0tp31Pg3URiaLv6c53lNmxskepcXF6OqQF0LdvwAooEJIpVYd9r
         8s67JCFFHYjzxjQGpXTF6EV/lHh/bhFs2u0ez/aVW7gXy08NaRKNbetkxBcf2w/on5cW
         V3IcVKhMl0OAGFtJYXLknNSx4kfeLxMx/q61694dtNiX6JLpxGzX8fH751+/pnvzmIrW
         Yzq7OsIGlvT0DwaD5jIo6Ao2+HjoRIN6sExwdCWOz1JOpz/Th7J7c8UcQsyWToHEhGSp
         Uxrg==
X-Forwarded-Encrypted: i=1; AFNElJ+yq7dwLzrwNjdauRVf0ZAGH0nklm3mVrA2/c9lZsLk/DRX47sPphqvWoe49leWLoogHndSrtT4HKrwObyuJCp+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3j/HQ2OMvpjJ3hv/JHTBEGIRyvbyLOOtU8ZydN4p2qCa0wkAv
	QF6Q4atcsQuEPzWUR7jUwYf+Ha2P36Or21VeaJ4RwFShvikZQmkJHrNLBxh69viRCKv5qRO81gk
	gag3iXs5kv4gZ/xNVxQ==
X-Received: from edbev9.prod.google.com ([2002:a05:6402:5409:b0:68a:ac9f:e69e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5113:b0:689:bbd0:45b0 with SMTP id 4fb4d7f45d1cf-68c10681fd1mr663109a12.9.1780036368563;
 Thu, 28 May 2026 23:32:48 -0700 (PDT)
Date: Fri, 29 May 2026 06:32:47 +0000
In-Reply-To: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Mime-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com> <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Message-ID: <ahkzD01e14wOTNBk@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, stable@kernel.org, Bo Ye <bo.ye@mediatek.com>, 
	Isaac Manjarres <isaacmanjarres@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_233251_843047_D400A69B 
X-CRM114-Status: GOOD (  14.63  )
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

On Thu, May 28, 2026 at 07:26:07AM +0200, Miguel Ojeda wrote:
> On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > Once the fix lands in rustc, this flag can be made conditional on the
> > rustc version. Note that passing the flag on a rustc with the fix
> > present has no effect.
>=20
> Already landed now, so if the uwtable one is enough, we could already
> do that since it will be 1.98. But since it has no effect, we can keep
> the fix as-is and do that on top too.

Hrm, is there a way to perform the version check in the Makefile, or do
I need a Kconfig for whether the fix is needed?

Alice

