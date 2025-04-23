Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1105C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=; b=mhNyeS6+0QMQGHXVufL9pkyhhA
	BoKCUHeaaMmtbY1b23zzXoW/fWTs6AXK7C5KHAuhcRbyj3daLp6KC4WVjMJFqyMW3O4jEzgvSiyqx
	ZsDxnNNHgfv64EmWqYHBzHO5opN2Jg+SxGUHcgEZZmtaUB/JeXmUNUbiqsLsbeMlt+U/Rqer6OTEk
	j2v3lN/Oid+F4qpG+p0i0Yis5bEh8XiIGOTm4SYJ7/e2mLCuaKwUN765rW1zW7/s9IC3D43mrYHM7
	mRdt/pdRuaj7MnzrajvI5aj9/jkX8Gt3fuje1jltQGDzhzuzkJ5aKaOt73P4y+8bswebEm7m+jaHy
	tSYfk/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TVx-00000009Kko-3zsF;
	Wed, 23 Apr 2025 06:23:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TCR-00000009Hd1-0XWj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 06:03:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so995538866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 23:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388189; x=1745992989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=YdKPjT+hj33Z3oddQgW4unNcUnhr/B1M9yNE8qhhBc90ivcgvf4lW064mlyys0rgGc
         CnXeEQMvGx6/8SXnu2kWL/LZEH7cg9SCcqTvBOBMj615iaME/TSdozE78utirFt/K3K1
         DUq2LoogWRkcbc6aiZeh8mz5UsTi/EFxHOqCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388189; x=1745992989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=nTCaJGpoT+KQl9mGPNVac+h0lCs7Tsjq5rBp0pqau4pEpKeseADAqZybTX34Ms2RbV
         cuR955xOI1jQhqstA1QGNOm7sZCFxWMshNzo4S+Z8VaT8L+rMjMgVz8xekIu4s2C6tju
         zaGonJeMJ4C0Y4lvrBJHsZn3EHSznYrdN0GOfxb40GIxIJz8K4kLFpmnPZy6s7py/uRj
         hsUKRkDIN/ndFKghggI8/1GngMhMMAxpJ2kctZb0r2g7VrT1DazlLYPouynZS5jf96ZM
         n1Omsgi5DPhcmB1TFah0TIgYSSCKRx+qQEW6K5lgwFwQTdunMToCBXNhmTSqnJF/zmhr
         Bvvg==
X-Forwarded-Encrypted: i=1; AJvYcCXBFTavJuP+tp9o+/WnVLMnEcFDow2xKJaZFPqq0l71WrmPcU4vwXNvrUSjsPhP2wo68uzAxPlY7SKNjO/o834y@lists.infradead.org
X-Gm-Message-State: AOJu0YyYnZwb83B3a6Fjnb2A9ynP+9RXute+D/d6iXqWALesfJ1SoCUn
	XEEvmM1yIadfwM8R4QveBcMVPW9YPrhP0zXYMJJjhuzbm4BhPmU4EsP5JcgedogIq0fH6c1wffN
	e
X-Gm-Gg: ASbGnct21C27EfsaVkVuWufEZGl3dADC0tDT12wGkxb0NoLPKXyARH4lmX/qpatePo4
	0tsPm6VOWA1aWTf9Fpmi7dExtGMKMlyBhztexmvDAizVXofNLYqgP+mfOJcSo5xvkgOMfyO0Gnb
	nK8to2zd/PuL2vhdT9bEVOu90jBMu+2O1Tv9gKVE/o5FOWMkkozztPDjF22BUyu6IaHawS3Nojx
	+KyeR4vW0Wev0lZ9qSa1l0N7r6bUU0Ftun4uc4qlGnz/K8zr/lHnsueW8wqdH7xAXhPGe5WK/oP
	HYMsuDfSVO6ybfTaiPxfc1zH/1wXT28JhWO4JnNjWm4vwUrl8ZIxwN1hw7q4stfSfxVvCe9LzPq
	Y7O7h
X-Google-Smtp-Source: AGHT+IGJfBUmSx7xpArhxmxiAbzE5ABneyuLMS1Ivt2d0nKwCtdMFf2EWGfW8vDplA2S4cAk4a6aow==
X-Received: by 2002:a17:907:f496:b0:ace:3a3d:7e35 with SMTP id a640c23a62f3a-ace3a3d808bmr240038966b.53.1745388189491;
        Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:26 +0200
Message-ID: <20250423060241.95521-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_230311_169105_04767EFE 
X-CRM114-Status: UNSURE (   9.35  )
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


