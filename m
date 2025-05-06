Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638A8C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=; b=BqfknX8TZU2NNbouhnoR2ZskK2
	QdXb4BzAClTOKi/nineJ3TUQKni5UF+an/HKVIvEedEaj20JJgFsp7uZJLXDjBVFFEgvjCZSmPmzh
	gK7pCKpK7kH2CaSPMnDruF0GLze1Lw2ZdeYwpYb9amrCdhUhL6YWrX8wgVEhpEqboaqFiKwlkSxs9
	hVLMccRXXhpmZFcxEpFmKp8eODTwARZp68RxJNXswqkQzdTrPhTR5i3ioxAC28HVsvHzDfXbTfIzj
	jxZeIWnPkXBs7V88vBGQHhJtNgVCEgG973eRa8/wSRRPJgjbHVY66tXVIf95auQl8xjPOBDOzWwNc
	UDORh7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHgc-0000000BxbR-1IpZ;
	Tue, 06 May 2025 12:46:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFak-0000000BZuz-0haa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:32:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so4296906f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746527521; x=1747132321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=;
        b=dIyG3ADck3un8FuCXnD7+XKe2nLsLZRnpkJb0dhTn1q1no+o/+rmged2diBgQVTzKr
         p8mQoXPObAimJrJ8tpfHZg/XyOC12SEJC1PnGIuF0aWjk6vZbpM85gMAyzTdnbmJNiN0
         Gr7gS6FLQIOpwrqNVaKAzyNtHZGDdesHABiPeG91fv1D6HgqHcZhnxSWZKIqfcaCLTse
         J/D1bxq542rXoQOICuwdzvHtZibbHGGiHWvLbhVFWevLiGxxZ5TG7dPpHWM03kJ3/QxP
         HHya6UYaLtQqGxZ9olIyQ16Js9h0uArYkoicARgI4IJk5vodPZvQLNt2do6PM8/JwxoM
         1BcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746527521; x=1747132321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OerV0UxutKOzCYvF95TGs6Kvaz5IA/e67MGn1c0G1iQ=;
        b=qWretEox8MhSENXwYzeiVSi+uaHTrtYhT4Xy0WzT9VmhvW/Z9BEM1YLwJnOjuhKCDV
         QSQY/jIFfP3R3enhvPg/ksJSCriidgpHH1QrPmCWMrIt0jADCbbJswHjrmgynXE/yF+3
         fCzi4O4igTjoXZiJDNJdbuWJDhxyfFmENcnSNkZPQH9yZGgcZc9HJbjecb/hITgGpRp0
         b1rTCqrRM5D61kXcn5vIbW93b39IFOjaRH4sJfPKl/DJVrEqRYI5/z+pEzdx5/DHTkCJ
         9gjew5aWEDPPrefpwrCeKeGBSxlFubphV9xTJhpVpyEBUuqQHixrRQMTQjTSkX6Mpm7+
         ja3w==
X-Forwarded-Encrypted: i=1; AJvYcCXxW57pyXaaa0vX74xq50/JT2w2tD18cJat7wnN9pbwKXpuCckq2J1gcOTvPcj7Gy8ELKiaq0x14HCrJYVisKF1@lists.infradead.org
X-Gm-Message-State: AOJu0YxRCz2Qx7XShCHGRzGxrJERNc+v3kzVhfhNofVfGoyO1j4ye0mM
	5X5H5LIMC5ifFp5G+YdSBbL7Kn2IZN1cePraKj+Sb2y/mu6MjCbT
X-Gm-Gg: ASbGnctnkeKJhxCIwyUOx3TqyGos4KqcA+VUw6mr0ybC5bSkYw24CnbGISGga/QQtWs
	59Rzq4rQI5Yoo+tTb6+tFWSO7pnfBVnkFBLP/vhNIUXER9ra3YT3YRnvxBmAWU/0IJ4Ou9qaupS
	BC3bIOJvASFEbSsZb+Igl7A64w5nYHtnKaIrcuYwR7TeTSVdfivlMKCUSolCBbIIz3M+7F4AE50
	X6nqC0LM7RpNM/tOZib6bVLCIp0JM6IiD/2rBCR0zR84ngkO6LBZu/zYr4Bwf8rO6qfP1y9omwj
	gPUzBSN2U7k73iIBf92tkLhYq7dIXf+6Jb0xXAHcHYpr0LAqslg6ZMOonGQA7UZVKA==
X-Google-Smtp-Source: AGHT+IErh7yQXsQGDQe0taMpsU2js1b5QKttN2MDxoVzQ3fdYdk82BR9U6VsLRzI3uXhnHgTjePkyw==
X-Received: by 2002:a5d:5f41:0:b0:3a0:85b5:463b with SMTP id ffacd0b85a97d-3a09fdd83bamr7522458f8f.48.1746527520309;
        Tue, 06 May 2025 03:32:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 03:31:59 -0700 (PDT)
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
Subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
Date: Tue,  6 May 2025 11:31:52 +0100
Message-ID: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_033202_204754_FA0CE3F8 
X-CRM114-Status: GOOD (  15.78  )
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

RZ/A1 and RZ/A2 remain unaffected with this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
 drivers/clocksource/renesas-ostm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..fcf7ac35a9f1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,6 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -246,4 +245,3 @@ static struct platform_driver ostm_device_driver = {
 	},
 };
 builtin_platform_driver_probe(ostm_device_driver, ostm_probe);
-#endif
-- 
2.49.0


