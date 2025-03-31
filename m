Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D28C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYIAFf/wPB1FgKJfqKNRuXGM4xXRDDSYrMtDo5kebno=; b=NIklHEdpQmTB5THK1nPoierlzP
	c+g8kMigRG6aNZC+2h5C0SxSx5jisCmdexJtO8OWFw/KG8TsHEebTXHBBgIMwZYuO3hVsWUV/4Uwd
	pBjTPpxHC8FwLs5UFw2qeuf4rVQExC7h4Smv0T5RBPofzpGRvq/DDSIfcQ0DUkSBJWuOxoMO+Ml+I
	eYArPpwbnijfi7elmfFmRgT1mKVnhKnNUYPzLSimH/0niec9mRnBNFAAv+oIa63eqkJ7rb4Vs3zOh
	eHiK/LIWJ+P2v60Dsqpwts/Kz2vkgaAoOlk5KmgXREvr/AOve67sgn4738V4d9TRsbdZI03+3+17B
	BvWAJKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOEa-00000001ZRC-01TB;
	Mon, 31 Mar 2025 23:08:00 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7e-00000001YY0-0Nd1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:51 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3054210ce06so6572560a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462049; x=1744066849; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYIAFf/wPB1FgKJfqKNRuXGM4xXRDDSYrMtDo5kebno=;
        b=ZHegdCYtpvg+GE/Isif9+fdygDwg6wW7IaWDDIqTD+pE0GhgKzxft96UlT6oqGc8xH
         KPwG7ZTF2PE2WSv6g7aO+wRj5keIW/NHKhJ7DuURtqlFlYuCCeiptBCYrtp5sMG34PSu
         9tmqjR7ZmehxFKx2FpNwk0zs3yYaOj2Y1cOFRQtDnkIsL90Kyddfv4zB1peMLh1aTZh4
         d7gkf/GBheOjb+dcij/SbnxdjWaZQJxZnifMw2s8xNDP4Smq7aVLHdtm0PWbror82iVn
         xfkOvL6OITKk1gpg7799qWRyt/zYD/13HQfn8i9BTf4N+uv3oeoGDYdmCU2MHtw+VcaF
         Nwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462049; x=1744066849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYIAFf/wPB1FgKJfqKNRuXGM4xXRDDSYrMtDo5kebno=;
        b=ZLi7C6CWPgmpYWvoI8CEa4phnYPnnLIWhpK3CaSTPbDHS9z4iTMDstSQ+D63GIcLsi
         qGUyD0olsqOXOWKPGIhEGj3i2441a63Td4IbCxAWHS6qv2vQuKjIGCN7ktWYFwaJe+Nw
         IzTizgI0gSaGQu6Kb7GBQDPqLzCp4LfvdlNxodD1Lv2XXuC+ktFur2xDXuxT5b8g0OFT
         FWAzgXNPMSugsMq0kqzfdyA2KPpmHzlCwZYVA0q5IrqX3LAs8VppdZTblpnB3vzLPhB/
         65V3VvyJGj0rCR+ourByKtZobRfXKoFCYCG6lXi0qQ9LsojAj77WMFC6IYcnXm9h00pS
         5V8w==
X-Forwarded-Encrypted: i=1; AJvYcCWcwCs/AXhnkWKA7mNeZ3MFkMhGfNv4OeDj1JO1TuV+t+SWfxfTIJVRJgbr8Xh2uce1uyd6Ov7ND4SLMBt6WYaK@lists.infradead.org
X-Gm-Message-State: AOJu0YzoCLmHvgvq/qpJiUN6ORHBdD7UsIoWL+53kJpOmf+pPbq0DDWh
	aAUKAG3QZfqZpSwt+Oz0alU4wAkLp7lWnLNlbru5LHV4/D4OBYvq9v1FN/naUtdxC7UmQKOcZhU
	vQe6K3PMsCOTUsiWLgvMYSQ6t8w==
X-Google-Smtp-Source: AGHT+IFpiB1mL5vyi3i3SJZAHaJn7lRrJRhzSesvvlRpke5S6KVBbYcslhy5s8ASZECHhLaZs8DNDJw+s18hm0Fszqw=
X-Received: from pjcc4.prod.google.com ([2002:a17:90b:5744:b0:2f2:e97a:e77f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1644:b0:2ff:6aa6:47a3 with SMTP id 98e67ed59e1d1-30532164b69mr14496424a91.25.1743462048717;
 Mon, 31 Mar 2025 16:00:48 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:25 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-4-willmcvicker@google.com>
Subject: [PATCH v1 3/6] clocksource/drivers/exynos_mct: Set local timer
 interrupts as percpu
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Hosung Kim <hosung0.kim@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160050_129230_49C9CA95 
X-CRM114-Status: GOOD (  12.42  )
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

From: Hosung Kim <hosung0.kim@samsung.com>

The MCT local timers can be used as a per-cpu event timer. To prevent
the timer interrupts from migrating to other CPUs, set the flag
IRQF_PERCPU.

Signed-off-by: Hosung Kim <hosung0.kim@samsung.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/03267fad19f093bac979ca78309483e9eb3a8d16]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 drivers/clocksource/exynos_mct.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 05c50f2f7a7e..21ded37137d7 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -590,7 +590,8 @@ static int __init exynos4_timer_interrupts(struct device_node *np,
 			irq_set_status_flags(mct_irq, IRQ_NOAUTOEN);
 			if (request_irq(mct_irq,
 					exynos4_mct_tick_isr,
-					IRQF_TIMER | IRQF_NOBALANCING,
+					IRQF_TIMER | IRQF_NOBALANCING |
+					IRQF_PERCPU,
 					pcpu_mevt->name, pcpu_mevt)) {
 				pr_err("exynos-mct: cannot register IRQ (cpu%d)\n",
 									cpu);
-- 
2.49.0.472.ge94155a9ec-goog


