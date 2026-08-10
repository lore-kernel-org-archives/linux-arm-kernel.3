Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE277C5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=; b=hC5IMYuM8ZuCTpuf/LS/K0H+5Y
	MA3jIoaLU4i+hdSiE2lQHSTPNsPYjByO1VTb6NVKYabWy2ysQcIJIpHR4skHJrCM3nE8fbsVB39cc
	AXCpqkgkM8iMq1gB4QFg++bDNwZz01aPFE1BIrONuVKyaTf7KKK+/YKHkcKoVZlRfunhe8xPxXnTi
	tjiMzrnuj180IPS8N+45i0AbIwSijL5HuZf/jH/ZnngKNGhz0WStIzkjAhU4k3qHbp5gpePc6wcp6
	jrodSpkgbzs6Uo+XMoRjT3v8dN5fOFWpd/cFGFgghlV1D+B3MC2ky3Pt/+l3DoWXq0n9hI0ffovp9
	hXa1YJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQs4-0000000Bz8B-0a28;
	Mon, 10 Aug 2026 14:20:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQrz-0000000Bz4A-3eXQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:20:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so8394605e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371650; x=1786976450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=UB2FXDGjOHoJJAC7O+cmyxDjPs3AzUKBkUUL/VeKrrpgKfSz4kx5ouPAC14BvhFQgg
         4UEU74YWzQn3LVsORnGN0SrzqrdRwQRMK1GwTyDawpn7kDnTU1+PSen8cF5NHRtfsO6Z
         7KvANzSDGBz87jRO3mx+BDc5hAnYS6d+mm01kPVoftAxKdu7DLUs6RUKD3M084Y4vKM7
         5W1yEZn/HWp7X6sVAZC6KNBjqqqMK/Xa5TvsRvKdmyofFSxgSU6NncHy1Sj5e/X8nalD
         wPuNb07ZKc08aUV8muwiTrGM3NbaKW+OK7BUb4+B5LuVPsEbu1fC86/ybPnlnbYKI2P2
         Knew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371650; x=1786976450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xn5syabkc8Ac7FLEHgBkaPrtGwoPhZlqa7sfgImM52A=;
        b=Sh4PYgQe/Imb9ddEieBLbFuLV8Na/VBrejLlUwm2qtsh7+tZwL6ZZ3yozMLxTe9AyW
         3XmbTQUR5X5/sE47QLnUbpThTJOmvnp3rywSRycmOdMBri4+Rp24m8f+Z5m7X+ban3/j
         WtUnK+matlyDxWN3jdqv4DhWhCZRPUfuBpddWqRd/H9AGGUbIYEVhYujX4HVKFndNwMj
         CGaGd4ZAp2/SElUoltRBjtldnIz7W1f0n9OSo7VODYu8ojFMB+BA1BS1BNRLBAhLHgjC
         MjkLKgDQZpIlS9CR91Ka1wkzhQjwZhfvSUmS0k8gNtzRg8Aksdyr85jwUawAT5CsSDPb
         dBpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpqFv1SbEbTPHobJDykVv+k6BPowaLJzcKWiJIiwaqrB9t3bHgYtNB+EfRZrAoJH7IXIeufDJZ39bgK81JilP3P@lists.infradead.org
X-Gm-Message-State: AOJu0YwbThzu/h+w4HEps2x2Lxi/7x1O43CQVGOISB+ec0DvSL8SESXE
	b0cFTBvkkkQ6m6vDNl0YnP+QvLjMXdpmQpXi6LMTXnGl7SKhb6+8MAm3
X-Gm-Gg: AR+sD12NVfJmVbv2IMWJYsmUBMDmzW0tFf2a8lt2/BIeDRPjhUHA8QGiG+2dVGKwysv
	L0T2YbXRfptXwLs0rlqhau5mWJPlGl7HmBasaHsn8Gd6E1dcLuXg3M4rGuy5T5Ro9ibRE/PvsCm
	jJNRLsfEcdGghLEw07C2FqXOu0dyBcg6phhg/fztOhSWhZbYbVceJv22jZcRII7hwH1CMQQ1WLn
	qQJhQsRh2ToKf8QkNFST5GF/BukAIHqf1wldt4jeQ7w4Gg3ECdnBPuWFi2Kl3YwOFMR7TfrJVBO
	pEfiAAaZdJQk15MOz4iYZsYcntLkBy5sqhrSaWccAIT7S22xRHwCTnNVdSOtAGQMZo3zwC8HZmT
	Ufy5hLotARo1po2fCtO05T2mwnxruVkLM1tuEm8PxK4r1L+hiDXMz/CiX5BLbwlHHMeImpbB/BB
	kZKDMTAn5KnLwiAWKHOam3kfZxrrrFBzJjmuGUgcf1YMb3d8AxJNo0D5igrO/vYkTfOBFEIpN4N
	GaP0A==
X-Received: by 2002:a05:600c:470a:b0:495:6338:1453 with SMTP id 5b1f17b1804b1-499727a866amr26769175e9.16.1786371649959;
        Mon, 10 Aug 2026 07:20:49 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm354413055e9.6.2026.08.10.07.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:20:49 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Mon, 10 Aug 2026 16:20:44 +0200
Message-ID: <20260810142047.2811230-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810142047.2811230-1-mehmet.fide@gmail.com>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072051_915339_32F60C38 
X-CRM114-Status: GOOD (  11.83  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1..74afc7b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0


