Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC86DC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=; b=jWHx0LMXfxzpRyw7bmR8xoqS7v
	2DXWWn33Mo6AakEceJgVTTN5XsX2vwqRzOYksTEGq3LHdQRPgZ/mh4fq0M9O4Cx8f7aYv2+pk0r14
	wdFc4aAiGhPStBetzFhhI1LHn9cpkF4x2bUz7cNohBx2CMCtFnUKJVkk7raF9wNbGTcSLenIv8Vql
	Kgb0y6EuWDQlNemzKQwn8cehNLYHPxV/3FM9zyZ4A8r+okrkIJQtShyI38Q7iuiUm7KWJ+DrTn5hJ
	LFaCJLUrJZc6Q695zmqVhIGB9ZpadXOz2A6UGxvhyLUHBlVtFPsDvV6G7FsoaDP+2hwZndQu53MYa
	/gn8kLvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZah-00000003uzH-0phs;
	Tue, 29 Sep 2026 15:17:59 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZab-00000003uw9-2p1a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:17:54 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso45928465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695072; x=1791299872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=HOJK+aVIxbl4sOCL8vklI2q6V5oPO3m9ByXczCwoZJxrCDcBHsBSLUokgiQ00FF70D
         5MrhLcFbZKBCljhUa/gaLQDyK0dbe7CqPZ7aRX65qcPpqsydEJvF2uHIjnLr0idSiOpj
         /xO88LH3Zt39InWr2YM2FDWtlSyoTbevkkUauO9eQGLHjJghgn7vwKcqUxKrqM00Tx9D
         RGOa4GvXWTf3UneSK6PbyPX14jPwADNur5TzFoGna68DhTXjcItA42OtMJnpPRU/6PGD
         G9Tq0iEqikOZQOY1LB6hzDAzMrnybzqNyTul4SBBe42CkmlTHdRm6bXy75vpa5OOSBMw
         XzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695072; x=1791299872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=AtHB+angD6DBR0a8dVsCyNQJSaTFuwcUaWN4CSx/ZHTOaPUT8qfZL4RzUNyE/sq8XU
         dpt6JAowfzLGOhbzNCVMAtGQP/qbYcNKbygL8mnp4BJaVnEaQh4mrlAkV4Kx2ENpp2LH
         2wPH/GeJ4w8cx/4ZpuqPVIZYb+oWxQNrSYs9Pf8kCwQ456FjplIx8yHM50/EfCnKfoUO
         IkMMEvJ3N5RbRcf2L9aH1ZOCytyUMNNd8XmSZIN1r/jiA6IA4aWlkTpYjaVPkMAzJX/9
         HL5F4joyCqoHFrOoSnT4DDTg4MV7wzDOPuFwP55YGxV7FCCW5K8a8eT59Ghr0M8QAf2N
         cORw==
X-Forwarded-Encrypted: i=1; AKwUvByrmEdMZmJ8kENwXJnbT3rLIx3+PZaMztiheKjFSZo521JqdSwml2gppWG+DlnIcAP0ZxTFxKPIUIkM7cDIQMPr@lists.infradead.org
X-Gm-Message-State: AFuF++nnVJKGKmgd10QzNCFx3IMb9pz2YkeBrntkQwOwscgPW9OzCYTB
	9RpP8NyrVSSk+IAv76BccjAuQLNDcchR8pEhY1d7i1DRaZWIml58m7aF
X-Gm-Gg: AYBFou0vr06d82KYrlEr/hXvUGPVd+X8bUXHU7zsrmmvbOjG/X/p4S9t6KvxLCvmotQ
	zTKyoWOSGzKgksL3yeTK/sbg2v0t+nr1X4R/9oLjlFjbeBEbRjZ1mub1XhFcfBrJWTypFKo1jvo
	ct6ZiiLXtyZWTAYJsRtO5oGDtduYvAbQBe2wwI4N7qKH/xivBuamxdgObRepGsNoioVpFAic1HF
	FzWVFi1iOAd4xn86QZZN8KMBMEaXRAhd407dJTLcLxuormQ3j5l8ABpzmCSy67oX7BLMJIkyiI0
	ARV22Ft8KvFpJiyjF5m6YP236wwCNbp/3ToHvRAb4e34PVRUY8U2uq+R9dTZGq4sWDpc/LNHnDg
	I0PfKCSsbeCb4BqQKZGh9oAJoFjQmOo7uNUEb1AWLoCY8uSyZA9Dv+4Nn/IDNjPyB7y3q3hTywh
	efTSNiRvAheyspAuTIcRZkhDWUEC0z+0RN4Yo2gq7EJK4YmHeAPVirnifcQ6ECx0V4rnHhaGg0l
	Vh4IAx6H18RPVwOX7crdsxnTrIUliUJ5i+T8EkGT3Oqid77++pNlC0ZBNOjEsY8aEZ50BpgjVea
	g0EsepLrttq8KwBZ1GmzGoY=
X-Received: by 2002:a05:600c:19c9:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49fe7ae84a9mr291312065e9.0.1790695071599;
        Tue, 29 Sep 2026 08:17:51 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 04/13] net: phy: micrel: Check RMII clock select property presence
Date: Tue, 29 Sep 2026 17:17:31 +0200
Message-ID: <249f29ecae7cf9dbbeb9691df2c67e4f0cfe326f.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081753_729697_5554B07F 
X-CRM114-Status: GOOD (  14.03  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - New patch: use of_property_present() for the RMII clock select
   property so its numeric form does not warn during PHY probe.

 drivers/net/phy/micrel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index ae830781824b..acb481a29c25 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2791,7 +2791,7 @@ static int kszphy_probe(struct phy_device *phydev)
 
 		if (type)
 			priv->rmii_ref_clk_sel = type->has_rmii_ref_clk_sel;
-		rmii_ref_clk_sel_25_mhz = of_property_read_bool(np,
+		rmii_ref_clk_sel_25_mhz = of_property_present(np,
 				"micrel,rmii-reference-clock-select-25-mhz");
 
 		if (rate > 24500000 && rate < 25500000) {
-- 
2.47.3

