Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77128CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukJ+JZ8oemoPBdLTv+Ywzo9Y1I/dmcJpJX6p7EwuTAk=; b=DyOZ0LYpPPp754MmJnwooHD1Wa
	GRC8YYImE8B3q7uOafuViNPMdRp5vkqk4GFJeNbhVQT8xHslC42mwls+i2qJPQCqFHk971MOkt6Am
	GCvPmqqIEbNVke8DKycLLouiiRRFs1ax8TslGpHzKlUq1xWiBG3v5IRy3W+Ci193D8zmUqg1/mdhr
	5FXXdW2jhOYNzQxqGiCM+RcD+7vihc7ZuvGyMc44+3R20V1nL+EnftIWaGSo4DqqSsyCTFQsHq4F5
	68fC24i2J+4zkSyCLIMaMJ2q28X5awD2RhfhQyCF10tEZ/kssDNWrEV3ImRqWF/xHx4CftHzuGp+C
	IHCWXolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJzw-0000000GKEa-0RFt;
	Wed, 27 Aug 2025 17:31:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHrW-0000000Fsh3-3PR6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C65444B3E;
	Wed, 27 Aug 2025 15:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D79CC4CEF6;
	Wed, 27 Aug 2025 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756307698;
	bh=g1XQPcj5tYdZR7RHqv4B4KYBYDZhxP4CJu6Eu0ySl7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hAtWYP9pqw9F41rCRT7PMNXh7UMxrQfg6Fh4MWXFo89S9O4tImBUhVwJh8+jJ6cJF
	 0xTMzFQOQVFUdL86hrGWgt5/AiXIbe955v+pzQ1Q+7VEbIOsE366hHAb9VIPTWihbw
	 Bi/wwjcD5X0UoPjaDeqpeM1JGI5Om2eUWasqEIpI8Jo4trPn/TobDNJqoNUMlbr1Is
	 XOIGY57gXcrP1bODzQ/qQMTDZr4Ri3Jy5BvvAXB3yOri392X02lvWpxXlOQwmxy3aL
	 tkTOfrxoyje0qNAYRhMjbpbV+Ma833YSDVyniSzpjjlCjUoWI+WbNFWmWglwWlBcwV
	 FTUoIFe3+SWOw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/12] lib/crypto: chacha: Rename libchacha.c to chacha.c
Date: Wed, 27 Aug 2025 08:11:24 -0700
Message-ID: <20250827151131.27733-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250827151131.27733-1-ebiggers@kernel.org>
References: <20250827151131.27733-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_081458_888781_D657A014 
X-CRM114-Status: UNSURE (   9.95  )
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

Rename libchacha.c to chacha.c to make the naming consistent with other
algorithms and allow additional source files to be added to the
libchacha module.  This file currently contains chacha_crypt_generic(),
but it will soon be updated to contain chacha_crypt().

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/Makefile                  | 1 +
 lib/crypto/{libchacha.c => chacha.c} | 0
 2 files changed, 1 insertion(+)
 rename lib/crypto/{libchacha.c => chacha.c} (100%)

diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ca65924e861ff..5749d176be1c1 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -16,10 +16,11 @@ obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
 
 # chacha20_block() is used by the /dev/random driver which is always builtin
 obj-y						+= chacha-block-generic.o
 obj-$(CONFIG_CRYPTO_LIB_CHACHA_GENERIC)		+= libchacha.o
+libchacha-y := chacha.o
 
 obj-$(CONFIG_CRYPTO_LIB_AES)			+= libaes.o
 libaes-y					:= aes.o
 
 obj-$(CONFIG_CRYPTO_LIB_AESCFB)			+= libaescfb.o
diff --git a/lib/crypto/libchacha.c b/lib/crypto/chacha.c
similarity index 100%
rename from lib/crypto/libchacha.c
rename to lib/crypto/chacha.c
-- 
2.50.1


