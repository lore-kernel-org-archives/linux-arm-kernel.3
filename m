Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7784C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9imWNVpcHY4/YQmn253SAWo0LBrDG5vEkbvmzjj06E=; b=Sqt9NEKzOpfCLwRaaW1tI2L+RD
	rPm46Z367T3uzwFOlv7pcV7igrIVacxLQr0l/swvYnZOzBRYZkGfIuUlzCSj4CcmZYPplEEDFUxMx
	1RndccHFmAHwOmPEmIqmsLIYuOWDBvfHhbxcjtM95eK+T5oj7aTdY0c0+A5buYqELALF+BTCJGIhC
	JToC6x1GHUX06YJO/ggkBKTtbBaErGJ6ZuZpVqYRCcNLkOR5gn3Q861P62rYp0Pd/RpS4tS7NFRT7
	nS3A05eagVApamy50NxmdIRl1qyGWNJ+VmZUfh0Drli4PpnBAMFGykcajQ8GWfPi6TyyoNxli1IHZ
	KaEdUd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2Hf-00000000W0b-37oM;
	Thu, 22 May 2025 09:32:15 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI2FZ-00000000VSO-3Xa3;
	Thu, 22 May 2025 09:30:07 +0000
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso4577537a12.0;
        Thu, 22 May 2025 02:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747906204; x=1748511004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9imWNVpcHY4/YQmn253SAWo0LBrDG5vEkbvmzjj06E=;
        b=QSzGa6nV3PYUxYfuYOsSKI4I7/d+6rZIwd7sP3rEreTu0tSuE4y0OyrSV8pJ4Lo/BZ
         saGcB3gXAgmK9xExCWmMd1fgdlEn5APwSbsh9wwPrUin7Zq6qXNK5l0vZNFzp3JZjmWU
         MV1LFsLVGMZvFUpKAKwRzN5ZP0TarGxhz/lmrkyOxpUdVHfDOkWA8rlLbcywi2q6/RZD
         1LoeJqQlNsDN6PujicUYAkzxWsq5kN5YXjRovZuF3Xj2EPFo/WJ0fD+FXP/LYqPJnktD
         Q/gmsSe6A/e6amDeYmQEwkH2+waWOe9wWPhLDbWkbAwsTnCMgtomtN+tFO8N2EWKZHla
         d25w==
X-Forwarded-Encrypted: i=1; AJvYcCVWAlK770CoAyvtaYDrGdt+aFIJN5ekOZxgjFtI48FF221v1dkUD1Loq8yAbaz5qIxLODp9RCZHateaMkGu@lists.infradead.org, AJvYcCVWcpZoaCEtGCWsEbixFYrZOGLL/FbttBXAAWfjeLxfaYaZ16jUpO9UvsGZqH8/HKIq8F5fmWCGTrq2BYpqkVnLsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTVDyEsZf0FnCm74vhsBrvA7KQ2i8oI3ikvUq9UDPoN8m+7F3L
	lS2vBUFgm+4UCZ1Oxd757bpQ1ZS9/tmXt2WBjsAiZAorVgxzR2d0sRsZ
X-Gm-Gg: ASbGncvmivCaPsT39IAQoW59UbyRztPtPyiDA43DNJlix1DQgz0QDqJx6p0xX8AQJQ2
	ESVfr/G6QYeyfKyz1aw2G6NS+/oojtO3r0pOVO1RA1dyTRhsqfJfazLK+pyuFbVf8CIEbfC0Z4A
	hlY0bDW/m5M+F6KgbkyrjXn9gkj1Q0ENd17R7ysr50K+zkjH2rKd2L1cK5jvhCd+ntncTV3mpn0
	OhrcvFfeDMky/clJlYSyd7u02vDsXtO5EpTkUxPdBjS7fU2BzPI/SqGtC8+Oz2H1vEUrmCf9k12
	CPWXY0RkPI2cPm+fl0rWSDzxXwHrY3JTWqUMPsz6FtAbyVRB4iiXwICY2iXi2/UFmis1wrkWKmY
	OHACs90ImT/RU
X-Google-Smtp-Source: AGHT+IH6PGZyeMyvQHBRQvlVXtj8Ud+yS5Bla8HVE2j+rxlb85y3AIQhMi0Fu03PZQrmAkfqeb8vWg==
X-Received: by 2002:a17:906:6a14:b0:ad2:2e5c:89c5 with SMTP id a640c23a62f3a-ad52d4c511cmr2217008666b.20.1747906203469;
        Thu, 22 May 2025 02:30:03 -0700 (PDT)
Received: from ramallet.home (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4ca3bdsm1036951466b.160.2025.05.22.02.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 02:30:03 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
To: linux-kernel@vger.kernel.org
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: Enable the npu node for Alta and VIM3
Date: Thu, 22 May 2025 11:29:40 +0200
Message-ID: <20250522092940.3293889-1-tomeu@tomeuvizoso.net>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_023005_885394_A37D2391 
X-CRM114-Status: UNSURE (   8.02  )
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

We now have support in Mesa and everything is ready in distros such as
Debian.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 124a80901084..9fd68195be3f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -39,3 +39,7 @@ &usb {
 	phy-names = "usb2-phy0", "usb2-phy1";
 };
  */
+
+&npu {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
index adedc1340c78..8e9f7e0d4542 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-libretech-cc.dts
@@ -117,3 +117,7 @@ &cpu103 {
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>, <&pwm_b_x7_pins>;
 };
+
+&npu {
+	status = "okay";
+};
-- 
2.49.0


