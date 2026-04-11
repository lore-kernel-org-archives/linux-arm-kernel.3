Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C386F3ED50
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 19:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZCcfd2j80fnOyI9eoqdL6EvakDEWReMcJQ9OZ/rF64=; b=EYt2PnvFNGsws5ITj/BddN5beV
	mK+CeYz5dytNTFZQipfKCiRwm8pCoSIlSoIe1lxIOI9iITpmWnclPI6ySw9sLor9F+YUvCpJk8ewN
	kPXE598yj6YmGFthSLEa0DgRrN7WqnqkJ1MM6NRwPufRq5xwX7L8ouqCXxHJxYqWKxbNjlgXeetVS
	e8sTUdVFc2mVOvxqBjLfJ88VWSggBVM+keWB4YuOgg9lyjDrwOY6uLwtMgTt2PwPvzt2fBZ4KdAR/
	0IOeUWEX8wvZi/4rKIF9R2SydqKJ7G3e7Fdenyzslwr14i3I+gSk+CryALcYDIRGT0V58qEOTZcq0
	kxtFDB3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdcC-0000000DjEm-0ZxT;
	Sat, 11 Apr 2026 19:03:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBdc9-0000000DjEJ-1uQ3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 19:03:30 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82cd70febc7so2093068b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 12:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775934208; x=1776539008; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZCcfd2j80fnOyI9eoqdL6EvakDEWReMcJQ9OZ/rF64=;
        b=dAHQ5z2ITaOwvs7pDRkVvM0+oRnPRLWdpK3FxqOkGUXWuFzTjBJx6eyKv7gnSVqzXT
         ayWgHa54oZ86h/xpRuCplEwRo0UD+Pzt+4uaFmFS0/U22UAyywpViIYLwU2KPTErdyc8
         TPOaOZbup0grmbx4MbkKxYrmEpQgQ32oLvKnZM80Hqo42MwmJXDP2Ee98Spb9wnaOr2p
         NcvmkT9GdppMuB3VDKTkhd/fsq1++k+jkRLVvdJChR8lpISnRdh13NLpOhgeouCygx/t
         AWofq2EsNVMP3Aqggs4PiBGwXEQcfGbXUfQnRTZZ7KjSJh+5J19vBaYlN5pGWPC/bAJP
         9ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775934208; x=1776539008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SZCcfd2j80fnOyI9eoqdL6EvakDEWReMcJQ9OZ/rF64=;
        b=CbooOo5ZK5doCgvyxe1Oz6oKccCJBN0K68t4Rd+SVaKO7jbXqjajsKy7xcvl6d3R9i
         yuytBGg/PZhoffrmo6F9YDZuQbZXVwA1n5ZlBYyCGot1Lg7GsmgCt9SkoED77JfmJmjg
         Rea1VyYv5XFg0yoVIrQPJyMV/67/I0QU9OsxZ12aS518emWN29KMIMKyPo+SicDMcnKg
         M/TvD9Ujd2uG7icSnyhwrIe3hGNTI+nokRHM4JGqgkXR6JgwedmXbc4eB2wdD+RxAXcj
         cmlSysKfT04L9OirAVWC/afwcJgZuzxjWuzNe896xOH31pVbq/mW+n4ZKOVbSP49wAtZ
         G3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU564RZvwCaicqQ0/NdLmqO0BDWq60QlH4MYHexWkghL7WZ7PPeberky3lyFsnxDRN6TyONChWuplqyW9Rdatr9@lists.infradead.org
X-Gm-Message-State: AOJu0YyJZTHIvcmdDXdCIneOywHjZwY0GFx+HKyBARoli832hkd1NS2e
	4v8wJF2rSv/8AKxFs3hQ5ZzkXh1OzR1d6404FdDQ+s6B5VFTUNOVUHEM
