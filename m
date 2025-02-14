Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D93C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbPXCYa0Euo1MoCU+SWGOw4OmTSsV7u/JIvOIPr+CKU=; b=XCUBErOzJ7oo8ir7HYMjGB/OPc
	z4K28TLrb2KntmOG9/z5i3TCf+kJ7lmsOLJy6pJ43hK2qKNRrVxVGHlcVpkI8xzTjRq6vBqkeACqe
	sqwWoZmrCg8eD4IFfG32foTuuwsz7SgXuDUPQU9F3zlcbvw9h7U2pbq9G1J1v2Ju8oUQHdtU5mq6Y
	MxFnZjeqfvsmKb8uPQ+G5uL4EwahZSE62gMzXP0cX2QHXPb+xlWUHC1saOW2se9b3BWdPeRlI2RrN
	apzpyllOEhZwUbaGJsUHHXDkuMR+N6mvu9/fbLmq5D5kb1IPo5jYJdZSyAm1X8U5+cUCMRmyKGQ0u
	mLchymqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj183-0000000Fzml-2Tuj;
	Fri, 14 Feb 2025 19:13:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0jM-0000000Fw2a-0j0N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:48:05 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2fc3035e947so197454a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739558883; x=1740163683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbPXCYa0Euo1MoCU+SWGOw4OmTSsV7u/JIvOIPr+CKU=;
        b=YaLWL9kHkrGa8PPXCSvdJC99fRhfOUvlPsUFRgY+BR6w0I1Rr+ydAcBarIWIVZ8u7S
         Shnamr/JQD6d2s4J9t79B9Hyz2ssncudnvfOavrfe/z5A/rPhQUbXoLSkRuESR52uP9i
         k93oLvIKbk2GA1vpCjpuAceykwqhmkiTuy0ESgxLElCohWqP998NsqxUaLJSG1D/mBvs
         7v1HNL1T5n89VdWvqz1lr4HgabjR1I2dKtWfNvJOtuU3Avi7MlAHsXQ+CFe6HUkU5uWd
         82Z0nf/uTbhOeKHtDrKx0GsjsjjcJQ7PXRtAd965fXcWCfkj7ZH0Ik9FcyeGhtziyUEN
         pt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739558883; x=1740163683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbPXCYa0Euo1MoCU+SWGOw4OmTSsV7u/JIvOIPr+CKU=;
        b=vv++QvQdI+wivCM7RtcJSYpttZ9yRM//yF6JYY5ohUUx+3iH0R2FYzTUb5/buokqd1
         oiU6YBlrlvUifW+ODQgwk3McUENr6WOSa0ED/z4q+DqKtpj6mI4f5He0s9507TURwdJN
         QJPVwNuLEgGWirUCaSuKWh1XBeVvUa1LaYfWXV4CC4p8LUtCLkLR2OAvDiFszirsht02
         /6VRtIjQH0Z2EkwlyfpIM3lu9X4NfFp94bLyQmBQGzcaF1+dyMa23Yj7iXCZLrdeUAv2
         gkpW8Oh1XKhJdV+Au/KbsE7H6TZZQoftkOZ6P5Icmh3WG2dt12lvdEgchjFRX8haCqkL
         CDqw==
X-Forwarded-Encrypted: i=1; AJvYcCXqZZKpYyu/lXKz3+aMQXmJsCPUkyW+rQj8j15oHPOyg13dMe4YYy6y6uHAnRRnG6USYQVWpxweVkbBUND46PQY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxux62eoTHY8lDtprEHrDgwor+awzisD/pMT8pHLQ52lSc95kub
	9IlULwkSwcKUN2XMItJAlRXrCm8DadXMHYHRuQn1dPoo+4zvLSPi9D9PlysJHcMKtghu0oDXfD3
	vJS4GOihAJwI0vR5oLNYAuhTcyVA=
X-Gm-Gg: ASbGnct4sWuMkqaiK7M5Cav7QNBubNW7sfFUZpSEEWstVSH4m7tCK7vOZpUBZh43Qsp
	nd3eWuTH3LP3Q5BxKhjVBU+EqT+WnyGjeSWXJvb4q1EYKfvGD3DF/Vpvrx2b2dDfXZxCnbYQW
X-Google-Smtp-Source: AGHT+IGUeE04nboJL79uQEQi255Sh6F2ujsdzLVst5SO8l5tm1Su0Y1pKusKL+gCNnpOW2NARcGAkDEUDmt8oqZunC8=
X-Received: by 2002:a17:90b:2250:b0:2fc:1370:9c2f with SMTP id
 98e67ed59e1d1-2fc4103cd0dmr79419a91.4.1739558883232; Fri, 14 Feb 2025
 10:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org> <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
In-Reply-To: <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 14 Feb 2025 19:47:51 +0100
X-Gm-Features: AWEUYZkFZsSwR_pcKDqppTTtKFiRY98pi3gXltfVmX7IBbEAqUtXPZHv7bRa5Ec
Message-ID: <CANiq72n=95jgJs17NFAkit5uzxqtO9xij9Um3ybd_RiMCpFrDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_104804_209509_0B0CB3A7 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Fri, Feb 14, 2025 at 2:39=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Do you want me to pick it up to kbuild tree,
> or will you take it with my Ack?
>
> If you go with the latter,
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks a lot Masahiro -- happy to take it on my side if that means
less work for you.

Cheers,
Miguel

