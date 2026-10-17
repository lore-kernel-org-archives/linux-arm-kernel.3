Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB35CCC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 05:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=; b=dDZAMgIwNF8HkW5L2RDvaSn2Dj
	di23+Ersp1ZHIYbFmNOGZ9AaIYxEdXMYWXt8fIzekxGyEYYIEoP5NJzA8rU3XPd+cotYswaOnOxoP
	cnRZX+VtTU7d+f6WSFtAZ3Sfck4Ig3dWSZOGw1lTl4sehnVnZBcPHyP0+DHyFvQ1YzGK7RQ55l+it
	jorRhNkTqQdzVQ2q/pT5LRoxN+kAAhjO7IdNELR4fqUQE+sYKaFRRSGUfnP449QAnKsuSO0vQsviF
	5EZ9vFPtWYgJRqBOkKwAelZlsgMewo2faUkE96hN0vme8kRwLg6aCPYfjKFb3RWHq7IsdQz0aZKq0
	JmyTapCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxES-00000004Sdn-1YKc;
	Sat, 17 Oct 2026 05:45:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxEG-00000004SUc-3WSU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 05:45:14 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-cc147d86bebso418859a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 22:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792215912; x=1792820712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=;
        b=lekdKyUA3KkJYis5LhhnO6unafl/V++gwIkYc+xz6X6IUWDkDVDiZY7atwqiDay1Us
         wesbCm7yEwEeBH1e9GYl0AKPMPQzHCz2C4C5kwmkX/wNGIbkXL6QPK5tZOIrKN8mcIBg
         qkJE9z/vjcO6UyycWedOYkxaVV96HTAtNgzCODG1JylyBLrPKHwQ9cmzYC973gR6YP6g
         rP8kAWeCavljLmFJbXn7dLbhBYfUTSnHMb3fhLBmouSZQoU8GjmYuU3kFJ8ffmJTW0kH
         9KDLQX6sd7ni3jjJA/3fQimnVqhyKPhIMM7zNDcRHXrL22w1Lo9x0Ww3iM8If/XArbCJ
         2Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792215912; x=1792820712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vxuxc5T1ripM4n0F4O5vkglU3x7CEQrB8YPn1E2u+7Y=;
        b=1ddmBXoBXPu6pi25s/K0Jknh3IfUabHY/P8GWRJtJfX1BA650b4JEkHRmiWScDfagK
         9nJ3IRYedalrX4KCjVDHeymQ8E4G2baTXBIa3NZy2XoU4YHhrzpiW6pHeIO3uFUJwSqw
         kd1UZRI86/+0tgEW1NmeQLtPU+8JLS1d2R5OkY1Xtz93u3i5eWXo349M9cW0+AmGzSQu
         MLsx4IiV8dDpikolbSZ4WGyWzU6WVp0JS3wqvEuqPNTPDIRhLyzuchOjMGdogjI4KwTX
         1gbeMKuVThj080LIV+rD7Mt1g7rp7x07MYhOlVAJQcbMv7QhsGvlpFFW7a+XPO9e6NgV
         EuOA==
X-Forwarded-Encrypted: i=1; AKwUvBziPv52gczDhLOm929m45dQUd9tb6DPiJ86yWnNob+Nnn315KaSmW6rOvEhxRaIhr70WGkGk5q1Urbsis7EBy3v@lists.infradead.org
X-Gm-Message-State: AFq9FYJkslOvK34CZo6YRK89EszMCN8yHArhnXMBK19uum6/AeaviVTw
	yKieGhU13hfWoftpgMqJPLBFJrnngBK895CzuotPNRbbWzN4e6h3KYuS
X-Gm-Gg: AYBFou1hVM5QjJwxnTRBQ2D/XhQohj07lIqTiiCIkTfLNf2f4VB8QbxNg5VVLNBkB4K
	vb1SqUwn4Vy5NNFj/7zR8yrSAAYxrgC9qtLGL/sOMRLiGPbyj7juItOBqiaMI1XwAoQh4RJmok/
	+BInWYPipZLGExOZ7NadXfjaurWmcZ5WSUU5CHeqBqX3ttxJAJYJgOlWFji3endDuPCTRIlVO5w
	OexGH6ApORYSN416lrRZZLAg3NYkie4s907CLplZyeZhrTNm1rVcCxq/KYVPYPSrVf3PwVlnr+g
	79lXrVA+EoVuTkdOBfqDKoNy1tz91jfGp/a/gDLil3Kah6cQN8akwkOTOlLaB+lWZ2WQeCae/Yb
	bE4bL7w9TwMjakYbMEyQFxDHNLGRolioKAIM9wvMTI6fMFGWg9TMi+JXGcH9n1SO0c1NSmvlqKy
	7aUCczck67+FiZ1//V4rF/9fOEYCYzmlQtcMuIEqJDHI5gU6kNQQ/vOLSpXvz3h2+SoKMw
X-Received: by 2002:a05:6a00:1389:b0:89e:7b15:d934 with SMTP id d2e1a72fcca58-89f2214f36dmr3388109b3a.45.1792215911894;
        Fri, 16 Oct 2026 22:45:11 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57269315sm1958225b3a.23.2026.10.16.22.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 22:45:11 -0700 (PDT)
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
Subject: [PATCH net-next v12 4/6] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Sat, 17 Oct 2026 13:44:02 +0800
Message-ID: <20261017054406.1828061-5-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017054406.1828061-1-coiaprant@gmail.com>
References: <20261017054406.1828061-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_224513_250919_47BC3738 
X-CRM114-Status: GOOD (  11.11  )
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


