Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C36C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=; b=efLXpC7Syex2CVSCHukMlMcaK0
	M/3FA7vpAlaOrVQjGf2D8uKpwQHJpKHQcsshcQ2sKWBXkD28BhkcatyPcJx7G+ej+2I6jXCT1dsN2
	Bfx0Ol5l4xt94JYzfxHXPiQu8Kd/4FWd5htarCKwGWTuqNIM6cRbbzRE5RUnur8+Y8NtU9vdNWHhq
	UOyUfboNlOFQyu+a3bqnaEdCBM3HyvxsmGktAyXmgays1hlAQ96p9VnIFR4cVsvEdeZeBlDg6ADgH
	jOHs+he5p/+r4lfu+0pMWTVd1ydhtj/erN4kYSYyzQVJ8GlDogGb0lbHnNXzewvvjpUB1mkp1xs8A
	MLjMgn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApsW-00000001yBZ-18in;
	Fri, 02 May 2025 12:52:32 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApnJ-00000001xXW-2NDu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:47:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39ee623fe64so1919137f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746190028; x=1746794828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=;
        b=RghYOUqv2STivwDC9VGM6qME7oQQMXbUXHUXPtGFT1i9ZubZfERceBG7/Ju/cFae6A
         SRiRUr68LyB6n1j6FumoJxNM93xS9DJwQ6oXNhn7KT8/mEDTRct7jLNjOgTKutZWRPq1
         d/OOhVOdPAIi8dj4PXk+Ze2t4es03DEmohYFtnedpbCxsGahsk9rsfTh8hMUIZOFfC59
         UBmK8k/tThntRGBLEEXVXwSfZcDD8RxQilbOXV8Sh4OhKBgiJM+DX5lV6WyAFH98XyZo
         t7VDS1Eu8tiq7EesX0z9BEtdvz5N7cInrUdJiQdh6uoDpo/wMokg2LlDvZ6kLL7A8r0h
         wStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190028; x=1746794828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=;
        b=dTcy9N/rC+BhQDcIXsT0FagqX4SVAh+AuFA9I4zKCq9OJTzQ5mALDsyVedfNLKbXz+
         s3PsXZsrv7BpS7dNQxNoFk5UHZ0wBO8nUKJBrllnvBlAf7QVorB7sXcu3nt/jhP8aq1i
         LLMdtV1gKH5QV4DGUpFoosflEpLXpn53iOhMacIQJkWnEkqi4swVcnnWsNmpRJUpmJXI
         DGtVcvPQRi8i6Nyw2YRLf5RgJBiHCYAPU/WwkcCQIgQ+JNyJI/IgESBhuLHNot8FZAHv
         IegTIswJHpfm1djbr4Xlc/iAsLWHsXcaFczEUwxoJRuqQdbT8r3O9lD1DbxvqzOPBcDE
         efgg==
X-Forwarded-Encrypted: i=1; AJvYcCWJG0S2WxxJfGEFsEQfGOMtjZZ1P3RDzCvNo0Vr/vWPN7hunJ/NJ/1Mhycep8wbNQ76ArY83JAubPmahIsiIkXB@lists.infradead.org
X-Gm-Message-State: AOJu0YwCRSXlVeq8I1VVWW5TVkpLuUT868vmyjJXYaGubHdTPg1wDSKt
	2mluXNympUm41bNwTIKfX1IGvg0ML9WMtt20UMXAk77U06vndVQy
X-Gm-Gg: ASbGncuKl87o3yo4kw4YcCHFmi7UvFWgqNE1qWkPiuHwBRc55Ra3h9Gp2b19ojj6x1V
	gJ7NqQ6TwNmxNw+B0J8aZBU55AdFfXPzBRvq3+6M6jk4SMJ9W3t5IO5RMJRfa2aYQS7BXlJRYZH
	MXXRnsQs+BE9pDGYATVbOxu+wTFqQ9dl9J5KZtK2CsiIMsDtgS1sd6C2SaTcPFFHp82n7mtvOMR
	h4nbdhKhEB5IiLGd1IBtxyNBFafIIQ8lWcFU1v8+Xx6WiuC/Oksg0idDJY+/vzcxrQbhPY+ZGJJ
	lBwdU1OlnzaXmhNHD8adqTorC9Do2sp46dWc95EMvI8spZ2iPSPmdvG26BqRaNKy
X-Google-Smtp-Source: AGHT+IF6Cpj3okvDc4iC/5uUndp+JjODJdaRzI6e7QeAzCIjmBfAW7UuXi1BOJlw8WNGiV0/o+enjQ==
X-Received: by 2002:a5d:64e6:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-3a099ad2f9cmr2204754f8f.3.1746190027748;
        Fri, 02 May 2025 05:47:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:47:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe for all ARM64 SoCs
Date: Fri,  2 May 2025 13:46:27 +0100
Message-ID: <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_054710_530180_1D85E3E5 
X-CRM114-Status: GOOD (  15.92  )
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

Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
platform driver will defer and reprobe on any ARM64 Renesas SoC once its
reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
were covered.

By matching on `CONFIG_ARM64`, this avoids adding a new config entry
for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
are unaffected-they still use OSTM but do not define a resets property,
so the deferred reprobe mechanism is unnecessary.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
I've restored the Reviewed-by tag from v1 with your suggestions applied.
I hope you're okay with this.
Cheers, Prabhakar
 
v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..6a5785f9c9c1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
+#if defined(CONFIG_ARM64)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0


