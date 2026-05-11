Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC381CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vq3qMj5Oi9c19WiJTo1Uhg9LI1GwRgCuNwJIgfty5N4=; b=puTY9mApi9r82JQlD0rpfZ3vam
	lSNIKWyyF5Z9hYyksIDXpf7UVz58Gx33mKjKOuzveqLj2penrAz3BdR0ss9joAsqIcGoPuvk06DGM
	45f0TGHSyrqB2+PuUsc2cMP0cl8KZUAgld3Ml704CQGRPWby2R2qp3P2mePUxCiDO6qOdksHxqPSS
	3Uj1vqDkMOCV8f2MJfqXoHl/UoqZ3POvRA1O1D3uOt0Y1Goi5FzbAa9uuf0hntfuKWW6Syq4abPTF
	Ko0zbLM3b6PsfsrBbmjh99krak3aJNhWACurWo5HGIHwW665Db4JetN+YrVHFCQc+DafY0G2r3vMm
	WU7+lAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLbS-0000000Cgww-125t;
	Mon, 11 May 2026 08:03:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMLbQ-0000000Cgvw-0WA5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1120243AB0;
	Mon, 11 May 2026 08:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC324C2BCB0;
	Mon, 11 May 2026 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778486578;
	bh=It0UcQorJluW7DgSSaBTE6pHf5/fv6AYoJYbP19eZSU=;
	h=From:Date:Subject:To:Cc:From;
	b=UFTwsfwxKWNEJ+d1+AMbhYXFHXxMt5ffMSx4NhP66BoAaQDtEYyIqBl4dJH0EXlt9
	 UvAnIDj4ndGND5h17/pJ0GJBKHf0AUHJ23Q6WfdQ4yRn8niRRteqcLQAmwrSrLkGxk
	 ExkQPL2b+BpAHjredA6GlYu1xEkPBnhUA57MnIw3Ncr31SICfN0ydIHYPaZX5YbrRQ
	 zHLP4SZD+qWeW2BRlB8vzHDI0p25GTkNak8J/1Sq2Srzsr/hyfZTvuZD8XWTHh5OAj
	 w+cY8S8eUtmPKjLZNDfY+U6UPX/xc24c0WTlJ1Wq5RLBdIbziWoBdTpbDyy3PhId7t
	 Eqek41CKpGEDg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 11 May 2026 17:02:44 +0900
Subject: [PATCH] ARM: Do not select HAVE_RUST when KASAN is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-arm-avoid-rust-with-kasan-v1-1-24d55f4a900b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ6CQAxA4auQrm0yQ8KPXMW4KFCkGgbTDmhCu
 LsjLL/FexsYq7BBk22gvIrJHBL8JYNupPBglD4ZcpeXrvAeSSekdZYedbGIH4kjvsgoYFVW7lp
 7Huq2gNS/lQf5Hu/b/bQt7ZO7+B/Cvv8Ax+2FVH0AAAA=
X-Change-ID: 20260511-arm-avoid-rust-with-kasan-7670981ef8b5
To: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344; i=nathan@kernel.org;
 h=from:subject:message-id; bh=It0UcQorJluW7DgSSaBTE6pHf5/fv6AYoJYbP19eZSU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFmMvfpmFSmmelMTGh4dvJJef0d5W/jHdqFVtd94/ZZdk
 A8uvifYUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbicIGR4euNn/bKHedeTr3y
 9dcLqYN35qvOvuOm4KuzWW6ZDM+ro48YGbq8a+2tSy7F8grtVXi1q/uGpoOz6URWB7bfbxjOn01
 0ZAAA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_010300_232082_401BE427 
X-CRM114-Status: GOOD (  12.71  )
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

When KASAN is enabled, such as with allmodconfig, the build fails when
building the Rust code with:

  error: kernel-address sanitizer is not supported for this target

  error: aborting due to 1 previous error

  make[4]: *** [rust/Makefile:654: rust/core.o] Error 1

The arm-unknown-linux-gnueabi target does not support KASAN, so avoid
saying Rust is supported when it is enabled.

Cc: stable@vger.kernel.org
Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
Link: https://github.com/Rust-for-Linux/linux/issues/1234
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 71fc5dd4123f..73e6647bea46 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -136,7 +136,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260511-arm-avoid-rust-with-kasan-7670981ef8b5

Best regards,
--  
Cheers,
Nathan


