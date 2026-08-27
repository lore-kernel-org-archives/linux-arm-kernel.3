Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A42C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18Tf5eq7c7EPz0T/T046bTiRGn0IVK3Q1r6G0x0NgoA=; b=lhWycICU07EqoOWSoVCFysrBDo
	MpG33yaqwl1MHj6sPDdgHuPBOOQsy7GOHOvVy2/mWA72MpaXiEA+apIe93GOx8oklKByN+X3rbJk4
	TtIUBTn6IMFtuzumDzpOrKIJdh/6Z8UISM27iyYu+tAje81EmS9aZjhjA7MbeZnaWTZS9tCm8+YOk
	Q8tN55ZEtoMGI5ugJb9vhvhwsI/6mkl5K+ma2fDzk38WDvhICVpaf95RkqfIiwPPilOhEErjk3LsL
	4LaDVPZiegBn6g+kb0U3DI8TKouVMhfrKdJQIw9wVJPG1Cyqf4AO7a2ygGLfP1hJVbmiNJHkxDiQU
	YvYVG5Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeO7-00000004XRU-0Ifs;
	Thu, 27 Aug 2026 17:59:43 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeO3-00000004XOq-0RyL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47f633e6058so93481f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853577; x=1788458377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18Tf5eq7c7EPz0T/T046bTiRGn0IVK3Q1r6G0x0NgoA=;
        b=N0SlM8H6l4aiUETKJ7t9DHIibZmNQL9iw4fNWd8y05rmZABRbquqmA6yLZeHS9p95s
         0jXvDRLJhDgdWrqdx3ZizMGSmfeLNFsYFctbVcZa9a4IGz0E0Af4hcNeO3buF6D6gAXS
         jhgt9l0Bl1+fBBzokhBaipTQzWmMS0txEFMjX4AkYouq5Gm7vTgKzDgZDTPksTsMUHsS
         uS/tI9EIvGVkB6gg38BS+rpIfbcmomeox2yxAQn7obneK0//jBptV3vHuq2iOoNP51hS
         UNsEUHe7HBJZrcv6hNu/ExVJDtGOu0Z56Ebc5svY8FqLqiOv1UI12xZ4geblr/vNhUMq
         fedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853577; x=1788458377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18Tf5eq7c7EPz0T/T046bTiRGn0IVK3Q1r6G0x0NgoA=;
        b=ctHefdABdNMHF/89dw/pZVzVnbBvoTAxE/U4ZWpGGnTPfHrherglaUrsSexusiEW11
         ctJxXiaEs3KcckfC9TDQRtiRllYMle069t/D1dl6eX9NEjcBDtYB+o70AH6Obq8mo0Pc
         Mb/IZ0hj1dmKtXOuUA3decnibTAlWunbPP9TD/zIwyQPOnJ3CmVhXZk6pgYMHWgLnRop
         64pdIbBNN2cY0nU2OJ2I/ZkOvXxcq5Re+bxhNJdD6mj7pOw77oT7tswju5l5RJ3W96CO
         KefMsvRR71qPed2cL3bJQ8hM4fz1/IEpR01NMgCdxNNTHSIIGdaLdNDpxBrEI42NT+jS
         67tw==
X-Forwarded-Encrypted: i=1; AHgh+RoxqwkugiVfaAV4WATxLVxr3veqebad4AGriLGYo7DSVsuNcEUHkqTgn4Jm955GzgR/R3ojlZUPiQAx+g5ygXoC@lists.infradead.org
X-Gm-Message-State: AFuF++kTZQ2KNrsPyCYtf0OjIJ3ipZyr6raBiRnxD6FuvOEr1Z35h8ld
	B/x/vEYV0tdQ47JfNZZkzaJOXZNxh6yKbWO10IZX6tOvANyFLC34HVcL
X-Gm-Gg: AR+sD13k71Nyf00GWuzhHCBZkBgXqoDdxDf6JzuWRucmJRBwUXw1sxO2zqdunkQhbJJ
	8lFlu0zzyQFRfqDx6hpu/Uy1JfMKgcJ91YvjfpUcXdO84onYvbi14x8f72wQKYkoENDtuzLmhq8
	fb3zVzRni6hUTgxzlRPomahrWl6+HoZ14wEP8j9EqTerWOVEJxicLZLsaXlp2WDuiEQ8t0nRo3l
	XvVPgBsyfhf+0jHrIXhRNtkpbqmb50e9CzLqhNY49K+Q5MuwzCNnGU0GAiSLlWsWBZV6xZRTf6v
	04FV/9e/u69K3q0iJrwOcc8aHCnKoRY7QpMWnyfq+GGmKgRQzvoVlKLnwuK5WUkwvQdO+YdMZdW
	p5ysT4iwt7y4NvNRcJV+SCcultJJ7C1zIBobu/5JkSPMi6kqvfImgxRHYqkC+Ov/PPvYMn8eqlx
	z9zXy2od8nCsOP2f1iyo9iA+INC9Pj+w0qoKvU2qaXIto1Xj8myevZLzX40kRHSFCvcvyY1YIgS
	A3UXk87lkhyCfYsN8dTwwiUHZEoR6toKpptq5sjyELdmA/6UNO47ZNV4D49wtjh
X-Received: by 2002:a05:6000:4b14:b0:47f:5ec2:d54 with SMTP id ffacd0b85a97d-482f799da2dmr823346f8f.5.1787853577114;
        Thu, 27 Aug 2026 10:59:37 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9945sm10272342f8f.9.2026.08.27.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:36 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v9 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:58:50 +0300
Message-ID: <20260827175850.89395-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827175850.89395-1-gvalkov@gmail.com>
References: <20260827175850.89395-1-gvalkov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105939_634915_22F125BF 
X-CRM114-Status: GOOD (  14.50  )
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

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
WRT3200ACM device-tree, which signals mwifiex that its regulatory
hint from ROM conflicts with the platform and should be ignored, so the
platform regulatory domain can be used. This does not allow the user to
change the regulatory config of any radio. It only allows phy0 to start
and operate according to its certified configuration. All radios in
WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
they are certified.

On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..2bf29981a031 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,invalid-reg-hint-in-rom;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0


