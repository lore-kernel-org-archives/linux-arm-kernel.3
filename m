Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3FDCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=; b=msrMuWH+6oq/5v+iAnBXTaTZp+
	/2+FLt9F80lmgU6SXfhcWDcCf4B6iehNXwpR7HTJg7ojvXnj4Rzo4v8XnxpyVKn7sMaSBLvesU0or
	6Ic39aLg1JPrEJ7Vo/CiVDGtjC7QJPmwlwgsZpLnd/skjDWWSQYa1mMJSKRAMzXZ8aLc5BC/0nBJs
	4Ksad23/A9SRuo3xPiJKwrIV8dUllFApPE99fjRky2cPr+sXAplaXe02inWl/wj47fXon8MZ1ylwX
	n0lIFDI0g0NZnppt0peqckrZOBibfrJZOyfN3TQWi+tYtk56l3cFihzUg/892va+MkKzzVkiN1Thl
	Q9Y3gH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGd-0000000F0UY-3JAQ;
	Wed, 03 Jun 2026 12:00:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGb-0000000F0PO-0jph
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so11296835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488011; x=1781092811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=;
        b=XEzyBADLP8plVPpsX74B1m2dQFMJAxEi3KXHUfGrCg0N5Unv6CsSaWmnCQr2R4bpfe
         kZlJuwfOPi8SNCiQEzz8tz/RvE1sGcQ3leVhiw28lBd1CZ9mWvEIgyfdm9KEQlmJoouN
         NJ0UwAHsqcPHdF1JijnCQGUdSmbTkAiaiwd25Po6e20XfbaaVhhTnhq2cqV/W+mJtd0d
         rigFlezFqkmmpWacFpJcmRZb1VP8Ee4DjanHKwjMRiqI+e4YzVbSTQjSr0kD8NioNJpT
         Cyfws673LZsP3uKbTcFTBomWkTSlxkFbSL45gXGdl8gxrWwHXG5K4HCsLHRQmKLmVLlK
         XHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488011; x=1781092811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=;
        b=FC0LL8cbXvIc0zfEgKhwoPyprjmM59xeL8aEz2eAXexosT+HvfNseFEmGsH23+Z2I9
         a4TM1/aRijnEaQLi1GoL8UadGUaRRPErPv2pmIezKauACnzSk7baVepG8b3+WYgaRRuy
         GZK9FrutTTBjvKiqAd66bhrrqRUqw5bxZWPhR9NY9FZEVH6kiUO8b1rAGwavarGSO4uO
         iMNw+53gkCL344GQpPtC1gPP4I2VYsyRDUARn0KgnCbxB5b+2858iouDn5g7vTP8rNyE
         c2imWYmiiMnsImJ0k3m4jVL5kV67LGMQ2wj/StLje78F5nkIqmOjDsT1VII7Mjrr9gCr
         ak/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ExKQLLF2AtOjXlbTltgnuYCzwyVfWtWW0oaQs3vLfzz9tsX7zaSKY61LKoPmW+tgdC8QjM1UdU3kLd1868eOh@lists.infradead.org
X-Gm-Message-State: AOJu0YwALBVM/XY2sfoSso3NEGAn9Q7AdrPK2yEquxLFXcTIOt/f6TaZ
	AsI5+twT5+vHRw+TXte0uhBBC5tPYbl/M5UC1NTFXi6mZ5wXZIJ+r12Y
X-Gm-Gg: Acq92OG7kqGr4zzDX889zDEaPhN3rTwYiYZepstUNDfRypetDP5KdiAPwEdaQ8wdYuj
	mYoq/K711tY6aXE1KiQPjR5YuDzm1XRgUAk8gNxht2V4MnXghIIWqJuxMDA4PyPU9Vlsx9V6bMl
	pULlaSPmTwV4Tc2SCeJym2JpU4jQvoje5VVmOa6CffKnYJPygtUVO8V0hscm3mfMkdtvPqoZSlI
	bdqmWnmsB5ECN2hyLrX4/pWW0lkIr4Ae4TqqGzmMmb5i8Fb1ngKtvG+ih2BvEwizSabFvVT9kaN
	7fjdB98L0A5x2B8g8yi2U7h/WMeqEX+wGu4iAh67CkBpC/rvpJrp7SIjgMbfxR1sEdUxoevZDD3
	dz52E+3GJ3OrkCl7dVTNCl701yMagRJGy4u3Nn2R1eA98MlNdmORY3CGVRK3pB43b8GO3R63FLP
	p5agTcsJ3AlfdAyKJgcDRUX0/A6EimSvrn3GzRF2VRVY6dAeqN2+VB+rJC4FySEnqBhnX8oZ49l
	Tj1F68oXpShxYXGuDeytTob1czJa6kFc0uZu1AIr39D
X-Received: by 2002:a05:600c:4fcb:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490b60ff366mr49248825e9.31.1780488010942;
        Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
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
Subject: [PATCH v1 10/12] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 13:55:48 +0200
Message-ID: <642c165fa5ce0951352d7d164ae7d871120e8631.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050013_241882_0DB4B958 
X-CRM114-Status: GOOD (  11.23  )
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
 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index df4409af26a2..d796c32f50cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -191,6 +191,14 @@ pcal6408: gpio@21 {
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


