Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85169C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=; b=qHPHXVPqZfGuSeHkAolJQDcrMp
	IBFsaqXN8xCO9Pxz+QWL9E5/DXr3q9Ei5cIfOn2l2U1XaW0fpF8VK11960MaJydQ3TrCE8+lPrh9m
	WSFYBFNiZ9dYuC7tefFMZIOJgzFRk5GgAvJRLsMoLbgo5wFuqUnuGW+giCbje1JMOW+7zaKT/FF86
	YOjM0BLx6F1hWQ0KWe5Z0pDgqZB2iY8rRyKV98D6Vpjqo5yGKgMkN8Y1aRxB6Lh6Y7o/PRDZ48GMf
	QaGuraOBGXUd2guLUYJLEXo8URWnr6CDvRffb2j9zr7yDL+EIkuRj1gOW5kOU0y7dImSqHEIh9JZH
	JJWvaLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpm-00000005MvT-0Cv0;
	Sun, 19 Jul 2026 21:14:02 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlYpd-00000005Mqu-1MNU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:13:54 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso26202905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495632; x=1785100432; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=XiswCUD7gXLm0aiDJPwJN5w31sCMJDfhtOUWfocOBZLRCxEi31wdcVGScv1VvPPOcK
         NkVjJ7pgqh+Lb8zaXUmoBFoj5vwGAtmPJIEo2QqG9Hl1vxcdKfHkL3NRqbyT38XaEQYp
         jhuDXqirS+EFOof3MhL4osH0OhjksgYyXbTKZPFZow8pQC0ktaMIOkdbfZ5X7R05P3AV
         g+lqmiNusi/nRUDAUOySsbt5qraELzUIVPBgOv2XnMnlWHzb2NNjz/TLkjQ5B/ZTDpKL
         QmCfXhiLEqzBILeuiR7n6kpFHBR5Of8a/u4PTkBRekA/bDiIFyAL1rUprUcThAhGuXJp
         lAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495632; x=1785100432;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSI4AxiakfLEoxCkbMXngSkCPIZ/Cb8g+GVzqOuksO8=;
        b=dFjmMK95+GdcfnfMKhVM4KeV5z9K8BPrbTIeZcYC4IrBdPGHpjtWSjeTaQJ58aCjEI
         LSZcouNBW2SUeL7lxkjw7rsIiOoOTxpZv35TRDGMDxE3TwESOiTbH79MJKRM/X6SgaAN
         k8Ktz4f9hCHNTMPtbAAEz3GPsY5ej5VjyPVB9mCVqFpm94p0Wl8zDsms3VkypfDoYSx5
         xE8byfpWmtKp+6gURQnnOs0H1GL13DTxjQx6zZ1ek782T2CO870ac3KZUZFepbbq+g2c
         ypA8DSVs5+NIZT5bhvA7DRmuwhyQRMt39LWC8G0333BkwDSXhzj5lo0Cyp5gwrM80CU0
         Kh9g==
X-Forwarded-Encrypted: i=1; AHgh+Rra0lLMw9RidFIXqpM+lr7uXRoSWtiEgxtwhohZNchBatJPiu9ivcUVr0/F+891TW2PKCqQfw2tkuvNDvy24/J4@lists.infradead.org
X-Gm-Message-State: AOJu0YyXxhcrPSezpOSE94LidFW05Txdt5tWwyHSquNeMJMia16+MXIO
	Sx/PqZobWlrClN+5G2M7vF8R7eXsebDh/2YY5Hz3CyWKGLr5T6ujqULe
X-Gm-Gg: AfdE7cmEAw4EiTfFbAM8NqdriSu0DFWJFKnt4Tu8HhoR0/frc5Q3ZPFIaUwz4Q4LPRa
	8q24Kyy5ChcscxI6DbqIjhxgA7ZgO596py7E8CbTSqoRhxgvptz0agafCIhI/3ozQUV88pKc8oE
	CKPkCkqdkYEGxXDYwngeS5g+ufPw3YranzDtzNplghnVtZ0N/hx6XDczCxBkvjf1/6Fkczg7tiG
	smH09qWFWHDLq0YDwIBy1PaW0N1k/xqqDTDZqBW2RE7aRGQWhOIKC3F2G/rbXc8jeNd4YHrshbs
	om99PPs8pe76Lf+IJ3sWe5AeZQ3X5U/s8ywyB2bGjQcYw5VhlMrjxw1959l0pZKYdhk2T1za+Nb
	Bo6Y1ucvsG04Mk65k58q75bvC+tsu+vJ55xrEEWgC9t0tX42gWZOEK4UEZ9ksBs3dh47E+jVSit
	yifIxvdSctIj6azKDVhb9/fv4Uxa1cUXHmEzlK
X-Received: by 2002:a05:600d:8494:10b0:495:4056:2c6d with SMTP id 5b1f17b1804b1-4954a402f4fmr101550685e9.23.1784495631684;
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3e2a9sm224108815e9.4.2026.07.19.14.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:13:51 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: allwinner: t527-orangepi-4a: add GPU OPP table
Date: Sun, 19 Jul 2026 23:13:19 +0200
Message-ID: <20260719211319.982285-5-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
References: <20260719211319.982285-1-juanmanuellopezcarrillo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_141353_453770_FC4B3DBE 
X-CRM114-Status: GOOD (  12.05  )
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

Add the Mali-G57 operating points from the vendor BSP universal table
(150/200/300/400/600 MHz) so panfrost devfreq can scale the GPU
instead of running at the boot clock.

All operating points use 920 mV: the BSP table specifies 900 mV for
every universal OPP, but on this board the GPU rail (AXP717 DCDC2,
vdd-gpu-sys) is a fixed 920 mV supply, so the OPP voltage states the
actual rail value and voltage transitions are no-ops.  The higher
speed-bin points of the BSP (648-792 MHz) are not included: they are
gated by a SID efuse bin and need pll-gpu as a live parent.

Depends on the sun55i-a523 GPU clock divider fix (the OPP rates are
only produced correctly with the cycle-masking divider model);
validated on hardware with the Mali cycle counter: 149/199/300/399/597
MHz measured under load, thermal-emulation throttling included.

Signed-off-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>
---
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 055be86e5..0fd73a1bb 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -30,6 +30,35 @@ ext_osc32k: ext-osc32k-clk {
 		clock-output-names = "ext_osc32k";
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <920000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <920000>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -116,6 +145,7 @@ &gmac1 {
 
 &gpu {
 	mali-supply = <&reg_dcdc2>;
+	operating-points-v2 = <&gpu_opp_table>;
 	status = "okay";
 };
 
-- 
2.47.3


