Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 415FECC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrgOGdMLkV0WrLy0TUjWMoYb0B8/UDJwOZrA1ohaJT0=; b=M75YAQ1XSGGbR9PsNPhFzVF6U5
	VaSONkyFdwORaOkCdECtRJ4yGHEL2mpjovkhS+zY43pTSZK2/o+iEvJHzOq0l1fI6jwbnSdU5jNQD
	ZHGU3EZTf5ca3ydvHySAki3xWJPDIysGbHe1/xXQ+ffEysEfU7MlIumG2+eRSgRh1B2PGlmzSzfmr
	KzoJqwdWZWvtywRHLpJHf1EBZvosJj0iyKo5CDwh1qpEoMkFdQ3TKn++f0yHijP902etwLETK2ly9
	N7pLz7it8eSAsFx0Jhx617U3riMVCKGNBKgbatWe/M71ezq/j34O31hmG5RYZFl4wjbOUnzkULXCj
	du7FRmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc5C-0000000Cssn-0bUN;
	Tue, 13 Oct 2026 12:58:18 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGc4q-0000000CskJ-0ZGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:57:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c2dcbcc546fso353451866b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1791896274; x=1792501074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrgOGdMLkV0WrLy0TUjWMoYb0B8/UDJwOZrA1ohaJT0=;
        b=P/PboOfZKxu+ML3puhdvxXFGx1y940KJYFZ6xozTHBKnMVrWa/0WNFZqknjo+h3FsU
         UkGeXLD+TEJsvODXHVY6G0I3PzS+ClIfPMgUd34JkIIop7jGAl9NakvW99BTyY+LsU5S
         pxxvM2pEbUzWTaqqNsnUuqyfvNYOJoyVpK0HgMdHVE2Oo5QFAFn/I9SXl4yPYGEuCOTf
         0d80Qi1hu+fP9vAoolDAPqXxZstG8V3oRo4rsXCpKawKRJA7H+xXnZwaK13RTsjBlrG9
         DQJn4GU3sv1SDDnV/oUfPGmAnEKP23szyiWizLWY0MnF5WBgIlKaNr9d3RqtAhDyDola
         k8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791896274; x=1792501074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrgOGdMLkV0WrLy0TUjWMoYb0B8/UDJwOZrA1ohaJT0=;
        b=MEBmUgRMLzM+bnEQgVCzyKDZYrx6rBkA92dnCng3QECgaFjfSzOuRHzelJp8qCuCbE
         J33DhcZRhAxFo5cFmj9YQ+R7kx3BXbnrqNtoCwz/OXvdULCB/MlVgrS5EfIs4blJeTVE
         Vjfqx9s4B2X+SZR4dxUfJh4RdASNPHXTyyTZl6gChyZ3HGuwSUZdgli0olGhcCH+b1Vg
         X5ZaHD0UD/nueaoONaUyBbEfWeZDFmAsczLgXig6hAGOasD4vbe0PHT14iP2/JS5L5Sn
         osaWbCicVhc4foek+IvJofWh4cFhIfhHrkD2xMk0efsj0qFzJRJSvUcuQq+j9Udch7Tj
         ALeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCWIhjHfFwesigfr9NMFEPjR9z7G2bNhfiVrW91/TSBg4hgHoqJAm1I4us3q5kpelaQXHl8ETaeNcRQERfWr5x@lists.infradead.org
X-Gm-Message-State: AFq9FYK/f9K78mOoUs8Rrectt5dJOmFgX0ogZmkP8sBbURBuN8chP1K+
	Nmm5136SFcUlo9hdcswpKSXjfygZrX+jtza08vchitbF3zKMmcV+YJdbVRrdtWgCegM=
X-Gm-Gg: AYBFou08Z32RAjBsK6iTca1OhoFFXLq0Sm7c7nO2oaS7Yup2aIxmLqEszGJouyKy/CG
	oKTy6ec1pdMkc3eptNfyL+JMGkq8p7eulCHHwZ/RHWISbxc3IPxmk0A0rnSKouw9tygx/aSJjkW
	cfvUhW92b56XNPn+AjjkCPb1oG14c/9+B7RQdBj/W5DOhn6lLfZcDIciDVXz+s5k5ut/jXbfdYF
	qaRhEN8WsLdMvVQ2wFMtRqChpLJWkfApqrdxiisG6dWvn2yVPU53XHbUkxA9OlzzQLcqGpUyH7t
	8es3MucyLf31zoX1VWf8BTCSPiXM0XCbwMkmX5jBzZFvAWNtOXuJ1Pd71dPSBGCAlhy+njsROdX
	b8skRo0PK0/gLgdyzobMWD/w/2s3Omy4Ar1dRp7GqWISdEQpQeyV6wEkwJ3O7Hgv79tnyF+VpYI
	O0j5ufzzHEDZ+A0Pz1cQZ6kEANOks5RqPlN1JLxIBlRWzs2EIxXOUYE8+oY+yipadlhidyB2jXn
	TbA9dwGn/cFYq+mLgeneSbQY/UnN1IAnEei7dHGs2h1nqVfJ5nyT5tlumjcxKj9SZsnmaJA5X9B
	MY/QUiKOcM4YuBwuuXAaceiISl3wbDE=
