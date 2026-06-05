Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DCACD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAU8ucH49VWogl3LxGL6+W4AZQI2q/uk0brbvJV4cSY=; b=Eyoc6UNWQ+SAUiTR07d2Y7nOrf
	rZRgjpGFXI74xMYDHwalNHXe+JizH/rmxik7xp6Hvzf1C7PUHQAedvvEy4q05C4YJlzGfaGxHA593
	dOJzxBNWs9QFr5mLj8aYDogl+fZtANJdTgxSI99Q+/Vn+NatfUDsQ7nUmzm0Q7VQr505UcNBi2HZN
	s7VobukRVW9X1fY7enLesGU1UIWvaNOpZ7MZxBnpo8ffl6tGMI6HRMzAyfGgdtxHZnIarAFPlHI7a
	n4JOwO4kocitqgAbxXl8Z75bqL/Q1ayK2KpfDChTfGS2hjCFhQU1yj9QvMg6mNCLQ4pYTiNUbKZ0d
	/fR98eiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3O-000000009W4-0d0x;
	Fri, 05 Jun 2026 06:29:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3L-000000009UI-2kOX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490a76757e5so10205435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640950; x=1781245750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAU8ucH49VWogl3LxGL6+W4AZQI2q/uk0brbvJV4cSY=;
        b=WpqSm6YWmADpkCe3yvRj8dksfKCDf9/9n/8+DZqo6ucMTdS21lHqCREv4qSoIF/nNn
         HSu2m2RWJ4i/GKFCnu85b4M7ujJ3TUEUhjBWINYvcegFkvjNFNhMjkeIljYhzRjfWi+q
         J3itTP6pfi/Moc3yV4gXhapXY5aPkbQ8t4KH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640950; x=1781245750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vAU8ucH49VWogl3LxGL6+W4AZQI2q/uk0brbvJV4cSY=;
        b=TLc5e1mb678qhgGphp7o0UX5ggkm+BzJx6QwRUB9vhEpl8QDXxU/cBCJBK/8OxSh+Q
         Ypo0ykyvYZR76rkTRrM0RuspFv2tbAkwHJzUHgifcvKHyqz1ryBURqpnSgI0bD4WGpFb
         oDJFhM527pkD6YNdN68i+sQDLKKMzhvTzTVJCSLGIn5i0SjvGnuhlJAyk5AkgCNyrEMr
         VeEgmftKtNjdtZqVVsM/k51UlTiYY+m+DrZwE8MvMv0iJE9zi/OpspokJzZ7+tegjeUj
         G1PspanHlj29ipRPBoWmTTXVBcYxUnVxMgOpdRCWggc1OVxJClVd7j2Y+44sZO75hJFp
         +44Q==
X-Forwarded-Encrypted: i=1; AFNElJ/51pUEayeVTRqaY2xFwj2o4+slNsVNKsAzbIjxpV7900cogOx2rX6j8cMWeK+osemPqRy7USsXyV8AKLsQi3aM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9rRKfalYfjSRg7/pStt7mOjMa20P7nfsgWaqsNjkLlwUgooHz
	cccAi7KM32d416rdgfD6arE4Myol99Rs4So9J8DVJxfA6YIftH1RE5MqnvdRGAQq3+E=
X-Gm-Gg: Acq92OEFC3GihX1AOfI6NBRG64MU0zWpEmo9ex0AObBt2zGXG+nbSluPwCkPNUQVMnQ
	Xbi7Xx2sF0MtWTKZB7T65LNOquTrmoNffrd8wTOautTHeuoU2NMYpK1mVBR6y+P01cPOKDE5/dm
	aFoJe5W9WQiqapfaH5r5BAELfeQ6WItFua1fHXRKhecqjnXGEAFYAsv9dtoqPGyyCb8ge19dNPR
	fJnMGq8VGJ/QA32bsSrFgR/KX7xRHoJFqmyZdP0hZMAw+4Y0cOIzfbOplZYduzJefUsGb6g5jXp
	UBUxRVnMXzsxdndzoccqQD53fPgT6+mjT0WhgtBSJrxGle6h1ZNci5mSzE8p3iWBA6Poc12MYRy
	68nx+lq4CNA1PTLKp6z8PldSDzo/lr1bh00Z02zhRMafpmMf5TRzibjD7vFgEXsVM/Wbz3l2sKo
	uWh1j4lzbw3Ph8f+8tF1MnYlW+C65odfATHV/UgUPhMfcKcdcMCh4ws/V8PYKWLIjuPjkunhjez
	sr3qePj1WohmJ6Kd7/lERy0I6eU9xaz0i2B5pq4o4c/cLIatDcXDDvGxZskglqZVMbr0g1ZoZEH
	CgtOSN3JLT+CTLu3tj2z7OTsTZDfBEXof38=
X-Received: by 2002:a05:600c:3f1b:b0:490:c0d8:d517 with SMTP id 5b1f17b1804b1-490c2598543mr27584865e9.3.1780640949794;
        Thu, 04 Jun 2026 23:29:09 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 02/14] arm64: dts: st: add SDMMC2 support on stm32mp25
Date: Fri,  5 Jun 2026 08:27:30 +0200
Message-ID: <20260605062900.368376-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232911_711573_34525856 
X-CRM114-Status: GOOD (  10.01  )
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

The SDMMC2 controller supports SD cards, eMMC memories and SDIO devices.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Add power-domains property. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e6..faa1355948e8 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1667,6 +1667,22 @@ sdmmc1: mmc@48220000 {
 				status = "disabled";
 			};
 
+			sdmmc2: mmc@48230000 {
+				compatible = "st,stm32mp25-sdmmc2", "arm,pl18x", "arm,primecell";
+				arm,primecell-periphid = <0x00353180>;
+				reg = <0x48230000 0x400>, <0x44230800 0x8>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&rcc CK_KER_SDMMC2>;
+				clock-names = "apb_pclk";
+				resets = <&rcc SDMMC2_R>;
+				cap-sd-highspeed;
+				cap-mmc-highspeed;
+				max-frequency = <120000000>;
+				access-controllers = <&rifsc 77>;
+				power-domains = <&CLUSTER_PD>;
+				status = "disabled";
+			};
+
 			ethernet1: ethernet@482c0000 {
 				compatible = "st,stm32mp25-dwmac", "snps,dwmac-5.20";
 				reg = <0x482c0000 0x4000>;
-- 
2.43.0


