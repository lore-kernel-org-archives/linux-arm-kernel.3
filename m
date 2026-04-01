Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA0F1112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEfVtKe2dtJy7va4j9UwEbQQ4Lq6WN20hysSgq/MgJo=; b=Cf+f+9Ec0AqhirKzcqDPnZ1rYp
	qAqwJgATyda4YtXp0aXhsdjqOPCoFAbGVyk4yKT81xkaFqiWw/GW1i4QMtx3s2hgF303khxC1JIqx
	xTcx/THjf5LEPt2KcwhnGWoJeeYmjEx1tZw7qjpw8ZbPghDjqh3u31Kjrfswit2OAFuQnQCUqn7qW
	m5mM1M4uEQ8LTrDfz7Eqg4iD1wK+hYSa9rmd1Kpryl8wHWg2TQvrrFltFl84KOkJLM1QSC9gf24lF
	PknPmVo2S+LG9PME5qhNICD4QwW7Ug4N5hgw4oGPn1V9Owh0bah4GEPOp/l3d0NG7fvhUh6n7cYzL
	Xs2nOi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XG-0000000GLWF-051O;
	Wed, 01 Apr 2026 22:59:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84XC-0000000GLUN-42tT;
	Wed, 01 Apr 2026 22:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6896B440FA;
	Wed,  1 Apr 2026 22:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8A9C116C6;
	Wed,  1 Apr 2026 22:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084378;
	bh=kNWPNZPv5AJZXsbuPes0ElScqifYmuQXsRJThydCrms=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=SpxQlYzd4uQJCDoo3G1uLsZbGWv+MIW76Y01oAor/ISn8VhAzL8ca8LVPPgm5wJ7k
	 1IYnRaDxl6TCtaogMicQwqVu7t6a3KtRtWMRwk3Z3UF1PihJzRQvVHikJNsU6/8BLF
	 N2f3V437pqOD0OyYPS1JBD6eSIuqHQyNGr0yfJ/NRWdtzqXHnXADkmhAzYJGTOXadZ
	 oFSgKCzeUx0R3N30L0LXacIoJjkcRCSUKJLk/krBOBS4njzvdxSOEArxX/zs9G8Z4S
	 PcS7uUCx73rsiwR7sv0/kZgJQF/7hZETY3nE7bJFU9unkvdaW6MtX/vDRJ0IcCFGEn
	 mdj7JT6ErlYwg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 04/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and
 simplify code
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
In-Reply-To: <20260401114540.30108-5-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-5-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434435.73816.12811715375635165629.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=532; i=tamird@kernel.org;
 h=from:subject:message-id; bh=kNWPNZPv5AJZXsbuPes0ElScqifYmuQXsRJThydCrms=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzttDbkgadD08O8m0yXvWGMrZpq9En74+dEvzrtLE
 43n3bq0v2MiC4MYF4OlmCJLouihvempt/fIZr47DjOHlQlkiLRIAwMQsDDw5SbmlRrpGOmZahvq
 GRrpGOgYM3BxCsBUW7UyMjxtd/0svceDyUvuQs3pRdufG7m33rbc+6V4s6KZhq1voDkjw09uhYk
 nbhzsP8oqPW9PSdojxgrtssiDOicvCrqdmD0xjAcA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_155939_991953_66AD45A5 
X-CRM114-Status: UNSURE (   8.48  )
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

On Wed, 01 Apr 2026 13:45:11 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, the `RUSTC_HAS_SLICE_AS_FLATTENED`
> Kconfig (automatic) option is always true.
> 
> Thus remove the option and simplify the code.
> 
> In particular, this includes removing the `slice` module which contained
> the temporary slice helpers, i.e. the `AsFlattened` extension trait and
> its `impl`s.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

