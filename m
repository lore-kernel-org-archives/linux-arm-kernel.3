Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2691CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 03:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+AM7fCvNphwGk2Z7jOLLLLFnd7SUC7zl9JUYxrKQeYY=; b=YjM1gRJ3fujm7+blZJzWAEI2/L
	cKdt4N5AD6oup83eSWlPvacMsIWr57CHvo14vTSk+tHUw4o3BQ8/UL65uv1Qk8e/i+2Z33Zklvyhp
	JnW+NDt0oLCXDERghhCoLm8dcSXyWs5epnyUd/anzN+DujaENrEMR08f5Mhg9/XiZV1BWRxwuqlPP
	Q8GeNiCpANcjh6CoM+MnO9QNKg+MX3/JaZ+A5L5GdZcLPCzdT+FcF2fwAcRFXeLco109v9aFftva0
	sTcNw/X6UhLXbUPwgiwKXhWPF5fhbcfcr1RwEpv7O677lTaUZrFj2sd9Id1NGlJ8WjDUlLdz14N36
	sqZqvQOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4AHp-00000009YQC-2Y2I;
	Thu, 02 Oct 2025 03:47:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4AHn-00000009YNy-0eIR;
	Thu, 02 Oct 2025 03:47:20 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 117D01E3D;
	Thu,  2 Oct 2025 05:45:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759376748;
	bh=lURSqJKTdJb7Xs4EQnW9jEapWTZbXLGSTm9CKQyFJDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqM8H+5Q4PLA5z65QHJdo28c6P3/ZOvemycQo9JYxmGdm7q8s0JYkHcbDoMNbkk+u
	 3WGWwJOt5BmWp6doivm0/X1yypBrcDMfGaeTsqhioAWNi4tBGHDGoKVvB4t//rYsDm
	 9KFKFRl0H4kAKADnP63UoTD9oHX1HZ0Fc4jNvaLk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Algea Cao <algea.cao@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Muhammed Efe Cetin <efectn@6tel.net>,
	Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 2/3] dt-bindings: display: rk3588-dw-hdmi-qp: Document enable-gpios property
Date: Thu,  2 Oct 2025 06:47:07 +0300
Message-ID: <20251002034708.19248-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
References: <20251002034708.19248-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_204719_337796_655BE7C2 
X-CRM114-Status: GOOD (  11.85  )
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

The RK3588 DW HDMI QP encoder only supports AC-coupled links as defined
by the HDMI 2.1 FRL mode. In order to be compliant with the DC common
mode requirements of HDMI 2.0 (and earlier) TMDS mode, the middle point
of the termination resistors needs to be connected to ground. Document a
property to toggle this connection using a GPIO.

The property could be better named, but it has been introduced in the
Linux kernel driver for this device a year ago in commit 128a9bf8ace2
("drm/rockchip: Add basic RK3588 HDMI output support"). While it is not
used by any in-tree device tree, it may be used in the wild.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
index 96b4b088eebe..7471c2f51c32 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml
@@ -103,6 +103,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  enable-gpios:
+    description:
+      GPIO to switch between TMDS (when active) and FRS (when inactive) modes.
+
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-- 
Regards,

Laurent Pinchart


