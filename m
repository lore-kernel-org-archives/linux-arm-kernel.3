Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4C4C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4AYfPfBk9zTJMzkXIASpVeTyT+zxGG6okAiETyO3ds=; b=p0zDp+LRuiy+oNZRSHLoX+q0EX
	tECLC0s3GviX0Dzk8lJ/eM6qSwdHYSWApHS4tovsBCNyH23g1zSMrHIsZ5nXJgQzGuf3t2aeeUli1
	+h0DZdFkoQYIxwgSyds3mKX+l9T3UsMlPALkBtRYTANq4iE7DOz/hbd8HQnlIeCrIkdScaw2aZuU3
	gUZ2WSNl8oNah8bTlwUUMS+3hqr6HumjfuMy7JWdDneDwDLUQ26vorPL4Z/97/Et/6tmevfOL0Hzj
	7yjqgXm/KhkWcZShdtH2/iTrliecta5Pawd9riM0JoWlhcsgCbUlaqWzBnTU/KRxnrWQdD6g3obLT
	plvz4Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RVJ-0000000FSlW-25Jz;
	Sun, 06 Apr 2025 15:01:45 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1RTM-0000000FSVp-4235
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Apr 2025 14:59:46 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2ff67f44fcaso713254a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Apr 2025 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743951584; x=1744556384; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4AYfPfBk9zTJMzkXIASpVeTyT+zxGG6okAiETyO3ds=;
        b=X6+2O+lkl7p/0rhAgYMgw1liidxEeXLjEdyhbKcyEWmf1mng2c3z9GI9XRsvcTXYjc
         YrwljAd3uArx8nOkuXWyrlnO+WwAi+nPAorEwKe45X4BjQdrGExuFyvyyk9rYS+UsLSv
         WTkcmjBtVm7PR84PIbB/SQ7BEHCxyTEXL8JOs5F1rXY/3jXDX+v/yAS7ng8Nm+2pQh95
         gBXd2p2MfozPvyfWpvpf/2S3J48qXvyDJStstDgG+kpErO+3gLYn+STrmTRhSw80bPGg
         g7WFvYTndLD84XPjNG6mPVr7CXCTJdwmuzIVGH0XuBu3KvzjKJnCJS+My9VtZvM25jhU
         cegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743951584; x=1744556384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4AYfPfBk9zTJMzkXIASpVeTyT+zxGG6okAiETyO3ds=;
        b=M1e1FM7UHBvL98fuI5p1g/KeWYPO+1olEqDLPll1FVMkGt6frms95S3HdKQwR4iGJG
         0Nu+YzCle24h9v89RYgfchpwZCrc70e73GH9lOqvSbcSRsJKMKuLhCe9jLncJE2hm9+G
         iry+UrXaT3ItQy96iRWL0TeRILZoaBpV7yZxf8DbT0YEaivmkiE4JafkgQ8S2paMSIJb
         oGzre9DiG+fOABFgVDxgX50XDSwqlstc6UHntd+REWT2UT00n7b6ay/b9soEvzsq5frP
         aAXcmOVdCxTX5NesRtUlN8R9Xs59ty8Yb6Cr4XBLBa2WAu2nqyI+oVqOS4Edzi6pz3BN
         agmg==
X-Forwarded-Encrypted: i=1; AJvYcCVeGxvrHAxYfbipjGCxj615SIAAgGpwDrTyVLz72XP97Is8CLJzdbaAb2nP2EmyrB3p3Ev5C/YD4oN7C1Mjcd4/@lists.infradead.org
X-Gm-Message-State: AOJu0YxnzroN3Glj35qP2kgCLzbmokoyBlCEOe6iC7xV+tU8FI/609A7
	ZRHonAZlJ39FN7+ip8zcdum0VlrgMYX7NTbRMG5sEGlIbi8He+taIGm1YCs61F37rxmP/16Aape
	kiw4c+muCo+rGYfshiKBEpmdJt7U=
X-Gm-Gg: ASbGncsi3mzbxsFAvxKlGMmZZkq3dd2JYWrFvmHU/TOGz/xodhHbRBcULq5RSe7Kxyx
	ul7xV8GSnjRu5f0CXY/+U1T1jcR7zycYjgP7OCabXdSz6OWO3MGxEfQphfhuBgWGFfczF+ReJ/z
	nMI2BBNoN3IQuBQnQEwV4j3HlxnQ==
X-Google-Smtp-Source: AGHT+IH5rCiPhIg7gwHdGRFhgHEdj+0/rNY1KcOFwL6CUCGIWbnt6CWYfvihYXH/4uMJu+kL6nfNE4lM+6NhLbLBkRs=
X-Received: by 2002:a17:90b:1c8d:b0:301:1c11:aa7a with SMTP id
 98e67ed59e1d1-306a4975b3cmr4936976a91.3.1743951584024; Sun, 06 Apr 2025
 07:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com> <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch> <CANiq72n7UhQEh9TJU7UNBv2t0ZR_rNO3dqbVZ2cwr99u5SOVeg@mail.gmail.com>
 <CAH5fLgi05p6KTN2v=+jy4HoK-oC9pg7dYBuc8wvfx_uN6SVjOg@mail.gmail.com>
In-Reply-To: <CAH5fLgi05p6KTN2v=+jy4HoK-oC9pg7dYBuc8wvfx_uN6SVjOg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Apr 2025 16:59:31 +0200
X-Gm-Features: ATxdqUE5gEnNse6uY-AZHWqKohnH4VmIJRHm0QYcjedq6yj9Yid-btTa1YlP2NU
Message-ID: <CANiq72kXO8F4cMjjyETMoRzNjd0qkc41qBGR=ex1W+_C_3fLfQ@mail.gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Geert Stappers <stappers@stappers.nl>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_075945_000173_F5D22C8C 
X-CRM114-Status: UNSURE (   8.09  )
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

On Wed, Feb 5, 2025 at 2:15=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Seems like we already have a warning for it:

Yeah, that is the "just Clippy" part, but other forms could perhaps do
more, e.g. imply `no_fp_fmt_parse` (in a stable way) and remove other
bits that may not be needed.

Cheers,
Miguel

