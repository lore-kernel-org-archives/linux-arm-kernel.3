Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDA2C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bc1m1amq8DZ3YHH8BDcjtNrzUYHqM5J0JjXdezkBnZY=; b=LKE4jvP15rFAvVYbpAKl070T5E
	au7LuJE+YXPFeZnjrU8nsmHr3J7nlA7NOUw4PIgFosIFTkJqrMT1DQ0R9rJaZFGqU/taCpj0aI/zp
	nTClJKHOKGDN9y4srHFgf1r9HlzoX+SRwP19Ky1Y79qOwiE5T7oevikPKgtLKE+bM2xpFNkGUGqHG
	/U2LxrL7FPYVyspwiQ1zDFPBX77elNjazguXnkjdNsB+EFwXoeNK47WqvAf1lncx/hxx1nQuVHOT7
	0UwtfkrDEWNyUSQQhjSj1r1xwVTMz8z/zoOiyWVonpi9r+qagI7IaJrk2Q1bDQGeQteAndDrVwGg9
	x/MQHaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti95u-00000006mn6-1IyJ;
	Wed, 12 Feb 2025 09:31:46 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti91y-00000006m3u-3gWe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:27:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4394c192285so15399675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 01:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739352460; x=1739957260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc1m1amq8DZ3YHH8BDcjtNrzUYHqM5J0JjXdezkBnZY=;
        b=pAiB5cnRFRzwvauxr4FKDBmmmHVV8pmdEsw3a6rMKK/BYyJBQpMAKM1+zuS4XbELxs
         iAFQsWacaWa79/ITQomtfC4RAjOuNQYpYD+rBI+q2HBsj5B6SP8Nnupsyj+bujTJrPVj
         PrldKsihd2xs+DkfMkGsL4yQeEQ2onE21xIjwWu1QHhL4Z6cPluvFp6ABoMqNsV1YDE8
         gEj1S91JGVFemjZRvnNleE4Mt7kHB5fNDx80SR8XfRxNan/vqfc1VWwP8LN7qW4mmHIM
         oKRORdGl2dcHCPkfd4cAefOALKmnTf5ewjF0vprfpL17bm5W560tJ2dNnBoPA+cz1BIM
         ohUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352460; x=1739957260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bc1m1amq8DZ3YHH8BDcjtNrzUYHqM5J0JjXdezkBnZY=;
        b=SkneLA9NWyY3ubXF3ixMPS3Pz926EbnOqEioJm373e+hSF/rZE5Hmihqms5QQYoIs2
         MO68b7le9p3GVWfD69DQKv/UHN9h0JUQP5IFlSReMUaigIBy5mbkhCALPRp7WimrTPsa
         x4lOMASN7lnrBEVSJHKNe2ovUq6JWqRXi8cfd6Hf6ERDfhm6Wow0QcjWQIFdT1ZdUEhY
         eXVMAs3MwMsdsstY1yM5zUKHAaoaK0XTtJthCEivr0QL4D3Mk9yxr9/g+YaQ7Dpyp5DL
         1qaH28+6RJWt6u1T90L+5++jsIph0IgEAB1Al4a4amA+DfZGIdrW4AKS0UhN3joBcsRC
         CgAg==
X-Forwarded-Encrypted: i=1; AJvYcCUudu00FZvwL6XOsbYc8lMC02c0GALW47URXC0lOU9ch2eP0ecIZFzlAu5ezXqdON2JVQNdfyDcg9h7BF3wJngb@lists.infradead.org
X-Gm-Message-State: AOJu0YwxGlCXfyOrrtWKD1CqhbqVEFqGASXAjohQl7zTs5L0T2JXiHVI
	4OMKH8tH6MJQmME76unFdOA5hjETY/7EET9imosFPNxPzGi1SzOaohDy3tekFG1rKVPWb+Qwyp7
	tAf1a+qm2eSkiOGl8QjDvlEqfohhuRio2IQgW
X-Gm-Gg: ASbGncsHDRqAOBDygsweJePJd9L+aaaloAVU1zudV2IyNsMmJTnCgSK8KnDe1CHAG7H
	6l74K1xwPebfeV8dN2cw7TV0RpceOeRfRhOIarK2o8Aw+LUimuGy6d2KejWMSeONSJXJPB4qmnQ
	==
X-Google-Smtp-Source: AGHT+IGFvvPcb8mwE7p42LVWeaeA+rWLPBy/3/tBPUkRHCkxCRjbs9fMbGYAzeixSBWbbJDbiF4tjdlW10GZogWG+oo=
X-Received: by 2002:a05:600c:1d14:b0:439:5516:dad1 with SMTP id
 5b1f17b1804b1-439581b76e6mr21779605e9.23.1739352460098; Wed, 12 Feb 2025
 01:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20250210163732.281786-1-ojeda@kernel.org>
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 12 Feb 2025 10:27:26 +0100
X-Gm-Features: AWEUYZkYetDDLcmE6nDR_-R5xfXvCqjqr2MixcJqSNgrzdBxocsoOKPAtwlLknE
Message-ID: <CAH5fLggGLbL+oTfOPjtCvw1cTLzJU6e+dmZoF1uy1QVTtRq3yQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ralf Jung <post@ralfj.de>, 
	Jubilee Young <workingjubilee@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_012742_919290_8ECFAD01 
X-CRM114-Status: GOOD (  15.85  )
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

On Mon, Feb 10, 2025 at 5:38=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
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

Thanks Matt for boot-testing it.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

