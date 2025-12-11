Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAB6D3E785
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 01:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8LHoNDDBxsOnJBH3tnkDc6bLh9BUqwYyDk9E4ZJ9sI=; b=MJmKkk/ts5OIU3Ax83CLCbaEQz
	uMHNwqObTpOrJGNY6LClcRx1n83/0znEu6xje/iJosJJn2DWlez8GESSPq4QdHR8yh+ryEu+D09Lr
	FYvuQXkDQnoPoE7SfhuuT0vDuhf1kH/5pX7d/MXETm3untwafczlKmnueAu8p65D0Ys3ZOJc+k0RC
	r5HVxQZFfDwAxhH6gsFIvFGubyZsQN35zSLFOFHEdxCnmuauyyahsYfpNfoycQGDE8S2y4zO1S0RW
	aEZg77qoC7CwJdsFRGI0Sj15Tv7uuTCKICSCl0a9j1M5FUnLlO0LyKJoxQmMJ+MqpBqwCaQ2YAqr4
	TC5UUHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMe-0000000G3oI-0vzc;
	Thu, 11 Dec 2025 01:21:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTVMY-0000000G3dd-2rtO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 01:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D36D43D25;
	Thu, 11 Dec 2025 01:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC50C19423;
	Thu, 11 Dec 2025 01:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765416058;
	bh=c7Wxsv2qMnAP++ftzBA0W0ugHU/R9/cZbMizhIM4xBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d7WuFitkE7uaxLhYqf6hpILerfgFpEIQLzFcN1Ho/WhQzTmIywxWkHO4r2Xbs24HE
	 dvusjL9951+QWK+A13fhL/kZgFJT5ikI+0ZBC6MAmf5SUNjxAxgkpFWmFIgGI9NPd7
	 vg5QAFDRFCXO1PRP+lUIuQ6xk5A5+fjHmriUDpyzPD3pGmImYY25nLMgv/gbgVXt6p
	 pSSbVcG3FFWZURfrGYgJvgUtPdgCIdg/l5ekhSaIbRk8Kpun5K+U0k1OldieLSE9ms
	 3fm37MMtO746y4O4+gMdUGbrTNRpeefwoc+ha+bKHx5SZzmDEiwZ4eCMVRvjkzqwqA
	 ojCucoKSpYEvQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 12/12] fscrypt: Drop obsolete recommendation to enable optimized NHPoly1305
Date: Wed, 10 Dec 2025 17:18:44 -0800
Message-ID: <20251211011846.8179-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211011846.8179-1-ebiggers@kernel.org>
References: <20251211011846.8179-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_172058_758265_C8492E5C 
X-CRM114-Status: UNSURE (   7.23  )
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

CONFIG_CRYPTO_NHPOLY1305_NEON, CONFIG_CRYPTO_NHPOLY1305_SSE2, and
CONFIG_CRYPTO_NHPOLY1305_AVX2 no longer exist.  The equivalent
optimizations are now just enabled automatically when Adiantum support
is enabled.  Update the fscrypt documentation accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 Documentation/filesystems/fscrypt.rst | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 70af896822e1..c0dd35f1af12 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -453,15 +453,10 @@ API, but the filenames mode still does.
         - x86: CONFIG_CRYPTO_AES_NI_INTEL
 
 - Adiantum
     - Mandatory:
         - CONFIG_CRYPTO_ADIANTUM
-    - Recommended:
-        - arm32: CONFIG_CRYPTO_NHPOLY1305_NEON
-        - arm64: CONFIG_CRYPTO_NHPOLY1305_NEON
-        - x86: CONFIG_CRYPTO_NHPOLY1305_SSE2
-        - x86: CONFIG_CRYPTO_NHPOLY1305_AVX2
 
 - AES-128-CBC-ESSIV and AES-128-CBC-CTS:
     - Mandatory:
         - CONFIG_CRYPTO_ESSIV
         - CONFIG_CRYPTO_SHA256 or another SHA-256 implementation
-- 
2.52.0


