Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B38C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPPbtqsuzK5NYYNdc0zpLwLBjiWgWtV76EEhJ0f/yC8=; b=gmlszw08rfuJ41BLgtTkF6HcrM
	tqKFN7dnwSzV2tTbyWFQz24yic4UelIEBN3y0TwlKma8NCfqKm6H4G9f+JCQRkpjNoezSVp0tv6Ki
	7EyTbCEFEeE0F9CPxuJAGVGcCpbXbYFKnKkH5PdqDm1gi7Xz57EYnxAUr3zdLNk0IYKLVXk9tVT1Q
	G6HKiXcxIAydZm3QPu2RPJIvOUNRliH6PcsSjvon94QoprDv6hYBMKfWH9i96bLfTs3iuvI8BEcex
	J8gMUGqLLt2I/IGHUxFMUwZJvpw84FcCAhmFMbdcQLAZkLhc19WC8uAV4aC07s/ndKaqdpUdVHkJJ
	YIZY3BOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qT7-00000007cXP-007B;
	Wed, 16 Apr 2025 00:17:33 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qES-00000007Zez-2MHD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:02:26 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2899549b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761744; x=1745366544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPPbtqsuzK5NYYNdc0zpLwLBjiWgWtV76EEhJ0f/yC8=;
        b=OlW6Abrob3N0C0eqMpbE6dQRHo5zftEyHxjO7pYnrRSyaqaPxJML559eO+EPF5gVO8
         k1Yil0OV7lrYmqyA2yNkXm/ULOKUBv2SWZjUXXiZEWbmHIZjPPYu5C+8N+DLXFTEkh8A
         5FL9ShIxUOynSIcRksoD979ZoBxQ4Fc3GSIG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761744; x=1745366544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPPbtqsuzK5NYYNdc0zpLwLBjiWgWtV76EEhJ0f/yC8=;
        b=Eqho1X7Lwtjj8HRSMcNROhoVcGX1oAoRSD4bHtwnB7q/MRj1A7BWuMQD+P/NlID5DG
         q/0jWVfdmTEqttvjT6Web/cP+cak+fwjvzk5hDmKi1GdaG27tZ3Fq4X9UajBCN6utL1d
         0e/kEKF34xn/5Nc5GMSgpvYXuY9j+qsPKLKmb/RhYWlSgz5vTVzj+X1Mx/uYqD38EEZ0
         Zio9/oWP22OqFQXAU9iu7Npcw6Hm1lhywW6kIjV8FQtob5ZX00hLNcEsVPatHzOpwhnZ
         5FeXZrrhTeFVzVfYp8PHaewP+kVLTCoG77IrJXnYWcrNfcmQBRIX9NnIYszEou2OwIFI
         9vrA==
X-Forwarded-Encrypted: i=1; AJvYcCUcQ18U40020YR6IYzWZA3zkqSf3274fJb50USNrTlqqKB294rdOMZnyppB//GWv5sNn6IShz+nkYH4k1Z2LyKD@lists.infradead.org
X-Gm-Message-State: AOJu0YzhlfBqtiAKbcgkDq4MWMB8bLUoQ9t1SRKexuUgMCsunvA2wsJi
	0YtaOsg4uwQoYCoPcCTHx6XRb25xVamhFmBgvlYyFo063G1ksJiFDLMPewLpyQ==
X-Gm-Gg: ASbGncu8k98Onf0ViHurOPYt2DPEWvNjEaVArCCmenoLxWF8QG/WtPo3ScOY38mmp54
	U00qS9ozgdWjLdGyUFvv1262PEP2i8aZXcW2EQnRpYnA0q4DrUmxPVG9boIpqQ4x4UCjtaev5JF
	fhJZgAuIUgp+FjCFlMcK7xWutJ6ccEXos3UNldCWkGnSt1zpeosIiu+q748dPhiaGS7BcC8oCTv
	9jbnCxxQuhlY0Z7fjYIcjgwc6aLTpf6YY8vo2UmO7jOLG59+5FGtFnJW3TB3JmjxMMjOe4Z3RI8
	UyyNNmzO1VV0z4jOO8ctYDQPZwcWvMYiW8Rns7cYr6ObjqZ75tJ1MvovON1bEhtDnM2GSVUERGn
	SLg==
X-Google-Smtp-Source: AGHT+IErLrf4vSn8BQ0x8FQOElvg38uwkXskYXgtvXn9GTzRRW4rhFc/IJBl//1/RAJQqDgW15Gcyw==
X-Received: by 2002:a17:90b:5108:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-3085ef36625mr1741934a91.19.1744761743673;
        Tue, 15 Apr 2025 17:02:23 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b0b22217eebsm117742a12.67.2025.04.15.17.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:23 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 7/7] platform/chrome: cros_ec_typec: Support DP muxing
Date: Tue, 15 Apr 2025 17:02:07 -0700
Message-ID: <20250416000208.3568635-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_170224_604702_6FD02A2E 
X-CRM114-Status: GOOD (  33.29  )
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

