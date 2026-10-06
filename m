Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272D6CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=; b=XhQSvC3+G6/LcKswslSSPXeHt9
	kOdkqMWGRBz/rfhjZzkGC/KtFvf889TZiJO+Uc5l16fqRNIB7zwgFfQnLK8AwX1HgWo3DoGYp7aZv
	df5D8Ft38Av7viajCLvqUw0EUaCx9uMzNrI837m2vCdsh3wlMVascgI2/rvCPyB3++g4xVVrIW7YP
	mnBzeZEnCGf7eO9LvjmN5/7pTArwML38ag0n1VCa2paYOozq7nR1kYf3mLSiDepFHpGq+geInl5iZ
	AcH8H/YNGDKVtTGz3IR6VcfXXFs2DFRYULIzgL8xclnRZuywaDv0U8KHl4or3Q5FGwkoHC5I3AlJh
	ooR61HOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7de-000000016Kq-0kuI;
	Tue, 06 Oct 2026 16:03:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7dC-0000000168U-3AQS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 Oct 2026 16:03:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=; b=X0vE35aO4R4DZj7+PrIIT/gn2b
	+Z5qo776L/66FmRlgHDQ7Lmeaj50gez2YyCYNII0hdshyWKoxEZ7VYtLRBNZUhnNvJhQdqgJ0gY5b
	gi91E01izBEAY+yX0koF+C6jMcIKLtkgGfrqhYK4bRQNEDACmZgj8Q6e85GLJpYD8XUv2wlKm4Qqz
	blfMy+kU4gY0W/QcnHnr/P8s7aw98oDJzM69/4USLz/8Cccf1RdJ98PJB/uq4W9CxEzcEaR4c/thV
	zK8BnIbrcNAR1zcUCUDg2O/KnbNzKZ6uTnyMR3xZqUnOAq+ntyTYvc6wvdhE7pZqYHFBEi5mzuFxG
	U9gWw5Sg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xE7d8-00000008qWc-2cmc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 16:03:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48b0584ad71so714557f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 09:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1791302580; x=1791907380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=;
        b=C6EhHkeXj/2gctVtXT1smQL8beqVz3Jwtc/dRo2PR6Y0aMp9AeBBprTOxf/Dpg4tcH
         BQkgp4A39vcfVzeKJbf0ayjWmGw520VCGlJtLD8NbJy6+qg2TY0HT/xmEUCfVf4IKoI3
         6124ypOWRDpnpFf1PdaBql9kJvrD586At2NPtAKpex5q+NtR1mBRPzn+w2aZhZveq2O0
         7sj58k4VeylxFIrJTEkobAsbkuj2HxmLPSb623AsGLw5nFlT3JfH0yDcxi1YkbqnVS+k
         Yrz80GO4Gwhwqp6dYuGPgU1SzktEGJ9lKgHVS2LDkmhC40fVr5LOhwVHahi+EhiPB1Fz
         rsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791302580; x=1791907380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFmPMHLkzQ2v2gUtJGa7P11ujTnCxcTV6HWX7PibVsQ=;
        b=LHpRqOii1W2haqsX/coYtsBXFLOz5lET02JPFZgU2ASVHXzyet9LThZKYYUiD59rw4
         vCSwWbrZvnHXlrup6XeKVI5j6GOdxEibh5ZU1+jMq1gO2zzWRz7sprNEn9Q9yIZD5qcB
         bkPz+mEpe9+B5DwJRefhZSEXyp+YmDdTU6GXV5I6EAl+4xgNANYSRHS4DK7MrgZqbR2t
         ZvlzPJDd91S+MjigKRSuWwKPVky4K6/MzcA1q52MYoVy+ATuid5E4BhEsvNamNinV9c9
         /8krQK49Yz+FYaQFYfNm+NgaQaIectB5zrmMtlsylHHMLafcAIkTKVqdlMhRK2Ym7iQQ
         21Zg==
X-Forwarded-Encrypted: i=1; AKwUvByYf+CmASPROGrdBU6bJ8yoVTHEcuvsv7JduaHCht0DdQ/Ju8H/Pnw5E1ZJJzh+NwVnp72jI6ZRsOtvb1ewpndv@lists.infradead.org
X-Gm-Message-State: AFq9FYL18tjbdgoCPmNfrDN4VOS2jvEordGyhQqNefy6GOjnmgSFU6R/
	UL80Wn+RhjoxksYcW84fNbCMe8CNYPPdxQkXI03cedjcBIqpvWLg2Bcaah4SPaJOeVk=
X-Gm-Gg: AYBFou1WqvJJmKYsrEfa6UsCgCXnkXnWkmq2ybkfqTVXiDKHU6rWVAymD5Wm7Sva4ze
	6o3Nb0JfKyJDdojQYtktgl4ONQt1RLBFSN6pZdBfcgGT5LYo/+JEtl3tP9J4jmN5gHX0XW0f8Bh
	YxDWbS/Ho10qM9ULOSZB6RSGrPvVGQKdYgJ2t190lp+rt2rUYl6q7A+xw4AfSAYH3hHHu06MQpI
	k7lvCG0HYS4TALq5Rvk7vbfumwIXZt4vTgWZNIHW5iW7S6K8yTwwUyET8kwp8lp6uQy5HoNYaqV
	e+zazesT1PJA8WT7ucpJcyCVwey53vfxf+NXPL9xIbyo88HdeAI6QOm7JC/+t/l8pQ0b7teL+WC
	CtUzYD/3MzALf142isEsyMTp9xIBwILaFZy7ocJZgranru61ImwYBwi3/H13d625tCCgFJoLrvO
	DKhnXqhgQ1yJ5MW45Nmjz2hvCBw/Id0lTEx0e3tDMKpvKc1RBRgU3PxpgR7gSl03nBLhQWjK5fo
	kz18+jb8/S6M82Lfw==
