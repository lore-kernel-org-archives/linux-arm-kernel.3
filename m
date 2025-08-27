Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B14CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfZ40MYzTuo/cWhZeHMmPD0kKKXH2vgU3BU0A35AjaA=; b=tMfRgq5sW+POV3GLADSeIjVpdI
	0ra3Eza/FfI4LKg1a+j+vCpE1TA6CZ/O0QXdsoNBIDDwIn6E4JLS6cZOdUpOc2YJLGZfgFyPGOZ/A
	ceWH4dNHNIk8dzG8pF+K9w2qstEEnh4n0/YgcyPeCSRRzJcoIof33LI5HT5IO4MlPK6sZcgR/me+P
	TOOPQQ7DsT91bSONnjTZEvU02Eq4x7oTkihLL3wK1n18cZpg00BauW7BllK3stbnk3cRpNt8jTrFg
	ZXQ9nkuC7/gx2xdDQNe7zgYbir6Zez6wYmBvjjfuURcxdwvq9kRcao0vTLT0YVdxjxceHi3rZw2JA
	Kg1Pw7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urK2a-0000000GKaY-3w2N;
	Wed, 27 Aug 2025 17:34:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrX-0000000FsiG-3D6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:15:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FFA843722;
	Wed, 27 Aug 2025 15:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19953C4CEF9;
	Wed, 27 Aug 2025 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307699;
	bh=NFRhzN4wSBfaVwKEFKFe99szQNdk4fuv7Txe2nbhvtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sQRVjO43EHxUlBVbNtQiqiymZScScOs2BakOrDe6zxv9CAukxhhGwL5UrzXyai7J4
	 eeRtxBTdguK+xrbqVLm5YkL9pMSnRselFMCPyjETrvVmuZB7colKipPtz5zNevMymN
	 G50RF3C6C78aVSnYk8SpOZwr+OWs7NmdFvuKF+NHGtvJ3b/MxUKhFRM9AXlXnxa9Tk
	 oN340/40uCL5zzxLs5j8iXgfIchEPlf94CUFJvFDQ3zq3c/QGYSZGjCnERdRKmxsr+
	 D++1E1ePxwWTtNvYkorsFEzNrKccjoOeH1Ikc/rgzDzqtPynCSm+j43ln9i4dS1oaa
	 QyqJr1BnSW9pg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/12] lib/crypto: x86/blake2s: Reduce size of BLAKE2S_SIGMA2
Date: Wed, 27 Aug 2025 08:11:26 -0700
Message-ID: <20250827151131.27733-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081459_853053_3DBC9DBE 
X-CRM114-Status: UNSURE (   7.83  )
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

Save 480 bytes of .rodata by replacing the .long constants with .bytes,
and using the vpmovzxbd instruction to expand them.

Also update the code to do the loads before incrementing %rax rather
than after.  This avoids the need for the first load to use an offset.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/blake2s-core.S | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/lib/crypto/x86/blake2s-core.S b/lib/crypto/x86/blake2s-core.S
index ac1c845445a4d..ef8e9f427aab3 100644
--- a/lib/crypto/x86/blake2s-core.S
+++ b/lib/crypto/x86/blake2s-core.S
@@ -27,23 +27,23 @@ SIGMA:
 .byte  2,  6,  0,  8, 12, 10, 11,  3,  1,  4,  7, 15,  9, 13,  5, 14
 .byte 12,  1, 14,  4,  5, 15, 13, 10,  8,  0,  6,  9, 11,  7,  3,  2
 .byte 13,  7, 12,  3, 11, 14,  1,  9,  2,  5, 15,  8, 10,  0,  4,  6
 .byte  6, 14, 11,  0, 15,  9,  3,  8, 10, 12, 13,  1,  5,  2,  7,  4
 .byte 10,  8,  7,  1,  2,  4,  6,  5, 13, 15,  9,  3,  0, 11, 14, 12
