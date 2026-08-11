Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E965DC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=; b=j7+3P5aNBK71KHkD2xHPilMuJI
	mhKqzYBISM/jOdi3vAtFz3G5UadcI3UA4On5Nt5mmNHNlomLNLXUI2JMd3JXTO7V7N6e+P7dI+O2z
	lCXfRD3Zhctm0ROL6lJ30cM2BQHZNbTpJ8/UngDWik/Fe3u0+mQyugDQE44DHV//kVLod4e7VroWQ
	S6Qvp4SIHCZgDsmWMyqhaC2wbomBRsKI9koQfKOK3EJDoIIZFG2v6melw8hUYF/Sm44vDwJISHlgr
	jT8k+B2w56WPSSM/EYEGiBNvJykWt5fQWvapmtyEuzm3L7vE9edEi65xM7jOB1WY/ruS9GnlMCU0D
	tWqSsIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmLd-0000000E5Dl-3Z1L;
	Tue, 11 Aug 2026 13:16:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmLV-0000000E5D0-3EFS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:16:51 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49558ce01afso6967495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786454204; x=1787059004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=;
        b=P21gRNmFKAaovpTnVEZKjjEt/nE1c3qNQEnn5ABaEMR70O7Q0fYog5/G+bbloBV+oy
         ZHKU3tse3I5zvuud2lRTMTzP1zKZR5gcMVVZJTIHFX7Mtjle1MXvyKqpsbr6ekFNe54m
         Zz69rD0CJzutmWMWcYVOTeZpWsAkFuezXwfdoJ/sRKFfohsutaYniQ2GdWbK2sSY3ShD
         BsvN2a5Si+PWQY3+aq7TYlAg1QJm8Hc9wBv4jQGauRwBHHNXCRFkuEuKHeG0KHIwpIQw
         mUjtTy2YuxhLSMa7CRo1zcS+skMdJyDX/LE8K9bZU/Dg60vgjs2lPUsI/evSYBdjO4qY
         M4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454204; x=1787059004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gitYuIgMAmJ0oQcU7iG8TZn7YufiftcwyUkdvrQmLDk=;
        b=lo9uy2SqCp08A9dYtQtySXePHHAccmKnnh5LBp63dJdeB3X+7IJk5RV1kLgfUrWMR1
         0+3BSmtXxuvX3XDZF/yH0lzsUp2tbAW87pW3w2QkG+iqUYdXRZhopGVBCOnuwEsTA6z8
         e1BtwFMMngwJrUTwVo2L5TtJAStKaKZdzy/mX52EaYX1my661Lv5cLfTbZghWNXfnzUH
         L51Y8May8EM4qC++soBYUmZfRrdprEIVMH6Hk6P43G8UYhE/9MFGzfvf4HhlFiKDqCmC
         qVKwG9emYTG4i1acJf6tbxex6HVNJYUqgTNdtoWXrwGQHwjwgOWeM6clPG7aBzQ4mUJt
         RXqA==
X-Forwarded-Encrypted: i=1; AHgh+RrN3fjAvTJmADFzD6EuZqUqY8jYuLg4hKEVW4pNcFMCHSj9z16sJPFrl9YFIzjqtw1vHOyMp9QtqYd47Elq+00W@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+qH3OB4Lcj15ICAJj8D7NutK1u1xLOwhXRFWM/il5vpeQBsN
	KzmbPQa8v55dX2E2PjBmHuWmqI5+9r11oPDIpeHQSQcfc6dvxb9YVJ28
X-Gm-Gg: AR+sD13exGdu/R0jQ55Eem/TuT6DQPj+tOw7KQACnC9vEWwI6k20+3mTPgbO6UFRo3a
	ML+sGgKH/U6UksNQ2Jgl2iOTnxPdr9D8T93fby8/fRVPHHVOYTm2jUYde6wkQOCe1QpNbJrAO2x
	PWn88LNsF7g+MaOMAqzq7Rr5ChdxfECEYwzNS96uyA8IWVkIEqVTb/7Y3QQdUy4+GUkzXaiGhdx
	//yjpam/llqcWX0Z9tNAmeAUnJJpuwqc9tSsLFxitq256CCDgA8glS9iickPRI3z3mwAZX8uCNu
	XEJEFAQ7Dp5Pa6Yg0UTbMjJr2L6eQ1oAFCyzohtfaLKB33VL4wY/fMi1V8OrDZlP9KlQHIhyJLT
	ittxsUi0uog6c3iXZZRbUwgv8CKLVQiXZH/TYUZF/JfNgPL1BrUXO0wZ8RniZnFbnhebZy7ODmC
	dMHFVc/UoTvp4TiiVB1BgQDK0xwmLfBlcUT3H/Id8V5nc4hGwZNBEM0QXJteBvt3jR2toT8EXA4
	BFvKGwdnjiZTNFz8LI7eRx2Nxp3O5qRp+MWw+9i7cAW8jip
X-Received: by 2002:a05:600c:3b0e:b0:496:c361:fb96 with SMTP id 5b1f17b1804b1-4997a578481mr2356495e9.0.1786454203704;
        Tue, 11 Aug 2026 06:16:43 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-499788fd908sm47639145e9.13.2026.08.11.06.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:16:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: airoha: en7581: Enable spi nand controller for EN7581 EVB
Date: Tue, 11 Aug 2026 15:16:30 +0200
Message-ID: <20260811131634.703225-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_061645_827313_0ECC4CC7 
X-CRM114-Status: GOOD (  12.27  )
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

From: Lorenzo Bianconi <lorenzo@kernel.org>

Enable spi controller used for snand memory device for EN7581 evaluation
board.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581-evb.dts | 4 ++++
 arch/arm64/boot/dts/airoha/en7581.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581-evb.dts b/arch/arm64/boot/dts/airoha/en7581-evb.dts
index 886e2e4b5f64..3dc68dbf1be7 100644
--- a/arch/arm64/boot/dts/airoha/en7581-evb.dts
+++ b/arch/arm64/boot/dts/airoha/en7581-evb.dts
@@ -25,6 +25,10 @@ memory@80000000 {
 	};
 };
 
+&snfi {
+	status = "okay";
+};
+
 &spi_nand {
 	partitions {
 		compatible = "fixed-partitions";
diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..0964cd783013 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -150,7 +150,7 @@ gic: interrupt-controller@9000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
-		spi@1fa10000 {
+		snfi: spi@1fa10000 {
 			compatible = "airoha,en7581-snand";
 			reg = <0x0 0x1fa10000 0x0 0x140>,
 			      <0x0 0x1fa11000 0x0 0x160>;
-- 
2.53.0


