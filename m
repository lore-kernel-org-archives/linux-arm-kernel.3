Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C80CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 21:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ccGcySGRmGIWQ9ev4EV8cr3WtrVC/pwB6DgMMTm/7tI=; b=W5pZrHQcKjzPXus+Tj38LS76dn
	ax27AgUhDF7dj30Ygf0XiaBorN+Ra1y/KbUdidPAG9YRFmznJdQlumVQ259dSuSIv37HFX7Pm95Sd
	PDfc1/9mfQ/pjXahpKu7RcPwnHVDGk7+5dDIFdEX4ACXwZnL5y96ekEZacqh0dLxATp6aGY+yBdNB
	GlGS4XxWZyZN/TjmvIfrFYd9al0PB3v9XKhffIXEe/CdjGLYKBDjK3DmsXL73uxOW5vi9Ky7NHDkB
	a46aSLgHuiDwEVhUBwpqrS9e4G3p3AacwdRmkDx0Htg+11oluRoeJJ96gAV3NVTj2oGjdOHI09z6C
	i1O3Rq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXIB-0000000BweA-3jG8;
	Fri, 22 May 2026 21:20:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQXI9-0000000Bwde-3hN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 21:20:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so43259535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779484824; x=1780089624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ccGcySGRmGIWQ9ev4EV8cr3WtrVC/pwB6DgMMTm/7tI=;
        b=qWhK+W4dhsKBeJ0JC8NGdS/GTrFphtkOuhbCybV/sbzBA7WGIbJC+PJrco9+PPsnlQ
         kKyutHhqRQykmp6ZMdF3qBvteR936qKw9tm/BxCS3+JCeCWcAnEREENaYKzhgVOW92MS
         C9pRlXt/9o1x5ZMIyCmntiwP5Lk4hdDCTqfQQd5WKPpRK9Hek3K6qg9B8NO3iK3zn3WC
         daKIkEKuwWhTpWcZSZo3tYNtkLi0obzJlvvGCFDSNH5X4MDtmoJuqJSYIkKjWSDoxNQM
         lMak4dXfRzDwW6QbPMyfyFIKPJQA3ZnYldnnGAp3h6oZVaZubhhrw1kltk6dt13ljVLx
         cdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779484824; x=1780089624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccGcySGRmGIWQ9ev4EV8cr3WtrVC/pwB6DgMMTm/7tI=;
        b=d4UEQanP8G+2NyPlWatpZ1lWGaovorsaLVg25yRGRMIfq/4OHUt0ZyN6PYOPjUn3M6
         rk2VLTPOoyBIC+F1byAJYWb3Dwr3no9v+kXiw2iZWEIXpBSTtwAIcOl5xKkSUKwgcgm+
         MtgZzZhCMVyoxU2feHU6A+pegtsYsHCJ7Bl7+NQZDbwxB62khemyj5pkbovOHPmoMehj
         xAmGnFHPOREhUSkoVDZkXyUivMOo6GM0y/XisSxAoaf0hagIjRZiQZWh6MpEZSqqpQO5
         Nr/N+z8KW8uVY3tf5GUiEOWu1t8YuET5FBFKqbYsT1SKEJbs3tA/XQUzfTO3NyVFQzEl
         +Waw==
X-Forwarded-Encrypted: i=1; AFNElJ/CjnJUogjZR9C7OaT5IE5HAc5mxqwaKBBFxRcvAtCcVoCYZgTWHwKJWqMztpp/hWNYDDoznJhizETPxZ8KXZX5@lists.infradead.org
X-Gm-Message-State: AOJu0YzTUFhEcUJscQyz32hBWMrvuc+x+kgwSfbuel4Tu8t2QW27cG/8
	OoDrlM3EAJM+00TQn/gfyApiUktChsyvCMKoPYhIkpY+IqxltJcT11pR
