Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DB7C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6TTX6i0XQxaEnW4x1mI+/13/Nh8Vd+xGWNS930sgHw=; b=rILZkc0FH3V+HRxt+8ij+/5LZU
	Dz3MIzKLTmEjOxE1lDnD5edVxcJsVfermp5/Hz2BNGWKJbbGcO3gdMB2950H/9ukx85zV11F/ysro
	cfHWsvbFtQb9Ob0D/6NE+FNH2O8Vg5Fux8FVpDQRDDY1HDLJt9vBJsGqAmesnoDdjdCIzYHSfSio+
	2XJZwz8+SyLw3LiJF+WkDdl3PiVC47Qz8ITmCeOGk/HD5EqcYWzDCFQKfjNoICwOl5GlHRsAXVW0M
	pZsqtCGBUkDkLyKeJby/rwueACdaHIELV7HBVXCF8KFj481ekf+qGWw4FyEgFatve0TaygTeW5vkm
	ueTEk5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Rk-0000000633D-3TEz;
	Tue, 25 Mar 2025 13:36:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4MK-000000062GW-1BNp;
	Tue, 25 Mar 2025 13:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=R6TTX6i0XQxaEnW4x1mI+/13/Nh8Vd+xGWNS930sgHw=; b=L3uCnQ0+HgXaFriDB/7nyvgPb5
	JJOwd2T+WvSshahFPeySrCCHWqyLgRIHnpZEK3mx+NHicz65BtNX5dTaNZH0NdN8iA6P/R85SA2Ov
	XwHRvPdDR/CdDf+kmE67OIq1Q1/xxloAYSNtr7UHTXg1PXC0XIMHjk3VqXydms6JhaFVCMriTQR+B
	SPdcCBVaOeeofkpj4SwBTssJgAozW+iePWM7zHNREbU+4vZiuXapmy7yFePdmRmIvqWGNWR9Z/j50
	vGxZr17LuD/WATLW+JDddenVPHMqbE62puZaWMMELqlQ8afdnMohUVY9NcA/kutHuUL/i+x1Rlnxa
	dcZN54Tw==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4MG-00000005Snh-2ssl;
	Tue, 25 Mar 2025 13:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=R6TTX
	6i0XQxaEnW4x1mI+/13/Nh8Vd+xGWNS930sgHw=; b=arhNAZxvxgBjReAXbNFDD
	Fva9rgXgRJbS+4y7+UonVJo1dXpo8/tcFOu1XQuyevmlbRRcV9YdZOyXBZiOmssk
	tvY2S9+0BlpiqPO5M3UfmfTbqqaZjwSH5LGVJ5ljK6k93eSe88Mld+jaXoJomGeW
	4wQeZhQrnDh2XQ/6W9CtmA=
Received: from ProDesk.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S4;
	Tue, 25 Mar 2025 21:29:52 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	hjc@rock-chips.com,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 2/6] dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
Date: Tue, 25 Mar 2025 21:29:36 +0800
Message-ID: <20250325132944.171111-3-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250325132944.171111-1-andyshrk@163.com>
References: <20250325132944.171111-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxJFW8ZF1kCrW8WFW8Crg_yoW8GF45pa
	s3C3srWFyxGF17X34ktF1kCrWYqF97Aa15GFW2qr17tF12gan5Ka1agwn8ZF4UAFs7ZFyS
	9F47GF98Aw1Ivr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2ZXrUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqAobXmfipyL8oQAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_133021_236237_442E65B8 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Andy Yan <andy.yan@rock-chips.com>

HDMI on RK3036 use GRF control the HSYNC/VSYNC polarity, but this part
is missing when it first landing upstream.

Document that it is mandatory for RK3036 HDMI.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 .../bindings/display/rockchip/rockchip,inno-hdmi.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
index 9d1e7f894ea54..290376bec079a 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
@@ -56,6 +56,12 @@ properties:
       - port@0
       - port@1
 
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to GRF used for control the polarity of hsync/vsync of rk3036
+      HDMI.
+
 required:
   - compatible
   - reg
@@ -75,6 +81,8 @@ allOf:
             const: rockchip,rk3036-inno-hdmi
 
     then:
+      required:
+        - rockchip,grf
       properties:
         power-domains: false
 
@@ -103,6 +111,7 @@ examples:
       clock-names = "pclk", "ref";
       pinctrl-names = "default";
       pinctrl-0 = <&hdmi_ctl>;
+      rockchip,grf = <&grf>;
       #sound-dai-cells = <0>;
 
       ports {
-- 
2.43.0


