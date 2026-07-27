Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5BC531F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 02:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdXlW+/ogTDXuEYnIcppIc28hzmU6+dYC2I3iGVVVgs=; b=HetzEN7+HTixyfCowV72A+VIaD
	Z4pO4B7AW7RW+EANpltHHbvbRBiKptgp4WbjB7Cf/ONb1zAYBIKx9rfmzNI32rI+v1fTE7zyCxVAb
	wnKU+WVE8B/FJf9Dr9dq1xRIYSL9M5CPtd7zzGA30mS9atVneJ10kj+Jm4JDswXvLXnwmq6kEfooC
	/oX0QH6P6EKCKs9rBEGN7Rq8LLjUjIqgVbr0kmTA/32jxNh0rO3yJKAOdbysMNDdRvSP3T9qHnO34
	zta0n2s1gsj98CSmG6k7QHm/y0+Z7y4LFM/dfmwfQPLYIBxtyg5xUWNXon4zoY9RNrE28IGDOoLGu
	r76oNlAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAoA-00000001neT-3mIG;
	Mon, 27 Jul 2026 02:11:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woAo9-00000001ndO-0L2q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 02:11:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2cc97653887so24942505ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 19:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785118268; x=1785723068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdXlW+/ogTDXuEYnIcppIc28hzmU6+dYC2I3iGVVVgs=;
        b=VCxLWNBJaxgJVuHN159NiUwWRpavQJkVWTEjYst0V8wef0CEa0R7IVFWxN1j+ZoZOE
         9NgAm+yOFIzGHg0XZxgnZx3K7GD7qz3fVIv3/tIZfgtTUp3SPQqYgq0R4GjGC06V5g6h
         JweLDG5auY4l9qGDa0X5zBa/8hhGB1xju7inZigleWpsYuzFQ6p+Ofhw89TcXuhtS6Xa
         sLDe/oQn+5rM6PrVt9780k5pFBS5zcTb5O5HfTAqPbUtNPfxvfmND2QJEZA9qbEgM5aE
         eOc1Uk1cfaM/CEbalKU8tamu//s6B5ZljD/wBMqHpmCdFQF+/NhFxycqXphM3uPfyvjS
         iI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785118268; x=1785723068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdXlW+/ogTDXuEYnIcppIc28hzmU6+dYC2I3iGVVVgs=;
        b=GchA1Cm6mbw0KRqhgkC6Gxx/sHisfR73f3J2iYrh5PJvO8WUFRO7+mDjN1sLI/y9qj
         hW9GK91mpRAkei2fxK9fnZNhX0qO3uYX0kkaifN8lm117p26bOdUXlvT2HIlUqPU4vVa
         Kg3WIjREOT/yfvlmRL0x1+AXhUuMRUW+6LnFbfX61g3qnm37dTEg7RwSQVxD5IsRp6Cv
         0ExMPi/RtvP9St5mFctUw9hBbgU95HRWbimCsKBa1bmv3WjCqycvZHWq5xqE4bTOA3+S
         KDXv7e/3j74QGLCIqz7u1ssdm1YknxX9DvHGTRBAM7HfY4yp4/EErWS/63HMgdHm9wgs
         WDPw==
X-Forwarded-Encrypted: i=1; AHgh+Rpn+peShOa7MaKCqmtmHaGqaTsXE7ys6155LyDPiVIwxIgSw6CADDw5aXy+2S4+bGp0Pi78vYZom5HwX67x/S4d@lists.infradead.org
X-Gm-Message-State: AOJu0YwVKQIBXkcjlfvr47bluxEBlad30N5iILFXA1EenP2HRFC0s6lF
	lgnVHYU68oz0lkK5AIwzWqoIcIwhnSzbjZgHUsboZL/oICKYF6CkRxXT
X-Gm-Gg: AR+sD13SLzM7LbdD+plxB1teibnbVM0uynkzQhsaereoAMR6YtmBtRJ+MnRBkVrDZHA
	5dRsNBheqVXpJTdMWydia9ird1Md0itBf//fuXo6tTH0rEJxMUOxeQQNCqU1wNA/l4z4YBcWNF1
	2GHqUoYhxnceSrlVY9z8OvftWK+pOL98FUA3IKUiU6f4QJGFoFwpVeUQyNLcdFZKgfKHRZu3GLF
	2ckOMDbPo0nCEJBXUdtof+Y0vQgOeQ9/wjmLeEYvGPRGJ1h2yK3zW+sElQw4B49xOQ5vn1tzYks
	9fSnuXAZCUJrRZeM65lO6/yevgH5BiWS2w0InTVGVQsU+/GIz/5/OENg1g7z5hnQRHv3JowLM6X
	u+TXY4r/6cL4tHH9IrGe0UerA6pREenqeI2uTQGExwdJtgKp0xKxJycQewu7Bzdm2IvfEtlCOUL
	VoHJG3xcFroFJouaFujMO17xo=
X-Received: by 2002:a05:6300:85:b0:3bf:983d:e9b4 with SMTP id adf61e73a8af0-3c67ddc3cabmr6375253637.33.1785118268171;
        Sun, 26 Jul 2026 19:11:08 -0700 (PDT)
Received: from attina.synaptics-inc.local ([199.33.119.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm19162200c88.13.2026.07.26.19.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 19:11:07 -0700 (PDT)
From: Gavin Gao <attinagaoxu@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	nicolas.frattaroli@collabora.com,
	sebastian.reichel@collabora.com,
	sashal@kernel.org,
	alchark@gmail.com,
	chaoyi.chen@rock-chips.com,
	attinagaoxu@gmail.com,
	amadeus@jmu.edu.cn,
	rmk+kernel@armlinux.org.uk,
	horms@kernel.org,
	alok.a.tiwari@oracle.com,
	david.wu@rock-chips.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 1/3] dt-bindings: net: rockchip-dwmac: Add 25M refout clock
Date: Mon, 27 Jul 2026 10:10:45 +0800
Message-ID: <20260727021048.3375444-2-attinagaoxu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727021048.3375444-1-attinagaoxu@gmail.com>
References: <20260727021048.3375444-1-attinagaoxu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_191109_127123_8917B054 
X-CRM114-Status: UNSURE (   9.60  )
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

Some Rockchip GMAC instances can provide a 25 MHz reference clock output
for an external RGMII PHY.

Add a clock name for this 25 MHz reference output so SoC dtsi files can
describe it separately from the existing MAC reference clocks.

Signed-off-by: Gavin Gao <attinagaoxu@gmail.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 0ac7c4b47d6b..074ac274f2e0 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -81,6 +81,7 @@ properties:
         - pclk_mac
         - clk_mac_ref
         - clk_mac_refout
+        - clk_mac_25m_refout
         - clk_mac_speed
 
   clock_in_out:
-- 
2.55.0

