Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF0FF5138
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezxYGDLbIpJfhedHBu/G6U/yF1cUvLSAG24BHXC26WY=; b=qOkINUZnZPK07mcABqMWchQE32
	kgMk9/aD5u9uOa66MgPyoMl1MjzDqwP492dQZQNWMjwj4+Gh4LsS+jljHgW7ebhTGwsQavYeGzb24
	YQT+AUcTfoYafIYRDxuKfJDVzyz/gLV6aUqQFG+U8rApx86y7fmaCsJUaZL4jH8WXICcO2h6Ld575
	r2pFssmrVjsq8rTlzsqBcEE8LoG8Xoyb10ug26fiWC38dzyD/ATGEVfkvcmV3ZGLQiVE5/mg/bDq4
	w/RW7WxCemIExHmBxALgH/2yMkfwvWv5QJcqXyt/NlK6fQzOhnzNo61XpHcuZhiwZE0brxoGR/5T5
	dyq0b5/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wACHI-00000007IMJ-0XdM;
	Tue, 07 Apr 2026 19:40:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wACHD-00000007IIe-0YVp;
	Tue, 07 Apr 2026 19:39:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDF81444E8;
	Tue,  7 Apr 2026 19:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D7DEC2BC9E;
	Tue,  7 Apr 2026 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775590794;
	bh=VUPbEqFGGbOFWIwXYHWvivFzwPWAABqvcwZPV7b0Qgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=svL9lTOTlQvQW0aFeFKP/n5yfvO3GIW0MAh6CQjV8BDjzRyW110HJqQrlD2OHyqtS
	 Q692ehekWJW1duvyjeW/LnXHSp1n3mpWZaBk/xLCaLVeBZEkNI7D1oxaJlKWl+nRu9
	 MD9N2qhC6DuDbgoJZ4YDrVlvpBOJ7yNWOojg41Ywe36x+PieL81EJg2L9U1AoNe0bS
	 n1kxPN3enhPp93NsycEDtH74lRzyCtF+jbuz4X/nLe5ukrZT49KmvSpj5+6QeACdNv
	 /8Enc1MenSmwjSptV9YecbQcl0TXA+nhfF3Bbo3ytWFXK7DZley68PuTxeTONWE4NR
	 aRSRs5uDp+BcA==
Date: Tue, 7 Apr 2026 21:35:58 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: Re: [PATCH v2 33/33] rust: kbuild: allow `clippy::precedence` for
 Rust < 1.86.0
Message-ID: <adVcnj-bD99tOWDy@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-34-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405235309.418950-34-ojeda@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_123955_209677_251C6A1F 
X-CRM114-Status: GOOD (  16.11  )
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

On Mon, Apr 06, 2026 at 01:53:09AM +0200, Miguel Ojeda wrote:
> The Clippy `precedence` lint was extended in Rust 1.85.0 to include
> bitmasking and shift operations [1]. However, because it generated
> many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
> lint which is not enabled by default [2].
> 
> In other words, only Rust 1.85 has a different behavior. For instance,
> it reports:
> 
>     warning: operator precedence can trip the unwary
>       --> drivers/gpu/nova-core/fb/hal/ga100.rs:16:5
>        |
>     16 | /     u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
>     17 | |         | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
>     18 | |             << FLUSH_SYSMEM_ADDR_SHIFT_HI
>        | |_________________________________________^
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#precedence
>        = note: `-W clippy::precedence` implied by `-W clippy::all`
>        = help: to override `-W clippy::all` add `#[allow(clippy::precedence)]`
>     help: consider parenthesizing your expression
>        |
>     16 ~     (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT) | (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
>     17 +             << FLUSH_SYSMEM_ADDR_SHIFT_HI)
>        |
> 
> While so far we try our best to keep all versions Clippy-clean, the
> minimum (which is now Rust 1.85.0 after the bump) and the latest stable
> are the most important ones; and this may be considered a "false positive"
> with respect to the behavior in other versions.
> 
> Thus allow this lint for this version using the per-version flags
> mechanism introduced in the previous commit.
> 
> Link: https://github.com/rust-lang/rust-clippy/issues/14097 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/14115 [2]
> Link: https://lore.kernel.org/rust-for-linux/DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org/
> Reviewed-by: Tamir Duberstein <tamird@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

