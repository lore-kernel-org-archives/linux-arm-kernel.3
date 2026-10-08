Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF04CA6011
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=; b=PAIJxIVYMLfVv3R2EmWv77utn2
	XJhzPtWSfshf1Xh1RQQYp2aShgZmE0uMRXNCCJSX55IOJiZqAIxQ9YiUlV87wJfZcgKionteYuY+u
	K5dSgdj9YTStz6u31ZEb9OA9I2UDZiwLWWBQ3IhtydGUhSacbMIrfi5fOIV7mEe2LzMfDAIljE8yL
	9cTiczWr2OByetW52AvyEbov1+h0LzcHhcLTNGK8G2f6GjuSGBBCBmZpiNUgWxw8QSuCGyTH1wRLJ
	6WO3E0al8XFxn+8iS8Be4uWW3TJ5QdrDr6hxmlzYu5qCtE+QGknWdAoF8EVbjrTGMSgUkKlXpU+1A
	1uK2anaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsIz-00000004ouH-0bGS;
	Thu, 08 Oct 2026 17:53:21 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEsIv-00000004orT-49Rz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 17:53:19 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so892891a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791481997; x=1792086797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=;
        b=G6Ghgi3SXHmxgGrXo9DEgLnuj7YuRmQd2AOuOJOq9ozsOTFojljsTHi6qdq/buL85u
         9ffYs8sTuPEjn2ISWdjgHOekGV5Mk7cRlQxes6lHTbLk3k7lC3ZWzq+ewj+MLcT5V7jI
         KfWc3n40pay8RxHFsb+tJ7KO+EzrTEEAunlt4nr7FT3kvqmYqwaYSm7vrWcaOxWQ9xSQ
         5xlVvQARXbjbTFEqFFjgbOTO19YNQJq10V7OYrNNtwlw02cNzzdvp6/JcjVSAqjvVV5o
         PcmBRIAUljK1QKYYuTBdECkuAJZE/a/ZS6wF+Bs/Uw0gK1pj4j+cfeTos4sf08t6xnYi
         yR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791481997; x=1792086797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dgqDqFuW3rt6C/fWbsq1Mjghdys4ztuGpDNCDTihI8=;
        b=p/tDdiVM1IJhGElxq3zrFmSoazetq22FxA4F4vP98EhBAHnoJK+yqrYbMSoXl1thjr
         iaVRtEI70LhuT6KxHdbBNGc1O+SLDM0ttgL8SXAAqdp1GWu7NKFrCzuSmF3UigOgJab0
         pbp2fqxZ/tL3vqH7bDAhKHpwS0/5VQTzs45ypIieYigKKoDlB040UPlzZM5Xs9N0ptU0
         GGtWb1D7umHc6iTKCWd2NszqHdzwuCWAdsVo5TZiLjn0N8XVWjSfU0Gi3CL0H4ZYOriw
         9Rq5cyFvev0EQIoFBlO88tgDoOOJ01hsQ06EHF2IRXT1vyowmIlKlmgO0mMB4mwfY3U5
         YYDA==
X-Forwarded-Encrypted: i=1; AKwUvBxMNSbNnXS95FYBuVOTqE914CRuU+zSV3AAPcHciVY4lrL8n48nBjA15QXadhYMiVQLkEByZ//N4+NLKADz6zfa@lists.infradead.org
X-Gm-Message-State: AFq9FYLqiaasuak2h/ktbXIxujnGpUSLVy1tst8+clEoU2ba82UfyYHI
	uBwhqF5RyCp1zOYXJ4F05rpF1FIGaaTd8OB4NVattgCZD/d8XX0V2u6G
X-Gm-Gg: AYBFou1gEdBLyWL8AVMRS6OacBgTMsfkOzf5ww7YidLv8PdQUurU2Ndghxxhb1nXVvS
	sOjreH9HO/ssBw3VYjKteXF/BSTGpZ/i9jLpXBiIn3hSrvKlqnxmITxwh/rKyW+wyHOVDU7W8tB
	lu96Poz/WvZK6VIWoumciTynr+IIlYpYdaUkQKhSBEyIxE0kkCyGygD8znxlJtTFmUDaqnJ+IRA
	bYfqa7bgYqYxLqaRawfsFAFClG9yZXv6CSFinNqbRTHPbuqtrkeAAS6wSHG0v8naMO5c0A+S7y4
	99kWtitOxwnVqMSu66hSBwglOlcUUp3/Iw0qMbKmtKRIGl8ZmvHxQgG8RX55QDkeEEvintlTg8U
	82ULDwKvJp7n+7xpQZipDtPABJcwuCg1SzptLODzPmd3MYf0V0MHWThKwx3Zsa3RxxeW7weMBDX
	twIrxjWSmn/clhVKEtiggOVRPC4TzcLWbjI2Jkz0OcmU0DE5AcgwXtZfIO08bYlf7tfHPE
X-Received: by 2002:a17:90a:749:b0:3a8:cb54:e132 with SMTP id 98e67ed59e1d1-3a8cb54e659mr2236926a91.49.1791481997269;
        Thu, 08 Oct 2026 10:53:17 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3277c459sm144332a91.16.2026.10.08.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 10:53:16 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net-next v11 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Fri,  9 Oct 2026 01:51:58 +0800
Message-ID: <20261008175225.3375274-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261008175225.3375274-1-coiaprant@gmail.com>
References: <20261008175225.3375274-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_105318_031648_F236E99B 
X-CRM114-Status: GOOD (  11.62  )
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

The Rockchip GMAC binding needs to describe the PCS reference used by
the SGMII support added later in this series. The property will be
parsed by rk_pcs_init(), and a missing phandle fails the probe. Add it
and require it when phy-mode is "sgmii" on rockchip,rk3568-gmac, the
only SoC in this binding that has SGMII support.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../bindings/net/rockchip-dwmac.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..c434450fd07ff 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -120,6 +120,12 @@ properties:
     maximum: 0x7F
     default: 0x10
 
+  pcs-handle:
+    description:
+      Specifies a reference to a node representing the PCS device
+      connected to this GMAC. Required when phy-mode is "sgmii".
+    maxItems: 1
+
   phy-supply:
     description: PHY regulator
 
@@ -159,6 +165,27 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+    then:
+      required:
+        - phy-mode
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3568-gmac
+        phy-mode:
+          contains:
+            const: sgmii
+    then:
+      required:
+        - pcs-handle
+
 unevaluatedProperties: false
 
 examples:
-- 
2.47.3


