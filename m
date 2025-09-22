Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A802CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 01:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH0kcIANYQpdYrJ+4fLx1mc6EkyYA+V45+fX1eNLgyY=; b=aMyhw3zh5r5h4iNUG3aPyozQLo
	Z6xAjtKUWxgtnlOi4sFePWMzVuIFiRRHxJgXTaPO6wpf9fNdHN4Gi4lRQ03pbeFofWxsGbD1FqeN9
	lYyuuWtZVO3uHlWk0V0YYLtK0RY2AjCnC2tBQax4FIKKG3hd+d2hO1izy7V3mYdyBWK9FtnN+6JBr
	eqMbXj3icA33izTtfsogIRaHROlMEojvSl2ILOKPzdVTxgAtVv6z3hvg5WDYMsuH+S6tAcG8FI7fb
	TzHjoG6eYFI213voU9JGQkmtIFYS3YW94pmfh4oimiZ7EAKR0JEgiVh2rgdIvkSCX7HzvErTlK0Sr
	PzolxkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VFg-00000008UZF-12eK;
	Mon, 22 Sep 2025 01:22:00 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0VFb-00000008UTP-1SQP;
	Mon, 22 Sep 2025 01:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1758504058;
	bh=DH0kcIANYQpdYrJ+4fLx1mc6EkyYA+V45+fX1eNLgyY=;
	h=From:To:Subject:Date:Message-Id;
	b=vfgidiCtedzfWY6Rf6nANv0rffGgYakYjgrmxeVkzJOH3P7iVAlZdXwdoXf1MwixR
	 Q84XJ57KZjYzvNBoTBsU81WYuD9TzxggbERw3A2z6yI0UEcfcZbV8YUuxM1DxzxBlI
	 a84Yamqi629Z2XadfySsrt01Q+SldXrQ/eb7bofY=
X-QQ-mid: zesmtpgz1t1758504056ta726d038
X-QQ-Originating-IP: qyExqdy1sQveIoLYmvNkfjq5s0h65cszYNtSFJabta4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Sep 2025 09:20:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17474071139763469020
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
Subject: [PATCH v4 2/7] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Mon, 22 Sep 2025 09:20:34 +0800
Message-Id: <20250922012039.323-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250922012039.323-1-kernel@airkyi.com>
References: <20250922012039.323-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: M1tjFO1fqc+0WDiZhGg+E3YIY9vFZWtMYby8sHj6P58TZfzMpsXHRKqp
	+N+pI3mAek2MS5eDsASBdXgWzfHaFqybvNBVm9d+7ry+gI9LsiBxERG7z4ScKqmRnD8rXkG
	pKrjybjwRbYm7qEsTYTRecoHs2sDTcmGAgjRMGPZkPM0Ma2o1mxtYTe3yWfEiBcBnOZbp0l
	qdeRudq7Odtva+uWZkcw0mRuudJDs8SWaqlFQRCkv8h9rlSQrmQVJ76lZ4lt0PEFyVunLZP
	lEtb+WawGOhvtYFuqwk3u8q0BB2R/8mfZAvvaGt6v9Fk8cqEykb51wG1lKZ0sPdUZYGRSI3
	aaYnO0AyR4eGHSiWmW2874ompw35fo4mgE8Xwb07y4SPqBfGD0tQTows5WWGpSDmPsKPXAw
	QsCz91QxHp+gZF7JXC3D3QMcFRCNT/WqOShHq+O07pr/V6nkDGxnPQ7HT8TzINvj93RUZML
	BREIsH5jtiPYZ8tkIAI1bt/nHucDX0/1cfz/Cpz9Mcz4ZcgAFsjygeL8PcAXLSUBvNa/f8c
	JqmhS+b6k9X6F0rvMd1zy0MpaG1EMTisIyqaOptDM6PyDgMF9DMExwuD1W4T8HGateUycTX
	OkyKQanioFkDL1nBSX/sjjt+u3lZ9SfAZ5gHT12mnoNgCxwqkeUsXN3NLp4YyQ2h3qprVcL
	J4ZY/Rc6XjCEPsi2UueLp2rMgB1ulHweqtGrLJEw2sjiNQRnz1CBghHGs+5WfwyENxh+0ax
	JSM86Goah3oWwfAE52kTItfzArpkEjAvcCTz2S93cvOqOHYnCMQzti7nsG3HvIvn6DvrdR+
	GXVzVeT2JG3ae0SCKqv0fSL9WcJ61zQ6b23+w8F5D6RD3Q/6edYFYKZjpt3W9SVRuY5rgqk
	YC4Uslk/KlkUrlZY47iPqRI/DhpfJr4UrQaRHuMlcC8uZ6MemLjDL8ahw8g0RjDjEZFn6Q1
	XdfVFrHatPK2bfrtAHl2IYCe2sFUpx+l5QMlJ4tVsOoOC4gvkxpR7tgG+i41+l39kvgfe1t
	/VfPxO0g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_182155_778949_BEB192BF 
X-CRM114-Status: UNSURE (   9.85  )
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