X-Received: by 2002:a17:907:3fa9:b0:c2a:6c3:9e98 with SMTP id a640c23a62f3a-c31aa098468mr1181829066b.40.1791896274364;
        Tue, 13 Oct 2026 05:57:54 -0700 (PDT)
Received: from threadripper-fedora-workstation (d-zg2-045.globalnet.hr. [213.149.37.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac9ecfsm605985766b.74.2026.10.13.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 05:57:53 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	lars.povlsen@microchip.com,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 5/6] hwmon: sparx5: register LAN969x fan as a cooling device
Date: Tue, 13 Oct 2026 14:56:29 +0200
Message-ID: <20261013125735.1542349-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013125735.1542349-1-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055756_230677_D95950E4 
X-CRM114-Status: GOOD (  24.37  )
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

Allow the LAN969x hardware fan controller to be used by thermal-zone
cooling maps when cooling-levels are provided on the fan child node.

Translate cooling states to PWM duty-cycle values and keep the cooling
state synchronized with direct pwm1 writes. Register the cooling device
against the fan child so thermal references resolve to the correct node.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 Documentation/hwmon/sparx5-temp.rst |  14 +++
 drivers/hwmon/sparx5-temp.c         | 144 ++++++++++++++++++++++++++--
 2 files changed, 150 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/sparx5-temp.rst b/Documentation/hwmon/sparx5-temp.rst
index a1f8218e68794..28f91537fc376 100644
--- a/Documentation/hwmon/sparx5-temp.rst
+++ b/Documentation/hwmon/sparx5-temp.rst
@@ -48,3 +48,17 @@ PWM consumers. The pwm1 value describes the logical duty cycle independently
 of the output polarity. Frequency requests are rounded to the nearest
 hardware divider value; requests outside the divider range are rejected.
 pwm1_freq reports the resulting frequency.
+
+Thermal cooling
+---------------
+
+With device-tree thermal support enabled, the LAN969x fan can also act as a
+thermal cooling device. The fan child's cooling-levels property maps cooling
+states to PWM values from 0 to 255, in ascending order. When cooling levels
+are provided, the driver initially selects the highest level.
+
+Manual pwm1 writes remain available and update the reported cooling state
+to the highest state whose PWM value does not exceed the requested value,
+or state zero if the value is below the first level. Subsequent thermal
+cooling requests can override manual PWM settings. Each cooling request
+programs the exact PWM value associated with the requested state.
diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index 5130140e1b579..3eabcc7946098 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/thermal.h>
 
 #include <dt-bindings/pwm/pwm.h>
 
@@ -53,6 +54,9 @@ struct s5_hwmon {
 	u32 pulses_per_revolution;
 	u32 pwm_frequency;
 	bool pwm_inverted;
+	u32 *cooling_levels;
+	unsigned long cooling_state;
+	unsigned long max_cooling_state;
 };
 
 static void s5_temp_enable(struct s5_hwmon *hwmon)
@@ -123,6 +127,20 @@ static int s5_read_fan(struct s5_hwmon *hwmon, long *val)
 	return 0;
 }
 
