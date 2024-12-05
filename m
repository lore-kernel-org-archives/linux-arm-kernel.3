Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E3AE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=B4wScC+t4FQI6MQ2QAC0u/pomG
	xHXT/tMUGQmD9pJiLd22GduFSOE0iNv5ht1cbhr/oO396o4c9BSPMGKfnRrGYZ7GLBbtBL+BmRFmN
	p5vBtMPEvQkpkrKH8LbFToYjAaFRs5Xhoher9d+zmzIDs+czJ+pdFssZhQEy/22XyndZiY9qJEdZd
	Ws2pi51chUeDYtcFHvBz0SFbvo6bZUVNcv4qYHXzcNqOJayPnekXq+wf5GMTOp0Y05bgVzKJJS3YY
	28nUy4gVnZQW2ICQA5CIAGMr9OdUo5O8RanAYwGSWRR1DmEmOZOWjHUZi9uhTo/IYfeVPNnG75h8M
	d/Jgd1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBDG-0000000G0Cg-34aH;
	Thu, 05 Dec 2024 12:44:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tl-0000000FgeB-3Cm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:19:58 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53dde5262fdso1019034e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397596; x=1734002396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=O69vlgIvDr73ypSSpaPtpc3HYxAz+zmWRSmG5gEGAdfSRbud4eM+tSX9LuiiIBEwgt
         SJPGmQdND46KkR3cAPeYCBNKrHibJxiMIxsrnbIk5Im+Ld8DbEMgby9Shw8TwJ96NPFx
         Ll4cD0VCPlClj0pxAxyt31sNekecJ89se+l0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397596; x=1734002396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=SFBiAMrfpr9Bd9VXj/4l6sxdbXrtVII/Yjavb4PjeqXv5te0cBguZXyk0lrAixKJdE
         pDUVXfj8zHsanqtra2HUUijCP4S2pWEYDkEwkx6ZetGc19JJ7vdOb8J4obhC01MlLJTp
         cLZCWBWKtKfCO56HG9lcprKX//Dw0j+P/c0zywjb5RQ1+77TxlviFsF1J0AOiZDfpvt1
         rnSGHWrRlGJ1Vs4+5fFeQXsrqtCid784ukQic03Kf4yWGeM3+riVkhJmQV8AORKFha0d
         ZDEMRYSYmr/U0rhQxDO/FzqxEstAMdParg6VIUboD5nJ5Fe0ICa9cQzRkN/aqSBspHMG
         jf4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUESj88TpvKofoXd5bRihCKnvHZ62YRVVJ8uovdd25F72zZdrJ3/+LmgLmfWvr8gGlFTMRkuzTf/tbiiuYTljOr@lists.infradead.org
X-Gm-Message-State: AOJu0YwsTq1hkymOAlDTqfsBQGZldRaqGbH0BWVMtqnQ2NcXMvLfl0wh
	opUVCZuUp6rNoL+6iYlqOXu9iOWvw3HUdgca6GvHIMPFmrWOtZuQ3Iq0v/g0ZeIKH5UoQpDC+gM
	L
X-Gm-Gg: ASbGncvUE5n6g5hMkjyL18AiCA3hsGZT7ji7LT+fdb1ppAq4x7Touvg4O0JpNBLHsCv
	mMLK0YGVoVg1mvxBtK2Y/f8t6TpB0EVhy1NEiJ/RAodKpGZfMveQTxsW2XrkCdf26W3zZYWd96m
	AN0G45ioDbJpJDPFfldp3NBE0IHBv7DB5hgcV+B3D78QpKolCCCEgxffshvVqLur+FYXMVJQpeK
	NPZZv/pW5nyVK5PoMMjkP4pkKQfJDAACc5pl82ghREZ/L/lPVgbNNExf9Aow6yyzxmk/T70XvEU
	9qMei4SK/GFw+3JKfwfuX7D2HS63R8mV8jds7yxC1YdVrA==
X-Google-Smtp-Source: AGHT+IEtuduGBZsALDR63XXUfmp8mk6Ffl1qQAFy8dFjE8C6ALJJ5nV+WsPlwDq8/o6BI50yiETcjA==
X-Received: by 2002:a05:6512:3ba3:b0:53e:284a:70e9 with SMTP id 2adb3069b0e04-53e284a712dmr306591e87.57.1733397595775;
        Thu, 05 Dec 2024 03:19:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:55 -0800 (PST)
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
Subject: [PATCH v5 09/20] arm64: dts: imx8mq: add anatop clocks
Date: Thu,  5 Dec 2024 12:17:44 +0100
Message-ID: <20241205111939.1796244-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031957_799791_B2A7DBEB 
X-CRM114-Status: UNSURE (   8.79  )
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


