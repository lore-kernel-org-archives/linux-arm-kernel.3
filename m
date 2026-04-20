Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C95F5A8C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 23:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BFbqe6zs9zdE69IPJo3pEdqtjhoEkNZOLj14gX1oP8=; b=0ferN+vX+ABD0js0nOm/m1KnbO
	z9G5eOaC3pn1PdBaCDAjxeNOfnWucKSUf3B+nUbAQ+6x2l4rqfpGq/jQJGL0bz0D1+VZ841p7CEdz
	39y87rB702DmLaMSr1k9rWSPSPv0lhhaMOS16+MsyA+xqQtbBtEtPTSlvKCokRSoiJpLzGAdXzlW3
	V2mfJ6XT72a5erytl0wPq/x9HGSPrBqA0pFuA4Cuvl5xHN/voT92AdOB70Z8Rn5KApGPVST6+skZM
	dz5xOjvmlcwr3IxmxJnqwWKx1YOohTn0N65k8a7HkV0pGLy9LhTQbdWcTnZVpQEw+WOjYj78jjrBs
	cbnXdffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wExlL-00000007nxu-0SFO;
	Mon, 20 Apr 2026 23:10:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wExlI-00000007nwz-2Y0x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 23:10:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so46515015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 16:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776726638; x=1777331438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BFbqe6zs9zdE69IPJo3pEdqtjhoEkNZOLj14gX1oP8=;
        b=UfVE2tFXMgVL5YcUGoXmdi+HBQojMVw3LSv9tEOp+yhGeybntzTNH0R4HotAacm2/Z
         Q2JmIEi4x5RdYjqdUHIg3ToMXMPwWaUZIN/l08e9yVAg6qVa5fHX3RsnJKX21WjZ1JKq
         YdorC6qkOF0AyJTkA6ZY3JdsN5dTDZzAU2g+/Iln+qgk7laf7TERB7H0wrV7iRAzmB++
         34WNqRkWqgDmUcAgyHFGkErm2QATe4BkBg/tiq6Af5fPyvm3U9gAZbg5T8k5dERC1Nk/
         6KYQK+HGUfZpqs/QFNmdqMyrZINCc3yipp8Pr2lmheY57dpv0aPoKQS+elo+xHlCit9m
         dDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776726638; x=1777331438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BFbqe6zs9zdE69IPJo3pEdqtjhoEkNZOLj14gX1oP8=;
        b=DMCZJSo2GiYjhv4ZBk7cndQzBz/HWqRyOWKpIfO9/Zq6dUA0gHVlpobPilt5vfepW1
         u3XU4Ek5EWsvXNGd1lGq6K607zD/1R57JwtPsYj4wedoe5L3Ws/b4cobTfpVTCgNopH0
         6JA6FhdWido7yTLpcrOvIjWVJVJIkTrp1dxd880qRUC+qXTbBhlYf7JBaIyePVaz4Hg6
         v6SYudL5RYGr22wICaHkNxl9c2TKamiPYTQBhT8BhKtDbC+Fo6uWDIrFKsS3ADQTh/M/
         mhh0KHVVJIS3qr4qTfXIId4RzMfn+xABsS3FJ0HeMyDiyaV7GAs5nszcoRila6rKwjTe
         RrDQ==
X-Forwarded-Encrypted: i=1; AFNElJ97uq1oLNl3BZ/iJauj0R0UpqKU/vPBwMODYHd/Jd302byOSwm66itCR0k5gor1nSHgSGauQJkaOJBwLcNX5/vx@lists.infradead.org
X-Gm-Message-State: AOJu0YzB7hc0hlloYq0Gkn7CQxhVpxrQPIxP7BuV2NAKl+amEUGyaJoK
	1l3vIGp6K+qGNWt/KP5jltnxqAnSfOtT7eKatNb9D5qtuHuoiSzgDa8a
