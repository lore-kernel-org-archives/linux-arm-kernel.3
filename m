Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B1C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99L0f4fyKtBRiaaLd1wQqPnLihJ1db7S60JDoDfltTk=; b=yLe2mC4kRPYPbU2c2lNNTrApFI
	bqRFdxgQkuzmTbRmFgepGalqoAfrdU6k2Q7n5R/5vqFIV0xsZnFigPm5WsxWYoDx3vFRMB9dx4QN6
	zDZRrhdaXxqbLRddcS/vOi0IszzH78H5LXlhyBS7CmsJx033H6NyeJdwrUBHPnwRj10vqehDPU+z9
	44zV2ZK5xKO+mLg8494OGu8QyhVDwMmizwgdtDUG8PaanYVYwC/BFV96aBChgVDPUzemsX2HLtOdW
	l2OSvOJWKy9r9cfMEFXsBC8q6Kqlkt7GM78ia8FMI4kxSXV4w/uECF1ABc+dx4JBXOckfXy/SxmYS
	NgZhwHpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZok-0000000BFXY-2Y6d;
	Thu, 13 Feb 2025 14:03:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZkK-0000000BEOn-1oCC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:59:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5EE07A4253A;
	Thu, 13 Feb 2025 13:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F22C4CED1;
	Thu, 13 Feb 2025 13:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739455155;
	bh=kv8C+kxdksKQcbyaE9UMSrjCRll+aHQKDRacT2Sl+DY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qn6f0oGkfzm3ZF9c8O9NpMF2Q7fffS0EaCnoaKJ6Eb93wi7isvxhmY7HYv66J/L0o
	 LPxRdwJGBa92FKp35t7YYtP3kS8vQsxcgj1zRbHE7LU18NonBDr/m7+N/rEzSt6y5H
	 +nyidMsO87ldbfNBgD48xh3+tJm0jfTWCHn3XdzJQ1W/dQ4nsDlQ6NnRy5Kt3yQrmr
	 isfhA7Yiqa6By/qm3oA8K74ldOI+OTCTjlQIkEXOEso5aGVeonJOl5iWCtAMBZUQHv
	 rCah0T0Ly/TM07li5RwXINzwO7uKIXJpVgfF/dqwjxEPyVcpH3RGHtRPSejKJU+04f
	 B52m23KMCijaw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Matthew Maurer <mmaurer@google.com>,
	Ralf Jung <post@ralfj.de>,
	Jubilee Young <workingjubilee@gmail.com>
Subject: Re: [PATCH] arm64: rust: clean Rust 1.85.0 warning using softfloat target
Date: Thu, 13 Feb 2025 13:59:03 +0000
Message-Id: <173944714987.2610867.13703061512287477883.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250210163732.281786-1-ojeda@kernel.org>
References: <20250210163732.281786-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_055916_542369_D94910F7 
X-CRM114-Status: UNSURE (   8.79  )
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

On Mon, 10 Feb 2025 17:37:32 +0100, Miguel Ojeda wrote:
> Starting with Rust 1.85.0 (to be released 2025-02-20), `rustc` warns
> [1] about disabling neon in the aarch64 hardfloat target:
> 
>     warning: target feature `neon` cannot be toggled with
>              `-Ctarget-feature`: unsound on hard-float targets
>              because it changes float ABI
>       |
>       = note: this was previously accepted by the compiler but
>               is being phased out; it will become a hard error
>               in a future release!
>       = note: for more information, see issue #116344
>               <https://github.com/rust-lang/rust/issues/116344>
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: rust: clean Rust 1.85.0 warning using softfloat target
      https://git.kernel.org/arm64/c/446a8351f160

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

