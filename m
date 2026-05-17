Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C2BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4vrcrwzkaoiMYlaMr9MIUBgqgnUooA1g4rIZYb2rlk=; b=nlJJZ28jMb8apUQhPuuq9+6E6G
	DE50xkLROJsIlr1RfUWNqC82hVN1+OAE6SFodzGwHA9aBR7X+JbozxVddfW8UzPrVWmQpSRTwaeom
	2CMBOR8Op+v/C4JbSeEFexNYBVbSci367g2xQFwpLNuyN5W4KyW8mK9c8ylzBWjZhsYIBhv+T0rXj
	Yk7tlzLD4B/LzZ4g1C8ELT7JaL0eP6c00c0LfCJXvfxS84lNsMAp3yDPK30jvSU5Uf2KQKYqmozbN
	L9yF+dfJASwmP06QVS1kX+bASDpCspYoBaCKVlqPg+0ct6MgAZaM0dtj/FlFUg/BfxOBHtFRHCbtA
	wPbEGEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wORVs-0000000BwoK-09zM;
	Sun, 17 May 2026 02:45:56 +0000
Received: from mail-dy1-x1344.google.com ([2607:f8b0:4864:20::1344])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wORVp-0000000BwnJ-0IvM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 02:45:54 +0000
Received: by mail-dy1-x1344.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so978498eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 19:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778985952; x=1779590752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4vrcrwzkaoiMYlaMr9MIUBgqgnUooA1g4rIZYb2rlk=;
        b=GQS9s/8EvLMG4H8A0rnU46EFWigCPXskUDvvI300V/5gBT6DQXqbef1IaXEoBGlOXW
         O+wR5mCqFh14CxSGETTLsoKGIu69tUEB065HDVF9XF/aWYx6lT9sN2sJctMt+HgP1Mt9
         OUFROPJUVyjyA0TXNeIirHtImCNSGJ7R7ngswu4V9WD1Vjy8K5YuzgwQwxAekKRcBFZY
         F2/aFCKFAPM42ahfm3i8CC858v7M7NVYcb2eBcHkpiGuh7wDt/k4RkZHlcQzJCH2ompF
         44m6vUPy/RDZ53tPyr+9XmRgUOziNKnHnVeR1kWDEP+b/XHKmE9VfEj0argRQW5QNCmY
         khoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778985952; x=1779590752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4vrcrwzkaoiMYlaMr9MIUBgqgnUooA1g4rIZYb2rlk=;
        b=siMvgUTdY6DeM5qdP4WFnYiegR2yKbuFoiGSQOC4VkyX4NLHrfUmq8CTVyL+lsatkO
         ksPcrekmq+A46BoltisoB1erIXqTmSdrJjko3Ah3CyslZWEB61tjUvFaK9r4+2+5Fli6
         h6d07pLSyfqpvS0nG20mtBPLfyLKmVQ12ORhJHGV22ytp8YttxPh7TeHMEU5D4ARQ5Y9
         j7QeeZLmsTcr/eIDf4DmJfaiJgGA6Cg3jp/0HfyvA494NTxwaH8CVzjKrtp+9joAqHwK
         ePAMYHPxXq22TImj7Xz77KKHW70udjsLuy8MpCI8ObQ5mUWSoSUT9rOEvlL/IWlBkaIM
         UMQw==
X-Gm-Message-State: AOJu0YwJ84UyWCgZs5DxN5StTEiqi7hP84Kpq1yeimF0n8yyNyEF97UT
	TQabKinfdvCwPZPAi0bifW9mLLeuwyy8Q82ulCAhvy74YCRWAMjGQ7A0ZtAcXbaQktg=
X-Gm-Gg: Acq92OH2mn3/OS+giDS+t7qN76+SY1QEh4KsvHDx7QAlv8vcAeORhTRYQc91zNqr3kB
	bmfxEHs9YxOKLBLFK/2xWqcqKNZB1ZqI8zZSLYvj8j24+pqxrkuRHrlUJBH5diC/XcLikrcODpR
	aizJj69LS7XHhk3U4UrEPqbGBUp7YYIfpvr67SgY4JWcL94YEOo+xthL4q136jXNmi7e4TdpDZA
	yu/0NlcHxlHj3D/Nzy5Fgbn6iAMWxUKjsrbZzxGIekKzTig1vNYQYy5eF3O1YURuZl8jEiLf/6D
	gUqYw0mMQvBKsisCl9U4LMcVZQBmDSeNozt8tvMlK49ae0tf4wsCvX140Cj5DnrL+uTrSzxKIGd
	4z33zq3pTjGXFM+8F14YjSDqJ8WLZNGdEVliUOEKUL9R2UJ1SrDjHFksWxel2KZ0MRF/uRjpo6c
	/nzkVHGgWtfazCXO8CmUY0KnUUBlezMW448BQJ6u/OXqExd55eferri6ammXhfuNz1VU5fdhC+X
	RzHj4OPP28ryUoqwoH0mSi7uhrkXirw4onppLPrL9W7EZTVIwmF3htiyuTg+eUOC6iK3AYCBcFp
	2qFMvs9kkIkhwK3VPg==
X-Received: by 2002:a05:7301:7212:b0:2ee:d76a:3754 with SMTP id 5a478bee46e88-30397c0f4abmr5236420eec.0.1778985951883;
        Sat, 16 May 2026 19:45:51 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm12814851eec.5.2026.05.16.19.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 19:45:51 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>
Subject: [PATCH] ARM: riscpc: remove always-true GCC 6 requirement
Date: Sat, 16 May 2026 19:45:44 -0700
Message-ID: <20260517024545.94505-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_194553_114017_11D10F43 
X-CRM114-Status: GOOD (  11.31  )
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

The minimum version of GCC required to compile the kernel has been GCC
8 since commit 118c40b7b503 ("kbuild: require gcc-8 and
binutils-2.30"). Therefore, checking for older GCC versions is
unnecessary. Remove code enforcing a requirement of GCC 6 in
mach-rpc/Kconfig.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/mach-rpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-rpc/Kconfig b/arch/arm/mach-rpc/Kconfig
index 55f6d829b677..fea08f20b9cf 100644
--- a/arch/arm/mach-rpc/Kconfig
+++ b/arch/arm/mach-rpc/Kconfig
@@ -2,7 +2,7 @@ config ARCH_RPC
 	bool "RiscPC"
 	depends on ARCH_MULTI_V4 && !(ARCH_MULTI_V4T || ARCH_MULTI_V5)
 	depends on !(ARCH_FOOTBRIDGE || ARCH_SA1100 || ARCH_MOXART || ARCH_GEMINI)
-	depends on !CC_IS_CLANG && GCC_VERSION < 90100 && GCC_VERSION >= 60000
+	depends on !CC_IS_CLANG && GCC_VERSION < 90100
 	depends on CPU_LITTLE_ENDIAN
 	depends on ATAGS
 	depends on MMU
-- 
2.43.0


