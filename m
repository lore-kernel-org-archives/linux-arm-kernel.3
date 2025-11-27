Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599FAD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 09:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lm8/PsD24JkqtJEBb/JHL05JmcK80K+YBsbDIDkSPDM=; b=OabduJ0AJyFeA7CrvQpOjnM+Ju
	Eo/JaPYsXDicFhVL2PiFSIl3G0uqLSTBqono70/2bl5AAaicwUg11uTzhZUhXGzCdOonbUxxEuPXY
	aztTK4BEWHf4YSMkYqIcSG/QjKICOcQe6qltvjEzMhwSLw25USuasuTAJ76sz9CMuWkihxIonp6Y+
	k2j+NSYo4l5jrys8r+YTTbSxfuvDTX3W5iropnN5d9P7KQ9QCPtGNT3jZaQvwZShdnjO3pGlSJm8x
	PRtSuJKS7pWiwUaTwRtBrE4auvZKseNj+K5MxEF4nCLkqbZmYYi1MT94+MEOGobtDfWt1VGP7kO7l
	1Ig33RKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDP-0000000GHfH-1HJu;
	Thu, 27 Nov 2025 09:23:03 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOYDI-0000000GHZy-1HRN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 09:22:57 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42b3b5ed793so410501f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764235374; x=1764840174; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lm8/PsD24JkqtJEBb/JHL05JmcK80K+YBsbDIDkSPDM=;
        b=JiulibjHHCNOCRm6UVxGY6j4Ae2A4yeqp6imi3KgoXZMnhg/LQGHqzWu8c7dYql952
         LHDlUatPpWO0gHDz5Uxg7JLezaLjyCXqvvGtCLNBWp+pl9eFpUawRDPTro8T+evXghoN
         mI1V54IYiNwBThFwyFI3JYvwEbv0kSvEn/d7LfQief1TOqt2tQd7smsTQnZWul8lSS3C
         8NJiX2mINjK1Q8t073gOyKNg2PlpcomeeNJN0m2DUmUAI54LBRvm7qTdRMI6Q5HqOfbB
         snF1tmKszbePbcymK0H9KW/7LwjVdHqM54nj+AYQxZDp5uBhonN9inbA9rwUqKTZft4v
         L3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764235374; x=1764840174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lm8/PsD24JkqtJEBb/JHL05JmcK80K+YBsbDIDkSPDM=;
        b=e5MTWMisjPr8rqnK6BSdxgC3oM3PotKAE+p38DJv+rM07xIZZWUzEtS1GcMuP7Exf+
         +aeXgL8mzhNnZjlM2+N1pFEEVH2Sx+djJqM6ufCgcah5vx77EzP8HI3RHC8LApXu5SnI
         hxhpwjyRGexba7vha87VmBOQ1Zl8iqZbyqqO+/SMIbKjk7NeLaJ86UUc+bdGflHm7twn
         wx6yzWAy4yQJ479zYa5NzQErDqL4cxTdzpfjUQmSFkugFLldxP61GotL4O+2nEBe4+p6
         9uZ9HZkoBfsPvH+cRUOAMiuuLexX73vtuFx3gOQiBpV1HK1M7/5ZPSPe/bZiXuqGoMZT
         Uo0A==
X-Gm-Message-State: AOJu0Yy8n+4AMntMtCRVI/Fp7gXvn4VidQ9yAZBdcEthl2C9L3+KDDDA
	eFqhnxt+jMpcHMHj8BxqgnI/YwUIIiyNWaSyoWjGssjWRJiRcs6wqPg038ik7w5vmCAjbzig8w=
	=
X-Google-Smtp-Source: AGHT+IFiRUSTUyUmmDCfp9DRVB+ITplmlr8U1Vk596xaInsS5h9GpzAVehE1Ma2+bZO9lWJEhGAZ3DXo
X-Received: from wrwt2.prod.google.com ([2002:a5d:6a42:0:b0:429:de3f:8280])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1447:b0:42b:32c3:3948
 with SMTP id ffacd0b85a97d-42cc1d0ce41mr23885901f8f.31.1764235374004; Thu, 27
 Nov 2025 01:22:54 -0800 (PST)
Date: Thu, 27 Nov 2025 10:22:28 +0100
In-Reply-To: <20251127092226.1439196-8-ardb+git@google.com>
Mime-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=875; i=ardb@kernel.org;
 h=from:subject; bh=LXaoefJgP6t3V697yrG8QR6lNpOK4nbDq1CishfTlx0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIVNDItRQuip5xYWJK0Jad7HG9b2/1b1Fii33VdirLhdnB
 tc7m+w6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQ4mRn+aa9dL7tAoXn35YWy
 QSLC104ZXX9x+MnM33/3+icp7VJvc2dk6Fganr6zP8NI1tT1wnbPW+tMZMK2Xolc17SUM+bHreX qDAA=
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251127092226.1439196-9-ardb+git@google.com>
Subject: [RFC/RFT PATCH 1/6] hexagon: Wire up cmpxchg64_local() to generic implementation
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-hardening@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_012256_349919_375FA5FF 
X-CRM114-Status: GOOD (  11.12  )
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

Provide cmpxchg64_local() for hexagon so we can start using it in
generic code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/hexagon/include/asm/cmpxchg.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index 9c58fb81f7fd..05e426475d2a 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_CMPXCHG_H
 #define _ASM_CMPXCHG_H
 
+#include <asm-generic/cmpxchg-local.h>
+
 /*
  * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
@@ -72,4 +74,6 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 	__oldval;						\
 })
 
+#define arch_cmpxchg64_local __generic_cmpxchg64_local
+
 #endif /* _ASM_CMPXCHG_H */
-- 
2.52.0.107.ga0afd4fd5b-goog


