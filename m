Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A38CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5P9DPC5Eh+uVVTafzh7x7snkd1B5+EyEah33pHMIwQ=; b=2FZYhgTOqFbz6GvPG/Hp6JogwO
	Jv+JpfiLOz9vQ/K0d9YUqeWcm2zaYgpT8l87XaDb+VwtE5ONi273dfyp9jYEnFHg9JlQNHvgycryQ
	onZqWayQ+73JH89B/jNe4cpj7vCzsy9rCEmTAQzvY8lYqPF6wEUM+0Tk8GMnX2uRguRLIfNc9LkyN
	9rRmL1OXko0GCvy2Y1xm6bN7yOqRZIbCDlB4I7bkqWMlKc/tRK0n9P/Gp9xzYUWjJAOdTcODaJwIL
	dgZeutC3shWYCLo+6f5DpZ2wnArNy+y2t1RNZEGdmOd5Od/LvBCOWJflxbAc4QZSC8QJ+f+hcvWuM
	IcuKTGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQn-00000002Syi-1trL;
	Tue, 29 Sep 2026 06:35:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQX-00000002Sny-244Y;
	Tue, 29 Sep 2026 06:34:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E0AE43BE3;
	Tue, 29 Sep 2026 06:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0F391F000FF;
	Tue, 29 Sep 2026 06:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663697;
	bh=b5P9DPC5Eh+uVVTafzh7x7snkd1B5+EyEah33pHMIwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WEf74tzi760yMiXm/BbqSALK+Gvk/Z6yTHrwf5Dw7KuP6J0npGpLtEKSx3rrYjVSZ
	 LV13LVz/HA1cwIJI5VjiruARVhMwmUXEcETebHuyi4BafWynRucQiNNyIg9Be1r71x
	 RP41zHiK92rwsJBal0/5h3VbL3h+CJyCVnpdNiDrmQWxedSn01IGcJfVlYrpCxYIZt
	 nv2m3WdyO1gK8gH3Fbxtra56t3gtQCJQKcsefHB3bxhbF1SkX2voL6xayQPhYka7xX
	 uymMmTKD8+QrR8SjIJFY9EalKMg4VcfCzrPhVJh6cjQKhKWQTvrHqKDWIbG4hGO7au
	 0ze0YxOxMg/Lw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/20] dt-bindings: i3c: Add Synaptics sl261x i3c
Date: Tue, 29 Sep 2026 14:14:03 +0800
Message-ID: <20260929061417.20733-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260929061417.20733-1-jszhang@kernel.org>
References: <20260929061417.20733-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add the compatible for the Synaptics SL261X SoC I3C controller, which
is compatible with the Synopsys DesignWare I3C.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index dcc21a7ab4c4..bd08d048d44b 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -17,7 +17,9 @@ properties:
     oneOf:
       - const: snps,dw-i3c-master-1.00a
       - items:
-          - const: altr,agilex5-dw-i3c-master
+          - enum:
+              - altr,agilex5-dw-i3c-master
+              - syna,sl261x-i3c
           - const: snps,dw-i3c-master-1.00a
 
   reg:
-- 
2.53.0


