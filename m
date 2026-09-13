Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F160C88E65
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdQEo7CCMpGixzfwvENOdVkMVrSMvvagZo4VCY8/koc=; b=dA0yIbDlurhjNbS1TnzJ9BsGG3
	1NB2GCUCymUBaWQQrnKdhWBlkVfwlk9oODuKEswsbxaolQQ3ooqlzBe0xmw6bV1no0NeLgsSOYKZr
	Z8/6pBVL2Pq9wSmrIPv7Cja2iyJCPtxJIgdVM+DQsGFt0Cc/DLUaeHQMsmMYJq9zTtj7Xg/cXWrwW
	tcMN+/dul7tyMDSOD7yak80eAnNysjBNxKhdWFhXTrCZU2hnwAPK8vIkpNYJVA8mPPGi2PGbb4RFe
	QhxZ7t1G7vTHAyHmWpWlTqOFt9jlYznxmleK+yyp8x11e3kEdcQyYo1RHDB/uen2ZwnpMdDerne75
	F9yHGdTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ldL-00000001jvc-3U6K;
	Sun, 13 Sep 2026 14:56:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5ldG-00000001jtm-0phk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:56:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2caced6038eso23563645ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311397; x=1789916197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CdQEo7CCMpGixzfwvENOdVkMVrSMvvagZo4VCY8/koc=;
        b=mOBr/qXL7cTZ2h41Bcfr6XMey2TmQyK0iL4B4crVCjBW1FmZsX80oEMG7TlZCmciDe
         8R2mj9Kb9XrIa7V7kDftVZbuaA/JXw9FHnAIj1cAV9dzov18a0YARQrf1hPqFCperM1s
         rtE21DanLbn3QOD3optG//nVEcISuIFjTUs6f+pylcKUmiH38hRmBdZ8gsFumdDKl8HZ
         /6w2g8re+MGxOIMhWr00wKXNSSAadcCrXT34qmWqmsbOlAsYonreQAFc9SL8FWWMlZye
         PAvH4d2bTxXR282mhWvt6X/CyJwYHhvGSsaMRtBXnuIufGXwxnBesyGcToC1bwodqbVy
         oy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311397; x=1789916197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CdQEo7CCMpGixzfwvENOdVkMVrSMvvagZo4VCY8/koc=;
        b=kdehVy2+TMXr3vtYBr5WDVL/oGEauXforehzHLLTMHIRCktE80zYBH3Yl4CI2ql84x
         Wjn73ypNtgPLTtNNyTtW3+Q1H3osMJMizc8sn4Afu1oRt4CpRaeabJny2g5mAevwJyVq
         dwtEW8siW7/JVEBj/Bw/0pVf0KCr/Ncgy9S/JWN293CQry2n1KvXs/9zrwPlzSYW/NwY
         kC5vm144djF0zql54ILzACR0aCHA8LGr/1P2LgInfj2sliqFL7sRtFUZ4UV7iiploVmQ
         +oQRE23xT52bpdUygUD7Asf9RuPRdkpI9qCVZplqs/lhhYUhkFhW+FiIQ1YAUCMjGF7c
         TKxw==
X-Forwarded-Encrypted: i=1; AKwUvBxvG8+NENdZSZG80+1FJrH7TIAWvaK46c8woYv0W/7cjiZKsoMFzhW/HEVbuZs3Mc9LJ3f8OTHGS4SMRAM1iX1F@lists.infradead.org
X-Gm-Message-State: AFuF++nxQTIoqlGHQ3psmARdZqhxKAko2CHCXhDnhfrjsYLvE+YHvHj2
	J1OeAKvKCe+ZUUJCXS8oPLi0TvsDxoWhqPyNmrUVXVPfSp7vbwg5R25v
X-Gm-Gg: AYBFou29Opz9gYsnpEYoFE42NXmRqV9en8Bde293/8h4zK1zbhl+hXUnUkyicDo9k1g
	r566hMXTL/nFPJO5m6mAJxti44GZ6NuU8CDONURseZTAbByAyngS+fpUA2hEyUTGdxuZhLPibfO
	1va41mAphe4nlNQCwol/qeymJ/aEaU93ZPpTM8DIA7gSfCMS/82s8RNsVXsnE3SL2leHFKnMbiE
	NyqQHxXnSgEzdZPDXGAuKf8BLxsKajDALczIfrohGI5SzgDp6ykiYoBgo0z1sqTFSyAF6bb0vj+
	HcpQArhDmE0WSdeYyRyPR3INpTLzN5j6FuRUq4uWnHJocyCyVHc0C/+HhPDy1hy+05RjNCQRU30
	hH57VEkcTk6UVARVAyXAsxqVolU05aSZcvewGOEHI1a5wut8LbOc8uKJE5mF0+bCjtQPYQdYsMQ
	Ht3+3rTWatO7+1TmFStAHORr65DV1WVEgWbmo/YmAvBf+RaNlSDz7RJKKI2vWnqTnQ