X-Gm-Gg: Acq92OF0F1QciPfTGExag9LSeQEuK/V0GPwQNpxFcirpVRHhez3hUXiSDZdTEK0xZzD
	2Ty8s5eZYA+MDJbPKmbBkztRx2RJYloBrq9utC95urvX2NzCdmMkozrxUmbgf6RyI+v4jGh+6KD
	1B+Lv4TNannv9DpUAK9REPo9dQjVqxDUOtlJSubfda8pxBKu5eXbS1z7QY8ExfscUNa+G+QE2Zn
	j91WEfGyZxTpzXBC4EoBXHbwFR+vaX5IHAftFRoWM3Pp+LU5aEwXO94+sY5Wv1ACykd3ESvKFbd
	9IgiSLCQv7oRpZ5vqfu2o73pzOVhjxqIOj7FSmHcznzRirrdEitXSFSVDsTtEVrs91lEh30i6oi
	DL71k9qKHXA3ctJoeTrFvr5KZl7qnheGinsJ00+y/cCIiiS/Q+DljPeTbcHoq4PlV8F/DCzG6A4
	IkyPyGeSkIBMApU4r4yxBGwBiYb9RVHxLbREvUTOWgVAOJi9Vk6zs9LJo1bSCBqkPm/eRZ9jUXq
	aUVLdPEAnIKClCh62Rdec/AqK/1x+IsDsp5G3/75O9qmBWJiWHcMACv/nuU6i3I7ZkiAELrdXUm
	GQ==
X-Received: by 2002:a05:600c:3e12:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-49042481066mr65671825e9.9.1779484823765;
        Fri, 22 May 2026 14:20:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-002-222-217.77.2.pool.telefonica.de. [77.2.222.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm110773475e9.1.2026.05.22.14.20.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 22 May 2026 14:20:23 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Abbott Liu <liuwenliang@huawei.com>,
	Linus Walleij <linusw@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] ARM: io: avoid KASAN instrumentation of raw halfword I/O
Date: Fri, 22 May 2026 23:20:18 +0200
Message-Id: <20260522212018.25295-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_142025_940780_96DAEFE9 
X-CRM114-Status: GOOD (  12.89  )
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

Commit 421015713b30 ("ARM: 9017/2: Enable KASan for ARM") made KASAN
instrument ARM C memory accesses. For CPUs before ARMv6, __raw_readw()
and __raw_writew() are C volatile halfword accesses, so KASAN instruments
them as normal memory accesses.

That is not valid for MMIO. On the QEMU versatilepb machine with an
ARM926EJ-S CPU and CONFIG_KASAN=y, PL011 probing traps while registering
the UART:

  Unable to handle kernel paging request at virtual address bd23e207
  PC is at __asan_store2+0x2c/0x9c
  LR is at pl011_register_port+0x4c/0x19c

Keep the existing volatile halfword access, but move the pre-ARMv6
definitions into __no_kasan_or_inline functions so raw MMIO halfword
accesses are not instrumented by KASAN. The ARMv6-and-newer inline
assembly path is unchanged.

Fixes: 421015713b30 ("ARM: 9017/2: Enable KASan for ARM")
Cc: stable@vger.kernel.org # v5.11+
Assisted-by: Codex:gpt-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/include/asm/io.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/io.h b/arch/arm/include/asm/io.h
index bae5edf348ef..e6bd9e79737c 100644
--- a/arch/arm/include/asm/io.h
+++ b/arch/arm/include/asm/io.h
@@ -56,8 +56,19 @@ void __raw_readsl(const volatile void __iomem *addr, void *data, int longlen);
  * the bus. Rather than special-case the machine, just let the compiler
  * generate the access for CPUs prior to ARMv6.
  */
-#define __raw_readw(a)         (__chk_io_ptr(a), *(volatile unsigned short __force *)(a))
-#define __raw_writew(v,a)      ((void)(__chk_io_ptr(a), *(volatile unsigned short __force *)(a) = (v)))
+#define __raw_writew __raw_writew
+static __no_kasan_or_inline void __raw_writew(u16 val, volatile void __iomem *addr)
+{
+	__chk_io_ptr(addr);
+	*(volatile unsigned short __force *)addr = val;
+}
+
+#define __raw_readw __raw_readw
+static __no_kasan_or_inline u16 __raw_readw(const volatile void __iomem *addr)
+{
+	__chk_io_ptr(addr);
+	return *(const volatile unsigned short __force *)addr;
+}
 #else
 /*
  * When running under a hypervisor, we want to avoid I/O accesses with
-- 
2.39.5 (Apple Git-154)

