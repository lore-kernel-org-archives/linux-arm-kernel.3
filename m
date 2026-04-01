Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229591112243
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p6JpffBRR7v7TPIcdjPK+lmgyv35PebkTTYtaqTWCzg=; b=fjCfqfJfVqCf12C9/w9ZuqX576
	iT4BIGzxdY2d+0X7EE7OM0l9PqaJ6hz2nVrzoM8zygFQTem4hj1q4l3rqPmOCSOrIIpc0Kdf1M3Jk
	e+FKmQZIw9VDH9pfR0M/GVbxAqCixLwP703eWe3uGHjkP9XetfzyAnoT92h9CkMpKJ8XuFp2zs30T
	byR7zM/IsYKOewc1lK+yUMclgVhJVFMgGdkMKFIll2j81sxlFFeHfbQcXAPIpq82jf1ymgmE8g75U
	r1ioafDLvFfh0vELvPO2YaJA9ZnI059WV1396MhrX3J+FE1Hv2aA4DaDnrDpQBPD+s2CQHq4t6y6V
	JpH9rk5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Y7-0000000GMQT-42y8;
	Wed, 01 Apr 2026 23:00:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w84Xy-0000000GMKw-143Z;
	Wed, 01 Apr 2026 23:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6BDCE61340;
	Wed,  1 Apr 2026 23:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56866C4CEF7;
	Wed,  1 Apr 2026 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084425;
	bh=9r+j9aJtexiSdsnA3tlntaKZ+10b/6Dtb9uN5qz0dUA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=TNCiRvfRAoSiNwWajo6d0tXBALrIB8uy30x62v/7vE1DSF0tGUGBWvB9FNsMOGiOL
	 r088gtwia8jZfrou5153siQUWg+QidfxbyYB4Ypow5AdBNPcZhSf05qfgKMPzQ41a9
	 ZXJJmDCivwRwYQbl0M8qhWW5DfT1+KZpXMWTHvGtTkPFHjox09+X+JH6M8f8ul03/R
	 bfWcSI1kXTIk26Acc7x2QdVjBUaonzABDS6685jJZTEk+a1LrIQVA/Fz+zAzT95oPw
	 IRSzJuq6+jnD9s7fnI9D/EamdCfX7ZbISJfeRtyPKPcuVCXdSxdB5slSxvZxxG9joo
	 AfLBw3t3VswhA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/33] rust: block: update `const_refs_to_static` MSRV
 TODO comment
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
In-Reply-To: <20260401114540.30108-14-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-14-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434450.73816.3437422593454602087.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=tamird@kernel.org;
 h=from:subject:message-id; bh=9r+j9aJtexiSdsnA3tlntaKZ+10b/6Dtb9uN5qz0dUA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzvbH589QYvn/4oPv4Xey3uvd0h7plq9692z5dJ5b
 wRSd+gWd0xkYRDjYrAUU2RJFD20Nz319h7ZzHfHYeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdAx1jBi5OAZjqgpMM/6NnThCWnqBawfDCSNE+6vHTZwuXfX7lr3Th9K4XsjobdTYzMrS9mlI
 WcW7lHu1jfq8uugXyGtpkcCwxlc5QjlVaIdopxQAA
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

On Wed, 01 Apr 2026 13:45:20 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
> index c8b0ecb17082..912cb805caf5 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -140,9 +140,7 @@ pub fn build<T: Operations>(
>              devnode: None,
>              alternative_gpt_sector: None,
>              get_unique_id: None,
> -            // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
> -            // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
> -            // <https://github.com/rust-lang/rust/issues/119618>
> +            // TODO: Set to `THIS_MODULE`.

Good first issue?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>