X-Received: by 2002:a17:902:c409:b0:2d9:2ff6:246e with SMTP id d9443c01a7336-2dd5f1d74d6mr32381155ad.23.1789311397076;
        Sun, 13 Sep 2026 07:56:37 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba7a9bb56sm21467366eec.31.2026.09.13.07.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:56:36 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH v6 3/5] thermal/drivers/sun8i: get calibration data from two nvmem cells
Date: Sun, 13 Sep 2026 22:55:25 +0800
Message-ID: <20260913145527.18148-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145527.18148-1-iuncuim@gmail.com>
References: <20260913145527.18148-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075638_273903_CFF15FFB 
X-CRM114-Status: GOOD (  21.94  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The A523 processor has calibration data in two nvmem cells. To be able to
add support, the ability to add data from two cells into one array must be
added.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 81 +++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 28 deletions(-)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 1412bce63..360654880 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -300,43 +300,68 @@ static int sun50i_h6_ths_calibrate(struct ths_device *tmdev,
 
 static int sun8i_ths_calibrate(struct ths_device *tmdev)
 {
-	struct nvmem_cell *calcell;
+	struct nvmem_cell *calcell = NULL;
 	struct device *dev = tmdev->dev;
-	u16 *caldata;
-	size_t callen;
+	struct device_node *np = dev_of_node(dev);
+	struct property *prop;
+	const char *cellname;
+	u8 *caldata = NULL;
+	size_t callen = 0;
 	int ret = 0;
 
-	calcell = nvmem_cell_get(dev, "calibration");
-	if (IS_ERR(calcell)) {
-		if (PTR_ERR(calcell) == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-		/*
-		 * Even if the external calibration data stored in sid is
-		 * not accessible, the THS hardware can still work, although
-		 * the data won't be so accurate.
-		 *
-		 * The default value of calibration register is 0x800 for
-		 * every sensor, and the calibration value is usually 0x7xx
-		 * or 0x8xx, so they won't be away from the default value
-		 * for a lot.
-		 *
-		 * So here we do not return error if the calibration data is
-		 * not available, except the probe needs deferring.
-		 */
-		goto out;
+	of_property_for_each_string(np, "nvmem-cell-names", prop, cellname) {
+		size_t len;
+		u8 *caldatapart;
+
+		calcell = of_nvmem_cell_get(np, cellname);
+		if (IS_ERR(calcell)) {
+			if (PTR_ERR(calcell) == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			/*
+			 * Even if the external calibration data stored in sid is
+			 * not accessible, the THS hardware can still work, although
+			 * the data won't be so accurate.
+			 *
+			 * The default value of calibration register is 0x800 for
+			 * every sensor, and the calibration value is usually 0x7xx
+			 * or 0x8xx, so they won't be away from the default value
+			 * for a lot.
+			 *
+			 * So here we do not return error if the calibration data is
+			 * not available, except the probe needs deferring.
+			 */
+			goto out;
+		}
+
+		caldatapart = nvmem_cell_read(calcell, &len);
+		nvmem_cell_put(calcell);
+		calcell = NULL;
+		if (IS_ERR(caldatapart)) {
+			ret = PTR_ERR(caldatapart);
+			goto out;
+		}
+
+		caldata = devm_krealloc(dev, caldata, callen + len, GFP_KERNEL);
+		if (!caldata) {
+			kfree(caldatapart);
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		memcpy(caldata + callen, caldatapart, len);
+		callen += len;
+		kfree(caldatapart);
 	}
 
-	caldata = nvmem_cell_read(calcell, &callen);
-	if (IS_ERR(caldata)) {
-		ret = PTR_ERR(caldata);
+	if (!caldata)
 		goto out;
-	}
 
-	tmdev->chip->calibrate(tmdev, caldata, callen);
+	tmdev->chip->calibrate(tmdev, (u16 *)caldata, callen);
 
-	kfree(caldata);
+	devm_kfree(dev, caldata);
+	caldata = NULL;
 out:
-	if (!IS_ERR(calcell))
+	if (!IS_ERR_OR_NULL(calcell))
 		nvmem_cell_put(calcell);
 	return ret;
 }
-- 
2.55.0


