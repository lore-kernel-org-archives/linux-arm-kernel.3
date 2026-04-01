Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C981112242
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRry1b5PCaSUZ0UehPn1gur4WHq74MSPHuu9I8IdAKM=; b=kMBD1PxnI8eDSR67W7gCxRuGYO
	UBADRNVYR446uvm5AUSyE4Q3zIt2DVeM2V0zAZfvqQnjc+Cqrza5xkPB23V+vw9QLgkLqlQqw5oak
	rkeHOSmwwmxWuzDNP4lTZsSP/HFe7YUHrsP/5AgE4XfH+1OC7t3L3pDzRg1qlTF1EsGGwfDPQwIe6
	o7gQwfa+iT7g1ywgdselOjyb9qsBZ3u7iN+3lyUhWwSHUf6y+nNVyv+RCdhlXhvD2GYhGCMNJ5E97
	cS4t5LtoHEQ0OAWL5ANMyt9KbsOSQIEwLhKjI1JR0vgmCzZmTGNADzRas2hGPrnz4XqTCjNYaVqMA
	rqaiBL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Zk-0000000GPIg-3XGF;
	Wed, 01 Apr 2026 23:02:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Zj-0000000GPEP-0mim;
	Wed, 01 Apr 2026 23:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LRry1b5PCaSUZ0UehPn1gur4WHq74MSPHuu9I8IdAKM=; b=QcRJDSRczz+i2CcZ81bUVFzOxg
	psC1+GuIqvWz+Dh5tL/w7HdwDlCC+5aH9xVXzCcJ2gho0W0Bt5VX3rn4lhkIH0JHIIDV1/SiJFFKR
	qvEONRlz2yOI1OAuGETrE7teVlTzvmLeEZ5Wjh5vVZgzl2SfLxxCRCwb7PI3gzEvt/E+N3hmoH9Lp
	xS2VDR+/+sfRjSFZRzizFRHnIXQYwqQg133HklAQVjEy8WzGonFXIeOhddV9v+p01mGbOLMWEBdhe
	kkPhhEOnB8r/mzFYv+6zEUKGC4/te+myvBaN8yvsq3+/wDJnNYiSzM8zZK1pXTtRa0yiZQx0s+wL1
	OfseOoFA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Zb-0000000B9of-2Yrt;
	Wed, 01 Apr 2026 23:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 02BF3443C9;
	Wed,  1 Apr 2026 23:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BBFC2BCB0;
	Wed,  1 Apr 2026 23:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084522;
	bh=mIoLqdGB6FEaivDOYbSVC5sMk8eFMcAZ8xp8MdTnV0k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=ZXyGeWKi13Ct8X9D0547XxKoA9LfoDtpV+LhRj3iXOQd+bnjQ22veAr1KWQzEnIDA
	 kCTGsTKkVr/gscyEmrZwOvWOWJ7En260oBqHLZzHIzEAlkTuiEm6eUc5UILdqgZy+H
	 HXAequvu6ZpIY4U3LMW8wzpcshrEKczrtsPGEnHRqS7XkcXKcwcDDz47C4fWwDAXKO
	 OIQVKkdK/nf9H0jRFaReCDhlcyWz4+4QQtQPnKMye0CMmsL4cTMnrf7NbrpD+fnPzG
	 ktDfNcL8YfxyQiu9pd7SwNmlkrwL9bKsRyvSsH9EF8GOZzd/XyeyosIPxWhon0MbUH
	 E+D3sywT0mp+Q==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for
 Rust < 1.86.0
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
In-Reply-To: <20260401114540.30108-34-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-34-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434476.73816.11744805605122440072.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=490; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mIoLqdGB6FEaivDOYbSVC5sMk8eFMcAZ8xp8MdTnV0k=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7s6hUfb+jyd9vbK0ZWKNtIml3vZzdZu5eWV+2r4r
 rMtuaq8YyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFSr3mdk+LXi1KaghwuXvXvryuIh3xizmzukzafohmvWRgutvqoD3IwMq9NSuvc
 +cVOd5nUvf9cfyV0no/Naz6wyyv7a/lP08aU4HgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000208_774690_4753CCF1 
X-CRM114-Status: UNSURE (   6.96  )
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

On Wed, 01 Apr 2026 13:45:40 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> The Clippy `precedence` lint was extended in Rust 1.85.0 to include
> bitmasking and shift operations [1]. However, because it generated
> many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
> lint which is not enabled by default [2].

Might be good to retain some of this in a code comment.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

