Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C292C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0sqO7MiIV0YXGPtkWglkjANT8DnIPJIuGkD2RdPwzI=; b=HqRCxAFZnsIMXScvo91Imjqu7Z
	yu6fW2SpGrC4vgdSpnvu9VCF/CCW9Pd+EHwpeM1/ZfKEdcQvbGaAE/AIsgx8vtyL8cCz8nsRuszYd
	CO+30a0f7xA7b/iTY9wQUwDcICNYK+Yai+gJOySX+pvhkboLuxMt354xU0AWzvdbyLm5vyTH7Qw/v
	fs2lXoXPpqWviyijD3KJLc/67IVm6wXhTYwd59pFo4O/vndL4lfyXV2+lxIk0yOoj6C6C+NU1oZis
	C3qyW8V8LuXHEno7G5oDvEsymSnEAP4ErguDYeLxEimQGyirPmBFdm9uY6R1zUEVjQ1o1hN6l0MVZ
	TkhAzBBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm4W-00000007hUr-3rK8;
	Wed, 05 Mar 2025 10:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplal-00000007bXe-0ME1;
	Wed, 05 Mar 2025 10:03:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=K0sqO7MiIV0YXGPtkWglkjANT8DnIPJIuGkD2RdPwzI=; b=W4fN1vtAsYGcDYEtbJCu58mqii
	m+uHB4Lghke5xrg0KIEDJ9NTIZK1SkVCSdPnBEr2niI3wZPJlx9lJgm2LH7ewZpVzqhgxACNmM0Dz
	HgPfWI0sQmn+ZD2wt/jhDiWYIvTWwqxtHZ5ndHU8zSBoA7WJ8qcEvPAHtc0MRHowEDJT3Afv+Ojj4
	+2D5hmYsmJbEkfdcUegoBO8Xb2IUWfwS0lQ2SOcLj3cCdMEcN1zdsqAmLxQRkTOJ8kOL9ifd2sjuh
	K2AB+tI/QN0EjfcpcyLJLeek3lBrdtxN+MzcYKnscegYXtrSfPWLaX8CM+jbTqrT4CYBLaSnbbVhT
	zWj1YcBw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tplai-00000000SMk-0KbM;
	Wed, 05 Mar 2025 10:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BB385C6791;
	Wed,  5 Mar 2025 10:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EFBCC4CEF4;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741168979;
	bh=qXZhNxUy9y5s5LhZ9M7FyoFK7Zgj7Uh6fOjZphxmzps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=brlsUdiLkj6uFQI83Rx64BhEpt0f6LbLZHu2Khg1HZNDlqvbOlplaOk9EGo9JIqd0
	 N3NSmjFFGLVc4TMuAkpspuXYvT4Oy77VljhYZfrzeqBnfn+Wvu7MKux60T03RVM05X
	 rzGHFHb3yRkOVFw20ZEOyQ1CYatsruD3gIykCJVOhVpD/LfYg3yMlWsaWo0FXM7dEa
	 Z1H4ag8OvxMdF37uQ/fJVydWHgaqNXtlkzf+F7deugWRZKuJsRES1wl3hjDI37HhVZ
	 W9JozKek437U9U9r/aPnENup16RzodnsCf/J3k11vLERu/JMT6ZuzDC3KC6ySX97ul
	 eWX2KwJ63W+vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84127C282DC;
	Wed,  5 Mar 2025 10:02:59 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 05 Mar 2025 18:02:59 +0800
Subject: [PATCH v3 4/4] arm64: dts: Add gpio_intc node for Amlogic A5 SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-irqchip-gpio-a4-a5-v3-4-1eec70352fea@amlogic.com>
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
In-Reply-To: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741168977; l=835;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=+kt3Jevc/8KR/ZsMbFbD2TjHFreHkm3hzIePStnSOmI=;
 b=Y+ZgkQxFXXebgdt+OHFoNFpS4isEwl4O3fedcvVUiD3qNaUH+8bL7MedEgak2N4TiJEubjOaM
 C97GM5j0LK9CMLgXGM7wtF4JzMGY1AjUd8u1EJ8B87QJqinevRLwS8g
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100304_390754_7DDE13AE 
X-CRM114-Status: UNSURE (   8.41  )
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
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
index 17a6316de891..32ed1776891b 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
@@ -48,3 +48,15 @@ pwrc: power-controller {
 		};
 	};
 };
+
+&apb {
+	gpio_intc: interrupt-controller@4080 {
+		compatible = "amlogic,a5-gpio-intc",
+			     "amlogic,meson-gpio-intc";
+		reg = <0x0 0x4080 0x0 0x20>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		amlogic,channel-interrupts =
+			<10 11 12 13 14 15 16 17 18 19 20 21>;
+	};
+};

-- 
2.37.1



