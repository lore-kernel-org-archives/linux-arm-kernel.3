Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C7FC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jqakO39GFUcynzLn+nQGi6r1pMcg+V7Q1upS+QtlAsE=; b=hM5RwYGbQ//JkrAFiSsyv3nT+T
	0YU2UKZWqUZQtUjuxnyBXUpg8ku4n5XqHr1EbaQy1TRTl35Hbe1j2hKRIzcxI8oy8Ac1VtNDHm1aA
	6kgS8YJP/DhalLRddvf5y16R9a2c5rqJZLbzcmdDChIaI4nWvJ8+0TZdzQuOd050hSXBleUKqjlpV
	qrZgC+zC3Urd/VyFarr1W8FBaNpq0pvNQA3AA5V6F2V//7pslwIYcY5oOIdS2JUVF4PVn/MUZZQyP
	raoEkHwbemPaeeMb2QXG7D6wTWNH5hmA+m7yw0yD/3csvGkz+s+GpsN/oxNiSGBVfwI82XlcS9uC5
	Ybu363zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrguV-00000004QkR-3FVF;
	Wed, 05 Aug 2026 19:04:15 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrguU-00000004Qk2-0BDe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:04:15 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso239860b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956653; x=1786561453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqakO39GFUcynzLn+nQGi6r1pMcg+V7Q1upS+QtlAsE=;
        b=ZEvMkFdNBd+52+NO91WLWQyApLfGxt3YRqOU1uTtjH5UtgTnq4q/XQ42Pk4YUSU3oC
         y7B4dH7P9FHg5n3qSQqY7Pm2g0l47Jlywj5P4Jez+KbsrGgEr+ZOXrUxLJg4ZbaDZmWd
         c936yyrOLgky/1jkt/zB11lSwQPWgqQ+ZvxGeLC4KTqrLow03Pjwue2rCTt4ESXUjSrv
         KnvzOnylmpZllAo24tujqAp4lAgwRhcRi0yzGKN89BWCySmvb6108trIHmXoPI2xVm+Y
         ixqSFeuYuZy2zGLpgW6Fm+pwNPsta3St7Oi7ei6f9RktVVpNPsuNhg/zW0ur7HZPscoS
         NviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956653; x=1786561453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqakO39GFUcynzLn+nQGi6r1pMcg+V7Q1upS+QtlAsE=;
        b=hJL3XScY+t9mZiiDrSJZ+mCAPJJDGP/uoLIIWoQyy1dqQsy9rh8Odc6Vec3OUhGMOU
         7oXfOZiA+F8V83yiOE5WukuJO6mA/3oopvGIlI8iOsZowvjboV1NNO7pmD7woxMTYxUp
         l0VjT2QKdeFY8XsDt+xXmR6gk/Lfur/L7+zcE2YLnVPU+jhdKBRULYsEFaSk7ZisnBNb
         Jh7fsSJuWhFWwXN6FZ1IEUFPm6RdgCAcewHXxrQCha4wSZ3jg6zBhqPn906oTFIkXORS
         fKDpwa0sTdCNl669+21m3wXQKRLm4xCo0gq96RxjbKFh9a2uNpvwbv9u2r4IvntkeYWi
         +VNw==
X-Forwarded-Encrypted: i=1; AHgh+Rrs+h0Groi2FXZ+yUJLjWsFmRAurc5TnNB6AckYqKUN2fXfuEcuob53WfPBB3DOJIrEre3JshwpBV4XYvxu4J1n@lists.infradead.org
X-Gm-Message-State: AOJu0YyzBuqwsYYZKs0+kl407/8+xwvU90A88K65Eu/5CuZQ3Nri05xn
	Nlr0vQZUZ+BSVLKlWgkXJyHTdRUAWExmWnPOTU5jy0naPjhBf2TdVNWI
X-Gm-Gg: AR+sD10iLxntZByhHLKgeCvKa8iv7SlnifEWMHcOS3szkS+E6FqKsxlE82gEjT7L/RI
	dG+ZtON1DM417vTVA/CK0qAzfPQod0F3nNchL4NQhslDt1FfxTqGUoxLeGv3cc8P5sW0qKsgmca
	LLoQ6Q1kVzBumZR7H5GyQC/O8cYEBivZvqqFWwx9HSFsCrRxxw129r4Rv8WA9Uib1qvvkoC52P7
	jd/7xgDH/YCJv/pgOKOFqpqeB5/JgspfNbYLO4gaKnNoG0zsFy1b0A1rD/XPrDEATtit3Vu1Isl
	P4CKygqzxZ7nvrOrKyqc0bEUyjGCikTQ3xeEqH5yzJrniZJQMwTsCYLdzDHGYt8Pp4YdG2DQoQp
	DRuVYSOyg7NvTDSER6iGAb+yXJQj2M7LwLPZQGXUMmXka54QmtVcjrfBJHLkN0IEvRQLBY45gjw
	ipn3vN5JNsyPoE+Cv0+7CaQUN831g3R2EnMebqrSHVxNHHkf8bnzz3Qc7TaI/7+8z+2VheVaCOK
	QT44Iy7xP1VD67YqmarC65aLw7Nz90h1esl9MOEkdi4k1ZGqD8TLdD2zN3ldgs8vpc/KtdbFzCF
	LbAnMmF6ZROCHTBBtS5YKmdPOp3Z8wgQiIUb6w==
X-Received: by 2002:a05:6a00:3495:b0:846:eaac:a5ea with SMTP id d2e1a72fcca58-84f41b8eb60mr1648444b3a.3.1785956653119;
        Wed, 05 Aug 2026 12:04:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e4d3926sm1309419b3a.28.2026.08.05.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:04:12 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: R7000: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:04:10 -0700
Message-ID: <20260805190410.7335-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120414_085181_DF82D927 
X-CRM114-Status: GOOD (  10.02  )
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

The WAN MAC is offset by 1. Set in dts to avoid having to handle this in
userspace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-netgear-r7000.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
index 24ba8f8f9bf3..66ddea2e91c4 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-netgear-r7000.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -104,3 +113,49 @@ &usb3 {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.55.0


