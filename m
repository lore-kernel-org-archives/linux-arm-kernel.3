Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4EDC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=; b=aFkwpkpu97gRa5CcSSZuEvNJq6
	9an7M8DT6qAPdnuB0GPknvv98P6O+sfPI9yOm7CN3eGFzwUVqO7h8U4IsyMol4MtVsHfKAy2waSmT
	d5mXbm5ogDDS94bncEzy7IiutJl/GX/mG4kZFzbqOFIRrAh5EjQmxm9TR+1Q/T1dHXEDFT3Qn83x8
	edTsXtDWtIDoQZlzVDS8yo1zW5MJWrt1ynWCEZ0wPJj9cr9oTJthj3zwso5MJ5ezSwxVJhlrm7eeN
	SsgrgVIP/bRZVrhRHWndi/AWOTroUwGZ6sfVy4BzHkRXBpY7fqBpUctN/UFNEY+ZExqgNU7HpleV1
	TrxSU6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8JH-0000000EeI3-2VUa;
	Wed, 14 May 2025 09:21:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Qa-0000000EUfT-0Nd4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:25 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so48623225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211122; x=1747815922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=;
        b=pcijqAmFde88xRL+2jelpEHWnvLlOcM+RKJcQEMS325gh8E5SsM8Obefp8PGOX79cj
         43VCz7l/Tlr+FwudsrZp4lKYrHVylRnnoyO93OSGdQc4UK+APZUb652puQ06la3nUF7/
         uuuT87EPGQfrJb2E5vqkNyOVcibWUw37jjqfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211122; x=1747815922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=;
        b=H4YJ7bEFHTtdEJMkauVQTLkceJ2dezPi2+olv8+mhQKHGRYQ4/X4Ify2hGftkbfLuZ
         RN3ZqQnsPS6u5Q7J8tVO2AVFtCCKjB9PgmD8TRU94erFxFvDkRsYGRuWzA4T+BoJjZ1p
         Tt3htvoO6Urc7MpD1s+9pkQXRNszINmE1OdgU6QnpR0NtZs3B+9Y9Y1pjSS+YGOCK5u9
         ANI60h7oVR4tvRMhETsj3gUVYS61naAd1bu58a4Zl940+n2CMFxdaxvXCucAsPJXzEyh
         aADgTLZvP2t1fpcgDUA+MklkGO38sQLx39PxwDWS3csqSoLari8nxfnHn+ovGIYq+nFg
         0uNw==
X-Forwarded-Encrypted: i=1; AJvYcCU73ScMWWOXWKgOs2mul67NSCnpqEN0EKocpRtjKVt2ekg71hphlONqKxw9gBJ7TRnNj3OlbgokNCfds+9pcz2m@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4G5Tr4ppfGaXCZzwoSdCY4PVX65O9keEuLriJKqDPPf9zy4uQ
	xNMqSWlnCP4My15TqVbduUH8r2zHOIQHlOMpBVs55NeqjP4PUURGRFutVMmWfiI=
X-Gm-Gg: ASbGncsfLMhZG0SEKx30P2p8geWVPxk5IM+HzbOKpC8iVn3z6fGH1q9ywGnQKZ/SdkP
	y/WvhVMP0Mxeo9IVnGPKAFMNjMR75WzhFQ2HNCcbr+TAKusDfhqjp4Bb+QNW6TPDZX7yUX8zUR2
	3fJcShXFCjBRwRNCo+yJBnpwaKrihEEKU0IH0A89xld8TYSEKHwE2CgQyJMrqaXqQmi/OTcrMK5
	+VeMCdBRj/qX3t9+vRNJ8jAJfCeFhVyIP2DQ5G2kcTM3f84FsQOr1tg3+eqEAJCu33oSn8PGKuQ
	gmxWBkkhrTJb7FIx8NV4GWezFSBvTYwyjd05h8sAiEdBqTLTSYWa+46YheltDNtpEoHngoIMBKD
	GdmPFo416Hus0JtGaVczrSsfMWf3zf+8khn9JvTXXO14=
X-Google-Smtp-Source: AGHT+IFjDXXwQhSURwlfHmcLE4irqIStV0UgnScTM4HB5AXLneqabf/gWJDu9GBdpVyWbqQMxTEylA==
X-Received: by 2002:a05:6000:2505:b0:3a0:aee0:c647 with SMTP id ffacd0b85a97d-3a3496a42f0mr1760633f8f.17.1747211122654;
        Wed, 14 May 2025 01:25:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 8/9] arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive strength of pmic irq
Date: Wed, 14 May 2025 10:25:02 +0200
Message-ID: <20250514082507.1983849-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012524_129568_40E5C640 
X-CRM114-Status: GOOD (  11.81  )
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

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Increased drive strength of PMIC IRQ pin to increase reliability on the
reference hardware.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 04112a83b1d3..ea8d741c6904 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -364,7 +364,7 @@ MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA			0x400000c2
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x040
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x041
 		>;
 	};
 
-- 
2.43.0