X-Received: by 2002:a05:6000:1868:b0:48b:1b1:af12 with SMTP id ffacd0b85a97d-48c6d1b289cmr3246959f8f.56.1791302580197;
        Tue, 06 Oct 2026 09:03:00 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.85.242.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d2014asm369641f8f.38.2026.10.06.09.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 09:02:59 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 06 Oct 2026 20:02:41 +0400
Subject: [PATCH v3 3/5] power: reset: syscon-reboot-mode: enable supplies
 for the next stage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-b4-rk3576-reboot-mode-v3-3-6edba064693b@flipper.net>
References: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
In-Reply-To: <20261006-b4-rk3576-reboot-mode-v3-0-6edba064693b@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Alexey Charkov <alchark@flipper.net>, 
 Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4150; i=alchark@flipper.net;
 h=from:subject:message-id; bh=0e6tYFYX4RQShFvq6ANsw1VBCkVay04TpNqpD+jAhLg=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQdlV6dmFi/P2DCg2L+uH3PrBfJ8925eMmo71bowYTPB
 +w1bVeu6pjIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqH/5nZFiU9lPx6e+jf3wi1h681HXUY2HK4e8zbOJfqMVeMLj0rDaQkeFWWZR
 QnENJ8uWYz7/q9nPtv7y+ZfbpojXXJ/Qf/TBPyI8FAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_170302_834404_DEEFCF68 
X-CRM114-Status: GOOD (  25.11  )
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

Requesting a boot mode on some SoCs such as the Rockchip RK3576 hands the
request to the boot ROM in a register that a full reset would clear, so
any reset that carries it has to leave the PMIC untouched. This means that
the regulators stay in whichever power state the running OS left them,
which may be unsuitable for the early boot code. E.g. on RK3576 the DDR
initialization blob runs on the way back and accesses registers which
Linux normally leaves powered down, resulting in an unrecoverable abort.

Get every supply named in the reboot mode node and enable it when a mode
is written, which is when a mode is being requested. The supplies are
deliberately left enabled afterwards: the system is on its way down, and
what runs next cannot turn them on.

Tested-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>

------

Current implementation of of_regulator_bulk_get_all() never writes the
supply names, instead leaving them uninitialized, while the regulator
core uses the field in error paths to provide meaningful error messages
to the user. This has been highlighted by Sashiko on v1, and is addressed
separately in [1]

[1] https://lore.kernel.org/all/20260929-regulator-get-all-v1-1-e887c66a47f1@flipper.net/
---
 drivers/power/reset/syscon-reboot-mode.c | 41 ++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
index e0772c9f70f7..5ef882d81816 100644
--- a/drivers/power/reset/syscon-reboot-mode.c
+++ b/drivers/power/reset/syscon-reboot-mode.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reboot-mode.h>
 
@@ -18,6 +20,8 @@ struct syscon_reboot_mode {
 	struct reboot_mode_driver reboot;
 	u32 offset;
 	u32 mask;
+	struct regulator_bulk_data *supplies;
+	int num_supplies;
 };
 
 static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
@@ -28,6 +32,20 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 
 	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
 
+	/*
+	 * Whatever acts on the mode (e.g. boot ROM) runs before the operating
+	 * system, and may need supplies that the running system had powered
+	 * down. Enable them here, and deliberately leave them enabled: the
+	 * system is on its way down, and what runs next may not know how to
+	 * turn them on.
+	 */
+	if (syscon_rbm->num_supplies) {
+		ret = regulator_bulk_enable(syscon_rbm->num_supplies,
+					    syscon_rbm->supplies);
+		if (ret < 0)
+			dev_err(reboot->dev, "enabling reboot mode supplies failed\n");
+	}
+
 	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
 				 syscon_rbm->mask, magic);
 	if (ret < 0)
@@ -36,6 +54,14 @@ static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static void syscon_reboot_mode_put_supplies(void *data)
+{
+	struct syscon_reboot_mode *syscon_rbm = data;
+
+	regulator_bulk_free(syscon_rbm->num_supplies, syscon_rbm->supplies);
+	kfree(syscon_rbm->supplies);
+}
+
 static int syscon_reboot_mode_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -59,6 +85,21 @@ static int syscon_reboot_mode_probe(struct platform_device *pdev)
 
 	of_property_read_u32(pdev->dev.of_node, "mask", &syscon_rbm->mask);
 
+	ret = of_regulator_bulk_get_all(&pdev->dev, pdev->dev.of_node,
+					&syscon_rbm->supplies);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret,
+				     "can't get reboot mode supplies\n");
+
+	syscon_rbm->num_supplies = ret;
+	if (syscon_rbm->num_supplies) {
+		ret = devm_add_action_or_reset(&pdev->dev,
+					       syscon_reboot_mode_put_supplies,
+					       syscon_rbm);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_reboot_mode_register(&pdev->dev, &syscon_rbm->reboot);
 	if (ret)
 		dev_err(&pdev->dev, "can't register reboot mode\n");

-- 
2.55.0


