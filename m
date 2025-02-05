Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB2BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAfHGmW5Jn6KSQz8KSJ3YqxRch6Hu8jeIGGPJU3eb1M=; b=T6P48CRkWXK9nVT+C6sidoLWXQ
	ijQoctn9Pa7S7VwUGO85lvlWAMVTZiDqaSRa38P8qPMKZmjhW9BK69hSwehrfrawn5mF6V8bvOHEN
	w/vupoBr6PZ4Hv7VCbnfkjlMPBGp0hvm9KnQ5NhJiKvJOdxcYFmig9YfHsQpgvgSBuqzhtJwZTfe/
	MVj8rZ8n2EiA+NDTXPg0QCikpMw/57AOjfzSsyYQ2vgMijcloixC0q9AfVuySc28fegHq7gOIlctR
	iLMtJJHBpb9Wnmnm8yw3M8lUrJZfb93WqxTNJ1Nz0LPPGU4amls9ayQoRNAeFJWe2KmPUZAKF6SYU
	Oht2xDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tffF9-00000003Mdb-1tLD;
	Wed, 05 Feb 2025 13:15:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffD4-00000003MCh-0rkp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 13:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cAfHGmW5Jn6KSQz8KSJ3YqxRch6Hu8jeIGGPJU3eb1M=; b=P29qqgVfxmQSx02iKxadkFQSz6
	kW1mITCvilbPLf0ZB/m+YlRfzd+yw4tQCxGhrRqhzePmdMLGTFMP14O0yJc+gr8KkjFmy6GGDKfjs
	MsGJ76R9sJo5k7URbonL6vyrEQ0IaYaB6IyO2eTSpksEmHHw575YoqAIyEhqg8Tg9exim7YVl8yM+
	/s5fXnADTDN0bTNUVHWXkTVpKWqKtxh0OPaaxFhKRW3kGgh5P5gyQ7d5BZMQpD144//GwzUYq7vA2
	xOm4hknbskQySnpt04kSPIUTYVxwhuspeF6cMC2iVdKOdgZIPFRlJtbVfhiDgO14ujpvNCr1KLVcg
	7M6K/DKg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tffD1-0000000GdNa-0M9z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 13:12:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2f9f90103bbso13799a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 05:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738761168; x=1739365968; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAfHGmW5Jn6KSQz8KSJ3YqxRch6Hu8jeIGGPJU3eb1M=;
        b=VNG+V87WFI4cSjWLeCZyF2wXb4nX9t48bK8ch7YJ90ZWgyhPi+h+UeXTmXUL/kC5wc
         Qod3qZfxJpXa+fgdma4tcPEIl/8xxtyRuElggvipXUldBRRtaLDy1llqpfZxUWwakML4
         GlWu4YkEuzs+iZ/dDV3mUtx3OwdefBUZSj26pD46xe5uGdW5itKH5+F4ORQh6zsJiflP
         7B89uRaeSv41uI0jro3Z4MTeuE0uPYB6sEP+g4Z9N6RcaXbHaJ+eFFggUpJbfN9K4F6K
         03qH+FFk8iTKW0SgvAh1O6CieLOiyQJSAHRIplR2+I/YV+R8PhLNETu4aAcKSj2dv5If
         Vmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738761168; x=1739365968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAfHGmW5Jn6KSQz8KSJ3YqxRch6Hu8jeIGGPJU3eb1M=;
        b=npWSoATraLuul3vyOVTBpQgd4TbEw1DQdCj2fgGc6Y73jquZlKgKxZPh5QDg5qd0tQ
         nXUTcworT7DgVWLyCuAJTJe6tsYOFyIKA8Q2uutUglw+g6R3TcNm/V6Hi3iFxfeirPRJ
         Itays97VRbSS3nKbFJD/7Lefsd5uYVnTGwyzRnhr9gHsCEykW7J2NGw8twRxbLYqbrZO
         xnVg0JkKCI3HDJy1M7EAgnC0K49+X8Urm7NcNkcWdqFpdOmwYXxzgTSVlBAMjgyFhLqZ
         8tUirYn8ZuDWYxhnS1lqUdAcGn1NxdoYz4i55hZ8MXMRKmQzvJS2rtJORwoQ8pwkpMgp
         rDzg==
X-Forwarded-Encrypted: i=1; AJvYcCWo52YA9u2sZ/ylLfWLOe6j0djrfgyTX2/wHgiiBSoFULT7HkVNPbaqDT/TKkmvDDTmqb55WyP/h0Y8P57AZ+ti@lists.infradead.org
X-Gm-Message-State: AOJu0YyAwTWYiNKCm6+jDYD19afCQRAu27jzFO7mZ32PlTlabNbgv4rg
	44o+qy4QtpHZFmNB6EiYEcBQkbBT8SCmma4vmY+eJHinhQCteOOqzluBjQOMH0/j0rIyTga05b/
	7Rgnl4pGdU/04i/bctzJFcBFkNrQ=
X-Gm-Gg: ASbGncvHkgmcSagsvToRVzHWHwq/SQtMxIp/tt+TTbdDiq+Jzc1UkvoEWQZqsCgGCcA
	Q66WdsABLacllRp/lTmEdXTt0XBH2goky8ar5Xyh6heodteEfjq/dkoyWQoFyymftMDUpaZr2
X-Google-Smtp-Source: AGHT+IGhxND18/FiuqBivcbJhvPajzGYRoAgmYiGIAXuUA0qYwQ51d9O2tgSpInISAI3Z0mUQTNi7RvvZemHvkDrI7k=
X-Received: by 2002:a17:90b:1c12:b0:2ee:f64b:9aab with SMTP id
 98e67ed59e1d1-2f9e083493dmr1842793a91.6.1738761167698; Wed, 05 Feb 2025
 05:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com> <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
In-Reply-To: <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 5 Feb 2025 14:12:35 +0100
X-Gm-Features: AWEUYZn_HdJDwofkKyPvCBjvXo_483qp0SuoTZG2uYerx5l5HkF1GY4eb7dcmA0
Message-ID: <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_131251_257335_A0F80B1D 
X-CRM114-Status: GOOD (  15.90  )
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

On Fri, Jan 31, 2025 at 5:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Floating point is banned within the kernel, except for in very narrow
> conditions, because the floating point registers are lazy saved on
> context switch. If the kernel uses the floating point registers, you
> can break user space in bad ways.
>
> I expect this has been discussed, since it is well known kernel
> restriction. Maybe go see what happened to that discussion within RfL?

Yeah, it has been discussed, including in the last couple weeks in the
Rust Zulip due to the upcoming move to the aarch64 `softfloat` target
(the disallowing of disabling `neon` in the hardfloat one).

Ideally, I think upstream Rust could perhaps give us a way to do
something like `-mgeneral-regs-only` or `-march=3D...+nofp` (in the form
GCC does it, i.e. a hard error if one even tries to use the floating
point types even within a function implementation, not just in
interfaces like in Clang), i.e. a way to avoid unintended use of
floating point facilities:

    https://godbolt.org/z/o1E5nrrzc

Currently it is unclear what form that could take (e.g. whether a
`-nofloat` target could be possible, "disabling" the `f*` types, just
Clippy...).

Cc'ing Catalin in case he wants to be in the loop, since I discussed
it with him recently.

Cheers,
Miguel

