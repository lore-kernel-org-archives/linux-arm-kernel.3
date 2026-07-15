Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A93C4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=Sc1rO2pOrlPCqd2bdsZJh/ViSN
	a32BZiocfvBhyyed09Vd+z+GEdwU56jD8o6x0FY83MKpqZil+5RofljYsPYFU6pWZAuCfyMaMmnf3
	39Fk8nmZR56ioQUSzZmaUQc/DyMPVHDqo+OLsgpKmN831Xd6Mx/DE38Tr7CJmaT7MxYMnFVx88CKk
	RjvhpTxqGK09QFx3LMqAfr2SCj8YlIQUxx1zb68xONvE5HVDGpSJsiVyX3fxPXVmv1QNR8EOlUQ6s
	tJXccayIxYZnCKXn+GcCusI9Gt3aJ0A4TJYYHkc1tDQImtXsXktwCG9U3DKRFBqzAKDW4rBenlFj8
	s6DB81cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0o-0000000DsOb-1bhc;
	Wed, 15 Jul 2026 06:22:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt0h-0000000DsKF-41wa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:22:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c1601d552a8so525793166b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096542; x=1784701342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=b8aBbYg8DqKYqXESxwhycHSBMw9mgbqu5HAk0iCpkmt1mbuWr82xRuAs09oxPjGHBs
         0bfSzLIWrgZwE2huYSqg2eyy3ccGJrx+Au06frv0ncMbRkT4pEcbO3fLZgttqBiPoptI
         a3z86cylSMl8OMUCmSHb6lm2bvIEbXd6eNlW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096542; x=1784701342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=CYfjtfWoXfTohQOg9uMeJ5sKu2FY+ptYcK2jikJuw/6wiubROrNx29ls5rsVqCbVFt
         Ffv6B6alXl+Dx2WEQi1Co13RlXomT+1anxQnCFwVR5J0HnWoA0O2SVdLuxTOyuks4Fi8
         J5bMKDOeRgnswFyB8dvvJbTXcidC07l9I9gI5om5hbWurX2wJI275B2v6plhg5DTbH+v
         511V2SYVG54DYSalnJForKeg/t6bb4YuOkMnpDFXScRjkmlZjldt1oFZZXGVEfmxSoOO
         1vuuOC8ye12hGuVhrUc1AfaPv7yYVRSn6TLg7x5SG1FfDLNu102LxncZCCnmxwBh7JKp
         u1ow==
X-Forwarded-Encrypted: i=1; AHgh+Romm7hlb07R13IA3l3xZ4KSAx4LENGX65kgKmn8nP/CKjxxvo4bSYwSTCufhWqQCPQUuhS3RiUaiNVa7cTfBi8o@lists.infradead.org
X-Gm-Message-State: AOJu0YzG1RYSyAKrkS0UZ29xF0fyMmuB2VV90MzQMVkcNCUTRP8JZg/O
	CZlOhm/DuULccRgpwljO+TDDN/5aTPo9ACHvdYN5nXbCaxpOp40gexuA9bvhdA/qyJg=
X-Gm-Gg: AfdE7cmwYJA1SO4wq1da4eP1YlL+QkXreamftR/026sVWTd8mMDQ4khToZElWx7pStT
	U5d26U0bgsbkGPAU5zKAd3ihAeL5mD8QTjqhGGi6HMzH0K6J6NDE24pyXRLOggDoyd0vYC+sQjR
	6y2Mgr4B8w+1tvrHm35fv+XBhz6+0LDxTP/F0EIGkpXyy/moZH1tXHXJ4rBZmnIvx6BLlRhqQ38
	v20MRTnY/9Kf42Wzdk0dhDRuoJ/iYn/5DPpV8T7KJo/oZHFI++H35ea6v02sxcnPQfJyX5n2lC+
	8SPOCArsH+wOB/PSZhlU8pfcQ+CFBWlRuDlSEcpnhjh1rKyunGwwv+La8TSDusNlzyrQyRpSDgE
	lT8zGVcLo96pqyTWcPbK9AngV2NUWgrEHo6G9SC2l1puxmilkEQpDqHfVu3HhMOXHrEBBXuzI4h
	zcfM80JKz3de8UxNqhgcdLKhNjLYm9LG7OSLSM1n+4TB3POpzvgJvpitRSD4EmXxWoE6nhjR/pM
	QRQtsLCdiS0klQd08T6OGo=
X-Received: by 2002:a17:907:c011:b0:c16:157a:a442 with SMTP id a640c23a62f3a-c1667bf8240mr270581166b.60.1784096542035;
        Tue, 14 Jul 2026 23:22:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Wed, 15 Jul 2026 08:20:22 +0200
Message-ID: <20260715062201.3599458-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232224_034221_54DCEE69 
X-CRM114-Status: GOOD (  10.23  )
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


