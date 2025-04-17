Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E12C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vhbx+bCAusBuhB4YSBmCMqVpTWQm/Knsl3YIFunD95w=; b=cMGQEp65+wcXmryx3L4BKncNXc
	AW1SgRi8D3/z0FVC9hXnmocoJBVIMJuzlnFOm+XoHWSncR3TSqZHam+FIGiK/kwKpGwX/TOW1j5dc
	7DdOVsdqLtvxsjZOBdjCOnJq+a2PDpGkvIh4RZFPS0YoilJ/zfT83MSGN2H9cjWzfIzezMIXCc8sr
	/ZnzcVvrUsNnC3WVVpLxCXtDFYPgOS1x/gfM2ujVdp7a81UfvDjqta5a2XG5dn4G5bOQCI74PjN57
	MrfT9/9h2b85XmyNTgBAKLFrKY7JYEbFbjt6ewkWNXh3s4iXsO5uu3EuVeSw15qRBwa3F2Aor24lR
	UXcXrDMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KWZ-0000000CGNL-2QzI;
	Thu, 17 Apr 2025 08:23:07 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5KRx-0000000CFgM-0zMK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:18:22 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so4655325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744877899; x=1745482699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vhbx+bCAusBuhB4YSBmCMqVpTWQm/Knsl3YIFunD95w=;
        b=b9/0Ry7rFT2of9fp/GPGkitoQ0X8f62QqJ+5uaskG/FQk6IKY6mCUDoY7lCo8SKzIn
         /wmLyjOqJijadox1dDeTrU+ZTk9K0FjvpmFiqqfg+Rx23Fapv8xCP089tUUDTVl54gFM
         3FItxW2F0SHruSZ9vhVQy8iHljCmswArCbKKGWgRSXNewv8GeH70NqHxY3w3n4VKzbnW
         6M8UvkUfuQ6esYIscFTHqeu5jcYrl1gO7M3zg4z6Q41RWMjryRMWz3htNDM+E4azovBH
         UJ8L/J8BkSAgnp6OIrlPr0GjLxZroO7QIw0p8TpZVo0bPlVetCPSYmUSoWy/qX6pzbYs
         PMbA==
X-Forwarded-Encrypted: i=1; AJvYcCUj9Oix2QZkdFyP3NUSywTWDYh/PY8JC6KpejaNzOW+qV3lVtZfuIfbng6VlXsjr1InVgZx0vWhS4GGNayKu4w0@lists.infradead.org
X-Gm-Message-State: AOJu0YwhGKf4O+D1znYRLShc3JrI6bndHEy1WBo/dw8eLfP95dSzvhyG
	ZSMm4C8A6dpJcnB+wyG8shwy/uvWzkMAxfXNb1xlt3YsWs+lrgHEFdw0M5pCTDQ=
X-Gm-Gg: ASbGncsbr65rzNgUdSRzU8MkAJbT4vtxZO9LcZF714seFKjAC4QApvXDGzcMOSHxwTx
	o5cJlVKuF9Yo+xSTE6xwdmgI9f3ULC/4/PMocKP5GZDnkVvGJMTVQ10EBfjWRpXWjeWURjUNbTt
	SvP/PXQ6KebgQxSBy8x2W5LQ0XsUy1RPisMPZTTOXPooO9+mS2XrUmh3bS0t7TFW/px0JlO5KBO
	P+bcLUqWKz7c8L0WzACS3ci2nCJKU5kG4/VWRscodlFuUS6KV8uQCyEoPHf4zu2zK3MICCanU+v
	dQnWOOKZ55luoDeCfqMYd0eqzRGArhYpNg8CeYeVkNRNn8vgI3veGvo+Gfrp/yhTAOqISuSwcB8
	1C8YLk7WdK1JLCNutpuDDRoIatFKN7A==
X-Google-Smtp-Source: AGHT+IGvy0Cgkf7H1TJZ2HluLS9omEvNiYqpVykTs/EUqIvX4ArBY7w7s0uPn7G1fXY2icsH1GaztA==
X-Received: by 2002:a05:6000:1a88:b0:39e:dd1e:f325 with SMTP id ffacd0b85a97d-39ee5b3623cmr3756603f8f.31.1744877898995;
        Thu, 17 Apr 2025 01:18:18 -0700 (PDT)
Received: from framework.filo.uk (lewi-26-b2-v4wan-163478-cust494.vm4.cable.virginm.net. [86.21.73.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978018sm19055720f8f.49.2025.04.17.01.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:18:18 -0700 (PDT)
From: Tom Vincent <linux@tlvince.com>
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tom Vincent <linux@tlvince.com>
Subject: [PATCH] arm64: dts: rockchip: Assign RT5616 MCLK rate on rk3588-friendlyelec-cm3588
Date: Thu, 17 Apr 2025 09:17:53 +0100
Message-ID: <20250417081753.644950-1-linux@tlvince.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_011821_270130_0FCC0229 
X-CRM114-Status: GOOD (  10.58  )
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

The Realtek RT5616 audio codec on the FriendlyElec CM3588 module fails
to probe correctly due to the missing clock properties. This results
in distorted analogue audio output.

Assign MCLK to 12.288 MHz, which allows the codec to advertise most of
the standard sample rates per other RK3588 devices.

Signed-off-by: Tom Vincent <linux@tlvince.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
index e3a9598b99fc..cacffc851584 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588.dtsi
@@ -222,6 +222,10 @@ rt5616: audio-codec@1b {
 		compatible = "realtek,rt5616";
 		reg = <0x1b>;
 		#sound-dai-cells = <0>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clock-names = "mclk";
 	};
 };
 
-- 
2.49.0


