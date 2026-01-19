Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A72CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=; b=mR0K4u8ihWwR6ZElh9hpXVZiad
	/7XdhtYaD2ZVeFR3eWu8iQXoyqTb4Csni/kQ9tDel896bIElR3cQzsRpdiqKFV+d6r3nept5V2LJg
	HaobA9vQp7fRpRnUVZqUWbW8DMgnWPp0Jh2PpCxpZJfjwhQVyJ95iUc1fzRltxNXear5yjkISFX1a
	oU1lXHQi+M5G5zU8vIKbwvYGXl/5bMrpLnUK4+tPYyLlGqY/JV2vZs4yBlNaPhI+extv/0XHqFUE1
	w+D2Ut5jf2Y8LygITv3W/Abrca+tAw7fZB20Srq0SvacUhiHq+mQcH7Yx0OKNcHvjaQhB2AhDLen2
	xmoiOW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjkY-00000001U27-44d7;
	Mon, 19 Jan 2026 07:32:34 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjkN-00000001TpW-0pXh;
	Mon, 19 Jan 2026 07:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1768807896;
	bh=Js8LohQ5FKnKhCP/1X+pjHvtWvmL3//jFEdtasdSj/c=;
	h=From:To:Subject:Date:Message-Id;
	b=ipPbGZ8P4W2cwWTDNghyJBglCWD7Ur7ioQlSiPOBF7o7qZ4F5X5RJf6k4aaNDz6CN
	 cIjsrr3fwU0OQSVy9HvHuxNTEPH7eNW+wNKdlNfty5jJfWxp6Xf4s5zN0ycnGGhq07
	 bpkukbT4GgEkj5rnyVvXQzY2bsP05NsqIhnrPcTE=
X-QQ-mid: esmtpsz17t1768807894t2b9d6dd4
X-QQ-Originating-IP: AqKRKbAHcm84t5Ai8LOV/Z1hHzoNbpXZnvn4/yP/VCg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jan 2026 15:31:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14299818678048633841
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
Subject: [PATCH v14 3/9] dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
Date: Mon, 19 Jan 2026 15:30:54 +0800
Message-Id: <20260119073100.143-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260119073100.143-1-kernel@airkyi.com>
References: <20260119073100.143-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NqN/wpVFVRYX/3mnl0dfVDdeR/M8PpkrP+MzRtjk88Mfj3BIeVidRmyY
	VVrNvxEOPjPUTDwwryX6/HRdzTQsbxGTA1l1ySeXlD9efAcOAggFM/nI7kp0NyhnglEDQwk
	oPgpukpmL4nCynmkSrJQSJS7squo24ZYWrrVhTgPChgccrUE4wgMt+llipOT1gueFnyqWQA
	GUvNM7HMw/67fg2jL4O5B4s9e6vADtepdeQMypMHxkQh4kqQiY7NOqSENyVDewRVhge4zQ/
	tiO4ENwccp4YPG/REEuYFw8VOURI50WvmdHxmYgZLnc3+yShEixRXGrDS7MhZkxyCy67Fbz
	6afQevPL+KTFMHk1xHcMMzfuEOSHVCXVtv9ONBWO2ZxeHuh5J5tN0IV8iQnB6bpEuoz0G9/
	GD9yYgJGzmOTD4JBlhMiJ44/reqeLEQt6MAPkp1FsBjnl9zMqoRRGcN9+YOKRdSGCCgHlEW
	gwTbzMMqvmjDjGKrlyVyl8KKDBXzQ3802DMqgo/NL0H5Yzc5IOv53OnwNgpBePnu6poBNOK
	Gl2e6Bl8cQxEI66ZKDrg/kf9mtPh2Cp2+pyoLPRfhUG06SJOtD7oE6xxOVIzaVLZNylmqs7
	yfLXASacacrxpEsa15FiZAaOp+jKJN4R/k/2Av3+fdWhs8D/mnl8nkTFyRHbmOxJ91Ag49b
	DbzFqbTyb08ge4e2KkmPAhMb0pTX277CvSs7bqjAcATzjeOkbhrgTrZ+Yq9qWlfhBYy73c3
	FVoFj4D4PaMwqPrXssmY8E5X5heb5LphzaQ6e4h2rT6QQ++HzTqS8T2hY15Y5G0gSXvSWAN
	9i9j0urxQKmbr5fCerhzmjTrD8wFNLjLIBOp/zjXck0DAPW8mZnAmmnwYcGw/OfRrnLtxUH
	r38AlEKE3oSFWI2S/yesEdtgGnKgYITqQyHKy2HM1WEpIrvJinF9VCPd+bzl0ozoepBIGjP
	kXg2kVBSM65bZnplr0m5kKe8fLWBKKpfqhTaF3rwZSC0CcavxXP3XvzMNaydHmrNvM6sAhK
	ev9Z2RhDpK6QwbFRz4IzIGDTfTucrezqrEL56zEQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233226_725660_C41DCBB1 
X-CRM114-Status: UNSURE (   9.88  )
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
---

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