Most ARM based chromebooks with two usb-c-connector nodes and one DP
controller are muxing the DP lanes between the two USB ports. This is
done so that the type-c ports are at least equal in capability if not
functionality. Either an analog mux is used to steer the DP signal to
one or the other port, or a DP bridge chip has two lanes (e.g. DP
ML0/ML1) wired to one type-c port while the other two (e.g. DP ML2/ML3)
are wired to another type-c port.

If a user connects a DP capable cable to both usb-c-connectors the EC
likes to inform the AP that both ports have entered DP altmode, even
though one of those ports can't actually display anything because the DP
lanes aren't steered there. The answer to this problem is to look at the
HPD bit in the EC messages. The port that isn't steered for DP won't
ever see HPD be asserted, because the EC hides HPD state for the other
port. This isn't a great solution though, because some EC firmwares
don't even signal HPD state in the message at all. Oops! And it really
does throw the whole type-c subsystem for a loop when the port has DP
altmode present but it can't be entered properly.

Let's fix these problems by doing two things.

First, we'll only allow the port that's steered for DP to enter DP mode.
Do that by checking the mux-gpios whenever we see that the EC tells us
DP mode has been entered. If the mux isn't selecting this port, remove
the flag from the message so that DP mode doesn't look to be entered.

Second, inject HPD into the EC message when the EC has busted firmware.
In this case, DT authors add 'no-hpd' to the typec node (essentially
only on Trogdor). Listen for HPD events from the drm_bridge and read the
mux when HPD is asserted to figure out which port actually had HPD
asserted on it. When the port state is processed, check the bit against
the port and if DP mode is entered, i.e. the mux is still steering
toward that port, check if HPD is asserted on that port and inject HPD.
This is necessary so that the typec framework can update the HPD state
in sysfs, and eventually call drm_connector_oob_hotplug_event() from the
DP altmode driver.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      | 115 +++++++++++++++++++
 drivers/platform/chrome/cros_ec_typec.h      |  14 +++
 drivers/platform/chrome/cros_typec_altmode.c |   2 +
 3 files changed, 131 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 27324cf0c0c6..10079129645d 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -427,6 +428,41 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 	return ret;
 }
 
+static void cros_typec_dp_bridge_hpd_notify(struct drm_bridge *bridge, enum drm_connector_status status)
+{
+	struct cros_typec_dp_bridge *dp_bridge = bridge_to_cros_typec_dp_bridge(bridge);
+	struct cros_typec_data *typec = dp_bridge->typec_data;
+	struct gpio_desc *mux_gpio = dp_bridge->mux_gpio;
+	int val;
+	DECLARE_BITMAP(orig, EC_USB_PD_MAX_PORTS);
+	DECLARE_BITMAP(changed, EC_USB_PD_MAX_PORTS);
+
+	if (!mux_gpio)
+		return;
+
+	/* This bridge signals HPD so it must be able to detect HPD properly */
+	if (dp_bridge->bridge.ops & DRM_BRIDGE_OP_HPD)
+		return;
+
+	bitmap_copy(orig, dp_bridge->hpd_asserted, EC_USB_PD_MAX_PORTS);
+	bitmap_zero(changed, EC_USB_PD_MAX_PORTS);
+
+	if (status == connector_status_connected) {
+		val = gpiod_get_value_cansleep(mux_gpio);
+		if (val < 0) {
+			dev_err(typec->dev, "Failed to read mux gpio\n");
+			return;
+		}
+		__set_bit(val, changed);
+	}
+
+	bitmap_copy(dp_bridge->hpd_asserted, changed, EC_USB_PD_MAX_PORTS);
+
+	/* Refresh port state. */
+	if (!bitmap_equal(orig, changed, EC_USB_PD_MAX_PORTS))
+		schedule_work(&typec->port_work);
+}
+
 static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
 				       enum drm_bridge_attach_flags flags)
 {
@@ -435,6 +471,7 @@ static int cros_typec_dp_bridge_attach(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs cros_typec_dp_bridge_funcs = {
 	.attach	= cros_typec_dp_bridge_attach,
+	.hpd_notify = cros_typec_dp_bridge_hpd_notify,
 };
 
 static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
@@ -452,6 +489,11 @@ static int cros_typec_init_dp_bridge(struct cros_typec_data *typec)
 	if (!dp_bridge)
 		return -ENOMEM;
 	typec->dp_bridge = dp_bridge;
+	dp_bridge->typec_data = typec;
+
+	dp_bridge->mux_gpio = devm_gpiod_get_optional(dev, "mux", GPIOD_ASIS);
+	if (IS_ERR(dp_bridge->mux_gpio))
+		return dev_err_probe(dev, PTR_ERR(dp_bridge->mux_gpio), "failed to get mux gpio\n");
 
 	bridge = &dp_bridge->bridge;
 	bridge->funcs = &cros_typec_dp_bridge_funcs;
@@ -662,6 +704,77 @@ static int cros_typec_enable_usb4(struct cros_typec_data *typec,
 	return typec_mux_set(port->mux, &port->state);
 }
 
+/*
+ * Some ECs like to tell AP that both ports have DP enabled when that's
+ * impossible because the EC is muxing DP to one or the other port. Check the
+ * mux on the EC in this case and ignore what the EC tells us about DP on the
+ * port that isn't actually muxed for DP.
+ */
+void cros_typec_check_dp(struct cros_typec_data *typec,
+			 struct ec_response_usb_pd_mux_info *resp,
+			 struct cros_typec_port *port)
+{
+	struct cros_typec_dp_bridge *dp_bridge = typec->dp_bridge;
+	struct gpio_desc *mux_gpio;
+	int val;
+
+	/* Never registered a drm_bridge. Skip. */
+	if (!dp_bridge)
+		return;
+
+	/* Don't need to override DP enabled when DP isn't enabled. */
+	if (!(resp->flags & USB_PD_MUX_DP_ENABLED))
+		return;
+
+	mux_gpio = dp_bridge->mux_gpio;
+	/* EC mux is required to determine which port actually has DP on it. */
+	if (!mux_gpio)
+		return;
+
+	val = gpiod_get_value_cansleep(mux_gpio);
+	if (val < 0) {
+		dev_err(typec->dev, "Failed to read mux gpio\n");
+		return;
+	}
+
+	/* Only the muxed port can have DP enabled. Ignore. */
+	if (val != port->port_num)
+		resp->flags &= ~USB_PD_MUX_DP_ENABLED;
+}
+
+/*
+ * Some ECs don't notify AP when HPD goes high or low because their firmware is
+ * broken. Capture the state of HPD in cros_typec_dp_bridge_hpd_notify() and
+ * inject the asserted state into the EC's response (deasserted is the
+ * default).
+ */
+static void cros_typec_inject_hpd(struct cros_typec_data *typec,
+				  struct ec_response_usb_pd_mux_info *resp,
+				  struct cros_typec_port *port)
+{
+	struct cros_typec_dp_bridge *dp_bridge = typec->dp_bridge;
+
+	/* Never registered a drm_bridge. Skip. */
+	if (!dp_bridge)
+		return;
+
+	/* Don't need to inject HPD level when DP isn't enabled. */
+	if (!(resp->flags & USB_PD_MUX_DP_ENABLED))
+		return;
+
+	/* This bridge signals HPD so it doesn't need to be reinjected */
+	if (dp_bridge->bridge.ops & DRM_BRIDGE_OP_HPD)
+		return;
+
+	/*
+	 * The default setting is HPD deasserted. Ignore if nothing to inject.
+	 */
+	if (!test_bit(port->port_num, dp_bridge->hpd_asserted))
+		return;
+
+	resp->flags |= USB_PD_MUX_HPD_LVL;
+}
+
 static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 				struct ec_response_usb_pd_control_v2 *pd_ctrl)
 {
@@ -682,6 +795,8 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			 port_num, ret);
 		return ret;
 	}
