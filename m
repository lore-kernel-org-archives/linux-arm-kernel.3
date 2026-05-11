Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31FACD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H14eAjov8dp7zxAeJph/4QZj8xDXhb6FCjRwRisaFI=; b=TYbWBaIyNLsF11uBG3wOxkS20/
	u0JnsqkY7sx+TOA9FTMZXUKAJu1R7LsIS9xElDRR+wXmQ52tjX8iYCWKy7Ldc6be9N4K6pICAAXXl
	xxZATe5r8Q/4/qqM8gij95HAI91ewt1RrKo1SzZmUHuAzoorhU6vYP/sG0pdqgMtHCKSR5f2z85Va
	WLQUhmQcKJrbEKFgxY9uh2ulySUktodL9MNyaCMEMrruTVr8amFAqGBMhsgh1T5ZBcpvAQiplJy9G
	wo4O585JsOcq9uQQHS/db/5C1YJQWWX3CS15RQ/+q2P+5tNte9qJ02+u+Ls93sk293WgZ/pTEL/LG
	IbNborkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLth-0000000CkNw-3oOL;
	Mon, 11 May 2026 08:21:53 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLtf-0000000CkMm-3Zar
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:21:53 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-44b186b715aso2557550f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778487709; x=1779092509; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5H14eAjov8dp7zxAeJph/4QZj8xDXhb6FCjRwRisaFI=;
        b=sqoFRXHmIwMbrGG7fIE+R3GLZQGWazfOKiSLgyW0bSV50XppXK86spIBaVdlxP3itk
         NPZKsAeq7XIEXy0m9D6vI2RVbq3lx71HN9SS/4cHuYKxN02t7vfo104pMJkpcfvpiBFa
         1nVJ4cHg3EgWwveP5yt8pctEDCgnHu+xfeKJQx+Wff9v9HrhtzhoW59XL5ZpAPD10t6j
         tL8d2t8i7EwuqrzrQVc64jYmpSQROYJ4VmyEN1RkzDmdgf3+bHSw68s5FSD2ff9f4K7L
         Jl5rfTkOSKzDy1P6Pf785d+mGGs+Z8n0UNLB5/2sgrmuDp5Rc4NXTdFhjMVvoJ5OkKX/
         JE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778487709; x=1779092509;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5H14eAjov8dp7zxAeJph/4QZj8xDXhb6FCjRwRisaFI=;
        b=PtjCsw5D+Ms90BKz4YP2J5wuSN5QEHYIOJH9bOW+qPLbeUfli9WmAfjnhe2ugKBXTj
         YqlQR5OuRQa/hHcs4p8H4yvW+Es3V3LWOQSA8Xs043dYoeN8WAbm4oT+JY9ZcRO/rJuD
         anRE3TmtG8Sk5cKROOI6c7weq/aQj8Wt4wE2NwxHObIL9i6dgF/3XHEOfND8N/QQBAW+
         Z69FGYMQJwfpj4ZzdQAI3HylNCmh6pOOyyTxo6Hi3Pz9iwdMbGENmOc65de5d1VtvZ6k
         +HRCfXv6yCTl2B+n+nP0sFl9gU465JJHLnd0Nphak43lBxLDvYmI/kLdWGcUyr4Ur/zL
         v98w==
X-Forwarded-Encrypted: i=1; AFNElJ+cAcFHaUGBlQHhckjnhbd0DZh7e8YIjoBnKWc6KEIovPKN5AwDslj/ACmdDUOBqVN7PD7se9dnAFA7CgT5Ub9n@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPgr49tfGN8JRMQlqviyC3nvp7B5+BRZ0HRCExPtg8f4gXwOk
	Vltk0I/77wYZMRm6RYmAMUn7/tHMgwRmHiMidyZVD/GwP2vQ4DjpxDS086R1NTzq67WJPDXggJ7
	DG4em58DUauIbrxfOCw==
X-Received: from wrqp16.prod.google.com ([2002:a5d:4590:0:b0:43d:6f59:cbd0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:288e:b0:450:e5fd:e1a1 with SMTP id ffacd0b85a97d-4515b05728dmr36098093f8f.3.1778487708994;
 Mon, 11 May 2026 01:21:48 -0700 (PDT)
Date: Mon, 11 May 2026 08:21:48 +0000
In-Reply-To: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Mime-Version: 1.0
References: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
Message-ID: <agGRnHVTLiwobb9W@google.com>
Subject: Re: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_012151_984243_453886EB 
X-CRM114-Status: GOOD (  14.59  )
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

On Mon, May 11, 2026 at 05:02:44PM +0900, Nathan Chancellor wrote:
> When KASAN is enabled, such as with allmodconfig, the build fails when
> building the Rust code with:
> 
>   error: kernel-address sanitizer is not supported for this target
> 
>   error: aborting due to 1 previous error
> 
>   make[4]: *** [rust/Makefile:654: rust/core.o] Error 1
> 
> The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
> saying Rust is supported when it is enabled.
> 
> Cc: stable@vger.kernel.org
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Link: https://github.com/Rust-for-Linux/linux/issues/1234
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I would probably suggest moving the conditions out to a separate
RUSTC_SUPPORTS_ARM config option similar to what I did in commit
d077242d68a3 ("rust: support for shadow call stack sanitizer").

This way it will be simpler to adjust this logic when the target obtains
support for this sanitizer.

Also, we may need the same change for CONFIG_CFI too.

Alice

