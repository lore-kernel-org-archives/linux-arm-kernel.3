Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1E0C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=; b=RzYkSppW8kElE8PafepKta+GCc
	3HdUyw57F8rFjAiD1+C1fFJ5dTlZrztLwO05wANeIgZEQWqg8WI7W5hwIAl2Nxhl8kal5V81dZyfZ
	i/tu5zyoS3qC1RUq3ygz2Y2G6ZHctpcXoD0+zo1sIY5CG7Nk01/0TtvOHjfvDXFjW35QKpKYT4OpB
	7RpIzA4Sj7uTr5pMA5zzfgRPQ1nhHKAJ+CVzD3PUIklT5vLdpIep1vXfHI5qg8jqznQz+mtITZL7A
	ZRFJ/q4LQLj/2YN79Ghq823ialaq2zROMD1uUL9Psg80yKwdRHpZLc3v8cOri3CBFxmItAt3f0zmp
	SJ6KKkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56nK-0000000HX1q-1aKJ;
	Fri, 11 Sep 2026 19:20:18 +0000
Received: from mail-pj1-f41.google.com ([209.85.216.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56nG-0000000HWxC-3wsX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:20:16 +0000
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39b9a99469fso1255365a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154414; x=1789759214; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=;
        b=PRteOj9HoCaaalwC16d1U+MkNgUdsXp5RLeJlqQMVeo6idB58vNnL1NRKm3hIi+7Ul
         AWBIPzMpa5+sdwVdHhTor60LpNK7G5APP+apYznk83BXv8yN3UzP5GVM6VfQMYA9VH3d
         unzJNRLP6HjqQmryTaErC3vsgZ9yLN05JJ2pXFWvvdei9fNUUxMRxgxzp/zmXGugWf3Y
         2xH9N/SmjunnJziLTAfMWIzak0dMjA64Pe5KXxqgXoXhdFylyh15lDVD0h41y/4xMJ03
         0BvaPZC2npjmS7MI7UDQjO0mSEiPlyPOvAcVeRWSYxckObMEVJGuYscnID9kJeFCdqhl
         lIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154414; x=1789759214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJukEihkZ2CZ5UwvR+b+a8gy04XbjNXCZYq/GVX23J0=;
        b=m8uKlAfTYQv7KzZuWQCsrwRCxGEmynVw8WPfFoXbHde/cs0fyTHUr+1ru9A5uVsGgv
         VyeUSxYjJ7+UGU/J77JDZdvYcwLCmvS59U2HlMzzohHi3f1yexSmGWbC2P4ysOccl19w
         yjVOdYGAyab4UgHC+sY3Q7fMJO3CQj73kVBJq592nV1b+xRzj1FZXJeG6FGsVgR/w45A
         ylw2i+LoE3ZZaHSMT07ApDNheLyogfv9tfBXDpLPjBf1baWdK8CcfPfNATt9oa8VrC7m
         bjV6D6GZcCq/tdJODp/yJCijyFszuy+kCGDqpWjqT5PcOe+PXGJW92ah6VAnn/gZLW1f
         BOSA==
X-Forwarded-Encrypted: i=1; AKwUvBzgw80WrbcCALRZJqzXBlX/56rwTOaYhQFEDBe4Ghb8iNnbnFSX/tFliqJ0DR92dCpv2uWschbUKVakgVSx6onW@lists.infradead.org
X-Gm-Message-State: AFuF++m8G7mXTwQIRpjxSHSas+HWUleYnRx5m8VNBAR/E54vJeOG1OVi
	wsS5HtQgwH+dMuUCMKpa2hDojq8kJ6Ie8dxYMGLbKf9IbgeFh9BraFG3
X-Gm-Gg: AYBFou180k7VmMlMjXBtOhZyfmmyF95Hno80ywU77thIIYUDkatngrKagQKRJjhIoJn
	LBB9WxeRelCWAmpjkCKXRdIsH+8A/z/OnLHlfOqfhDNPPrq3ycvfd0nzEKJSm+tTBH+YYECJlii
	cpWPqiAd/4noYET01jZZI5ovidEah7foovbHSjtuHBClySigveBb4bcaOaRE0ZIxcgui3rnmNVN
	4F5S3De82ZH1GL8ENigY+i6+Y2BWrcU67BlgaYccqDARogUNipWVOsI5dN45rH1S5gGRxAQEtNv
	iOrs6YgssOfnHoGQTWlHOSbLWFKCm6BsF0iA6kfRVXxQivfa8XQ533ySSLRdDG6pEYHFgHqeWDm
	7+w2Wq1z+ziVJPpr+gb9aScGEBNtc2L7cfXbUZUoUaIMQZZMyXgHn4Ex9tHCSoNe3YH8p9FYBP6
	lOld1wYWay4J1A2Qo2zFrdKiG4i54j5lHebQhzUxqkxjxPglwFUH5CWh5LciS3YeaaHZpidEc3h
	Z5BUoAw6bHPi5rdJ9RQWcBsZfLisMDtCZy8mCUm1Cgg7ueM2CKz0bKjDzJjCpMEh9PMH6QtQp2o
	eJqnn5ltjewL8yVhkqCbCKyDoLAjb2063qH4xIKrqrcfP6Xi
X-Received: by 2002:a17:90b:2b44:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39d9c1bf032mr9565003a91.12.1789154413950;
        Fri, 11 Sep 2026 12:20:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95994375sm6375296a91.17.2026.09.11.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:20:13 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: AC68U: add nvram node
Date: Fri, 11 Sep 2026 12:20:12 -0700
Message-ID: <20260911192012.81280-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_122015_134262_07193C8E 
X-CRM114-Status: UNSURE (   9.92  )
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

Add it and set for MAC gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 instead.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac68u.dts
index 3fe17bd7b86d..6e82d2af9f1c 100644
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
 
@@ -83,3 +92,8 @@ button-rfkill {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


