Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79019C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=; b=MxoBFThF9QLGM5ugOgNO8rueIQ
	DnOKdVSsluNTEmoPCB5IEwjpETv4NMmA6qgXbD4HQUq113miYywnmg6veIprWcOewAnh50QscuNZU
	mnnXrsSQWPfBVVey2ugiXCGSHjzSv3RgYExdW1JlaHHRIfeqctXI7bl0d0N749wU/8diBKxTVOw75
	BPDu4AG5Ip3V+x53doN1Dp2e7gDvzIt9Qnwv6p2FUXhKHxDnNFCBsc2Wiekdqoi3dztJsrdFbfpeV
	5CukXTG4TH1cU3kQynHOTo9hMm1FkKmEDLkyQPgf7GjhpqG4f8ECTCbu78PIqkTxp+AgVHOHrQLCT
	z7Li0cEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkg-00000006D2J-3Tsf;
	Fri, 03 Jul 2026 06:51:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkc-00000006Cw5-3A7R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:53 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c1268d56234so21667466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061509; x=1783666309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=NW1rDYlhfuf8viilMeCixfArlOrnVF8AoA+b3x0/C2WxegB0jH2Uomplq38KaG++j3
         5zdy7DHRrbtBArz7aFAb6cpVh7PrFJeZgvta9O6I0d+f9tCpGs+DuKOg7DMrGWZ/E0ZZ
         b3z3UMM7e5BW+t/8a3cEeHn5q/TCZ8lnOIaBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061509; x=1783666309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=raE1qmYQLVAQG2kCzklchkOZep7CcNtVOTvVMWZHejgxn3gfpVmi24QC12twrKf3Ru
         KI3HSGnn7oZ2xqK892DdcLDRisRLP9AG1yrQQPPIWaqbQggqCB9naPt9rw7rV39pPDmK
         Q8xSEgIXEWphStSZaU0Ien1Hcnt6rDHXUDyOuuC44FwoTBF9HOm1qLQlXZRUyzz5ezPx
         QTUTXkAXMuX313N2IFyR5Ucks5XJ+lzzAteTaqxtr4yuHQ8KrXnFjj4APTBa/aeA+IbG
         5CCd4c6fuqWfBrnbwziiKAhHOavn27RZ8pJXU39OlQg+QT87as17t2wntCAWxug2WyJ9
         69VA==
X-Forwarded-Encrypted: i=1; AHgh+RozwG2B09cLWB/DeO/UQW/u0y7YiwjXR/PAQaonh1gDW4SRrlJVrFWQGuq6qLflCexo2ABD4ltSjvT6ROQBBqrB@lists.infradead.org
X-Gm-Message-State: AOJu0YyVhPRWy/Dz/YAVn69nlyx8yUrYML6WBSEZa+ukHR/mlYY2K7Sg
	bC7X0u+A3qXDEwqJDoJP+oKI2d8TUdrA2zgjbmEMIPTbSu36CkHa0oIj4xwbvvUheLw=
X-Gm-Gg: AfdE7clmR1A0f90VRG+hcpvoYpu5VUZ83RChwIdOa/+OuOZdiiXQl7sd5YztpHKYFEW
	UfXJcBoocay7L2Adz8OduxOc2jrDQOUd0gP1o0UVqWD/BJwgdc+XYuKsYMTXCwA3bOUxnlLsAFB
	5rAPGcEMzG6y7Kxy+L+MWrcjMMXQ3QJ3V6vzJlArBvBI1nyyflo2P55+mrjMakXYVy9KWLYlr80
	MSu26udWfSjvTSqVmcs7QhZngtArdkjccdEk7WAqXUl6pbZFr7b3jp0Vb4q4j+5V+a7L16Lgdw+
	ZS3Zh9wXV58JG9NLflXfZsIBd4liC6nOM/xQxhR+S8mn30Fq18asKCV+Ei6NxAApfNFsqYwT6Ix
	Itl5rspo9ThzGldYXE0vGvTuY6Bo4z8IX9KdNouCIpQiOwKWA/gRi8BonHFCq0i92z7svs7Ilc9
	9GZpFeRYT5OYAKwO/fSn/yxn7NCDfcgc97WvG1XwilhVvkSZj0z3aMaBtMSo+GH2Ny0ukYAAHqp
	GCyuYwWvBOYlfXBgNFa0w==
X-Received: by 2002:a17:906:f5a2:b0:c12:b563:ed5c with SMTP id a640c23a62f3a-c12b5640b5cmr258111166b.1.1783061508737;
        Thu, 02 Jul 2026 23:51:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:48 -0700 (PDT)
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
Subject: [PATCH v7 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:48:58 +0200
Message-ID: <20260703065110.1433283-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235150_809001_08195E17 
X-CRM114-Status: UNSURE (   9.92  )
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 50f454630cf2..6482dd47e977 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0


