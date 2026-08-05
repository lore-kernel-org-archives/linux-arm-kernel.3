Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27CFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TqFqTq8OtkT49OqMWSzdruXl5NKOkBcHfD9uz8H4myk=; b=gW4SWVAv/3xJ+EJtJucka1TXxk
	f7YC+Hf1KKUn6uzzG0fyxHq8TyMV8umYJqk3AIoF6Tfch7JuXc6xVbvv34u27UAJDUwatkEeGDZ7w
	mKy+SU47dJhL5CmZ3i63jysK3c6dAV7MyETp87yH/IZrHllSNHIaeJrf5t5biO3MoHHBxzg98Zjhp
	nH/Snd9z6EtS+CCr7pWUoqoVXf7hTz/6xfJNHe8bFWnjXdQU1FvqgcrG/ZMozOAqsVeE1+zXsBT3C
	0yiiEJ3dj0U2JkRlamdLdc0CWue1PTqDC4blECdk20zMKPgauq99X81vq4MO3joX4deQFa6weMA2U
	kVn3xSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgsN-00000004QXE-1dQp;
	Wed, 05 Aug 2026 19:02:03 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgsK-00000004QWi-10ly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:02:01 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso1637297a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956519; x=1786561319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqFqTq8OtkT49OqMWSzdruXl5NKOkBcHfD9uz8H4myk=;
        b=FshlLTuVQAe/3lX6/5jjx5w/LJgHErsVWi8gCmqrgQQBN5E3qSV693gGdttERKXzGG
         LQCIS1j9UFr31xzdzVza6Bo+osY/h2pFb5a8aEjz3s1OgcPCXxMPFU7TkRGnWJKkQDKS
         sxsf/Pv3rC6Xle3hgjzBdyYvrr3wPiGJXllp94z6b4JjdA0OPUOCG4TvahTb9vRwxV7j
         IGDti9+QTPgLO4spPVaHoewXZJIRu5p8KA4ggS2jW+iPICbfgrCWgBpQjGaGI9BrckY8
         vvCscW+Mu65bC2qFgOFYJDGiQXIqsAECk36BoP6QvX+vFW0bCN/sF0/l+80t2LD0rON6
         7DZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956519; x=1786561319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqFqTq8OtkT49OqMWSzdruXl5NKOkBcHfD9uz8H4myk=;
        b=cpkFAokhYBdU/J3bUXdfIYvbTXwzbKAooHZ14l7GXw3KXWSPFr61F1Lbo5jP+ChM/s
         vU8vx7gmgXWDF3lG0gw0J3vqEFvmZQ9WwZT9WQ6I2YtUm+/cS4vsYRAcyYQdNuxE+8gX
         TtPDZgJukgVP3iaj6YJ4YKQJs16P2UUZs8OxP8omEU0ZT/GyyimEJWnY5irFACIURrJA
         aCIE5SdFWB1oDUwypsL0LmtQZy6mS//D9Y2WejL7AnbDEJQgEd/DhXbIYgv1SuQQSZTF
         nD0bN4ClH1nSP3/Emmg6BPy19e0PCLk2Xq7tYsWMgjNxyZYOeZapnSaGmjr7oN8hzeEg
         dxdw==
X-Forwarded-Encrypted: i=1; AHgh+RpAqN7baiYOib8jj/zPA/djyrhDarA+Y9dacUZHs0FibOoGu9c6UeQvPDAWpt+5SSalzxqYNqw2Y9Q5d+7PHhqE@lists.infradead.org
X-Gm-Message-State: AOJu0YxRwP+0A2Pe45aUoNT7F6LULQfva25ecgQb4j3qeLvB1UQqKO+i
	R+vZ3lz0oh5WqK2rbaXgROCv6FhAz08ZfcnAkHcg44g/6sKJB7ANcorp
X-Gm-Gg: AR+sD11L9oYOCFvI9lw/kfwZc9eAvwnswfmOIAcHvQawc5w2cdUXYIaTFG0YK1J080+
	pgxj8egMjtWEQmWKvQ+0IW/Ho1zvkTQpgtdbaJvcOe1efldbG9EakHMjgUUgDOD1nmKBgJamQiP
	XWfTQS3lKTt7MUPofr9llp9Pv99m6OGh6w8adCx2HlYVUfk6ZBcoPfoOYLl1TncYUxnVHcylyFh
	ZN3OOGLiP15PB8qzo0qVgjeoY1JmRrI70jdMaS7Dfdm0ALlulQd4te9Cxlzor/MwUwzrJvoRHeB
	s8cfSvlPv1yHYyWUkzW0YzSjr18c2njDy17giUtSoSZgVKxnVO6QRw95mghXKArPlH7vUxvea0v
	Nc5dTsYt4jDRYmQNChPKu4dRQaLmNMkOblbR0UuYNSTIrM6jMCkjAOc3gUG3FZmgQweabUECfPQ
	BFj1MLJzj63GQ7c+hfheTW0KdKnK0l/eDnEOT1zR5UgXR78bMPsONUptli+PplGZS12VAhAFSGc
	JgutdIhXoOpOa1cpvc3WcQEB7kMUousdc3ozkixheZfbZDnpYGs1fkW1wqQIzcOvyGNv8rXxqdx
	3Sv6pyGRl1PSjMf7gDa1uOimx/jjIGT2R+/IWg==
X-Received: by 2002:a17:90b:3f43:b0:38f:57f3:4dc6 with SMTP id 98e67ed59e1d1-3903c6798bdmr10543809a91.21.1785956519158;
        Wed, 05 Aug 2026 12:01:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5e21c7sm2023350a91.3.2026.08.05.12.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:01:58 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: AC68U: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:01:56 -0700
Message-ID: <20260805190156.6942-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120200_282677_0BBFBA5D 
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
 .../dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..af20d38fa90d 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
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
 
@@ -83,3 +92,49 @@ button-rfkill {
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


