Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67616D5CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52XSQSJD/DBoSd/dVK+WzCA1fOPBNSpbtkHc/N5BpME=; b=sN9vWDXsFkcy5wP7QPr6kVbCeE
	9YCxJQLw70MFgIY+RMyhKdJPXPGx/isxRssrl8bc6msghiuCrVpEHrAIA2zW3vGKMbiw7EPrHNlQh
	1J2wAaoKvB6nZyRjPaV0d9Yg2P1wBXBp4g4mIVvcaMdo1nF9PUA6bygxk63rSHmto705BlS9qnV5M
	pcnMrSnHtTAmEcNsP4S1T2dblxsEQwCHQk8Tvvs3QBiCGxk7l/09RGrliNsTfyQNlYsd6QJ+afJZl
	UI6WrhG47geq+qv78MYfxMs66j0JVLY2ikJ6um5O/eNxnuQMiGjDs7xd0EKtCd/288npAhSPjvNEb
	ZCimrtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65xp-0000000HYQS-02Pz;
	Wed, 30 Oct 2024 10:30:09 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mk-0000000HWYr-3ldf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:44 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4314c6ca114so46648435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283521; x=1730888321; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=52XSQSJD/DBoSd/dVK+WzCA1fOPBNSpbtkHc/N5BpME=;
        b=EoDgBNW2kxTtpmcj+jNjlAlPWrtcmiZMeXi1guhM/o6GqR3Od5SsE4tUs6NIUgz6ZB
         ATR7uP0DucPlw21CzwuGHtO2AaAT7kKtYkwJRnz2aa3S1qA/91HYuVnhgvMu5BZJgIkS
         YOM1VhtQLvzidOCQzTBc9lq0IztVjxOoYMOIEyufeW1wAEwts90e2w9iX4f/TIdF2yqJ
         0D0ejffi8TwC875ppvWfhP6nHNhRKQoK2J6qWjC4dWVSAd5udJiluxu/MnQ1faDV0Mz2
         XSjlwY3QrVleTnZc/SMPdENcx8Y5POyuTI09QjvJUJwVSBKEeZT8XnzdShQd0qmgI6Je
         4KBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283521; x=1730888321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52XSQSJD/DBoSd/dVK+WzCA1fOPBNSpbtkHc/N5BpME=;
        b=bGu7TlwjJLs013PhdzOTvNnyfnjeszv19WNTghwFZI3ZNTdNoWW/wOUqsJVanE1IAH
         uvEi5r9VRoXh6ZS25PpYnf7K/P3EVr6xWJQ0h9kwYFpUsNvTsuELhXft11Y/1RZe/Vyx
         Kr/1H40LMHVtQqVJ3Vs120Xpea/BS8KIefXTT4INQ3zaHodRe8wm8k/nDG4myU1Sdzwo
         hHVK6fcU53zh6UnhgDrUkm4j2aHpgg94Ds1H1zMPOl+oZE4TMOc8OyoKux7QU+gEQ1Zl
         OqA41Uy8XhP8bFknGBZsncWO8WZFduX0gfB3TnRAUfkAc+ng1YhOerGZpz8T231wyUrV
         X5qg==
X-Gm-Message-State: AOJu0Yxccirmmgbc6kkEv+Z+VDvhJ8z0Rn0ijmZFMgolOImMAhXfeA/A
	/9wRdf1kGqiWwsM+5D67+41q5mNf2mPpr+gAErKaACVS6p66l2HMyz8a/CPG3gvBSIqqA/KuoMh
	a1RaNPCae7FLZpCjFCSeTS+yb+bGLoqavHN3JKYFGOMnkJmuNqvHVcYS7toI/NrqkKWbSQ5QUZI
	Y+Pig0tLxSNpQdC5LUo7S7h4nfOD+Q+Pr/jShwHbYw
