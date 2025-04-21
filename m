Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8156EC369D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 08:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5wGQV4Z9YSZObQBq40LO1nvdGO5KA96Wt8dBuQPd2o=; b=jbOYb8OMcTDqm9hRRwSueWtmec
	nWR517IUOwueQGdIMHoIqXu3L6mV3iV9WmkCtdL1g/tv9yGdttAhSFwGsn4TPZW9uOxKdhv+Rt02M
	XDc3TAz8y4FvM3RU2ZX6pdTdRIrDXzor6D/GaMmFbJLhCpYQUOB3TyAdl7z2oGpMc1iFsMk4Ho/0R
	bzabWjPKpKjsbMLlQBDxeqj/zSlzTN1eXk+yjlXAoVBWEWub+yy/F2FJLiRYVZRxN3GYNbPIer8uS
	mTvjnEJiSaKPTAiNbXDoMHwE/b1sAP+N7kazmKgHupp1nIJ61YXMRm6rBzejac6a1fgbCLDfWUW46
	iGWIaYLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mUc-00000003u2Z-0WG9;
	Mon, 21 Apr 2025 08:27:06 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6mJF-00000003sAQ-0STc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 08:15:22 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac339f53df9so657622066b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223319; x=1745828119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5wGQV4Z9YSZObQBq40LO1nvdGO5KA96Wt8dBuQPd2o=;
        b=2YbEJqUeJdlZaNEFbfgdwERAtU1bpKL34gFotXd5v79D8pXeOEqDxsrqIH7mWwszul
         GUSvMM6qHWzxqoYq38GLhPun/czAly8pSUo0XrdTJWFW+E4+PIU08eSOPbDbkD2hWLZZ
         Y/NJMfBEoXhuRUv/mP9mObZcKdgwsr8z4eZzogSLbbUW7lnlQHfLMS340gC+ipeF/6JN
         18IEPeYBzF123MB/eLDuaG/BJ+Qb3o0xlMy0RZnUjkIC9NVo2r194xbJ5Obur0HBIhLP
         uAS8BxwKY8mUFI9iWX5irc/g6q2Qn+S0QgAPq9JFde6atUaBy/F2mGMdyQoEq0/cEHmK
         KPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223319; x=1745828119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5wGQV4Z9YSZObQBq40LO1nvdGO5KA96Wt8dBuQPd2o=;
        b=RT+w3XLnx79uuU9MIICVZf0bJfdiWp3e3pVgtBAC5PnwyI01vd4ObwUk24Cn8v9Ucw
         iDVGs5D5Rel/pbu4Tra4tGo4byKpLb++SN1t9QdM+59nVTgFipeo1IsP+PG5gE58HofS
         phxVVx0Aa6s29WN6kbv0Y46s3lHOmBNP9jD3d5jx7eUuuKzOprvqXZLNkrKsntxndmih
         TMV/Z7KoCO2G/M1iUGWRTDZpCYHHtP/FUJWz9aQB/N5Rw6Kn7BsvBfWG9IoogHkt2hZd
         9D3voigHrDo06N/O1PwsdNJuMb7rO3NZ8Fu3TBzL2htOebrF9WbzUet4malRKIyIdwA9
         cqoQ==
X-Gm-Message-State: AOJu0YycxSZZrbsP4ODzNkxQeSRidBkqfYRDVtQUAzq76m6Rf97jDRsC
	1w0r3eZvXIOyssco2veZ3UR/PJun3jiVzNuAPtkesmG5EuA122q7PWKNQZw+KYM=
X-Gm-Gg: ASbGncuX1A2kK3B8Fao3ObGZESQOJIJ8AMj2lBvg+MDqN1kFFEiqQ+SJPMpbYRvr7fV
	OmPJTwz6hbfczKjnPP+56YvSWj/jWJZAWBaFO1BCJDKuF+3ElaXedEaJjSyBimIvPRH0DKJZPNH
	yxVli43bskzuZmryKqdFbXSmyH59S5hDGfgjSaEvDI5UlvGO0H7402UUm5P03S6O615DkADFuYZ
	o4wgmIQiEHovgdJquFjLZf9Kx6BpwCqMedd2Iwy5xg4g/UjbJ7K/3asWF8F3DKJB3gjR9cvphb7
	4+ySAi297wVOclOsR8ZkD9ABKWgAHUwoud0=
X-Google-Smtp-Source: AGHT+IGWxtJdLJ36kRSbbl0qSFEd4pxHtkyAsGGiL1QRyNFjb0PyfwMRQI9DRuA/PGHaxCu6K5MuIA==
X-Received: by 2002:a17:907:720f:b0:ac7:4f1:65c5 with SMTP id a640c23a62f3a-acb74e19df7mr1007221066b.54.1745223319351;
        Mon, 21 Apr 2025 01:15:19 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec90a95sm477907966b.76.2025.04.21.01.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:19 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:19 +0200
Subject: [PATCH 1/7] arm64: dts: ti: k3-pinctrl: Add WKUP_EN flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-1-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=msp@baylibre.com;
 h=from:subject:message-id; bh=Lg9Ur2LsdAksm9MvChH0YvjPgYCv48epeyaeMJJx+vc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWfzklOvJsljNe1e0TO+a5bJntVQthsZBj2bOfO6Yfm
 bfImm9bRykLgxgXg6yYIktnYmjaf/mdx5IXLdsMM4eVCWQIAxenAEyE5REjw16z1I2rv4S3vl5U
 GqJ0Ntfvrpf+gWUOcmmMjUXffuyKXMfwv/agiMEtqRMZmg9jEl+GRe9S3TepR7Fwqn2ydMZPvca
 F/AA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_011521_167953_75D704D4 
X-CRM114-Status: GOOD (  10.17  )
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
2.49.0


