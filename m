Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65701C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=; b=BLUE408SRUeBJxguuWh6olaj05
	gRZssvQSBfFZ9I5TNCHdrK7QBGvNdzUCwwai/cC7y/j+yiB/KXss9+z6oLVEe4zLWAvrXlgWF7suL
	wWdRY0dSSHD+tcxTSYrgPtJDiB5/R86UzSZWz8thDdvyyA5eeTnIkPd/9se1cqxgJwrEwRNTwx75o
	qkc/MfwfhHjCLfNYDsQ9GEtW3HgWe9eZhx8gkmKTZQqPBjmrSTy4xqyQ9PdoPAenvClTjqCyeKPMr
	DKEp7CRFvGKYjVX4PQDSHE5MmeXMnslzHIgHyvupctLo3pbctcLwJzev+EgrSicYkiVtlDtj/CcHe
	4d79JW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHe-00000004iK1-0pod;
	Tue, 11 Feb 2025 17:42:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu3n-00000004g1P-3o5R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:28:37 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dcb7122c1so3788768f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 09:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294914; x=1739899714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=;
        b=pH4t7sq4Y0TeOoc8wSeymrHIvLWRkUXSjdvDRlUWydnvJ1IFJaVVP3/mNsdg66BCrp
         3SicsHB8O4NqsOhZjf9E4xIEhbsM+Cx7w0Cy1RQGIw0LxZXOuZS/3hg/crWoT1/rEaci
         5+TR7dTQgCaM/DmMneGkVRutUKldGubeAKrLSiSHNI8tDGXqSSVYRhF4KzFP798lQV3L
         4IHQJfKIJVGhqZ5eo3uW9lCuNaJks3/qZpN7Wd3q/7zGDxk4a+rxE4H+FdbDEctHM/xg
         JuDXd9J42dxyeszymfVQc5kqdjdiLoclQmq7F8Jb3LZZfYzFro2NQ/3LgmSL2GcyC1li
         tbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294914; x=1739899714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDYe4zVCJHl1J7zmO8YwQPUsImFhukXxkzdj3E5Ja/8=;
        b=uCMlgfInszAD+E7fkV+2RQGq9Jvue5N9tRxIYA15ItJzOFjFzX0hiUsPaWoQlsuVEe
         xgv38WbQM7qWsr5UdUMsCQPFEBjEB3a3FQUZtDYbXGM7vmnVaZ6Ctv3fqU/OBIPY21s9
         EMR7IHfPhybeQikwLxfnuFtJPA5ctzeTlgxauZ0hgFQOFpPWWHyq3FKemtusJxEVFS9X
         cM98AZ5KYf1eNSA4U958VmlJVP5KwAg5WNmlZyeeZe2Kqt3E6DnDKs+Bp/lmxycW+FU2
         WBbk+Ykn4VCy0aicQTtUmMIp+IaNb+3PnPaOM4oqMjYgVXCWQ0QwaOfulxp6SsPjxgRl
         XpnA==
X-Forwarded-Encrypted: i=1; AJvYcCXqnQLj+n94LOGcgeQEt2AJPMnbAFVDi4r9CumDcocwXdKF95OXvz1LYaZmHa3tcA11+Sq4mKEGOP4ThIDx22pi@lists.infradead.org
X-Gm-Message-State: AOJu0YzzYgu20SQ9mvsz12WpBTJq/G127vmHPDnp8J5NtJDTtg9Ix6qA
	itpMMJYCiKQeBxqQzeiTbsjELEpnF4dkTWpO5DxxBduuumzOfGCsuJ3qANfMA5A=
X-Gm-Gg: ASbGncu37qECy5TLzpfHpIqUsIc8nbpRCQOgPe+E0x1sdS3AVk9imO5/gkepfyc1rRw
	/KCV645QkvzlcOJfQwaoCxZvYMSRuO0Ueb++BETVQQZRRD/AHxXam6FKx8oH07MKWFEO4uDM/eV
	NuLODxoltUUkNN6wULDc40v5daew7n6M4pTEfCrGrX8STNQLHY8P6TYJEzw0vtF+rn9cFxgIRlf
	mtF/qp8rjfv0ce2j5xVw+NxUPy7Gy8NlsF9olPvf5XLU8v9Ak1as5VOm/aBArVFKbkLXlJlThZ4
	N0UUSwy+DX2Fuq4ZSQ==
