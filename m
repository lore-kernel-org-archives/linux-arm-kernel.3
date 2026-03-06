Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06405FCC07D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 22:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BA9nb83nCkXGkJ9IKyGDJ21XOXhsf5BHbt5T5gtrqN0=; b=hLuxwUc9ZmcmlaJLWAh4PfjnFk
	WtrzM8e0gInkSUHZdWk4KWj6FZTRZLbj/0LIZX2G035fTxnF93A8xUzCN93S/7I5wxkaVdVGM4lXo
	MQvFPjg/RgfcvDIl1+YjL4wljfX7dMNkAm/dybytI39GQ3sJ4sRCe6TE4EbvMR678gjE+kty7opMp
	GspZZDutQENgCavA/w7djsnn2Ra712qw0ajLoli+8r7jXikLyTe2UyY3p94hnthSBNgGl6TJdWjEI
	UVQyRDYE5wWwXVCUBjs4U83tHG+hKvOazxSZoDRc+J0NELa9Tm9bhHVbjsncFOY3aBKsc/ihACnT9
	+ATXWnew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydbm-00000004aSV-0GGp;
	Fri, 06 Mar 2026 22:25:22 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vydbj-00000004aPk-1KDl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 22:25:20 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c70f91776fcso3959270a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 14:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772835918; x=1773440718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BA9nb83nCkXGkJ9IKyGDJ21XOXhsf5BHbt5T5gtrqN0=;
        b=Ly8zLU1V4Rm8KgDsR4ggDCxck3hSO2LBZSIjVVZIBTrvfE4jg0wjpVOG280vgCXosn
         r4RTcCyvUKta/37JXcA2/gLkQEEIcifvdL+Beaj2I+pkZtDKwAGOr6U4McSoCv4WXB6t
         HPgKnQogh5MtcytZebmwfIXwVtPdnYmhtcOgWvwWiLvwmmpVAub8hVw9MYRk419ACs7M
         l3Rhtq5E9TSFJH54HIu1t3YWg2oPLZJiGenIjjrZemdb/v5WiFv64btZXMz3Vm58vbGd
         NK1tF+Gwqu5g4ktQXkAKXKBuQZ20cw2Wtz3MMdr6sOBRB+VoZAYf+RhYIi5xNHd9iQfR
         TubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772835918; x=1773440718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BA9nb83nCkXGkJ9IKyGDJ21XOXhsf5BHbt5T5gtrqN0=;
        b=wzZ3CJJyVvl/fUU1teTNr+NDeg2N1qa13wosGLxIQ5oyfgKfmigEB3oXO46U8/37dd
         xcordx0EdqjK+wLxYfSw+eeqcE69BV+XnztRmUvhqyalZcLwZSAafMhynYHw9rPkjg29
         k9IWYG94pTmRk5UTSLs2sjuQMD+b+v9lj7nB5CKnvEE4E03hngN4ViAfkaRRfoF9hpEJ
         CpDBEerjNqJzzKlVidq9dPOCzyXfkRRJ63iAL8rOqQ+j36JwONYpYtNHCJ0W4ohgnIdw
         IqeiCNRNJddiZJ/vNGKhsqd8uGUlsKG7MhaAmFeWTMnATXpqzZPs+xFG6ttE2e/FE/V+
         tvJg==
X-Forwarded-Encrypted: i=1; AJvYcCX9fMzC8X/VGVSce5+m0patrbglhpMRNfn5A55HSA6fLUfG4KqMMKkU4ru558CAPFwmVMMxJtFZnJWbiuqEW43w@lists.infradead.org
X-Gm-Message-State: AOJu0YwCjN6gzSB36+mhle2LHvsSHfsy3nqveGFhdk16BX65ON8gvy7B
	Y20PG6RLObvIwicV3JEczO1gAI8Q04ByxAvTRdke4aO8zL5g7/w0r3uQ
X-Gm-Gg: ATEYQzxn8cA74TFvup+170T+MPciTJ1KlCX/xB9xpKy5d2nvEAMBkCh+pfOJLHZtYJR
	T95PoP9rKRHB6n+deANxRyu2/Jx4YKSaYn3xG58a1QvhxQ2JgbX9X8pQnbajdZXqk89DMh36koR
	kMcF+bBHcia4ENB1ONI1qpJ1quJB4AxLfYZqFewho/nOGWmaB/lnE1sg3Bs/nQNbAwb+fHfwndX
	ooUoLsMc5wugy4ZsiVbcRpuM7B1BmVf8ElPjlAdO8aLa9MS0ZhZTAL5JVzqAjElmqxwHKu5IlS9
	cg79Gl791dgC5lVaZW9XrIqeOvbu7tIFBt8anvnGHvYva+Xs5X/71mIRH7x8k+/2h6FPZot0o6B
	yoARjPaESR0MkncdSA1z6jXRf9f/K4WxHVjQgUMnnQmNkTbCH66Tu+58MwErt2+DXgQZGeKqzP6
	h0xM1n52xP5nJzvS69wa9lUjeHk2OqwlAD1Gb3mizBctzTRt3JxnfpOyA=
X-Received: by 2002:a17:902:e790:b0:2ae:5aed:1f4d with SMTP id d9443c01a7336-2ae8245cd73mr32902025ad.42.1772835918443;
        Fri, 06 Mar 2026 14:25:18 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e7c58asm32516605ad.25.2026.03.06.14.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 14:25:17 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2 2/2] phy: miphy28lp: kzalloc + kcalloc to single kzalloc
Date: Fri,  6 Mar 2026 14:24:57 -0800
Message-ID: <20260306222457.8400-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306222457.8400-1-rosenp@gmail.com>
References: <20260306222457.8400-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_142519_360514_DE94B85A 
X-CRM114-Status: GOOD (  11.84  )
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

Use flex array to simplify allocation.

Allows using __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/phy/st/phy-miphy28lp.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/st/phy-miphy28lp.c b/drivers/phy/st/phy-miphy28lp.c
index 43cef89af55e..c576fc5569fe 100644
--- a/drivers/phy/st/phy-miphy28lp.c
+++ b/drivers/phy/st/phy-miphy28lp.c
@@ -224,8 +224,8 @@ struct miphy28lp_dev {
 	struct device *dev;
 	struct regmap *regmap;
 	struct mutex miphy_mutex;
-	struct miphy28lp_phy **phys;
 	int nphys;
+	struct miphy28lp_phy *phys[] __counted_by(nphys);
 };

 enum miphy_sata_gen { SATA_GEN1, SATA_GEN2, SATA_GEN3 };
@@ -1168,16 +1168,14 @@ static int miphy28lp_probe(struct platform_device *pdev)
 	struct phy_provider *provider;
 	struct phy *phy;
 	int ret, port = 0;
+	size_t nphys;

-	miphy_dev = devm_kzalloc(&pdev->dev, sizeof(*miphy_dev), GFP_KERNEL);
+	nphys = of_get_child_count(np);
+	miphy_dev = devm_kzalloc(&pdev->dev, struct_size(miphy_dev, phys, nphys), GFP_KERNEL);
 	if (!miphy_dev)
 		return -ENOMEM;

-	miphy_dev->nphys = of_get_child_count(np);
-	miphy_dev->phys = devm_kcalloc(&pdev->dev, miphy_dev->nphys,
-				       sizeof(*miphy_dev->phys), GFP_KERNEL);
-	if (!miphy_dev->phys)
-		return -ENOMEM;
+	miphy_dev->nphys = nphys;

 	miphy_dev->regmap = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
 	if (IS_ERR(miphy_dev->regmap)) {
--
2.53.0


