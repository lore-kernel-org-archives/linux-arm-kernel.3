Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693CCCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 00:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXol21amNoNEBVMtnKaoAlUJZpZs4NV593mkWk7foM0=; b=y4z3QWROWwZHW9OMg81WXIfGDI
	FDdadwm74gdXZM8JSq+6RTCbvaoO/JoQ86Mb0Mgu5k51ekTYIc0Usogty+Nnvq3LIGxZJS9ZWBEoz
	Nj2tpVP9bCJCXvZKM+vsurHecPcWxXLr0ToY8iIpCyeHwtZ1B3ASNiaifErKWahkYf59B11AlrJi+
	Wn/M1deZAz3gUBEQkrMC46HaQ8GE9wOMzSNNgg7intlFjR7dlTZYKIuemlKOD0tESk6Ag1HxenPPW
	VxYrDgcJ/53nWRgGW7hRVm3VRBAbuXNvfSFt4TSCkihlSVmcksE9dSsuOruRDXpdVbu2RF01o+CkS
	Kr+Xq2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeA1-0000000BZid-0edJ;
	Mon, 20 Oct 2025 00:54:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAe9j-0000000BZWf-3o0o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 00:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB5B26021C;
	Mon, 20 Oct 2025 00:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1EEC113D0;
	Mon, 20 Oct 2025 00:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760921614;
	bh=sNfiHzZBvEsZv8KJ6ym8WqKRimzL6B5akfZG5UKLVY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B+1/pb7/WHY0BbmCnFWu9ck8/blkeG9BhHkAJWASM6Cj74Mv9oCEUDeDIDlLkFp+3
	 On4VrnUQzZ0UBl6dMT5QlqCvWhbEYI2zDNgrsOIFYXKM71seCNw5tgjBBzubIpUuD5
	 SP1Mkz/jR76paC46zOSymIVpi847dht/kP+m96LQRdE/hc2McrvSoTmu98NEkdTAfO
	 pa+Fp9v0+6myx6kuTNr6DdrJ/kjclGqnQm9/htHrtYHpKoF01Tbrdv8FUSvUSBabiX
	 2GQyfSJfPMSsIzDKLYeMGKYaj5ujP6tTNrPm9FC9AVsIl8YggN1OQsmK2FHjZ5Tk5V
	 e9TfUryjC8esg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 06/17] lib/crypto: sha3: Fix libsha3 build condition
Date: Sun, 19 Oct 2025 17:50:27 -0700
Message-ID: <20251020005038.661542-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020005038.661542-1-ebiggers@kernel.org>
References: <20251020005038.661542-1-ebiggers@kernel.org>
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

The correct condition is there but is commented out.  Fix it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index b7fa51bfeebb5..2f15cef850507 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -266,13 +266,12 @@ libsha512-$(CONFIG_X86) += x86/sha512-ssse3-asm.o \
 			   x86/sha512-avx2-asm.o
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 ################################################################################
 
-#obj-$(CONFIG_CRYPTO_LIB_SHA3) += libsha3.o
-#libsha3-y := sha3.o
-obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
+obj-$(CONFIG_CRYPTO_LIB_SHA3) += libsha3.o
+libsha3-y := sha3.o
 
 ################################################################################
 
 obj-$(CONFIG_MPILIB) += mpi/
 
-- 
2.51.1.dirty


