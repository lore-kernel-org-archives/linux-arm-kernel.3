Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0206C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=UzAKqpU65+lziw3jWiuCPpHlfo
	G3GdwMR0J31+Sy4esypWtFLHKK4tiwMEZ1b3n0GhR4dfLUdG4pXB7F0irLoZsxoTKxtn0rfhXyVZ/
	9LszkSCmr0wqBWrfApv3x//YFeNEA747nUVxJux09DWAyG7lJUWg1S8gdY0CIgqCed7+fspNuFXr+
	t6SfWpIQG0tpiYkHF09HfiRKxRg83mWzUBdIw6/QiK3uoutZRK0MHSInATlnZ2TuKXRDWfvTVj6Gj
	RJOQY5t6TlMJWKW4HS8b65bLBxUAbObPqFRgY+8vCTOI3pZJvLNbrXPMeKeAM2scAX64DJn8iOAXO
	R0mPI+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkX-00000006CrD-1i32;
	Fri, 03 Jul 2026 06:51:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkV-00000006Com-2RMM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:44 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c124c3c876aso26215266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061501; x=1783666301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=fp1Yv8+tLUfaUrn03sd404teRXIbIAgPKiYRT1Y4JvabmctEAL882J9tmDLL18gPzS
         gmmlVhrGRgia6qi+DS9haQA1yj1LJVuQCvb3KGCBF1vIGvoLVgQwX41L7LQkuVnpjaBF
         KVDhNoItpq5LfS0XU41WhW3YzZ7HDEOmIhcP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061501; x=1783666301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=WV5Lm0FS0nVfSCQ8nq8BVH0lRZCwJBFnFfSa39+nvWg3Re2wlcXbxDRS6Fzcr7W53Z
         /xAxoKHXVjdrAkpZ1h/DhICZztrsDHK3QIYNB5xyu2KY9f8UAdHR8SMsE0Phx9ComSw0
         gxkVxOJjbHZMtZmDXQ4QcuPS4pKvnYrDeEG5Jpba37q3ZhjhFV/YUz5AohbLWKEMUnC3
         jzYHRI2XFbF/N0KDXnIf+tv7+fCAdit9ZmFVIcLxmWM+Ga2Db1gg8Yh3Krpcx/zj/wUy
         jKLtLDnnKiimfjmqV/giB8FndUGAMC/ZZJuCp4PIjLguORjK3gxLtzj5Psi1h9OWt6Yy
         Q1Ug==
X-Forwarded-Encrypted: i=1; AHgh+Rqep/BQItdXNSkgY7BXRKsAZlerH2KeuNXVvg6neULTZxGm7li7JdDoHzYfi/NODQSwaq5+D25+pfbDqAFdZZFA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6gbJ0torbQKXF5hLrjnx9OI01x5DJcS44sQKWdspXGLpk3NRC
	B1RqhDBjie1K/auSY6PW1tVQSDR4KucRdT9anD/lmYkztyNaCTgFRaf0+bxFTGoZDMr4GQCIRIU
	PRp5eSM0=
X-Gm-Gg: AfdE7cmczsgXPte8Ffjkt2AHSKGwFfAv3OMjB7k7XcKdaZX4RMh1eI9LDVVzELtmN4G
	xuIs8Pc3euIim//duKUI3nIiYJx+zcjeeYlufcQm+6T9+R3xz9PYx24wa+HBllBMwx1qsOxP1+U
	4QaZtSINJslgFuHuMBpMJ0MZ7gIzUlklS7ckTLceiXSxe6n65OWKoN32JhKdDGp/O4WjpngW3tq
	inNrRCSlUu6EzU4y6amlT/4mvAsQj/9g9kGmWdzqYarKUp2sTh9Q/Ixm7wFPzjggJZFqVR9rcCD
	/joVSl1xxgP6B2tVoq3ZuX4udsyFkULgLvKD2gdk6AghSTdBK8UfXMxhD0DfK3qk8MlP2ERon1B
	cRIBvAp0Sh5Wr+CDXuKZzVJAwxWUfffwKuCaW8lFKAqeU7u7bj7H+nUPGdU5F/NBiCFSi1YIRFw
	tm/R9Zdn7G4cUG+5bMBySz4SP6UGFeEiFU4YnH6Id60In7IG/smH9y7o1GzUb1C0fOhq1KVc2ir
	sTLatbnC3Ci39FIX0RvlA==
X-Received: by 2002:a17:907:7ba3:b0:c12:7512:18de with SMTP id a640c23a62f3a-c12ae8d6a61mr417433766b.57.1783061501637;
        Thu, 02 Jul 2026 23:51:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Fri,  3 Jul 2026 08:48:55 +0200
Message-ID: <20260703065110.1433283-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235143_640003_B8BBA22D 
X-CRM114-Status: UNSURE (   9.64  )
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


