Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF44AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 05:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfq8NUl2WvJrEeqpsBeuYsFmw+cnTBFnk1Up45/MZ2k=; b=Rq4gGzJ8ONUDbLrHyvVUy/Y826
	yR4G9VpdiuRbnv/6P3muyw1f/m+dF+2v0vvI1ntQ++jbpiE96+PwSrMpcBKYzdnMrxtBV+WvKLYXT
	DfTcuxryD1fFNo+5CbLKnRztwug6n7eNAuIDV+BwEnv01zUuvK35sNQT6tDgBXRL0VkmKf3e3ToWa
	ADc9IwqYcdrQjhUlN88yAtl8Kh1krW0P8I20zjpvwcL1CGGTzf7CeABEzlGcuNoNUQN+a74xieEzc
	5VJalPXqjxx1jM7UCsKUPBC+H5Gsn2dztnsXGvJ2+MYli/TnHz75YExTSc18zVDK8yM/C6ns8jl1K
	dJAPjp2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pWW-0000000GomO-1PJ4;
	Sun, 13 Apr 2025 05:04:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pNg-0000000Gnhr-2ekh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 04:55:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C80DA6113B;
	Sun, 13 Apr 2025 04:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DD0C4CEE5;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520142;
	bh=S6EtgyS23+qRGH0eAeuHrJro1hFgR1JlJgbog1ls+WE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ASqL0WN/Mm67yTnOT6LYSFTru/q7hLEducze6iLetJNyVrFU28EBOBehoKHuj4Oxx
	 bjNrhBx1GKB0g3RiBz6f2ge6+haqU+3AGx/seBNICYpwgrSAkVxX7uFXlRysnKMm/g
	 O+De6pWgmW8F/TYbosTH+Sg3Ys6WTqGBK6jlwM2pY+X/gK90/5I10kVKFa28LkyYU6
	 RglM1wB2KVZKfoRMWa8zL7zk6LfUOR7wBBoj+G0Zm9GzXpR/PH6kNHUuCBkVvRirRB
	 lrHTms4JzO/mMetcYLgGd6h4HxCTgRyvHehtFp2NG6lAZyQce9YRhNenb0nqAWOdxQ
	 sEgZopVA4Pd9Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 5/9] crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
Date: Sat, 12 Apr 2025 21:54:17 -0700
Message-ID: <20250413045421.55100-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

arch/mips/crypto/Kconfig is sourced only when CONFIG_MIPS is enabled, so
there is no need for options defined in that file to depend on it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 0189686de3a1..9892391f74ac 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -2,11 +2,10 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
 config CRYPTO_POLY1305_MIPS
 	tristate
-	depends on MIPS
 	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 	help
 	  Poly1305 authenticator algorithm (RFC7539)
-- 
2.49.0


