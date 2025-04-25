Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26D5C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 19:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tSiF7FhF0tHfOGpGfJXsH5sp5D81/QkR5l4lerbklaI=; b=LkjcX/X1yPihAkpa0xZ86EWZQS
	ugSBKjEcKFJb2HqKbJWtXIGwpHKzoEnDfVGo4r33p/Q+J9WdgO9kWoLXhgqZfklWh8DU8VhXifWh5
	xLtGR5As4CWWLmRGpOuoFzN5pp+BkuTx8s120/mQkjyuTWYqrcO2QiP8xZV2KO6lezdYvPt41BWni
	vMgq60TpWcGBeyVCwouIJlWn7AUzz2YYeDPLOmA3uI4Per0QkyEiKRBvVrxYqAripZhzUAk5y5WOG
	xPzluYW6Mx+DijbkBKHEGsgXTC/bvbkJvS5Psq776Pwrx0cC9PTRLHE3xy8IuiFoUaTy+MEn2w189
	qiSjLScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ocj-00000000dcG-0i4t;
	Fri, 25 Apr 2025 19:22:09 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Oaq-00000000dSZ-0fr3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 19:20:14 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-476ae781d21so29687211cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1745608810; x=1746213610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSiF7FhF0tHfOGpGfJXsH5sp5D81/QkR5l4lerbklaI=;
        b=LbXdftRXVP72wO5xh4RDuPNwKMiwI6JOr2NManFKMRXffx+f95F1rjz+kGrmdcgUPC
         wY20qjG8MLNkMe3XrryXA1Wpbpc16QLp35GRMUVanNpBIfZtfJHD3ZlQvE1loZpioZzc
         SFpjX2DzY3qprcaTfzsnjVFsJ3hnkN7nKajM9se95PtsKpfl4r2xJO0yjRkaTw3Y6Sfn
         rJG8ZZbalV8Dm2kCulcpJFIze4CnbtGy7LNHpH/infb5XernXXf1rj3MLGPpEkCncAkh
         a02fwEtrQ2vP2/273xh47AQ4fCqiQMD4GdAkrOTtT9ka7SK3oPMvkD3J+3XtxX/HzQ+m
         Q2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608810; x=1746213610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tSiF7FhF0tHfOGpGfJXsH5sp5D81/QkR5l4lerbklaI=;
        b=I89i7qXKBuFzenTvdRzzwMgZr/hR+3wsKr8iPVJM9tJk/C3OnEr+oAJFepbrsWVSCM
         HQPfIQ3NQI8cDZ285HMNAJN0PGaxCMz0EV9rMeSliD9fDtIgwRMRVtVkzpZAgA8z5rFQ
         riktHEYwxLkVNP+wwBUgfhw+Nba9FykKIkTcDlHPcpAAGcsEtJ8BJWFiHVScBXzQqB9Q
         IKvDerqjk6TH9LP8FANpvOkOc+AZXWoIUSI2xKOtpfwjKwe7DRT6DFr0il/XOVtuQsUh
         rLFKHam+Lqn9gkmXbzyI0ayIt2dlLNDZhomdUZA5dMqhitxXCzWzDXZCwY83z49SErmE
         4PlA==
X-Forwarded-Encrypted: i=1; AJvYcCVULZ1TOIPzgmDvrXH99IuNVSVK8PMSj+YIGSLzFjF38Qlt1atV9CwUnod5wpVHNAOmcnOnMTAndjRuuksE6Kuc@lists.infradead.org
X-Gm-Message-State: AOJu0YwGtZiAvqZskT1EpfRedpQIZcBKZm04lpuhM6QKV4xVSm342NqC
	ZE6kfL4CeSksc02wxVJ/lWcCPfDVEj8FzV/0cyP8im2ejAKYNOlhzqXi6hHqOw==
X-Gm-Gg: ASbGncv7+zlF38zFcW/2BJDgcRD94WqQbMA9DL2OYLy6enZ6pWjFXMlkp+r9volkWXS
	dO4TIqIk+dVajo6dI3gM2zfALRXeF9VD6smPYkz61mfEZ8MBQAIArlo2/yAjmvEI39UcHmKjEZe
	kl70QcPL9JcJ6eKEwokEvyLyg//A2g0wXIgRy3AnufZRZNTv6g8pt1EEARGAA06EwAIhEShg9cj
	fnGGK/EzGi3zitoXdH414VWdgWPLgYrTC9xx144FXzLcGPq95S3F+/IOPS0OFc8CD16sJowsd1K
	iyh1+Pf2ALqx+7b8+WsS7hqzDgMDqcZCPqfp
X-Google-Smtp-Source: AGHT+IGY/FeexPuDpgYb8JxPjPFvAGcEWUmeISWIErTY/veMEqRNOKkQikr2E7yj9IXljqqh0c90qg==
X-Received: by 2002:ac8:7d4c:0:b0:476:a895:7e87 with SMTP id d75a77b69052e-481335610c0mr7228001cf.48.1745608810494;
        Fri, 25 Apr 2025 12:20:10 -0700 (PDT)
Received: from localhost ([2607:fb91:bdd9:47ad:b39:2164:cbe2:1695])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9f1cc02esm29045181cf.30.2025.04.25.12.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:20:10 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christian Hewitt <christianshewitt@gmail.com>,
	stable@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using internal phy
Date: Fri, 25 Apr 2025 15:20:09 -0400
Message-Id: <20250425192009.1439508-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_122012_311842_D574512B 
X-CRM114-Status: GOOD (  12.65  )
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

This bit is necessary to receive packets from the internal PHY.
Without this bit set, no activity occurs on the interface.

Normally u-boot sets this bit, but if u-boot is compiled without
net support, the interface will be up but without any activity.

The vendor SDK sets this bit along with the PHY_ID bits.

Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");
Signed-off-by: Da Xue <da@libre.computer>
---
Changes since v2:
* Rename REG2_RESERVED_28 to REG2_REVERSED

Link to v2:
https://patchwork.kernel.org/project/linux-amlogic/patch/20250331074420.3443748-1-christianshewitt@gmail.com/
---
 drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
index 00c66240136b..3dd12a8c8b03 100644
--- a/drivers/net/mdio/mdio-mux-meson-gxl.c
+++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
@@ -17,6 +17,7 @@
 #define  REG2_LEDACT		GENMASK(23, 22)
 #define  REG2_LEDLINK		GENMASK(25, 24)
 #define  REG2_DIV4SEL		BIT(27)
+#define  REG2_REVERSED		BIT(28)
 #define  REG2_ADCBYPASS		BIT(30)
 #define  REG2_CLKINSEL		BIT(31)
 #define ETH_REG3		0x4
@@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
 	 * The only constraint is that it must match the one in
 	 * drivers/net/phy/meson-gxl.c to properly match the PHY.
 	 */
-	writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
+	writel(REG2_REVERSED | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
 	       priv->regs + ETH_REG2);
 
 	/* Enable the internal phy */
-- 
2.39.5


