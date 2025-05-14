Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38586C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=; b=HLY9NNiBfXw9VIp/EnM3VDqYSR
	FW6y7CFkn16I3ildgDkjJBl/MGxP3VEnEMJjHY/BhIUhMfHLakkySxCqUZ4L1ssAtRpDPt7uuD3nu
	AaGOo1Y+c66KbvVeELYtAys9bH4CXt76XSOJJUaw4LA7SZ6cN9SLlrLFUiBNxTFKAdOFS/R72/9zB
	qw6h05KdOX2I/ak5oYuHkOTl/1m7iargT+XqyjGBUT91zPUZuTT8rGGO+PrIbfKQv5gSkwJlpjcJd
	eFctUj+ajWYTOmW9pg39/4S8aGg2ajXUDeDNo1is3pAipQ5WUe7+BW05xv4fuOGv3ZZIAJggv1Rsa
	9/uaIL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6TZ-0000000EIhK-35jJ;
	Wed, 14 May 2025 07:24:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Bc-0000000EFR8-3R0L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:05:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf680d351so3415125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 00:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206351; x=1747811151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=;
        b=F2ZbPXXsl3uQqfK4RoWnxEDPKjR9hEdICFnEou4PKMlegncgRaY9EYsv+RDXyj7pT1
         fsrVouofd12S/Sgnp+gh15r/ixR6Th4uE1IV+0w2y5qONyVwTNauykiGsBw7r6MSLxSg
         5ew+3Yk0XUUeZmvgEI7z5icR3d5h3V4DpIGqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206351; x=1747811151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnMERAkqxqmioTW1rVTb8VFktf28RT8bmo3e4/AkA8s=;
        b=S+FUhEd9/JC4hYfBa1DEeEun7qLIIWfE/mWsIuU+d/w8ABKy7eB9Dgz73uTPkepl4J
         lrOVsKt825qHUYt3PTFp6DpH1nwvQAvlO2XFw9XPlNnQB6gq7IMHY9C14mMNndapmMwd
         EOWmxuH6LHRiA2SHmrfxfG23VI3Kt+YacK6Sdz/n1KMEI8Hz6kp5CVCc+Av46s2WbGbK
         Xmrdup6nccaQ3Gkst0phQgixjD2KGDXaM4IviXIah6j8Cdkbc/55Dekew/Ixz11JTqx0
         /4/+hFW96lsNvPVWaV5pj8jV0AGCV4BfkdH0aVO39dAUytB0ovP8F4Vx39oQfAmRCmEv
         uCsw==
X-Forwarded-Encrypted: i=1; AJvYcCVS4UWSgIXLgbMPc689SmFrYv/tI6BF7LWSjeZUATv4p4Et6M625Udu2ib0eGU48G21Pq0XVq4jEjYUFxDEsZrd@lists.infradead.org
X-Gm-Message-State: AOJu0YzVHbKqMZ6DOTDGsnTfmo925vt7ScqDFIgPLXlBbQXHLQW7Vxe4
	rPHvNX1B1Hi1Qj2qNvkHt7F4zdoyqaStW0RxghlELeEpo2jIsixefsl2S6Dku9E=
X-Gm-Gg: ASbGncsvkAaKFisdQeGaORSJ2hDoUOTjlgiXMyqP8IBEjZeaYllfByb2s+nZ8mP2tXp
	wQ1p0hKpNjtR/Txokk7+M3NmBFtup0jhSmGxnc5YMIEAAqspxs+qtrtdSpr0TTKGTAmwA6wkfbZ
	fI+tV7lL4QTVhgHztyC1ME8WLH/h1aOIvcVnHglobFV+j5CZ98RXE4QswV+5FS7JhJcys8Rg9lQ
	+pyFIHZ4lqm9dBjgS7l8jHHXrxM1MkSTvwNB8BUKR6YDfcyae+gD8E7UkPIUoPCtHl4F54UoJGP
	qqGzFaHMFQH8/GfxYGl4hlJpE6ENcIflkZ4D7plRd0j8R3nn2jGcKTJj5j9pkWZmtPLpcjs6a1G
	dR7i6QGo96WrfkWUzgR9cAIK37+0y4oO5lzi+K0idvDg=
X-Google-Smtp-Source: AGHT+IFJLzZyKmbngWgI+TzCZIEKEd11d7XNg6HIx4Hnb5kwZoKuTMfo+AMd0dF9M5np+Fv1sDDtKg==
X-Received: by 2002:a05:600c:37c7:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-442f1a428a5mr20748315e9.9.1747206350998;
        Wed, 14 May 2025 00:05:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 2/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable uart2
Date: Wed, 14 May 2025 09:05:34 +0200
Message-ID: <20250514070545.1868850-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
References: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_000552_858967_2D414238 
X-CRM114-Status: GOOD (  10.66  )
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

uart2 is used as wake up source.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 5c32d1e3675c..fff21f28c552 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -37,6 +37,10 @@ &snvs_poweroff {
 	status = "okay";
 };
 
+&uart2 {
+	status = "okay";
+};
+
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart3>;
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2

