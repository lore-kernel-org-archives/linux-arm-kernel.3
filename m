Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40146C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5FfmuyODRKtH+CNEYfoGxU1JBfNxadHgUzuk0z3tnM=; b=GH4M0A7LUY3wL8S/8l6+aRX+LW
	6eR+Etbg8/61Q7rZiQW+b5WHjvG0dRZnUeuomrHPrWf7IlGfO+do0HSdIzZVuH5WE6WM+Hg97hG34
	9WBg58ScGqPRY66wmAM+hQ9BqDTBi8M9CrkcGl1zdVkNrGKQBNrU2v2Dp83CIQ0EkpMj1fUDU526W
	ywUMCTLDLNvXfUQbCYmNNgs5Lpy5qQjs1BmDZ09RwoW2CnNm7fuATosS5kljNtMHd7jEFI9XynhGz
	z5brs4Yq0Z1Eutrq7lioRtFOMp3x2YZBSBRNyIPMBl1ZUutEnlqhBouAW1lcRdlDCfdMwteejDJx0
	MQvCuUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUyE-00000003vqT-1Dkq;
	Thu, 31 Jul 2025 15:13:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTr8-00000003liy-493W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 14:02:04 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3b78bca0890so698289f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970521; x=1754575321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5FfmuyODRKtH+CNEYfoGxU1JBfNxadHgUzuk0z3tnM=;
        b=v7Modq32KEzpDHkvKirqbrJcWasD4lgcttNZE9k6xxruARmd7d91rofau1zh4Cbsl4
         cQ9fD+l0ZBYJS/UvCn1YEJ85mdVQ6Adq71E8iEEvLrBiaK0ZxeMajQqmXnpHwfnkq5Dh
         Ec5RFjUqFweMH/nbPLBh5fJmi/88bkz02t0PaiavC+CeXWeApRI6ERJDTQ7i9qQD+Aje
         ThMhyABpoOuIf1Mtxn2+PKOHJU6zN5juwKqJOtZ3FrV4J2Iuu37c5u2xKEQN9Jzz6ZGX
         IIUMjp0Uq735/+Ojz8W5TYkxEO8iPH0WfnaSZrp6LBWp18sHi+uy76RfFGerPS06YmfH
         fnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970521; x=1754575321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5FfmuyODRKtH+CNEYfoGxU1JBfNxadHgUzuk0z3tnM=;
        b=T/ed7bM50FuP/cir6YyXdFGW+oFZp3sD8vFQfiJwIDyJjqjzrb1BgORNPKarrCv3ql
         hbnO+XHEuCAj9FDDtmHg7EQteFJAyP0GSMNRdYgHBkctO+KWSHJHZwU7YM/RAHvGL3Ld
         dP08W/egnRD5ImO8mlv6jAkLaa6u22oexkNM2g2BHj0gYk1CEMub3O47QQFhroaE5Pkq
         7p6HDsM7LmC9V7g7Sg/wcvBPtNHtxlII3TkRF4MRJwUJge+uH2kWhn+fjKsNl53Q3Wra
         0XwtGuffZfdPX+qhe7YyDdAHGX+xva8/j2rppOc8QF7HktWi6UiXzPowLb4v7kTBmkOS
         aybg==
X-Forwarded-Encrypted: i=1; AJvYcCX2H9Sh/RrKieUDcU3+QBD3BsNUSGZkTYUJkAUEktPI7AATf5R8OZ9twMhGlRM4HAsIuaaGnKf1tMCCbJM5yHVN@lists.infradead.org
X-Gm-Message-State: AOJu0YxIHPuh4qJF1PM1T5gDfJ99P9KXXcsfoooIrLUYGMXk/xFuyEq0
	6LLQhMxTE4BkWNjwC/Ois4xzn5Q3G4bCUc/XK+fG6rmKTbTMLp9SwwiTEqn/b6HQD6A=
X-Gm-Gg: ASbGncvuD4VvLs5CyP5oGhZ7PFRTY0Kc6MgVOHW7/8VKcLIDMwB3t97IAinDzm7Rnag
	mU1A3DKqsifHfJi9+kVLjGi4BumVGVaGhVXC8Cq8GflBbEQnEx0w4AGvhwkxzT0WfjT1FL7YASC
	igFoJx7FU6DLA1EDJfAGeD5tuB51qie9YbQ1Hq6bQUWKdS/KP89L2H2GQFL7YiY2sMRL2JvvHNb
	IPAfrzTWJbCClSRSdXW48H2E/lw7Ve1PdrHOn1c30EvaWHTBYzHKOIrQTo08t/cmatQCMaTZsH0
	I1m6OlD6nE1dCcsySNRwOXI7HeBOV/QPZ74sL2Efy5199efo/xf9wIftoDndr02LG7MZfxqXJgo
	NDykvKkohD08fa1HW+RV7NWa+llyiZjoroh6A3236p/0/QZ10
X-Google-Smtp-Source: AGHT+IFSB2g77P+JOGuXRChMmlAYoDUnakc0mUqILF6lDO5fOlHpcKD5KjoKBSFMkHDfsG7jcpdOQQ==
X-Received: by 2002:a05:6000:240e:b0:3a5:1cc5:aa6f with SMTP id ffacd0b85a97d-3b794fe9320mr5813370f8f.34.1753970521109;
        Thu, 31 Jul 2025 07:02:01 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:02:00 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 4/8] arm64: dts: s32g399a-rdb3: Enable the STM timers
Date: Thu, 31 Jul 2025 16:01:37 +0200
Message-ID: <20250731140146.62960-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_070203_025273_A5ADD192 
X-CRM114-Status: GOOD (  12.64  )
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

The platform has 8 CPUs, and the Linux STM timer driver is
instantiated per CPU.  Enable 8 STM timers that can be used as
replacements for the ARM architected timers.  The remaining STM timers
are not useful to the Linux kernel and provide no benefit, so they are
left disabled.

Enable STM0 to STM6 and STM8 on the s32g399a-rdb3 platform.

STM7 is skipped, as it differs slightly from the others and requires
an additional property to be properly handled by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 .../boot/dts/freescale/s32g399a-rdb3.dts      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 802f543cae4a..467e0c105c3f 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -40,6 +40,38 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
+&stm4 {
+	status = "okay";
+};
+
+&stm5 {
+	status = "okay";
+};
+
+&stm6 {
+	status = "okay";
+};
+
+&stm8 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0


