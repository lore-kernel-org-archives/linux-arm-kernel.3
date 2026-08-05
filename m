Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38144C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g6Zx9MMf0Pg4/4OBtLDCXpT3pxD7pmCxig4VWLsNJ8A=; b=ErFXFoZ/uU5d6PAnqAG/6bUYiv
	kzTACfNxXVVUzpufECucIdB6TBD/wtsdZeJ4kkfYdeIxd4VQX8mIOBU2PKhPphX2v+wPAvDXfUOHi
	LpSVVb1lB6vlQ4RLko4yIDdSF1ZgyNgLh5LxEYZyDoidFmpLjwA/uStEqFuZcuvd0MFHxCrj1Ig9y
	UNeM+ms7mT8b7uQVpGBPxL1fdShmmCPopqFLIPpTKHKLyp3VrWJRddcmh83ZZ523I/4wtvc2UOwi1
	VXi87pXzt9L85kcZNIX0HUqGGN6JXNNvsnAYC0Zh9FSJRoy6naguej+i0jf7R1/TBfhlodi2rfv2V
	vK82d7qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgtR-00000004Qc9-2Zaf;
	Wed, 05 Aug 2026 19:03:09 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgtO-00000004QbY-3eiq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 19:03:07 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8486672f03cso1734445b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785956586; x=1786561386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6Zx9MMf0Pg4/4OBtLDCXpT3pxD7pmCxig4VWLsNJ8A=;
        b=TR4jROJ9dWz8rzLjisn7MlRDKVj5O9PkVL8R+mnMBmCa+Mq3V5LZT21TmJdwtal3YY
         XixvIwumio8YTODxrzYmoYbpwTvUf8fLC7oA1xHGT0ZxR4OYrBo+6XeiZXQpJGz3kisH
         ceHxEnzNfs0rvOujCbusyn04M8a2pqd1n/Wo9jkihOHwn52O0Sqi0vA7yQPM4L0Ek6OW
         rZdBlFn27DpXRd/U6DCMMQrPg46NEBy3aDMOzD3qoynKsepnUsi5iUUy4AQxCxy2iACt
         3h2FsuueuQ9GSUIkD1OVXKLobbCY3F7sdefyjOsTQTujCHbvR4Ec3tmqdTDB3xbWkq5Z
         Z4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785956586; x=1786561386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6Zx9MMf0Pg4/4OBtLDCXpT3pxD7pmCxig4VWLsNJ8A=;
        b=XuQxrKXLdXh0ASKVMgmhIP8zUxrLDD9Ay0IJdsyWqxG7pVXAPksy5mTc0lh3Po5tnq
         Z13lLjiDgib73nCXn+a399cY63qvFsoV4nYMNVAI7nb79BgZ2dosgXqkqAQ2AFTrgtKN
         099mr5wZU3OAPMG4wN63vkjAOYFbpvFrfqG697MpFTYaQSxmSVFjn6Zl9v09JtnJ4LaX
         qX62Ywt8v5MhAtnZliPNisfAuc/DsrLjHh39JIlBZbb2G35Y1J9XhZdBRG4eSA7ojzom
         tBSKpW85rWerwqp/A2idnQIqYoDvTS/4+i4a7HaNv6DtbXsfaLyPGYyg/ZZefy6pyI6i
         pq4A==
X-Forwarded-Encrypted: i=1; AHgh+RrnvzfpObfdBlpFRJuqnqW7ULw1GjjZw+jgQSuXanjm5MR/nrDYZnQnAKGOCUZL524D34etao0/cXVlg4/sjsOL@lists.infradead.org
X-Gm-Message-State: AOJu0YznTypAFwUVCeuUxuCQrDN1tcGLQ+AXgkO3gglFusX8C4gjuoHS
	So9/DEn8RR+Gy/6v7Kgem0CWtqCx8yoDUi2ninwSxcZzauC84H2mv8Kv
X-Gm-Gg: AR+sD1105Wu8197wQVHi4LOY+FPv9OY7v92Qsb93ZRExKBvoF3/kbgX2ZZMtPtzxx7s
	7oJgy0yztCYkNSmLPx+yFO5UilocvlR7ZiDKvUMV3YLKyoUI+YLdOfVhXIrO6n6GUjWj7kYr+di
	RN61mHrKiwcb7hTcZBD21dgRup2CwvIW46X6+t3IrUoSCtbf80XN0eDL5hD4Zvk2mgNd4K2iGMF
	a5md2OcEJuauslrqx7upsdFOqzL3FdzZq1LaWxsGtaodrZXZrStwsOT1adN3idNLTvmib/BZrjf
	0jSQ1aEoINfYNt8vEnrJyb1L9NZIazlJ6Gwj5vlAvUeBBrigEd2fp3CnN7BB/djWUup62+Pb5wV
	89QihZsSFg4/sjZL3tgZFuRLrtPUu+CyeTmNL4gRjugGGkU152O1llJB8JqpH0ni1ZOYjRkSbsf
	EkxpmeoV6fkgpePlM/C26BEJf+wxePCWpL9pemN/fBt/NCQ9niBM/o5hdmCzbSsHoeMglDgAYrj
	szQJqXCS0GsAX1xSQwqm5HWG+OdPdZK7MlXJpTmxys3zpAmmpbnFcu5inpTdTf6WuaXijoYRBAe
	+mW+q2ogTiWSz50lrjieWemMQ4Lz66K4+8dQHA==
X-Received: by 2002:a05:6a00:4fc4:b0:847:99bb:b6d8 with SMTP id d2e1a72fcca58-84f2e009b31mr9523653b3a.26.1785956585855;
        Wed, 05 Aug 2026 12:03:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e533cdasm1295125b3a.52.2026.08.05.12.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:03:04 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: BCM5301X: N18U: set WAN MAC from nvram
Date: Wed,  5 Aug 2026 12:03:03 -0700
Message-ID: <20260805190303.7098-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_120306_909133_D965C4C3 
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
 .../dts/broadcom/bcm47081-asus-rt-n18u.dts    | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
index 3854db0118a9..5472d7e13aed 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-asus-rt-n18u.dts
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
 
@@ -77,3 +86,49 @@ button-wps {
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


