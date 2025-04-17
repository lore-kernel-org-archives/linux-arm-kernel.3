Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F6AC369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 18:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QLvmdUOpIt3qputYjrPPCWLqkyP+trIqVdJfTraaI+Y=; b=HAUtKDOR9OssY74Oi0m4TfDAhB
	wmcu5GAgkMoVbF+i10LbV8t1uUXiVYRvi6SAIkqDFHaXt6lV3dSB1wg+pQecgMzyjvf+Z1WNv2chh
	7nBFjOaVg76sIopJhMxTn/8e7ZUBYLeBIkyg3sfh/22A0HTdigiKkvxRvHbCazNiFJp99EIvWeXkB
	SZAAjXpUZOpXabUvkE1fGYamd3h5LxathO7CBUSf9sPiUpMII+69WVjJKDaP9zHcsySa+5C3/h3Fl
	t/JDhZ3fUCboGdQoGgT1bzxY93JBdNhSPYVJod3yJT9nyJqN5m+91QaeW3BPZKo1kFV5Qi05rVv41
	3e6zq86g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5UGB-0000000E60h-1CgU;
	Thu, 17 Apr 2025 18:46:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5TxC-0000000E2L2-3Uxw;
	Thu, 17 Apr 2025 18:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QLvmdUOpIt3qputYjrPPCWLqkyP+trIqVdJfTraaI+Y=; b=OwZQX43YYFgU5Ua0pXt1YnLrwc
	PxUFXaCt+X6xD7QTcbnMNngg9n2AJyfqzF/EH4z1O6Xw1IddY1P8pEJDoAa5sEdFFx6xCmfnp6GMc
	ixza8V8PlZRht+o1OxM6O6XMCBTYgFm1nGFjvJkywYTliBxAKSYgdX13HMSsKoxl0oZPWtXE7tbsm
	xA3/of0VEyJyECFw9h7YODKqG93Ke3x1+llC04YWQILM7yifHAS7S7D/BUwtVRwHvIca3/k/IsPVg
	gpxFyulNUO6pMvEyi5XjweTDGNZECiHSyeLS3mHll1+iRGxEY5hNaNCrzF2RIKEWgTV3GNwXZHveo
	//ymY7PQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5Tx9-0000000AMIP-3CAX;
	Thu, 17 Apr 2025 18:27:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF4ABA4A456;
	Thu, 17 Apr 2025 18:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8307C4CEEC;
	Thu, 17 Apr 2025 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744914427;
	bh=nXbV1Uvq4c8RL4YhRp/ivGFjNzOtTa70IujwafR6+UE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=toxBea61JWC5/trBUl49NvCsVkVAmNhju3B87UReIfBHz8VnRyE/LuVybLVF2k/nY
	 ozG0hZ8OBwzDL6uS4Zi1cnO2Mrn+mq1gQ/r8Oq+czYCLjfyTD/V03RB7fCo5SP71wf
	 zlxk4RJm3o05FtCFrRaAKTzpr6oWDwo/e21dJwjhdxrVVorZg+xwqsKTLym49Olhvz
	 SwdxWMKOu8BP6ibmjf8JnzW3kYR8b7Naf0ZpIJmNV9xQkNMUjmcXpx+iFVvnhelZFG
	 WffphaS/N+aHynjqKlRMXoA+AQi8OOH4tWYJ2rqeMi/Rw6uFqtGdZWOBgLIHH2X50p
	 7wDfzUig2kHFw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 02/15] crypto: arm64 - drop redundant dependencies on ARM64
Date: Thu, 17 Apr 2025 11:26:10 -0700
Message-ID: <20250417182623.67808-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417182623.67808-1-ebiggers@kernel.org>
References: <20250417182623.67808-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_192712_045311_6FA4D2E5 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Eric Biggers <ebiggers@google.com>

arch/arm64/crypto/Kconfig is sourced only when CONFIG_ARM64=y, so there
is no need for the symbols defined inside it to depend on ARM64.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 7c2f63f2e307..704d0b7e1d13 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -135,11 +135,11 @@ config CRYPTO_AES_ARM64
 
 	  Architecture: arm64
 
 config CRYPTO_AES_ARM64_CE
 	tristate "Ciphers: AES (ARMv8 Crypto Extensions)"
-	depends on ARM64 && KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	help
 	  Block ciphers: AES cipher algorithms (FIPS-197)
 
@@ -252,11 +252,11 @@ config CRYPTO_SM4_ARM64_NEON_BLK
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_CE_CCM
 	tristate "AEAD cipher: AES in CCM mode (ARMv8 Crypto Extensions)"
-	depends on ARM64 && KERNEL_MODE_NEON
+	depends on KERNEL_MODE_NEON
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES_ARM64_CE
 	select CRYPTO_AES_ARM64_CE_BLK
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
-- 
2.49.0


