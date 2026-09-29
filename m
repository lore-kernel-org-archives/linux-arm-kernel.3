Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D135CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otsGCK9Yj0FElBYZytvrsZDWpB+j363zGrFV5pkZmKY=; b=zewKntdSV3BEAhcM9DcP3+rgTp
	v9E+FQAVoONL1ncI4v9fVZgoQt74qInSEI7jSMGM0tJ3AuX3f6gMEwO02oihDcIAa5hu3zV4HvsW2
	bsGzytLKL47WODyxHTcfILjSRyTWbOxS/vF/XaDJykLrwMZNIK0hxn/cgoystOrDpdNnUtHBxt9gH
	UcB03LiLTp6uwp5NFZcSJ93LDRa4XDGEyHGfMnnnmHPte/YNyL5JUh0Y3PLxTVFJIPCJdmGpmuQrR
	y4btHna6VkIb4MapP65yD1FT+QwPA+RoW64QXgGTaD6sdTAMPYxmYzdZlhCjjzwRQdi30Bug9KW8U
	lGauLYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQW-00000002SnJ-3uSt;
	Tue, 29 Sep 2026 06:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRQL-00000002SiD-2wyG;
	Tue, 29 Sep 2026 06:34:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 379B943B79;
	Tue, 29 Sep 2026 06:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096C01F000FF;
	Tue, 29 Sep 2026 06:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790663685;
	bh=otsGCK9Yj0FElBYZytvrsZDWpB+j363zGrFV5pkZmKY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JAFY45LtVIhVi9Pbv+FCoTzs4NYUgeyT3jEqFsvNubo+FTqtdxjXIE18uEA0IYLeR
	 cp/EG0wE3ChJ0iwyDOiq9gPASOkaf79pAO0V62AcXfapLsFQsu2M/pun0bUyYKXz5z
	 RlM+O+KFtsLDbQGwNaDKV1Si/KpI3C9jRxGNQw6exT79FAezUm6Y2XnJdn84QFfzGA
	 f2+pwQwnSOaYgUmqkrYHOXqqDjExJvLjvRTzzMLqRJnVeAJ5n4fBYSG7xWZlWQdVt5
	 HLJUnIO9SvrnRm+fjnXXarRdNFCLowKdRUle+cbly4PHw1eOA1gaKz5YTAK3HbX+Tu
	 uObzIXsgZ7OtQ==
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
Subject: [PATCH 04/20] dt-bindings: i3c: dw: support up to two reset lines
Date: Tue, 29 Sep 2026 14:14:01 +0800
Message-ID: <20260929061417.20733-5-jszhang@kernel.org>
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

The Synopsys DesignWare I3C master controller can have multiple reset
lines, such as core reset, apb reset, and dma reset.

Update the DT binding documentation to increase maxItems for the resets
property to 2.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index dc7ee38001d6..dcc21a7ab4c4 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -39,7 +39,7 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
-- 
2.53.0