X-Gm-Gg: AeBDietZxancNh5dF88r7ss6vdjGqpueVBPcg3nPrI72PXOqZJhE+HqrEsEozC38DRC
	BYRdG9o/TOAc/45Tqgu0jbl6Ijbyya21iFwIch5tPk1Eckut6XVyMKqERNb6cjgScDFTV+MRsLJ
	hNvnUW1a84PqkNc3v3p6Og6KqKb/KOpqcgYO3/+HkMCIBQc1XO7QlPdD1Vwb7gw8H0Jiul8IUiV
	7+IwYU0gV81q/ET0OttUmzGiVWJveoVaduOzmpVnoc1pUYg6gbu84XlvV6aXG/9hK4vn+NBI0iJ
	brWZBem2SQhN24oTEnVizaLdVC6zZZP5++J5A6zcXhzrxCYQF+IFfhmmP3hPcgdraciDeQdB0lq
	RQb9GiG78ddiCwDzl/9HRjvHUdO9b1t4tua2/iVELBqMx3EAYXJtmHAa4sZKy5ig78Mo1naDZMn
	8vAyZxzcJlOV0DfGEoqaOp6CSu90j19qfn0mZEl+TpQAsTnV5C/A4HvYZZHCVrIygR9qaBA7KOq
	xFLigQ7b4ZsMiDWqsfK
X-Received: by 2002:a05:6a00:aa85:b0:824:93e4:2ddf with SMTP id d2e1a72fcca58-82f0c2108e5mr7582747b3a.13.1775934208443;
        Sat, 11 Apr 2026 12:03:28 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c338dafsm7058962b3a.17.2026.04.11.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 12:03:28 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 12 Apr 2026 03:03:03 +0800
Subject: [PATCH 1/2] thermal/drivers/imx: Fix thermal zone leak on probe
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-imx-v1-1-cc3b45d63811@gmail.com>
References: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
In-Reply-To: <20260412-imx-v1-0-cc3b45d63811@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775934187; l=1641;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=HdJtNYVZoBcseIrEtuqZHe4dtTSU6Ka5kLHKaWeLYmo=;
 b=neNOP4zpKWvHPkLkH0wdVnaTfqhzSv/BpzFq9DKrR/JAJc10E6mAsmmekeCLKiDqbQNajMH0i
 B6BD4UMtexGDr1MJj8lbme6hvP/nA6/CmECAFZ/qJQoFx/UM6NYNdPC
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_120329_502333_A7C9EDF8 
X-CRM114-Status: GOOD (  11.13  )
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

If pm_runtime_resume_and_get() fails after the thermal zone has been
registered, the probe error path cleans up runtime PM but skips
thermal_zone_device_unregister(), leaking the thermal zone device.

Move thermal_zone_device_unregister() into disable_runtime_pm so all
failures after thermal zone registration unwind the probe path
correctly.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb3..68f9ce41a670 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -727,25 +727,24 @@ static int imx_thermal_probe(struct platform_device *pdev)
 	data->irq_enabled = true;
 	ret = thermal_zone_device_enable(data->tz);
 	if (ret)
-		goto thermal_zone_unregister;
+		goto disable_runtime_pm;
 
 	ret = devm_request_threaded_irq(dev, data->irq,
 			imx_thermal_alarm_irq, imx_thermal_alarm_irq_thread,
 			0, "imx_thermal", data);
 	if (ret < 0) {
 		dev_err(dev, "failed to request alarm irq: %d\n", ret);
-		goto thermal_zone_unregister;
+		goto disable_runtime_pm;
 	}
 
 	pm_runtime_put(data->dev);
 
 	return 0;
 
-thermal_zone_unregister:
-	thermal_zone_device_unregister(data->tz);
 disable_runtime_pm:
 	pm_runtime_put_noidle(data->dev);
 	pm_runtime_disable(data->dev);
+	thermal_zone_device_unregister(data->tz);
 clk_disable:
 	clk_disable_unprepare(data->thermal_clk);
 legacy_cleanup:

-- 
2.43.0


