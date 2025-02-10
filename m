Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39209C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5VAiCu9wsbnHuDb91xBNptjwUNAtJkr4ewb+2CdrpF8=; b=zkV4mTpjC8dC+bxpT4cJ+Oz8Xq
	idldL6FdmJsj8Z4xzGQySXwgrcSLcie23Wvuuvll95v0yvRYYknCMYqSqxiqVPMKypo3Vbs92Gnow
	Ba9dcbrQz9qFtujTM/OeqFg9B37T/OO+gyQy0ohzWXq30BG5fZa+p7kFpq9uPqYGC4Z1jLHtx8iuH
	zRIWeF9JjM9Tdhc5L5iR36JZ/p0wK8YWqqO8um1RYVm1ue5YnlbrnemcT8u6YvlV+Zo12AEdOlCL4
	NDCDiu7rSisMyR26a9SmVOufFoLlvXbrp4qhZsCuc/ef+Gbb9NSfK44WdglVspP7IOQ8EC3Nibcdx
	+2vll29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thXUo-00000000hvC-3FsR;
	Mon, 10 Feb 2025 17:22:58 +0000
Received: from gimli.kloenk.de ([49.12.72.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thXCu-00000000dn1-48rn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 17:04:30 +0000
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1739207064; bh=5VAiCu9wsbnHuDb91xBNptjwUNAtJkr4ewb+2CdrpF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jdYuO2hGhDTcdQKHK8/9grPS1mwoWTu786nKEmDrhgHW2Di0MGIN6zOrh4/TDYSVg
	 7R+wdKMiV1irQ86ZcXvZpluCO0bxtkZDkrXPLRTrIGp0wdgmh8Ni3eTW90+/ugLc5s
	 5EwprOknit5+ZtGbGdOKPegpDsQxwh8VkrJ2B1j0=
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,  Jonathan Corbet
 <corbet@lwn.net>,  Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon
 <will@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,  Nathan
 Chancellor <nathan@kernel.org>,  Nicolas Schier <nicolas@fjasle.eu>,
  linux-kbuild@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Andreas Hindborg <a.hindborg@kernel.org>,
  Alice Ryhl <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,
  Danilo Krummrich <dakr@kernel.org>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org,  patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
In-Reply-To: <20250210164245.282886-1-ojeda@kernel.org> (Miguel Ojeda's
	message of "Mon, 10 Feb 2025 17:42:45 +0100")
References: <20250210164245.282886-1-ojeda@kernel.org>
Date: Mon, 10 Feb 2025 18:04:22 +0100
Message-ID: <87y0ydafzd.fsf@kloenk.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_090429_166619_6AD93C1D 
X-CRM114-Status: UNSURE (   7.40  )
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

Miguel Ojeda <ojeda@kernel.org> writes:

> Introduce `rustc-min-version` support function that mimics
> `{gcc,clang}-min-version` ones, following commit 88b61e3bff93
> ("Makefile.compiler: replace cc-ifversion with compiler-specific macros").
>
> In addition, use it in the first use case we have in the kernel (which
> was done independently to minimize the changes needed for the fix).
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Fiona Behrens <me@Kloenk.dev>


