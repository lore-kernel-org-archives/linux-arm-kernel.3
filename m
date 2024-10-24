Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6696BCE8E6A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfIBe/HomhpB8UeCXcRfnherswHl2SNC+dTb1gLZe2Q=; b=KmlCKlyjTpsEbO1QNQkncqNa+g
	nkPS8CZtK+LtWGI16J6i38QYxs1ETy68w45KDRqSDb1wGCVXNFWdARE8Egz1xKH3fD92KmrLqBQyA
	c9vTJJIXSwm3ZMLGqthKzW7cxUNolUvJytckBdXRKqbKRUshDc7ByRkzisiszPQD3BbsVXqelm1ry
	Uy1p2WFyYzXEawN9lFp+ceFpV57uhl45+qnaF6a7W579nLvSZWV18TRhwRQ7uOzsq2U7YcKW4QQh6
	xWVbQrCerpZafZa98JWnC5uo/ps2uuM43bnKx334EItPisp1V8jqRQzPb1F+yxompqRqKMJEuE8Sz
	B1N5YrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41jc-00000001IuA-0CW1;
	Thu, 24 Oct 2024 17:34:56 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LJ-00000001Doh-1Oub;
	Thu, 24 Oct 2024 17:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789788;
	bh=0RkskRslYaUuKRSgVlTdkKv+Mh9NFTsXkwpsxrbjVIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DL3jdBNpJNo5KntIZ0v25l3caK6zQjh0AQF//EWEnTja844TVoiVVkP53yIEkSYid
	 DKTa16726L5IJMSUtxcb8b+x3AVift1IIubQRxKvoftZxNIZZszSGiWwaeYSM3ZXgC
	 IRF/+WiDp5wGzmj/yjAhTQb1gMpPaSYQwSAnHFSzr9wONGl5h8f5FxcYTT0uCLsSMQ
	 XpP0ttP2olSRaNo2Q5MKtnK7RosfYu3uw4Z6MF6I2JFjpPZ+nvuTjWEBW8Fvwc2r/x
	 W2WBq8Qk4hcSIR2KwhyBzh+hCQWXhw23u5LiEd2Uq4IZkTMPyfO0pm3nW+tDx/+0S8
	 rmJpdHNQ+NppA==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 11/13] dt-bindings: opp: h6: Add A100 operating points
Date: Thu, 24 Oct 2024 14:05:29 -0300
Message-ID: <20241024170540.2721307-12-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100949_570636_F2AF7E83 
X-CRM114-Status: UNSURE (   9.52  )
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

The A100, similar to the H6 and H616, use an NVMEM value to determine
speed binnings. The method used is similar to that of the H6. However,
the information is stored at a slightly different bit offset.

Add a new compatible for the A100.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
index ec5e424bb3c8..603c6c88d080 100644
--- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
+++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - allwinner,sun50i-h6-operating-points
+      - allwinner,sun50i-a100-operating-points
       - allwinner,sun50i-h616-operating-points
 
   nvmem-cells:
-- 
2.47.0


