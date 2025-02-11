Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADECC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=; b=OfFbNpLU3QsqOM12s3FttKdax8
	qo+ZE+6e2cRw8PMdm38zHQbKxM/t3K8BRywyOuxAXVojttRlgpFpYuxm9c9gs3epGdpznNnJflw3g
	Ekm88OfgINGikmJZ7r2LHQH3a23GO+AkTwRFUKUHWvYbGxooZD380w2g9xXv1+FQhLU/jbwzaL5M3
	kynu4mxy1MnPZjmFLLm2V8C8akDcquJkgAQf3ra8XEiBLi0e0Vi3/NSgUlCs/k8+N59K7rhdpimgg
	uFGuoq+b8FZ2uafQWo1R7gQXdtC9O+JzlPwiPl3fpkm9bHOObuKM0+gkrVAfPxF7Gj/0TUERs5k/F
	wqI4Z6Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHn-00000004iZ1-1ITx;
	Tue, 11 Feb 2025 17:43:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3w-00000004g90-0WYT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 17:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=; b=Dr6QQhdoPDFqtF63DvFOdzg4b9
	gNoIvXh/krYVHW7Di4WNgVf1CEH4riGi9RVo1Qtc5IEG5oJ7KhuMvU2BpKBVk9xVjogZO3h1cpXiN
	6aW98NYqnOp/0iHbydcHu1+7Q6Tbbg7xqHh2IUZDaNc94HDYn0RfXWfmsNtGyPv1DJoxY8NLIB7bF
	lGEecggCS+0IwpVb6sBUvTTJ5zWDl7AGxk/vDA/2eY3TfilbKUkNStzKJkEO5BSo5/vxMY4RDznJs
	ValP83MQrDm6ImTj0Z4clZDYyKaPXj9vYoqVem9iBLbFuN/sNqzlUZD3jpjKVn/vSbgbp7Lktf8+B
	1uzGfWgg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3t-00000000eMv-1HiQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dd935a267so2392415f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294919; x=1739899719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=DwFiIFthXd166YWDwsiSvS2hdx3/ha3YjZ/ZP4U+YhYypNcTa0gi1vgYJATMBdenUj
         aOeM06hBEZ9fuDzH2HsoVbyZjzsCOoynGW7q1UVa36OQ3bbcd1mz8pEIet2rw0t2wd6C
         fLNI2Q3MzvTp6PmCAdvt3jgXGOjX/eh5FFpfvWdMyv/FTfoW6QI8qhzY8HjIsnjwt6tv
         a+DiZrqJ7ru3w9S5Dwh7ROZ+YRjOeFoLoK4bNidu2JFDcqVVhspdIEjxa6om9glW7d2Q
         OHlcobFD6UaMjd0C5F30MrSHk1zZK6P+nsGL9j8+xQnCGYSWZA/cLd1zVG7+1fPHPFFW
         Qk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294919; x=1739899719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=OkFfgwFjay5KzF9ws/Qxy8RM0xezMxwlIhUQuC3jnlBdPTIeurnTtE+olbPZID0MoU
         p304polpilVbG3l7kuZyiPHkI24cHBrmu3AqP2jG/5m5kUX3oLcOncZQhCNdGjhT88bS
         7Rpm0+RB/4PannQNIQs58MY6OBBij2V4z3CFc9e9ctNZ/F4A0dWpjobI/EwOaU2PYoKC
         M5W/7AX1TqUdGg6voYv0NT6bGONkFI9E+FEJjip6JJmoVftNGa/AdR7Hli5Jw3tjT/7L
         wDoNqv/IPkRy81QId4aJ8THcWRxaS2f6MrvVSzI6LtwV/Sjmd8aJtSFJi3B7svFtfuel
         mbsA==
