Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C78CD8CAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=; b=u7/8+2dlegvsQV6m4eXncm54Jp
	qNXzg1ItfMiFYIQR/h4AvSBt1NgnTlVMCch4nVS3snV+Hes+citlcMEhx7R53ae/3ApgCw6HGAwdd
	D1TrE9yEWZQEo9qZXngfb+lh8TLKyPeJQST6OKifvfFe5fNgaWKTNXRJ/Foho+gUmbfu2WwV5wUor
	HrxmBOoN5PkAC1WFSXp6kp78ODCiW3v197isCTWToiqoPzWeNnipABy8CZojZfa837j2DftZvMais
	xH/WjWioiApZOB0EhemqwXjwJHB7bFuSCk/MvAiDDpw/ahljHSMElnnGBqrknQ0ZjQuTWMgqL0vpk
	+aywj81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAf-00000003oQK-1t3n;
	Mon, 08 Jun 2026 14:41:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAV-00000003oBR-19xt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b613a17bso43270945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929694; x=1781534494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=;
        b=J6ot6k20THKjSb58dY826xqXmRfshy/5jQ4H7MhY9DEq/1Xv2jWHXt9MO+PtBRV3xi
         f77+5sSBXXYHR/7FlvAK8W1zQ+kz0HkC9lwgh0rSfGThjuriN5YDMyD+Eg5PPkP7JaER
         NOZUEaVUmtwSblHYxA1sLsgdjJLCRAvGwPTqpvQX3FFZBEhMTUPRbDHxkYKGmr5Coc5c
         joGiPd4lRk66Y72RS7pGjtD64TEl/CwoPZ+65voMFQYxqT2rq2/BgDLWH7brY/PICFg4
         V5qCBu9TsvETtNCNThZtQj+MNSBwBMs8FZRVH3G6zdNIUgzngX1SNZAJD+p90l7SPPFU
         w/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929694; x=1781534494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWodKsfn0KNX/FzHIFLdEyI4kUZh+cmTaV880QtbWJQ=;
        b=MXF1/drdfs2SC7X0R+Y3/GljpOGlvbRT1SJw94gsOedJcky9nKDvwjxCuALr2APeVq
         pbBSI+JFoMZIZ7pv9Qe95u9k7RGgTioJWBFV4OtYmqxEsaMwHmitOWLu7bLiyylIUXca
         HwHSX4Vha3X2SPQZYFMUsxEPzue/36eGmVRuuT79ynZZMRlQgDb3aVC47YhfTgdGWG6S
         m6JEfUheZ4PAkNnu3nN56bazsQu25uKff+HUMqBjAr0owe1Muj2pjTz71zfjTu2IDSaZ
         Z9RHVdFZMQNA61IMNksXSnPu4tDCChznPOrIaUEQlOR9nW5Sbaw9ruOPtAzQnJtAWcG3
         WjJw==
X-Forwarded-Encrypted: i=1; AFNElJ/e8uy7JoMfP0GjDbp3ZvA+Hf120NWs62yxnINCz0Dw3JrwdYuAe4+zSl0rRW8Ea0mBjh1/d8+noK/VfwAqv0xz@lists.infradead.org
X-Gm-Message-State: AOJu0YwVkwd7jsg7420BfKt2z76JkFHGOH5Msu2aw9yaGjx+14Odr93w
	NCZ+FBqGSls0CEZfCpl91Scmq4kQelUlYKS8rVd1Ws69JvWfe8s63c8v
X-Gm-Gg: Acq92OE+xVRhWbQWWlVu+sYe/aTaA0dtc8inUfN9UdSi6iZkYtiRGl3qegDGkZHwt5L
	HoM6fxBUtnKQUBasz0LqiOVGGLu1Jrod/pfPU/Ha+Tu1G/+KI5LCsgiw+2WQZip69k6usdPOvo1
	Toa877TTqjP2uBxryHHEk+pY9k+YncDmDuPd9XGrK+1XAHRbgLIuX6E+AN39Ro0ivEihh5wdKhI
	S0QcS6FQHtvud+8gK9tHOIUBi5wIZF1kh90nMGOZA0i5ofFbUXXXdDVz0z50tBZdqX9uI1UbQ9E
	rrrpDjvhkTZ42rHnV4OVkTID2n4Ht7hBhrygEesZDWxKPPopAMd3IkkDvvVqPjcvjLHpnMRCTPg
	6u4B6djlZBK/U7J5cF/lR2iICiwNf1nrckYqGx/uQJPaxMqOv6RRLjtAYhIW2wg/Wo6sKFe983I
	TIZOvvaMWwRFXRubCIpJdE5T2/1OlZilyRRJue7wf0VUhD3+xAGMpzfN0rgr4QQmbiD+y6721qP
	bSn4X+tdvoepu6a1M8YZRFhjrpXnjDHyA+hrumrpZFCqmf6
X-Received: by 2002:a05:600d:6447:10b0:490:53d3:47a9 with SMTP id 5b1f17b1804b1-490c25ada18mr185336175e9.3.1780929693516;
        Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:33 -0700 (PDT)
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
Subject: [PATCH v5 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Mon,  8 Jun 2026 16:41:11 +0200
Message-ID: <b4cc96f60a2a40638a30c9da1d190c4a4b0bf952.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074135_332135_5BAC44CE 
X-CRM114-Status: GOOD (  11.28  )
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
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 387bbe3454c3..7f5109bb4182 100644
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


