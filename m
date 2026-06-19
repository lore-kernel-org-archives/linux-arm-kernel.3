Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB82CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdtMGS69O9FQnvlMP/DHFOAlWIBmP1hs5y27IdCIClM=; b=vAjjuRMjidAZGe+wUIEBSKKj8K
	siyOchQF0uL7VmRQVy2QSWP+EpJSARhEE/tmgIaY4tQOhWxV65AHjysK3p82XmaWdt7XmyMQNDpt9
	nF91FaTasTwGE8cACcQWqubuDES9ga+W9pr0AwUeQxM3JEVG9rDiWUPpVxiVO67EemjaDCJ4JbUS5
	QqFaIpGObAzxtepzFPMS7n48gmtbl4ow5WiFrORv3Tiygnx4mijdkji33JhlkcQ6vWDoc1a0gB6GT
	OPkppyyYG0QC/p/VFNV6hgRxnPY6zRJz/Yuu/3fbj2Gm+Nf2W81KnVB6nBXjRvFfKdaJ5675G8JJt
	9YOptnIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9V-00000002dXj-0mZJ;
	Fri, 19 Jun 2026 15:29:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9S-00000002dVW-0XU2;
	Fri, 19 Jun 2026 15:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882937;
	bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QK0pAz4Y/XG67ZKqHMfiYucx67zmnSe3b6NViHWKMV0IYWGFaN6Pf66BfkIiVAY9T
	 QWeAGg2+22N3+EOenvGcAc2pi9JjXmEatsax0vDhYuiWVJGFo1IUR+f/ZAlh2v/SNk
	 vMJC1E5f6DDhCnbwXZXzpAWfXmka4nvwtjO6moIAGiyevCY7bP4+cuMzsgcMtdYHPG
	 larqwcmijd22uhaQrueqEQqM4+RlJY2BgnWBxBLnNKNRwxFeGNn/x6fNWLcmxSainG
	 ZHC3CQK7Vixq++oe2VL8BZVl+FkaPkAwXzGHtoM71ugFg5CYNOxlehUB0BXuGHd3DT
	 kBcJjRqGJL5pw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D19AF17E0C91;
	Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 87968480026; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:52 +0200
Subject: [PATCH v6 01/23] dt-bindings: phy: rockchip-usbdp: add improved
 ports scheme
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-1-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hH0QGrmLbuu/B4YZadFae3inm/JzWTkz0OQ7ld9Btpc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDeOrh9uSgYAF1Mpbu1zTe7i9tcKPTQ9v
 pQFb4gZzgg6lIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA3AAoJENju1/PI
 O/qaC1UQAIX71Q/v64Nck9Ke2YdrZtBYfXNDsL200gdRdsBPwLzwpb9GTohNav/ZxbIH36BhoX1
 IGILLFIbpP4ix/Y6UAWlq+3MqYZYAD6sayGegLuT/y1g3TpegWRhYoZjo3jRprMYBJf695W1yLp
 fW7PyBrsSzKBIDD3ndjYkyEDKB6zMygC+TbLtyjLsswMac1VHqPux2h1ppeFjAOMVKTRg25k0HZ
 Q7useb119rBwv1CcZoO9TioaTQJ+gplRc3VN8116S1UvwFg3UWLxicpsNONa5XqDaL+Vz8SunoP
 D5Paonqbc9UeU7mUFZgMjTzO8b/x6EqPd+/7tp7lxLagrU4c3FjUmHQbzIJgZaejmRUf+3tZhGp
 Z2qfSbl6PQcCzFlP8b8TydksBIetFHD5+xdH27EsjH9FhoVuYbqe/jExW+1JamRVp4jvvHVm3Hi
 yimRI2dpdQ8HWBak0KQn2JKEV2EohP1y9Vtj4NcK6rlXWgtiRbgeLh9Oct48zgJHsic3zdXt2hr
 uGlUvaGKEeaxbKuu2irjm+p7ygziqpGEDwZ77R2/tz1nSHFfH0/Z8ko1/4hGwWGIav+iNguC8/h
 WpPygvgocBILHluddY5mpqrhK+lYEIL/DTidk9pJNcPs+fKJ0ZkrZZU9NyT8JmfVi9PG48G8j2y
 8UTeB2yN3ZFdUwjHBkOUynw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082902_326746_B638B8D0 
X-CRM114-Status: GOOD (  12.79  )
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

Currently the Rockchip USBDP PHY is missing a documented port scheme.
Meanwhile upstream RK3588 DTS files are a bit messy and use different
port schemes. The upstream USBDP PHY Linux kernel driver does not yet
parse the ports at all and thus does not create any implicit ABI either.

But with the current mess it is not possible to properly support USB-C
DP AltMode. Thus this introduces a proper port scheme following roughly
the ports design of the Qualcomm QMP USB4-USB3-DP PHY controller binding
with a slight difference that there is an additional port for the
USB-C SBU port as the Rockchip USB-DP PHY also contains the SBU mux.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/phy/phy-rockchip-usbdp.yaml           | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
index 8b7059d5b182..f728acf057e4 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-usbdp.yaml
@@ -114,6 +114,29 @@ properties:
       A port node to link the PHY to a TypeC controller for the purpose of
       handling orientation switching.
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for USB (or DP when configured into 4 lane
+          mode), which should point to the superspeed port of a USB connector.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the DisplayPort controller
+
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Output endpoint of the PHY for DP, which should either point to the
+          SBU port of a USB-C connector or a DisplayPort connector input port.
+
 required:
   - compatible
   - reg

-- 
2.53.0


