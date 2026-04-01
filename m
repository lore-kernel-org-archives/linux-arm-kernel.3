Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F921112245
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McLF2sdtUokmlMpfv7AGz7lZKpzhwFQcwtADgn2/2U8=; b=eqhuckix6dit4ndqA84aRO4qxC
	YjmCsN8FaOeCfSbnuzaK3saryxhX6wJh1ue+3IcmsROYONO9RkpF5pTVG/airsSvU0muEBBX6pEZv
	2oAyVmKBU0337FrRmhiic5KiaMJwEZII/1S3x+PiddJ0IofG2sm++8qOmh9l1xz8qYxhyu+TBBSHo
	xTbIyL081CNEdaQYNZ39UQcYZDCROjWbjd8724xntwc6Qc/LN945fvkaTN6OFmLhSwFB1GcTJOF8m
	jrsYgJVit5XzLEdtg/UdtyhuiQABp1JLg/t3tZKWrKLTCx+ekSYGjKquzAvd+njdf6O6frWCgsHXC
	tW0OtJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YT-0000000GMrl-3B9W;
	Wed, 01 Apr 2026 23:00:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YM-0000000GMg4-22X7;
	Wed, 01 Apr 2026 23:00:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=McLF2sdtUokmlMpfv7AGz7lZKpzhwFQcwtADgn2/2U8=; b=LLR4DjwhzFIvZMyFX68Ha8783y
	dYOPEOXtmDLiQtpW+emL26eoGTD2zsAY7rYkmfujL5KQdb863kPEnRLbCb4oBxJgFuvAqjySOICxn
	rUZZUa5wZhcyXjR09Y7T1VOyRWFjb4uzuoF1Tefr7M3XuMNSrPLkM8JfDGSHPsUpw0vhVW7JZnkli
	gsxm2svrGWEzmegjz5FsID5pmPWmp4MolIYy566khMLmgbKgFqlkZU+LGvxIaEOyLgMD4X2vp7FV4
	JungtdHciuA6TS25CDUMnmWBfC+GNtjrzafwfRtuRVtXfXyUs3ZzJLcup2tAV4TI7BkvMSQJK15Rj
	WbZSfZ8g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YJ-00000001R4X-0Hqz;
	Wed, 01 Apr 2026 23:00:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0226418AA;
	Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D37C2BCB2;
	Wed,  1 Apr 2026 23:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084445;
	bh=PBFIVlb3y/4+vIcT00tcSiDAg1EkUAKYUzmV5YKhJnM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=ZJatFFFkz2ZScBb/S4TpqCqmlU5CEjZqBFSOV2A6WNBXX8frktEMOQxLuaJ2zui7K
	 TxLAQ++0MI0i/ejdo+T8y3DBO4V58gFNwTbymjm5fDwu6axUpsx0S626SSYNAzrXui
	 e1eIupdeP7FHJUCMfFMrQDaczv1/dJhrNI7saTL0pBZvrmcWTrW0nafC7OliJNtKOF
	 AuSpTcBjZLGhiHOQICoxolcyoBXDzybeR0miWUG0/UGrBi/GbuRVRt8SPH6kA2Tus8
	 oRRSlmlRfvrM80vHQZInm2Y0P7R7TlqrqSzkmPpxE9E4S4Z+eVpQiiDUtv9UUCP830
	 eMM7ek2JPRPYw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 17/33] rust: kbuild: update `bindgen --rust-target`
 version and replace comment
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
In-Reply-To: <20260401114540.30108-18-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-18-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434455.73816.15756486388132647025.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=637; i=tamird@kernel.org;
 h=from:subject:message-id; bh=PBFIVlb3y/4+vIcT00tcSiDAg1EkUAKYUzmV5YKhJnM=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzs3fD173aT8/5+Ovnr2PRYiG1bqrWPgMY6xttK4q
 /CrtKSxYyILgxgXg6WYIkui6KG96am398hmvjsOM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFQ/LWD4w7kwWW/VxU2zXts438gISVTrqop+9/KT1f6iG8v5bDV9exkZurQMMt7
 6i16cW2b/YP3LZT9l/vRpFWZm6OW9Dvo5UTiIFQA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000047_463336_3FF9E712 
X-CRM114-Status: UNSURE (   9.90  )
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

On Wed, 01 Apr 2026 13:45:24 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> As the comment in the `Makefile` explains, previously, we needed to
> limit ourselves to the list of Rust versions known by `bindgen` for its
> `--rust-target` option.
> 
> In other words, we needed to consult the versions known by the minimum
> version of `bindgen` that we supported.
> 
> Now that we bumped the minimum version of `bindgen`, that limitation
> does not apply anymore.

Some citations pointing to the upstream changes would be good.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

