Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BCAC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=; b=CMemYx7y2PWpdtsVQULCHYqyx9
	ZmL+OahgCjUybeenB6frNHt7DEwj+fZ6WT4QVOGCUQwdE33JtH/M8CPsMlkLQY+Oz5XlK5mYXG0xv
	LefnBqeo5VIZF8K6zFt6PODhMzqKokqqWk8TZi8vKfff9zl5EYr3bgdUYPd5ArQTr33/0y6Y+BkrH
	IKtbjFJVm8D6fnmPvFq56mHH9qxBiyqMlAblLqsBUx//9Py/tu2P9XGK95SnpSoxZBHaYUtnVuHQU
	nEgxsaFsRNZz8WonjneJ3pY/kbVQNnMdQDS9NwOSZImJZGSLbK+HL97iKiEdTVif/upjYrkOeuOvr
	CYSjsoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRx-00000006YcW-2EXc;
	Tue, 15 Sep 2026 12:39:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRp-00000006YNN-2RWS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=; b=po3Lt+SVHobwbhcbJBr3IG3TVI
	JgUYEExVB4RgZBjqHUrbfZ/A/SA2ul19XwabgEszMPdrR98D3V5dq7zFybF3uTQRDPqB9L9W1rG3U
	XzXcPOoVSAyagOzQ1TQLHykdk4+zzE0y4WGSQ8HkfcTbUI2dguJnTBTM4oljz+GnigvH5GCz2K62C
	y44npsR22eFN/3/7WwmlonBTrp/x9bTlZ9OMCn2BfzEWyoA0QfrEPrX0h0Pm4dj5PMyvQxrAtXhpB
	uPra9sqaO2y6lSa5+mJFlJxMjGKXYIjrE5AuogtCpn3p0k0ZwyHlAobxtZvzkxvILlRrD5yUgrxa6
	YdAiK2dQ==;
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRk-0000000G3wv-21WI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:39:40 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-39ded0d7f52so1312328a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475973; x=1790080773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=UwKnVIZeq896dMeM/z1UpV2y1xSzeqX7B9eRYk9+UXUgjP7HdNcchJ3FJ/5WNS0kYk
         /FVDf653vcPq3fEja4M2xYZ7mR0RX3lQbmg9eTXYFj9IdRgsrKyhu8/NEKIEIrjZ019U
         8vAvS//AM4q/0u/nVNbY325ICRWvP1TP7/QJz0r/KjfebaFCHiyU3/QxrZxXL1U5Zvuo
         zMY4LBTJNxJhU/zESoRDnrhaxRJkvQnn0dNtbFSneE5RoUxdc96kl3hia7qx5m119l1e
         scXNpTL+1igU1HhLSTTFj3Z7tXyap4rG2ksOqr2jun7hZkPkrHu2GHxsNKk0J8kjalMH
         PMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475973; x=1790080773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TJZ0PecvDJzl0BEu7eLa+JMyHq2Op9t0/swrRCuqxn8=;
        b=vtNt6f0j5s+TJJGyxqu+ho0/6hQoEDbCxYZYyCNF99MkH3sk/kwcbKlSHnG/VNXw1l
         83vCX9TPA+i0Bedq+y6zP7CV2TbrYmyhgtffJGFUp6qK2YpcwpqyzdErK93lgJNIVHDD
         wOToyUC0zoqe0FCrOOj2FHCYUbjKk9Wq5oK5nNPXRC8+6wyTmetysr1amEgPnWtcA7Af
         ybYbcO4BxgZjA/4LtqrbFbmvDBk0R62LzFleI0jqWnPXqSpU2nlRA/KggWjteQPuCpeB
         14p/atvbZQM1XJqRLQirkjHPFgQxNKhXX2eMnybgnn/CC+mLh54M7AGU21jHQhMV5svi
         xY7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxiIjZswcGvoXtRFwRIJDfFZ1F7R7tV1II75s9ZonN0eSaL1H1rU7ToRYCdf40YdK/CXILF856CJYvhv4pmxTAY@lists.infradead.org
X-Gm-Message-State: AFuF++nVsXGMNHesuYxmPUscx6hyO70VwwYXsQJIkTkRve/6MBcjE88c
	kDSIDQP2ZXCm/0NBFAV6AlP6CeQ2VChpvvkqg48L4YUqM0kDbaSR1PRK
X-Gm-Gg: AYBFou0mkpvQvnfevmLQe4YJBT37gjh3NzWmXsAm5hvRuBv5AsaoEMrxaBJwzfMSYRO
	8kJ+w+M2d+2ZmNf/whLGVByLXEvoDnwKH3lF+hM7vDNS2zDpcP+scyXK8flqrl3/gJnJ27gjF8V
	6dvb3DwUdQOFkbsiR17GOlAp7wFLUKB4C9C27JV/yAe/CL/bqYvIMfDoxflOBMA+HFdfbR2Hc4e
	yOkZcbucPWykKRoql/TsvBmcgbDPqvEySSFoFAe1/blCui3bqCg/+AhcRS8uwRoUYTTR4EPPlqL
	PIS+6DG/dCWyWKrZSSFGk6VIF/Kb+SqrgTpN0Jo7hAo8bUR2jo6n6VsIilTOhy7Lpyj34BfonAN
	f2ZEzfDSyal59g2PAWouwhAH4BQhmJiboGkGW6LAgQVXv46XuHMgahShRnU+S29vA5gysWa95Ya
	hnLNtiwkW4IzjUfS3AMjrGXPq7YRNyr38njFKcv6BM7wEpUqziJ+OxORZwiPAjNjHv0ac0DfI=
X-Received: by 2002:a17:90b:1e41:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-39e10e2e451mr1383583a91.9.1789475973476;
        Tue, 15 Sep 2026 05:39:33 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:32 -0700 (PDT)
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
Subject: [PATCH net-next v6 08/11] dt-bindings: net: rockchip-dwmac: document pcs-handle
Date: Tue, 15 Sep 2026 20:37:57 +0800
Message-ID: <20260915123802.1561724-9-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_133936_578123_0C598765 
X-CRM114-Status: GOOD (  10.26  )
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

The Rockchip dwmac glue driver now supports SGMII on RK3568 and
requires a PCS, referenced through the "pcs-handle" property.  The
property is parsed by rk_pcs_init() and a missing phandle fails the
probe, so describe it in the binding and require it when phy-mode
is "sgmii".

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 .../devicetree/bindings/net/rockchip-dwmac.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349c..67b21ea77ec96 100644
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
 
@@ -159,6 +165,15 @@ allOf:
         clocks:
           minItems: 5
 
+  - if:
+      properties:
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


