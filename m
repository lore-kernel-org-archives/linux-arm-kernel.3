Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC465D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0NBfAnIQSN6Y7GA4eu7XZT+oa2B4bEOQjyXTTgYNgI=; b=QEyTfPJEgYyXKmKK38/m0TAAy/
	rK7/wFbGho3RxyN+5p1RwoJERXgk7wu9EC7ICupOYuFQAm6uZtmMi8DhQ4ZFEmCdNBfJyuH4Dn+7E
	l+aknjjwuqxGh2zky8eQoVYnFRyTfvalLTy9WoEW0mXUBtTSX/i8hheBGjiaz3KCZ2yFKWbMUsWst
	E2L/f0xhxtTDC0aIo42ToOITPs6+jDOzfEo563SamEIz5t5mZnW7IldqoW6dALsHvYxkHuFobHf7K
	rAnqUh60H8oC0RamhICREDEAqByqxVtnanC3SKFomBBuUmzUxTWnMhF1lJJVju9vfBkHvwLw5UaYF
	gzvDo2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5S-0000000EioZ-1O9I;
	Wed, 01 Apr 2026 11:50:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5R-0000000EinL-0vyu;
	Wed, 01 Apr 2026 11:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=n0NBfAnIQSN6Y7GA4eu7XZT+oa2B4bEOQjyXTTgYNgI=; b=klUmzbW8aoTRXnb+ZCX+GoWIya
	lkK5eLQBkbd7YHUE6mh8EdgQgLsYND+KojNZv4a4w+KJebxb15OSfRVFb4k90a5W6rFunWDur9tcm
	gg1MHAL4UGSx+kd9FFBfIKfOHMfxryuZpG6Pbr/RTQY9zktBHAR/cRf4/ahd0DGMm2IPeg0I4f88g
	Lvtzt0I8sOE1U7W6JgbMS7Isp3AuAby032yyuhBUHqpCRsUEFOdYQHvE3+/5hhV3V61qOAeGMEyFN
	/5CPjyog3s45pZ9pDcdutS+eRY3IgtU8UlWok/ovpX5lp9PImKpyHPSzjQm/3Jz9PCJsed9xhm9SR
	U56eJQPw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7u5M-00000000FNw-3rHM;
	Wed, 01 Apr 2026 11:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BFD0407BD;
	Wed,  1 Apr 2026 11:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1EFC4AF09;
	Wed,  1 Apr 2026 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044211;
	bh=iISLHJsJQiyE5V1a4iQF3ymUr2P6zTU39tNtCIX5lU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwH43iMXpXDQcRy4+AMfSoYea42pNLVjzuMUPXqV9lyKyZIS7rRAiS9cIgTsQsdyd
	 j6B+J+/pu75uzOpJdnOhGJFNMudRyhbVI5dSzB4BiQVbTcwkXAFXR8xUeur9CaaAtt
	 JILD8rNL8BETCD7dVZ00oT076Wj2GzJGGKGV6CXrVenq2zJx1Lq8ByMqTLw1UKAF4R
	 wf7/Ah1lAE4c15DAF/slU0ZwiQvEKjx+rSuvc5YXtnnEw53F1u8bcFjkR9SONe1CBC
	 +R4ZEzhNp4MYwVjW3Cv+ubljVX44Z9Rv2JtwQix1BCDgnfWCo1kCfKXLTfhQHkzxsH
	 iTdb7Dl5K7QVw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 21/33] gpu: nova-core: bindings: remove unneeded `cfg_attr`
Date: Wed,  1 Apr 2026 13:45:28 +0200
Message-ID: <20260401114540.30108-22-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_125014_703529_5399A4ED 
X-CRM114-Status: UNSURE (   8.07  )
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

These were likely copied from the `bindings` and `uapi` crates, but are
unneeded since there are no `cfg(test)`s in the bindings.

In addition, the issue that triggered the addition in those crates
originally is also fixed in `bindgen` (please see the previous commit).

Thus remove them.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index e99d315ae74c..2e6f0d298756 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -7,9 +7,6 @@
 //! This module may not be directly used. Please abstract or re-export the needed symbols in the
 //! parent module instead.
 
-#![cfg_attr(test, allow(deref_nullptr))]
-#![cfg_attr(test, allow(unaligned_references))]
-#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
     clippy::all,
-- 
2.53.0


