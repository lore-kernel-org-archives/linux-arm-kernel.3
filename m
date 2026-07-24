Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BF5C5321A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUMJYK8D9vfLc1s2BPtc4WbrVU9XQ/XfambFUe9PKZE=; b=Tc/s6vUb+o6A8ESqKIWKUbZOnQ
	rLV824fhpMxvSfLfqHHN4Q9YYo+UouRVYfjR6Ts1CQy66kXBfUwsSDGb2bGJPWdpFK85tpnLkmdkS
	trGgcISGekdedKg4yLozUfUdolbVrMWGepQ6ncbKDXcTTZtIMOeeCkbIweOcCmZDYZ5jHt7DjoIsM
	Lj4mb9YNZAA9MAA2nAavFu84zC61jgnRlSkgi5Q5n5JmIZeRJfoxmZCNmPjRkRNN+dRPBPYJJwyQS
	7l5h9CGGFlFXoCOzmc6SAUcL8A7mWmkPWrCt+E8VYM8PIYijcXwRsJKfugPTKGYGIWWRW0sNdDWyg
	CN1+GB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFf-0000000H0jW-3Ubz;
	Fri, 24 Jul 2026 18:04:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnKFG-0000000H0EZ-1O6v;
	Fri, 24 Jul 2026 18:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784916209;
	bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qqQlg4s3J0va/64Bui7TTIsrOZvhbLNOrY3hZVHTVZuKP2kF8rH2Ke+9oowTJI+Z9
	 6m/K4OSbDyVmoByfU47LcuTjkN2LWnEycrBUyoA5vbfXltZUQji8vStfBAFHXB4QLZ
	 XJTlI7PNqOFntSDbf3RUchFyjVK9gVcQ2qkdFg5CfNXHKau4MRfXAhLKeJsE0arn1a
	 3NF6rK4BMNZVtcl5HQkeKry1M2M8TJAqO9c3fQVkSsJ12CKom4/YCWrdbBmf3bLNlZ
	 Txj0eXHjtj0twrGm1aL+mcNk3PYbqew0BeT4WTMbfIAHqEjcRFR5fj4A4+9+WVP/gM
	 h8AvZQkithQ8w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D10217E028D;
	Fri, 24 Jul 2026 20:03:29 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E777D48003A; Fri, 24 Jul 2026 20:03:28 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 24 Jul 2026 20:03:30 +0200
Subject: [PATCH v6 08/16] drm/bridge: Add out-of-band HPD notify handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-synopsys-dw-dp-improvements-v6-8-041d99a19c4e@collabora.com>
References: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
In-Reply-To: <20260724-synopsys-dw-dp-improvements-v6-0-041d99a19c4e@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=9OEEVTGH6CtYBorsugsyey8Z+5Bz4/YUYRXLfK0S0LI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpjqPCLO1hqgdLcvIm1J1/HjibHgWKUkisyL
 nCXYizti/yk/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqY6jwAAoJENju1/PI
 O/qaTxUQAJaUNfAmI1AqFkIK8zpKkq1v+firS2sTHl1ebp8PblkEfrkjZQhPvH9WH6el3hi+zP/
 Hz8YI7w2o8sG8wHfUppw0AhajM0v2ZV05OpQk+5PAQ+qQu3+YBp/ov52XbpZYJ3RDY+NCQIlcLL
 pnXCmXynQOEtNtrseiy58JCRlTAVN9ilSB1BTLF5BPe2c6K/yrk6nvBC6r6gV0wBXi5fInob67q
 d7xkRvvdTABTLWHqZJdeKr5MpMp5cbH4FItE2ebLMTxGXuoWsJYQeb2B2z+P/EcyxVIri39OkFL
 /Zj3dNUIet6DIIUpQYyP0ht+TxI+Z4VPAXYwVS8gSTlqCnToRCU1Po5fgVwws11n6MVxAjFhGYi
 ONQKNQBlQtVyNWg0l+SmVEcnwYFbNP2rIlUB4rbM8ImmWTNNLW4ae4vigZ1pKofd5B1TMI+3MC+
 tf/4PnZBK36wkV16HJ2SpD8HBqG4HU7hwjOV6KpnwtOUE/BwxQlU2zGxri7MsgQwnkA06DOVmhD
 GtU69uluKutDNKzSkw6fzmE8QTnvGKuOoGP/2BAbybA55y8WAK3165w0vXnIHTAcuoMYO29zdE8
 Ee+ftE6RYBkrS/oM+UVQud15BQiAj5wsPAaHlIudev52KgM/c3imSsxIucDIe0iOa3YInjdkhmn
 DTNPajLm2bbPLYGKvU1oj4A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_110338_564207_ACBB3C62 
X-CRM114-Status: GOOD (  14.33  )
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

For DP bridges, that can be used for DP AltMode, it might be necessary
to enforce HPD status. There is an existing ->oob_hotplug_event() on
the DRM connector, but it currently just calls into hpd_notify().

As DP bridge drivers usually also implement .detect and that also
generates calls into hpd_notify, this is a bad place to force the
HPD status as the follow-up detect call might force it off again
resulting in all follow-up calls to the detection routine also
failing.

Avoid this by having a dedicated function for OOB events.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++++
 include/drm/drm_bridge.h                       | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 8b54069fa53a..632cc3ae3b54 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -180,6 +180,12 @@ static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connect
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
+	/* Notify all bridges in the pipeline of hotplug events. */
+	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
+		if (bridge->funcs->oob_notify)
+			bridge->funcs->oob_notify(bridge, connector, status);
+	}
+
 	drm_bridge_connector_handle_hpd(bridge_connector, status);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 3ac84ed57ab2..f38010d2edd1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -540,6 +540,20 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_disable)(struct drm_bridge *bridge);
 
+	/**
+	 * @oob_notify:
+	 *
+	 * Notify the bridge of out of band hot plug detection.
+	 *
+	 * This callback is optional, it may be implemented by bridges that
+	 * need to be notified of display connection or disconnection for
+	 * internal reasons. One use case is to force the DP controllers HPD
+	 * signal for USB-C DP AltMode.
+	 */
+	void (*oob_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
+			   enum drm_connector_status status);
+
 	/**
 	 * @hdmi_tmds_char_rate_valid:
 	 *

-- 
2.53.0


