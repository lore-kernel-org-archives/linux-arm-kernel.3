Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D82CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK92kjwtQgzYzyqBYyYH3USgcFn3Hilolf2mqG5ssq0=; b=d9A7l6vbRzbVmm/qHAUfxAUiue
	T2lR2q0xLDMm71qafKosoyPv/0rqmsgJNkKZnXwY57mB0Wy89tFAtdFEmkL5TwrN1TTQj6B567BZt
	fDPxNUgZb2i+pndII8c4Tm4eVQg94RDkUsTzEUNTKS/l6olt35R1DbnUf5NZgyPOySDkNI3APDT1U
	KwbGUgovdFmVBjsD/aumbxJ4JlsfP3cvbMaWsvORjxCUbZHBUSLGgStx+QG6TYBKR7FYag6QEopKe
	bE1gW9gPUIfYR6nruejY1Eu6ekUKCk1wjX1IksAfnK59tlHJ3APJjS6G5V1fI6awAi4RkqokbnR0G
	LB4LUGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSF-00000002U07-3pK3;
	Tue, 29 Sep 2026 06:36:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRRt-00000002TpJ-3BPz;
	Tue, 29 Sep 2026 06:36:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8303C434D7;
	Tue, 29 Sep 2026 06:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FA51F000FF;
	Tue, 29 Sep 2026 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663781;
	bh=sK92kjwtQgzYzyqBYyYH3USgcFn3Hilolf2mqG5ssq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=drbxlan0e0renGOqaBmek+B+M/uFa2zUEZ3rW4CDYMXLv77X+X5lL471r1bKByjf6
	 t7TmXeheEY0v9VSawd7sbdeGYfsstWv2yh+Q3YF21ylwZY2xcKqvi0/FNw9ynIIrGI
	 QxOgxmxOpG7xU4YGiswoksx4cO8HCAiUy0+7faHjQWDuj03kQ0zPGuZ0Pe7HstQbUz
	 Ej1nJb4okzWjpqgFtkzjglqomyKOJONL7M2ScbA3YOZNUs/DHtioCLPGKxedo9Jg4V
	 4JGsK4xXLd27aVJiRJN/rZOwpA9Ug9C0xGVFQXA8HtB9q8Nd07BIn7062LAoldlrzM
	 dD4VaURkMeaAg==
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
Subject: [PATCH 18/20] regulator: dt-bindings: sy8827n: support standard properties
Date: Tue, 29 Sep 2026 14:14:15 +0800
Message-ID: <20260929061417.20733-19-jszhang@kernel.org>
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

Support standard properties regulator.yaml, such as
regulator-active-discharge', 'regulator-always-on',
'regulator-boot-on', 'regulator-max-microvolt',
'regulator-min-microvolt', 'regulator-name' and on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../devicetree/bindings/regulator/silergy,sy8827n.yaml       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
index b222adabc7b4..0baf93ca67ca 100644
--- a/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
+++ b/Documentation/devicetree/bindings/regulator/silergy,sy8827n.yaml
@@ -31,7 +31,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: regulator.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0


