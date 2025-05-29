Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0652C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 10:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XnZTfx4DJ/20VLdE21durXqBLl/6baSWFBSIgLYZamY=; b=x/82PmFq/ZVW8PlRyn361La9SY
	veRyEyAJM3iXxBX3jCvZA4TLOFZo2788DINX5u3gSQeCefZmHan6AQd01YiSXZ3tC5PB8UHpFI5fQ
	2q0RNZEHFH3fDfX/kFkeWAGBzsBqVY7xFOnvGWKY4ArGa+ZNILXdDzs8kVN8mn0qiSvOINj4J2YsX
	2Cep2App9DajxJHUuXSJFyxEERcKmUDNzt/w6BAJLPu1XacpknZYdI1eNItGihm54FTfL46P0SySB
	0DGGOd3/IU+SzdYjKrOG9N6RCvxBHH6fMVQCwOQuifXs+vur1NCdTe0+oIQqsASB4rse5iRA3XEr1
	MaEwtIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaVo-0000000FVbw-1vpQ;
	Thu, 29 May 2025 10:29:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKaSu-0000000FVDu-35AW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 10:26:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ad5740dd20eso104699566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748514382; x=1749119182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnZTfx4DJ/20VLdE21durXqBLl/6baSWFBSIgLYZamY=;
        b=UfuLJSNXQZ8mR+xPQOwP5k57ldSQvo8T/raD0B2AdcbSs8/SqrVqCLh9c5P295elYA
         68MXWTG1N64MKv+Vl/XGEPWCjfZ1ExzS5+uhrM7Q3zYyQEzty0BQLWWhpZ9Ig5o8TsXH
         Z6wPxHnEK7c7oz3GPtLP3IaoRzI4C077paeDI2fA57ziPjNoOLYu+1FJfjVP7p5tOBaj
         0U1gdr4a4oSWpR1xtxCx28rMF2/mOf0eQU+nG+/sCvm/dEpC2ddJyV9mHQptkdh2lJwH
         n4uPq85tAi1zFl2LSTIpu+g5Y0zqqutNkDx+rrcBQnmSHgfGeNCny6d2r9i36SEhZ4fn
         FTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748514382; x=1749119182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnZTfx4DJ/20VLdE21durXqBLl/6baSWFBSIgLYZamY=;
        b=BtY2HLPQ0QtfVBmGa5zYXa9qlj1B4JNVcFLIZe645HWmOux5ghnL4s65s8imIkk66K
         uJ1FN4fc6VuzLhHaxVXrVKqSl85/ZBW/CLCoBBcQSpF5Qakv+W35WacMTfJPuSeWiSai
         59yE2jWIqQocdsEAngTNrqRgYMdoiGYT6LWi3C5Exyu1fzT41EQK/ulXM6owFCdOelVH
         F8dLrGBhjCtDdbVgoH0V1iWEVNl9RjzvvDhwteMCuH2s7XDyYHFqFvDbpz78JYuJDfuy
         aI/UMOWvnrf/1zlxAi3WhTrVilUxUQW+PdOrPyEJPo9sf9O2G7z48eLD3RqtXhLw4OC5
         nSdw==
X-Forwarded-Encrypted: i=1; AJvYcCWBjnG8yUM3D/68DXahy115Cj6L9jDdumvYuM0OFtLU2J06HVAZxCUVlS5lFEppgp/qTQMf9bqANKJuYSHIjdGY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy2upXtRaMldQe2oPqYI8J1qZVaAbHPSF2OjMb3HKWFFypwsRZ
	dW4UQ3JJPGzLvHb+PIDGnFBlUbJLNT0xCm2ZaJIS0svRpqyOKXNKatu+
X-Gm-Gg: ASbGncuIjnIenuPUzUz1ZccUM3yxMf5LY/g4efvL/SwAPlTTrrmoTl3dW9gP700CQzq
	FnxAkgXHhHXP5fU3OAw8gHfqMJTiaS9oMyi9u36lHHBAIjijlOfJUiVzjtzSwIaMC9SuUGOiPwP
	RaGFklhVEALBi/hwYe5/f7Q2WofiEFCM60JAXmcuk7Eq/e7c9isc7MQKQhIhDOl4fgPZB8V2niU
	2BZIu7SWIxT+YEjefTLV3dBXeYTogJd+NU3bwUYc3+85nMXdoterIUn/zgmddI3VUFXmmqUyGyG
	P/nxe/HwjbMy5vYpyvvUDKWreI/KAC9aQnXF9Mjf2Hk2irTTTdePLXsKfbHyTXedoW6gv3waTd8
	YiKSm3Vu6CKUHrrXuBj0GlHcCYqfYz8GF
X-Google-Smtp-Source: AGHT+IFNwqYb6hYLokA1iAbB99kihXj8zRaHpm5oMrFkFKhkmT44PK7Oed6ASI3bLbpvYocD8G0UBg==
X-Received: by 2002:a17:906:7305:b0:ad5:40ab:ad38 with SMTP id a640c23a62f3a-ad85b2a42d6mr1750899066b.51.1748514382137;
        Thu, 29 May 2025 03:26:22 -0700 (PDT)
Received: from emanuele-nb.int.toradex.com (93-44-16-92.ip95.fastwebnet.it. [93.44.16.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d84f389sm116052466b.82.2025.05.29.03.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:26:21 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: ti: k3-am62p-verdin: Enable pull-ups on I2C_3_HDMI
Date: Thu, 29 May 2025 12:25:54 +0200
Message-ID: <20250529102601.452859-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_032624_776691_E4453FA4 
X-CRM114-Status: GOOD (  11.54  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Enable internal bias pull-ups on the SoC-side I2C_3_HDMI that do not have
external pull resistors populated on the SoM. This ensures proper
default line levels.

Fixes: 87f95ea316ac ("arm64: dts: ti: Add Toradex Verdin AM62P")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 226398c37fa9..d90d13287076 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -717,8 +717,8 @@ AM62PX_MCU_IOPAD(0x0010, PIN_INPUT, 7) /* (D10) MCU_SPI0_D1.MCU_GPIO0_4 */ /* SO
 	/* Verdin I2C_3_HDMI */
 	pinctrl_mcu_i2c0: mcu-i2c0-default-pins {
 		pinctrl-single,pins = <
-			AM62PX_MCU_IOPAD(0x0044, PIN_INPUT, 0) /* (E11) MCU_I2C0_SCL */ /* SODIMM 59 */
-			AM62PX_MCU_IOPAD(0x0048, PIN_INPUT, 0) /* (D11) MCU_I2C0_SDA */ /* SODIMM 57 */
+			AM62PX_MCU_IOPAD(0x0044, PIN_INPUT_PULLUP, 0) /* (E11) MCU_I2C0_SCL */ /* SODIMM 59 */
+			AM62PX_MCU_IOPAD(0x0048, PIN_INPUT_PULLUP, 0) /* (D11) MCU_I2C0_SDA */ /* SODIMM 57 */
 		>;
 	};
 
-- 
2.43.0


