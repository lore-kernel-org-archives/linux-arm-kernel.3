Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A9BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKO092aqGvuaWEK1ec47bOLS5kCK+a7HRvUCASG+XdU=; b=N5h/q0X6RgIZFnsOrQjyDLap5r
	m8oDXFy5LKDdL4c4jcxkQSR0cJcbcOEyqZ5suOWUAY0KgekxEE8yg+tHRxDhDnMpxh3VZWHWRK0I0
	JyDQDriBfp8D35GfajZnfyV6/x0aTGKKZEstRviauTEteCMmDhBz8Xk9P7W06KgigPtRvAC4fc66x
	cFx8yrcYZqR3zK2gj6ZA2DCjoKJFrSpIjMT87mfsOTR2CjVE/0UILgWpCDvHIgpw6peo8zCKFjBJz
	iZaoNtgjxDBimVDlMDzZa4423KxRKdR9aiHBtRq/r2z7Vz+ONk4RsbqnSKn0woEuahwhsHmy88usL
	TCD28QCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkkU-0000000DSW9-46Kd;
	Fri, 03 Jan 2025 16:42:10 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkh0-0000000DRsl-0dkH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:38:35 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa692211331so2356361766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 08:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922312; x=1736527112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKO092aqGvuaWEK1ec47bOLS5kCK+a7HRvUCASG+XdU=;
        b=RPyatjGlduynQuaEtfcWtGSNDOF5f9hHbo6BZ6DVj+rjJsYZtGamlL84zzNKzCEuog
         tP0ZPGBkrcVb+2+5IHShGEoYpU2zNLQWDBkRBWFwn5OlCSA/gNT3LAm7HA64+wA/cO48
         TNd5V/RqD2hLkwW4655x/1s8yTOkCkp7j1VeqgVulFs9rb+Jb+XztQivmG4yHTacUEMT
         gtUhF+yLoCygaJ7VqITtkF4YLFcoV9MLjsq8G+KHEsmV5ggH1rzyEn/K0Ddi4MSxvidS
         Q7+6W9QLnJ2jCYI2+f6K0LzobV3EIm9RLzET9++ksqGUbXqTrL7dnu2aM29es0rpEtPr
         /8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922312; x=1736527112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MKO092aqGvuaWEK1ec47bOLS5kCK+a7HRvUCASG+XdU=;
        b=qAeW1fJZEYbftDIF1jIk2HW5x/ewphAped6Xp77EFqG4en44ZlhAf65ltt+SBNMtao
         z2P0K+6l3+K5v4iKz+1tzA1ffo58CRs9m2AgQRqVUJuARFseDQepmkiVEFq0q7g2Od6R
         1WXPCf7u0kfGSRL/zSd+tjtjz7brvJZ6auWVB35ODJMaaqVjB1O0NQzvE34XwnDWmd1C
         0XETvRpSHuD0d4SR6SaHmJ54jSrkczf4XCaielUSFfkcTxFIALQC+UkgKABYCH8+7bKA
         iSvGuXy7MwlSLGq9jRdf6edvPyQGvNI3W1GQuCqCsfev8gzVC0uvWM+wbI5LS7VlFnpI
         0slQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6c/02LM9z4FIQyGu6eRWP8ijDHZ4zCj0Mb9BSj186t9YHeUSHaRvj6loHt1R7Lm4Nz9vvPMz6o1ldRRad3ULU@lists.infradead.org
X-Gm-Message-State: AOJu0Yye4DrMLHXb/4zOTYqOL83FzOhqg3v8rzMVKEE4IpZ8+GOn+D1l
	OU9A1QYJLtymT3vH7iaBDJxIAn4d5N0z6PXUvl0tT/400PHvwNJGwy/CiMQPIfQ=
X-Gm-Gg: ASbGnct955M2qlsexZ/Zns9XzB+HjtWSi/Rhy+225Rn9GErOcfg36TsxErTZqwN1+7g
	xDbl2UoxLUgRdmgyHLuVGImIS2OPuRsPqM4ZZnpBy+N7hF5daInkco8GX0zpoha6u4GUIUeNJfb
	KU6w3gQpFfGxE4MytAvElEub4VxRV0HtQrsybe4TW+/o6lfx465YG4yR3mx3MwrTzoIpHg2oBbm
	Pum4QPznhH1BLiRYeFNku1qE/kDALbcpMJ5KmrpmS/kgh74Ua9H96mesiCUw92/9ZjhaLuLjjYm
	dsZLYTfnr/k=
