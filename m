Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1170ACD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=; b=W8zzjhye1dXKDP0H/bSNnecupH
	hYi3/nBLfeCdYp2ArJxiObmFKsk0P1vtUJOVVWQXtkEWvvi8Cmc64otMo3NSEiUqY4JMIUfDSm8O0
	POfMsWilISlt63CuDei1MVDB6+RGE/yJcclwyfuamrnPFR/qfHpZ71aof2lsQ3Nq7d/8/WxN5Gt18
	2lu4qGLi4LrAfh3P5B9jw1clvatST/s/vY+qgMiiP8ekS2tzBjbMiPSp/+qppeDj5ga4jfzZkGf+A
	ezalgPqAED2Vy4K4d5BY9HLz01OJUgY4UdBeUUseUC5KZOGsyoAiCmLFk9U/x4y4jmjmqWc+oyFU5
	F4Y0fhkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxrA-00000007UR0-03fr;
	Fri, 29 May 2026 14:06:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxr7-00000007UOV-24qz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:06:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bd2c147abaso86326235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063593; x=1780668393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=XAVI5T6ZyTYXzkQ1q4hvahSrHOQoRfNHdru6rvEwccmB6lEffvcfMi1RNHJsy+HnPL
         BEhe7eFn/IJVTyV3W1hNuWMsPqzl/ukUeNhRmsfIPZNZLKLK9zRmXnvHK1gADCELNeZm
         L6sq/NGY81L+4X5IEESO8wnNXdoKAxKP5TDBylPi7SVmfhS+VxSEAE0yPzpNRtWmqKJb
         DkEDiL6PNW82YudpPJmv4ILyXpZ/WZNkqQQJjoc7GawdrC2RYBjqgmxDHuI+I9d0Phsm
         xiBQNn+OzJLt08PoGqFwzsfu32k4B2C2vvvVX+DbmDWAottdPSGymdF0/jXki6EmCBp/
         q9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063593; x=1780668393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=Shr9Xa3/bMYsT0IzjZE1j11tIHPdEwedrSeNl+gMz3VqBQl94LpQ+FCIGLTpeC7+4U
         enXOTbq6MG9aXj5qS/Fc3bLAdaPXKMwq11uzzsp//7PRedchxpYH6i6fWbuSbP1LJb7f
         NwzvsYvdCrWbgDs/OjBRcvZ8HO1turWo16DMl3rVfbAupMUu2BtYFtQqbHkqN+rOL/YU
         z3a22tanmQBvWS+D9PnhFC3TUPuah+sXLctnD20fYyhiu3+6FzIjuUldtBf60HsCFZrS
         kVYjz9hG9tx9QNhVVGqqzLrpXu4f645ucJccAQQib1ZjZKj6W6mu6swz13jMr9WaueJU
         yRAw==
X-Forwarded-Encrypted: i=1; AFNElJ+y+ESkS3jUmPdJoVTOd7hjgjTFcSZMw5hdsR/+2dE7ManzNOSShZk2OPm05jc68ZVOal6RKEvAgeBwTKItXF+s@lists.infradead.org
X-Gm-Message-State: AOJu0YycDR3GdCL8F0Laf5kfmUX5857b/ezrwY1WdlbdeEEkGGP+92wx
	MgzWl0a/yVLHP0reWyDdrbHVGZgCUXVV4c0zbRM53fCguin6KCHH2DmZ
X-Gm-Gg: Acq92OEk8NspDmwkmM6O1DmazMFHWr4P3sAxBlBZsT2YcH6waYpWQSBa+nQisHpGzBR
	RGCrkT4Kz3jdSZ6v4rNeKsxjhGVOfMMGP1v6fnpIj8lvr7xMRz83dDgNb0LY8JSy03JY2jJGCsN
	dfKkj4OCB4V1LpLKR4/NX9h1BfZZi/hoE6OdRJ0040lviNnikxh6A4GyJKaDz0y5fLCV4j82n9Q
	eA1p++O/f6/PiszaMMwyHppwfROYkgPImijDf0a6W3e6wqNT+DcB3ncwv+T41OCsyvBXy51dQfn
	Kp9VyZK9lXJmlRduX4NWKc9VbZ6TNH/zJw0P7xfj6EBTyXFXjhyjyU9Wi0crPu1ViAm6MN1gmN7
	/dEvWFE+0J6x4+3NYN9/Iav9oZR3AQlzH+IFNf875q3j3alQ+ahli/1ubEeaAcESTSnUHlSIdHe
	53jXyit8NZzmaEooNH4u0/YTn90P1nMS2G+avejLfPAWKsrvV78roIExfoEeWk
X-Received: by 2002:a17:903:1aa4:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bf20be24e6mr40686275ad.34.1780063592523;
        Fri, 29 May 2026 07:06:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Fri, 29 May 2026 22:05:59 +0800
Message-ID: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070633_533222_05C72680 
X-CRM114-Status: GOOD (  10.41  )
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

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.54.0


