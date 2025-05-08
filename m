Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDA8C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JUVOAN/lE8yELnQQTGRDJV5f4/8O+GkNaNEOlMMcVxo=; b=Dthx9lAfTXiQZECUNZe0MEhPb3
	2gOMyc9fo/Avk9jmElt7R4BWNe7X1rp2k7qYHE9F4kMA8D1HZmFIzXJTq3FJe3nKYHSC3OUAHlEDJ
	3hxflFizdssIIRkRGcJRUyeIxu2a5FrOYDbWus55bdRoZKde6PTfPfBUHNZs2g5CEHm/LZYVMI0Hp
	iCigp/vhZI9CM6ejiLJWejnT7selhDs+X4m/ssRSfURR0sLAxl3/h62OJNOh/65aQgn86XMwpt4Ii
	RDXlYL8CXLA4sWQkCIMNhOh8kDkuhp7OMnvINI9TnEx9yEOYCwtdBZDFF9atOx3T0IhKS8aqfRM1Y
	ynXw/iqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1a8-00000000oEw-0KBG;
	Thu, 08 May 2025 13:46:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Ts-00000000d3G-0RfS
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 12:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=JUVOAN/lE8yELnQQTGRDJV5f4/8O+GkNaNEOlMMcVxo=; b=XVZYba4uC9iaUpKmebwzJuArqM
	HsclWtnnqZF2wy2MyGLDArd2DJ/GPnio1QLylxM7/oiO9EugfUZ7l9Q5s2AT3RuO9jU1rhuraMtKd
	QJSfJto6j9+n51a7+J0GUpRdbTu9Vax43y1TMNmHiB9FI8hCzUWAKRLgOo06QGJc6jtiQ5lUJICKM
	NUVeUJFLFsKca6bTCMi3dFQXfKOXaQ+ed2GeBg9ROWUNiSsGWKdne6ghqCCUIFp3B6Z80b9/i0uUL
	Lr492lm3SldVcrB9BIQ5W2RpUGL3b/U8y7xjAQzoXbMgtP7X1EJs8tXdIbzaWcDDa6NDkDRqgvmoG
	sFdnqR1Q==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCzf9-0000000G1kA-0zoR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 11:43:41 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43f251dc364so5412745e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 04:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746704617; x=1747309417; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JUVOAN/lE8yELnQQTGRDJV5f4/8O+GkNaNEOlMMcVxo=;
        b=ZGsHc+FPOsXz+zJr8XjPfqxZkTQqlo6dSV0Dom1GZDB3iKiRj65K32uPpgccT6pPSM
         MT4ATGhNJGllv9K4ahOUxPlff/uanoBwJQlFyiK3mby0lriQhiYDCyDtvmSp1Jc2e7SW
         pl7dNdNVXTr8N0BoQ/CoxvlZgbXH/vGEo1MlBoHdyLuw4xZ8znj9IdrmLcF/oanHlUmG
         mSC9jKHq/1u/CL26Q0YKQvcvWZSArSsyK79V+nat6CV/v8df4fO/4SkCw3Zs8M9yA3Qn
         FIBdNGniuFvUUTA8AlxmGi0zrCA3P3tl6i+dOmLn3t3EBmfrOJJsgMKPZ0cd92OfgYlS
         Luuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746704617; x=1747309417;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUVOAN/lE8yELnQQTGRDJV5f4/8O+GkNaNEOlMMcVxo=;
        b=gb7OS2wrQoOcyMVs9d3DDTEMCl2N/jl75vbr6PH2G7Xy3PxJxXvUH10RYtM2axStZp
         Pjjb+JgG9x4ug3bTlxI5+kP/2sKdcEUILFMe36dtHlZXdyimA9ZgJMkkt1igQzbiTAAs
         tPDsvsPrVSvNrxkhnnocmlhhds4oNleLCFo3suRl2O/LsUpueZqYfHeqv76wCdpZdTAg
         sHaii/HcHZtKCFuheqyzYWxdTz09MvrcPtoX3o0qOmIha5fLPdQzhvM+pV5KXYxgGUfr
         jJWDORd4FFjxVJXWjug2m1ALyK8EReCnRQHFbnKtv2c9rzW2u4OK1ZiJy7We2GcydONI
         /c/w==
X-Gm-Message-State: AOJu0YzFVIUK4xh3Ar5Smie6Nesdk2iQfq3kiPu5xfJctzs00rL2521+
	kLBkGdONmwl1h52wLFLqQ8LjmT4A0rDbrtVcK7teg/lV5zCcleTAMi1DpW/yLDSuWVvhlcqSJ6r
	bxyK7me0rB3VMA0hJhZbpmeyTlknyVJwKr6VzH2grH0FEYQUNv/nnQXWehCd11HVvOcL9XupbzH
	0gfC6Vho6KewmtUSxnBwvPkujFrdeAQXi33cPNY2Rc
X-Google-Smtp-Source: AGHT+IG4H5iAdGKlLqepoRH/2n93zvwiPTTakWNsjOIkoD1Z3teFjqJjYwm4W0BX7GPmeos1NJ2pT8AV
X-Received: from wmben14.prod.google.com ([2002:a05:600c:828e:b0:440:626b:cdc])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a0b:b0:43d:fa59:bcee
 with SMTP id 5b1f17b1804b1-442d034b35cmr21697185e9.33.1746704616992; Thu, 08
 May 2025 04:43:36 -0700 (PDT)
Date: Thu,  8 May 2025 13:43:29 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=ardb@kernel.org;
 h=from:subject; bh=JvQMOLfERFcsyndXsuVGRgg+XuD2P4TkQz28VCGTX/k=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNmxsPiW+6tzkb3t95qlrhj9GQB+5H6jZf2aMz3rZH4p
 vyXRe1FRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZiIkxsjwzkHVi4PnTiNq/5a
 VyPunmYyCfi8YbNEQQinopbkodwpmQz/cz99/tBV9LmP7bbHc4FO7X1PJptOmH659OTqF7EL5y2 4xg8A
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250508114328.2460610-5-ardb+git@google.com>
Subject: [PATCH v2 0/3] arm64/boot: Forbid the use of BSS symbols in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_124339_631393_42D299E8 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Move any variables accessed or assigned by the startup code out of BSS,
and into .data, so that we can forbid the use of BSS variables
altogether, by ASSERT()'ing in the linker script that each symbol made
available to the startup code lives before __bss_start in the linker
map.

Changes since v1:
- fix build error due to missing declaration in #1
- work around Clang complaining about the ASSERT() expression in the
  linker script

Cc: Yeoreum Yun <yeoreum.yun@arm.com>

Ard Biesheuvel (3):
  arm64/boot: Move init_pgdir[] and init_idmap_pgdir[] into __pi_
    namespace
  arm64/boot: Move global CPU override variables out of BSS
  arm64/boot: Disallow BSS exports to startup code

 arch/arm64/include/asm/pgtable.h |  2 -
 arch/arm64/kernel/cpufeature.c   | 22 +++----
 arch/arm64/kernel/head.S         |  6 +-
 arch/arm64/kernel/image-vars.h   | 66 ++++++++++----------
 arch/arm64/kernel/pi/pi.h        |  1 +
 arch/arm64/kernel/vmlinux.lds.S  | 10 +--
 6 files changed, 54 insertions(+), 53 deletions(-)


base-commit: 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552
-- 
2.49.0.987.g0cc8ee98dc-goog


