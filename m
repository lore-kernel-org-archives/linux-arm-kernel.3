Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA9CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=; b=MjnOul/94WJrD/zNgkv8Fo5i68
	o/3RSiXPJb3ctcKGcm+9o2uCkDs6O9ZjKv73a9RucM84xcJUAlVH/Dd1bhahUb1fv2PIF4ARyTHQx
	qb2le47ZFSQq1ElZMTQwTkiU10V96UyNlSH5IF3I+RWu1HMROrcp60M+Mh+1dkhKcClLF/jNELJ3v
	B0tWI6lNE2qhzLhznvpR0Ssj3Mii0wsBMu35czfB02asWTM3rNLYP/GZEfM5JFx4ymAQnqIhHa/WX
	kF7F06/VC8xkgdxSzjr7fCraNrB5cePZrWHTjteDparqV00ShwFinMqkY1+rlkzDYA9LpbTO7FQvD
	MJw5Uwyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO7T-00000007sCJ-0Y36;
	Wed, 24 Jun 2026 13:58:23 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO7P-00000007sA9-3cm5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:58:21 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-7296b265011so783556137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309498; x=1782914298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=;
        b=GMSNmIIIKGSnrbTEsYvJ8zHjypQZ7WyCcPvo0306WRV357aKi3QN0dr6a8Ou6I1Gx4
         bE5poLRJLDfIAIcbXfGFT+QAYib5UO3c170RFpYBlC+TWS5PUZyFK+xdTQ8GCckgKtAS
         Bgviny+zA26FdVfaHeWGsS/GVvm8i5sWKgBdO5fkntBSsPFIh/ZCVYr5CsI28akj6nb2
         2+8CO2IEQw35E2VAF/L3Uco5wIkqTeeFQ1krdRIw63VxvTF07CFoUsZxbaQHkZWb72VY
         Jc6y0Xo4M2x2NhDRF8j3CNRcsUL0Zdbji5z60lnm4bS57mICbSogGhbuBK21q+x3vvc0
         R93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309498; x=1782914298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPJvPBqHRLtbAIAX38K/sq/Rtd1BSFIp6Jl6pM1DOLQ=;
        b=BaD/tu2ugw8IWcbvyyatU2BbKZV262m8bqPwTfwTv20p+RlMaYynYnJ2rvMmY+IlG9
         hcE/VoKB22PCqTM4KU6mrJwYsJVu12ETiu+Viu2lEIVKGHnLtWNsx/eEACq3bxXAfm6o
         Y2mOjLG2EP3/kJ5dLwCs+/c+jVbFLRJC0FKEkF7DT7posKp5/QRTPGOTGVUUtU/cGw3I
         VoIIKGxYT4cpaBbeV9xO/cFwAscE6XKxJaA+Vd5hmCCeqbatrUdlQEtMYi5A/W2eQyZy
         zCESdGn/8zMdfR5s5yJnkA+SOUrTYTMB0B6F5ltvDqQhzNjxKOVtODYrlL1XhdfH74mv
         v8RA==
X-Forwarded-Encrypted: i=1; AHgh+RojDV7k9xaEnqT0qIBvs8L+8YlCaWBrdjVDNUoB6ZUHFf/xNvL5CtSbUqYIjpnYg6IiHRBrKl/JoKh4fWZvEFe4@lists.infradead.org
X-Gm-Message-State: AOJu0YzxDS+YPw2hjUBY86/ItKPCgbKhNh07pengXe768oVCzPkp3+kc
	EaR4OUr1f0p6urs0kE3AXFGSpUVEoticzkQXxW1Zibmn5cvmPKnhw4TH
X-Gm-Gg: AfdE7ck74SNDC4iyDQw9ZFTE2HEnKfTiyd8mrRD91if7zoHGGjcYinPNov9msLFr4if
	FcMQKWgqLZm5U51Jji2WR7grH3EVTkKt+PH1GbyvJCNj1TshWE8teAEvgQavTargK1tens1vv1k
	57JL9HiMnvVuUQ6kZ87g5EFtaYG+C7xpOcNbMtqzkz6jUHuaZgc0nSlCSUz58z9oeMjZrOj+WoT
	4tARiQrv5FhwUZlkxdta6Iw3OBPZC9WTJeO4TQMQ6ZTanJ+nQi1z0yWL+YROZvimmA/MqXrrXi/
	SYPeiuSBxjkbEJhlOv5FYZB0bgP7zYjFJWQFLZdHz1DaV8MwvoPY3OpIIIywIbFleNyER8X6Bqk
	odg6fFNqaEk3kdH0EmUpINPWXcIhJv6llDhsrIvzpA2jUGc+URlR1aRqC0nq68e3xYY6UCFda1Y
	cQrGh+pekHdC5eg5P0S0hVKvUQYdIpULwyyfE=
X-Received: by 2002:a05:6102:4408:b0:631:28c1:154e with SMTP id ada2fe7eead31-73114f0f269mr1737232137.16.1782309498658;
        Wed, 24 Jun 2026 06:58:18 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:58:18 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe
Date: Wed, 24 Jun 2026 21:56:44 +0800
Message-ID: <20260624135650.727077-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065819_909122_EE457665 
X-CRM114-Status: UNSURE (   8.89  )
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

The PCIe PHY node references mipi_pcie_analog_dphy via its phys property.
Enable this analog PHY node to make PCIe functionally viable.

Fixes: 9715b01da6cf ("arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 7ba249cc3d56..4f13e2b041e1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -431,6 +431,10 @@ gpio_speaker: gpio-controller@1f {
 	};
 };
 
+&mipi_pcie_analog_dphy {
+	status = "okay";
+};
+
 &pdm {
 	pinctrl-0 = <&pdm_dclk_a14_pins>, <&pdm_din0_pins>,
 		    <&pdm_din1_pins>, <&pdm_din2_pins>, <&pdm_din3_pins>;
-- 
2.54.0


