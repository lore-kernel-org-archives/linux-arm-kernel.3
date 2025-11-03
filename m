Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938F4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zV61ssPxcQ80Vn+xuEZISQ1ICnJDQBimD7YTtlxO9tk=; b=qKi1Sg7zkmk+kOfOwcO5YW1mYG
	xLKhq2buhEedot326VZSP9I4L8nyAmagDvS7Ag/Rmwc6PK7k4P9m8raS16LZjYrJK1yXiGgvLI2k7
	I0BrwM4c9JvkHNPYpj+25VvoMNcZ3M3aNijbrIxiN5p+OKWGO//nJCB0IUoQuntWeAbGCMlKRQbvk
	23Y0xeJsKvBc0Jb/r9A5wRTqA5LuahLeYTSoDaKvFfRfGIB7QSNhWRNGA3rjsRkHOh6M4jMV7qRlG
	iFnJKCxwwFtv/wcTU2eMFbQPWiQLS0zoRVO2z4+awtm/D8c6nYRGay03q0Vkgd3kD2QPwa2g5FXVb
	idGIvXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrWX-00000009Zq9-1U1K;
	Mon, 03 Nov 2025 10:10:53 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrWV-00000009Zp7-1q43
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 10:10:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so542815266b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 02:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762164649; x=1762769449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zV61ssPxcQ80Vn+xuEZISQ1ICnJDQBimD7YTtlxO9tk=;
        b=FPVA8fPIY0Nn9sx6tfXHHSE7MZZVSCsBmNmojbHmL0g6qJH3X2WY3vwJdKCa29Yz0X
         m/Xv69/2lrCN6mobFG/MJeSD/zZsajYnRJCIHXO9jUjoK98iGUJTyLsl7Jl0wCsAdmMT
         uNfNWz7nmX+srtC0H7oAFdnNesSLaZiqKD9bknCAQPWCPZdQR6u56Sx5nVzzhAINdP5l
         6gw7JuiJxtsTILr+mwMVhbE63cAK0e9ccIm605+apyzD3NWMVS7xTK+KGQO7BTuy4VbL
         sIZiqaea0t8Pw88qd4ZP7AaUx7nSZQLTnGNL0f5zmJG9WMaIeCfJ7AU2GlN+OSVQPNYH
         BzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164649; x=1762769449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zV61ssPxcQ80Vn+xuEZISQ1ICnJDQBimD7YTtlxO9tk=;
        b=GIh5rK81PBpWm1+QCSKVRVZjft2dJrKgCESTcBki9zTUZdOaDTFiHSaUySDrTRjly0
         cW2EiFD+mymcjqhlsc480pM4Ajuk8z5VKjL5Y7UbMGX7juFVUiSRt63EP5AJ7qnoqQnd
         BvlxIIWeDEY+h/9/FpoO4826xuHN5g+su4t/rZX4PMGDyMWbupJQ8cA7vBDLCNH2psj/
         lWStcJQh7aM00ISUTtQ1lf63cV9UssyZNMg1J2nzY18tMYGpMyoQ7cMvnD8d0WyHjxUH
         /8mDnNJXJAHsfMfkPRei3sz+xAQqYa7F6VHqLA43qTT/+qYjgBU9Zz3zK3hSuHDjUM2G
         Rf2g==
X-Forwarded-Encrypted: i=1; AJvYcCVpSfOrKMy4i5rB+vdDMc5bUBOlOblrJMvhfcl+CBFRtTyjyVCMpZHuUOSuKFF9lQUUmnKaomHnsyAGDBxkR+ii@lists.infradead.org
X-Gm-Message-State: AOJu0YzmfP605uH5LIhIR489ogf9K/HusX5RK01OwVPPiZ+MBXncrNzV
	N+qa95xHDRcAfYF6oDbm1zHAAUIArZyVLuS3C6/0kn743acJXDdxrkwn
X-Gm-Gg: ASbGncsqTsYLtV4Ex3wpB9n95t4HQX2En/CRQx2SGCaPro0XboxB1812weMryCbduf8
	P1X/FzhV8x7eUx13rdUTLKg9ylilbQyNV6uo3012kl8Ul7XLJeGVZke1MUt+bUQdc6ji8fTDbhH
	UJlAi4o6OLf4oME/S7YZIjQV+FDcvjXpsEjDkZltT0YE+RvCNoyHcTSSN0/GqGGg4Cl12EywTWo
	l2B0LVmlxPxS/u1lAwQwk20wlUxOzQ5XGr9tC+b+n3gvfYm+noTC2y20jeLCxwsZx7+R+/SG0ny
	umGooT0PRIjus6b1Y33iU4npHZHnov6yIuI9Pk4GSfiClPb1r5r/hWng5Gpi4fRwD9fmLSXYX5Z
	x+ZBhaHaE54qtCDU6kH3VuENkgzskiSejXTsNIkxd4BPt9+gGclmY0UL6dPYLBzIqS3PTGiKFeV
	uQOfHRkQy+fxIXcB/9AR8Wa3ugXfiSZidXWMcv6n3AmC3cCYFgb/nyCA==
X-Google-Smtp-Source: AGHT+IFp+T/Nu357ftkE83jIAMW9+xcbhTQBIaVYYeJtQz1ee/caz6rCsgqFAGPZlpwzilmbvSJQ7g==
X-Received: by 2002:a17:907:2d25:b0:b3e:5f20:88ad with SMTP id a640c23a62f3a-b70701c3f34mr1227300566b.28.1762164649077;
        Mon, 03 Nov 2025 02:10:49 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-81.as6723.net. [185.5.253.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b718f8b52fdsm66758666b.18.2025.11.03.02.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 02:10:48 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Riesch <michael.riesch@collabora.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Muhammed Efe Cetin <efectn@6tel.net>,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
Date: Mon,  3 Nov 2025 12:08:14 +0200
Message-ID: <9232ae8cc8e7eb4f986734c8820f44b7989b9dae.1762161839.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251024173830.49211-1-xakep.amatop@gmail.com>
References: <20251024173830.49211-1-xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_021051_488752_4C791372 
X-CRM114-Status: GOOD (  12.99  )
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
Signed-off-by: Mykola Kvach <xakep.amatop@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
---
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


