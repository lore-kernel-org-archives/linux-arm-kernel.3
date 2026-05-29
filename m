Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B67CD6E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=; b=3KSk8lYJzo0Gns5B/Y1CjTh6Ap
	RuBlNhjSoGF+U5TF/9Tvt7194MsTpdzlD9vonfjWr1VQHIxwWr7XUROBZdQ4WasKJHQ0DVlMCOvfB
	SGGOovZ+Aw0h/9LthDnY7TNMoMEYsJzKfX+5dakrumkd1HS7TUHxK/pYr7e4ITDmGLbx93cYjV2go
	Y7P4SivptelZrAEwOczmr8u+3R1DpJKuIu56m8QQLNXY7lOcNh9ixdSJuky3ZBueKZe530L6RinGW
	caw68UBpG5MVRN5o03QKvHW1mKkTRmhHu2IB9bynUkrOKKOjfyUfIKsHm6cypqitMyWeIVnpjukxT
	FWXeONYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUo-00000007YV0-3Cwu;
	Fri, 29 May 2026 14:47:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyUc-00000007YP5-3ZUi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:47:24 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so82875275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066041; x=1780670841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=;
        b=JUQk6jNxNIP3Zsnqpkw2SVm2cQeIGKr1YKgmTZvMzP9v4WBoAb+V/o/iIvx6ra6qlg
         9nIFGaQoSrifuVQTbo5ZY0MjirIbKLCDA087WF9Jh/T5U7bjhG5goGN5N9GhtuQ4fJVp
         +CMH1zmIU1cwG3fMoBzv3CqvI7xslIIsh74qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066041; x=1780670841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NVgkSbjyYr0BZnZn3LZO7uFVYNeYnWVTenciTmfydYY=;
        b=b5ByQf5PrE49Lki8Zp2zXTT9QGeel2euP7bPMTe/TpijR9ymypHYsgrnMiwVNnm906
         ltk/XDQhQHwN+2jOZghC104H3R+WOAnfKXGXXufj66yFvllNyD7vYj4oLHxJfoFRuY4h
         qj0p1mGEx5LpgNc9ml0HU1EnoAvDSkAujGMYNJj3E2CCew6I7Epdqk4JqaGshEchBL5c
         p4h917H4N3c+WPJCUxv6QZX2DXqMZmAjLpnUQely6YD3xRZ0aDRDwmKWsrussV5sfNau
         XhfKJyqqdRbPbOe2drYHYTCfvWqn1LSnJVMR2w/qMioST+Y5jI5Qg7KmGgXqucdq/LeM
         SdTw==
X-Forwarded-Encrypted: i=1; AFNElJ8z/20JZeQAgWEs5Fr3sGI3Avh4+MJqLk1V6SLAuofpfzcK4+EqwNVVotyvxm4It7nnyoTGXYvH8YVQl4w5TrL+@lists.infradead.org
X-Gm-Message-State: AOJu0YwHDiUAk6aqwvgNWTp9CNgjxhmNdEmf+wV+GxxEX+gM3JlglGks
	U5ZvWGLeFsBHPG7vngXXHeKq+RLqo8k3SVS/4gjCLFCrJj5/E1ZU1IcSInm0ijkBdcs=
X-Gm-Gg: Acq92OGvS4GQSLuEiELwYzAHQEgElslQacxNi4VQ8K4dX8ahKy5zQYuByU0Lz5OHHyU
	lgDlmB6hwU+/fOui/5NzRqPMNrvF9nGzyNDU5s8YEqVG0u/GLfLReXlF/eP3B/psj3U3TUFrbeJ
	mgqO3NWGq71oRTGQ9zwp9UH1Vl5WnUVh50K7lFPcWH83WdrU+TsJNqT1HeedKAklHwO2oL6Owob
	gEDQiNgUquq8E9HebQRqd4tJLL2qrQqGupAfnCgzEcYzibBpySQ3PpFqxUg/BYyu5tFEhQeF1kW
	6LuBY0jkrHah22TBMBUXCXZnWO8yRnWVJGqUbd222jRXmKN6x82/cGIoc+iZn5S8S4jTcWvVk0l
	d7oaRLwF+AcuoZtDldy017tShau8spL+14m6g95d4j/5uzNE874Daga187e1JoEcbZdFAlTSRsz
	rhLlx25rQRHUonowHJXz1rVSLwJR+YtrmondYUKDWQgQJHsUyVCrX+mISZgY3kG0VpoHU4mTrSW
	SuDMyPw5+HEhDtBzk6Uvzo2aKm+uQuhFxawMgSuYA7jbK81N/nkBb9Hgd4=
X-Received: by 2002:a05:600c:4fd1:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-4909c0f9b76mr53522495e9.32.1780066041037;
        Fri, 29 May 2026 07:47:21 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 03/15] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri, 29 May 2026 16:46:17 +0200
Message-ID: <20260529144707.3931919-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074722_905374_5A29E5D0 
X-CRM114-Status: GOOD (  10.18  )
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Add resets property to dts CAN node. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp253.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp253.dtsi b/arch/arm64/boot/dts/st/stm32mp253.dtsi
index eeceb086252b..7e82f01fdc10 100644
--- a/arch/arm64/boot/dts/st/stm32mp253.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp253.dtsi
@@ -43,6 +43,22 @@ &optee {
 };
 
 &rifsc {
+	m_can1: can@402d0000 {
+		compatible = "bosch,m_can";
+		reg = <0x402d0000 0x400>, <0x40310000 0xd50>;
+		reg-names = "m_can", "message_ram";
+		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "int0", "int1";
+		clocks = <&rcc CK_BUS_FDCAN>, <&rcc CK_KER_FDCAN>;
+		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
+		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
+		access-controllers = <&rifsc 56>;
+		power-domains = <&CLUSTER_PD>;
+		status = "disabled";
+	};
+
 	ethernet2: ethernet@482d0000 {
 		compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 		reg = <0x482d0000 0x4000>;
-- 
2.43.0


