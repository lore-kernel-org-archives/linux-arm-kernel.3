Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C0FC021AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNt4VJxJVT0g4hOPco1XTK7GaqVW8cQrpQZinq/Ex+Y=; b=fgUlqj7D+enQGha7iLGE+HCuG5
	A9z/MavMouDKQ6dNUQRkefm3kXNF5Y2g+xHtMxVlGqm0I20cNp2XAf8eEKiWVYr4pfl9y8zafnl3N
	PDQ3s7gCRoM0eeyrHJkt95icK+wRlcim4pdqL++1evYJnrN1SphoWUBt5IGWkg3bAgCSNJVNNt6t0
	srbNhCVzbbQ0NR+N4lsGqqletxBG1SaDJ6H41c4Z49Y8v3g0WZkzfBs8RAQuH69edqOqB+/hJuTLl
	u22G6jWKO74yENihn2UcRtJkYjr9kRIMXt65ofbvH6asJwp6EHHpk8NotCfTjUx6yAQsT51UF/F/S
	JskoBSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkebZ-0000000BH9O-1mRT;
	Wed, 19 Feb 2025 07:34:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeW4-0000000BFQb-2J5R;
	Wed, 19 Feb 2025 07:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8C6535C56D9;
	Wed, 19 Feb 2025 07:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F822C4AF0C;
	Wed, 19 Feb 2025 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739950147;
	bh=HknlYHJ8tz+A28RZeAUK2n0RUQjxiS7iSFIcscAs29M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jiqzQO8eqT3QKHvITTzpTJFutn318T6FeX52wLzdiQ192ziqOgc+XlIVA6rDaDMo2
	 05Nii76TGlENO/gIwUDfA+Eld/7Q0Ac22EFn8dw3hH0zK1eK8RJKSMHzohKczZpv8/
	 7sIyPQUGPlaJZ+JCBT8WRvWd6UN1pWBlT1ThbqvWeTqKm3OkORTA0bn/3Tto8PcpHo
	 0kO+ginu1RcpVYdS1ncERo233E8PmV/frQF8MTTwulg2TIaL96XlL7FEcoPwRBZZBl
	 2F8F5AbcdbYNvXALBinGYEe82FAZXFMkjDf8dYk7OmxWjey1aEUb4lL1uGSwcbBQZD
	 mqx/R0IrlkZ+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C79C021AA;
	Wed, 19 Feb 2025 07:29:07 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 19 Feb 2025 15:29:05 +0800
Subject: [PATCH 3/4] arm64: dts: Add gpio_intc node for Amlogic-A4 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-irqchip-gpio-a4-a5-v1-3-3c8e44ae42df@amlogic.com>
References: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
In-Reply-To: <20250219-irqchip-gpio-a4-a5-v1-0-3c8e44ae42df@amlogic.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739950145; l=1112;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Z5iS0U/t0eDJi8p3yWZRKRxB4HUB3kbspYJzuBGUEvY=;
 b=Xpu310zMvvJOvhySwQFInLA7e/xPbzguo5SyFqGfblvCL+ygDAlaELhoWgnENbuhhJ+xQrKq1
 K3d9dggFYJNBYgcd/0lSOCUkdoLjo6gDAug7q03p0JPQyhUfjKhwdcW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_232908_667644_D43CD887 
X-CRM114-Status: UNSURE (   9.01  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add GPIO interrupt controller device.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index de10e7aebf21..a06838552f21 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -48,3 +48,24 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	gpio_intc: interrupt-controller@4080 {
+		compatible = "amlogic,a4-gpio-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x4080 0x0 0x20>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts =
+			<10 11 12 13 14 15 16 17 18 19 20 21>;
+	};
+
+	gpio_ao_intc: interrupt-controller@8e72c {
+		compatible = "amlogic,a4-gpio-ao-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x8e72c 0x0 0x0c>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts = <140 141>;
+	};
+};

-- 
2.37.1



