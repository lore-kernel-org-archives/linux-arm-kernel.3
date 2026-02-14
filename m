Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6E7EF5848
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQs0hMS3ix8i+/wRWb9Dj6VqM++U0M+jFLpORX82XoQ=; b=1s+9uURasDiGzYxtO4FJs8JBlM
	zWeIK6JLwkzFHaLcmwgHsa3wDtOal4xqRapm/jzleq4RYpNPjr8OvMdlUrQtrfX4GGM7/8N9suy0x
	Pg9iArruEIHgZg9n2d2H4oPOC41jjMUlBJ9Z2iEDaZ7r2/1GrugsJqyK+nLKpb87na9Gywp2CBBBA
	cW8vDfG+su4BvPMh44WIWlevQG1MPLv12IdyOqcBKsMvMlTsSJxC+RWTTDUB4uOLLzWizPMBdbhLY
	fFzpVGP1XBLxRKRZXJFi5bmXrhWe632mpx7ki2l9hiurIEmUVhfuFZrNLOTOMMQ2bndkBbF3rSXxa
	RPbqlu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFy-00000004qL7-2Ei6;
	Sat, 14 Feb 2026 18:20:38 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrKFt-00000004qHq-2Kcy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:20:37 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2aaf9191da3so12891595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 10:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771093233; x=1771698033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQs0hMS3ix8i+/wRWb9Dj6VqM++U0M+jFLpORX82XoQ=;
        b=Ey/7hBGz3qshSLroPhmAhfXXhUUcGegFAjcXIsQCDznAHk3RozoFrLZFKiht/pMfaz
         SmerHXVo/GwcUMxxoDmV1gqbGeAKSqOLb/LaMkCSGuc9vniwq+zO8/cjTXS3IBtg5HbC
         sTtzBJRbhU2SS4Uduhc8ZLIYX1wjsfSDkrqMM6DpE9Hcm1bFB2K6tWrDqT0s71x6JpV0
         0nF5kgE4yuA31+hmbnvZErOCQwGtBTWKKKTBbWAFiEEE+jzNUNksN6N7GGv65SAcibuF
         G0upct1QGRVx4edw0pVRQLLVnTDA9jTi4Rg6qcRGzj6u+tV8rp+ASwYJCOEL7M+yXj2E
         mykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771093233; x=1771698033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vQs0hMS3ix8i+/wRWb9Dj6VqM++U0M+jFLpORX82XoQ=;
        b=XwH75R4SB0bJUPyDmaerukDY845xnaihKlCehjQDnilbPFv1o/QPb0ogFdX42jtTk2
         nL6Hh4Jht0KfOoLhW+2NrrxaNKHpHVtRXYfiUgux58Iq0rH0kjM9sJl3WWOue6NSiPOy
         zeTDwd5/SfNu8sDMIfaR7hrAyBZ5tq383NWBsOtm/Csz44BdrVQX9hASWNskVuYu+Smy
         8rkppMArKp43JiJ1nwj6ZY+EZ6T/7pILSBlhghaunmE7OlJVVDMOg0px6EMlnQVHJCD8
         GO+JHGwS/hvagHYGnI5IsZyxCICyKiweO+Sj5p5bd3XukScR7D10Xxva+WtzGmBK4zrS
         bOWw==
X-Forwarded-Encrypted: i=1; AJvYcCUIHZBDRq0xjrsm2EpXLzYMawb02z/wiFf8yNcaZrDRzMfFwUXU0xmhdfzyyed66/osorIdX2I7oKGU/7S6MpWW@lists.infradead.org
X-Gm-Message-State: AOJu0YxoubSRKffxLiujOzKjqpvdWXAskHsRfUIbupgAtGz0ASi816/z
	cWPBy36VO4KmGHCvKnudE//YoXmmDj/DOHrC8olLi06a27xr+QMepgtO
X-Gm-Gg: AZuq6aKTwBW+LsT/CRKuK7Xet4FZvVx3Uf/jkqingEeF9DFpsvngY1SagCmq1WsKe6s
	daN24y9ElCAShEvUuRU/GoZ82k1LqsKpzhr+5la8VhvJsJ1d7uGVXbiKCu890LzF0msih8Zrjiv
	LyUtQxYSHqazyNrID7cqvqaydJqnCwrE3n5zi/QD13v29TlSngxDL66OH16mCANaL3OLiJv83Kn
	pZI7PQSReR3ACixVxhe3vppl5zkAV1ehpfOI0mQWpQdCwL+112GQzcNWR2PJjpNdN2joGCTTMex
	TLjYhnXDm/tqrVwtIrvUchZ+4EEY9ruku2NzBtGrdCfnMrsMW77WjwUAkarO/vxzmqt3jbtVED8
	cSgIcRm/dO1bPYag3X8xO+LotD6stfN6s1BCA7VZZ9dqvirAmb+3l012CwuKe+6xwlNs+kS9MEK
	Byj+64P8E43i43o7PtwNE=
X-Received: by 2002:a17:902:ce12:b0:2a9:3211:29f0 with SMTP id d9443c01a7336-2ab5063261cmr51537235ad.58.1771093232858;
        Sat, 14 Feb 2026 10:20:32 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5e06sm28406615ad.50.2026.02.14.10.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 10:20:32 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v8 8/9] thermal/drivers/exynos: Add missing drvdata assignment in Exynos TMU probe
Date: Sat, 14 Feb 2026 23:49:05 +0530
Message-ID: <20260214181930.238981-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214181930.238981-1-linux.amoon@gmail.com>
References: <20260214181930.238981-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_102033_616948_B79E96A1 
X-CRM114-Status: GOOD (  12.14  )
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

Add dev_set_drvdata(&pdev->dev, data) early in the probe function,
ensuring that the driver data is properly registered and accessible
throughout the lifecycle of the device.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v8: new patch.
---
 drivers/thermal/samsung/exynos_tmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 1d657802a310..47b92c84ae98 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1070,6 +1070,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dev_set_drvdata(&pdev->dev, data);
+
 	data->clk = devm_clk_get_enabled(dev, "tmu_apbif");
 	if (IS_ERR(data->clk))
 		return dev_err_probe(dev, PTR_ERR(data->clk),
-- 
2.50.1