X-Forwarded-Encrypted: i=1; AJvYcCWHMcYe89DL99aQRKIs1G0uCNo26zxuhIHyMJWOz3cN7ZgcFRSD+zOyX32zMweqPsvCKcMU1b/U0L5Yqs8zQdtw@lists.infradead.org
X-Gm-Message-State: AOJu0YyuPGMHWH3bn+Bcb2AO+SnRSwTf27eMEyKbqdqO331PabXDfXPW
	rOVIRs5ExFEodo4DgDY7wLnT7HJuUZH6FrUbbq+mEZorzgTAawHh1X8xPWdvtHg=
X-Gm-Gg: ASbGnct2CNzNrQlzSGPc5LDp1Gzq9T4iwjSq4QAeIg/0hQOPhS8whm+9vk0KdKQ2muC
	hET4aT7O9KIU3ECXBnd8INJpd79aeUH8lIp0RlRmNJM+PpuPow6TXH9lprxbImGz+0oZgpny0mm
	Ath8czsn7EeGSxWy7+dfiYuGzgUrt050aleEYKLhRDTtK/1SH6IPKNxXNOzb5GvmYeBhNaD7Gji
	JGG5CCm1w8BuzHt/ZEt3VeCcIcy965dlYsoJtkzf0VJ0hNzW8Twq+FxaxyXsY5Qj2Tp+l0Gj24i
	V4ZMaeVnSbtkshGxcA==
X-Google-Smtp-Source: AGHT+IGWxF7f1yWAujS2u+KdxRxs6BCZ2vWSSXW9ul24NRbBrNVcf/bzFVrq/LcbH1iHWIudtU2p/Q==
X-Received: by 2002:a5d:5f42:0:b0:38d:e250:d962 with SMTP id ffacd0b85a97d-38de937cef8mr592405f8f.30.1739294919069;
        Tue, 11 Feb 2025 09:28:39 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:03 +0100
Message-ID: <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yh1X3NdDCdUsA9BLxtXchkn9/M7vIhxyVwRqzsjlThI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g60PKNni6dfU5BjvUnV/GlJm8Z/Gp+nsWrU
 9ZnwgOS2NiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOgAKCRDm/A8cN/La
 hbC0EACdDyfv4ruNFNCmp9zrJN9GhUKhduy0uDZfmX9xFwkj19yNB791PVovwlCxBtsVN+6iC4q
 rwLI3P4vdZ1EwlqCmVrmNdGoLnghwRNHwHALo5QxefOPT4NljAxW1vZtixroQfv2C49vYyO6W4P
 kJzYPrSQ5gCAhV9vK40Lrk3hKz6idlpK6fP6E452DnIlVkMEuBRhoWIYcW3UYiHeM8GZVGnhBCD
 gSJilnljJ5OTQH+GOh4JJ+ljp3eDNfLB8W4KHF0CAyQTUEMe8AcjK03WlL/wYkVKOkgcGkEcQp9
 BIY3F82Fe2CRnNyNNI0avHJK4Dow3qn7iDNJJpC3ovn48iYglF/d0jXmcEMhXhQpSbeKMeTqa7J
 fP6G9puoFGrvGncXPPVDyslRM/0C+t+9jrKuXcFKpUC6JEFDzD6J5ZEVwY4UiSURMnLq30q2O/b
 Ji2uLCAtXuMOhYX2lnsQA5d17uDRDdwUJp8XCH4Oz6Dnb2S55Fsz9tvBGlSUODkUiKV8l+xyrVc
 1dbrvgTF+WDlDaLoybOYZRNVsuxR6nnuPg843dEMXQ4KBAAvubECmtqd3Rp4YaM5ppqsxBeoFzV
 cuZaX5kv0Po8QUX3SAVM7K3Fpx7ZYg1fo5142KlYv+iDGalSNmwxlsLmgMTIAr8JL2LCqw+Y9jn uIY7Dp1qPMaPorQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_172841_460793_A78DD329 
X-CRM114-Status: GOOD (  16.25  )
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

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
 	struct clk_hw_onecell_data clk_data;
 };
 
-#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
-}
-
-#else /* !CONFIG_RESET_CONTROLLER */
+	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
+	if (IS_ERR_OR_NULL(adev))
+		return PTR_ERR(adev);
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
-
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
 	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
@@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.45.2


