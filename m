Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57218C02190
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RpXnOFSFJsdENn+F4QFZFC2yQiCx8f9L6Vgq8hk8nTs=; b=zHK6BiQ4oKg8dLMYDL8aNQNzoa
	IyZWFWS6bGIbTs4pzq7PfX++zttLsPERaZ3C5ZPinru/BEX5l43am1izw5WxZmL7TZrRhYr2LkgoJ
	SmK3rR/BYK5rQZ7NmaawkjgH1Ri1TX+FjzXxx3ZKNdAr/ZcSKUl6Gn5pMncFRVeVJ55r/kMpe9UJH
	YfC/qWbDT9yB/Eriyb0qOrGwC8t1OjwIlYH/Om+M07VwVU8NRlJtP82+yK1xC5I1heUrho03JwqJr
	FtrfUzV+ZnlCPNujklyIA2U07loZEZISt0d4OIokf0Ya2/bv13CIV4Oyh69/hw2xz6g/zCKybNHOy
	lYiKrzSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdufY-0000000B6P8-3uo3;
	Fri, 31 Jan 2025 17:19:04 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdueG-0000000B6Ep-0sjM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 17:17:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5db689a87cbso4162143a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jan 2025 09:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1738343862; x=1738948662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpXnOFSFJsdENn+F4QFZFC2yQiCx8f9L6Vgq8hk8nTs=;
        b=Vyxig9dnBCLo7N/CWRnekN+B6VZ57IlE3Tx6FJqCkD2hiG0EDAtEVDSkN8ciNC0l05
         wBipdA1DRfXSfsI85fI1LLcs4twFObaTdIsHq38cEXdNgLgUIMD3ov1eOQWh4QB/WdJ6
         o3ICf/fZiG6BVmY9CMl/wlYestRRPDeg4uM1dRTuCvs4cQeGqDTVhFQsHZ2INrfsfY7y
         nzod5XDGXzcdZEtihsolhF1t1FbItEyVSK/OQ/K4hLL8Yy9LYbAyu8wMLdwp89zYefJ0
         eA1dInJ+ZGeKyHqmCp6mAZ9gtOooUavtMDN5cghBs6uThckOgFPEFg7lDV4hf7dtZPP7
         5RxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738343862; x=1738948662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpXnOFSFJsdENn+F4QFZFC2yQiCx8f9L6Vgq8hk8nTs=;
        b=ljzmi9hAwlWXNKqOcEbXmrWTdHos0O6soeC2a/p+UbxNBGlfGBXP6jzGMIf1Tl0Pmf
         c8wOu2oBvBh8wp275SSzgbBa/kHUgiqylWgNH35NfUsafK2DzZiKVpMFivAvRqB4UZd3
         jE1SYjVnHCStwCxW98S5axzUSqeomnNaK5Y2eXCYVl89WxvGDGNmtWChl8eCNI6W58wm
         JdP23YWOar75YuLG1kFrdXd1acyvbPUEAGZVRW83eiymhTB0sy14+1xRZIxSVhN2VoCr
         v/of5jPzWT4ASXaHnGEx0Y+ttvOPfYJoTXgYxlY6ZxDsnB0CHlZLDl8xxXcVGy2XUgMN
         NZOA==
X-Forwarded-Encrypted: i=1; AJvYcCXfYFwCMP4ROnD52dI7GJhoaBuCdEAHCKxZonLZ2Le3FdO3mRc3mS+4nuE+oVkcl8dyl2l/a5fBc299M98loKe4@lists.infradead.org
X-Gm-Message-State: AOJu0YweWl7oyFAcOLOdq7HAQWfbBt0dEEDWZ7UkjR8ytY5/wB5UXjvO
	WuHMFMr1Uw667CZKY0Ga2LEX/Gj5oH6yTOO5bo4Itkp8e0lohBC1BGBMTOkc0KE=
X-Gm-Gg: ASbGncv/TD081RpkbN2u++3vq2F3Gh44Fm1PL9IFbhePoGSc7CYxN5k6tN/enUEmwhO
	2w3YGINRNm9sF1v+l+d9bLCtEUlLk2G9m+Z80iW7z0pV47ux+IcT/8gZna5akR064NTFectQI/P
	RgP2EcAVBJcOQ3+QgYfWhkHijTBTIiMxl5qithwxVXJCkJsqNvwMf6pWMvszTWv5q5Efpr8MCEp
	OC9FF59tKn+8kIbmQJ2d+ZBJ5vj+8sNvd9IM3cQ9OOFmMXYnXxxhT4fcKfNqBEpHUgfCa6Ely7p
	KTMmNEPbAS22+lEYajSGLTbaP0OusU0En7cpk+bDxMD5AhhcXuPQ2Q==
X-Google-Smtp-Source: AGHT+IGXidhbVnMEkxJ9nSeFLHOKD38PsRpg8PjrysVhhJk5DRufZNR0NxcWPKP/dI3R6fpDrAizog==
X-Received: by 2002:a05:6402:27d2:b0:5dc:8fb1:d44d with SMTP id 4fb4d7f45d1cf-5dc8fb1d71emr194616a12.31.1738343862022;
        Fri, 31 Jan 2025 09:17:42 -0800 (PST)
Received: from fedora.. (cpe-188-129-44-249.dynamic.amis.hr. [188.129.44.249])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e4b6dsm3142413a12.24.2025.01.31.09.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:17:41 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de
Cc: luka.perkov@sartura.hr,
	daniel.machon@microchip.com,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v5 1/2] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Fri, 31 Jan 2025 18:14:09 +0100
Message-ID: <20250131171739.1044701-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_091744_263326_24E52289 
X-CRM114-Status: UNSURE (   8.08  )
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

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v5:
* Rebase on top of next-20250131

Changes in v4:
* Rebase on top of next-20250115
* Pickup Acked-by from Daniel

Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..247835b08c70 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.48.1


