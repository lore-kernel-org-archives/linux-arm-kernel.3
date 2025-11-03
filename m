Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508A0CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7uol8SK9zB104eiF162tGqib2QMloTOnkfiMZtp2mug=; b=T0kFOSOj1d00VXJ287tFK/cvKN
	tWTB423y2lPmQtG9sR4O5k691oznQc2+4aUyiIBdM0BTTmxm62Mgkk/RXy2i24YDVF7HY5RwV3frW
	xtjbFU+WKB7O2rHGjb9SS3QtUsnQ0czwXV+43arfoNPcITUB4hn9jN7330AKijyX6bV8WqNoe53HX
	EcFfqS9TbCKutJIOFr5oc9yZuxOovaKN1vYA9vGBV7tLl8ibh20vFDTyWYBOY5Am9dIi8BvXZ19DB
	lUQzEcQJPIOb2q1TiyNxMHNu6ZKEsBgWLQPQjzQeivgIgvECGvpcjmlsyPHPX4ScKwbaeqKoOqbjx
	5gsjLuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrp9-00000009dUz-1Jin;
	Mon, 03 Nov 2025 10:30:07 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrp5-00000009dTX-1duz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:30:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-640741cdda7so5255258a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762165801; x=1762770601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uol8SK9zB104eiF162tGqib2QMloTOnkfiMZtp2mug=;
        b=fOSBW4ArvDC7mEUh2aQGrBTj+euzgiG9/RQLgcmFCxGHNBJqCGVMzzIII7Ac5JwIot
         AwvM4n32GRa3QvpDcaGHlLPFQWT58ycZRbw0NgY3UzGoftJVS3uMlTIBwl+ejttkelCt
         jn3lMIIJdp5qwuPfljoTr3V6pC/oilhcEEVFyA8BzKtbD7md2k5Wo4x49WwV1mHsKymn
         RVjNy2GlwXROPZVD3cagPYY0TIrfx5yreYLFlR1E395TEBXtLZsMdJlktz1ddhjLlwsV
         LnRd0LczSHP4cm5fgpopn5c+7w0Y20qYyeHyfdBYK4pVru5H157glkHWnuCUWqc2cJt7
         NcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165801; x=1762770601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uol8SK9zB104eiF162tGqib2QMloTOnkfiMZtp2mug=;
        b=Hm9r1PtHzbdvzAX2WVMD0qrk3MvC/Ke2G3HfKXKS2p5TAHzIAj4N6ABnyMiy5k617N
         I2dN6lN3Y+/YMmBLBayt6zT+B2w7eTMCkjd5hdpdEhAhuynEBF/dlAmNgK2TdcKmY7q2
         fdmNSFkXlVj2skzsYNMv+tQh8P1H/IV412l4GUPjVGvv9OcE3kM8FNlQw7CXdvvsmS5P
         moizzfWnKLpYXDEbcO85aoDfNN3vaSj/d5p5IwCjd/yxlDibgXEe3pssM5AfMAbkx2aT
         GTHRJbo6WT0WSD8GLvtQA21zxUtHS2o/z5U4+8KSn8iZwyGU3mnMfEr5yuIjz2af3uyW
         x3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY58bY1U0/GWzI5Vn+jKFQAuBQ6utuCatuiAtbKg0JX1crQqMO6IaNfkLTZClK2taR7JaTVaMWZB4PiVMoTVWD@lists.infradead.org
X-Gm-Message-State: AOJu0YzZQaiDe7nb8RkUXjJghO52q6O6W2v/eu5j6oFf3a5StBBNw7XD
	tCIZB+h9tWxwZ8k9x+dLnx/UFQ7CwaixWsWNs9otdJ7cL2iV+bLWvzXs
X-Gm-Gg: ASbGncsXRkRBvhJAX9SfSllfzRqJ0fcWU3DgwYRr3EuB+ILJXgb4ZmKFYSS3VMU1EyD
	58dhnRP9YtAHB2rlY7SpePuXB5Q3kOyn0+uuHIW+Ez8+CVIUadO4sOOZIx6AzEC0eufoOHNSuoP
	StYn175/c2br5h+Be8RTx6ZCXxO8QVuxbdZ2Ebnq6qJQB572dl2YDApSVxCZfl4VQLd9+2IXrge
	b6sCeMSO/MpEvB9CwmgQ8EbOVCsN2JO99cTRhfCQw+G25wfTHfB/oYauoBpzFMkS54RsFkWUsAw
	bkxytqGneauEt0KDV3c9g8b1bY69F4frnwWcF0GxNDCfQ4iTcuUQ8z5Rl9a8YVLxNWxGeCJxc7b
	2yfAdNOoFAxui+JaSkTlS7OgzK6S+BfDJ0qHE38MtCTFBCrSY8JsLbdvlNVCjwm+FqCrb3owESb
	lbXKR4C/7DGspSl8hsqnY8grOlOcqyQteC
X-Google-Smtp-Source: AGHT+IFzeqw0ZeFTmoI7Ikvy2aB+JcBqMNqP5GohkKyfHRJfwjd2EG3S5q7dA3xFkhtZeKZ3AHM9dA==
X-Received: by 2002:a17:907:7252:b0:b6d:2682:8306 with SMTP id a640c23a62f3a-b7070198c2dmr1296081666b.23.1762165800923;
        Mon, 03 Nov 2025 02:30:00 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-81.as6723.net. [185.5.253.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975d77sm1005193966b.9.2025.11.03.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:30:00 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Johan Jonker <jbx6244@gmail.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Muhammed Efe Cetin <efectn@6tel.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
Date: Mon,  3 Nov 2025 12:27:40 +0200
Message-ID: <cf6e08dfdfbf1c540685d12388baab1326f95d2c.1762165324.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9232ae8cc8e7eb4f986734c8820f44b7989b9dae.1762161839.git.xakep.amatop@gmail.com>
References: <9232ae8cc8e7eb4f986734c8820f44b7989b9dae.1762161839.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_023004_041563_A4D2F8AE 
X-CRM114-Status: GOOD (  13.17  )
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

The vcc3v3_pcie20 fixed regulator powers the PCIe device-side 3.3V rail
for pcie2x1l2 via vpcie3v3-supply. The DTS mistakenly set its
regulator-min/max-microvolt to 1800000 (1.8 V). Correct both to 3300000
(3.3 V) to match the rail name, the PCIe/M.2 power requirement, and the
actual hardware wiring on Orange Pi 5.

Fixes: b6bc755d806e ("arm64: dts: rockchip: Add Orange Pi 5")
Cc: stable@vger.kernel.org
Signed-off-by: Mykola Kvach <xakep.amatop@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
Changes in v3:
- add "Cc: stable@vger.kernel.org" to commit message.

Changes in v2:
- add Fixes tag and Cc stable list as requested during review.
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
index ad6d04793b0a..83b9b6645a1e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts
@@ -14,8 +14,8 @@ vcc3v3_pcie20: regulator-vcc3v3-pcie20 {
 		gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
 		regulator-name = "vcc3v3_pcie20";
 		regulator-boot-on;
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <50000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
--
2.43.0


