Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B52D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=; b=fmDTY+/bkeGA1a7ctuYyGWt5ch
	qGuV0HydJvHyeuWvhexORXPhuv8DZGqGaV90LiUQrraURgPSFNDAA/VSZuG7B/WS4BM8l5nQM9esb
	ZrSCqXGI+3pcZnkzN2/tUIOQSbgVh9YlNlJibp/rDAhYHQcMmO9KaFuF0GWG+bEqvg4mCeiVFYpXZ
	x+9WsFltQrCbA5Obkr3Aw5M51Kc3TCWFhVkGXvHsemxf9bNEveL4QozWylLnWwlbdC02WVaj+Z0ad
	JCdbm1gGmhLrRfHGmrk3Ga9rkUHazG/P/0mdjHPbvtqBfqLq1ChT8vRNiG33WLqymeNIAH56ThzR0
	5QwcbNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQUG-0000000CQ4s-0i6p;
	Mon, 08 Dec 2025 01:56:28 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSQU5-0000000CPm9-0AfX;
	Mon, 08 Dec 2025 01:56:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1765158934;
	bh=26BNys9MtzTfRweLMQzeXqwDzhVXLyZIh9kJ9w6YpoA=;
	h=From:To:Subject:Date:Message-Id;
	b=m5OfjLA/w4B0AgiE+5kPJ+F7EcQ7/5Hpu3r+VrFtmG3K7mtbhNa5gIpKTxVU5H0km
	 L3MQbu5j12ZvoveBAefKlffdyoDbJDRizA0yVk8MpVNKTjXs4uR+jHT9layYD3MIPL
	 Pp/5f9psdNDlET0PXRC289Clh71rknZS/YSGfxX8=
X-QQ-mid: esmtpsz19t1765158932t5038dae8
X-QQ-Originating-IP: A0v0FaGYKIPVoze7Vm4qC1xZ0nc+XoFwr/1hG633FZU=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 08 Dec 2025 09:55:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5449390531767649988
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
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
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v13 05/11] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Mon,  8 Dec 2025 09:54:54 +0800
Message-Id: <20251208015500.94-6-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251208015500.94-1-kernel@airkyi.com>
References: <20251208015500.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N0NSl6AiU37htVjSHU4Mn06OMjO1EtB0Vpbb9vGsAr9bDPFns9ex1trj
	kW52m6WVbvC2h+PkhIrUn1FfFYmtTppTnFdjyr9Ohw0YYMeOPlDsInLKngHSqKohF3HmnUt
	tf0Ik9GvVX6dYno5sNBEGYAC9P+l580j4TTL89nRnvCkjJQrn/+go7wi6VScBNP/C1iWcsu
	aC/RVz1bIVyQCIXZLTUx58HRR+FPE20MCA9ylsTbz/zk6Q3pNKQs88Od8FAnr8BTWLZotuB
	XwlJisqmKI9j75ghswOXNhG76GGdZ4jYhHBPs58W4QRoVtky9/BVk8pfAY3NwRhvghkd6py
	0wpxpuTlAwtOR86UPhoClaFOw43AN4ftzw+QVricLYGENRsYuGEB8K0WQIMmqPwPJ5EW8c+
	nUAFKUwVZmPUkhYED4OvCaExotIoTHqzMIslksSmX5Z4jJLacpl+xcO5Jt+ny7SNnQzFIuG
	t6xEyfpUp4x/BERoqW95sVh9oStb8n9yg+TxiXTQtPv5UCW8cbL7kz11GNaVq2qRVCZiUt7
	b5khRikb4ak1C7vJ4N0fCFx4TTGnpoN9w/ih65GmESU+rIBJfb2ZElMtT/OtEFuuxQTWHFb
	NyLU6q1mS2tmc+Bx0Osq9oST7y1YGDyc6wooJIhl9XLj9GAwYtwgOa4EYz4IUuhNNcS3Az3
	Kk5mThKtKOtf40PmjCJGdNLCBxPhN5OEEwXokVE302Ld1jTyg36MtMYtWKNYpTwGkzgsJIj
	t8Lo/lQjf8XhBEnf4wzKoxpCr3QrxzdL+8UZo5zfdexHzfF8Wiy7tBUBvryQOLt0jbdpS3U
	L2cSz6+vXkLyX2fbOxQWnu8txarMDP4wPUnFEcMeIAg9PPykk9RfTXCIFO0WylaQtx0TZcb
	zJGJQICzJry8r3SYGtCSg+g/HZfUpV9IsJvR+tVk6Cqa7wW7ggdAkcbV7Mbprvigc5ycbpD
	dsgjWoDWIOll90qlARWl5XbLTjcJn3MLTzMABfIdsQwvP0twcIDYI1cNOUXZfhht9EEeLTA
	puhyjFFw==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_175617_796291_298B8120 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 SoC integrates two USB/DP combo PHYs, each of which
supports software-configurable pin mapping and DisplayPort lane
assignment. These capabilities enable the PHY itself to handle both
mode switching and orientation switching, based on the Type-C plug
orientation and USB PD negotiation results.

While an external Type-C controller is still required to detect cable
attachment and report USB PD events, the actual mode and orientation
switching is performed internally by the PHY through software
configuration. This allows the PHY to act as a Type-C multiplexer for
both data role and DP altmode configuration.

To reflect this hardware design, this patch introduces a new
"mode-switch" property for the dp-port node in the device tree bindings.
This property indicates that the connected PHY is capable of handling
Type-C mode switching itself.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

(no changes since v5)

Changes in v4:
- Remove "|" in description.

Changes in v3:
- Add more descriptions to clarify the role of the PHY in switching.

Changes in v2:
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.

 .../devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
index 91c011f68cd0..83ebcde096ea 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3399-typec-phy.yaml
@@ -51,6 +51,12 @@ properties:
       '#phy-cells':
         const: 0
 
+      mode-switch:
+        description:
+          Indicates the PHY can handle altmode switching. In this case,
+          requires an external USB Type-C controller to report USB PD message.
+        type: boolean
+
       port:
         $ref: /schemas/graph.yaml#/properties/port
         description: Connection to USB Type-C connector
-- 
2.51.1


