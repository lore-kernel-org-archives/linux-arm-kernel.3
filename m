Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CAECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 16:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mKoGceCmZdjqtVEaWnOyGysDqJrMVQCO6tFjFTxYS8I=; b=zR353j/UNr5emAxl7ePWzTglPM
	iEVSICTePGyiLHtoGbJ0XBLORi+BhRMdvCFAP1QBtR4kqAqFI1rvTx/6GBZwj7awDClSB21stPzg2
	fYYza0CwZzsRz/yIf+n8SYGNvbV7tkAx4oqXsoHp+MhaGpPJqu2KK8YjSV76F1cN7Ucumv6NNnP0h
	kbXHzD33fIkffM1NPR9r6Yp6vomSjbetDYhuW7+5m1Y8EeuTgJqF0q62z84LFM6or7hHDJU7bOT5D
	IQEHV3+Ul8X9aY6Yw/lptxNOFqfbY4XdguTSoEB/tDA3b/Bj2xxqe99In+ExL9z84/xnaZjo0VZes
	CxCJDUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJBD-0000000GCRI-0dqs;
	Wed, 27 Aug 2025 16:39:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHAl-0000000Fld1-1cZf;
	Wed, 27 Aug 2025 14:30:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b65469a5bso18453285e9.0;
        Wed, 27 Aug 2025 07:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756305046; x=1756909846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mKoGceCmZdjqtVEaWnOyGysDqJrMVQCO6tFjFTxYS8I=;
        b=ksuH744W0EaquYX9PpzUnGPV1/fVfWCPRh3aEvauOdpvDv4ok80kZg+GwYVToY6DfQ
         /3hGCbYpU7gOhbxrS5c7r0l2ZbdcXrFGGcsCNVJ7WVXo17XhwIKc0xxsciCg4/8JHerl
         Yx0bDrMRTzqhlZNOiMTOAd6C2ensrVClKL4Bou+D3nojq+AT4Bl9hZhpvEsWSBbqLwH/
         aPM77XUZmEWHJU79+zDs2SAKbvQPFhrvl6ut46CjA1ZRr3HC18bxJu7UVBzGoOV+hd0a
         wjnXauUR6AD1sriME+Wnb/IUp07BL56wozoghDqIDVRq/7gA/s3DMouLb3oE0dkyJ5dt
         Onvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756305046; x=1756909846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKoGceCmZdjqtVEaWnOyGysDqJrMVQCO6tFjFTxYS8I=;
        b=cMJUGZJQn7gPzfYI1SeVbQfpB+IqRmCGGQn6Vt6QYkFp3Y+dMb9qbypkZPAkOZX2vm
         Q06d0JYy1Rp/7JHxS+wrtdEzN2ano1gGh7zyht/FgGYl2vkBeTrCvihlPph3PNfJ0PTe
         3IgXQUCfRnKbDfrvs4IigznP+FvyU6KNuepj0AhLFZyjOAzO5RQoeKP9NRPSLzMLycOE
         3GH9RhZ/+C25yBlkuZb/4DGIXW/egFoe9NrYD7G9qvdvVUJW/VhzUb7yTMkIYECzmY0Z
         me4lCxmEbUCwhgg2n3TpplgBWIugIItm3t9dWtPxIavbQ7Zx0mMFerqCEtbKTUyOcDrM
         wKBg==
X-Forwarded-Encrypted: i=1; AJvYcCW4KMfe9b9o4boKUZ5p0s/gKipAiGxJxoKxrZx3av+TtMLMoyuZ/bbcdVKdclX5FG8fzPM8WosFqim968zJrGlJ@lists.infradead.org, AJvYcCXLrszxTf/rufP6XU6FRFfbqgJHYBKft6YGBctdaQX/Z17TcNw0L8CP/XOuJjl3+UwZNyMinfdZwBtBSjzQE2c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yym6Pq8SuIRUtUP+4OQXiv4uAfLWmwHBGop3ItY8FZeS7CmnNcR
	VvOdZmCj7zwUtZNHKmtRGjcEYdnKYhlva68ZsPxbU/npPNiMoIAtaNxZ
X-Gm-Gg: ASbGncvKSG/SxGy/03X/aIzQKPgUnfH5+Jo1IzaXdef8Aw+7dGBSoRpDVzibqswpFan
	pY3MzX28Y2A8UJxEVmjiztsMf00JmuiCP+GHaNJoK/MH2E+KR78Z5+zYMoPmKRrnZmxubLnq4Fb
	uIBDPoZ5Gvj/oGqKL7F6GULgvFPPXTNAZKlTxQILKIqycxM/WxR5QnITjDUU2rgJ2KBXjCazVTT
	MaWA7R/GPWIoL5l0IKImXIb5enENtgSfhnNnVPkN2mNFn2eOhYnyPHOhBkQsMiDkT2zYZOAl9jS
	3JYTvvgbcZUwD3C25I7nHsaUoawVQ7MTrhsBeRjENG9/Sm1LPo6XSfkALy7zt9TBC2xAC68qoxg
	+ceruBU0dnh7UW5v5aeT6phNcAJNZffU+77PhQM9JMUGqY3whb1tw4BCBHncudqjG6QWL7H0hhz
	lmzYINgKcnZoZXvl6eziC+IZgj+tlDqS39qLHsokzAoTMW+nxKpvnkgqoDxiZAtzA=
X-Google-Smtp-Source: AGHT+IGNhmnIOlvZDXgwDv5jAIG433hsvRYz0Ropb3hEl0pCqcmWeivCqt/d0LGNJ8lPoTcbNrh8og==
X-Received: by 2002:a05:600c:46d3:b0:459:dde3:1a56 with SMTP id 5b1f17b1804b1-45b517d2ab6mr163378945e9.28.1756305045443;
        Wed, 27 Aug 2025 07:30:45 -0700 (PDT)
Received: from cypher.home.roving-it.com (7.9.7.f.b.1.3.0.b.8.f.0.9.e.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:e9:f8b:31b:f797])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cbc6a5da6dsm6421531f8f.63.2025.08.27.07.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 07:30:45 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Diederik de Haas <didi.debian@cknow.org>,
	dsimic@manjaro.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2] arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
Date: Wed, 27 Aug 2025 15:30:37 +0100
Message-ID: <20250827143040.1644867-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_073047_424126_BA7726A2 
X-CRM114-Status: GOOD (  10.49  )
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

Update the wake-up pin and associated interupt details for the
Pinebook Pro WiFi module.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

v2:
- Drop alias
- Tweak commit details

 .../boot/dts/rockchip/rk3399-pinebook-pro.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
index b33a1509a8e93..2ab416f930274 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dts
@@ -883,6 +883,12 @@ vcc5v0_host_en_pin: vcc5v0-host-en-pin {
 		};
 	};
 
+	wifi {
+		wifi_host_wake_l: wifi-host-wake-l {
+			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	wireless-bluetooth {
 		bt_wake_pin: bt-wake-pin {
 			rockchip,pins = <2 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -940,7 +946,19 @@ &sdio0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sdio0_bus4 &sdio0_cmd &sdio0_clk>;
 	sd-uhs-sdr104;
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_host_wake_l>;
+	};
 };
 
 &sdhci {
-- 
2.51.0


