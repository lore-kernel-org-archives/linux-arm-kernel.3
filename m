Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78618C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 01:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHwpa8pL8FWKr0J7Ni7ha46YBZCr1/J7SQ2iARqv+Yc=; b=LjXQVuhxXV52VA3N6D8ScGoohN
	aP+FzyMUgDoW8qzcslVAx6y8I5BDJ/aVjWWgamiUi+oZmaqmYT8w1DgYhqZBGwKh0FtvqfYnmXmnm
	D20r82TZV0LnmuABlokoIG+QxrIF8nW0xkZIGGTAzfz7xC9xUxucJxGfWU/4Mp4Kzup7KCeSku5Pa
	xYR8XERLVzfCx7bEggdJ+mXEUYD27eAOxnDxbXoM2wMLMMtxnlracAx1yui5JQW6kvy8YNcRtGOJp
	+swnYg9SP/X+tg0psz5ksIFIJNxu0V9+s7oOpIjUamF9pldiDs9ZHdHb7Jg6svmr6ozjw/lFc7KHm
	nJlyg8uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tikhH-0000000DD5B-1TfO;
	Fri, 14 Feb 2025 01:40:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tikfo-0000000DCmj-2mzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 01:39:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F300F5C5C8C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED22DC4CEED
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 01:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739497159;
	bh=9IxhGYBiqmCXEOQC+SsmBi/iEnbY572YamGs8pAzvaI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C6BLBU8hi8LkDGhUZRCVs3MiPsBqGGZFJyjAXoIlZZhzAys3/bbsoqowx8T3Rwsm6
	 9+BV01yc9q5W+I3iNVujM8QK8r++K5yzFQZms6SWDoZdm3kMbHWBhhwtmFSfc65kF4
	 VzuOqitC8yDRQxwkQ9++Sm8n/us5K73dydIkxqHVc1ZFwzksTQ/+wHB6NbyX/khOuE
	 hrrCCVKyYtNmldWMacNBgV0yHtDd83Pwjj3V2/qTXiIIPhQAxS5J2IK67ao8zFNqEl
	 IcmzdKIErKZBpkZQpN17kbQlwlPMp+Mk4bpJ+kEImBoPtIeaUh3tFWUB7erL4kL7T+
	 qkv4EWP9l1wsA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450408455dso1700393e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 17:39:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5lSBL5lIgL/OP0+cRdIIHUlReVKtfjs4R/Y8gXFm4gE/h5tYvvXo3opr+ZapVDOhFUU48dUgB7rKTFIQcuR90@lists.infradead.org
X-Gm-Message-State: AOJu0YxFm3j2zNzqdlAcHughivfiH/d5IwFRkYgqzEd+3fFNBSE0YIpJ
	4WS91m/kV9tqfFesi4bJ7lg+K7exG9gXY4RZTaP7xXRNlaBrovWfD8gd1pTGUde8dCorG0hYpdl
	yjGReASnKV3Oxj99HId2uKPaMjd8=
X-Google-Smtp-Source: AGHT+IGEYz+WkoUrySCxtqr7dpKbi6V2S+88qBoYDexCvVUD02b8yZebnuEPHDd5b4ywaSPaelkedcVjstzog0U1ao8=
X-Received: by 2002:a05:6512:1281:b0:545:ee3:f3be with SMTP id
 2adb3069b0e04-5451dd88faemr1651337e87.10.1739497157461; Thu, 13 Feb 2025
 17:39:17 -0800 (PST)
MIME-Version: 1.0
References: <20250210164245.282886-1-ojeda@kernel.org>
In-Reply-To: <20250210164245.282886-1-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 Feb 2025 10:38:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
X-Gm-Features: AWEUYZnI4fpDKGlVQ3nPgTvxchXJzpHlGyUSt2uP8tA04Q4qKsA6VL1SMVCFHCo
Message-ID: <CAK7LNAQBFX5q6yyKBJoxMoD5d9SwdKm0c23J4+LpjwA1eh=bZw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_173920_747656_CFD989A1 
X-CRM114-Status: GOOD (  12.88  )
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

On Tue, Feb 11, 2025 at 1:43=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Introduce `rustc-min-version` support function that mimics
> `{gcc,clang}-min-version` ones, following commit 88b61e3bff93
> ("Makefile.compiler: replace cc-ifversion with compiler-specific macros")=
.
>
> In addition, use it in the first use case we have in the kernel (which
> was done independently to minimize the changes needed for the fix).
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This is based on top of the fix so that the fix remains as simple as
> possible:
>
>     https://lore.kernel.org/rust-for-linux/20250210163732.281786-1-ojeda@=
kernel.org/
>



Do you want me to pick it up to kbuild tree,
or will you take it with my Ack?

If you go with the latter,
Acked-by: Masahiro Yamada <masahiroy@kernel.org>



--=20
Best Regards
Masahiro Yamada

