Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CEEC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 11:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBLAAxkl3M2aD0Ln4e9Wk86NcYIdK4eZVXhB9EcxpTc=; b=jgF7vQAn7HkFQFFrgxZRn2hAfm
	qAGPUGormbt6Ykie7zz+f2wJIxjhODHDpechs4LYsR0X80Qumae5sfp/0m49QdbjkjefRxURjhdZ5
	urrrd6JEx/NBtEPugvk5xVj2M3XVJVjWWhRdfA3163Mvax+VPd/dCOdXD2DfrO4F6BCJmZO6mn0/N
	D4Xn/qT9/QjSIPikLHfriiCxOaJUWiqr9K+/gMjcErXpMjwu51cItCsq3fW/pPjk8DRRBNsFPaho4
	4eL+/yk0ZKV/+5RU8tUCxkWsyjPtj02j6UE3VdfdTxoMeFWUrHvQ3iHVUkhGvKnWMRIRO/KmZIOmm
	4qbD5VzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Nkg-0000000Cpqt-23Gk;
	Thu, 17 Apr 2025 11:49:54 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Nip-0000000Cpeh-1hZx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 11:48:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43f405810b4so3559215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 04:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744890477; x=1745495277; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBLAAxkl3M2aD0Ln4e9Wk86NcYIdK4eZVXhB9EcxpTc=;
        b=Vl/e7IfQ8OEuCXoYvjisuk6cTk/an8AUe2qzn6VCGij8bafAHsZ+GS6Dj4IdbgRoQn
         0bFe8tKAeYGDeSpaSgHWT796JZpjwlZIGp/HCipiXSjyjrR32NCOnECEeyf0hmuQr3l/
         DS8sA2SgEVRNPRyWfWWJd6qtjaCvi5eMAYq77kyInCfYqagIDGzbU391Ge5/4h1prszs
         kXJmtR2IWAysKbPssYrFCorzVg8w3EQQSUNkE2WDBydeQtZgfiLMAm7whAsyUKKrufNj
         DmNF73K/FVRq3M16/mfEuvV5hepa5XGG75uUJW8AABgqcKin1XMPpKhUQ5Ogfqn621rg
         JmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744890477; x=1745495277;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBLAAxkl3M2aD0Ln4e9Wk86NcYIdK4eZVXhB9EcxpTc=;
        b=SdEAQb+wX5Lz0j3Naj3PnQSYYZs6tP/UIHp5E+pr0Mq7RQGJUs8YPbKPk7Oep8jovS
         hjyLpCMkVUUAJA3gdp8QskQ20tVdTeikzyc/LTuIqpuyG0ouNf0/8OwkLVSXMS7ExkJl
         EfxGBuEfxI+cE7/6/RzEZ1NVO6BhqO13nabMZF59WvibTko2N/FNInHHXg5z+EONKGbr
         J/Al7bGH9ugOknFi8lV3uD3orUj5nN2ujj3DV8MDaihIAMy3IPgtm9wISNsd9DK+nUzl
         Chrad2alNC0dTVOZiBHcj3+jewDsZNL1yjemOMyI/LCRKorTcDUAXuxV+OHPt/nKwCUb
         ZayA==
X-Forwarded-Encrypted: i=1; AJvYcCV1kStAVCxINhSuQ1nvyZE2iZsmfY/jTgjBeoz+QqnNIYGQANCQwexDIRIHDBRiKcQEIeKGvNbUV8xULAyy6rwZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzVcSb/wi5k9VBZyi7l8I/Sqpe7hEsOTDgRLHp0f7Q0YsvmHEkn
	eQi+LLWezZbJlb9fygjJJkQ/A1yhkd+iq7qa8HI/1GLehAWfDt8xiIHAurX3RUhhh5x1KXxZ+3Q
	dWxOgMQ==
X-Google-Smtp-Source: AGHT+IFZGyRsQ1aryQORA6PQNqcCYWM5zes7gMTdLse4vLdGH5dbRsoTTB772/BYDikDEgjkczNaL1s7l2UQ
X-Received: from wmsp25.prod.google.com ([2002:a05:600c:1d99:b0:43d:41bf:5b62])
 (user=korneld job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:c0e:b0:440:54ef:dfdc
 with SMTP id 5b1f17b1804b1-4405d616849mr57468115e9.8.1744890477189; Thu, 17
 Apr 2025 04:47:57 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:47:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250417114754.3238273-1-korneld@google.com>
Subject: [PATCH v2] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
From: "=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ssradjacoumar@google.com, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_044759_463271_4596EBA1 
X-CRM114-Status: GOOD (  14.91  )
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

When the 52-bit virtual addressing was introduced the select like
ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
Because of that the rnd max bits knob is set to the default value of 18
when ARM64_VA_BITS=3D52.
Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
be used if 48-bit addressing was used. Higher values can't used here
because 52-bit addressing is used only if the caller provides a hint to
mmap, with a fallback to 48-bit. The knob in question is an upper bound
for what the user can set in /proc/sys/vm/mmap_rnd_bits, which in turn
is used to determine how many random bits can be inserted into the base
address used for mmap allocations. Since 48-bit allocations are legal
with ARM64_VA_BITS=3D52, we need to make sure that the base address is
small enough to facilitate this.

Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---

v2:
- Update commit message to explain why we need to set the same value as
  in the 48-bit case.

 arch/arm64/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..6527d0d5656a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -333,9 +333,9 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 24 if ARM64_VA_BITS=3D39
 	default 27 if ARM64_VA_BITS=3D42
 	default 30 if ARM64_VA_BITS=3D47
-	default 29 if ARM64_VA_BITS=3D48 && ARM64_64K_PAGES
-	default 31 if ARM64_VA_BITS=3D48 && ARM64_16K_PAGES
-	default 33 if ARM64_VA_BITS=3D48
+	default 29 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64_64K_PAG=
ES
+	default 31 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52) && ARM64_16K_PAG=
ES
+	default 33 if (ARM64_VA_BITS=3D48 || ARM64_VA_BITS=3D52)
 	default 14 if ARM64_64K_PAGES
 	default 16 if ARM64_16K_PAGES
 	default 18
--=20
2.49.0.777.g153de2bbd5-goog


