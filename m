Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2854BCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 05:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=; b=tn/Iw79jCFe6bRiUUrl69eZcA4
	xqrqvDVt7UcMzwFOLMr/S3zT4YgWgLcB6BeasUq5BUGE3mqKQVW+uRvsABJJ/W7nJbu2GlMRGLH/I
	A1qVbt61nyaNDa7BIucqQPdd9Ux4xn+hornKpODzNhG5t5qn5FtOVNZEAaAAXwSuvhEIqKqrcMiBl
	xldb1TiCdbutKMkKfmRPZGHQWzS4qnpbHoetAye76rHsFH0nZsYtclTbt9Pu1QwHaIASKJf7pwLBm
	sAy14OfEQthMADgoQBXDMWctLLT2rs6w7lL6NqtBMh14WsRTpf8POiS26nm/CuMnYD7xy7Fj0H+LE
	LC57QD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTGB-000000058wi-0Uyv;
	Thu, 28 May 2026 05:26:23 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTG8-000000058wF-3rx7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 05:26:22 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-304dc707bfbso5079eec.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 22:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945980; cv=none;
        d=google.com; s=arc-20240605;
        b=MGmrkMmmO5WW45CMwuVmSgHdAJT9oMfiPnVH9f54g9d/a8/uWC9SDcKSuHZwZoQ0Ox
         U1x8nTbrzP06Sb6MRjZ1638dd/HGLaZybo12QD84BLr6ytCzUm+n5XtweRHUOj3JdtYT
         /tT5uNJ1bhRX/nieEN87EpYoREeo3bHUG3JnokwdcNED7niNX1dC49OGPgbHhEcqn8Nq
         KpXeZ36+28/JC/+nZnkwypEmdF94r1fwyUVjw0p/rBCGhs0y6I1c+Ynv2PQWLu7TNQu3
         rZLebGh/EACgWvDxtsfqblO12MAlBgFxt/dD8cHGOApz/MvZ5FR4eVM6nUwGiJxRKUaB
         xiVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        fh=3P+9SrD+BtYWLpGvPhoipq+GCktIHDUpI4+ILdoxfdo=;
        b=GLZseG5txQJwr4haF9rKvzD0bty4ZvqFhnNHEp8QOwyQsK3cWpghquD4l/ay/yzYOh
         HLgGJyOuwCtLqs9Xa1TIAwPov4psCedg2I4zH25TJFNRLsnMCKSSt2AAkXhAkPFwKkXd
         kjfby+HB9Q1oOzBIXBM228o1d+XgOTPKKNogfw2g0CEJ0RirwI2ycBUkax/33NuArhFZ
         SCnI/8V+RlZB0YNpipKDBYR3jCrgrd76yL38uCVTKQwOB6vrXqd9cJqH8a19auFlBYqf
         r/dWxO3Zi0t5nN5OayLukqYa4CKZnqWAQ8KjVWZ3HP3Oe6Ax5jtkVjvPWdYvkDQ6XrFY
         3ykQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945980; x=1780550780; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        b=iWO43/IQc8zj1YacecQ4Bq1QugGzIOWIytWaYGpGlO5oqWvaoPNat5iVj8NaArRnYT
         b90eRRGbvDaMWKS+ePzp2PnaBtJ928RM48FoxlqjIbTXkIf3rGS2cEeTo7MfSHOXNkYU
         Z71m6irOozEI1XOK+9LjyRPybnDlQPnKq9p/KnKVTzz4HfOIHh/dEhs1SYnfW8ycWRoz
         W1B/qk2Om/FsxSohE0h/sv8dEM4rAKLt1WrkK7XbvcOA5AE2cQhmTLlyYu3i5bsoPPJB
         PCwfmdtPZSghnERGdKZcJaVfyW4lT3r8lCyvD/SAYeLeLbMaN9yuwfGv98QX99BIv/4k
         n+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945980; x=1780550780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZPB+UbJ3xOm/x1ryseHShdbECkKLBZAc98p8FpEfJY=;
        b=HkLVhpiNCGxAoBwjcjypbmmITkHR8us+kT6cKLMYhF1NGuvw1kS1jrCuJeLoJKGryV
         qSdPsvrM5Q2dPJNr20Y8KRUTGrSzEPr/sR5X2N05xm2Qlpk0DkAi8AOp3P6DaYAdGORX
         cKRQ7RUd9MyGi/sfQEwm7jRlhJD+CjcAKhayjLzWo1OAW6H/mnwjbTcn2+NV6MPwuMuh
         uZEQea0fY9Btzii5CqQBFXnAL0Znf7jJtkNAsFA06feGE0Y3jA8K+vWkKaLCk8WQvqZT
         S0IW1cVoHE8mRxJ6ANu3TAJekwk5eNmdjfYWS5YQvKjJvuhkeiMRx6jQ4SNHxGSzhLHI
         HOHw==
