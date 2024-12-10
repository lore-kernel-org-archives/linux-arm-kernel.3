Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC6DE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=; b=qPSkC7dsM45hsHFjE3B2bdvBlV
	OcdhWdMLjT/f5MdsZNhlNR6kYe086zpi/nT7jhGuVDGvxchgaZZXynntcgHIIuoxF4bdlpCge5xw7
	aP45Jl6Zl+ozhumwXbwo57RFVbbR8EUBlmWl0ikCt6OILiQ4UeZ/BXxXLezEtq4WwjehdVXbpXQeu
	6QW35CHaFtZBS0LHYq+Jg3EBXOguaGmqmITxZXugy5Cd/bkT25Rik28jel5EnJ0sx/ui9r2s/WH/I
	sjuYwGWGpKQqJiY4J8iJohG9J2nUq3KfvAct/ZBnV3YXO2bSNRBbry9sLF0DITfMVp+ZmggMyo/tD
	bRx5zMZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwCJ-0000000AoIj-1cWc;
	Tue, 10 Dec 2024 09:06:27 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwBF-0000000Ao7S-1iKT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:05:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434f0432089so21864075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 01:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733821519; x=1734426319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=QtEHjbDXzCFUh/5hRuyOlYR1lPjZ77yw4e7ok6GrKCGeDIOYrHd9Ky8avNjejmQ2Cp
         xaSYKphSfGIy0qs+ahEaKuGktChLaIpyj7nQNwnWz5MJ93vTfBQMjHceMk7u0zItIjC/
         WdM1wWob/ZC9aE1dAtrcEHfMjQW1mGVgc2PXSLtc73CrryrZMp5GeBYwVj4BJoqBYLfK
         On54YV0RYpRZVihUGnZaaNUi2hjf6dApL41CH+qRFnzoood3xC0PAD3w4WTmM2XP3AG1
         Ltv7psQbuCxC2bK8h0jKhy71Qb8WvkIodF7k6O/A+o6JmmZFjmTSJsbRNojm/JGEzEZ+
         xJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733821519; x=1734426319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep5OKFJpfszekExX4/IRcefemdiT8s+lNUZhAL6lYhw=;
        b=Fi1P/RGDW9i8V7gHL1+bgzFUyGTaEspQkqo1LDiWl5acw5Gh+wjHLr+u69bbmp0O5/
         IY8Ku+SebMpzu7jfALd/Za3r0LFfG9gW0AmG63ON1Emp+FI8utXW8hMV/DtDbj6YrHGL
         Uvn3UK/frULTTEZUyztWY2kKbfPNmHKkl6GabWWla5La/7BoG+Wy6MZ0B7benpJapzBE
         AnO0vLG9WJt1TTnfX9PGbMi4AsRmut93LCjbYQl6B/9cguvTeUpBNjuCeWNJ7RQaXZOR
         cuwxjaWlTjzfo1h/viqcqSyBPt+2BJVaBMn2e4rPdyZtY4i7Ma+3jQlCQEPYYJZmCfp/
         I8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUy5656Z4+x6gKWPeZtb1C4qU8tYm5IYSSsoCL+/yse7vJM/wzGuiTOeNQMHCubQuL7eUOjw1W8Ih102iCmrO/o@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6Am4Of04v4OP0bzA3kVwj3WXXPOuqO27NfDDvYgq2u0qmtsF9
	r+9DPle1HSSaU5+Ez0G03gKZpaC81rph3vFqJTar1ShhsK3RsU0WZcQZxZE7TnF7EGrXw79V47b
	hdBLoxkkY0qPb3bGUzc4xk9IfeVY/WxQw/zBV
X-Gm-Gg: ASbGnctZM2cAHgJyz/gA9MBQMs6d5sjyaLc4TVX9iAlMb2/sDDSyCR0o3HJVvFHTbL4
	pdgzafXjgabCgSmYvWHF7b89ppE6HxRDOfom8ySof25bsKXebd/26OiIkjLfKe2mj5A==
X-Google-Smtp-Source: AGHT+IGIVjgo6xFN35HYB1TgvILbI9Al6TSHNEWYp3ypNeyi+o9RjYaXrxzLsc97Z2zDVdAJ5OXIaoQOhG2vsZwboeY=
X-Received: by 2002:a05:6000:156f:b0:374:c4e2:3ca7 with SMTP id
 ffacd0b85a97d-3862b33e3cemr11655971f8f.5.1733821519043; Tue, 10 Dec 2024
 01:05:19 -0800 (PST)
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com> <20241210001802.228725-6-fujita.tomonori@gmail.com>
In-Reply-To: <20241210001802.228725-6-fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 10 Dec 2024 10:05:07 +0100
Message-ID: <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_010521_447096_F64C111B 
X-CRM114-Status: GOOD (  15.49  )
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

On Tue, Dec 10, 2024 at 1:19=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add warn_on and warn_on_once macros. Wrapping the C's WARN_* and BUG_*
> macros doesn't work so this uses the assembly code exported by the C
> side via ARCH_WARN_ASM macro. Like the static branch code, this
> generates the assembly code for rust dynamically by using the C
> preprocessor.
>
> file()! macro doesn't work for the Rust inline assembly in the same
> way as __FILE__ for the C inline assembly. So the code to handle a
> file name is different from the C assembly code (similar to the
> arm64/loongarch assembly).
>
> ASM_REACHABLE definition works in the same way to get objtool's
> reachable asm code. The architectures which use objtool (x86 and
> loongarch) needs it.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +#[cfg(any(target_arch =3D "x86_64", target_arch =3D "riscv64"))]

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, not(CONFIG_UML)))]
> +#[cfg(any(target_arch =3D "aarch64", target_arch =3D "loongarch64"))]

What's the reason for this arch-specific code? The file!()/line!()
invocations? Could they be passed as an argument to the asm instead so
that we don't need target_arch cfgs? I understand that they don't work
exactly the same way, but maybe it could still work?

> +#[macro_export]
> +#[doc(hidden)]
> +#[cfg(all(CONFIG_BUG, CONFIG_UML))]
> +macro_rules! warn_flags {
> +    ($flags:expr) =3D> {
> +        // SAFETY: Just an FFI call.
> +        unsafe {
> +            $crate::bindings::warn_slowpath_fmt(
> +                $crate::c_str!(::core::file!()).as_ptr() as *const ::cor=
e::ffi::c_char,
> +                line!() as i32,
> +                $flags as u32,
> +                ::core::ptr::null() as *const ::core::ffi::c_char,

I wonder if this could be written to utilize Location::caller()
instead so that `#[track_caller]` works?

Alice

