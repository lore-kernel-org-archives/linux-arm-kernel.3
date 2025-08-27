Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC358CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4l/zbWZ7TgNlyi5jGf8fyTuYc7IIjlsxi0BRnACPbA=; b=4XjlAkys/PdeTFBLamjYBN/U0c
	csAN5Zsk9uYMbJZmphPC01obUGBRFgo1pBOYUyO+Wd5CKAZfsUM43JeWs9u5+xtNmRYzL4mJH2G8Q
	fyrMDTmj4lNL2veICjY/P6dpwE2bmwGlhDPe95aV/6P0Ih3WySTWMC9gmQhvKZ+1ZJ2s0ttcPuLAo
	pzFe2ERtKvnJR8T+5LrWBa5h3DEzR43eN6sDuSSkMR9upR7e/KW1I6MRwcB4NjuwWq/C/G93qMgrk
	Lz1dKY6z/v1Jc5vnJxJIGD8F4TFy8UVN2OGnZZA1uVvcHiWM7XNwS0tnfYJSxZ7o5Wxlc92jutS1g
	EpukX/nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJxG-0000000GJfm-1QJp;
	Wed, 27 Aug 2025 17:29:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrW-0000000Fsgc-1dqp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2318343722;
	Wed, 27 Aug 2025 15:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B71C4CEEB;
	Wed, 27 Aug 2025 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307698;
	bh=DgqLJLt/N5mdg7z1+FAS46a3j1pnJlIf4tSEAWMOUqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gdCvI0jiNwjyyAG+h6jO9lVJzemAuZP8v7aD0Hzp9q8c5BtLEf1GvoHL4qyImWp6p
	 jUq44DX3bCS9q0/MbnW0P+/M/khURXkG/GcXzXSVbF3/jqOa9cfWT3/50aLZOWKmRW
	 YJAauoNQZ9Nk8Aa4SG6J41X8UwY5/xfdADWDuXs+D3PWLM84BqpOd5rQQvW5ZrZiMG
	 cCzj6OJMyAESvKePPjHxpJWkUaUFDjKDe3ZIUXRjE4EbaEhIWScv2Udjb0j17dgdMg
	 hx0mP+Ls2kvWF66F/isj70szONU8a8wgF99zQlbUo3IPTK5IV3iUij8oce03lik72J
	 xbO5SXFia10PA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 04/12] lib/crypto: chacha: Rename chacha.c to chacha-block-generic.c
Date: Wed, 27 Aug 2025 08:11:23 -0700
Message-ID: <20250827151131.27733-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081458_453142_1ECC7310 
X-CRM114-Status: GOOD (  10.02  )
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

Rename chacha.c to chacha-block-generic.c to free up the name chacha.c
for the high-level API entry points (chacha_crypt() and
hchacha_block()), similar to the other algorithms.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/Makefile                             | 4 ++--
 lib/crypto/{chacha.c => chacha-block-generic.c} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename lib/crypto/{chacha.c => chacha-block-generic.c} (100%)

diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 8d91572b4d5ef..ca65924e861ff 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -13,12 +13,12 @@ obj-$(CONFIG_KUNIT)				+= tests/
 obj-$(CONFIG_CRYPTO_HASH_INFO)			+= hash_info.o
 
 obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
 
-# chacha is used by the /dev/random driver which is always builtin
-obj-y						+= chacha.o
+# chacha20_block() is used by the /dev/random driver which is always builtin
+obj-y						+= chacha-block-generic.o
 obj-$(CONFIG_CRYPTO_LIB_CHACHA_GENERIC)		+= libchacha.o
 
 obj-$(CONFIG_CRYPTO_LIB_AES)			+= libaes.o
 libaes-y					:= aes.o
 
diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha-block-generic.c
similarity index 100%
rename from lib/crypto/chacha.c
rename to lib/crypto/chacha-block-generic.c
-- 
2.50.1


