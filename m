Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C159DC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=; b=pec5X5EM0UICOtN7/I+OygaYLa
	oM9d3cu1/FNPRtiCOtPCfsaJxZKLpBj2MYlD+8Cpnw+w0jT9fXNVeo2UxlpnjdzbUykQT1t7x8AG4
	8Tnp/iQSSLNzXWK9zYpwO4reiKz41ttJhqsIkQATbKqnLl60MHdxepbJCQe58rDaEqqUpYaOYUf1N
	0ihh/aJa95Vw7+aXOdnUb97dlh6lJVMmcO8FT/+untqLbuFVilKgr43aqZ6DspQKM8JoYnVkZGjgc
	yXBa9FL7u7PQSba0fet5QG8KwxvqD1BmgUKRkvatIeCH4mrZRcgbt+NAglfZgXQpypuOg/zVVyQhU
	hwHwVC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J1n-0000000CTQU-2ecs;
	Thu, 17 Sep 2026 20:48:19 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J1l-0000000CTNF-0GkO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:48:18 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-398a384b5f7so56553a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678096; x=1790282896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=sTtk+t2CidXm6Xqh4tKpQv1YWm3cv4NuNJmY8DG9hT5osOyEdUJzgoUrihQEpda1Kx
         Ih8ZIOr6ZFhTMwvua3UNGGHw1T1Gz8IviidK2KfsRRu5j3elV/cgLak2korzdnazuaZt
         aQ89GuqBNLCwS+SJvjoNQ6xWuGdQXseHW1tkCTVP3ZvzSiYl3JqU8Uh+hUBUjC1zqGIL
         ZrCBlu/rnzNmcEtzuzOdsQvBmtBMoqvPkb0yvvwFy5RJctYlRWf9IpXEiqUC02tyah6l
         mJP8IU9gtZnd3Ng2fE8+0cErbP+q1Ae/BHMhkBqYmREpY/FQeK6hPmT20jcspaIa1824
         G2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678096; x=1790282896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWO0yYxZDPAwCYSgicIL5MDEtp9MsL193ldKBirIieA=;
        b=2qwbGLT980QJlBejTLokB73rS6tbnfAT6qXNGVjRZFEIBvF5d7KtAJqw2nr9GRytGU
         weL7w05fRClkMY9cK9HVPw4Hxlj4oAAXPlSm1RbLKnW9zhvhDC1R3omnDhWUNWlhzIem
         a2esGA7kW71Hoz7WtMOw9J0lnW1UvXG5IGqTXKV9EA3Lsj1WF6HBk4lJwUMSqyJQVZwk
         CgY5YfxULZw1jlCpWZTfckk+U7sNsPj8ylja35f/s5wUwRDB29swYllMJPNLAAIexzuK
         9YBYcTomhvFzajXoV7YTiUzqpfHFIWsjjOidgo//mXD637H67Vplcnl4uoeCGLSrAtwc
         N5pQ==
X-Forwarded-Encrypted: i=1; AKwUvByvQ3jpLnIa+kjiH2VXXYPLSCVldB4Ezew7jkrW/LfngvthXrUb8qq3AGhcqPAelp2E/owLJ9N+cp7oIQUD1Jzr@lists.infradead.org
X-Gm-Message-State: AFuF++lGn0TQM/FnPBFLptydktz8jsDf+3MKy9hfjZ++VYLsWwxINIla
	FZT1xsiycPjfcOouJ80DRk7fpxXYL7Ugjnz5hmRAfV23eCw3HYBEAXMj
X-Gm-Gg: AYBFou2aXE3OR5mvCTDSp2rC5Amv9xNAF1MYIb1MUy9tPKBAmJST64Y8ioRNoAC9rax
	j8rUkLIvUY2Ew26XDY3st3GGbyRAaydOvHXRk2gZzU6kroOJ9HdkfWf68vUPJv0pD0ImVWl24wV
	QKx9tYbNjiJunX9pB4AgiFoD1uKUno/wJIbG/p4AL8lpIIZW34Chp3YUsqlgkMNlwiPWSTYomYP
	P1+IwLzfh43pDcn8de6AW5J9ySxDgJXtoyF1nJShBSmxEWAN7jgwpv5JzcRrDAFdRowaTq4qnFQ
	zHKFvHjCCsGbEOC0mFLhRdoKpZVa/GYoF8CpfyBnvhPZmr9QStxOoO8O/NnEQlRPXtaHFTBWNpz
	bftTP8wIhjW6ZVTrG6Zr58ruej5i1N4C5CazF/u3A58YxJPx3EW40V3QaKSCiQjgrS7xmRQyiVp
	AIgQ8C+J9GLg8dP1AAOhDcURL6jFXPQ158uIRzqr82mppQ4vUo4uWKVSfl1tzczmsB/hWUuI04m
	Pw23Y7x
X-Received: by 2002:a17:90b:5305:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-39e54dcd917mr1044616a91.6.1789678096241;
        Thu, 17 Sep 2026 13:48:16 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:48:15 -0700 (PDT)
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
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v7 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Fri, 18 Sep 2026 04:46:19 +0800
Message-ID: <20260917204624.2427486-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_134817_133223_571C2C16 
X-CRM114-Status: GOOD (  11.08  )
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


