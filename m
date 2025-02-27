Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FD0C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO53KeG1WPUYrsia7l0Tb9ExCzbXGMl2yOXGdu7Dqdk=; b=dg5b52RM8a4xvipQhKVPpqfL4Z
	PNrJpoWKXqOp85m7s62fxgFSIGuEWoDNgfiaaAwbq0YooyVK6c5uJ8draFDFARwoiYKEWVy4r7ZVp
	lopKLxqxdIuBWEkH6LhvG9gjIzMxgYGym5GDWhU3Qbnczl1BTH5Hd9fZ1JBVG8pOnba86kT5bOQ57
	d0PKeYMDZGcs593LvK0GpExGIZ0TvJucQRToy0YYIWB6Fc9RkbdNfowLme6rKOoy8NX9u/QsbRkwR
	HrmU458tkBL328Vg7Jl2DgK19IA3H9HVhYytA87wYvwtXQusmP6/kCzth812rERbWoxXi70uYXucG
	Xm5fwMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjkV-00000008aA0-3m4M;
	Thu, 27 Feb 2025 19:40:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnhKv-00000008AhJ-38kd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 17:06:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-390d98ae34dso945220f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740675972; x=1741280772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gO53KeG1WPUYrsia7l0Tb9ExCzbXGMl2yOXGdu7Dqdk=;
        b=j30cLhCvSc5Of0+NkE3kHgjVgMwoGBqlR9f0FZqIcyfubfplOuN0roZQsvBj/RatnF
         MWXiulMc4HiChO5xUeCyCqEYnI6c0qDyM1DqaxiF8YeUTqs7TCTeij2Ve+hW1oj4OiK6
         B4S3Vn5Z/lXyiVNAYq8XsBVjpgfcAp9qWQJpSrnKeAlS7/niJCqqJ92ms8AWCpv6OYZd
         qglBs5OispbFdkkQtCRMcua9Ljt5ByZxcBHrsR3g7xOQeenIBxxwvSxcs7Y6trdIFz60
         iCqeg1I6hSW65JhZMkpwBdfevNTGgsxAmemcprRcEXerGpX1ouhPWqqg47zZryLQZ5z/
         7yTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740675972; x=1741280772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gO53KeG1WPUYrsia7l0Tb9ExCzbXGMl2yOXGdu7Dqdk=;
        b=Av0WPkCuItM+14sOZBbJsuu3dgb8QBMX63HwrAv4ZvZHq7Owkj2qtPD4L3i6cXR4fr
         7dKyIVW3pBIsvabGe45Ge0mfxqUfYfaQRGGTIhz85elht3vk5RkUSLzGZGCc6EgFsF9w
         R+wG7ccQx9d+sQ+0D4fz0RaSy0SPKR4Hnq4mz6/r7c+vezpdfPj+g24jNHRfSB9I7Hbi
         hUukYbpHAPN0YMRBpNol6AI4opcYrO8489KfX8K2WFtRqZddT4a6jqUdnd9GWX7Qpq11
         dn21uNO+02x0I5PRCw98lkK6/zr1dPDaCXGBC/SmyE1uMF+dudZ1gtXhuxEPsNflGRP0
         BDLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9LkcWbOYWLEIH94VSDh7EoMKmJ0JzGB1lf8t+cU1ovcogo0D+bAO3MGbYalncsDFNP8D/Y6WWAXzNJ7EarG3B@lists.infradead.org
X-Gm-Message-State: AOJu0YwNodX0MQzNwBxnMhdU5OQLXc2/RYQtjZxj5D4zp/YNfNas/94a
	ZZh9WRKNihfJysgyHsSt0IEUbEBbyhi0Ew307L/ujbptRFHt1NEU/dNi5HdK
X-Gm-Gg: ASbGncvk0T0vkT8zJWsKJexD29tKlOW041MXQcCttthpJsxZbD8jRl3eE3borU0DAB4
	f/np0QCWmrPCSZId6Dh2nWirAzaQtfZyxov1am8g0eT4F4sYPs7xUQ3+4s36Fag1rjq6l3AUkI0
	Q4H5I2lviUt6mHk9HQD73WO8akj+xPpVBUMhSaHxSwhmikrWWL4dW2CSFuuIoiMY44hNXA6jqvp
	TEzWBIy9mWs6HAnonLZ9iOJpAWdJLAtxz5CjP9ZrPicuJj/uMVeI+CIaUHMMkNDaVb07Ff8Iwr2
	2EOW6J6eisQx8TKVDaUTP7FFGzSQ3KqYc8/VAHSlK+yWASEI6/lO9wYXpMwQbZWTqfFAIwKO/8l
	iRW4z
X-Google-Smtp-Source: AGHT+IERDIu0iZ+hBFIiIkbbbpaVVGZ6G37IX9OWfYQr1SknQHLsuZbyaI8TcO5g3Sxx15wY0R6sRw==
X-Received: by 2002:a5d:47c4:0:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-390e311acb3mr3600237f8f.5.1740675971592;
        Thu, 27 Feb 2025 09:06:11 -0800 (PST)
Received: from ernest.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485dbe7sm2613138f8f.93.2025.02.27.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:06:11 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
Date: Thu, 27 Feb 2025 18:04:52 +0100
Message-ID: <20250227170556.589668-2-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
References: <20250227170556.589668-1-ernest.vanhoecke@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_090613_790700_840197D6 
X-CRM114-Status: GOOD (  11.70  )
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

Enable the STMPE811 touchscreen in the SOM dtsi files. The STMPE811 is
part of the SOM. It's self contained within it, therefore, disabling it
is not the correct default behavior.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi  | 1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index dffab5aa8b9c..23913f18586c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -664,7 +664,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
index 9f33419c260b..9a9f9764dc65 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi
@@ -588,7 +588,6 @@ stmpe_ts: stmpe_touchscreen {
 			st,settling = <3>;
 			/* 5 ms touch detect interrupt delay */
 			st,touch-det-delay = <5>;
-			status = "disabled";
 		};
 
 		stmpe_adc: stmpe_adc {
-- 
2.43.0


