Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3A2CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=bNWHmKn3j6La/jLXrtNKKRx/0l
	+dvN6ZNUtDy81Q7CBLWqkj9ByoWX+nd9dgZ/iWthhGrldzJS4wrWkkuuzVHByz9ZpL6ORVIMyLUu8
	5OgMIEll7EAQiGvw+xOAmdOoeS7yIFNwBtVtDmJ3+L5yzAhrWo4hbLO1W6SZ/klwwMwuv0fIsj/df
	letkfwzmdNzR2YG3CN22NRERC558yX81pjtSuQ8DjflwEzTWk4u5tT1M32tBvTjYa4XoRgN/+Wc8w
	q23n+k0CNxsdIsPUvx7KqOaBb/HCvEjk9BKfZJbHV1vBmX/cJim9vrGZOBDtcalMWCUSInQJvgsgw
	h+ZPfF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWasD-00000003jTq-2jIU;
	Mon, 08 Jun 2026 14:22:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWas9-00000003jNl-1TSz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:22:38 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-beeba001887so568069766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928555; x=1781533355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=AZJBgVUvq4YWfja7kL5EicKm/bHnYiQqbnueQEugZHcYzFGfY/XGw92V5N3MKa+6V/
         guSEruSfrm9fceGfrWfal5T+NhjoTi818TcDnFkHzKLZKlIgXaRYeptiplRYGqc48U3l
         FtD4cfA37Uroyf5YgcrLNOA2U1aByw3XQDtic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928555; x=1781533355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=BHL17QXU5eZEQIgeayzj+qMklFxEVGg78cJps7i54o0DHMLvloFLLLEDBEg2vQFq23
         a68zrrmL7H6lceu9zN+lgPsy2pOU3bzckvwkAIH3uK4JxnXtaeQTf4VsbL4i2d0DnGHX
         uTDWH1SPeQ4U+QlJp3ACodYTNiHVohdDKO/ruGhWF00ChEvXeGGUbMnuJz/QmTpVNh6f
         wzI6gv98jIyB6NBWVhk5hnw/3L87MlX1SQERAiXndS1+tbyjRF4/hAWL3uZ5OoMBAkRq
         +4okBeoZX6QCBb7LjeZk0vbqBVnMDWme1LRY+tJzNJi167CfDPgg4GRdCrz6eg48Hhf0
         NFMQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HuxDjGw2lIPwhuHKNTisGk+j5kDQ41v30u2Jf3q7FpsB5pPTf+5auXuaNVHRBBPTnp67vHqM/kQKTD8xJyZOB@lists.infradead.org
X-Gm-Message-State: AOJu0YydLepKyyudAjtP+i16LujMFWVPHF6f7P26QXoK1pSLORv5Wcp8
	wV+DAd+i+xz3D4RRcMq2xD7AzDBFSsxg+pLXSjVdy0Qh0lQ8LcAgt0QkLzAYwnDcXgg=
X-Gm-Gg: Acq92OE50agvMF5Vxj52sWX+CW3k87Am/URRC4WkfZ/bzrJ3xku4PWqpE3za62nMmA2
	KWQh9uPPpCncL/DdjrzWZoI+5fGUUWxMvXBwyKCasU2MRPAOJG5RULMUOwCVtB543my3pdTE1BN
	66rshKKrCd+8z9aqbHZz/A0Q2M91k8aklkm1fy2UUVKgkSJoGwCQNoiK5y3nrVabBD5luLVxBq2
	cz4l6+8VZOeL/tOb5zhT/GyeiGB9tJPzh/84E2q0o+D3QBqHxZXw2a6OlT1/Ihy0aW/eZfa3euj
	PWxIl8UT7zPdML+38EjEz0zwJ9g4/xGI5QP2eMSgpZWV6f5ekRAk6k/J9rk6iLaAl7lTCjs0upP
	GdcSGNh6VOixqGRc6f9whGmrwQJkBdVZuwxuGPEdY4IPvoOuzKugMBtzDK1+Xnoo+pxGe9Up0oH
	/tOvRKOlALEDfULB5eXhZTIcDLpSYwvmMbJ5ayHciaUQSQtMTy/ZREoNJW6SXYkN9j8T/DUO9xV
	ltciFl66YB4MoNOb8JmQ50h6HhsxnzWpTQHBtdUQdxIFXCW9mgTxq+8SJP0Tpr6VnNhaA==
X-Received: by 2002:a17:907:a44:b0:bd5:2c3c:616a with SMTP id a640c23a62f3a-bf3743e3051mr763130166b.37.1780928555274;
        Mon, 08 Jun 2026 07:22:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v5 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Mon,  8 Jun 2026 16:20:22 +0200
Message-ID: <20260608142221.952245-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_072237_403537_52D4C7D8 
X-CRM114-Status: UNSURE (   9.89  )
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

The controller is compliant with ISO 11898-1: 2015 (CAN protocol
specification version 2.0 part A, B) and CAN FD protocol specification
version 1.0.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

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


