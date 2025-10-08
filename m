Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47347CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXOxGZ/YNATafGtRkFO3eyEiqFtBfSwf8M5twzbqcUE=; b=HkS+9xKjZi2AF2rgZk2qErEG3b
	xY5vu0PVKyp4Lg8UAYLa8Sv0INNeHOlZ2sD6z5pbonTOQC0tum9d8pTn+ENRx6ielQGGS2/pAq7AB
	iRucZF/srpQS+XoDN6x7hnWzhsFiFZXPdMcQeu+OkDrap2GQp0aN9qkLFxLwfAryze+5QytCQ0GMn
	P7ZRSS6Lv+atGkBO4n17cAh5+BHoT8bDuuzbmRvYU5MvxHkwUny5r91w7OwoXkPntYqKlrr+Up17i
	ewFVeiQfFFxW9pDrUW0s6Cnq9+HcPRWbYkQEvt4zuilfitbR8QNoaPp6522K1pGuddNmUs5TAIDJA
	M1nA4uWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNW-00000004BMo-0RcX;
	Wed, 08 Oct 2025 15:46:58 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6WNP-00000004BGU-0XLd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 15:46:52 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-46e3ef2dd66so446025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 08:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759938409; x=1760543209; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uXOxGZ/YNATafGtRkFO3eyEiqFtBfSwf8M5twzbqcUE=;
        b=WJw6o1nh4w4HFbcTG85STnEt6O/TzRZVfCF3tv6PJg0M8R6AchSHswmlOdjJax57fI
         JtTjcHZrJZBt+lQwT2LcgBWQ/acOOtMUDbb720pQz0ss2l2tur1n45RPgHRTW8NKA3u2
         WMwKGUjMHHoLHXHPqteo2WEzq7j3obwPbzHawKhpuhR0/JyajnTcpd2jOvXpXyZclt/i
         ZMfzG2bcjE7a8geCO6VFKpWvY/zVB3G7+wpvxgEkMp3Yn1tJwpFwvfSgbIy5TS+5Muj5
         4Whwfymte3rKoKjK+wBoPJq0INz1+ZOzV+xhpKkf661JV2/lKZvMyUtVrR0Egk3aAHBa
         ZAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938409; x=1760543209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXOxGZ/YNATafGtRkFO3eyEiqFtBfSwf8M5twzbqcUE=;
        b=QMWi2ae661TDBt8spwR2KViUv3OmQUq/T9w90hzEz9lXKScpTTh+4Qc8VLVOkT9hjj
         rsugFzINJxuLQLJnOzIgbFjujomqwDAqGqAy/Ii4AkJY0wY+VkSOWetKsutrXAe/vq70
         75/A9P5pYFLrvVH1Bl01NgrM4K8oCFRJPxQTpU8fHWvgw5pSeFbO8FsYsyIRlbiuN7oW
         aiarA0/EWfP2tajOWlatcX2hzTI4d93u8UrruBdxM62UhloxQL4L74Ogi6Xiein9H55j
         xVK4ZQQc6PfWCFNNWMYQhsQ7imYMAAOBIO4cCunASwMW23W8MqXsfZpSopun6n+brnWJ
         0U4A==
X-Gm-Message-State: AOJu0Ywhoe5Q791kQiHWWXn7tHKRjQWs4V44r/ngk5mbjtWTNFKZHgBe
	WkIuioQKTo/NRIzUHT96+1dexuaZrMtuwHn0qWwTsQxxRRcta91ubyFTNsbo+AX5kN0W6+qTB5C
	YrKK7dCxeldFAKtmBrulEzJghvg2EZbsqi/SHAxMFejq+4T01UBpcktpeIS3FnYcrQvj+3I3tAz
	tybYhY+MLCtxSnKqnGVIQIM4vOAnk3drbMv+P0F3ODWqBc
X-Google-Smtp-Source: AGHT+IHrU6L0LG/tG+7wPrq4CdnXtlNwP7FFFswqEly2EF3y8DHI9O5XvzzoSmEJYWWHooMBlG9Iu1ob
X-Received: from wmwn26.prod.google.com ([2002:a05:600d:435a:b0:46d:ab31:6ece])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:a202:b0:46f:a995:55f8
 with SMTP id 5b1f17b1804b1-46fa995565bmr20733855e9.13.1759938409082; Wed, 08
 Oct 2025 08:46:49 -0700 (PDT)
Date: Wed,  8 Oct 2025 17:45:38 +0200
In-Reply-To: <20251008154533.3089255-23-ardb+git@google.com>
Mime-Version: 1.0
References: <20251008154533.3089255-23-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521; i=ardb@kernel.org;
 h=from:subject; bh=sjBBfqHYpRbSdr0WNjBeTQONw5wjcd3c1yQxz5xj5oM=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeNZu5ZqzFvNj+9Xti34033rQmJlb9VLuTw5mZLqRXlT7
 +4+4nGgo5SFQYyLQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEykeDbD/9TlQevcHdwrDbTZ
 1a4VZTKeqptx4ERN2/FmMyZ/vv8bOxkZLt2MCSvUsjctElfyuRjF8PHzGpndpaF6f7z4ys6eWPC bEwA=
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251008154533.3089255-27-ardb+git@google.com>
Subject: [PATCH v3 04/21] arm64/simd: Add scoped guard API for kernel mode SIMD
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	herbert@gondor.apana.org.au, ebiggers@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_084651_172586_BA19F4E2 
X-CRM114-Status: GOOD (  11.41  )
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

Encapsulate kernel_neon_begin() and kernel_neon_end() using a 'ksimd'
cleanup guard. This hides the prototype of those functions, allowing
them to be changed for arm64 but not ARM, without breaking code that is
shared between those architectures (RAID6, AEGIS-128)

It probably makes sense to expose this API more widely across
architectures, as it affords more flexibility to the arch code to
plumb it in, while imposing more rigid rules regarding the start/end
bookends appearing in matched pairs.

Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/simd.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
index 8e86c9e70e48..d9f83c478736 100644
--- a/arch/arm64/include/asm/simd.h
+++ b/arch/arm64/include/asm/simd.h
@@ -6,12 +6,15 @@
 #ifndef __ASM_SIMD_H
 #define __ASM_SIMD_H
 
+#include <linux/cleanup.h>
 #include <linux/compiler.h>
 #include <linux/irqflags.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/types.h>
 
+#include <asm/neon.h>
+
 #ifdef CONFIG_KERNEL_MODE_NEON
 
 /*
@@ -40,4 +43,8 @@ static __must_check inline bool may_use_simd(void) {
 
 #endif /* ! CONFIG_KERNEL_MODE_NEON */
 
+DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
+
+#define scoped_ksimd()	scoped_guard(ksimd)
+
 #endif
-- 
2.51.0.710.ga91ca5db03-goog


