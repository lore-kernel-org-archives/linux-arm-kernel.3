Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA05CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 21:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=; b=fz+OeJHGnhADU0+e5BkdWm3o9t
	YXSOEZrN3yajeOVGrA2hFVEZ+3k0k/Jt2htBr4CuWxpVBCqkmjxL4bYFD21fMmeQCWT16d0gYYX58
	50u9Ah4Q9rC5L6jIvQwjRSRi/1gsBSMQzFpSmiwdr5du41AQvwHBv2/NZvN7aWu3OaDDa6cb1TxtV
	oS/tSc4xV6WLC6Fg9XGRuSqzoa4STSZ0wBO/9uhvmHPeUu4DOrj3/z8X4bBQ2jcdK3XISkfQTmXBa
	EAolKdhz2RKoaUhqGaKp3WUlQDCzfL4YJhAF2KfmntzTfViu5WLyJ6r3fTJ2AL6X1/qbi6WFOinxP
	nVmDqNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECJx-00000001OCF-2BdL;
	Tue, 06 Oct 2026 21:03:33 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xECJu-00000001OBe-2n5J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 21:03:31 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c2e36c3478aso502974166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 14:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791320608; x=1791925408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=;
        b=AIMeQfo/5cQglyIDnfRQM5JxTJvhPyVuSJaL/yX2NnDclkCTd2w8tsFHyD20p996iE
         kaGzEHT/wDPLsY7PCGXxL5cAr3YX0hfVVeHVATeLYQ9RqzNRLh36b4lvMR/MVibEU1Wt
         2CZTanJrwrlsS9Q35c8pByQnNvoMG6bp2Apr2hQW322EpQJor8ZlxpFr0Tl/TgFEFMAD
         A3Q/lcsLQErE2lhhBqIoLqug2CEjVFzCjy+ZpWef84S6hqmfe3FMyuuDHHZ9Yt+SEa4E
         vTgr+kL/IBc7Gct901Pu6aWLpIngltlC3GLJeJFNrh/59BbiMC2skjLvCSyn+Q2op1Kf
         dZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320608; x=1791925408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ylT2JTUORypj+MjhE+jQDW+T/v8WU4XCGcgTDo3Q5yQ=;
        b=DLT1GWEjmTRYvJim25Dg998Ay16cOP2JBfGdJDMuWhly9LVj0HIe7H6B/yWpK6kH5H
         0aZf6ZVQND//2sTAiBx+CuEOaJtq8iC5o0UagLeoMvaXavozy/UCwDnHBzaGKg9O7Q0K
         J9l44i2iI2crG/AhqGbyOX4kGWYWy4Ta3w8pu38rnDp2ckJyE2p8wsWllsy6D/Su/rZ5
         A1EWOIxGalEtL3/0IhMK9pNBtxJ8ZBb7kpcDOzeJswX2mrzCMptBXICV8omb2jCVqdVB
         YQyHhpBOBSU2OWu3ukjalUkSyXD78tlOJnkaMA8ZuKICAQnN1bgPnffkx2MycfX9ezD+
         DYcA==
X-Forwarded-Encrypted: i=1; AKwUvBx5IXRExxtekhiLAWb3UrsbWCbefLCKUFA3e4v1S2XgRb5lrOEMD82Z26cvO7x8RB5d4mNseUNEYxdveD8RLIrr@lists.infradead.org
X-Gm-Message-State: AFuF++matlWbKVlCKNupq7X/XYrI4wTfptjDLNMYV2nRNJynyn1aYD11
	ZesGIHt7J5Zfb08xVSK73xNhaCtyIhktQLAMjDsvTtyuFW7DiyIOoIDy
X-Gm-Gg: AYBFou2bp1v7vTRIhfbL/c7Zdh1dExrljo8RiF/XI+RQDBRu44+nvVYRDvNMToCwvvV
	BC+IzIPqoKi+ZJWnxTJN7ELEZh5G3L8oURBCVewitcNneSwCTDnm1h4CBV0Iq8+eBvERubKsMbn
	qrboXeWYplVKvC5ZfoypFVwPfEz0bSxwVAOyn7PoQDUQ6wCsm+6gPDSpcLd8xvkFl3ekC3hzA0f
	SwkeDnlhFcLWbQq9rMbwYwOnZ/HIHICWFDo1vPSys+DxxTmbnea04b4FxqinRJY9mhnRSSk12ra
	eqEjFRf1Yes0+93rNW34Sdnw1HJ2o/1LdmLxzLQo5P1EF/B+wAvjYDQqbW0py+EkvR51eNBYW3F
	oJcvI0FZ+z41pX2/JoGQzDGrfS6N5q28Eg9Tq6pKwgOs8Matk68wSHKfv88o6icVvJDOr+e7l1W
	1WWiuW92G0Q+m5lX3yRLu3M5FzrKAXC1AND960KAmoTSZr1QPLUvh7FgzHs1eL/bseAxfB/JpEO
	7HoZih7EhvLShOQbwpgu/imDo53OByG
X-Received: by 2002:a17:907:8992:b0:c29:5021:f6f8 with SMTP id a640c23a62f3a-c317c0bc3a7mr23014166b.36.1791320607819;
        Tue, 06 Oct 2026 14:03:27 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c2f9938sm8483166b.50.2026.10.06.14.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 14:03:26 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Tue,  6 Oct 2026 22:03:13 +0100
Message-ID: <20261006210313.43163-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_140330_755678_24A5DF61 
X-CRM114-Status: GOOD (  15.96  )
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

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Count into a local instead.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..1c1888394cf1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 					      struct sunxi_pinctrl_desc *desc)
 {
 	struct sunxi_desc_pin *pins, *cur_pin;
-	int name_size = 0;
+	int name_size = 0, npins = 0;
 	int port_base = desc->pin_base / PINS_PER_BANK;
 	char *pin_names, *cur_name;
 	int i, j;
@@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Also work out how much memory we need to store all the pin names.
 	 */
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
-		desc->npins += pins_per_bank[i];
+		npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
 			/* 4 bytes for "PXy\0" */
 			name_size += pins_per_bank[i] * 4;
@@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 		}
 	}
 
-	if (desc->npins == 0) {
+	if (npins == 0) {
 		dev_err(dev, "no ports defined\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
+	desc->npins = npins;
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
 	if (!pins)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.52.0


