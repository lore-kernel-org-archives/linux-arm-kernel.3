Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9C3CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63J39CyFqSLdGcoY+lFnsbjnjETWfUjBwWRQVTsQ3ZA=; b=zSEQAR+AdJhXw+YtRCzvuri+68
	Sz5SUgveXWFqAhic32nRyENOh1Bs46h1HmzoUxPkR1y7UciT6LLEYQt+r/GHagpjFQlIU5+6/TjRr
	00S7o8IFrPtF56jo1F4ecAUlKicTLZ+EaWBzLybARIYBGLSjDRPYia6/mMSKKG9lzFFkr9BqLOKdN
	LqNBBnEXpUiwr+uvgbUYnBF5/tfjVAVbn+jpGeyeZkPBNMhyG5e1NJAPevyZqkUDFteHNmb4mh2WT
	o40LPk0sIlLIWhLf98xGaQFlS+thLhK0wlcmqpYz0WirohubnIqjjFcLsfj86PyMcG/J+cjUCaKp7
	sU4FbwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVB0-00000008MQq-2VvU;
	Mon, 11 Aug 2025 16:15:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTEh-00000007y8D-3ZBV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:10:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-af968aa2de4so805438266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754921450; x=1755526250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=63J39CyFqSLdGcoY+lFnsbjnjETWfUjBwWRQVTsQ3ZA=;
        b=OmirJeEulmNqG5CRSb7O99oG828ym1K3wagIOB/kYFzG39Fj39O+mCP0Qwz/6oBlhB
         qRGKr0Thtm8bK+xHwc4MjC6UDbSOF4MHGAVc7G2k7hTVVMQd3EgCUJtNzGEydsGNCBVZ
         OV4RwAy7yVXgdNFqydZDYvDDzQcqITy/iWc9SxZPjafgQjzT3khLl7Xob3YUeLdj/bv9
         YZdVHe8/faSlK57YAjeXP17VXQDk9lk+Oz+pKzCvDqqdsbV+wD7KpPqIjFPILBR+Af1O
         tDvHW6VXn90iyUQ5EfGpUgEPJBjqOy3mELdCrZM+SJ/OSxpXLdkXMfqldKWpORYUs1Ai
         9qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754921450; x=1755526250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63J39CyFqSLdGcoY+lFnsbjnjETWfUjBwWRQVTsQ3ZA=;
        b=dTFfH0+Rqvo7nCzWxEPRvN+RK3dg4unftGEzBinbxnd3X2c24wF6A4COiNRwhOHHg/
         xaqJ2bFtbIalPYy7tIwRPAtoYe6qda3rl4tnqaeh+Lqv2ml6+6P/KbfGIsREroz7qjAt
         hTb7MI3jnVlvFIWE2+jgYTlBezWzhSncYAggS1Kyuo0I8zvmNreGmj22+cExIL78BVWH
         VFB8HLP7XlpBWSlYTQnFD/xTyWzwzbI6Flf2VFsheIgt9+wRdQZiSBb3ONjCOhsC7RZS
         DkvRZMsXzCc3gO3xP9R0qF9ugiDX8yAhsgo93RZsD0jn/icRekktXvCzNl4R3faFD/kV
         HcCA==
X-Forwarded-Encrypted: i=1; AJvYcCXhjowD128TyyVICdQKHcYSiavMeMWEBQLP9Mi1m11LQdpxfgli2MXSIQdgOXLs8ddC8HfSFaltIca00pPLJ7dj@lists.infradead.org
X-Gm-Message-State: AOJu0YweRPLe83x+WZ6ezXWgcUv4/aNRK2nmhNnc+RUkX/5y0DQFgyv2
	V2eeWCSxpXfVrSxi/zgWJpngNZ1k0XKyxGIl6G4jof8dtYUJFLLcOO92C8wAA74ksQI=
X-Gm-Gg: ASbGncufGO5zqK3LSbnPqObTw2gmMX7ml/BxwlHrxewRGm7BpZgaJ1AO4YtvRYAH23H
	szlu8LyWMdnEc4yBP82tCVCZ0n7MZrb6SCw9NP4dbeh0qdiE/Lprd9OWlST7/kFnfXN8ceDl7NQ
	YbWW5AhqIhudZQ2v8swlXSyCE+zKpiOBHsjL6mnFJzgl+pmE343Gl3GGaD/F+wtBCecwAm1c6tU
	9er1PAsTfQxQfcvfqM+c8hoc/dGY8Mwe8AgIbhX5GHdlDiU4e4kbF2PPYidevML8Xo3Ef+IQKa4
	rjC9A7e+pxGQJ04DyS5a3xeuSzGZShhDdK3y1kvEMBDipHrbva25cX0X1JlkPQ3qgNwOo2WWKv1
	zsG48GjWHHT8rRUo0QzVtRAtZaSCMnnFMFux1WQ/BJheFJENnQ43Ej/fjw1NyldvWKQ==
X-Google-Smtp-Source: AGHT+IG/M8+ibyfZa1rZEJRPdNDgrfy4rJ6HCiKO3wMUuimZDr1wETFmlPT6yaYQrOBYlXmZ2auvCQ==
X-Received: by 2002:a17:907:3f1b:b0:ae0:a597:2959 with SMTP id a640c23a62f3a-af9c6516d10mr1108890066b.32.1754921450120;
        Mon, 11 Aug 2025 07:10:50 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9383590desm1818429466b.76.2025.08.11.07.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:10:49 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>,
	iivanov@suse.de,
	svarbanov@suse.de
Subject: [PATCH 1/2] arm64: dts: broadcom: delete redundant pcie enablement nodes
Date: Mon, 11 Aug 2025 16:12:34 +0200
Message-ID: <2865b787d893fd1dcf816e1c96856711754d612d.1754914766.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754914766.git.andrea.porta@suse.com>
References: <cover.1754914766.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_071051_888195_0606923B 
X-CRM114-Status: GOOD (  11.49  )
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

The pcie1 and pcie2 override nodes to enable the respective peripherals are
declared both in bcm2712-rpi-5-b.dts and bcm2712-rpi-5-b-ovl-rp1.dts, which
makes those declared in the former file redundant.

Drop those redundant nodes from the board devicetree.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index a70a9b158df3..adad85e68f1b 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -15,11 +15,3 @@
 &pcie2 {
 	#include "rp1-nexus.dtsi"
 };
-
-&pcie1 {
-	status = "okay";
-};
-
-&pcie2 {
-	status = "okay";
-};
-- 
2.35.3


