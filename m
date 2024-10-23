Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAAACFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=; b=TRxq8kd+qj6azL1sDxGrBIpwqp
	WP+K/eb3/W+2suqu/pj2BHfAmjHkDA8XFrmjkf0mxCtZGHGugCLovT7vyaGqANNohIeUCOiidKkg9
	qEY/BwbVPJXjGUqEfvaZe9phKk6gd3sHJiBWwxiYXyIclzmO+0ykKJNHy5QcrAaBoR704sMiN/DGP
	0FnXLpyCNf9Fib20FS3ZrkYqGsY+OTSAoyEV1ALZmTmuOL7f3LXJZ7lkskkKm/1ll2cOaSIaV6Ljy
	iKqajbysYWazFENfgCOwyRMd7kGRSsMH1orb+SEgm1EJGlUn9Xb16/ORjEeAcexqjc1GahFhVkBJ0
	jPZl2srA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsX-0000000Fdmm-21kO;
	Wed, 23 Oct 2024 19:18:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZU-0000000FDiN-3jh3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so61821265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702255; x=1730307055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=;
        b=e26Buo0WLZIyQps7yEUgaLJ0rpulQ0ylGxtnDjvq2oQPVk5F5ju53RciLeoNOR/Ats
         HZYqF6RN9xwwOj/3gh5M3rPGP2fsxcvJ75Bln8b0u9CzvvF806XVDyRv1rv9eVAFkqnb
         xj/o/n7CS6+YiIGqzad92EDojUATEOhDQmdCKPvxyj7Q5d31JHgl97v/fxMepzQbsCkV
         XzdoCdD3KGSIHqadDwtz8Qho7Tw17Tv0W7Y0Y18zyv8iuAoAl51oDqj8zSMp/hqAHbcD
         3rNa8dewcFzX/puceOVPiSqbAinX4AqrokfL+xJRi7uM4oHeR0TE/53TU/10cuGWD6LL
         lt6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702255; x=1730307055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=;
        b=s1w53E17j60Z14C4wuGAhlk0cAKsbfmYnqGf4NeTAgX7u+dFlb7Pntr8SheKT6yXfC
         cv2PPGoq1sSbkJXeth6hpnOTn2VAQGprii8I1OY1ScS1F5sb+l+uszIHgIQoLClyRJAG
         OBf629yRznnlRBKZuFjk+z04YB2BUtzsqehBc++XrdxI941dLMS2GZDup7TaOuPb09/3
         Jx5Mium620Mo5FsBnNVuNsFX9Or8vB8/wNdBJ+Fl3MEGTRCxBr27L7nzFjhDmxBregKQ
         33y1VXENIK5PcPp7DBJMTAVd7FHUSlEI0OVQ9ur+IVCc9c7YdxuYnyjc5bXF/H+se58d
         1egQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaoqyV0TIivU17zmtm8haUqJ58dyLZSjRw05Xjd7V7eN0oW4vArZ5bv6a7O6DdY5nA7dAEuxYoDWtrz6MH3OhC@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt99PtdoiytKrvCx69tXsR/oJ9ivumfprWu7y/65hHVAGV8c5S
	0uu5m7OxDgiRlqQJDaxtC7MraiuMg3wJqJCNXpVfd7TMMkTDBddph2k7iC3rnR0=
X-Google-Smtp-Source: AGHT+IFBguMU8OEAESQDL/dSrL8fzEBB5IpCHLayBxdUcUsJXhruVCscX1KffjfpU7lvEVL73DyGQA==
X-Received: by 2002:a05:600c:3b1b:b0:431:594b:8e2b with SMTP id 5b1f17b1804b1-4318413ee73mr31043765e9.12.1729702255516;
        Wed, 23 Oct 2024 09:50:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:32 +0100
Subject: [PATCH 35/37] arm64: dts: broadcom: Add firmware clocks and power
 nodes to Pi5 DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-35-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095057_044053_EA945BE8 
X-CRM114-Status: GOOD (  12.14  )
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

BCM2712 still uses the firmware clocks and power drivers, so add
them to the base device tree.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 28 ++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2bdbb6780242..92a2ada037f3 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -62,3 +62,31 @@ &sdio1 {
 	sd-uhs-ddr50;
 	sd-uhs-sdr104;
 };
+
+&soc {
+	firmware: firmware {
+		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		mboxes = <&mailbox>;
+		dma-ranges;
+
+		firmware_clocks: clocks {
+			compatible = "raspberrypi,firmware-clocks";
+			#clock-cells = <1>;
+		};
+
+		reset: reset {
+			compatible = "raspberrypi,firmware-reset";
+			#reset-cells = <1>;
+		};
+	};
+
+	power: power {
+		compatible = "raspberrypi,bcm2835-power";
+		firmware = <&firmware>;
+		#power-domain-cells = <1>;
+	};
+
+};

-- 
2.34.1


