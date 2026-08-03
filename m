Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDE0C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=; b=1w0SQs9Ba538AohxkDptyJG73q
	wrNKFRXSUv2xu1lht1v+NvfLSpSZRE7lLFnHFneoIhBh3nMcWknfcnUhzyZMsg3pLioR5Ye/xfYlI
	s9poYgIIy8Bys8IH4GvoNPUmv1ZSreUZQQEg2NCAAhxuKQzmWR5tzl0+mLiGjlmAEMHP70PYYynQt
	OJKJtza+FfSfJqEzOSHoXndb2+OF9izuwUF+/G5m/Khu7/qhS7ByrkUi6WeAZriv1EOYqSkxeJamK
	pg88z9uTySM1+IS6plPSaKw00HH2qtycqiVh5b91QC/e5pB8gyTq089/3+WzvRAFcIqitzHMvBWFw
	x9jgAkbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnK0-0000000GXLL-3ocd;
	Mon, 03 Aug 2026 07:42:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnJx-0000000GXII-2tMH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:42:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47fe377a217so279032f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742968; x=1786347768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=SA8UBYxrr7J441rSFC0AUdBqLt6sVGd5T7N8nJEmE8lm6ZAtV/Y62dSn/ZMX3MMY0y
         cKYHTPoHkPelhP1Rtaye5LyFB4kxVTAecgLJarwea774u0TnlfbhRtYZbWMXtR0Wl2VW
         O93IbwSh79yIA9J1zPEs63p0PeHWbH6jMZuOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742968; x=1786347768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O50jeHT7n6IfAQOe8+U4Hub9w56VMIy6Werwz+99kvc=;
        b=NGWG8zxvnU0rltj7+QCN/VJZCBHVxDVMQsIciMM6ZlRRPD5TKbjS6pQPF4nh7/80oR
         oI27ElVdiZ83FZUU2cU4gqtttcXpoeUkKcH9ZxdmacR1bEUq5Hw2iB8r98nIQSHLnKFr
         hcberJp1aJoZKa26Ot+kfpImwIJpunBjsvNayIQVrfccx/kNA1Y+HaGmMVJVcHehyEa0
         +nNFZ5kzJ/j8tbhAPXr1rBoc4UW/ZrewryajLjB5n/zV6FBa8B6mgF19GqF0z17LQCGJ
         X/MBGVWfVcxtenUruB/9M12ThGxaSe96mlPUysSYl2B+TYePlPLct6ILLAtkvVcpoAj7
         Sdog==
X-Forwarded-Encrypted: i=1; AHgh+RpiWJRvdF2NGKAe3X2+mFxVu5t5LbgzpyhBpt/uVM4FEr4lbtM6KhDe/ThQrH2R+fN+Gvuekp78tfLa5bic+6zf@lists.infradead.org
X-Gm-Message-State: AOJu0YyBdWOlXLN7uXG5NJZyp1d7hVgiCUfsU0k5BikM5fw18bzw8+4D
	lqGLKktIB2xrIEOhvETTZDLxTKVSUrmbSTYRPuUETUPv0pmjTw3so9sL96r02XLBFWY=
X-Gm-Gg: AR+sD10eVMNlV1T8M8MrdgWF7BkUD1sr4J7svndH7JVF2r+FZE8kN5tkm0D5WZgCsS2
	BnjzjVbeVhrB2UpUF0wqiKJ4fKtpoE1sjLytfOgrgAl50uZN4yKPNkQLQ+QM2l9nKDrS5k5B/v9
	UNZDXYzIJ5qM2xFy1SwEZdJvwSw75PsUntfKKSuRkpY6Qm1naVJ027Az1RhpLDA0xEyTXZpQu/5
	4FeYyO/4qqQ8eYLmqDxEyIKkcmq1+BG9EY8YMA0eycVr6j8YxfP8BPqq2lo24T5tDfNLiIEPeWO
	hxOhNoWR+g7u2J3FBMmr/DFyeHxUHzf9YVFVC2zIfHrDw/xWQjlEkM3zx5y6Y0QyIhzVyOXN8Tk
	L/jPU8OwTaUdapQEs79veHpDESb1Eq/QCzJzxzga6fL8btq15Z/az+6R7dBttA+0M1+JtTdNaoT
	z0aQWvT/tBn6IzUTX/poxHHYGyexnFRe5kmKl9bW6KMmnFUqzHG8YRnhnGrbkhEO0yo19spNYL7
	6GG01XtOPaOPicB34eQqyx6Xk8vPC+rUBjbHuITm8D/INR0+okpmTmlDehPInTyXYnh6fyUAJn3
	zdE5Tl4t5WSa6gQ29Wv5nrI61Tj41KorBpo1QyJXEv/9ggVM86IGR6UrNhifeXbf
X-Received: by 2002:a05:6000:25fa:b0:47f:8f8f:e493 with SMTP id ffacd0b85a97d-47fd72ba69cmr21247856f8f.3.1785742968144;
        Mon, 03 Aug 2026 00:42:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH v7 05/16] arm64: dts: st: add CAN1 support on stm32mp25
Date: Mon,  3 Aug 2026 09:26:00 +0200
Message-ID: <20260803074224.3821911-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004249_756013_93B8E69B 
X-CRM114-Status: GOOD (  10.35  )
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


