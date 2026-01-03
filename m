Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CF0FC6174
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtp/dZW9ya4TxwOta3UUFMIrN/FXohK03+kMMLH28dY=; b=SPxy2/Sv+HwfRGwJLC/CHlZQxF
	Djf5AXXya4SyvRUqlhrS5iVzucY8UYp1C/SHsEJheMVv+2TGLLHIG/rMZUCTRfa54/WboP7F6sBU8
	6ZJEUcyjRDd/48O0bkvNfXam1d7zZnVgfeOViup8qzBxtgplm41y7NH+SF6aJuH8yjhjZzAy2RA96
	bFo6DiNhpqlLGo2wGEyQPF9c9oHf40tLFss1Nul9QCWao3KqCJyMPBCAnJ5EpZsZ5czjiwReyVErs
	8wbJjUKk2ZIL5MFdzFvLaHq/DzU7iz9RFUlHWyIokSwKbXm6IsqZ3xT/K6ykWxO08H/XlhejgEtRS
	0emHEigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx4M-000000096Qb-1nyE;
	Sat, 03 Jan 2026 08:33:06 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbx4K-000000096PR-0325
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 08:33:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a09d981507so3586525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Jan 2026 00:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767429183; x=1768033983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtp/dZW9ya4TxwOta3UUFMIrN/FXohK03+kMMLH28dY=;
        b=O+z0N5iKyFKMH+Jnn+HWIr7uHQEEh5fRYCGcL/ofzyC0+RC9i7dmgQ+YnaxI0jQIKf
         gv6/1i9Ep0eW1bf6I/EH3rlpk0q6Z+dY4MZmy+1+gOASz2mmAoIWpCSgQTgy0AV/FTHY
         DFBk57i9i9Ju0tOP+l5ZBamQjiwGlznZD7b4wb0IJiaxxjrM2UNsC4/NPkN86gZyTqvG
         aczNL+CQ1Rw1tT+fKgglFFvVS67xl2FuJ780ar2oDOCEzPkfIqimY0jJzL3hPm7YnaI4
         RdRwy341ykNDlunolEXyt5UMUvSvIWrgjERZGoQ5n9RfFQjTQ26ni8xpV2FktBTaCg5u
         Gz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767429183; x=1768033983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mtp/dZW9ya4TxwOta3UUFMIrN/FXohK03+kMMLH28dY=;
        b=CYAgK8iSEPntOSOLj/7k2CE2ylbdO9RV0R2RiIsx1ArhqAzRRr09dc8099+RScn3wU
         Vr0Mste8Gtx7wsJu0Ra8jBskuEvpU1FOhU37xQ/6ILDZCfRrSpkO32+Slbk7K/uJjo6Z
         mj9BgUjqt0WLunR5OYJBwAxIYhFqDQoSBzXT+E+UXCamm7ph1tmow+qqPehAo9gMen1E
         wgRjLF99JGopeEvBy+UE/fi6l+BM2SFUN6LqDcfsosH4FgNZnQFfF5jF7ojMsM2SxNHR
         RT/bxz/QQv9Mso44JCKfj2WMUE18MoGFpm4pnqpsVSD7d95QVI6Qv73uXkPJ+KBspPjJ
         eORA==
X-Forwarded-Encrypted: i=1; AJvYcCWs9vcGclUe/GUbOqbd1whzhzxDgO+7wm3g0sZV+CYdmBXjWgAfsc6dq/xZkxvz9q8PBUYeG8mgRGTtjGEoJ4U6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj+paKJ+3k6N8BdfNUQDSHnuZXAjr0A4AGsxEz6dMkgrk7DEgl
	BIPKs8DaF6q9PcwgYUhjQpryAL4yLA77BNA/D/m54YhCZGzSwgi5ukZl92dbzzoT
X-Gm-Gg: AY/fxX7yUCHfaGDMiSfzCQgj6d+dsyEHz9KXaqddDHCD5qry4V51tZFkOqBd0yUUgUF
	SeKxX/jDX8uIbfxVq3pIXTbDSjqX0R62MhHCqdCcl24kVc34n3XzLo0YbL/Sc2E/9bDl7zcQfQC
	1dPvOozFwyqs2PFFdPe6bEIvCDMWCJyg3zRZKskI44FNxW+r7UXURs8T1CeKz3+A6shxLAsdHMv
	s1lQYUBszCkQ9Lw4rkDumBwi2QPPxKI5pIigqp11D8rUSXakWm9EV1Vzo45E3PXfVBlDhF92LqB
	V0hC6T8z3uC3JEGyVB3P0RM9B8rsOGyfuR85AKrCP7we9hTfWH9g3IFYify6S+8rp2E3qAHk7Rv
	/2WA2DMhJXQWOycPBh3PTTSvhCtuCzmEJ3NooykxrUNGj6554t/lBLvGJB0EKFhzK38GNoAgKDn
	6m0VevrA==
X-Google-Smtp-Source: AGHT+IF4+KGquo7ddnKSZYTeA5YRjfMxJO2/EkJueXQkQkzBA1/AjlzM6p5PsyRepGJBGL2j9Swfbw==
X-Received: by 2002:a17:903:2442:b0:29f:1b1f:784 with SMTP id d9443c01a7336-2a3c0940a8bmr16854045ad.4.1767429183029;
        Sat, 03 Jan 2026 00:33:03 -0800 (PST)
Received: from rockpi-5b ([45.112.0.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm391700365ad.21.2026.01.03.00.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 00:33:02 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Yongbo Zhang <giraffesnn123@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 1/3] arm64: dts: rockchip: rk3588-rock-5b-5bp-5t: Correct Type-C pin bias settings
Date: Sat,  3 Jan 2026 14:01:17 +0530
Message-ID: <20260103083232.9510-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260103083232.9510-1-linux.amoon@gmail.com>
References: <20260103083232.9510-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_003304_220669_863A59A8 
X-CRM114-Status: GOOD (  14.00  )
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

As pre FUSB302 datasheet interrupt line (INT_N) is an open-drain,
active-low signal. It requires a pull-up resistor to maintain a stable
high state when deasserted. Similarly, the TYPEC5V_PWREN_H enable signal
requires a pull-down resistor to ensure it defaults to a low state,
preventing unintended power delivery during the boot sequence.

Update the pinctrl entries to use pcfg_pull_up for usbc0_int and
pcfg_pull_down for vbus5v0_typec_en to align with the hardware's
electrical requirements.

Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Fixes: 67b2c15d8fb3 ("arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: As per the shematics CC_INT_L interrupt pin is GPIO3_B4_u
    As per the shematics TYPEC5V_PWREN_H pin is GPIO2_B6_d
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b3e76ad2d869..0cd8ac7bf538 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -537,11 +537,11 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
 
 	usb {
 		usbc0_int: usbc0-int {
-			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <3 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
 		};
 
 		vbus5v0_typec_en: vbus5v0-typec-en {
-			rockchip,pins = <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+			rockchip,pins = <2 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
 		};
 	};
 };
-- 
2.50.1


