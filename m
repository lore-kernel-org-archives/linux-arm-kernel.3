Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EF4CF45C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnNGHZoGVxmaaqAJ6yvawy5Hn/JrpHmuZhMeed1U7fY=; b=jZ7cY11ZMihI7zZ6ugOhxeoGKN
	h87XpRfVAMtzTCrgoHx9s7YcIgSfeAorNfCquXsKJa98xesqZS3qnxW2dAyLB3bWheKRoKXGTEaL1
	sEJm/P00nN+rLV27ixylPdc6dInOjFOJvyGwGF1hcQ73xPZhEejVbnApUSC8FGT55/v55GkUXUT/6
	StCQOSIYXnUiIgiZHMEf0+IPL3o4j3Kn2hvZTs6J+wb5SlcdtF08EjgRT27+V2bRO+xde+IaGSB/A
	LCKyUZ66ljCBCckWM/rtbH1hwfoY9ovY7WyCrVmJXQFXs5zRIrcHnGq6oH4obIp5RGVboBvLh8Ir7
	6WSidmQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVh-00000005z5k-2f0H;
	Mon, 12 Jan 2026 19:23:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVY-00000005yvN-3FHg;
	Mon, 12 Jan 2026 19:23:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F58644317;
	Mon, 12 Jan 2026 19:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1A5C19425;
	Mon, 12 Jan 2026 19:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245800;
	bh=2M8Gb/YRtberadtTzhIXpTjnvGh0/0hqHwkqCXSjCBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PeWo/wwnv7GJEhSx1Rr6KXtyzCKz82DrZzBSGOzoyh9p4L5PDGU+fcJJAszf9aOvC
	 3nQ1ZzuD+/BhBCf3I+xz0Ga4TD6uXEJPz4pgcGUfHRNMN773cTSbwpo42TUOQTgpLQ
	 p8/MShjCL6T2gM8EL3Q8azFme2TsUyDO4bZGXnEQgI3xm/Z69jIGxg4THjBVqgTQgn
	 nFFvA/3thNtyEHoSxe2YGfG024AqgG+7kvBldYZurP6i60JW4o+nM7NA9zh9EcitJW
	 eStkXyo61YXmHmBT7eoGdyDpRaxFgDXyv5lqvfT0EMmxoAqngYIrbCTHZOTCG9bumH
	 nX/6iHZThwKEw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 04/35] crypto: arm/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
Date: Mon, 12 Jan 2026 11:20:02 -0800
Message-ID: <20260112192035.10427-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112320_834384_B30B3310 
X-CRM114-Status: GOOD (  10.65  )
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

Instead of crypto_ft_tab and crypto_it_tab from aes_generic.c, use
aes_enc_tab and aes_dec_tab from lib/crypto/aes.c.  These contain the
same data in the first 1024 bytes (which is the part that this code
uses), so the result is the same.  This will allow aes_generic.c to
eventually be removed.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/crypto/aes-cipher-core.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/crypto/aes-cipher-core.S b/arch/arm/crypto/aes-cipher-core.S
index 1da3f41359aa..87567d6822ba 100644
--- a/arch/arm/crypto/aes-cipher-core.S
+++ b/arch/arm/crypto/aes-cipher-core.S
@@ -190,12 +190,12 @@
 	.align		3
 	.ltorg
 	.endm
 
 ENTRY(__aes_arm_encrypt)
-	do_crypt	fround, crypto_ft_tab,, 2
+	do_crypt	fround, aes_enc_tab,, 2
 ENDPROC(__aes_arm_encrypt)
 
 	.align		5
 ENTRY(__aes_arm_decrypt)
-	do_crypt	iround, crypto_it_tab, crypto_aes_inv_sbox, 0
+	do_crypt	iround, aes_dec_tab, crypto_aes_inv_sbox, 0
 ENDPROC(__aes_arm_decrypt)
-- 
2.52.0


