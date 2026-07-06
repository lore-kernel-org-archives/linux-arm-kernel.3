Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD9EC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=; b=Pd1g4+OL4la2mSIn6KgK8lij7i
	5Y1exbQQJ2CB/xZhCqRe0dxKSyq7uTSEmGPrghnTEvxxggc/GhwEKK4sCmzw7ClycQM0H5eDVOnge
	jjUywAnGquia6CvCpyOdshi4+uHeGpZYNDQsYYlZ6JI7KTwc1vNU95YHeZd28KcgD8XXWTAkakN1s
	0XZ2nDgar0eIpC+cQN/NFDI6IPr9wXehvXvdBZQk7/8tIWOeAsGFFuSUK2x/adf1ehN/5bqmF9p8H
	Uqr8YB4WJyEjdw65GOe4BOHzRTPVI21gq9UskBd6usZJk74LQehcup2klFN768rlNt6dFnmOpjyR/
	Y8rvaecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjl-0000000C3tK-34p0;
	Mon, 06 Jul 2026 09:35:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjH-0000000C3Ib-3fXO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:09 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493bab44440so14491185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330506; x=1783935306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=;
        b=SSq8sQJiONODNq33e3yvDXyyb2nnIJWZdbkPm95RGHZl7TdE5xSb/1awW6CbkSz6UA
         F10GZRBOP7eIdBoSir4Y62gXKc3eNAzzQZRrEx2p9OQrZANJRxOW02exFUFPptM1ewOU
         0qTSot4R0TK5bGWXJoHWijBfxPOjhrZJ+GZaRWTyBHDVFiDTe3JWYr6SElwaCW7N2aj3
         iqTf9c0k2BnIZAFvq6d2JLjVfZ05/jKcFcVyIZ9GpRYJeoNSkxRMxp9DFORQtMDdGPeU
         N3s7r0mOCybjQ0j8GF9Wh7ALItULeJX4zmOOaP5V2DJiCx5xHPXZxfEEuh307iH4SpKw
         6byQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330506; x=1783935306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0XwcD1YM4S5mxZpb6HPRyUkQ1D1PQTfgU3TqWz44TsM=;
        b=BV+09vTTFsJCzcZTDZw6Mk010ex6YsUkSqSeWaeOgICE3btZF3yo+l7SHYCZaFuCjs
         p+tIdzVbnR2y63TfOX/x7LEjucaaPRLHaRe9iH5TqBGlYMcPi7LgxOjCK84qb/9TnJtw
         EcK/yhkhIxZAsic2ojuYAlGBDbkW1Q4awnbWAINaSC46p4uKw+lGrmlIFfv6XpHGf6x/
         tX9ueFwaO+g3hRgaX9FjQfEXf5dGyQXqhJfRYEMZyFH42QeEMlamGYTK+Wz2u4p5REkJ
         4AcP7csOH7nqY6NElBlZUgm1PrI4nPNTaNhRpcaxGDmjhn3rrOo8NytH0J9WRkn+oTua
         SxBw==
X-Forwarded-Encrypted: i=1; AHgh+RqvrGW0bjdG4tCKIIPxd6xJ8zuwncC9859IPqu3L/Z6b+s1BQtYdAwjX6+Hr/ybtAdcotia17nzwymRdHaOPOu/@lists.infradead.org
X-Gm-Message-State: AOJu0YweAzVW+gk6OlbfzB4OXvZAb9CFcmSzb8KZV3uEv9tKebv0cSWH
	cU4WpWxLHJt8PCEfHhfGQfopZUWpXRyEDxRP9UV9B7+zHkQIOATL0h/+
X-Gm-Gg: AfdE7cnmd61MIvOFrhozg42Xq4rxN/cClA925U5jilnXQ8L44Cs11qGsXS2PPDptlsy
	425Tur7XcNQwPYBb7sxivpSMtC08fek5Vgvrm8gElE8JHV1ql0yynjf3dH5o5ygf4LjMXI5hVHn
	f7CxL9Qkon2wOxp/p9JMcR6IEXgDFieZxU8AvUUQ+39C83Hts4GPVX/6gxdL5QMv+rcXpDRGPa2
	171oqAQGHw9Y9vgBUaWh/YfRDcd8i1l8oHGCurPTicfMHbP+f4zwpd41TQHknuHJkW9ldYQly1u
	YHAiZgD1e5s5QOD0daUJVsiwi9ZSYF//Q8qABjyzHcdCrDI50WiZFHBMVHLx5VJU4CIXPN54LT6
	SZTAtIsJEDJTgTMPWD1zSjjRrkzRrXI4kEUDLaer4n9RI3dsK+n04Zdj0XR0EklUTcClkxdEi6i
	r/hb/zxUb3xA+GzFPvztYuSetjvX/Uv8dgsjXfbWoM4f+YycT2jlhQdkZlbLh0cUy4xgEOzSOB2
	Exs79UcTcjhz813tJmzz6OtbQ==
X-Received: by 2002:a05:600c:37c3:b0:493:d3c5:6c32 with SMTP id 5b1f17b1804b1-493d4b50573mr74590875e9.6.1783330505673;
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
Date: Mon,  6 Jul 2026 11:34:43 +0200
Message-ID: <0b02e984925f48a2b22f46e21d7e237fa9558679.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023508_028380_47BFC3EE 
X-CRM114-Status: GOOD (  11.30  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index c98dca8e7889..ddd4651b35d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3