X-Google-Smtp-Source: AGHT+IHotX0t/tDNEmrDmtZY7hNyawr8SL8uDODoko36MDXxVpeudAHOQDSv7TvNphEb+Zb8F3tSTg==
X-Received: by 2002:a17:906:4fcb:b0:aa6:7ff9:d248 with SMTP id a640c23a62f3a-aac0812631emr4709225166b.8.1735922312040;
        Fri, 03 Jan 2025 08:38:32 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:31 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/6] thermal: of: Export non-devres helper to register/unregister thermal zone
Date: Fri,  3 Jan 2025 18:38:01 +0200
Message-ID: <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083834_196521_D598C01C 
X-CRM114-Status: GOOD (  18.75  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
clocks are managed through PM domains. These PM domains, registered on
behalf of the clock controller driver, are configured with
GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
clocks are enabled/disabled using runtime PM APIs.

During probe, devices are attached to the PM domain controlling their
clocks. Similarly, during removal, devices are detached from the PM domain.

The detachment call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      device_remove() ->
        platform_remove() ->
	  dev_pm_domain_detach()

In the upcoming Renesas RZ/G3S thermal driver, the
struct thermal_zone_device_ops::change_mode API is implemented to
start/stop the thermal sensor unit. Register settings are updated within
the change_mode API.

In case devres helpers are used for thermal zone register/unregister the
struct thermal_zone_device_ops::change_mode API is invoked when the
driver is unbound. The identified call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    device_unbind_cleanup() ->
      devres_release_all() ->
        devm_thermal_of_zone_release() ->
	  thermal_zone_device_disable() ->
	    thermal_zone_device_set_mode() ->
	      rzg3s_thermal_change_mode()

The device_unbind_cleanup() function is called after the thermal device is
detached from the PM domain (via dev_pm_domain_detach()).

The rzg3s_thermal_change_mode() implementation calls
pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
accessing the registers. However, during the unbind scenario, the
devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
Consequently, the clocks are not enabled, as the device is removed from
the PM domain at this time, leading to an Asynchronous SError Interrupt.
The system cannot be used after this.

Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
be used in the upcomming RZ/G3S thermal driver.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/thermal/thermal_of.c |  8 +++++---
 include/linux/thermal.h      | 14 ++++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index fab11b98ca49..8fc35d20db60 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -329,11 +329,12 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
  *
  * @tz: a pointer to the thermal zone structure
  */
-static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
+void thermal_of_zone_unregister(struct thermal_zone_device *tz)
 {
 	thermal_zone_device_disable(tz);
 	thermal_zone_device_unregister(tz);
 }
+EXPORT_SYMBOL_GPL(thermal_of_zone_unregister);
 
 /**
  * thermal_of_zone_register - Register a thermal zone with device node
@@ -355,8 +356,8 @@ static void thermal_of_zone_unregister(struct thermal_zone_device *tz)
  *	- ENOMEM: if one structure can not be allocated
  *	- Other negative errors are returned by the underlying called functions
  */
-static struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
-							    const struct thermal_zone_device_ops *ops)
+struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+						     const struct thermal_zone_device_ops *ops)
 {
 	struct thermal_zone_device_ops of_ops = *ops;
 	struct thermal_zone_device *tz;
@@ -429,6 +430,7 @@ static struct thermal_zone_device *thermal_of_zone_register(struct device_node *
 
 	return ERR_PTR(ret);
 }
+EXPORT_SYMBOL_GPL(thermal_of_zone_register);
 
 static void devm_thermal_of_zone_release(struct device *dev, void *res)
 {
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index 69f9bedd0ee8..adbb4092a064 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -195,13 +195,23 @@ struct thermal_zone_params {
 
 /* Function declarations */
 #ifdef CONFIG_THERMAL_OF
+struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+						     const struct thermal_zone_device_ops *ops);
 struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
 							  const struct thermal_zone_device_ops *ops);
 
+void thermal_of_zone_unregister(struct thermal_zone_device *tz);
 void devm_thermal_of_zone_unregister(struct device *dev, struct thermal_zone_device *tz);
 
 #else
 
+static inline
+struct thermal_zone_device *thermal_of_zone_register(struct device_node *sensor, int id, void *data,
+						     const struct thermal_zone_device_ops *ops)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
 static inline
 struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, int id, void *data,
 							  const struct thermal_zone_device_ops *ops)
@@ -209,6 +219,10 @@ struct thermal_zone_device *devm_thermal_of_zone_register(struct device *dev, in
 	return ERR_PTR(-ENOTSUPP);
 }
 
+static inline void thermal_of_zone_unregister(struct thermal_zone_device *tz)
+{
+}
+
 static inline void devm_thermal_of_zone_unregister(struct device *dev,
 						   struct thermal_zone_device *tz)
 {
-- 
2.43.0


