Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4495C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LDnTUkrh6OVBnHI+PdScQLYsi9xVJCaX4SXJUY886NQ=; b=jCqkxmCHjrLr6+kjTc2iAGHBXM
	XKKVIOzQV8usu0mezdRAnsNogp1l8mJGzg9p8PZGqYg+GT6TYjtFoQICBIa10Hv8DOZv5MiEmHOjJ
	pgZGRfAdXNQPkUCHrPuJtTVEiOArDsptP2p5HFiOcsaXUrF8ZkZhy3uBKaOSySGvKZkQCxESJGTIm
	O/9tsivQFLvhDr6NY2vGNUoQnGFIQcdQim1rm3HAS1kJCPjr3RickxiHFWRRkFZ47RC9pR2GKlS0i
	xQ6nh4PBzpqnB8mEoI4aQ4WSGK9TvP7cN+4NelC+UnFUa6RgLInn3gCdZKDyPwU2PXbgLWKtVO3Wi
	YrIGFlGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO2B-0000000BaMZ-2SdV;
	Mon, 10 Aug 2026 11:19:11 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO29-0000000BaLr-2vfl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:19:10 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1749181a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 04:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786360748; x=1786965548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDnTUkrh6OVBnHI+PdScQLYsi9xVJCaX4SXJUY886NQ=;
        b=Fsvyj1+eVbCkqIBuIoBYkTwvCqXGtUdnDlv3C/W+sQKcScZTihEnzahoLZGfUreYh7
         UMWyG6m1Oh6gdh6ENlgkGe6kDU0coN7wbbbIcbNShzkut+i8CCmm4berBkOLCITe7W/r
         nWcHxWIbG1WFJzU62BXJ1ki+8VtZNp1opyHGkwsAzRnOXYZZ9hVixGrH2LKmdIZztpBz
         e47Ti7Z9c6oEx6n9zUxWah9CnipHEWSja4hzSvCeUN4uotTv1GKtszJiF2tH38AkzOmW
         PhYZeUh2DifimQFpqtdTbYUm3KfNWUlyeiTGn+V1yj0YWtroLSFb6GdU4WqC7O3ZxFx9
         Yqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360748; x=1786965548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDnTUkrh6OVBnHI+PdScQLYsi9xVJCaX4SXJUY886NQ=;
        b=K5OP3hw4GgW3rB0HuQ2CJCikYJuNLikkddzuCePcdiTgscp2u/6hR7QN6OAZr+RJcm
         0mIgGmfDGDulf+i1xR4FzF2IupRtjjt/Jzg6VMzWN/H8qnepxZ7ufN32CnFMc/qRog9l
         ycyhlCtxdACVMWQ9miwGV7Tc3DCl3L03nJmKDBnOsdYj+WADmdNogZXjqLsL+WSrG+oi
         1DesY9EVURxhhYqKpel6LHWahDLIAoPo079Z41jlzD6W+vMV2joanLxpRY3FE4cJ7K4L
         y6imX/LfkhRkvpoc9zQTaoB3979MbJCYeRoha2iW1u5Gv0/UZvHOnRh/nKlc8wGXuDaL
         SK2A==
X-Forwarded-Encrypted: i=1; AHgh+RpnlZ6PN/wlQweGK3PQ5TTjUkwOaq+w7/dyegzxz7R9w+F6Ev/vThjJEn55mcYORS297IPlaKCQNTc1pDQpI0kA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Hsuk8t+C9PIqe2q6VJ8d883F/tfeHmO3AmdhxMWUwYeCnwum
	VyF+GZ7yYY1tkxKGrU99+tCT2REnGGdWt8BI0RgEwfgJFYN4IYyn4MsQ
X-Gm-Gg: AR+sD11sbA3p8ZOJPJ6Ts+8EGW+lmGytEH85O8YYiHyyMRzbwfCKx5lRsoOOtniSeeQ
	QFvONfQEk8YK0LXWhhkN5RMe+P8UWwgz/MXbsOeWnDCQqFKiO7DymfFkJHN4NlZnplRanj+xJlr
	hzmROu7sQ3cX50JGjSPJW9mA5Fr7UdlX/FcFX7MJFxI2YCCVL8jD5Rod3ydi4itS+67CDIgj9wn
	5OFvtzpaVMOeMmJyDZPDLzNCvU01pT1p7SgGJMELhjJJP68mW9S4L9E+epDYTk66rrK3LzfYlV6
	XAISo9Q5huc1iaQacfeq5kwxkYMJ+aTnVcA+mHz9PimMzP/zArmERKbJ6MHs9kCwxBAFmbk6WYv
	ta23XHMtBSfalDjXAasCM/abEjoGE1imqUq8otHAdGga/AvcyD9tpLD7iAwm99Y2KdNJ5rnU7Lx
	Muh5y0fh8VEIQk7HCbtjZhFUQMeuif1h6D5UTP8rmnqtCAg/OwEL2aYOqs4WJGys2rC54zLM8XB
	W5N36RLNVnicT6lZ9t7o7G4OFSn8pi0UpWTqWkIh7UHBT14yN9BJQJav6PNeC5X/VJdSLTYKpTW
	Co/U
X-Received: by 2002:a17:90a:e705:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-392cca1f44dmr579534a91.14.1786360748511;
        Mon, 10 Aug 2026 04:19:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085c393d5sm14798046a91.0.2026.08.10.04.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:19:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	rafael@kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	niklas.soderlund@ragnatech.se,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from optional IRQ lookup
Date: Mon, 10 Aug 2026 18:18:40 +0700
Message-ID: <20260810111841.77898-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_041909_765564_053E3E54 
X-CRM114-Status: GOOD (  14.44  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

rcar_gen3_thermal_request_irqs() may return -ENXIO when no optional
IRQ is available. The caller currently treats all negative return values
the same way, disabling hardware trip-point support and continuing probe.

Distinguish -ENXIO from other errors so that the existing behavior is
preserved when the optional IRQ is absent, while errors such as
-EPROBE_DEFER, -EINVAL, and other failures are propagated to the
caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1 : 
https://lore.kernel.org/all/20260807093058.42840-1-phucduc.bui@gmail.com/
Changes in v2: 
 - Update the commit message.
 - Move error handling to the caller.

 drivers/thermal/renesas/rcar_gen3_thermal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/renesas/rcar_gen3_thermal.c b/drivers/thermal/renesas/rcar_gen3_thermal.c
index 94804816e9e1..04a57ff724f4 100644
--- a/drivers/thermal/renesas/rcar_gen3_thermal.c
+++ b/drivers/thermal/renesas/rcar_gen3_thermal.c
@@ -527,8 +527,11 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	priv->info = of_device_get_match_data(dev);
 	platform_set_drvdata(pdev, priv);
 
-	if (rcar_gen3_thermal_request_irqs(priv, pdev))
+	ret = rcar_gen3_thermal_request_irqs(priv, pdev);
+	if (ret == -ENXIO)
 		priv->ops.set_trips = NULL;
+	else if (ret)
+		return ret;
 
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
-- 
2.43.0


