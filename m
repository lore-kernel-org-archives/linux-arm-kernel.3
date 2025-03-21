Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA99C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVyfGUOFUSHLpd+RTbyaNMFA8E3JrIjaFBTf+PEcZSM=; b=fkfYegvU8IsxwE7zEEXpqnJ1tx
	KqKlAp14eRZ7/ZyS1AGGAEho5mqd34scawHeaLragItZG8oeg9c82sr01hEUF78l4th4qGhGhFyTz
	cOYtaN9rqfmHP8A8Gx9A/xw2NSiNHTAkEjfUpSPu4dOafP/ZXZzILDnkVftPx2o/npwqHuocQBWYw
	cySQC7haTL9gTGiCxmykDMzOhBDbHyULkxmYFnMao7PzdaAasmNEupqhcSkdTxaOiunLh+kj7VstP
	VRKzqCr7OK9S20YcBcqw7ccseWw8c0Vvq0cpceIz3t1V2A7ARRlvk4nt+XLx5X7PA3/Zxj3sqo/Hl
	0NTambgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWm2-0000000E5vk-0KST;
	Fri, 21 Mar 2025 07:26:34 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWkL-0000000E5oi-10eH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:24:50 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1697724e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742541887; x=1743146687; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVyfGUOFUSHLpd+RTbyaNMFA8E3JrIjaFBTf+PEcZSM=;
        b=ZI1oToW+iyRrN1/LNgtIRO5Y4BiDMD4YuC5Y25vhqIcCwONJsuin40RjISXAZhyzEm
         ZGlFcfxMUo5RGv+LcJqN+cymvULLrwBksGZEOvlBImTJZ+6vMDnu9kWd/mgBzRA0hY4t
         ElBrQkFg73D5EUPOGE2LRFPIMlZMiID2jtXMkgKdUvPauLdQ6tUlSf5UVWGWy+qPHxNr
         dSOdPEdpyte0BCkD6hdVqJlUJmEtGy75tbGVC5ZjgnK6yVcXq7ZZEKC42QP0IN3O+HBu
         RmgeYmD/5Xbx57xjRzywaszv/l15gaVTuvq5vGbHyvhOzvNJoggjJK09aFLgsUP9D3cJ
         aSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742541887; x=1743146687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVyfGUOFUSHLpd+RTbyaNMFA8E3JrIjaFBTf+PEcZSM=;
        b=LjWPHZcnxN1hDtt/yJZY5Lh36vMWo4cu7vsVmABhuYdseIy2N4IWbwWLlrO7hk2jS3
         K2ETELQfvqwKXP6VbUFzS1GlKMI5Sk3epKDjXPplWeKYRldi7PWcd42RY7eCmruiJ/ie
         OLXfviyqIgCzMKpitEYSZ4m7viDVADz7KJymWF7K0HH83FzME3EZBMur4GLXjOMIMkrx
         SSXeTzHcdefxFQC8WMux9dzfDxSCVfn+GC+SVKAB+NeJ+3d07TztO2lMGrMc1Z1LUdPz
         fspzw/sQUfDWgj7cIWwTkOVKyJsBJ88ThfZ5WC5fI278wlG9ihkEfEVTpzf8B/JbanC3
         BTbw==
X-Forwarded-Encrypted: i=1; AJvYcCVu3pA0JEDwdFL6ZA6N5zZNVk0nQLIrUizHhbqdTHIcOpm35BfAuYT61lMFhy1lBB4s2DOayZ1eIa1q216DMi1z@lists.infradead.org
X-Gm-Message-State: AOJu0Yy06LqW77Z4TX4LPr4CAdwBY5Bn0GipRTZKyd+NT5yh8/vDgeo4
	IpAev1vrj56KfWxw5fIaHshxdD9Y5SK4VWanrlhowgXOA4P4usmHF7SqoaTU7x8KzizOM3GRXWf
	aLg9LnqhZh3AEyPnRxFt1Nl6qPkE/VCdR7YS9cw==
X-Gm-Gg: ASbGncv+WWzRVfjhuTyv+rFUuUv+1N12IOjZcqu6pJRRow14O4TlzGR8GmuVtrLUzxY
	fzIMR5r8vDYzsr9DW5PCTwUAoefrJsC/SnlpG1qwlCcxYV4AEVkXVuJhM34s2LgiC8ujTRmtzui
	ADVbmxes0utt+MUhsF+fELTCA=
X-Google-Smtp-Source: AGHT+IEWRekqmOvhJIkrtmfcrr34V+9XLm1jjexqdrUw/nqwY2LEQjDKYJw0o/Gv3K8ftncPtiQfEPoemo3Nbl/AyTw=
X-Received: by 2002:ac2:4c46:0:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-54ad64f8ca1mr798251e87.46.1742541886976; Fri, 21 Mar 2025
 00:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
In-Reply-To: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Mar 2025 08:24:36 +0100
X-Gm-Features: AQ5f1JpxlbDrVh2n-nCT0EYt0uyc34jntnze-kB14guAoH3gv0enUrmOfcimymE
Message-ID: <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Andrew Lunn <andrew@lunn.ch>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sven Van Asbroeck <thesven73@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002449_283141_41E7BF0F 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Christian,

thanks for your patch!

Sorry for being late to the show. I missed this very nice patch
that was actually on my personal TODO but I have to much
to do and also I'm not smart with Rust, but I'm a big supporter.

On Thu, Jan 23, 2025 at 11:40=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:

> +       select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7

Nothing in the patch series really explains this restriction, so it
should be in the commit message. Arnd mentions some atomics
etc, but we really need to know exactly why this is in the patch.

I'm a bit surprised by this since the rustc LLVM backend nowadays
support all old ARM ISAs. I would have expected:

select HAVE_RUST if AEABI

Ideally this should work on any ARM core, but it's fair to require
EABI.

The big reason: I think we want to be able to use Rust in kernel
core components sooner than ARMv5 goes away from the kernel.

If testing is the only issue, I can provide testing on ARMv4, v5,
ARMv5 BE etc, just tell me how to test. (But I guess it's more than
that...)

Yours,
Linus Walleij