-.section .rodata.cst64.BLAKE2S_SIGMA2, "aM", @progbits, 640
+.section .rodata.cst64.BLAKE2S_SIGMA2, "aM", @progbits, 160
 .align 64
 SIGMA2:
-.long  0,  2,  4,  6,  1,  3,  5,  7, 14,  8, 10, 12, 15,  9, 11, 13
-.long  8,  2, 13, 15, 10,  9, 12,  3,  6,  4,  0, 14,  5, 11,  1,  7
-.long 11, 13,  8,  6,  5, 10, 14,  3,  2,  4, 12, 15,  1,  0,  7,  9
-.long 11, 10,  7,  0,  8, 15,  1, 13,  3,  6,  2, 12,  4, 14,  9,  5
-.long  4, 10,  9, 14, 15,  0, 11,  8,  1,  7,  3, 13,  2,  5,  6, 12
-.long  2, 11,  4, 15, 14,  3, 10,  8, 13,  6,  5,  7,  0, 12,  1,  9
-.long  4,  8, 15,  9, 14, 11, 13,  5,  3,  2,  1, 12,  6, 10,  7,  0
-.long  6, 13,  0, 14, 12,  2,  1, 11, 15,  4,  5,  8,  7,  9,  3, 10
-.long 15,  5,  4, 13, 10,  7,  3, 11, 12,  2,  0,  6,  9,  8,  1, 14
-.long  8,  7, 14, 11, 13, 15,  0, 12, 10,  4,  5,  6,  3,  2,  1,  9
+.byte  0,  2,  4,  6,  1,  3,  5,  7, 14,  8, 10, 12, 15,  9, 11, 13
+.byte  8,  2, 13, 15, 10,  9, 12,  3,  6,  4,  0, 14,  5, 11,  1,  7
+.byte 11, 13,  8,  6,  5, 10, 14,  3,  2,  4, 12, 15,  1,  0,  7,  9
+.byte 11, 10,  7,  0,  8, 15,  1, 13,  3,  6,  2, 12,  4, 14,  9,  5
+.byte  4, 10,  9, 14, 15,  0, 11,  8,  1,  7,  3, 13,  2,  5,  6, 12
+.byte  2, 11,  4, 15, 14,  3, 10,  8, 13,  6,  5,  7,  0, 12,  1,  9
+.byte  4,  8, 15,  9, 14, 11, 13,  5,  3,  2,  1, 12,  6, 10,  7,  0
+.byte  6, 13,  0, 14, 12,  2,  1, 11, 15,  4,  5,  8,  7,  9,  3, 10
+.byte 15,  5,  4, 13, 10,  7,  3, 11, 12,  2,  0,  6,  9,  8,  1, 14
+.byte  8,  7, 14, 11, 13, 15,  0, 12, 10,  4,  5,  6,  3,  2,  1,  9
 
 .text
 SYM_FUNC_START(blake2s_compress_ssse3)
 	testq		%rdx,%rdx
 	je		.Lendofloop
@@ -191,13 +191,13 @@ SYM_FUNC_START(blake2s_compress_avx512)
 	vmovdqu		0x20(%rsi),%ymm7
 	addq		$0x40,%rsi
 	leaq		SIGMA2(%rip),%rax
 	movb		$0xa,%cl
 .Lblake2s_compress_avx512_roundloop:
-	addq		$0x40,%rax
-	vmovdqa		-0x40(%rax),%ymm8
-	vmovdqa		-0x20(%rax),%ymm9
+	vpmovzxbd	(%rax),%ymm8
+	vpmovzxbd	0x8(%rax),%ymm9
+	addq		$0x10,%rax
 	vpermi2d	%ymm7,%ymm6,%ymm8
 	vpermi2d	%ymm7,%ymm6,%ymm9
 	vmovdqa		%ymm8,%ymm6
 	vmovdqa		%ymm9,%ymm7
 	vpaddd		%xmm8,%xmm0,%xmm0
-- 
2.50.1


