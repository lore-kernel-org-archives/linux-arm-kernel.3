Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7162CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lviEReV2O7qW3pWscfgsrfwXvtpl6JlQC75z8L+KR8A=; b=lfU8VNL3qP6xiUcrgQFtWFEcN+
	gNUv8SRrvhIsbH2Cy5sPmajXIgMZg+zyCcwjQKHM1Q/7XVjz6gtMjk2+4IFhioawbuliAMHlMgec+
	UTC7GuBkb4Ct/G6v0jyyUR3Xbm+eoblY219D1cM8Tp/5xP8y7tR5o9B5hX8C8EjWaOJLARTf0Fp7O
	2ijrXDy0+X9NEjlj3DZl0SYAZizz0wy6V5r4EM/Sts9s2M3J/neMGHVFZthM/KwtFFvT0MD3dIXji
	Qu84DhSWHeQTnp9CnyBps/OmfZUEHO+DkkJqdi9g/qAyBrQfM8JW+iepRivbbevhkLhXmufakp7kp
	RLT1u+eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQF-00000002SdK-2XZy;
	Tue, 29 Sep 2026 06:34:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQ8-00000002SaQ-2j3y;
	Tue, 29 Sep 2026 06:34:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D734560A5A;
	Tue, 29 Sep 2026 06:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB091F000FF;
	Tue, 29 Sep 2026 06:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663671;
	bh=lviEReV2O7qW3pWscfgsrfwXvtpl6JlQC75z8L+KR8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f/+FWEWsZbpfnyRpenCgsAafCjYjw1JitjoDts7lYSsRjbn6FM+5C7Rel+jaZ/ZN1
	 GWuZsgOSkAWu74gLOfODfz5hbBlglv3TWq6rjC/8yCCxRQQzu7fziHxU8iDz+vY14A
	 yZhpOH6OQ9doUP7awqOTjUIWCm5K9+WLVM/czFNC4Da3Sc+CjeU0/yL6SB0gb/e0Mo
	 X89lO+eRCcVS/ksQ/BfzQXSzugX6er8lmVb2IpdxIuu0+Nem9eH5Ro0L/3SITtIkZy
	 MRI3AJbjQ/i4EERREmdYagucy2EjV/5TXJGyLb23IF+CFET/+zbChT+uByvmD7YcAF
	 2cgKMXYZnCHFw==
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
Subject: [PATCH 02/20] dt-bindings: i2c: dw: Add Synaptics sl261x i2c
Date: Tue, 29 Sep 2026 14:13:59 +0800
Message-ID: <20260929061417.20733-3-jszhang@kernel.org>
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

Add the compatible for the Synaptics SL261X SoC I2C controllers, which
are compatible with the Synopsys DesignWare I2C.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 467bdcbb8538..ca2921865b97 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -43,6 +43,7 @@ properties:
               - mobileye,eyeq6lplus-i2c
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
+              - syna,sl261x-i2c
               - thead,th1520-i2c
           - const: snps,designware-i2c
 
-- 
2.53.0


