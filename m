Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CE7C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MiiOBFHtT5ZtQA/f0RodEb62SyXtn3/Wda9R6Uedtxg=; b=zs5yov2pQGgrtJ1TFf4/Ok0JDZ
	QYCe8eq1/6pIS/UR3OVjPByEkOwMAgxYqz52Ayn+zuYYFExkfylVmPy+fhYSeDEOv7ogT6b1xEFRY
	6zUrbnjdNa4amPl3UdQ0eIMIbFi7RDQYSgy6IBFrG1X7/inxQsnYdFW/K0CJKJHKprkXOBZiiCcDn
	8ti5u0i43j4FRqNlmnw+xb1xGgyC6d/KOV6B4150UMOj9A/bfYv3UDayV66ehWLnh2PtOGICPHUlQ
	JqoESJMjo0RnJkAbg5ZRs0kMVO/YzRcentiFcrGLlmuGGpmzTd1rFpxiZx7VTvhXRzGzhtsY7s/NZ
	IA9M0EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUFN-000000002Ty-1c17;
	Fri, 06 Jun 2025 10:24:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNUC8-000000002EK-3i0d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 10:21:06 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso3669682a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Jun 2025 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749205263; x=1749810063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MiiOBFHtT5ZtQA/f0RodEb62SyXtn3/Wda9R6Uedtxg=;
        b=jtAzXzPX6iduv+hxV+GoEBVX2aJvbZKmJFDL81mrw541WwVW+Hsbb8pjZP6wy+1sUH
         q2QvT+cDLmymxp6GyBZM+e813kj80xS1JA0x/yxx8JyNQZc0JIjaI7kdtheW1go5zUg7
         fWdkczt0uLsszMy0aS3lJkQeLSkNXIxkVK0Gs7SOAaPHUjehC010OlXiYm6GtAocgmse
         VZBOT29a2dOrowq4wzNJZZwOaSDhkdZOvHneNpFKXYRuXmm/YPlrst40C8JhuCpNL+MT
         JQ2sGdOiMc3EUA2rK2R26SIyMz3gL61j/QNxnaAcZLHYNyqnEW7EyERm08jvr67HQyRr
         e6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749205263; x=1749810063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MiiOBFHtT5ZtQA/f0RodEb62SyXtn3/Wda9R6Uedtxg=;
        b=NK+SzDEvpInXWkn2euObL3s02vWDStA3+HMmRa36+xk+GVaBbA/mW2OjfWeqziKBhK
         oPM7mbPzuzivwjCQtMn8GHXSy3chLMGyGr0fgQ3lsUDkXtnhFRZjVuKoRfLkIhvGAly7
         nKyM3f0NnFESMrwm6gLYyq66N1Z0jxRjV5WgCZ62K5VZbD1FYhhBI3ghXyPzQRfNtpTA
         N5prDMjfPqE13vgO7FlSP3KoWkJ/8FIL1U5jlahsmhdgJtavty2LOrpERe6hc0m6bBlv
         U1TKemDH3fZyCPNMLcnVZy07ueZi4kgn6tRCgRCHrbC2iLKTopr+JYN6QKCpkRTTB/s/
         VUgA==
X-Forwarded-Encrypted: i=1; AJvYcCUgEJYvaxJLV8GXJRvsbkqpbacsltn7mqWym3S5xfN0iezuqSJhDZPBa7t6pTFGGnWZ6KrYLeY5v8UNcywMBBVU@lists.infradead.org
X-Gm-Message-State: AOJu0YxMW8qkWLOYYPq4Lh3oulx02rcstrV8s9eBm8pZHoXtP1Lc06nv
	yEtfkbpdYG3Vqc9npjS44v9P8QRdmV/V+/VsVCNiXabKmn4sgqDH6T1W
X-Gm-Gg: ASbGnctM7OYbumM5qYBKPmSW6ID4jyfALa6yaLHhePy52ENObF+GeXV5BPF+gr1z+L4
	0wVAyfVjdmyNxjKnghFtlk7YYIJ2rN5Ai5++QJ+EqDPKAiw6veFdUt6T6JszONvtlDYDzi3VS1E
	GBT6tVir6MmRIsVJKBktPVS014XPFm44V00a5J6WkZC0UGr5Lm4aJOdau3Oxa5MMabJfTcCY+7A
	JMJIGoAsjNYJ+0br6kPkS0hShm8A9fM4MHMiXyMbGOdFrL74ffGQ2u1M86iP2klM/MT3U6QKPC+
	sFTD3QhAB73npWo47vNADaa1sMe5bfx7R2XVmVWzdOsGo/F7wdHPK2HPdCG4CfVhkx2d13tkXDI
	=
X-Google-Smtp-Source: AGHT+IEhapm1K8w4bky257wfwPuqvgCoQuQfxgO95l+/hUIeSvoPyiy84rQ6sHS7x6VE6POMwqilxg==
X-Received: by 2002:a05:6402:1d4b:b0:606:f836:c666 with SMTP id 4fb4d7f45d1cf-60774a856bemr2463366a12.30.1749205262677;
        Fri, 06 Jun 2025 03:21:02 -0700 (PDT)
Received: from archlinux.ad.harman.com ([212.133.80.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dd3c5sm809256a12.57.2025.06.06.03.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:21:02 -0700 (PDT)
From: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
To: 
Cc: bartlomiejdziag@gmail.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: Change the busy-wait loops timing
Date: Fri,  6 Jun 2025 12:19:49 +0200
Message-ID: <20250606102100.12576-1-bartlomiejdziag@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_032104_920335_2EB1A248 
X-CRM114-Status: GOOD (  13.35  )
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

After writing a new value to the PTP_TAR or PTP_STSUR registers,
the driver waits for the addend/adjust operations to complete.
Sometimes, the first check operation fails, resulting in
a 10 milliseconds busy-loop before performing the next check.
Since updating the registers takes much less than 10 milliseconds,
the kernel gets stuck unnecessarily. This may increase the CPU usage.
Fix that with changing the busy-loop interval to 5 microseconds.
The registers will be checked more often.

Signed-off-by: Bartlomiej Dziag <bartlomiejdziag@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index e2840fa241f2..f8e1278a1837 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -144,11 +144,11 @@ static int config_addend(void __iomem *ioaddr, u32 addend)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present addend update to complete */
-	limit = 10;
+	limit = 10000;
 	while (limit--) {
 		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSADDREG))
 			break;
-		mdelay(10);
+		udelay(5);
 	}
 	if (limit < 0)
 		return -EBUSY;
@@ -187,11 +187,11 @@ static int adjust_systime(void __iomem *ioaddr, u32 sec, u32 nsec,
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time adjust/update to complete */
-	limit = 10;
+	limit = 10000;
 	while (limit--) {
 		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSUPDT))
 			break;
-		mdelay(10);
+		udelay(5);
 	}
 	if (limit < 0)
 		return -EBUSY;
-- 
2.49.0


