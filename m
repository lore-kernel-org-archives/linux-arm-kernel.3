Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F83D149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=; b=lEx01JAD539TYsRk69kvOkY+ze
	p56RRSOSus/AKAueWmk7IPa1JQeFdTa7+M5Tah9oGMksnlisSXXqNkP+Ih8ld6u3qoJo9B0wCByii
	i2U07fT4Z8cWI2VKCI0NCALGJ2HFVDojpQKHSw9DpIBLBw2GNt/Oe/5q35m6MMsc6OCEWl6ri50U+
	6InbSHs6K2ZytD9vFGFti+Dj4s5nfenNzZzj8H0kUL4+ECDxR6bv+pOPFkWFAJUJ+oNMFQsv87wAX
	QUmIN9LjsnHAz81E7r5FLtDhbZz/CEbU48Ukh5yeX2SlcNWLFt2siS9Vj8mntymON4ugrjnPvhrCs
	dQJMaVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oce-00000004i8f-2ood;
	Fri, 25 Oct 2024 18:01:16 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvP-00000004Y5x-2tYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:37 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539f7606199so2897933e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876594; x=1730481394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=;
        b=S5Kapmd45xEQXjO4G+C1r+yBr7JRQkWtv5LJwFoTyjQt0RCmM/vYa6qqNOdWsg2GVD
         fP7ifIC5uq6wcEtG41ipU3jitEDi2G18TVKQMgUforeL0s+3wXK2lN3ZJOpigw7k7eAv
         zjI7pagnxWGNUlBYmKWtBKXaVIxE5Egj8+4x9UOdeRfSSbF38YZB0lC1BB+hQnhUXF53
         BmsPqk9YYTOEORtVQRdNY4qeDpRYWEXB5vTT2cBJk0OeWdVGL0XMA4QFmpikZEbasKFy
         /iSNHpzzdKXORJP+096HnxyCFIwJDUz02EVgL8wgBTIV9oO9BzlfLtlQbDHVlbShklXU
         PHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876594; x=1730481394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6ynqPw+aFyVqyQgEAy8+ChgZ/7ftlVoUYbZGJVl5Fw=;
        b=qojuINq2TzCGUGooVlAM+jJI6uTb4N6y2wJ6exkLN+XcZGMyqCxlTltPlH7tifkn5b
         sgsXVd4E6GP/2To0BkwDSiHjXn+mMicw5CINrS2IqdWRn7Xa820/wF9aM9uQKhHDNC53
         GUC7I6XpjKymsjxw255lgIHSY2DLK3hO61rywoOJLKhr44D9q44FnEfg1GtvElxP3o4g
         arhkq1lTkHH0wkniBOxZ7LssZjePUa2F9Em6IScuvh9/bue+L/Y9gAuVbufpOAAxgY9i
         eQBM+XBF2wf1cLEzC/8qsWZb26+smAaWSJiYDx0u0GvN3/oxehnB2S5cBEuH86/eHmaY
         3MWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcf/e06tZIY3ZQDCWUooLaVgsIlVsv1FlZLpkRmwzvP6fmiLQhzjGOwMhD6tyCM8T0ZIzYLwUBZCybA4TFZVIM@lists.infradead.org
X-Gm-Message-State: AOJu0YyTEtc2u3h18Y4Uh6di9VSAhGGt79kTf69DKhuHLRwik3uWQJGt
	lNYuqDP/od/4cYbuM2Rqn3KjTvyYhJwM1sMv0Q1fvzKA2hibVpi6auqsUMtlU/w=
X-Google-Smtp-Source: AGHT+IHK/c1INay68uUhSO5TRsMi7vzJxRxlcdjPaei9dfk9EKPm8CK9FYYjgLp5rLJi/EGzMMN1vQ==
X-Received: by 2002:a05:6512:398a:b0:539:f2f6:c70f with SMTP id 2adb3069b0e04-53b1a2fed80mr5844694e87.8.1729876594028;
        Fri, 25 Oct 2024 10:16:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:33 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:05 +0100
Subject: [PATCH v2 34/36] arm64: dts: broadcom: Add firmware clocks and
 power nodes to Pi5 DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-34-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101635_795059_C446DE1D 
X-CRM114-Status: GOOD (  12.11  )
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


