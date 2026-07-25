Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF506C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 21:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=seeewYXoR94yHU0Jb4LssP0T9jXVvg/3bB6Rnh2Pz3s=; b=aIq9KA0cqrJ7TbufsoFOpSIBAS
	+MzUBJmh33XBBs9QbhhQ33bghI6Gpv9CCggGiSsi41U52/SgWlxy5x7LIpaAnYVprZrv+YEmDBjHP
	bgO4ZPgoHOP5lCHb2FZQU0dZziPGq9FCag5QZCZOlWBNj3gXTB95yV8xqkr8//e7KMlXRCE/M/hAl
	TZXWJDJxf7nR3KpcrUmQGl1t+IDI1FZwXr4Cp/XPgKtu4HxS9JQTMzoA60pYe6k6vUInszct7wc5H
	0ev9OpeR6dXMlU9orocYdCZERazfiOipJQFRBVAI1DFGYrrp9vFi9esUpETZyl6zHoRsnkaWN0vuO
	BEp3rmNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnkNu-00000000jmV-0V1f;
	Sat, 25 Jul 2026 21:58:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnkNr-00000000jlv-0IwO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 21:58:16 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848d21bbaffso1617269b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 14:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785016694; x=1785621494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=seeewYXoR94yHU0Jb4LssP0T9jXVvg/3bB6Rnh2Pz3s=;
        b=r7EbyAhREqb7NOhLjEXE94shza1bh58RB5p7jQ8MuGeHicSZcuRf0Fu7Z7G6kWrU7B
         KEqXA1WUfdIMegLu7HiuhBEtQPD6KMtqgp/TYU7QRxsdGu2wXF3GjFqsCn8fqmTCNz8/
         hqo6Iy5dDtI94uMketElwxhVmYBzZWJBs57ztfCr86ZJul+mT529lYd6aEVPYNFyrGIt
         RLDv/TQuiaKqLnw6BFr2o6v0CRYEKpXGWnv6S9lsNr7AWAyM62o/faEsxnX9Juip9t/O
         IRxuo58pYKya3LRWuZpgkGey0K0hgYVF+BqWN/wE3M11HErEwp7nrwThyAiTKtIuoPXW
         IYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785016694; x=1785621494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seeewYXoR94yHU0Jb4LssP0T9jXVvg/3bB6Rnh2Pz3s=;
        b=ZqXFmmvPmpCFeZJkR98WQbkWUz8W7J04M0ICzkWzXLitrVuccDVeA8B0DmshBQgxQl
         nleGAmGImMh33KQM1vEEAGAn9wLh89/inHrITWEP1KmCxkWAjcOHb5PQlY4ly9ZJLODY
         MuzkhzqwgKWNIRiSLcypHYgROvVcwSuofjFAaOGj5JJCpQrmSK8BjhsoOA37XvZHJC8L
         oJoeetD8zGvqJPHfcXNayjNUa2mxKslfZmpyjsK2SA8hiatvz6/fB11TE6H3tNSyCY1N
         VefXtRhzuoIvxP7xoXCJRRufjpxQnG3Lu1XWjR61Jt90xY+te6mxxURD8jShiYmCyoiA
         yo4A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0sYBSjerAma+BETB22aWIysO56lie6sOZLfdITPhtcRf/NOwSL+9qRj5xaOd1tDXKE0xGaSMspEp45p7bgO6E@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvfc9tKFDlN6EJfc/sqxta2hXreuOB4sUOv4u4BT3grbIEKyHb
	L0nu5XBkJcgNqzhR33UrNBFZam3B52UQoLwm9rGyFXuaGGt6NOx2hRit
X-Gm-Gg: AR+sD12u9Sw7cahG8JouPRynRHFOP08NwJliR868u2SsdE0+BVuEYUfpM+vN3hQuRvZ
	va/iGFZBtTNcM27ePqQ+YK31BH9ZpGj0EkaZL9QVqXeZFgzkfRuKA8sqFmQIUERn35dil+cvxES
	xxXTfZghAP1/WqKqtlad+nOPk5G00YIKRvOpwMsgVPriW5Qpxiu3qmpG3y3AoGcDyMTM4hNAtg5
	ZUqk+qSf0pJk1tHpjSrWUtYx9z18n2thoGOybjNDW6jDB8bzvzmlWsFFnUnm0jk9bRpZdaZi1/s
	ZIBvnJoeCOwHmsq4wsCGrxH37o4JPDmhwENRH08AI9JP8VUnHZMKIoPdaCu1ZRvn9tgVO+EZjvi
	7cb0ycvYGUcYHG49yX+fEgyAFoafqGRRbS/bwO1nXHb1H42v3eib7qVYg0dP89TEkQr5PyyHYMn
	MPoeaXhbpl2XxHzDW//k8dOaz0oKXJHGWLx1DSOU9UTz9zaoQTpRO1MURDDrXDunl5KVXAiJR44
	Wsfj2TxJFOR7Wm+mOjvNgmy/uRjtHTkQu9MU8pAKyoRgYeC1XLSqmw=
X-Received: by 2002:a05:6a00:8d0:b0:848:60a3:bdc2 with SMTP id d2e1a72fcca58-84e5956c456mr2427856b3a.60.1785016694068;
        Sat, 25 Jul 2026 14:58:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5327f3fbsm1375376b3a.19.2026.07.25.14.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 14:58:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: EA6300: fix USB3
Date: Sat, 25 Jul 2026 14:58:09 -0700
Message-ID: <20260725215809.9464-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_145815_120221_5EEF9007 
X-CRM114-Status: UNSURE (   9.21  )
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

USB3 needs to have a GPIO pulled HIGH in order to function. Add vcc-gpio
to do so.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 44cf867b223d..a772db0121fb 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -51,6 +51,10 @@ &usb3_phy {
 	status = "okay";
 };
 
+&usb3 {
+	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+};
+
 &srab {
 	status = "okay";
 
-- 
2.55.0


