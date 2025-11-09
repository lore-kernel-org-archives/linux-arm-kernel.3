Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329A4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 23:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fUrFmNKTXpc9Oxc5abvrSXswZbIHafas4XoQqDivF4=; b=zCjrV91tvCdX1BPHsiRNOkuBhm
	VScLbd6LxD3b15PT8vZlYR4gvie4QnrhkYox1lEWdbVZ32EDIx6hpc3I5ehaQzbTRym+o71BCQ/pC
	sRPMbBnWz6WbK8TiQSZxPPxVz5feM7j9FfTO45Ct5jbNUaPe4HPouZk8AT/XQhVxPZ2JqS7r4P1oz
	y312mPMp/DRtD6SSr65m3yGDglFHxz/EP3M7rieJiqjB80Tz4a57oqwTmjtll2fG/vZ3dhjxwn2v+
	0sMZEnooqTUW1E8ivquNaU0CAYAB6okmKJNb/KE9donWblGbIOlYYYH6xlkp5Y3pVTlE2WwZnNSlE
	YtMhVptA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAf-00000004Vpy-2hxp;
	Sun, 09 Nov 2025 23:50:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIFAX-00000004Vlk-1COu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 23:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A52AD446D9;
	Sun,  9 Nov 2025 23:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17266C4CEFB;
	Sun,  9 Nov 2025 23:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762732200;
	bh=7gddUMmP2coCrWDBPHW0Qp0T0QzSnROq55ixSxyk3eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aep2Ic4mAOPEy+UzZYgxrcqU0Vc0IuKyB9GT0ijy2wWrUZCCr0TJjQ4sWV5RrXDBz
	 +z276rb7zAJHWRnhqTchQ4FfGfx/eH+5H+EP7rJNZejjjUClO3qNZ+3jroRdLsC1Cb
	 9IgCW15wWGZeizwbowEGZKPJR3ZL7i7Ne1uTonvktqbt0XONmQ09aQsgA/9a3xXZBU
	 Q5idrcFJ4beRn05+Sb4Zj8wbQ2/xrH+2QBbKIwc/977EeKhG8ENexjF4xTUxPwJoma
	 Ll0IrZl5KfVIRV0xSBa7f3vXf1tREL6bSy9PlhvtJDyiJjuU79z6DCKfsPHSrbZuQ4
	 w6Nga/fLzOnOg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 9/9] fscrypt: Drop obsolete recommendation to enable optimized POLYVAL
Date: Sun,  9 Nov 2025 15:47:24 -0800
Message-ID: <20251109234726.638437-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109234726.638437-1-ebiggers@kernel.org>
References: <20251109234726.638437-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_155001_355918_8F3EC6E8 
X-CRM114-Status: UNSURE (   8.15  )
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

CONFIG_CRYPTO_POLYVAL_ARM64_CE and CONFIG_CRYPTO_POLYVAL_CLMUL_NI no
longer exist.  The architecture-optimized POLYVAL code is now just
enabled automatically when HCTR2 support is enabled.  Update the fscrypt
documentation accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/filesystems/fscrypt.rst | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 696a5844bfa3..70af896822e1 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -448,13 +448,11 @@ API, but the filenames mode still does.
 - AES-256-HCTR2
     - Mandatory:
         - CONFIG_CRYPTO_HCTR2
     - Recommended:
         - arm64: CONFIG_CRYPTO_AES_ARM64_CE_BLK
-        - arm64: CONFIG_CRYPTO_POLYVAL_ARM64_CE
         - x86: CONFIG_CRYPTO_AES_NI_INTEL
-        - x86: CONFIG_CRYPTO_POLYVAL_CLMUL_NI
 
 - Adiantum
     - Mandatory:
         - CONFIG_CRYPTO_ADIANTUM
     - Recommended:
-- 
2.51.2


