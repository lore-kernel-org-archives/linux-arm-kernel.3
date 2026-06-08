Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C93CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=; b=fqwTA9VD9wWiO8gm2iqc1uWrkc
	faVnJmjSmzOXB0JhpXqoBmHFqmcgqLKbRVjUqKfrrtwGhG4thdS0owCzf2AWgGWjPO+TKBDkyGBwH
	Czpakf5KWXNSVaS0FxeRStLUrbvVaO0aczWXaNPRHtM0yINdW8Bs1XTNYX6oDrJ4ztsJJ3kBFcViJ
	ncPcm5vdNopKXUu5fdO744WFXsF3mM6zTAVWotZAZ9sFehHAyZHQ9PmNNfZj08wL0n3XzJqjUoOSk
	PtNSeDJDEWxmlTliKzw8i8ZMfjDwzcI1FkIxyHVtYC/wYiya+BTXE8qdq7/sJ3JW97gO64aI7ghJl
	r14M3MKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWva-00000003Hp3-1alQ;
	Mon, 08 Jun 2026 10:09:54 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvW-00000003Hg9-1AFH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so33358325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913388; x=1781518188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=;
        b=hkVYLuZ3zHacqO17cCBbE0J06QWmbcvAwUEAkBHZgX5CNh8hw+Zeb8wZvqvRCnxkHy
         QcjNbiL8mw0prI9vD3MN3K9/ji0mEtNW6W6EEXwt/x85T/hsTvck6UDLaLXh0W+fQ1FS
         LL6VXfXkzy6G0smxN5ZFW2vsjsXhkHsp1YMMNdq4A3akvCKDBsaQNKi6pPHrwIaGT0Fy
         4HYn7aQAUN8wZoBShr0OSQJy19o+S9JG33nj23qc1S44NdXEooC1rfJ/aXYdD6AhKNIg
         W7OOklhVlilecDE7gWn2j+dYXJhLKESCbyIiRkxEp0uXyBnFKNKP6s+ZDU4MRUfWAHtf
         Qqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913388; x=1781518188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=;
        b=Xb8BwoI3/gNWIJt5CYAnKgk1uwBZ7G5kLj8E1nWi/XG1CiuHc3rndyHpkMZ5zpevxt
         KbouY9HXD1EpzXN4Wztjfdc3iOoqOSoGZyZ5lZk1z8Izoh6lCSsCqxnxB/IIg1v003G3
         bfpU5c7qyEBxYK0FDb/pbix2A6iiSIY+b1jm+jHguuZp8LFqfYt9WsBu0oQ4G2bqgrcE
         2khmg1GSTMFCBdQgsamF0eGcOyLeCtRCE80H7sdNN5rK7UcmMKUNSxH1tR3v9J+S5Wwd
         E9ThFzU3pLgKUqBLLr5U1oE2RCqlS85r8VWmufaAPRWtmss2rNVGaiLfzFOAQDYQAJW/
         EOsA==
X-Forwarded-Encrypted: i=1; AFNElJ/U1uflUkvOzIqNXlG/57x7/0W6KAMR64Ka8kM/YtZ0GulVbKDIWweLDphXLm0lcy+mqyInV5g+iVmfLd4s8Qbq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy72us2KIUsZuZJqLyeeCzWD6zBOd7LFUdMVJDwr7NNI5VT2lbF
	QxEcXa0l3HfYXIMU/bWSiS8MMnVqZ+nDOPGNcL7lvwkBCqzOSE8c07Ly
X-Gm-Gg: Acq92OGhKlnX5iDespQF/iJoZceH5GKciKJNQK7oGUt4b8kkDBvy1EBTaFP9bGYHC2M
	eHjado4tVX+UPKK0MKl5tV9CGXzulbtjFfXsiiCStXKl4s8i4ZJsGrEOq1otkl//SSCiiKYlKuf
	CnI+Tv4zWzPHb9kWxO9NMFjdlLrNz+BkIA64NBl5A1w6ztRignRQ0dJkGMW8cHA28wZQlFrMvNi
	XEdc0ZOLZOFfBL+n3wzNRa8R9nlLZM3YlLbwmQ7gQVF57tFPpIyYeZK6HmGmlbnwEd3kjwcR1LM
	l3UkEm1pJMbPw497R+7iauqtGeJPJDPY5qH4XZOh9Toq49w+/xQFeeZ2HBGcCfmw/TFfby/hQTp
	l6HQaseGkGmY+iKFeMxQ8z6VoaknpCYBB+dDR1nvL2CDgNfg9CBxMgAHeYjOw0l/o2YMjVf1BK7
	h4tNlRK4NzrRn8qZJ5pPf3DCKcTem8IpSGPNZH3Af+d/TcTRtpWfOYwsN/Z+yg6O0uA7NzPH0Sl
	LEgeC+0cPRp8N6i+5Yw1pRUpeXoWBhCEIVzEsKDYej6zqRy
X-Received: by 2002:a05:600c:6096:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490c25ba56cmr246682905e9.8.1780913388321;
        Mon, 08 Jun 2026 03:09:48 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
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
Subject: [PATCH v4 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Mon,  8 Jun 2026 12:09:28 +0200
Message-ID: <46a145f964514cf82e340cb0acc38d4bc310d4d9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030950_363551_5C35AB53 
X-CRM114-Status: GOOD (  11.39  )
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index c7073fcb679e..4f1d61c55ffb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
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


