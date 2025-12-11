Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61806D41C02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=trUfnuuHzLWg0hqtTbFZbrBapbqubE16vGf51eAqUyI=; b=BxLImc9hQFHxYVdd3BxB/kSICX
	BlX9ldN0I7Fc4k+0v3agLvG0617CrlBZZBBZmo7OmWcWplTHeBehLdnEYih1ccd+1QzxEXR4GdK0z
	xCADCL5XW+KBLPhos4kXJKeQnCgAkMu6eXYVnL8gZe/iwV6bZzxrA7RoRNir1Edc7f+6/4rgEerlL
	wu31R+gYyMpad/F/smEFtSyEv+hDNR6bh26dhtyLa5shERTbsbhGL4zTIaFaKfbYQwOm0DclxVEYE
	f3exubGROizzTJVlfgG0HIJ7wd42n08mLKWRhlRd9pZ5MhJL+5RyHlIuU3w7YZtanfF3toBzJ0mQ/
	85NY3OVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbnq-0000000GMeM-2P6D;
	Thu, 11 Dec 2025 08:13:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbnn-0000000GMcz-1H7G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 08:13:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-297dc3e299bso6962915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 00:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765440810; x=1766045610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=trUfnuuHzLWg0hqtTbFZbrBapbqubE16vGf51eAqUyI=;
        b=GFCpNrCxcj1KZq8Rr4gRIP7+xjuNQ9pHrft9UCdLY1aY2pPuqZ18tYdzk5mF0BxVCF
         2KRdm/D6Fx/JT72htAHUUGLlQuBj7jDXHqVp7kkAx7/wZF14ZUB+lTPr/PjpMk4rJhtM
         fMj3zORJUA2NHX4sgrM/B87oeT9vOutI7N/8ehTB1FaDIrhOh5XRuw/31XNEFMBanNR3
         S+kvEI7OtbUQUvcuWn24Ys8Dfg2Qt4VOJVcFeoM22E18F9XTmzegbbGsGYea8o53WGSb
         vDhq7pCKrXN3kGnjaSA49BRPSYke+1XiNuCNFk3tQX6VQKr7j26phzT+KCXmVrbKlj2c
         ZYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765440810; x=1766045610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=trUfnuuHzLWg0hqtTbFZbrBapbqubE16vGf51eAqUyI=;
        b=wfKHbxH9RSwfMlcruyGqY3F755tJumiW+c6PUOAhr6z1egiNOQNTnGh8rrewVw5MXW
         lv2Umg221/K9o084sTSa8JVQrRYj6qOuNtjGh2q4R30q+t62gdveKR7hc17oOQgPAyYf
         KH2CGicPdSXKlOj3d/J2aqcYTZAWKdZJctlqeiD31TEVET328ogQ5x81u4M5hUuG9/c2
         HQ6oK7cJiF3J2rF55uF/HbKn8uAmh7Yi9KObXm7Yp0oKUn5Bu5z7njoJiy/aHnmAzW39
         uejN+yENaMRYEngt0cMjAJEAqS98ZcByCb8FYLVhCTvCK353KkDIawJZXkx/fBuvqfuE
         skbA==
X-Forwarded-Encrypted: i=1; AJvYcCVkvquE/hJSGGkjf6BWTJOAyJFP7K2HlPr+9rTPa5klgzefhzj8ROTg6v+X7jdtYfnSTUzKA4Aw/loewl9h9OtR@lists.infradead.org
X-Gm-Message-State: AOJu0YwmDAE35BxcGLRGYwcHaydbrKUHneymeUAm8fQxj4kTXvaKVTY4
	fXSajzpPX5lZ5hw54bSQqdeWKUf/0iIOQ6eOXJwliTn+/XDWSMJHXu7w
X-Gm-Gg: AY/fxX4gAGXJcsnJhs3qos2mPGdcKg3OdibIiDY2BZYaEuZSfs7w8BQF34mfUYG04FX
	+iF8gzEREofjeVfUrSttf3vgLuVgSKnTyWn7tUPXwdTZUgYJR7FW3DTbTjxhzbqCISVd/lkp3Ml
	rBu6TC0kV9s/HQWvaNfvuWqbUjgpz4sRDwUTXkjvMlnllza2pHZgUInJnAbac6WxieU30O6hmI4
	4aoYju1BDjC0qZk17xs1B2GK2dbfwUVFIjmoz04ayMIaZsaSDOcBBUCAO4uAlO2rwHEYSM2g0L4
	7U+PdhIfTnh9ZLoEUDpNAMuhO5+SUVOv8uIPbPCuE6y0NeJ6p0sF6Q59tR++sA8csMfSRr0/yUG
	6kpYWRCetB1sa3WZhliyr4BJUgTPukqnqTVpodZaiB2162xSJ38+qWRr1/nKHYK44OF1JVSwsw9
	KJXq+uSnfR
X-Google-Smtp-Source: AGHT+IGpU0Pf7s9UlmMW8EGY8yYMuomHFnlX0/Df9bPI6JMt8uShHZ+gMWWhZpAR4wob/58V/qG9Zw==
X-Received: by 2002:a17:903:2c7:b0:295:6a69:4ad5 with SMTP id d9443c01a7336-29ec2803d18mr60221255ad.56.1765440810038;
        Thu, 11 Dec 2025 00:13:30 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-29eea04036bsm16048855ad.78.2025.12.11.00.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 00:13:29 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] net: phy: mediatek: fix nvmem cell reference leak in mt798x_phy_calibration
Date: Thu, 11 Dec 2025 12:13:13 +0400
Message-Id: <20251211081313.2368460-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_001331_346485_DE64F91E 
X-CRM114-Status: GOOD (  13.19  )
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

When nvmem_cell_read() fails in mt798x_phy_calibration(), the function
returns without calling nvmem_cell_put(), leaking the cell reference.

Move nvmem_cell_put() right after nvmem_cell_read() to ensure the cell
reference is always released regardless of the read result.

Found via static analysis and code review.

Fixes: 98c485eaf509 ("net: phy: add driver for MediaTek SoC built-in GE PHYs")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index cd09fbf92ef2..2c4bbc236202 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -1167,9 +1167,9 @@ static int mt798x_phy_calibration(struct phy_device *phydev)
 	}
 
 	buf = (u32 *)nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);
-	nvmem_cell_put(cell);
 
 	if (!buf[0] || !buf[1] || !buf[2] || !buf[3] || len < 4 * sizeof(u32)) {
 		phydev_err(phydev, "invalid efuse data\n");
-- 
2.25.1


