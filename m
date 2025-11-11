Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DE0CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1fj6I5WadX9tXddUihY9i9o+TqzOQO5XPHyy3i2XmCM=; b=dXuk7jgqIbVIhYMt5XG5dWnIaP
	M2gvZQV4CVnwEw44A/GVl0sB0vlKw50McDETRk9tHvTxSEsTmlPSYGCmbiS3hrQNw9uejlXEsORQJ
	xcDZknQI7IzvK9sowjPtBFEKUq1QqatiMgxUXibzN+aRfI+zbE01tuhv50rCDw2LL3ZhIIpiPeFcn
	5FiL7WPfvGEauObYHrfQxXHV+hj19CZHy+/w5vOgXJPGL+pR619FQSWZxMFVgGub61oaBnY7F+XZX
	4TL9y/KZxvO29bt214JJ9+YW+eBcG0Lh74oqAb1HtfAM2knhqZD6X+H3boKV13lGHpq+p4+ibpEyH
	8ZZMpANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlyr-000000070UX-2pDe;
	Tue, 11 Nov 2025 10:52:09 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlyf-00000006zwB-40tu;
	Tue, 11 Nov 2025 10:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1762858274;
	bh=1fj6I5WadX9tXddUihY9i9o+TqzOQO5XPHyy3i2XmCM=;
	h=From:To:Subject:Date:Message-Id;
	b=d9zurzv/wVc6AoVpb4Bcj/GR31cxA31DTrsbb7cx5r8cJoliuoGkTzqBtJZQ1L9UR
	 td9vXDguW7MU73i4+xnDyPXVyFH+ZYTqknZqA7yWCJI3qXqOPwlxs7HD66+nG2s3mp
	 d6fOijMeZ+/n9JjtQfm+Ufydt6tFLtv4po6vdayU=
X-QQ-mid: zesmtpsz9t1762858265tfbae2009
X-QQ-Originating-IP: uJyi1b7YJXrK+cM8L16DabO0ulPWhVW0NrJkWY9juG0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 11 Nov 2025 18:51:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13153881317845399117
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
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
Subject: [PATCH v9 04/10] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Tue, 11 Nov 2025 18:50:34 +0800
Message-Id: <20251111105040.94-5-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251111105040.94-1-kernel@airkyi.com>
References: <20251111105040.94-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MHu5q+4GrKKGE2ty0kH12zF2Cz22aIhrGN/T6WF+tocIB1jB0qIfSEpI
	Dzxbw1Wpbs3QsPRI+vf0U8mqWVPUFVMdOzfLEaBYRM/l/vTh6B+cJ7HKjmsJfONmqBT8671
	Xg6w4shF2MhaH4yuAnl96h0izdT2uzo/3WdZ+MniJCOSDwRQe1eqA3DFjIMthcPJQRSvLYv
	w2g2g44BYCVv+zkE8ko1LZCG/G2x8Y/eL116Q9Ny7gUj3syj06EPwCHT5cCetMkU+eIo5xs
	vJepPJ4xsoQy5xfjImpuJLjnYsGGbQiy8e/AmKt5UrTawWZPV9AehURuX03AAzGSuPHi5tV
	zOoazgra/ZVevmd8I3NAyH85n5EUARDmZVFuLCowaAhkxe3h9FAq6Y5F3uTKuV6n+QvL/wm
	MnS1TRhO2LA8nTebEDjCHZFCIECDRYQoJ6X5UBlgVB+0CmI6FmVcktxzOyALunUpIrQ4unt
	9BJxEfIccJylQzWJoj34hagqcgmOaIIvZjx+akLinzotBa2TWtvCLBUffeYfb83Ayd1dytd
	K8V7VVBY6YrTskTDHUHmFT3UCsw3dR8yknEvKXtsInMGNxWCdRBh/WJ9cVcgWrFjh9UHn+Z
	WhmQ8Unu2zRUtAqXU4Wd6WYZpZHT4jRUZ3ljePFDW/fNPTKwhiTP9+8qK67HAJVdcj7b/2S
	0jf68PVZVGTNCMkonXbcbXrFODH5hIhojTGBb5Jtzv7mfQK4AaYIsK2GA9KeYSS22OCH6ew
	aDlakIwsNfPK858GQcJe3V76857+KIsb44dDTmT25kndRnQIDDxx1zJL2x/qETd2BcPGRQA
	uBcEeK0deLZWZrfWx+nqH79VIiD1mN8Dpp4+66oDUwy2sAvkSe1OncxNq2TL0OHa5UD/ZOP
	uRznXVnRmm0gwpFBtNA3gn5EGxuhbk/+8If7Jo01feax/SWw1z3pMniHNoisBHLF+pbCJUf
	e8L0+7E9+YANQ/BD0XOeOXKbqlbjlQLrVoImCV1UUCYF4aPKqvv10/BsNDI5T3ZY0g+ulXJ
	R8fpG18BcpvLVHFe3MdJkEaREMuOJgDGXPeDPA0Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_025158_471893_DB05FB41 
X-CRM114-Status: UNSURE (   9.54  )
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


