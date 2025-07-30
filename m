Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19ACEC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/qSyBpSR7xbk4I0b4os+La3xbFzhrl6JfnTFwclbKM=; b=xqf843WpVhCN+zBqwnTxRTwpVW
	e8h0hNeq66y1R9Ve4H9GWfQ5fUbK45sAEJ+16iuJHK+B6TIC7+XB2FK5dd7+Be7yY+y6l78RmJGwc
	SHtcvv2/aYBlolGGfcfnowkZKMg3fQALPrJxYHMbdA8ybx3Wmu2MM0NuqcIWFUp2kBgrPzv7jdaw7
	1z18lmaeLIOinp8AZ7XXznKdwkviXqG0olhcbtemoF3IYXm7YN6bWWUPmKm7UQ8hOpE8yl7wbf/2i
	a1LlG26CFpbOfw6olSkrSAMmHU1/PMOcwNLUf83l6XAJGm4Ll7rjrCL7a6K5EidIm4BTet2M88BK6
	v+XbekOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1f0-00000000vXn-0HUy;
	Wed, 30 Jul 2025 07:55:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1So-00000000uIj-3SAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:43:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4561ed868b5so41822055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861381; x=1754466181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/qSyBpSR7xbk4I0b4os+La3xbFzhrl6JfnTFwclbKM=;
        b=HVSQMjuk/wOjgRvKx9O6hbnYLTB0ZzE4DLmyl4GvW3CIDklgEFngHEbHi+seeESSjk
         mRYirNU1ePWpKq0nUFR6BlnkdC3qd1SFa9jgvTkmyRY72pda02s1b4gbEPkJeP0c/OUi
         5Fv9qiOmKzaSPf2us1735cor4JYRTNNmD6k/Mq4g+8XYY9FuMDtG+rj+WcmL2hISmtLi
         Ra8iYuMIjoQzoQ8ESAuFnJleLYsx7I3g7SaHsa1rwkMaOBFAtNEwpb56E7KjMf8h1Ck2
         qF2jKfSc8N7UkYdK9Dqf+aG/RBWbIE9jo4EBJJ35toSD5JlSTSHfXjRC9IxY09zrn9Eb
         ch9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861381; x=1754466181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/qSyBpSR7xbk4I0b4os+La3xbFzhrl6JfnTFwclbKM=;
        b=l1n5QEGLGHIfp1pUwupulmrkEN/9vf8w4MDtJnnCu57NNwzMdCyfA/pkPX27uaHr69
         JDIYICAQ5pIJOtQ4RUa4wcKWD7YrQkOp+B1lji5glO1hiHmO9ndqFSa+5Tq4Z1rzj1gG
         3P9WCWg61Xl3B+xCzq4RE6PAwzrMXJF/iS4m3BZrOsonYa3+EY7wnbgx728aUdbMosAI
         lnPuqZuV8OHX6Q1hilPTYbnpuKDRRWXchlnkbRsYzmWimxj/Qy1BRDbtzyMGDmMzLea3
         mrv6WwKek8anQrYM2YsSYoKy1YyupbsoqrbbA8YsN8NwY1NhqTDKyeP6dnjr3ROmjCHM
         zeaA==
X-Forwarded-Encrypted: i=1; AJvYcCXU/G6EIllmcFY0NGxVMsJuIp1cyiv/SSbyd7i2mocOn4nNJHHf67j0zVb4+gZz3xgKWMWCxA0JxAiHxZuRY2mR@lists.infradead.org
X-Gm-Message-State: AOJu0YxpPByOGp3xXx6GYO59e0tSgBl3teWpuCkZA6Sz4owtyYpnMzRf
	wfqlF3fiSgfECavn+k9Hk21QF0T5mrF791hSwff+uN/qZv5s89iEcOZ4pymLFw==
X-Gm-Gg: ASbGncsJPUCqqfSbYWAu6gq93QDlVAkCfM4dOPYUpVOn5EFHRw2n/nVwVkYJB6UrlFK
	GMoBan+GRZkMMwuZo/+X4NkgdeRzuJD6YR9+lMBRTYacXLzn011jEPzTUjbYILfjm2Jk+HpkAtx
	PCqaprxuCzZLdxfDAncfPDBXs/YIgWJs5JSyGfjHnbgXty5Iq5lKvTDsMjHRmEUtHlLGVQSE0IG
	Y09tGyolqmshCz/i9ocXruwOIxnknBfmvaanZ2ioctFN+Cy0ykKy74o5YLssUUWbfsT9AZBU4q4
	l7XOlR56gBB0ODz03Ao6TB9zsVrjxF7REniw3eonHIU36KWYLplZ0YruHKu8A/9wYLnFpZnGRrb
	1mBkFvWT9cuizPoMAmFkIhk8EneQvN3ArEjIt0Iw2lbS0ROQ8W9J7SP0AMN2wrbFPEpUGz9XFxA
	==
X-Google-Smtp-Source: AGHT+IGbqoAzQ7GqzooDCTeNLJ9pbPDmJ9+TVcnibPLxdgTc+go/TOvHvFgZIhiwVjiP7DXbQSnwgQ==
X-Received: by 2002:a05:600c:c168:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-45892bbf6b9mr16728635e9.22.1753861381414;
        Wed, 30 Jul 2025 00:43:01 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:43:01 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: exynos2200: add serial_0/1 nodes
Date: Wed, 30 Jul 2025 10:42:52 +0300
Message-ID: <20250730074253.1884111-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_004302_861835_32FF7F45 
X-CRM114-Status: GOOD (  10.34  )
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

Add nodes for serial_0 (UART_DBG) and serial_1 (UART_BT), which
allows using them.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index bab77b442..22c6da907 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -336,6 +336,19 @@ pinctrl_peric1: pinctrl@10730000 {
 			reg = <0x10730000 0x1000>;
 		};
 
+		serial_1: serial@10840000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x10840000 0x100>;
+			clocks = <&cmu_peric1 CLK_MOUT_PERIC1_NOC_USER>,
+				 <&cmu_peric1 CLK_DOUT_PERIC1_UART_BT>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart1_bus>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos2200-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
@@ -458,6 +471,19 @@ pinctrl_peric2: pinctrl@11c30000 {
 			reg = <0x11c30000 0x1000>;
 		};
 
+		serial_0: serial@11c40000 {
+			compatible = "samsung,exynos2200-uart", "google,gs101-uart";
+			reg = <0x11c40000 0x100>;
+			clocks = <&cmu_peric2 CLK_MOUT_PERIC2_NOC_USER>,
+				 <&cmu_peric2 CLK_DOUT_PERIC2_UART_DBG>;
+			clock-names = "uart", "clk_uart_baud0";
+			interrupts = <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH 0>;
+			pinctrl-0 = <&uart0_bus_single>;
+			pinctrl-names = "default";
+			samsung,uart-fifosize = <256>;
+			status = "disabled";
+		};
+
 		cmu_cmgp: clock-controller@14e00000 {
 			compatible = "samsung,exynos2200-cmu-cmgp";
 			reg = <0x14e00000 0x8000>;
-- 
2.43.0


