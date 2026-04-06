Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96885F46C46
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkNm9wFfp98jb1LRjOKmI7vefuruoaGtzyUv1N7ItVU=; b=mWZrQU+qNl4sWfMgi3sqVHt4v0
	/6qfAW9NKeLroAqTmUYqWH1V+U0cjAFYhL4ILmyYrBu+8V6Y/m/VRufLo9AYo4ZYJJKZ23/BVS6TL
	47/1BzVzjuzhv9Z2sGKWTj3j9svWy4AD3lhqQqoOsYw6VKYhdpDxbNFInUEkSRTrFJkfwywVPmppm
	8Wcl8gFW1uHlCLcKwD0AnXnAgcQag4jYYtnPDnmcKFx6aqpp7NOlzZaESbB8v5YL+XeO3W9M0uLHe
	gHTVScKItko9aqnIKVlEAQmhnNtgle3KoI0X0ZL95qJZhkPZbrMN6lCGg4OTiF+OC47lSM7shv1V7
	Qz1sxYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kx5-00000005Bkt-2dVn;
	Mon, 06 Apr 2026 14:29:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9kx3-00000005Bjs-1L3d;
	Mon, 06 Apr 2026 14:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDC7642A61;
	Mon,  6 Apr 2026 14:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976F9C2BC9E;
	Mon,  6 Apr 2026 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775485756;
	bh=hQs1Tn9TC/fuoSSmmMaVRc8aMtneqBIGGyK2dnscFmo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=dRSvnYgZ8y+9NiMZOjUfwe4OjJV72M3gHcEolR8tMg0+XKG0e7wy8sJJa1vgsFLdw
	 c5CFD3Xucwz/io7Rpsfq1thQFQcPIRkLYLUPP7Y1y4I9b9KPB/G7mQhVM5TuGcd6gm
	 6j4o/t5E0/msw22ksl7ZTZX5i+G9zAy7YYwtPYx221YGT0Z9FD9uUy74kjVaXqtm3Y
	 n2mq1cThIix8w3e/hkBH9UlVKC3bY2TG7D15bvqQZPmyIzlg6q00tW5pIHF305QHMZ
	 T98GigKLXQQCyZiVCE86iP0fUgWjV2j28zjziqxOJTxW4KHZ7g2VhFATQ86+Kfh3KS
	 phsh/0bbvPSlQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 15/33] rust: macros: simplify code using
 `feature(extract_if)`
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
In-Reply-To: <20260405235309.418950-16-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
 <20260405235309.418950-16-ojeda@kernel.org>
Date: Mon, 06 Apr 2026 10:28:56 -0400
Message-Id: <177548573698.95472.15531781806867412060.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=508; i=tamird@kernel.org;
 h=from:subject:message-id; bh=hQs1Tn9TC/fuoSSmmMaVRc8aMtneqBIGGyK2dnscFmo=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJmXD+u/jDBy4Oa9bJk4w2M9B7fk4YfP510ojuW9dtlDK
 8//gb11x0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKnWM2JkmPtPyHGS6crEmrgGbgvtnyq6OeqXoizabv3atXTD0XW/fzEyfK7+xT2
 9UPeX0uOlbpUiO+eET1rG+2bCuhV3GffYBAk+5AMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_072917_515058_68A598B6 
X-CRM114-Status: UNSURE (   8.27  )
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

On Mon, 06 Apr 2026 01:52:51 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> `feature(extract_if)` [1] was stabilized in Rust 1.87.0 [2], and the last
> significant change happened in Rust 1.85.0 [3] when the range parameter
> was added.
> 
> That is, with our new minimum version, we can start using the feature.
> 
> Thus simplify the code using the feature and remove the TODO comment.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

