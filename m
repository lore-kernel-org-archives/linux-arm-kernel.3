Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F85CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 03:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=; b=Ct7xg3a/n6BpYnjmWKouPmLwa9
	/16Ync1Qp4EsOsKYx6gkzI5mROaNRueGRT3PUt2vitdUvBp4FgRcCaOtdUUwhbMMXG+OkUM7TrH1f
	FId4QaPLv6CTX3hJ+P9u8S0bHXyoLl1KzgkkduHavNjyvxCoDVOvqfQV7JGaEemjTxh2/6ApIUR3k
	NhiXw3J+yuWaN7Y1BJB8OSYDMalqbhQu+rqAIMBLQRP8nd//KXndrUz5CBJpRajpNXtkOahYWvY5g
	A0aSBqX7uuRB9XlfHX6+QGf5aA+AhG8QiuBa9zoMYZQGL62QRSPSVVNg10NFFbr7zphxq3EgUT1L3
	4fBmOFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QMw-00000009k5E-0hgm;
	Sat, 11 Oct 2025 03:34:06 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7QMp-00000009jon-0vDq;
	Sat, 11 Oct 2025 03:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760153572;
	bh=YHT4Mxhe+zSodIVHd2qzlGnysBWHBxMufel41tGudBs=;
	h=From:To:Subject:Date:Message-Id;
	b=eAZdjRzq8dkC8MjRwwfEFHoqMzsD6rEzVUjLRaDrh3WTlcfu5gRaKXW/J4/VPsbxY
	 s+EbWmjXhHJXvLwe3y3UGmV8l7IjobooxXsjH6s5AjPXTVTf3o4u6CVJjDW4XfSHdF
	 xMIwWQgusXouVhDejSIW1Yxg/fYO1t1rHU62baOw=
X-QQ-mid: zesmtpgz4t1760153570tb665ba7a
X-QQ-Originating-IP: N1HyOBHa563KXTPq0mhcMxR81EsdSSnrp/MTia0/DuE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Oct 2025 11:32:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4803160291737759115
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 2/8] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Sat, 11 Oct 2025 11:32:27 +0800
Message-Id: <20251011033233.97-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251011033233.97-1-kernel@airkyi.com>
References: <20251011033233.97-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OYfszGn+r8XCpqqN+w2GgGEF2CAPiXq0PPGf0j0em/A4iVQKmhSxMR0O
	kWVLDKBoQC6BB1KyCszaOX3n5yvKvegMJNJ7zFGdn+tdpp2OCW7ZiQF+e4rjH66Ty1dBF2a
	JZEvM+BrVLt/5ZpFDAnfbhWb+DRVk9thoLGJ5yQn9ZilY3hRCkHryFL3aoivIthCajF4cUh
	C+7B0gqdvm5MzmXdAGc+1As1FXTs3qFT1tGB2sWAmAquTst/5VFfZLZM8warECUPI7wk41D
	QXPQ+WDP3/jkk6d7F4sRPJDinUk7FZfRc3eRb3N+gsXv27Zt5zuYKx35+EGUggKtuU7wAig
	XNfUOXWXoMlOO2KffH9h9O75Ufr5as1an2ZX3B4l4O/qF6ic+oB4gSeFZYXK1kx0d7InEY/
	d/75VkTgaBzNOjJDZ1ttErMwHT4ULNhJyWbAWQTnxF7JoOQcUSZZz0AG2VQKEKaPJazza/Q
	1uTVQBVT7paIQXURFA9wZuSCSZiHw+3YPqzDVdHDmZvnNSzf/JzVWE6TDTsOCr48qV28Jzq
	BVBrul5Kwd/IEfF0qm7Wkm9tWYixUaFHKVu1nggTWYRC4hvho4Q2ianOCYNxCJ70qQxsnwZ
	Eop/nepfVkrpO5s/1YyzfwjoEmM4TFr/6qP5ioFngrW6iAI5IP60hzOgnD46RSzr7Qkxj7o
	PjIlp+JNXo8bc8ke7L/VEUE8VTx4H7Co6a+g4IZUis6eKzM3qYYUvKNlQ8M/gsriEa5WEAo
	JX2h3y3Dr1CwRWWbDGBZvmGgfJ88uTxGf6JSVhUyORUAmtSt0B4MFpSnzvL+CWK0ps9NM1Y
	flDIdyXv33l8Aw3EyH2UuvRhrFjKykthzSxc21KvMAO2Jrp3LTJf2IIoTxW6lmzrvwIDU0C
	oYWul9zlAcFQjDGRnCm3e9EbGLDpZ242feY1dzFRQNWOwENapbR0EXOEvQZEMwG8PRcyAXh
	GxUSPviSacJ7Jiq049+CICZ+Bjnp/8erZZn6zlpKgherQ7TZIqQY/2Q5qR/br+XnXUEQ=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_203359_779209_58239743 
X-CRM114-Status: UNSURE (   9.29  )
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
2.49.0


