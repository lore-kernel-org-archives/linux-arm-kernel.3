Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AFEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 17:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=vIwXhLe0/d6fv759ntrKgKs7iR
	PbxYGB56kNmzr1Tw8nGWb29RJjY/9J39hMXOYYH+XilPB7ZiMbm0tkgF4SBHaJzZnhg91rtea0Egx
	DiWfMtfkwHwDddN3XPqRwqtjNr59lbUjH+DcTluwtBYM2PRwSRAhPetboqc2iBTlY3Ocn6Cn+4Np/
	fCJ0Fa4QfnzqiJWeuXBuZ7Waa9yOT/XtlH3IPVWSNzJatic7iLEAJAccny/09pIqnPKljdRq8NSHd
	TzU3F85xPuHrTAFl3gFvwsGaqRVihFWUNnnhcG9TjOcTWDcu4D00pdE+/lDwviGNu6wgx7SRYTqac
	u8xjZ+ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPa7-00000008Za6-3Zyc;
	Sun, 22 Dec 2024 17:17:31 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPPOt-00000008XrQ-0xWw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Dec 2024 17:05:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a9e44654ae3so550103766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Dec 2024 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887154; x=1735491954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=XylWEff/OY4bxcIaokvufSL03y+8p+uK37kau+gqgRKsMSBrjhcwy2XmQy/Ajl3eDo
         gx7C1OJsKQ6kjKHMwM3QMvw66hieYNsnGn7lFARjLNwS5Xw521PUuNsxj0p/0ljt8jJI
         we68r3AU9/LHGdT3Li5KHpHYc7dpzsj4yi9g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887154; x=1735491954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=SH1ivGBXO2Kt5yBRmaKBqI0eKMAY8tyS7Z6Klf0/wchD6cU8gxZ/isbDDETauUQYKT
         jaY7MiV+OIh9XAxSDXvPbkfwto4+qjcb8k4UdnHSW20IQLXJCNVY9SkRBKgbbkqSDtLz
         suaRm9iwk7o5Wc76gdvregsBonyp9r/vGi81T1/sOwAE9YQ5WNBPhJ2/HYF53fjpuWFH
         BiiF2rVmJxMARf4XgTe6rQePoJr+p7iJubqvl6aaw+BATepFf5EpWJVqVUG0nVObJj4v
         11arwJ1myMUlYwOggdP8RhaJSulPW+PDvo036jN6BuMVN6QxgCyDt73YPa0D5Dmp6yge
         Muqg==
X-Forwarded-Encrypted: i=1; AJvYcCXSS8uoCL7J8wIbo/V1y8IEVe0hTFCXL6pu68d/WU20pOWPscxShHZeFcVugC+LwSKqjIkVy9cV+1YNnWieeEaP@lists.infradead.org
X-Gm-Message-State: AOJu0YxkROQ9WdMQBTyQ7iln8tpaoOiN0t/qShWaqYxhYgMV/bY/J+lr
	D3r3WX6JDVecljGgdTUotV7mbBKXGnBXVTMiBt6us2onRy/Sg5i0BSujjh8730U=
X-Gm-Gg: ASbGnctXdJduIolaiyUpSnGlk7n0hAYayrtRmrA/dDYSJPHGwTJp8YYiah2I/dxPieI
	qBg/Rq65vleQDynIL4/PKHeI2YH/BpBKOtCWyRKcZnUeZp4weqXyGZm1yR9+EaDvTDBaVIEYxr+
	ym7ynBMP8+C081MY2AhqE5arzeBKsCYzn8VnRMYn3aUIkiSJNjufSM/IVdMaU3Cmi+m2XfFkuZR
	mkgCMzWWp+SjmqSEcuVE11+jBPSB4pLQQlOJCdpMu1DdCXIsnpxaNDhwWNvmkv+iAeB/bh/NHaD
	3Q9XVbXuN0z5T/aHoOZ6UBnzFdn1R/fp3MkfuVb2ZI9Org==
X-Google-Smtp-Source: AGHT+IGmc/BFMwzoPcErEXEsdL9IB2KUs9/DBYyOmaS8SczXlODqnRL3cXLq/GR+YIHofpcPL2PYcA==
X-Received: by 2002:a17:906:478f:b0:aa6:6c46:7ca1 with SMTP id a640c23a62f3a-aac27038e93mr909112666b.10.1734887153951;
        Sun, 22 Dec 2024 09:05:53 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v6 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:24 +0100
Message-ID: <20241222170534.3621453-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_090555_295581_D54A09CC 
X-CRM114-Status: UNSURE (   8.76  )
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

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


