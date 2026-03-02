Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB9DE9B36A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BEL8xD6r/LZl69+xMFv9iWD7+sHUzbOpHHkJN7M+9SA=; b=ohSRsMBoX0OF7KCQv/h3NROTD1
	/uGwWReDlcBvDZumr56phB5Lvhjq9i/Co6rCGpluQ2c2NFOmPCOyiGb87dJ/oi+En1qGvEvaj6xef
	ub4qGV2dJeDqcxzQ8uye48/my4tgFLviQPEmSLb4Ju2rX5yk68moKKTMUyKUicUZUMRFTBVbTdhYj
	RMANn07KAFZdOopwVo1c0IXaxZu3mmBz+O+6ddiVegxHsz7HY3jDxriDvgliCyO/X9DRKKZZr56Bl
	7tbYCgZVuKQWkaaxlXSC4pLYmJAgKWXPlN0VkmXpHvcirE8DPi3zf+C1mSQk411PGZzlUi5JiiMnJ
	PG+sS3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Lo-0000000Co8g-132A;
	Mon, 02 Mar 2026 11:22:12 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1Ll-0000000Co5n-1qTb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:22:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-483703e4b08so37978205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 03:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1772450527; x=1773055327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEL8xD6r/LZl69+xMFv9iWD7+sHUzbOpHHkJN7M+9SA=;
        b=KEBvo1bbHmnOcPlOcPvH9gSVtEsKUn/YKECKdusgPFIyEbyxXDjUjcwdw7Q7/JjWfM
         OBDE/lknYu/lBPwTUa6quOcViiHKYQBkY7fH2AImSW8qqvH5Z0RgBcFZ/HF1zpmMKo35
         rjeZ5l+eBQOP7pvoijwLA3Ns3YC6v1qA/QsDRVxCBtOG6B2kptnXTGdglOrmwfcnwrZ2
         2x9JVx6BZCKlthH556y+48YbtrOJjy+Vs4PvqYlecXAxA5xzucu8PMIgIpDMJEfo0HAy
         xjhf3KvIcaB/EfWmKM9fdei0o22o/eAd1ZI1cCPiQFyR4C4Us7cOn0Rb57z+3OaqM5K5
         NnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772450527; x=1773055327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BEL8xD6r/LZl69+xMFv9iWD7+sHUzbOpHHkJN7M+9SA=;
        b=cjYCURU3lecGNfiNmGLlsOvyFgseTBhtftvcwhTy6zcaq4vsSjYBVqJMYefP1VgnMJ
         iZSgkadwcfe578cA2QZax2p6H5ZDKqEiBdbMuhxL7PVigGI2/cdJW9knQh5Pwx3P7YHm
         /uxSOJdKTrR2frMBa1VfAN9inTU1WOAiDaS/IQuP0HQn7r0ZtPFLaubQXc3/NSRtLgTO
         /DYw/gTJqd2gIugCHCY7VXvepJ5P3g6X3H+eFyM3Q/OAdErf+/eQ2s13X4RSTYYgPMj1
         ZTyWTS+ewWBDNcAosLTrqFujbRgboWkw1YWjoBeoB2b4YRtlhF7WmNdKpiMETlNG93/y
         FwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK/+75OZk+vtC1BPYHR3s8Lc/SC14ntXGXhoRa04Pn6kddPLguhy33BDUj/owVjdm6uV8Y/PGHtsdvCl+beLP0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmvp7kvWtb1KYKmEtRLz7A9rl6mNp957ZSqRXp5k6w1gLC9w7o
	I3w3Ym27+DQGR80SGwJbL5pHmjruF1GhV5WmwGdch+5Qakc4D8Ik9rGyudJeRzmN9yc=
X-Gm-Gg: ATEYQzykEdcuvK1NVmHKphy3sKdNzCWvwBRRufkCmDNSOIC/QHamS7RQXgII1Moo+Ht
	LlcDi+KpAXWO23Lowv7fXP5vu5nQRzgVUx0isu1H98gItHstvhEWwHozflRMMzTvcBogO3FUcRp
	oSFS6uYp/r3xRQkArMq8HIm3C/0cKiYUnHIuLZHsoG+/Kx3ZVvN7/3n93BlhZ4pU9oYkeWlwsDO
	ewmz3l82eDNv4pmRnmD55McAEYdy3JpyE5oDPRwaBMndBT5xDqop3+yZleNcntcN2KUISiA1cZI
	neIF23kHOirqZsGqijMDXDh1sLSV245ZezzECkF/iTxsul1C62ks1eoXJOTqCawya4Fjo18aKfW
	no9qVMp+LLO60mQD+jsqNwhvvOsH/XnAp140mLyJ6FVQ/89xOmD/I/hoVLlgWJ40s7PAhSdvZSN
	ejCKj3CbwpDT/ZEP5uE/pUxVPlOSMKFyKMmEBXRGvJE6/VazMXyhqSwVbKxd8c4/x9FMk/KOWkO
	gk/Z4R2le5VpLFFGyUBbHl8hGMaDZuyJJCvLWuF4pMd22Kwl2jM5Q==
X-Received: by 2002:a05:600c:1549:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483c990de68mr204131235e9.8.1772450527342;
        Mon, 02 Mar 2026 03:22:07 -0800 (PST)
Received: from fedora (cpe-109-60-83-135.zg3.cable.xnet.hr. [109.60.83.135])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfbb465bsm292493035e9.3.2026.03.02.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:22:06 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v6 3/6] arm64: dts: microchip: add LAN969x clock header file
Date: Mon,  2 Mar 2026 12:20:11 +0100
Message-ID: <20260302112153.464422-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302112153.464422-1-robert.marko@sartura.hr>
References: <20260302112153.464422-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_032209_492945_812AD37F 
X-CRM114-Status: GOOD (  11.69  )
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

LAN969x uses hardware clock indexes, so document theses in a header to make
them humanly readable.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v6:
* Pick Reviewed-by from Claudiu

Changes in v5:
* Relicense to GPL-2.0-or-later OR MIT to match DTSI

 arch/arm64/boot/dts/microchip/clk-lan9691.h | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/microchip/clk-lan9691.h

diff --git a/arch/arm64/boot/dts/microchip/clk-lan9691.h b/arch/arm64/boot/dts/microchip/clk-lan9691.h
new file mode 100644
index 000000000000..0f2d7a0f881e
--- /dev/null
+++ b/arch/arm64/boot/dts/microchip/clk-lan9691.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR MIT) */
+
+#ifndef _DTS_CLK_LAN9691_H
+#define _DTS_CLK_LAN9691_H
+
+#define GCK_ID_QSPI0		0
+#define GCK_ID_QSPI2		1
+#define GCK_ID_SDMMC0		2
+#define GCK_ID_SDMMC1		3
+#define GCK_ID_MCAN0		4
+#define GCK_ID_MCAN1		5
+#define GCK_ID_FLEXCOM0		6
+#define GCK_ID_FLEXCOM1		7
+#define GCK_ID_FLEXCOM2		8
+#define GCK_ID_FLEXCOM3		9
+#define GCK_ID_TIMER		10
+#define GCK_ID_USB_REFCLK	11
+
+/* Gate clocks */
+#define GCK_GATE_USB_DRD	12
+#define GCK_GATE_MCRAMC		13
+#define GCK_GATE_HMATRIX	14
+
+#endif
-- 
2.53.0


