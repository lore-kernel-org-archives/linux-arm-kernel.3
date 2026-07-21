Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCA3C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2PlaeHicSjwm9RU3yTM3r1gOKB/KIi551qDeGreVpA=; b=OxKpeMdzvhqpOxXTNC+u+RKQVR
	Ttuh6Macfjlz+4K88/oHczAGQdX2xsNjXMitow9kKaKzNgqchdJpJj992scC9xSUbA9OorjC+hSqP
	rbUjdw2rTnWqg+ay8j1hz6i3uMF4VvdM3WWz6KF1FWn0t0laqpg+p8A5PbsA/Eu6uCJgdMCjmq+yb
	+RXIECJCEd2sVmnmpa3WA8iI3yyb1r65ttvF9MU8PUUMD2UBuvwcGECRfxmYCJ4JBN0iyv9aWVODa
	yVZFDdE3fsq4md4t3fCpf2mglaSwCH8I0T9dqS+Rjjp+J0YVjtvkHzuThSVPKjeUe0M3O+jm81S/5
	d+Nv4qeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAw7-00000009afc-2V9Q;
	Tue, 21 Jul 2026 13:55:07 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAw5-00000009aeE-0vfF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:55:06 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so4854996e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784642104; x=1785246904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i2PlaeHicSjwm9RU3yTM3r1gOKB/KIi551qDeGreVpA=;
        b=D7SBoN/QNC73Y75HpkdayK3BRcWM2dh1MpvYUWi4VsJ4h0E/r9AwPBFom50VFEnIUU
         9GnSiK9bNrhDsKx1tpD1/oBrT1DSWmDYjIt7AdvQ9OBaP4H3YVcDTEG7D/yZD8ulNO3V
         7IgpAks2xwe9x7vsGTF07gNADo4rjSRV6Xrj6tW9QCELIQcaroeH5nXzv7bpMNrVQ4Ii
         2LyWdzGRuS3qngzAU579Ii0VLAyWnoowvz9aoLY0XeMIMQMCefWN6OHwsIl18mk3IXmr
         HQ+9taqxhggP8oRIhQT4Rg8DKB4YYxivrdrpdMbbBj3RSARUNDXLIxPK/EkybdPafyF/
         L3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784642104; x=1785246904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i2PlaeHicSjwm9RU3yTM3r1gOKB/KIi551qDeGreVpA=;
        b=YSZCve9QGeO8RL/KNGujYCmQ3kqav3SS5dBCLNnq+xGZKK6fbFM/WioCdv+3KZUcSH
         h9VKYDli9xBSjWlc36iKu+Qob8g1E1/gkXnIogENCaA1rbsN/Rf7v+3s2pSrzNBEuJ5J
         J20rmUJVXnbr97iBAP4VS9IEg/viPgu+jBceuFr0VGs7Se/pYcRnW7L8Qjs4nO4bGFnu
         YEZi/Lfje2DbN2/GFu9ztodxgu6vCgJf2kj21hLSfBXC9+EUwPHS0rUomgXKyPEoLxQz
         tlszL1TiUYfxzp9SDM1T7WLp1sK9M85NEH4zJxgMn/28+3hlO5elKn0Iico5tsf9WoD0
         4spw==
X-Forwarded-Encrypted: i=1; AHgh+RoayvuxdR8hj778CJtE0A5HF5Q/wmzO4Ybkc4Xpk2IeKSi0nFvagX6WPJlf4m6SA3tOwkj6EQIqG4cKj/SwR1/l@lists.infradead.org
X-Gm-Message-State: AOJu0YxYEyQ5hVPd0SFIAXkOkorD/8JShaRGnGmZUrdERyzxowQIBMmd
	ORj6ZjUfrIbTa4PNyy1bPls53MQ4xCZbfOB/4tEAgdp76oVIw6y8s2XR
X-Gm-Gg: AR+sD11Qet33XElnJfudUSCWKeCVyJj742ZWQEAeF+tD9XNOqJkakoB11hgcCfgdQEy
	qJC5zx2Q1IR6jCdAFU+Ks2pCNqVdXokmqDWDGZHb58fF5jBasTDDkHFZTHfkIP5vEr/0VWB+dP/
	luYZ2jjrLAn0Kw16pMLntaD50Hai8aOPi36SgaMG0Y67pJ7alq6QQNkmajl5KgCru/gvt0VHyBD
	YXcrc9dBFDAt0tlg4j+uAfksw1aD3DVQL5mK4NweUrpWQPuz8Exp5CHEIP7+tb0ThWYYdepV7gA
	N816GQJ1cz6CcuQsXIwf5ro1XkQZzxiEXbOqPxQwbFT1cAVcSqlF7J56Qt+ZlZdOvNCTur/jEpf
	elFWl+DYI0U5/jXFVujgHbeVtwSSXcJ1HF9SHWiCxiHmnqJPBJKeOtrf+AGhwwihndYHPqZhl14
	EFfjEFs89w6o6+0rcJoy/5kbjSHr6IgWPjzK/paDcwbSZOx/U5Mg==
X-Received: by 2002:a05:6122:3119:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c1afc0dee1mr5588051e0c.0.1784642103839;
        Tue, 21 Jul 2026 06:55:03 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:a24:fdfe:648c:2808:d17c])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c1eecc9b1csm13271387e0c.2.2026.07.21.06.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:55:03 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	ivan8215145640@gmail.com,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property
Date: Tue, 21 Jul 2026 10:54:50 -0300
Message-ID: <20260721135450.45286-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_065505_266403_8E7FDE72 
X-CRM114-Status: GOOD (  12.78  )
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

The TSC2007 driver uses the ti,max-rt property to specify the maximum
touch resistance, but the rk3566-bigtreetech-cb2 device tree uses the
undocumented ti,rt-thr property instead.

As a result, the configured value is ignored and the driver falls back
to its default maximum resistance value of 4095.

Replace ti,rt-thr with ti,max-rt to preserve the intended resistance
threshold of 3000.

Fixes: bfbc663d2733 ("arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Use the documented ti,max-rt instead. (Sashiko)

 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index b6cf03a7ba66..04cf285e6c2a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -569,7 +569,7 @@ tft_tp: touchscreen@48 {
 		reg = <0x48>;
 		status = "okay";
 		ti,x-plate-ohms = <660>;
-		ti,rt-thr = <3000>;
+		ti,max-rt = <3000>;
 		ti,fuzzx = <32>;
 		ti,fuzzy = <16>;
 	};
-- 
2.43.0


