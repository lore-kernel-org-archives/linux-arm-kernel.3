Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C683FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 22:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/TySS+sPDgfTLpKhbalwp0GPsQF0JNaQ9zH44WJfNM=; b=LPhZRwvdUXohVnkeYHmgsNoOeU
	A5IFDG8XfWW8n28XuysOnY1jwJmgZpLI6B9ia62/pz24gNHI/3iumHlTokbtyFrSdizznOfMhhtvn
	ubKPh3XpClcc03YIeL+5jYoPPaP6KJhACovKJXSFH4Vl5eBc2xHAgcgXRJla8C2NZoV5P6X3apa/n
	coCMHbIkhNcydis5/RM+Bb4scnOo4eB2NqlZKc++CcRSXbP65W1VIhDXu7rjb7XNhUk+7otV+AXhG
	0BbpDpu/+KLY9gCb6T9eyzZbU3MCB5fA6Buf2hBKrwj7F/12uNOAQrxpzCnu7h0bV5KGSZoLF+rOt
	kGGKdYvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv17k-00000008ZCJ-149w;
	Sat, 06 Sep 2025 22:11:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uv0ap-00000008VC3-2yH4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 21:37:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6516C45251;
	Sat,  6 Sep 2025 21:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A72FC4CEF5;
	Sat,  6 Sep 2025 21:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194627;
	bh=C5+a7mCYIvqBEAn5lQppE669dnFrkzWQF1zk0YiPpuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aN33jdNbPPWCFS3rSncFy4YrpwJkk5GYVzpu/ZqZXYHs5pb7KD6mE/1nYTW0uwBnf
	 CuHEMW/f3i3Av7mUSLDXUucUvQbO0Ifxb4QQUa2m5NldzAh1levjiV/RC8l6NH/Vlj
	 jPrKaMMPtz6zW+NFbCYz2MszvmppHiQGp6fx348XONW90N+aL3rDFM335dTfmWjwGS
	 Fu4lcw9Zezc1Fp5TVuqYxucMlguTKBQYxNUCO5MU7XlJHWnsa2wyMf6IWdZHjDTmLn
	 cQmp7bIPWl4b3bZaLUlHs7wYTXFCZ35BiAjqlyqG072Tn5Xsc9TQ5/2TUvUsp2/LDX
	 siufRL71HJrLw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 11/12] lib/crypto: tests: Enable Curve25519 test when CRYPTO_SELFTESTS
Date: Sat,  6 Sep 2025 14:35:22 -0700
Message-ID: <20250906213523.84915-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_143707_832158_08E42425 
X-CRM114-Status: GOOD (  10.15  )
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

Now that the Curve25519 library has been disentangled from CRYPTO,
adding CRYPTO_SELFTESTS as a default value of
CRYPTO_LIB_CURVE25519_KUNIT_TEST no longer causes a recursive kconfig
dependency.  Do this, which makes this option consistent with the other
crypto KUnit test options in the same file.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index eaca60d3e0a36..578af717e13a7 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -11,11 +11,11 @@ config CRYPTO_LIB_BLAKE2S_KUNIT_TEST
 	  KUnit tests for the BLAKE2s cryptographic hash function.
 
 config CRYPTO_LIB_CURVE25519_KUNIT_TEST
 	tristate "KUnit tests for Curve25519" if !KUNIT_ALL_TESTS
 	depends on KUNIT
-	default KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
 	select CRYPTO_LIB_BENCHMARK_VISIBLE
 	select CRYPTO_LIB_CURVE25519
 	help
 	  KUnit tests for the Curve25519 Diffie-Hellman function.
 
-- 
2.50.1


