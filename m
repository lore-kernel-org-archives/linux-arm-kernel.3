Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A81C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFWairiFktoGc2odXSwmyM/8KlG/z88XFaQU/RvUTy0=; b=e9MD/fksp49dNRu3Lm95RsSbpd
	2Qbdu9EKyBLV5Gy+O6UpfGNbIhjVOWKPFnuY7p/JufgQlVXKV72KViVeHohJLnUEXqZBhPwn21d/S
	63XcfMnxCF3Ryk/wijXGivMn+SgLL6DfGfp5vIgAx+d0u43ir3i90xWC/hTdG0k4OMxhd71E0Z2Fc
	i7MwVkARvYMRfvJso9d7X/bIUjBApvVcOi0//N7r9F0R0WHxFGQtUdihRJwOWohI3nVenKGh3ITVJ
	FC6DRYXcPp/pkNEOkRnCmNr5GZGhhqb4Xy1C3XA47E8oYAshw+zPNuZo29SG4/TGinecWWGl5VS0P
	Lt8e1lFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9YP-0000000AoI3-0CP1;
	Thu, 06 Mar 2025 11:38:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Cw-0000000Akdi-0czI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 11:16:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso80551666b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 03:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741259765; x=1741864565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFWairiFktoGc2odXSwmyM/8KlG/z88XFaQU/RvUTy0=;
        b=xGExgAdr+ZQ4i60izuDa3IJ+pOnzFNQMbQinY2HmLgPoz4ZxyqUoguj3t5p2JDputI
         Zb5ntAVS4MlSUSR8JDyFyP7Lw3NeygnXy9Nt4VDM7Llk7BYKWxjXypY5K38sOme7pXdY
         AiLxAKlb+MQ4yTSPMJPhlbraTrR3UA3cXtP1655fqBRffXQL/fk8PbFiojatKm/c6DPd
         9CGFH45BBeDyiL5IYRddOScMPfpfnWCR5QRE88P7UNrovvXxdq++tUlKaV8yjpMtDXux
         5j2T7T1ZSiOmkh9AgIc9JH4p7hdJyJfsXBenqV+3gwoSfzOxMkYVvuc7H5a5uF0sgBay
         nKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259765; x=1741864565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFWairiFktoGc2odXSwmyM/8KlG/z88XFaQU/RvUTy0=;
        b=r4Un/MLBIIQWUAY0iwCLF8JcDRZLjtEMdVJQVcq0ZXGDIWFtQI3/tBsbYnT/ZM++fw
         lpWE7GJKoWfnHN7NRa+9ssykgBxWKDPaUfTRvIudEu0dLcFYUcGQFClPF+49bRoaw0k2
         cqr/GzBtROHLw1psOtz8rrSVfOvJJCBZeuoXTL+dlyh+qDi5F8EsFsEUN9cqdvkpsd4k
         Xx+KTMxCedvzS9IF01viTmedjiw7mPBG0kH5yP0nWX0wqxGE5k4PqMHa8UE6G2f9J6yS
         0MngNP/CMzqFhWl2E1+xxBbCOqrsfF+37CQj6t18MUQWpz3QySEfzvTfbQ0Dk+Ew78iE
         h/HQ==
X-Gm-Message-State: AOJu0YwyVOa/kQJIl7QUHaOb3Qd4yTZcIRFJfseQpvedQiD9AMnlwiq6
	S8wpkCTOob2r6iKXkAJDiJVvBhbZXpp2L24PNE+M3tIWXsazrkC19KWM2Frn/AvV97Iec5cDYQS
	M
X-Gm-Gg: ASbGncvB8bwmk3YGKZvCrVEkjvlCK+OPkeDcd2zbR6i7Y925EzVu/I7BOm3/GKOMVNI
	/i6eeYMTnojfnaxJd/fDbwgCDD97nyjaXT4qz1LYFwzrzILOVNQ6Xy7HnNcBHcjvnHaKOW7i2Gv
	swcWYrxoK/wHUefurEj0Qb/eK+SdW55PVWemf3boDqRE3OEAI8531V89a4840lMm6q/cuTMn2rq
	vxNR+9VnL6ZoZYP23GwwSM8e613mgXq7q8TnMIY+wBLdwVSgyoDfJK+2cLD2OK7OEnRJb98nZ6S
	mNGbR3Z4/KPYRYoBy5dU2FwuBhFv5YuNjQ7NG9yA0Q==
X-Google-Smtp-Source: AGHT+IEOjp1rPMG7K9BeDF47/kaJ0MaWl8YKzHhaw5DH+VYb1REqVhPOfAx7ij8510KBR1jG4vUuww==
X-Received: by 2002:a17:907:7214:b0:abf:75d7:72a2 with SMTP id a640c23a62f3a-ac20dd077ecmr706422966b.38.1741259764790;
        Thu, 06 Mar 2025 03:16:04 -0800 (PST)
Received: from localhost ([2001:4091:a245:8327:80ad:8144:3b07:4679])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac2399d3dc4sm79424866b.170.2025.03.06.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:16:04 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Thu, 06 Mar 2025 12:14:45 +0100
Subject: [PATCH v5 07/13] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-am62-partialio-v6-12-b4-v5-7-f9323d3744a2@baylibre.com>
References: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
In-Reply-To: <20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anand Gadiyar <gadiyar@ti.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, Kendall Willis <k-willis@ti.com>, 
 linux-can@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=msp@baylibre.com;
 h=from:subject:message-id; bh=SuWEbpCuQ4MLb4zR/ahkYmnYDXwRgcVXgN8O0qdv1Nw=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNJPNp/cNK079dTCQKN/34//lTh9rrrqtIWVgvHXFwujV
 uzw0VpU1lHKwiDGwSArpshy98PCd3Vy1xdErHvkCDOHlQlkCAMXpwBMZIMLI8Pum0vEYg8bZnfm
 f3a99ow1a2XyuuTegykXUo2LIjbvE1nB8Ju9NeKsx+4FdZqK7FMcd++wSLVsq/GY96LrY+aVd3u
 L7XkB
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031606_197788_5843B5C6 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

WKUP_EN is a flag to enable pin wakeup. Any activity will wakeup the SoC
in that case.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index cac7cccc111212eba520454396c8cc5c9fcba9b1..79a9f54fa0095c4e3864872bc06ef3d033215b2b 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -18,6 +18,7 @@
 #define DS_OUT_VAL_SHIFT	(26)
 #define DS_PULLUD_EN_SHIFT	(27)
 #define DS_PULLTYPE_SEL_SHIFT	(28)
+#define WKUP_EN_SHIFT		(29)
 
 #define PULL_DISABLE		(1 << PULLUDEN_SHIFT)
 #define PULL_ENABLE		(0 << PULLUDEN_SHIFT)
@@ -56,6 +57,7 @@
 #define PIN_DS_PULLUD_DISABLE		(1 << DS_PULLUD_EN_SHIFT)
 #define PIN_DS_PULL_DOWN		(0 << DS_PULLTYPE_SEL_SHIFT)
 #define PIN_DS_PULL_UP			(1 << DS_PULLTYPE_SEL_SHIFT)
+#define WKUP_EN				(1 << WKUP_EN_SHIFT)
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
 #define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)

-- 
2.47.2


