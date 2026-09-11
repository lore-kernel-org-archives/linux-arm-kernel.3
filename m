Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB0EC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=; b=O3daMlbkPjJ0hAQnfk6uJukRix
	H9B0Xb0OE4/YhKgexmqZgw15XrADwjawJzpLi3jQEF183BJ2lRwOyBALFnC8V6GWnQuCUNS8tWQnJ
	Z0si8SoAAZ5BPHPX5hQlpQmlMuWclriGPYppFN78LdNXGEKTGlANqJRoxbXZdXgP6hzsHXz5C0vCG
	EDmDY6XO8p5KdTOblPyyLzJ9AqeTy1+D6Wlf3KsAtLpNy0/UsPZ2061tBqtuzVIx5nrNntnv1WQ4F
	zb9h9heZNJNO5Iu8rtfKoyjshcK044CtSNJY+aZCM6njPlAB+s2E/7h/vHivqqBK/G1sNm7RF3ePE
	XV/jG4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56lZ-0000000HWTT-1Jch;
	Fri, 11 Sep 2026 19:18:29 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56lW-0000000HWSo-3XSR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 19:18:27 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d8fb334e72so2444615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154306; x=1789759106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=;
        b=HRvj8Q8kW/VIIYLa1Vfmt0QnO6/7+8m4F5hZpVY9H6XkVehjENTuqmXPizmicAx8ze
         IXFESl+xxURt1e6vAha8Tfq+hNM2igFyHNR5TKF+9RShsRyowwqAuzJKbrVgjAJClB8m
         9hUEqBqKDU2/b3QibruuhdPcd7ghVdIeJCkEkM17q2odZuT8Vf/IninHMqTVDf5wVa+7
         dX58z5GUxObKt/vj7P9xHB/E4QkE+aUNENv4JAiR7hSD4jRyQk6BNCGVDd1/c/5SV7yT
         5rgMdzh+LhDoxvK+ZnuEmHQ7JCmPxeS/v2gMFA8M0W0K2JVzRyVeKGoeeJZQ9J2xP4pJ
         Ycaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154306; x=1789759106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8Ujftbx6uO4EEfstLR80Anc3hrjvDuwmMLGDrkFX0=;
        b=bWo1W4PGdKgP2UDVo4cwtVm/h4L2PXtj2OfC3zjF57lWyAtNvGYnd54mNeFpWDpP4b
         g/N24RTsAHNH7/tZMMfDW2oTkgJ/aew9pKKYIWsMmQ/2BjTdla43YUZRUfFB+OYURMSY
         c5fwqsnS9+2iFSsMx3AcYi1r5C6e2w/sdc6quE7gFaT4qhwBhMCw+svJn7jvIkD4/KZL
         eBb10IxlGlyvRQgf1b+QPuYJzRHQhZY1i1SHp/cfiDv1tNNdLOSrbHMWJ0+QWQ8bejO2
         jV2x+XQlAwQk3GmhHxQvJK9S/blN+/erpY+eTrw1PjtV/l/Fu9PftDh8fsqageuGwjXW
         H1ig==
X-Forwarded-Encrypted: i=1; AKwUvByS+W70D1JpseXZt7UU5nXTloC1DNTy9rP/5CTLpc3kLSbcREbtUppNmxHAbErGXXZC9XYRAp2FKwKwgZe5LY8q@lists.infradead.org
X-Gm-Message-State: AFuF++nlyDqSU17cf/RmHpy1MIP/MFYAQpINPtGIWgn0FO1ZLodFceUP
	8FKf6rJlA4Tfxr2Ue1RhawOLnUsuljwVSXgYC9gvgljBrqsJEhMdFSwM
X-Gm-Gg: AYBFou1ILCVLkTxEet86Iqd7ruy5pPeJM6Fy0lU6RdiqRCom5E+JDBaslFSLTbHYxiX
	sYnOdQS1+J8i8gOQDbrHVxqGUa1zBOtqNzs3EHedFAT0oo+SXHbxKHYd+OL3/Y7Lt4jlYYQquh2
	gXN3a++mwyHnZUUwqv70xk5pqLCf3hIMl7DlPGXOOnlrXzFdLrnStNhF1kvGKJ1l/PcZ/2tGw9L
	rhRsnsUtMy9hQc5Y0WfQ29lVOIo8lKTXrj7vvxyRZ0C+NRkfX2PhdllDPGYDe7d7uDGPBwXBfCt
	YdMwd2weloohpfmuEWB23bq94hKOOS8oNXuP8TIkaddT4qc2QW9juFxG3Ycjq8yoZeCmxtEmdMC
	Cm71dAJ0T6kYn4QcybREQ+8lWVFuHRwXeokfZeF8CQDwYgtOY4+4CV+/NlmBIgq6+w+DOB6M/H9
	Y3F7Z63ICpuDrGxGHsMv9hjdgVigSgjbO8EtN5sZJviIrPN/DF1BXkkNFHbe2TGwCIlLGwCqDM+
	CtM4KIIoZxSHmDixPiyR/sti6w8Zu8Lhx54oo9YWVDwXoKzCtEfYqto1WHboZOVzyJCSSiLvxPF
	w8e+HjdviD2WuW2WR8aRgykEhYJ2UjBnv3SRnYLyNDWVGYu8IyhAsy/MdpA=
X-Received: by 2002:a17:903:198e:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2dd2a1ea2d9mr111775205ad.6.1789154305684;
        Fri, 11 Sep 2026 12:18:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfcf48dsm16472115ad.57.2026.09.11.12.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:18:25 -0700 (PDT)
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
Subject: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Fri, 11 Sep 2026 12:18:23 -0700
Message-ID: <20260911191823.80631-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_121826_883821_AD342CF9 
X-CRM114-Status: UNSURE (   9.73  )
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

Add it and set MAC for gmac2, to avoid having to handle in userspaace.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: set gmac2 MAC instead.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..708599f8c4be 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
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
 
@@ -92,3 +101,8 @@ button-wps {
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