X-Google-Smtp-Source: AGHT+IHFkzaOXapiWN4/SxKHetf09scMUxofFapehDhsYxM6Mf+yjBALSpgOHKp7OlGFg6yNQWYZRQ==
X-Received: by 2002:a5d:5f8b:0:b0:38d:cf33:31a1 with SMTP id ffacd0b85a97d-38de92887dbmr644098f8f.23.1739294914574;
        Tue, 11 Feb 2025 09:28:34 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:34 -0800 (PST)
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
Subject: [PATCH v3 4/7] platform: arm64: lenovo-yoga-c630: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:01 +0100
Message-ID: <20250211-aux-device-create-helper-v3-4-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=qoSrX8iU6ZsOmDdt2vcxpMmdn8e+H5V+wLsqMb+WXTw=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g4/dIaY7N0MjawcCtYO6owHszhAtyjcgr7D
 3Gd3AdMv6qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOAAKCRDm/A8cN/La
 hR9uEACtV/xHFmThUeYWuRuZeLIZDjRSGPPZEm0NF1IUEyqMa+/w0GkdSU2I/GhBRDekpL969e+
 flE7DvZyypim/I0FZ9+E91BhWYhmSRaSfH/9/AKcVVKiogJILw22nAQLwHQAU4pI9XrwljjuAbt
 MSgI6Qhm5jlq1GlYCQ/hou9AbHVR9B2Oe4/YFrBkUNxEblpZLIcnrsPVO2FY5baXHpZvJ2k5CAZ
 MSpgdClj9yIkdl580XYiAPYYvwvjElVhwesa1zzt/XSJ1Idm/YRnZRAjDFe/uief6LxhKmzn8Cq
 PTKk6exeDtcsIhy2ONXg2237HCo0rho1EMRdeb/E1B5sDTqLMLKfHFYyvFYva/imfWDg260QPE8
 SB0ucc4PEGbCTcI28Hh+JdOrNP9ChRaJgfsOqR+3qLLQgWYBJ5ScIXYmp0UW91AvMrtqrwf9ySl
 UBWBVpazEhLxSaE9ItQoc2xzaUOqL71se/uZnoCaqvztP8gDdl+8GXSP2/fps5dhBhhCYQi0gi2
 n4q1VatCARnM9Gq2nM8qG9+sE/r+6AOa9faLGrXdf3ZP5y7Z1f9I1TqXigFb/dco4k7vTWAFo3Z
 /tSZVYtq1SnEy4BRJqk9nLxSPeko3sbBy6g+ly8JaELAzWpBynghDBX7iUt8qUwY3k22TI1x6Zi chvp+TE0JiJbh2Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_092835_965957_6E6B3CB7 
X-CRM114-Status: GOOD (  13.99  )
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
 drivers/platform/arm64/lenovo-yoga-c630.c | 42 +++----------------------------
 1 file changed, 4 insertions(+), 38 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 1f05c9a6a89d5ee146144062f5d2e36795c56639..921a93d4ea39ac54344cc964e2805e974cc7e808 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -191,50 +191,16 @@ void yoga_c630_ec_unregister_notify(struct yoga_c630_ec *ec, struct notifier_blo
 }
 EXPORT_SYMBOL_GPL(yoga_c630_ec_unregister_notify);
 
-static void yoga_c630_aux_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static void yoga_c630_aux_remove(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
 static int yoga_c630_aux_init(struct device *parent, const char *name,
 			      struct yoga_c630_ec *ec)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->id = 0;
-	adev->dev.parent = parent;
-	adev->dev.release = yoga_c630_aux_release;
-	adev->dev.platform_data = ec;
 
-	ret = auxiliary_device_init(adev);
-	if (ret) {
-		kfree(adev);
-		return ret;
-	}
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
+	adev = devm_auxiliary_device_create(parent, name, ec, 0);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
 
-	return devm_add_action_or_reset(parent, yoga_c630_aux_remove, adev);
+	return 0;
 }
 
 static int yoga_c630_ec_probe(struct i2c_client *client)

-- 
2.45.2