+	cros_typec_check_dp(typec, &resp, port);
+	cros_typec_inject_hpd(typec, &resp, port);
 
 	/* No change needs to be made, let's exit early. */
 	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
diff --git a/drivers/platform/chrome/cros_ec_typec.h b/drivers/platform/chrome/cros_ec_typec.h
index 090f8f5c0492..b4b331aa5dc7 100644
--- a/drivers/platform/chrome/cros_ec_typec.h
+++ b/drivers/platform/chrome/cros_ec_typec.h
@@ -6,6 +6,7 @@
 #include <linux/list.h>
 #include <linux/notifier.h>
 #include <linux/platform_data/cros_ec_proto.h>
+#include <linux/types.h>
 #include <linux/usb/pd.h>
 #include <linux/usb/role.h>
 #include <linux/usb/typec.h>
@@ -88,6 +89,19 @@ struct cros_typec_port {
 
 struct cros_typec_dp_bridge {
 	struct drm_bridge bridge;
+	struct cros_typec_data *typec_data;
+	struct gpio_desc *mux_gpio;
+	DECLARE_BITMAP(hpd_asserted, EC_USB_PD_MAX_PORTS);
 };
 
+static inline struct cros_typec_dp_bridge *
+bridge_to_cros_typec_dp_bridge(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct cros_typec_dp_bridge, bridge);
+}
+
+void cros_typec_check_dp(struct cros_typec_data *typec,
+			 struct ec_response_usb_pd_mux_info *resp,
+			 struct cros_typec_port *port);
+
 #endif /*  __CROS_EC_TYPEC__ */
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 97ca4cfabbc0..10d21da592f1 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -82,6 +82,7 @@ static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 		if (ret < 0)
 			return ret;
 
+		cros_typec_check_dp(adata->port->typec_data, &resp, adata->port);
 		if (!(resp.flags & flags))
 			return -EINVAL;
 	} else {
@@ -147,6 +148,7 @@ static int cros_typec_altmode_exit(struct typec_altmode *alt)
 		if (ret < 0)
 			return ret;
 
+		cros_typec_check_dp(adata->port->typec_data, &resp, adata->port);
 		if (resp.flags & flags)
 			return -EINVAL;
 	} else {
-- 
https://chromeos.dev


