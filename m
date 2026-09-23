Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0E8C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOfeQ15b3E2+kaWVk7ZQ6pHBUpc05XcoB8FmwWmuDUo=; b=uOwZ9BYzjAVRdQXv2/HNsNJXgP
	lD4DxQO35ofRJTeqMfD4f34oyZbVmDdqWiY8aIEMxRDr5OpM2bS1XMs2mzwCCJb0KhwJ/PNmMZYy2
	wdUJNlrZ4YLzjbLapcBTXZze6WH1ye/D2X5OxDg1uSOsHY88tg0yPD+5UJXUR2sC0/0a/4zTz1K4e
	c7YiXXpkMQFDt5MiNfPTlbqWl3eXuRlTGEWr3/EeT/bWxyp+1zIuo82ZS6B9X923uOzMM8hAZmiB/
	5j8TZyuFajmFuDi2cJz/o4mDMPJ+vVdWFMOhGUvwUY5JG3W8G3Cjb0JM1WvBrSxNLW5HAz8SWwIP2
	SOzXcm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RyF-00000009GZR-1bIp;
	Wed, 23 Sep 2026 18:45:32 +0000
Received: from mail-ua2-x23.google.com ([2a00:1450:4864:39::23])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RyC-00000009GYH-1U97
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:45:29 +0000
Received: by mail-ua2-x23.google.com with SMTP id a1e0cc1a2514c-97e96e461feso454529241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 11:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790189125; x=1790793925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOfeQ15b3E2+kaWVk7ZQ6pHBUpc05XcoB8FmwWmuDUo=;
        b=JV1H2A5shp7CoQAhS0u2/d6b9fswkGadxjWleMpFWxbcJPnTsfIZNIxQIgL2H4igRH
         d028MyD2O6HoYHw1/q4YV7A4tSUVUivBTYv1MaIyA92edCYcAlu648TYS4qkbql1Ts5T
         SGIGkJTNLHRB6TQqcJDw5tThlqQYZRQYXR9KbhvH9QMC4EQE3TrwURXjxYlRc7WqCFZk
         EteSVKhj+S724Z+pDiZD27grDv0Q6lVwoNIDcbSO6OvbLLB2TbAVXFQ+AUoTVHT9glPZ
         7P7/JtJRqm7uIDgyt0CiDQ8q0dG2rLhf2aj7VQga1S/+IGxlA2jjozCHuw/CzLXRFhXN
         f78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790189125; x=1790793925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOfeQ15b3E2+kaWVk7ZQ6pHBUpc05XcoB8FmwWmuDUo=;
        b=XMkYt68zKNJyf3elTV7fJqh14BPFePd62PGzAy1mUcxL8Q49IsgDAkgOECY7u5S3/5
         CBgGlp5cKjY4PoE8Lhy2Tb4WQmnYJtlea15uS38UNAs5yG2V0lRPRTrNaiUrrWuV33Zy
         XkryLCDrF0Z6EkzurIrcRv3/h/lcnuQzyZaawss2mMVwBcLiJ64bQfAJLAWA16vKY0/h
         bom0F9/rpHpUrVETYglpfazFipKXgRJcozXu5ePC0nfEh2tl3cCuYAeyQv2pASNuZRHb
         VV7xjys6yWnZ78vJ1gNE8XbliViP34wkJ3t+/GUiMeW/gOm/7Vq7dHkSZwOfXjzkSBVf
         l0hg==
X-Forwarded-Encrypted: i=1; AKwUvByuhEI+KBYc+lvaKbdTm5W1+wfmwNOt892Cwzhor4Xb5pwDfsWRpnEQ+cJU80w4sZ9onDxTBCLklMt6Hoh+1giG@lists.infradead.org
X-Gm-Message-State: AFuF++nrcMIlWjbKSqPt12CBBad0Mf48W9nloTc+VCPdkJ1nqivRVQSG
	W1hyNdv63iEnJVKzUa1NoQiOy1SrrrNyvwgp3BJPqu3hvXtFxJHwrVJn
X-Gm-Gg: AYBFou2A+gGffTrR+fQRsQg67adgYNbZwAGJieH4F1RTtjseoyY6/OVDmXWkEQpyLvs
	rla/ApXznjAB/QUO07ZRWEoAdEG9Bdk+ROGDkWLtUU4zUIrROt5vjUsX0rKYk3c4DqiNoTRCkHx
	rpV8uIhsUuR2fqo+tNXAhz9nEM2oPo9h5RXpXlpyNviCV0f4L1XHFyppkBCwjldHETupyEXzxsN
	uCz+y4FH55D7F+DDV0PdAzQ1ZXkebB9BkecpCzvSlEwEk5RBnNKJHGjpG4/ke4C/G5at3j2MtT/
	HahXh25V/yOs11McXZY5OQhvEG67zERaxctMlIvuQmt9EhPueIySyjZzv+2eWp1SEbXtNqxTH2c
	dDL7GHiAEbJnIdlSmFMxDhtaPzeACB3yII5RD7lyetDLPLgxUvx6ILxqD2uQOSihS9QcEzayQ85
	dV4J5jHYHx1nJrReKWghSkkKaeWUF8f+E4NN56414q+luLv8S+LAEqwrpC/TfemsncMyqSCsrRu
	4q69Qlp1yfTo5kmFETc0aaP0CLikH/xgD9AEyl94yU47iZ+tdZwgzUZLa13qHsinrl4n1obQVEI
	AYg4Tcilzday5b215UxolYqnBpYQMqRtpqvh5sP8CmhF01BoHDYGdryX
X-Received: by 2002:a05:6102:41a9:b0:7a8:3fba:361a with SMTP id ada2fe7eead31-7af1f3f6a52mr75793137.37.1790189125139;
        Wed, 23 Sep 2026 11:45:25 -0700 (PDT)
Received: from ututo.. ([2803:9810:87dd:de10:d33a:69d6:aa79:a5ec])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0582b6bsm4303825e0c.18.2026.09.23.11.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:45:24 -0700 (PDT)
From: Lucas Costa <2000.costalucas@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lucas Costa <2000.costalucas@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] spi: bcm2835: fix device_node reference leak in bcm2835_spi_setup()
Date: Wed, 23 Sep 2026 15:44:50 -0300
Message-ID: <20260923184450.135601-1-2000.costalucas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_114528_405299_5B6F224C 
X-CRM114-Status: GOOD (  14.29  )
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

of_find_compatible_node() returns a device_node with its reference count
incremented, but the function bcm2835_spi_setup() uses the ret value
in the loop to check a condition and never releases it.

Store the returned node and drop it with of_node_put() before breaking
out of the loop.

Fixes: e19c1272c80a ("spi: bcm2835: Restore native CS probing when pinctrl-bcm2835 is absent")
Cc: stable@vger.kernel.org
Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
---
 drivers/spi/spi-bcm2835.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index 8f8715809c7c..8909757c94e3 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1226,6 +1226,7 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
+	struct device_node *np;
 	static const char * const pinctrl_compats[] = {
 		"brcm,bcm2835-gpio",
 		"brcm,bcm2711-gpio",
@@ -1297,8 +1298,11 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(pinctrl_compats); i++) {
-		if (of_find_compatible_node(NULL, NULL, pinctrl_compats[i]))
+		np = of_find_compatible_node(NULL, NULL, pinctrl_compats[i]);
+		if (np) {
+			of_node_put(np);
 			break;
+		}
 	}
 
 	if (i == ARRAY_SIZE(pinctrl_compats))
-- 
2.43.0


