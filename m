Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C11112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZ75aXwbDi6PBlcGyy2PAZzqBBuT3ANXdVnCDScRx2M=; b=pr4PL9LHp2XODOCZj16fWeHNX0
	RAhW/j1EP1E5EXrOytmzHvFMG2mrc8WkQY5LC0R45vjgMRcPDQK5A5WbJX4cy5frMypiGPH3SYk8L
	pxBLOhMgJbOBQiwb3ry8pQVVPm1bsGEJhxG9ZbLR1B640Z20MvSkMAE+Eu2wvxQkbQZR1pX/sv9tm
	ApgE+3zqRLnlkXuCPYNHDopqyN7EmxvXQybjYhj54Re682vXnP7UtZ/ABOLbi5y7TvqhRVc2PQziW
	TgJZjKdyVDXh6JsLtcK7+p2gqZhFfgQwj2DreRwkj5HO/Q9oa3wqkNwENGXxgbF+rEhE9YzVvsJck
	Cltdoiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xa-0000000GLt9-0NrS;
	Wed, 01 Apr 2026 23:00:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XX-0000000GLoQ-0RJq;
	Wed, 01 Apr 2026 23:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C26E2401BF;
	Wed,  1 Apr 2026 22:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D93C116C6;
	Wed,  1 Apr 2026 22:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084398;
	bh=fqu7rrOs0OL/Tb+VSqQKqwQjSGQycaS8iS2//8/RxF0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=c3Yd6ysnQsGvROMtiSG+i3keeAySaiEerx1F2TBjnnkbqAXThe8bhBC5TmfGTw9Ll
	 iM81wVmrttBVfy5JGtlkpYWTB5ilbanIlMhp0u4XLelpZ54ZBP9JGO7PEfdS98oppP
	 y1H/3B42flzzuBQD0t+C6ViMRYVYqRKw6ppF4wNedlfutWkS1yja1IkZ7vaakl9Efo
	 IKyM2ubpcSiV/tFrD+PTVckV9ziEPjgOBuaWD4QFRsvbkk4PqOy2XpnWUC1wi9waM7
	 +yybB8tYYyxCkeQF+HluEUtULU29DO+VEutqMf9F51Xq320twioy0N0OMyWPyHHuGK
	 7JSnJjlMo5Dpw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 08/33] rust: kbuild: simplify `--remap-path-prefix`
 workaround
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, 
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
In-Reply-To: <20260401114540.30108-9-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-9-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434440.73816.18221552058190562777.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068; i=tamird@kernel.org;
 h=from:subject:message-id; bh=fqu7rrOs0OL/Tb+VSqQKqwQjSGQycaS8iS2//8/RxF0=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztxvDld6+gaffHc/FPfFslrHQpc18Fd91tnQkf8u
 4NCctUdHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKY6aQXDb9Y/z4KOTNn7TGbrdYcmuYmuSobSbdGFPlXr2/x/qzq8V2Nk+HB8ce+
 j1zZzz6+zOelcOtmmT6rvz1aj+a/nK5UETLn5jAUA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_155959_193213_9F461E50 
X-CRM114-Status: GOOD (  15.37  )
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

On Wed, 01 Apr 2026 13:45:15 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:

Does this simplify the workaround, or just remove one instance of it?

> [...]
> 
> Note that commit dda135077ecc ("rust: build: remap path to avoid
> absolute path") re-landed the `--remap-path-prefix` flag (together with
> `--remap-path-scope`), so we keep the workaround, i.e. an alternative
> could have been to simply delete the skip entirely, but since we still
> have it and it will be needed when this gets merged, let's keep it.

The use of "re-landed" is confusing without a mention of commit
8cf5b3f83614 ("Revert "kbuild, rust: use -fremap-path-prefix to make
paths relative""). Though this whole thing might be clearer without a
mention of that history; the important part is that there's no
conditional use of `--remap-path-scope` in the base commit but there
will be when dda135077ecc is merged (the use of "this" in "this gets
merged" is also ambiguous).

>
>
> diff --git a/rust/Makefile b/rust/Makefile
> index 193cf06eea64..708530ee3613 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -142,10 +142,9 @@ rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-a
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
>  doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
>  
> -# `rustc` recognizes `--remap-path-prefix` since 1.26.0, but `rustdoc` only
> -# since Rust 1.81.0. Moreover, `rustdoc` ICEs on out-of-tree builds since Rust
> -# 1.82.0 (https://github.com/rust-lang/rust/issues/138520). Thus workaround both
> -# issues skipping the flag. The former also applies to `RUSTDOC TK`.
> +# `rustdoc` ICEs on out-of-tree builds in Rust < 1.87.0
> +# (https://github.com/rust-lang/rust/issues/138520). Thus workaround the
> +# issue skipping the flag.

_by_ skipping the flag? this is preexisting, though.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

