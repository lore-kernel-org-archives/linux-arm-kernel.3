Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0445C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kn2yYrM1UIKukLP0LvXbrmIvY2l7yUk/5s66jBjj1PM=; b=VvNtTZFgwkJULxWK0f/vlpyuIo
	SNTMLHgVzQgiuinB4OVaZbZUHeQlCWt45LThzn6IN+oZah3viJb98TYOiwmrAkGmoqn1CDd+PUpmV
	zrnsgHoz+GcFHY8F+bcJTtKepAaFc1Gm0zDiO+SbwkCAq6pxyBzDUorA4tLKnRqxUqg4mH5QAMk3B
	UExTXxTI4y++MZRfIJx7lStpRCjxhRaybSY39EOQj3gYFNHsGwb8fsgo2voD1Ukl0FOq7AoY0fHnl
	8sORjPzG1e/EikSRdBpIwlOdPK2rStozTIlQUOkFNvDJrNDKrpaznGA4slS3jzR8hL0eyc27DlT8e
	gtGTeELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdJj-00000001Z85-2pkZ;
	Thu, 15 May 2025 18:28:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFdDj-00000001XFp-2lNN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 18:22:16 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a0b9625662so1151738f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 11:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333334; x=1747938134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn2yYrM1UIKukLP0LvXbrmIvY2l7yUk/5s66jBjj1PM=;
        b=RHTFBVjH2xtnmsnwm3LbM4qjvvCUI7tL733c0cjX8LdsMxIGrKaEfX0om+gisJINdq
         Im7zEgESmwpYa9BTIabhVV5EKCZxAKd86+N1QlHLVmU3gdZ5dNVEqC6b85EUy/e4tC+G
         P4vXEDSqtjnWvYBXeoPxCBMjCogIlUdyHcXHHEwMXjwFKTJrtXigrGLBPFXh9AbsBWN4
         Tq25pKv0eC8C6HIG9BHiEmNBVKkwOnNXeMlCuK0djUtq1FQteTrvueRL77Q7opH5kCAh
         VOIVv8+jOj5l1dxz0oUpXo+8gvIWbzLJtnc8evTdPmxmIFAumlLMjf+aA+AqeLSpyYYq
         rolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333334; x=1747938134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn2yYrM1UIKukLP0LvXbrmIvY2l7yUk/5s66jBjj1PM=;
        b=uCIgvn/l6nCChEzu6R5b9JCX9c/5XqKyxvmo3CY3dgJ2TyKgTDdnfLbAGwtp1BNNxo
         z8TXF7VrrDF1MyTm15JsUzL9a7iet4fnBoY1ZM/Nm7r7B9DuvhUS2ZAtEna4OkClU+GT
         fuGdhcG3AnIgGZPNB1BagP5W+DAoashgTVGPsqfUW1iIa50FmANKyKcpHi8yWFda/xeu
         tDiNc3Jebgrh/aORkdbAZ3i803MX1pS4Z3nnVAfGmgl1IAcwLTCuCgcPsJSi/hnAYPSv
         cbOKcQzlixra45K0/x1zwkEGw+/1eG9smUF203LoXbrO39QHQppVSS+rVgsjdCC7rv78
         NfUA==
X-Forwarded-Encrypted: i=1; AJvYcCXKfSPJfxwghj4JNXYN5vb3cVF9789ZbBf1kO0aXRaYNm8bzP/DGYPT15s5MMwbJjyYl1bnzVFubmh/cCsnpiR1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/pOflOrovEoc1CzammANN3SgtQqbbgX6+1Tk8my+jQbMv/E4u
	ixiePaOs4Mjn/4u5PApCx9bnHztMZAKyMFJMZTEjC+/GmlQL7KdUSLIT
X-Gm-Gg: ASbGnctSJpkrK8bpfkPW0i8pKh0vBQzsaimzvm1PG1Yt8bcARPZbQngPzwIKgJRXW21
	iqQokdKAI8bWIiLK9bPBbxJQDhBDckfZrxbF1XWuAJ24SoAUlO34A2hNSguQeMHG7ybQoGwAQGC
	W23J1hrK+Kc4KMkjaH+quwVFoXt6MJSFwIMQDNvaeCj1cGRYjsVU/pZs38u1rSO3j0lzaMvc7Ff
	/sZGV/gjYWdo3mSUKSkMNasKzq8fmFSkrq6kvWCGkUwAHmsvfR/xXo8FN//SP7GBREYTUGyakog
	Mmr7f7pWGG6GxEmj93SeJuxRYdORRfRDklSswDdUmD++h/6LYacwg58GP4mFczWHQAev7EF4u7b
	U6KEypCs8zZiPGj73UgU=
X-Google-Smtp-Source: AGHT+IE8zDfTUWjNT5rLG+A5krv4zeKC9QmV6pM2KSbj4VrigC6WF+Rh7NRaZUTmIELjyBa4bQtZEw==
X-Received: by 2002:a05:6000:22c6:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-3a35c821a7dmr789663f8f.19.1747333333843;
        Thu, 15 May 2025 11:22:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4a0a5dsm5828155e9.0.2025.05.15.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:22:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
Date: Thu, 15 May 2025 19:22:07 +0100
Message-ID: <20250515182207.329176-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250515182207.329176-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_112215_698460_C26248BE 
X-CRM114-Status: GOOD (  18.22  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Previously, the OSTM driver's platform probe path was only enabled for
selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
SoCs, which encountered IRQ conflicts like:

    /soc/timer@e803b000: used for clock events
    genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
    Failed to request irq 16 for /soc/timer@e803c000
    renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16

These issues have since been resolved by commit 37385c0772a4
("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
probe"), which prevents reprobe on successfully initialized early timers.

With this fix in place, there is no longer a need to restrict platform
probing based on SoC-specific configs. This change unconditionally enables
reprobe support for all SoCs, simplifying the logic and avoiding the need
to update the configuration for every new Renesas SoC with OSTM.

Additionally, the `ostm_of_table` is now marked with `__maybe_unused` to
fix a build warning when `CONFIG_OF` is disabled.

RZ/A1 and RZ/A2 remain unaffected with this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- Added __maybe_unused to the of_device_id table to avoid build
  warnings when CONFIG_OF is disabled.
- Added Reviewed-by and Tested-by tags from Geert.
- Updated commit message to clarify the change.

v2->v3:
- Dropped config check and unconditionally enabled reprobe support for all
  SoCs.
- Dropped Reviewed-by tag from Geert

v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..2089aeaae225 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,6 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -233,7 +232,7 @@ static int __init ostm_probe(struct platform_device *pdev)
 	return ostm_init(dev->of_node);
 }
 
-static const struct of_device_id ostm_of_table[] = {
+static const struct of_device_id __maybe_unused ostm_of_table[] = {
 	{ .compatible = "renesas,ostm", },
 	{ /* sentinel */ }
 };
@@ -246,4 +245,3 @@ static struct platform_driver ostm_device_driver = {
 	},
 };
 builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
-#endif
-- 
2.49.0