X-Forwarded-Encrypted: i=1; AFNElJ8VDzEZQt6F9Qts8Hzezsh6j6Y2bVfS5TeS7nIhF3rXczYPh3JtUDDTEIRB8TlkZt/OEZau9mGgfVnpMMnEuwiz@lists.infradead.org
X-Gm-Message-State: AOJu0YyZTsyoMlFTyenZrC2ktlc4GauRfrQUY/nIOaRPx4UPtohBdq7f
	rltc8G3AuG1fZf/ECtDfYizDT+xpcZmD5McV908Wjm9IfMuHx4WzP9nex7WQWlTqd5K2I1nSRp6
	JYAyZVpfwcJE4/ZywwZeaxuB+nE2QaRE=
X-Gm-Gg: Acq92OEQ3GgZNZFKH5H0RB1LfxYeB4q821MrSfgZKMi5uU9Aaf4bMSilh8J6Ccq7cN7
	NOl/1vLu96RWzXm80yYjC7YFOuQwajlSg+wUpqR4Y8i6dDlqorYJtMW1GJUn814+HhxhSO20Og0
	IOkFQm/Ew/W3tNCoIfeR/8uBNJftOrh0hLeR2bBxA4kyvEwPjovWP0fWBKiyn8hVfMv1vNjgUf2
	6c3C6G/s7dtEj39euXItiWXzfDX0ROnNrWPcfMhnQX2H9UhqoPIWjoR6OXQsn4wKluznMH6Th4y
	OB3qeuwQhm9fyyu2RauhmgjBhC9Eaxh8N5grwi5It5Y2flppMX7g5TM5l2W7NjmnGI5c34ggC4t
	MF/IRmk015QUQ4y7h1K3lpohzyUiwN3M6iFLtjioxF8VT
X-Received: by 2002:a05:7300:df44:b0:2e6:b55a:76c9 with SMTP id
 5a478bee46e88-30448cf0ceamr5032661eec.0.1779945979977; Wed, 27 May 2026
 22:26:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
In-Reply-To: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 May 2026 07:26:07 +0200
X-Gm-Features: AVHnY4LpfTWCciL-kun38xNZkmFlALMcz5bmeoJdgZ6qhFC5eHM3rUClaReGlc0
Message-ID: <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for CONFIG_UNWIND_TABLES
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, stable@kernel.org, 
	Bo Ye <bo.ye@mediatek.com>, Isaac Manjarres <isaacmanjarres@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_222620_964496_119744D5 
X-CRM114-Status: GOOD (  11.29  )
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

On Wed, May 27, 2026 at 8:18=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Once the fix lands in rustc, this flag can be made conditional on the
> rustc version. Note that passing the flag on a rustc with the fix
> present has no effect.

Already landed now, so if the uwtable one is enough, we could already
do that since it will be 1.98. But since it has no effect, we can keep
the fix as-is and do that on top too.

Added and linked both issues (i.e. `uwtable` and the `frame-pointer` one) t=
o:

  https://github.com/Rust-for-Linux/linux/issues/355

I have to send a fixes PR in the coming days, so I can pick this one
up, but if arm64 will do so then:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel

