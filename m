Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D784D1112240
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WU9XA7W6KdmSJgeYyHA5uqJnXYc4vI/RM6V8K/tKbk=; b=WyMhrCJkeb51YeKPz1wceQdjRd
	5NYsT03PI2rCfJDsZISi1JDdxGpd6szCO9giHWopvX3sCOyl4A/1hlQsaF7Mv4hGVfq1nQcig0eWK
	lOk7l7SfmWktPLYR0Kgh5GPKANn7Mr9gVa9AJKuYFxLt7e+R36z4q+TQUmYZJZo2zhHM9ZXVxu6ev
	bllAcVUUTGbEMwIarusxghtlt40gtolMON+452r2I1Yg3+MCOqZCCEXD6vD2lOjlg3zWI1zQu28hG
	nQiJQj4vhmp3z4Ze8/5xMGyGEj13qz5XLT42SFxpVhflIDkjo/0Bn7vEJROQeuhrJDPu6FG/DbUCQ
	ln3j+0hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZW-0000000GOsh-3qHP;
	Wed, 01 Apr 2026 23:02:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84ZT-0000000GOkY-1DWL;
	Wed, 01 Apr 2026 23:01:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B3B661339;
	Wed,  1 Apr 2026 23:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8523C2BC9E;
	Wed,  1 Apr 2026 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084517;
	bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=UMSgCFmpPFESaRAbvbhDhQiCJwvV4rRI29EQmB0081nHG47VaoK9DsZ87N20ilTx/
	 obHtZ+aT5eDe/3CUF+QYMPNqdkzwcsrBaGB1uzVm0pfcDYp1VJCmo1jL/0HIoM5RNj
	 iTgu7PyZZxOsj1m6IjusGOJ8iwfJNFnzHmJfDNcZtTbfSTgPXc+UHvwPqOeAhJLE9x
	 9u7MJDThp4/mCBjG1VZ4wucl6sy1ZHstjCSifT+LAuUqrMCVKULTuDsCABCCXg5Pcu
	 NYCkfoRZxaFdEAWjprgGpGCncCf/8BXJkgVTpuN4aIwNu5Zj1mJbJXZWpJ0DCEQqMU
	 VoIcuuTDapCwA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
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
In-Reply-To: <20260401114540.30108-33-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-33-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434474.73816.6769206170563558152.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=tamird@kernel.org;
 h=from:subject:message-id; bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tyXN4UGNjIVv7Oan+7TIj6c2bpm5kOwsVmLFFFf
 8NvnHXomMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNVZoYwMb+bI30yW8DzreTVxsqJRzf+lz5/tNI542cmT8HXZjAvVExn+h3398Mm
 ieVJUs0Cb2/LGPIbW10HT78y/fv6PU+iXZ/O/MwIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
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

On Wed, 01 Apr 2026 13:45:39 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> [...]
> defined after the `include/config/auto.conf` inclusion (where
> `CONFIG_RUSTC_VERSION` becomes available), and append it to
> `rust_common_flags`, `KBUILD_HOSTRUSTFLAGS` and `KBUILD_RUSTFLAGS`.
> 
> An alternative is moving all those three down, but that would mean
> separating them from the other `KBUILD_*` variables.

My prefernece is avoiding duplication over grouping, but either choice
should be justified by a code comment that acknowledges the
duplication/inconsisntecy.

-- 
Tamir Duberstein <tamird@kernel.org>

