Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6870DE68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FUWz/EfUAurhzztoKv3JDSgTTLshpwemSlf+YprWbLE=; b=aWe/bhIgP8JHe5P6nhfDZX8SsN
	dxm0/XIwZSTpNioTJNuGjO3U9tGcz6RxJA1gxTdGdp2c3kIk4iZaNOal+sWWbdwj1u9YXVKS0sNoj
	GZczZHJTAMZOAmV8q5ZsNz4R2BHiZz6Y6h91zDUYjDgSzejl9rQBp5NM3O3ysBVtTlYzM8oJO6SlO
	dDvC7gCcql3rv1+VeYMHo+yo5AdzMGf68TfnFASXlwC55DKljaaNkV9gm56aDdEMd42XmkOeAV24f
	q7+a5VMoTsjCO8vXq68WaOUDhh4J9sKVYsgKSRycDW7joikblbA48Tlw14bNDlif5/rjd3z8jYnbc
	z66qUwNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PIQ-00000002liB-29fZ;
	Thu, 31 Oct 2024 07:08:42 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PDK-00000002kSJ-1cda
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730358203;
	bh=0LhzF1eZO0izMe91R4cLDD2hqekd2yJ78S0js9TCEkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSHrLcIQavfOu5jndVUyp3moeN2WNYQqwpv6lKrnz0BCVLQCf1F7FCCatCJEZ3RRW
	 qSeAFYcOuccXSwLFJYWeB7B6RzKPf0L1bbAULmlx1rTHpemWzpmF1dtz86hmpKua0h
	 ZOacpnND60l/ExC0WrTkeoTrrBuuBn1q8db0/4qqGI9C5/0I0tBu0vnXvGvbEUHWe3
	 RXpbCgrbniolgdQD09krx3sSfMLEsbohaswtDK4mqOjDSjDFCeqgvGCJ8aXrEPTuf3
	 yI28ILLij8e4jrBbjfQuy5nD92jwtpJ+Hn0Q+vat2z1cbtGgJ8YRCjXB70vjyKpeRl
	 Doh8eG5HYQBzg==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nishanth Menon <nm@ti.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Parthiban <parthiban@linumiz.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Cody Eksal <masterr3c0rd@epochal.quest>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/13] dt-bindings: usb: sunxi-musb: Add A100 compatible string
Date: Thu, 31 Oct 2024 04:02:18 -0300
Message-ID: <20241031070232.1793078-6-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_000326_567486_8903565D 
X-CRM114-Status: UNSURE (   8.22  )
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

The A100 MUSB peripheral has 10 endpoints, and thus is compatible with
the A33 version.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
Changes in V2:
 - Fix ordering of compatibles

 .../devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
index f972ce976e86..bb5010dcefe1 100644
--- a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun8i-a83t-musb
               - allwinner,sun20i-d1-musb
+              - allwinner,sun50i-a100-musb
               - allwinner,sun50i-h6-musb
           - const: allwinner,sun8i-a33-musb
       - items:
-- 
2.47.0