X-Google-Smtp-Source: AGHT+IE+VEO/hNHzg7jdjYQZotl0+so22jmmCWNlXHxB6h6jNcpvLk11K2SoNznqTnbSklfAXsYs5vYW
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a7b:cb58:0:b0:430:52b1:ae39 with SMTP id
 5b1f17b1804b1-4319ad3436cmr194225e9.6.1730283520639; Wed, 30 Oct 2024
 03:18:40 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:10 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2475; i=ardb@kernel.org;
 h=from:subject; bh=Q+pr1M8F6H61P9kQUTYPtb4597ihTA9POIZzPdbOGKE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/cmzb6dbs+SaWnIUZB/uT8gUOpxzjIG1YddKuaiuk
 sfN6RYdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCJ2Ygz/q+wZnv75ufDFJvWD
 qfadKiGbXXv/HmTTSDMrcsyLDosUYfgfwS7VxLaaoezGeqaXZYZdormWnUv+OjDG3jZ7v3l6+Td uAA==
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-16-ardb+git@google.com>
Subject: [RFC PATCH 6/8] arm64/Kconfig: Drop support for 48-bit virtual addressing
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031842_971978_EB2D59DC 
X-CRM114-Status: GOOD (  12.09  )
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

Drop support for 48-bit virtual addressing on 16k pages, which is the
only remaining config that supports this explicitly.

On 16k pages, 48-bit virtual addressing uses 4 levels of translation,
where the top level has only 2 entries. This is very inefficient in
terms of TLB utilization, and so 47-bit virtual addressing is usually a
better choice.

Note that x86 supports only 47-bit virtual addressing for user space
with 4 translation levels, due to the way its page tables are
constructed (a single combined root table for both kernel and user
space), and so removing this configuration is unlikely to create
portability concerns.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7df7d24c767d..39d0d2eb5b7c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -410,12 +410,12 @@ config BUILTIN_RETURN_ADDRESS_STRIPS_PAC
 config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
-	default 0xdfff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && !KASAN_SW_TAGS
+	default 0xdfff800000000000 if ARM64_VA_BITS_52 && !ARM64_16K_PAGES && !KASAN_SW_TAGS
 	default 0xdfffc00000000000 if ARM64_VA_BITS_52 && ARM64_16K_PAGES && !KASAN_SW_TAGS
 	default 0xdffffe0000000000 if ARM64_VA_BITS_42 && !KASAN_SW_TAGS
 	default 0xdfffffc000000000 if ARM64_VA_BITS_39 && !KASAN_SW_TAGS
 	default 0xdffffff800000000 if ARM64_VA_BITS_36 && !KASAN_SW_TAGS
-	default 0xefff800000000000 if (ARM64_VA_BITS_48 || (ARM64_VA_BITS_52 && !ARM64_16K_PAGES)) && KASAN_SW_TAGS
+	default 0xefff800000000000 if ARM64_VA_BITS_52 && !ARM64_16K_PAGES && KASAN_SW_TAGS
 	default 0xefffc00000000000 if ARM64_VA_BITS_52 && ARM64_16K_PAGES && KASAN_SW_TAGS
 	default 0xeffffe0000000000 if ARM64_VA_BITS_42 && KASAN_SW_TAGS
 	default 0xefffffc000000000 if ARM64_VA_BITS_39 && KASAN_SW_TAGS
@@ -1353,10 +1353,6 @@ config ARM64_VA_BITS_42
 	bool "42-bit"
 	depends on PAGE_SIZE_64KB
 
-config ARM64_VA_BITS_48
-	bool "48-bit"
-	depends on PAGE_SIZE_16KB
-
 config ARM64_VA_BITS_52
 	bool "52-bit"
 	help
@@ -1392,7 +1388,6 @@ config ARM64_VA_BITS
 	default 36 if ARM64_VA_BITS_36
 	default 39 if ARM64_VA_BITS_39
 	default 42 if ARM64_VA_BITS_42
-	default 48 if ARM64_VA_BITS_48
 	default 52 if ARM64_VA_BITS_52
 
 choice
-- 
2.47.0.163.g1226f6d8fa-goog


