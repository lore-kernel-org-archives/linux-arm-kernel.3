Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29CBCD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=; b=JOpWwrow6lNRca4nC8IpS5Jy2g
	rdpBhSLoK5QSGDXs1EXzOTyAW933xv0nOvqGrAoVA8VKezfzEjMWVqRkptX0aykH46vd0vcK6Ioz+
	Gl8NqCf+u0je5ffDGXc3ynXyD+yMp5MoGK/Kcxz10NByEHIVZWMScQb3O74bd3qFm9iasyu8pgpRw
	iyjnSQQ0T3dbl7u4rTXpASjPigAORtf1Zi9YPwD+SeMNqn5rtmatelHgzq9BM4QOOjsxbkDt0k5uC
	BwCymaYim3UuhYsci2gCGuzn0Cv+WD71KAz69THRe0lgrHeduxGfvZf9th8LSqQKGg8WFKPJT/r3/
	4SQ4ijuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguc-0000000Eag8-2SgW;
	Wed, 03 Jun 2026 08:25:18 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUguX-0000000Eac3-3lD0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:25:15 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b915ded5so2518305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780475111; x=1781079911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=;
        b=BLuugcpo2ETC1Lpy5GPrPQ/q5oYv3Cok97F6w98P7QOgz0C60HSMEB09RMDIBJ07Xz
         uVe6ZSK2nGDG/n3e8Rq8OA+AqJdUj248BLHDiEjm85MsnIY0eouMGL+OnsqH0IXP2Q9F
         JSkxKoegi2e9ZqKYKAU9W7g4QTGvStbyRlziPjF5sDkI8ubG9e/CLdRhQwRS25M82ebC
         o8rrK1QvN0QMl+0GpZMcX/5AMb8Zb4e8fzLd9rFLiTmM21Snt8tsFTkUhCP+YQ1wLLAL
         xcueoRWcsPhHeuVcpJsN6swCQPYVO4rwQV+sc7RBwvPhJQoX1jTQyoLSsC2pxdgBBBAL
         sqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475111; x=1781079911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qcGkW0H9irEIxVXfdMp6cTeDl8+VAERT3UWa1me3dnI=;
        b=R2Yk7qweAUBpaiZFmy306Vawy2UjttvW8QHr0u3KmtD7UTxpt3eFfJQei6gQ2tiNlr
         slc79oahU+eZxRHf6IRqfcaMZiySpEbUFzUXXxRSujcwiIyRnvuyJUt/ihk4LWxsej/p
         Hb+WS9Gu4wWCW4tVSrBld53Eoe2nMduM3TFncaXL3LlzJSBJRDxOtY5CHDi+6vRmTjcm
         7Viinr8mNZSIxOjiRXBNOjiRLfDjiRgrTg+uRyKzKstTCcL39NZ8v50no93up/Bh8CuI
         fkXaLlwGzvzpB7+W2pUzQRDZdGtTvdzZKy9UF9RYq7z8/SUwyxk+L5KfuV0pM3YfYec0
         Xd3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/C1LSr8O25cZ0hUFi8uvG2xv9QTOeEa9jk+9H+o6Bo5Ag24l+GcHvqZplW3O3/zbef8uObZx07x/pdnkQ/fQfW@lists.infradead.org
X-Gm-Message-State: AOJu0YySifLIAQSRZpgOwXiAc+1QxJbgM7nSeGQN/OdZYJIfdVRmvsVQ
	6qm/8DLv9hb2nGZAulNBtPIGaMUpEeNgXORxuuQy9E4cl+vvqve+Ch3j
X-Gm-Gg: Acq92OEoKdbRhXw6CnSHM2pvsGq13LlKjIovqHG4taRjFUgSIqI7fi6uSwkfjyLKWDj
	WFz3HwjPy7cLF3oOSTppjSuV78aFY6sEKZuctafT/I4y5OPzBHUUQ8RkZqPYolbA9CPT2j686+q
	wPvSzXv/MocjgdxfFVwRx+uAMPKWdZYzBEGjF98iak8BTuz2+EDaFZzEd4hkLUDR8tY103XxKBG
	VmqGTF8K85fU8vwcLu4RoJ2jdAqz7UCDNale90CGtoMXkll0avDL6BDM6xjCfQc4BGvkIpF8zwJ
	NCXubQ0/KPgBuBAIFTqMOef3AsI3YlZUj6yIdP8rzkqH40HUkdQOIqnbMmnGN9PcsQoZIP/6Md5
	SkBCB6vg8srmfaP5niLuubwS0kA0C2zH4YwklTSZjX1QDCm37fg68PRJ73Ou2/Iy2aIdThZuLDG
	5GCN/QQrGkOnfSWO4PnWuQHEfwBcoFRqPkUD2BTVPVtIyc61rTcDlqIFPCscIX34n0BumK1402i
	tgyq1YJ7hPXYJDp89AQ2j+1XLIBewAklNfUAvcs8ixqmN4w
X-Received: by 2002:a05:600c:8184:b0:490:688b:f10d with SMTP id 5b1f17b1804b1-490b5eb64c9mr31845095e9.7.1780475111459;
        Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm33175305e9.11.2026.06.03.01.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 01:25:11 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 5/5] arm64: dts: imx93-var-som-symphony: enable ADC
Date: Wed,  3 Jun 2026 10:25:04 +0200
Message-ID: <fe924e4d6f7371d21eb9c2414daa7448396803cc.1780474803.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_012513_973927_A87AE9FE 
X-CRM114-Status: GOOD (  11.05  )
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

Enable ADC1 on the Symphony carrier board and describe its 1.8 V
reference supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Add ADC1 support

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 56f8744c861a..409c7e74ffe3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -159,6 +159,11 @@ led-0 {
 	};
 };
 
+&adc1 {
+	vref-supply = <&reg_vref_1v8>;
+	status = "okay";
+};
+
 /* Use external instead of internal RTC*/
 &bbnsm_rtc {
 	status = "disabled";
-- 
2.47.3