+static void s5_update_cooling_state(struct s5_hwmon *hwmon, u32 pwm)
+{
+	unsigned long state;
+
+	if (!hwmon->cooling_levels)
+		return;
+
+	for (state = 0; state < hwmon->max_cooling_state; state++)
+		if (pwm < hwmon->cooling_levels[state + 1])
+			break;
+
+	hwmon->cooling_state = state;
+}
+
 static int s5_read_pwm(struct s5_hwmon *hwmon, long *val)
 {
 	u32 data;
@@ -184,19 +202,25 @@ static int s5_read(struct device *dev, enum hwmon_sensor_types type,
 	return -EOPNOTSUPP;
 }
 
-static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+/* Caller must hold hwmon->lock. */
+static void s5_set_pwm(struct s5_hwmon *hwmon, u32 pwm)
 {
 	u32 data;
 
+	data = readl_relaxed(hwmon->fan + FAN_CFG);
+	data &= ~FAN_CFG_DUTY_CYCLE;
+	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, pwm);
+	writel_relaxed(data, hwmon->fan + FAN_CFG);
+}
+
+static int s5_write_pwm(struct s5_hwmon *hwmon, long val)
+{
 	if (val < 0 || val > 255)
 		return -EINVAL;
 
 	mutex_lock(&hwmon->lock);
-
-	data = readl_relaxed(hwmon->fan + FAN_CFG);
-	data &= ~FAN_CFG_DUTY_CYCLE;
-	data |= FIELD_PREP(FAN_CFG_DUTY_CYCLE, val);
-	writel_relaxed(data, hwmon->fan + FAN_CFG);
+	s5_set_pwm(hwmon, val);
+	s5_update_cooling_state(hwmon, val);
 
 	mutex_unlock(&hwmon->lock);
 
@@ -289,6 +313,90 @@ static const struct hwmon_chip_info s5_chip_info = {
 	.info = s5_info,
 };
 
+static int s5_cooling_get_max_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	*state = hwmon->max_cooling_state;
+
+	return 0;
+}
+
+static int s5_cooling_get_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long *state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	mutex_lock(&hwmon->lock);
+	*state = hwmon->cooling_state;
+	mutex_unlock(&hwmon->lock);
+
+	return 0;
+}
+
+static int s5_cooling_set_cur_state(struct thermal_cooling_device *cdev,
+				    unsigned long state)
+{
+	struct s5_hwmon *hwmon = cdev->devdata;
+
+	if (state > hwmon->max_cooling_state)
+		return -EINVAL;
+
+	mutex_lock(&hwmon->lock);
+	s5_set_pwm(hwmon, hwmon->cooling_levels[state]);
+	hwmon->cooling_state = state;
+
+	mutex_unlock(&hwmon->lock);
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops s5_cooling_ops = {
+	.get_max_state = s5_cooling_get_max_state,
+	.get_cur_state = s5_cooling_get_cur_state,
+	.set_cur_state = s5_cooling_set_cur_state,
+};
+
+static int s5_get_cooling_data(struct device *dev, struct device_node *fan_np,
+			       struct s5_hwmon *hwmon)
+{
+	u32 *levels;
+	int count, i, ret;
+
+	if (!of_property_present(fan_np, "cooling-levels"))
+		return 0;
+
+	count = of_property_count_u32_elems(fan_np, "cooling-levels");
+	if (count <= 0)
+		return dev_err_probe(dev, count ? : -EINVAL,
+				     "invalid cooling-levels property\n");
+
+	levels = devm_kcalloc(dev, count, sizeof(*levels), GFP_KERNEL);
+	if (!levels)
+		return -ENOMEM;
+	hwmon->cooling_levels = levels;
+
+	ret = of_property_read_u32_array(fan_np, "cooling-levels",
+					 hwmon->cooling_levels, count);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to read cooling-levels\n");
+
+	for (i = 0; i < count; i++) {
+		if (hwmon->cooling_levels[i] > 255)
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling level %d exceeds 255\n", i);
+		if (i && hwmon->cooling_levels[i] < hwmon->cooling_levels[i - 1])
+			return dev_err_probe(dev, -EINVAL,
+					     "cooling levels must be ascending\n");
+	}
+
+	hwmon->max_cooling_state = count - 1;
+
+	return 0;
+}
+
 static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
 			   struct s5_hwmon *hwmon)
 {
@@ -320,16 +428,18 @@ static int s5_get_fan_data(struct device *dev, struct device_node *fan_np,
 		return dev_err_probe(dev, -EINVAL,
 				     "invalid pulses-per-revolution\n");
 
-	return 0;
+	return s5_get_cooling_data(dev, fan_np, hwmon);
 }
 
 static int s5_temp_probe(struct platform_device *pdev)
 {
 	const struct s5_match_data *match_data;
+	struct thermal_cooling_device *cdev;
 	struct device *dev = &pdev->dev;
 	struct device *hwmon_dev;
 	struct s5_hwmon *hwmon;
 	struct device_node *fan_np __free(device_node) = NULL;
+	u32 initial_pwm;
 	int ret;
 
 	match_data = device_get_match_data(dev);
@@ -372,14 +482,32 @@ static int s5_temp_probe(struct platform_device *pdev)
 				return dev_err_probe(dev, ret,
 						     "invalid fan PWM period\n");
 		}
+
+		if (hwmon->cooling_levels) {
+			initial_pwm = hwmon->cooling_levels[hwmon->max_cooling_state];
+			ret = s5_write_pwm(hwmon, initial_pwm);
+			if (ret)
+				return ret;
+		}
 	}
 
 	hwmon_dev = devm_hwmon_device_register_with_info(dev, "s5_temp",
 							 hwmon,
 							 &s5_chip_info,
 							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL_OF) && hwmon->cooling_levels) {
+		cdev = devm_thermal_of_child_cooling_device_register(dev, fan_np,
+								     "lan969x-fan", hwmon,
+								     &s5_cooling_ops);
+		if (IS_ERR(cdev))
+			return dev_err_probe(dev, PTR_ERR(cdev),
+					     "failed to register cooling device\n");
+	}
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	return 0;
 }
 
 static const struct s5_match_data lan969x_match_data = {
-- 
2.56.0


