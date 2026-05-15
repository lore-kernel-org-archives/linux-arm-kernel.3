Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40DECD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h187CLLtKoMiP+2/X+09HRYFjKBZCzb1UldAVYewGlw=; b=zEShHYRF5HzhbGY6QrIqYznmcn
	jk0fWsV8vurIEh4QL0/2Og6pP9RjwCFv0GUIirRa4NuKr9FxfCWYm4xS6O/YJwoFIOU1Mz8DPApP/
	JohFGJRr35agB74YXCu5Cjsx2Xp0KTWM42T5Yhwejt6jliHQAgP1S7jtQhtE8WNBHz7pV+eWmppxG
	icVH/NRWLP9ZxQ6y2HGhc/yJ6XMY1TFoE9zYHSLZP8Npqj5gsEA2323G2pEIdKnW28u+g0XcRZH2s
	gKmzMW7fAW3YAVJhVl65AEb0IZ5sDnhg1YlzSwIRd7K9MfRuPcOdm/qUWxu6Y0KxkaglhCW8ZxWB7
	mMA/5OAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNonu-00000007sdT-19xO;
	Fri, 15 May 2026 09:25:58 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNonr-00000007scS-2XPD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:25:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-83975e992e1so4440440b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778837155; x=1779441955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h187CLLtKoMiP+2/X+09HRYFjKBZCzb1UldAVYewGlw=;
        b=OHt5238AEz6AKHuB+AC6kpfT3Eqkmf5231uErvdmuIYTodrkTsDgF5Qm8HZkyxeRFp
         Fk76bMKRcf3xvvLuY8Eigv4D1TMkN+785yDAji0KUlSM2Zx7mEdlDU5lDryhBE3UCtse
         E6K1Jze9cuOz7djPTswIhX3Jm5h5Rbf3QGiy2TxFwdE2H85b1rsyY2l/xNmY8GvmUG4R
         wEJaZdZ5+ZdgcHf95EpEfhR994pcsOVqX05/MQLPx50H4J7GENhhHme3FPWh5f6w0+TB
         IeV219rxjeg9sH11r1O/4JuQGIUplh+b9kEsRgzPdEFFNHi7u5861KquXLnQ1xdK7sAh
         9Fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837155; x=1779441955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h187CLLtKoMiP+2/X+09HRYFjKBZCzb1UldAVYewGlw=;
        b=OX3SF+uBEjJEq6IB5vk4RKCjdt5QJLhmmaqa9KOlZOlld9i6paZmD9Cmxo66d3shfU
         RGLS3nWJ4CA7Y4wLfX7nk1Y1vwxNd8rikqsOc6K2Z5Mnoj4Pec7mJfTuWEb15mdukaMU
         teZloXiuIDuAzbj3Rm12vbzPHZxlr+24PYdOATNMG+WDqJDya+vpaADuRkPIqtCatmTm
         30VHlZCP5XFk0hPo8j1qzLCppE0l7IjLHk+4LeGJz5Qn0YEK+pjKJOR3WIE6OhP+X+aA
         w5ao0ZEvgFuvoJKx+LeTYZOrtLoyCIcCCx626km3WIV1bZBN9yMCbXNdasPi8sM6YmlZ
         wOmg==
X-Gm-Message-State: AOJu0YxGMUS4H/Hr/gPYu1CeYr2CxRgfTnS7uQacWBye3C+9JGq5BWBX
	rBVr1vB/IA2Z/dh8OfY5p0X7MYAXfWBGzPaYPFMC18zqJIlywtUlfmWy
X-Gm-Gg: Acq92OERCYR86RG2cJcJ8PIWaWqajwtNtBrJHDRo8qXtJJwOcD0kG1ZtfuefrOKW9JX
	1brcNlUWrIF19xV9Is9BkXBsDQPJpJ+k6kC4kWfj1Hs6OTS3THr/BOHNa05MsgSrQ2ZXQFzk2nJ
	DoZ2KF8LE+csIfV+VysliQ0DZluC4daj3GjHo+JslhadwFZGMOov4+CC8aQfcUPZdz2cOkEicn0
	T2KJd5jLSrv2fCm+7cLy1SuWP3tRCsN+zOkWG4DpabTXkcRugGoVKc6rNy0MWNW0dBA206WulG1
	LS7AUC8SXWHYjFz/ckkFcECCarfJiVbOYgryLWuKRGaZoAXZtGi5W3+FPaaZCpssHslyW7Rma9b
	XvyoVcXYNWbXfJv2rZQbn9IjXcjlYzXRZ/vsBi/tUsYkdDnMynyOHblx6MUiV398lKWT0+LLzu9
	SuBpo+8fhzwGojX9J04IHp4VxUWWXi7rMQxvrv0NYRXV9iN5mEIByze6bK0ZRfD+VuO5oZTku98
	GYruGa3YDY=
X-Received: by 2002:a05:6a00:2394:b0:83e:c76c:d720 with SMTP id d2e1a72fcca58-83f33c60de3mr3457647b3a.30.1778837154576;
        Fri, 15 May 2026 02:25:54 -0700 (PDT)
Received: from chaitanya-virtualbox.. ([103.249.241.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f2b9bec8fsm3829097b3a.33.2026.05.15.02.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:25:54 -0700 (PDT)
From: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
To: brgl@kernel.org,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaitanya Sabnis <chaitanya.msabnis@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3] i2c: davinci: fix division by zero on missing clock-frequency
Date: Fri, 15 May 2026 14:55:20 +0530
Message-ID: <20260515092520.9006-1-chaitanya.msabnis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_022555_652699_D4C7240A 
X-CRM114-Status: GOOD (  14.05  )
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

When the 'clock-frequency' property is missing from the device tree,
the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
macro was defined in kHz (100), whereas the device tree property is
expected in Hz.

The probe function divided the fallback value by 1000, causing
integer truncation that resulted in dev->bus_freq = 0. This triggered
a deterministic division-by-zero kernel panic when calculating clock
dividers later in the probe sequence.

Fix this by redefining DAVINCI_I2C_DEFAULT_BUS_FREQ in Hz (100000)
to match the expected device tree property unit, allowing the existing
division logic to work correctly for both cases.

Fixes: b04ce6385979 ("i2c: davinci: kill platform data")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.kernel.org/
Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index a773ba082321..a264a480dc3c 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,7 +117,7 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
+#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
 
 struct davinci_i2c_dev {
 	struct device           *dev;
@@ -761,9 +761,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
 		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
-
 	dev->bus_freq = prop / 1000;
-
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 
 	dev->clk = devm_clk_get(&pdev->dev, NULL);
-- 
2.43.0


