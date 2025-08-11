Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1641ACA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 19:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb2EaVu+tw3z9feWzOl0s5q/HEzQlpZTiYkpCG3fyT8=; b=y1X499Ek3xurB4UWeW8QC/gENn
	cWUJ9E6qFBoa4aYol6zqcK9jNXjiIYeiPi7Cw/x6UbcwtCKzGogK+ElzEUF2HPDNU0ErgKPNTLcW0
	6UfrpMJqdOGfU3OK558Hm5e2WRHbGkw7VIkxOTbdYGiiRNCMJ2Tc1DEJrEnG53UokHmAQMAyEzMLf
	J7GuvtZZOb6h7jFxlOByD8HrWKEU9zGXGatdu/+HP9JxdbAKTtVUZ6Y4HZAcHnal0lAn3uZ1OLnvG
	/duJir9mFe0z5Ht1kpZpcPbGLAT+hKDo6BQP6bgMnFknSN/cfl9UlAFxuxS4M7YXHW3QvtAmgNeej
	sOe1vIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYbX-00000008ymC-438h;
	Mon, 11 Aug 2025 19:54:48 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXOb-00000008o8R-0WMt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 18:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Kb2EaVu+tw3z9feWzOl0s5q/HEzQlpZTiYkpCG3fyT8=; b=KwaqRM
	nf7axyBgTeTi5G7/1w2DSy71cJt4GDMckSdBtUkX32c6ImDU1y/48WPAUy2L7shS
	4hb2I10+7lJIcDxl6hn1Jdka0zApAQKg47XZkr5Do83CHAS73dAR4yZMCuhoIvF7
	Wcy3ko3mVLxXwftDYLuZF5o1eN9YF01ilr5uqP1hN1Oc51ylvZCvFgzsr6UGK/kR
	/dv2s7D+diRvTJQpG8qh0Z/4pYxsVMqGjbRav/Ov+lqTEKgS8U7xz1I0LjaLhZk/
	qIM86M6ifREeZnewrDPI1MJCyevUpZ8jj+INO0PQ4Ki703tYSeaAcDOE4Lo/KgrB
	D1V/6Tzp3S9MVciw==
Received: (qmail 2896171 invoked from network); 11 Aug 2025 20:37:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Aug 2025 20:37:16 +0200
X-UD-Smtp-Session: l3s3148p1@3FtzNhs82OptKLEm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 1/2] ARM: dts: cirrus: ep7211: use recent scl/sda gpio bindings
Date: Mon, 11 Aug 2025 20:37:10 +0200
Message-ID: <20250811183711.8980-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
References: <20250811183711.8980-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_113722_035080_3DDA97B9 
X-CRM114-Status: UNSURE (   9.95  )
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

We have dedictaded bindings for scl/sda nowadays. Switch away from the
deprecated plain 'gpios' property.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/cirrus/ep7211-edb7211.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts b/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
index adc74243ed19..0b15ccaa762e 100644
--- a/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
+++ b/arch/arm/boot/dts/cirrus/ep7211-edb7211.dts
@@ -46,8 +46,8 @@ timing0: timing-320x240 {
 
 	i2c: i2c {
 		compatible = "i2c-gpio";
-		gpios = <&portd 4 GPIO_ACTIVE_HIGH>,
-			<&portd 5 GPIO_ACTIVE_HIGH>;
+		sda-gpios = <&portd 4 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&portd 5 GPIO_ACTIVE_HIGH>;
 		i2c-gpio,delay-us = <2>;
 		i2c-gpio,scl-output-only;
 		#address-cells = <1>;
-- 
2.47.2


