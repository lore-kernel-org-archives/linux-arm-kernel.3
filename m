Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B62ECD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=; b=uBK1Gzr1YKEkPTXLmbXjMC+dhD
	EM/wrnfuILk0xZRSXAmgKj3fK/TR4cb2sFxdEKQEwnhTNANdVcv6plcjLoff5ZjxAh7tSuV78R/fF
	CFzWd11UEbUM2eVmGClEkAe2CJt/G/Yop4QyWVka8kVR33G1zmVWjV4NJI1DXqqAMMUikFDqw/BVb
	YC/Nn8p37KPZvZx9Nob0XqIx2YXZBh4GO3AQ111hlTz+U2JPZEmumhR/Yq5vqHuIeKg89+FL7PvS/
	vvmS9e0nl8VtwiiWsXy8dYnuSURJOFiknUWsWrGNZRor0Jd6dSVKQiZaIxh9QQWqnLf9mnvbdrEBS
	Pvo6VpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYQ-0000000GsKm-06NH;
	Wed, 17 Jun 2026 08:23:22 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlYN-0000000GsIe-1l2b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 08:23:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c6c57c5bcfso1846065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684599; x=1782289399; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=Ib+ZZ8yBAjT3j7MQm1o1nJcxqEn45NLO03EpyGEMAa9bFYKAqFSldjV2n0t44RtxGT
         /i5ESBlbb9yuxYON9F+Mtk1SPqxG3HlkKAJ6U5pnu7wmE6dt/wX2yYdtZZ69zorp7Jph
         518dKDNqA+L/HbRd+5uhi/ey1dZk1BdmvYqI5EgAfzvKkoRZvLJwF8/UPKKbi6G0Qtm0
         qd8G7afyTlVHzipT/z9yVkAWLJ1vXVNctlTyu/AwhjmrIjcV5KriCsbjQovp+nA8a+re
         hAwnXNW9XaiGJwb78v9f/GeyobRHGK51Tq3EGjNfiOnO2dsGtm7iZxUv6vAQnbyC67Yc
         EB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684599; x=1782289399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=i7/zLr1zROfzwo61soKENcRXGdQGLucF845yuslQV36Q8LdWVFGnc9+K7Fy8xGpYFo
         kAdwCGwnXphVMCQwGsAQk1/CzsksA2SotMA4ognGJIl9ZG6A0e3uGNfajhaQ5xH6iW+y
         8F6Bxn+jnZeIbDRfx9mlbKkYYOYlcDJVNAHLhtBHYyam6E5aA0qniTsnur9k+Fir89b7
         oZ4IBYgLMilj854QEBlNQOQ7TIIWFLkHPHnJKhdd66XFiLGxV55xfST7W9YLVRgI155x
         kdYl7lsetm2t6HJiDzFUtnKj3pLQI0jyMOATt6mf2oscZYIaNfMV1xr/jYKPcrZ1IF3t
         aqWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h+WSLYpGbbvANVlWw+cp8S77qXfw6dXTCEoRqtY8MN/L9Mf1BTrFfJBRYTbtzy3yEfQpEp3u5LOdRMrPT57p5@lists.infradead.org
X-Gm-Message-State: AOJu0YzsroRWmh4y0t2AWOPkHg+lBA+Tz+mZ/HfojGgbpdBzhon8H9qn
	vM4qzC0mGZQXMyD/LZk7bJEyhtJYARwAS6x8gxs8TfgSkgbFzHcF29Ax
X-Gm-Gg: AfdE7cnYhE9h3pTIF6jAhg85NahbVfRvwCI/1DmhYO5IDB5ZrSciKGNcO+ayidbcq7r
	G4CrMarAziwZNICkqBFYJhxcpf4pGOgLJDS5PZkRseyXejb+jqxuO44mnjo7wwrjoi4IGi71t3z
	602hG5KwnNJT7SKJIUtwh6A9yMiQ2uWc40zoyMq8xAaoOvZXHjG5KfriIylZZCrsHKqG+W/3/pa
	P5FMBJs06QYTf/mxNQugaI31eXIVKfVqBZPgGCv2787RSiU2EJ+IyT4gTY+8oiUFScwi8rlsMME
	9JjUzjGfoe08zpFTfH4Y6e/ip/3sU7IwmouHZ8hZF15t65sKqjXXS7WcgMGVrgOVpTyytrcdC4m
	3zIA+v6XaE7EqgHgXKOCIC9AzapH6aAoR6vyhP0L9281bWkvMf/P1Z5+5ZIvl1KZjza/uR1a/l6
	mEscZmZFUA1g==
X-Received: by 2002:a17:903:3c46:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c6bc27199amr27006845ad.36.1781684598761;
        Wed, 17 Jun 2026 01:23:18 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:18 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 17 Jun 2026 16:22:34 +0800
Message-ID: <20260617082239.645562-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012319_460729_D11209CF 
X-CRM114-Status: GOOD (  12.66  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


