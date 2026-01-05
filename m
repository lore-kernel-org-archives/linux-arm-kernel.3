Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39530C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cDhHRjKqVrxZoCLD2fsmkzUuSDzhUz6dl353L9y5/0=; b=FfLYkgC90tSAhWmegleINvD9+P
	74zaUd4GSgK/bPucr72BeqgPBQ6iu312qDM/Qlht/IVeWT5aPbDtYq0V0p47Sou+dQnUp9gdvO3C4
	iPQeOhze1YZW7C/ZCoj6Jz8iytgMx0WNt80+qwdtH/EcSBjAHQymXOZSe6eSli1Hkqz4FBwdKtR7W
	ynI0efHx2zEgxz+ol80Esh3QVJl/2fLbkIq0owV7CgKQ85geDg1gX8SVUqEjKjLoE3vAJRFYP6xwF
	aOK2UC6+u+jEVuM35XH0wItk/5zAXY9EFoLzkTw1h3OIFoRcfepxavIP8cCGXeug1VXGYQdMSGYTw
	zj0Dn6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvl-0000000AjBC-2tCI;
	Mon, 05 Jan 2026 05:15:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccve-0000000Aj2V-1Em3;
	Mon, 05 Jan 2026 05:14:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B90B160141;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0776FC16AAE;
	Mon,  5 Jan 2026 05:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590093;
	bh=GVpfgLYStBAX0V1nv+zpcwWE8NNlDpzM24qOLk0l6H0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mcaDwAKvV9yG8G8Pz4lAe99jwm46Fe9LLX8+KbH5dMJSycqIAUz83Pyr5V6Cd1b04
	 YoMgKpCPcIYuZMn4nHnOWiMAoLtfwubSrFn7sUIu8xppL3qu0xo6ojvfww4gONJB8V
	 rq7To3cHCghDjntKqSetWW5zMDKnbMruaVIHEDQ7PPwotlLt//+yJcjrzB/XygRUXR
	 IgzDKNgYpYIrxCD+tJf/ynFCWwPV4C88wsk+otewUC3xwsxr4ezuJsjKuRaoi2otT4
	 5L4MHdL6JsCiBx8xOZs9AaNExwgKNNXW1ADOHPLOADwT+cGkHm5IJyFSx+sEZiR77g
	 QVn77rj2ogf/g==
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
Subject: [PATCH 05/36] crypto: arm64/aes - Switch to aes_enc_tab[] and aes_dec_tab[]
Date: Sun,  4 Jan 2026 21:12:38 -0800
Message-ID: <20260105051311.1607207-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/aes-cipher-core.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/crypto/aes-cipher-core.S b/arch/arm64/crypto/aes-cipher-core.S
index c9d6955f8404..651f701c56a8 100644
--- a/arch/arm64/crypto/aes-cipher-core.S
+++ b/arch/arm64/crypto/aes-cipher-core.S
@@ -121,12 +121,12 @@ CPU_BE(	rev		w7, w7		)
 	stp		w6, w7, [out, #8]
 	ret
 	.endm
 
 SYM_FUNC_START(__aes_arm64_encrypt)
-	do_crypt	fround, crypto_ft_tab, crypto_ft_tab + 1, 2
+	do_crypt	fround, aes_enc_tab, aes_enc_tab + 1, 2
 SYM_FUNC_END(__aes_arm64_encrypt)
 
 	.align		5
 SYM_FUNC_START(__aes_arm64_decrypt)
-	do_crypt	iround, crypto_it_tab, crypto_aes_inv_sbox, 0
+	do_crypt	iround, aes_dec_tab, crypto_aes_inv_sbox, 0
 SYM_FUNC_END(__aes_arm64_decrypt)
-- 
2.52.0


