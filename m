Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF87CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=; b=nak9eGXMDZhCXL8fP3dN3RUrtj
	CmZb6IzwoqVnuA2JENzGPCnm4M6rRowpOkpOE0J811nPijFfuuzDMg0+wODlVbnK+OAt6HGuJnJAJ
	7unQHz4pqUTvx1AI9QD99yQIXYQASUuQWHqwF9MPGkH16pdqkGKSlausS8zmFdWXX8/zTuc+75EqZ
	djLir/lZOhVTYNZOL+WneN+iagoiMV486vAp2vbGmacPrprqGpaQZ3MAZCprI6Z2mqm/iHHMCEZGC
	7cgSi0fPPS8fETYhwya+8oA4AbRCMRAnd/XzkVC8PBp3oOqsvhGF2Sx16tOKe8Dy1HnSh3zGisYv5
	wvDdYVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JG-00000007aNr-1Iw1;
	Thu, 23 Oct 2025 20:53:22 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2J7-00000007aH1-0p0F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:53:14 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-294880e7ca4so6787975ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252790; x=1761857590; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=;
        b=oPLxrRcqmn8MhV2/dbOeCg12vMVyUzk3eRg3wgqzCXTviXd1d+sTy0jrJoeVlfrtiC
         fWtOtC/t1E5fE43b9nX2MIUt+Kq5gawoq/T06JhfIloG2G56dVAZmBBL0uDiy8HNZFwX
         MSIdANcOrDAkrx5pbnEl9NMLMRACk8aF+FqTdcG9+P6wid71L7FOWVY4232o4HZs4gKx
         YB1jG8zPaKFdnBojtblF97ybayy3Ev+YqshjoCYbh/oxaHyrJ9vQ5kAtQx71a91xbsdU
         BglOCkH7TMRGh1e2Zb6sGA90Rty/vKx/RzixlDzP1BFfYwuL5qr1RclgXQw3Rjdcohlq
         w+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252790; x=1761857590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=salcdC7S6u/qcABB4HnnPaySmiqlvAFAzi3hyX+XJeI=;
        b=CcaOFy3Kvdt9TvoWOggZwz/bQpqLGk6EfDELYR5uf663DAqsXW+cjvGsjhWfWkZsJk
         a7UrlyjJfb0rJEnzr7bwfdimwHMIRgTKNUcPinx4cMUwSapxjOhwu5BxVh9DYPo/Hd42
         CEkMYlnHvtxQiqxSsrBh3Lf2oz1gIvJyP+JgDupT3JPCYDlGiOeF/UtFDSiAXzKvJCj0
         5tobFuRGTRlPcsgS9LZqCoVpA2G2VryQYB1nxNiE54irZGmMhB1LHU9zf9/ReH5+bIUc
         WYqZeIosMl/j4VeuDWxWOpwxB4/iGi6Fq1zyXO8h175u1P4OLuwpNKEbtM6zOyI+n2tM
         iYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWInJEWNCk5cPuoEqibZOD/niAigbZD2Bl9aKqEZ9bR4fJu5moQXlBoHfNKZIOa4Q21iAgHOIYC8CQakN7NRuXa@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7x8r57oelnpvWKJ/lZnsM+KAXo3F2XQpn7YHRiMsjCiEgZJ2f
	JNljdl3L4ebgZxNhzf5oONa/cKrEoQ54/kbIUs/Tq9ZOwRSbPbiLpLYwpaBFqmG18NxDGAwTo2v
	ts9P7h8dTCQhKoL+s5+A8a7tepdJl1A==
X-Google-Smtp-Source: AGHT+IEIa3iCmSK88WeYaF57yxXrkmbmjgzKXsIudMzptYilutAUUKrusmtBqAF1jBuMVBsyJrYvu9lT45iuYPB4xpU=
X-Received: from ploe2.prod.google.com ([2002:a17:903:2402:b0:290:2921:d4d3])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e944:b0:27d:69de:edd3 with SMTP id d9443c01a7336-290c9d2649bmr315429985ad.20.1761252789682;
 Thu, 23 Oct 2025 13:53:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:46 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-5-willmcvicker@google.com>
Subject: [PATCH v5 4/7] clocksource/drivers/exynos_mct: Use percpu interrupts
 only on ARM64
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_135313_231669_046C113B 
X-CRM114-Status: GOOD (  11.03  )
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

From: Marek Szyprowski <m.szyprowski@samsung.com>

For some unknown reasons forcing percpu interrupts for local timers
breaks CPU hotplug for 'little' cores on legacy ARM 32bit Exynos based
machines (for example Exynos5422-based Odroid-XU3/XU4 boards). Use percpu
flag only when driver is compiled for newer ARM64 architecture.

Fixes: f3cec54ee3bf ("clocksource/drivers/exynos_mct: Set local timer interrupts as percpu")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index a5ef7d64b1c2..1429b9d03a58 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -597,7 +597,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
 					IRQF_TIMER | IRQF_NOBALANCING |
-					IRQF_PERCPU,
+					(IS_ENABLED(CONFIG_ARM64) ?
+					 IRQF_PERCPU : 0),
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.51.1.821.gb6fe4d2222-goog