X-Gm-Gg: AeBDievuCHPFW1RoP9IBsCOWAn7MWqLp104D9oA7tXyM9eD8v9w5HdcHGUXSCam+Yei
	k8MgwMY2Ve3Uct1icytCvg20Cazvnw/LfQi/o5PHqEPMdjX3p1dhKCydMYm37d0SRMb5oLohZKd
	uQCvLVwvTESXI7NragOA+zJnh9srRzwKyKpiwzufZIvcMR2j+932JHe9sitJnDWQDSZ5rnnyGUn
	g5FtG5bGx9xsMTsMAfm57/WpvIhzX16rTe6FVMwgIMAtdNTMHpDN/4bHRnzSc7LCOmc3IWLJdS1
	pwdk+YUYRMBKuAG9t3evgwHw2K8ZeLfBznKdwSezsBVFavmp5NbNNGbHyp3BnagvmUQ4HpzYY2y
	faR50CeFgBE2TOwUh896QJLjqypzeHRPPtFbMecTyOO+J4ZDG7BSfoQV8FvcLN9M60qNOCTow8C
	zwh88uRpQlZ2f8k0tQuIwoWRE/VWfPJEQ3vPJhulDEpOSuCoTsImE1m7gTI8u9WU3dwLV68PV9h
	dj50VkzpD/3ru+hCeqPSw==
X-Received: by 2002:a05:6000:1acc:b0:43e:a70d:7622 with SMTP id ffacd0b85a97d-43fe3e0c612mr24008948f8f.22.1776726637610;
        Mon, 20 Apr 2026 16:10:37 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a174sm36837571f8f.18.2026.04.20.16.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 16:10:37 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Carlier <devnexen@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: apple: atc: Fix typec switch/mux leak and UAF on unbind
Date: Tue, 21 Apr 2026 00:10:13 +0100
Message-ID: <20260420231014.35462-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_161040_672431_4DB0533A 
X-CRM114-Status: GOOD (  13.23  )
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

atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
returned by typec_switch_register() and typec_mux_register(). The
platform driver has no .remove callback, so the registered switch
and mux devices outlive the apple_atcphy struct, which is released
by devm cleanup on driver unbind.

A subsequent typec event (cable orientation change, alt-mode
transition) then invokes the registered atcphy_sw_set() or
atcphy_mux_set() callback, which retrieves the freed apple_atcphy
and dereferences it. Unbind followed by a cable replug or alt-mode
change is enough to trigger the use-after-free.

Save the registered switch and mux and unregister them through
devm_add_action_or_reset() so the framework references disappear in
step with the driver's devm-allocated state. Drop the unused struct
apple_atcphy::sw and ::mux fields, which were declared with the
wrong consumer-side types and never assigned.

Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/phy/apple/atc.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index e9d106f135c5..4156fabad742 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -628,9 +628,6 @@ struct apple_atcphy {
 
 	struct reset_controller_dev rcdev;
 
-	struct typec_switch *sw;
-	struct typec_mux *mux;
-
 	struct mutex lock;
 };
 
@@ -2066,15 +2063,25 @@ static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orientation ori
 	return 0;
 }
 
+static void atcphy_typec_switch_unregister(void *data)
+{
+	typec_switch_unregister(data);
+}
+
 static int atcphy_probe_switch(struct apple_atcphy *atcphy)
 {
+	struct typec_switch_dev *sw;
 	struct typec_switch_desc sw_desc = {
 		.drvdata = atcphy,
 		.fwnode = atcphy->dev->fwnode,
 		.set = atcphy_sw_set,
 	};
 
-	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
+	sw = typec_switch_register(atcphy->dev, &sw_desc);
+	if (IS_ERR(sw))
+		return PTR_ERR(sw);
+
+	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_switch_unregister, sw);
 }
 
 static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
@@ -2146,15 +2153,25 @@ static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *sta
 	return atcphy_configure(atcphy, target_mode);
 }
 
+static void atcphy_typec_mux_unregister(void *data)
+{
+	typec_mux_unregister(data);
+}
+
 static int atcphy_probe_mux(struct apple_atcphy *atcphy)
 {
+	struct typec_mux_dev *mux;
 	struct typec_mux_desc mux_desc = {
 		.drvdata = atcphy,
 		.fwnode = atcphy->dev->fwnode,
 		.set = atcphy_mux_set,
 	};
 
-	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
+	mux = typec_mux_register(atcphy->dev, &mux_desc);
+	if (IS_ERR(mux))
+		return PTR_ERR(mux);
+
+	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_mux_unregister, mux);
 }
 
 static int atcphy_load_tunables(struct apple_atcphy *atcphy)
-- 
2.53.0


