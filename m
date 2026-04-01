Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646811112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BNeyTKVO6TAfRT6da+L5Y93BPVFp4AkkIZP5BV1Ee8=; b=Qn1S15M/rjcnBGO90fa4PRfYhJ
	Me84RlWNUE0RjbafRJQg77P2iAD8rydnuc0MLy/LzOHaNahwrTUbWj+mzvPJq3yqSB3a79+g+xQGT
	VVKNSAnwnHyeNNACYZQuE23T2OnoaRsuNTJ6vu8RGXwzpzncvmUCjgPH3j0v56NK5bE74gvDK5VFY
	alaZ6lYwls1cXmdNG1oc2oNzydb1/NPz2Xb4JRSAY5msqGPes23rlSIGSx3Ms8NkR6iMUCT7nmbFr
	4Q3cJwEVYTBv3EnAlNvzkaVcfOl6XnPcXT/j4v8HOUndHh+u2wiW2Grdsx3bHXJrZwzorwrKLQdFi
	FDrbtvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YZ-0000000GN2q-2UGI;
	Wed, 01 Apr 2026 23:01:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YS-0000000GMly-0ZmG;
	Wed, 01 Apr 2026 23:00:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0BNeyTKVO6TAfRT6da+L5Y93BPVFp4AkkIZP5BV1Ee8=; b=NxqCs8ZpDoSKqr+d6tRjxEfOFR
	0f0Ya5vvODqSd/+VZhHGR3I8U3LrJ1psSbBqWuth/og3XLmoterphId7+nTpHKJ+WfO4/koCNUmW2
	I6H8xjFqfLlwUoOLAvzSJgZDLUSpxHRCMcFe9mPlsQQWWNycC17IgIwJz2xH2ueNbrcHCj0spAiD/
	7s1jY6VTCH4bToNK/+wY4n22V+t/jIUi56079e2VZcX5zhSoLBtkmLn+lCw5Fhz/abjrxH/WTMG6y
	WDUk50osTrTdeSJYlQBm6R1/RF+h7lDCGgdmOmUEK6MXJpacDE6nEob1Pq0T3Ryq/jH+GkaCXP8Jy
	nyj6dtlg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84YO-00000001R7u-1u2N;
	Wed, 01 Apr 2026 23:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0BE243B01;
	Wed,  1 Apr 2026 23:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F8BC2BCB3;
	Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084450;
	bh=L8JME5DgePBPrx4n+T2YtWB9P6u86oez5ABp2z3CNBA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=XQSUAhehK0geqbt+sp4fwR2MHzqQqgmyyza2UnqK99FLKtZPX8PbhFgagoLwnWdAi
	 A9uW7qhg1C+WKQNNQJ4vNBoC8JXS68HsTSryHtezbW548hEJOquK/PM01kl/j89c/f
	 ih8g3oNWTWFO1MaLODitg52leiBGTbkxz6aYWXplYU8puqoYtpqPyG7/ywmv6jdkg4
	 AyB4hcxDwgZeGNJgnI9m68RvOZW/AzDoZ8pLjYB1WsSkifuvQnIeNfN/pFZtBdF4K6
	 0PalwENmSLkuvFHYnm6l5DnOL2jZ9sMtoZUArx9XSiQcwfnoLzFHlQYB3YabNlWmEO
	 jrlC7XHARUJRw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 18/33] rust: kbuild: remove "dummy parameter"
 workaround for `bindgen` < 0.71.1
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
In-Reply-To: <20260401114540.30108-19-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-19-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434456.73816.17651402081142880831.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=315; i=tamird@kernel.org;
 h=from:subject:message-id; bh=L8JME5DgePBPrx4n+T2YtWB9P6u86oez5ABp2z3CNBA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tsuPi/M7kgl+fS9lvTjjNurz7ibmbL2VVoZaIdt
 un9n7tMHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6VCgjw4v/PZN5Nk0NjzqeHyr4dklm/dxVmTFP/8cu6j8cxxydxMHI8DJEqva
 J+w4L6+f+33+wndDmXuhZ3uDQ1f5l0UW7+TdO8QIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_000052_988800_CD2A1CD5 
X-CRM114-Status: UNSURE (   6.81  )
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

On Wed, 01 Apr 2026 13:45:25 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Until the version bump of `bindgen`, we needed to pass a dummy parameter
> to avoid failing the `--version` call.
> 
> Thus remove it.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

