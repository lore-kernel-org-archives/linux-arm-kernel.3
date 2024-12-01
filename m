Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96536D4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 17:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25hkQ29mTLGKqj1oFjf7AGoT1DWsKqPuwzAecsYSYFU=; b=IOSozNNSTvuoUZxRWhP7Li01wN
	DTsa3SazlMijfLs6EGjoAjq/Z/5cKTAsv0AYUpKaMSrbr9h3AwttnwJBzCjsVP24TH0SNAn7cW9y8
	R+iZJQLtaKQioRoNQ9bBx/tpT1KMzBoQ+9yrAzxVNOvy7iH7dy4basRa6rq+Jh7/+CRT2IDODYz4Z
	g4/+BUYofba3imFhURiP6c3gJfd/4vRHKNRw2bN6sQ2v6V0Yz8wABt8HccRNAy54vQRL5CPJS9wH6
	RxYoJl5hejZ4CQHf61ozd2qyluI3EoJ2D5CIFpGNw8Qv2wb/2NbbffcQhWBOoSADmtabPMdjl5Pn5
	U0QD4m9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo8F-000000049m2-0R1d;
	Sun, 01 Dec 2024 17:53:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2b-000000048Sa-0gNI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:30 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so4082393a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075247; x=1733680047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25hkQ29mTLGKqj1oFjf7AGoT1DWsKqPuwzAecsYSYFU=;
        b=QT+yU0NhBBh7cQbllyWeNy8NUgSOz4PusAa/JTg1vJqz1PkS2IpLYjtuNsH2DY4gMl
         44WJfWJWSCfLYDpyZe2e3JDQUkLlv8LChuLaVaRXws4i51NP+8OnFVAXJQYkRJXRjlJS
         mKV81b18FNJfa+Z7EiBwRzNNlnsKOyMEzM2D8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075247; x=1733680047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25hkQ29mTLGKqj1oFjf7AGoT1DWsKqPuwzAecsYSYFU=;
        b=toA3rJIZ2qN1CI02qHM/bf42Y2aRMJvUJ8RcSQn4IsYO7uzlwPL5sqng2rV01ScJc5
         KG4FeR41J8rBxRJgIxJ2H0GWZ2ed3JxQnQru+eKNg9WDngknJZTHeR29Q2DzzXMhkiyG
         HioV0aKN5l+v0/Rp18gcyJUKk2QmkZuO3Q0gsPbHmAiuzvdfa7uIIkiiK/No0jfHlx1N
         ocbcZPAWI6Hzku+ZWvi3pOglmXbpGVg7yX8EUJ+mRFbOvY4kBP3sgunrkCyLRQHQwRBg
         z70dEbDUK04A9W4f1TCHfzC1nP7XmbX9v14wygctzpzyLWIpTeqsKYqXMaNG8UXoH9dP
         3oGg==
X-Forwarded-Encrypted: i=1; AJvYcCX40Ytb4rVygBRvss+Yz1pkWeJkD1k4KPGS4kTkF+M9r/y7hE3JAGBJZmS0aF0wpeLlTdDBWF/nYqo7JEoQ9OOQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5E0SH9gnYCHLgPGTwwZ2noB+WkoTma1XNvCXE/dmb9nWI3nyh
	2gtA6+vbqmK/fM5qeIx4HrEksjBD9OfT4RvRZeHyrhmVaZyCPE///9c4d7bysgY=
X-Gm-Gg: ASbGncv1VfoMTAxawmr6LBas6jxDq0A8bYQNOAMeoY2wUe+mg8wNOAV6Kq/zWBps0I2
	02Fm6yB8UF9+Q5fKS+pawiZNlox9GjA4fg4dK2OVmdH4hivuth3msVCZnFjd40UbgqVwRHC8gkq
	Wpm2kAI3E2SgtC8AknEodcajixSt9belWq2G7qn41oh6RIPRO1L99VkuSibSxQSm+LU4FexGy2R
	EOP2MQ5SypT5Oez7dWCGVzFzXan/zHhYRMm8b4ANa3yvAoveWkZeSYTnaLF/YB+HvuFMqA/Bw/e
	0Bk10JrsEkRgF8o1AfQGuFHLorVr9eDn7SuaU+vwaWbLGwkeNeZgWTG0s/GuhLbZCLUn8fdJrwu
	4YkVJI9wgVvvHVyQH
X-Google-Smtp-Source: AGHT+IETqWOabkVlO1PkfWKeKFWRO9lagZn7Lq5BjUv+Xpoj3trCPw9o4vBjnJJzR25eaHHFJ7m37Q==
X-Received: by 2002:a17:906:3152:b0:aa5:2232:c8e4 with SMTP id a640c23a62f3a-aa580ee8d1cmr1705022666b.11.1733075247468;
        Sun, 01 Dec 2024 09:47:27 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:26 -0800 (PST)
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
Subject: [PATCH v4 05/18] arm64: dts: imx8mn: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:05 +0100
Message-ID: <20241201174639.742000-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094729_197874_41250275 
X-CRM114-Status: UNSURE (   8.91  )
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

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0


