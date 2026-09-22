Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD313C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 20:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=; b=Hb/2zmB8Vy7JHZPYwTUBoxQtN2
	QVBDNNj/ZFChALcS4eZ2e/KjaYSqLezzwTsVwgQZEXMVvbTzm3nNi+iNwwSrkMEM4PI4iveGTYmpl
	Hvbs7bNriT0o+VKnNXCSYOSCo79YNY4lntd7wjrNG0hOpvgw0+a12xB8BkerrF8EuLrSjfpRwMF+X
	8jujSznKl/p05wjN2AWAKHlPhP4W5UFCdtxv6txvnskXOQhn5uSAeTPI3P2TrM1Vxg6Ut9lL8YgoB
	uO+SeREl9bfNo+CCknelXNI0+zEvoHvQHqJl5PF1d3tANqGqKWCSOCLjLtr4AaheKuiCDXBFgYo8X
	LXInDlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96jc-00000006UfV-35fa;
	Tue, 22 Sep 2026 20:05:00 +0000
Received: from mail-pj2-x05.google.com ([2607:f8b0:4864:39::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96jR-00000006USo-3JZs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 20:04:52 +0000
Received: by mail-pj2-x05.google.com with SMTP id d9443c01a7336-2d942de6574so990885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 13:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107489; x=1790712289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=EpDN2c+je7eu3mz3KQZLevvbX0Dn2XWQg5LweOxpIB0l7TrPNbukU+kprRIPI3ug0o
         zeBBeSOFfe3DoAGGYUErYTuartDRjLcJXfTBLh4tQrfRVEkf9hlcOUqhWj9hW0ZvfWYn
         GdJeYDDh78wGr/iM2CEKohN3CyJ3QoRjdO0hcTpCNkdhzwH/Jg8anx7AGcW2rZktx1Sr
         hPYI8OhG2mjFs0EUBSi5XfMdxGXr9NRDFkBjMblv6RYXlRD0cgSmz+Gb/KDIljaScS0z
         8yndYZXLyQWhAtVcxDktV0TXqQq1HeIIcDdtVJlmz41EMH6NJSkijsP8zp0bmQYxfn3I
         06QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107489; x=1790712289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=Ioec7jSZ8vSNH2pbfLWHh5Dr0GHyKoK5fv68os1UgBLP41BarpUups1mhOjgJJEi9x
         v9RBcOL56xR9JdyMpOsazJZeQ6m2geRY2hu3XS/cARdDl3qyKaAbgf/wNYlmoadMgyl/
         KPr6tT1C5Ro0bMuB7xUVIFtG+hu8nWcqaBoSTF5EIwxbJgbGhCsjgIT7z71+Q1hioi91
         Diqh4bW641cS1yhe8TlOnrOKwN6GCcKBmqm8Rep2Ge+LYSh5mun+TitzWLHrXCUwKrZz
         +s92QUGG3XJroS/nnRyY9aGX09fZPmgHMlFN6BzrTztiYDUqr8+NC6ou4uaFx/VxQy39
         hdEA==
X-Forwarded-Encrypted: i=1; AKwUvBx4RBZAD/p0NaLBLwe7KAllfQet0p+In2JKpobGvYttoDi+SOSiGcdED7+576dASm0sndpaUmRwVS9peMqRm8TY@lists.infradead.org
X-Gm-Message-State: AFuF++mgU6x21hAPzQs+n4aTez4Px3+R7xLjN4d1H3zRcQWoLf210yud
	1Nc4PcLvXRMJh4hnP/IVb5EDZ8efhZuykzCTTSYDD+Fr/IN6lVVWAKLE
X-Gm-Gg: AYBFou1mw7mE+bc26aV/TtHWK8nnRfJrFrltqFkvG2HHFac6JQuHpstsO3Izq4YJyYj
	Yf//Pun/IUw4pqqG3cPuIYC07PK/4MMHpFXNExqVo9KEr3iA279BR1p2vSH85QnDpmE3KfKhUbh
	nB38rbEN6tjLVgPkmCpihyz79jt3mN7XnnTbN9JXP09HWk8J8Eah1CReWq+ZUx2HOoX4YLQ2cax
	DJAYEGBaBQAI2iAlwMBu7Ly2luFBmKaPd67Tkbp8t4LAJ8MwQ8DJynTnVC/EdDCKRHR03ficIRu
	NA/3GIsaWplCZYnC7h90nURHtgtg1G3G/QVSKx617I7NRIYiHWab5eY+dFiGOxvdLmXlkpAVv5g
	HnA5pr7iBFf60Tpg2HusXRQJRS4QANbKe5t9+ivntCz31VHK2rlNS+V753DRA9F9x3d0fjSfF3o
	3RZbJePfKzDBKY/OUDdmNMYKKCwgActWoHZTjt+hOLi7L6lmAiOxouV5DHldxqHuV6p0N8
X-Received: by 2002:a17:903:1a86:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2df69d1b106mr4415425ad.1.1790107488984;
        Tue, 22 Sep 2026 13:04:48 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5eea15sm654515ad.64.2026.09.22.13.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:04:48 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v10 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Wed, 23 Sep 2026 04:03:32 +0800
Message-ID: <20260922200336.2201212-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922200336.2201212-1-coiaprant@gmail.com>
References: <20260922200336.2201212-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_130449_867216_90C58DC3 
X-CRM114-Status: GOOD (  11.89  )
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
 .../bindings/net/rockchip-dwmac.yaml           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..bb7540e838033 100644
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
 
@@ -159,6 +165,18 @@ allOf:
         clocks:
           minItems: 5
 
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


