Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FCCCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xzsfBuCTTaW8xn6XXMC6wEsOLDhpMxnwzj4356j3YjM=; b=PWASxZBu18zQdb
	mLCnGvghMZ2AYctM+nkZ2Sb27/FMtPj3gnlCW+tvmu87CjdSNI3QJhk0chS5Z4GyAxSPKaArdE/v1
	n0il6O79GVprPLpt1Igbb0AYi5+3TGRegGdg8lh1atyYzg3J6EnO12fg/Ul8ZTO5thwQ5QMB+sQuI
	xYmkS0yFM/OHXWLObt8l0jFLiDY3T/goW7AUwzJXSCpcqLeCBX3aLbtZl+/0kme+0um3ieCoHCH7b
	GG99gPd5bh5NlxMIxcQyyWyfKgU+I3aggf+6NOidUsOf72YuGSBGjeFzRruD5YwpEDpb/zyzTAqge
	SMQHq54QmvB8l4JL/gsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKF-0000000Ekch-1eDn;
	Wed, 17 Sep 2025 21:04:27 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKD-0000000Ekak-0D6k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:04:26 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-721504645aaso1725906d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143063; x=1758747863; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xzsfBuCTTaW8xn6XXMC6wEsOLDhpMxnwzj4356j3YjM=;
        b=JEcU4hLFOQ77n21IMz+YaUTy77ByOc/vnK9VAC82R+Rzr1O5n2gwXI4dek7uPhz7p+
         ztyPO3hWa6bDAghrLRIj6wXPvrBI0G/jUUD4p0BB2NHB+Lf0vnb3Ulzy+JmZbjB8wD3c
         mElyMnyagtjnMTpU4j5fbXUZaqHF7zBXTTlVNQ/2UfduBCrMrCfiXam8+4CwcrhE/HWE
         X6lVWSIc8aXuQiPGzzj6XTDcuNUiqKOSbZEVGfySzB4sXNsJWMvZCCAFTlAdJAYymCz8
         mFTXZom2jFF3w7ZqevtopaWHFFspaFDQzLqpQ/Wn2SIVQSPlKm1V81+Z00ocpTX5rIgp
         /W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143063; x=1758747863;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzsfBuCTTaW8xn6XXMC6wEsOLDhpMxnwzj4356j3YjM=;
        b=H4JzQ89CXnprcTZZKmeGSGqj7gxLVubzMAbub4HXuvvyNQKl21rHZgeeixfOL5duhk
         sJQcRWRu4gned+Q+4jIs2VT1a1JI6orynBBGK35R/ThDseGvHDT7atIYcsxIvgVQnn0u
         C51Tyw0cqztB7NpFtstc+38hZNwVYeyG+3fsJLTwgNAMAI9C4hy7wHQtgBCO+DVzeXEJ
         Sl75cCOsP01+9axQTOe2hADdmiB7CC8ao9k4TgxlkZuPGRrqfBkVcqGPutZn8sVEgpKh
         qUSHC4amA5HWySeQ8kABqNOORp7KXfYQMSbq4WYExnfvZCpDeZTyspzVPgboiQVBiR0Q
         AC3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXERP5bAJ14M/XFgg8QwV2JnSX5mFrN469l0ZpDIahJyS5mF1YSAw0M5Mt9JIIo26hM+Bso2C9i/6QJgW/ofuHB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1CdNDr7zAliRRwrxjqxFRpkMRut2E44XQLVgLM+PDpIHG9vc7
	HgBtypiDXn6z2NO6ExyzPLKmvSYSSWgbcvdfxv3Hx7Xy8dqbfSx1DtDJ
X-Gm-Gg: ASbGncsP6GijoRbHCBzEjbgTxocb7sSDUUqw5i70SHx225qUWDVQcsGZfOPQxtuXh0d
	U2MBB4Hu2QzHEfFA3Z+L5CwF/c385yyB0rQeUiaQRTaaomqbVtj0HhVBdjIAvSzsXGP6YRslvqm
	pbzQBhHH12tp2BuyspWZkYLOY0qlTbrG/NA4QlFVLl4vSXNts8+2wQ6yzqVVH4VV5GJrLEdZuUH
	1MtdLwLNSIMwcHCbrVJC21v9gsZypyjvRhQ1wMVplgKmJKonPl8GliKs1ykJ6D2P+oTonzSPE5j
	TUkStHWcKvXbddKPOS34WVp4X/R+wWsU5GHVMyiI8rZCVoiTo0x/OEYPUXTJUqNbbcif1e2fdXB
	Ttaq6V31dgJz/aLlqHi8RZp1SBv/4D4hQ1GHAGKCfby5b
X-Google-Smtp-Source: AGHT+IHnv8inMvR0MGYLXV31f4OfeVWLDpebkI2MOQJt/N/3XFYgiGfLh+fLfc8OxfXxmx24x5Cz4Q==
X-Received: by 2002:a05:6214:301c:b0:783:cc80:1770 with SMTP id 6a1803df08f44-78eccf0315bmr41285266d6.25.1758143063400;
        Wed, 17 Sep 2025 14:04:23 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:22 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v3 0/7] arm64: dts: exynos990: Add PERIC0/1 USI, UART and
 HSI2C support
Date: Wed, 17 Sep 2025 21:04:20 +0000
Message-Id: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQiy2gC/43NwQ7CIAyA4VdZOIsBBkM8+R7GAxnd1sSNhSrRL
 Ht32U6ejMe/ab8ujCAhEDtXC0uQkTBOJepDxdrBTz1wDKWZEsoIJyyfy35L3IfAn4RTDEDcACj
 jtNASalYu5wQdvnb1eis9ID1ieu9Pstymv70sueAebCOEdtLb7tKPHu/HNo5s87L6w1DFMKdOS
 +uaoEL9bazr+gFSZ37b+gAAAA==
X-Change-ID: 20250907-perics-add-usinodes-5ee2594041e3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=1502;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=yHu4BWyc9HYj0iZyDR9twQCdVLE01QwMnBaBNhjZ670=;
 b=im0qQZJ8AKGgXuNpTZxbO1fV8vN+QksxCGdSj1+fa4lhBFH6jgpJF5rbT4cPHaiRoXCBhJikE
 9D0TnXZWEGfBswCkVxsXExcCfpjpXAHtau1UtSXUsuMjRQk1l9W/36a
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140425_099549_F0E66DF9 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi,

This series adds device tree support for PERIC0/1 blocks:

- Add sysreg nodes required for peripheral configuration
- Add USI, UART and HSI2C controller nodes
- Update bindings with Exynos990 compatibles

These changes enable serial communication interfaces
(I2C, UART) for Exynos990 SoC.

Changes in v2:
- Remove unnecessary blank lines in HSI2C nodes.

Changes in v3:
- Add sintaxis ";" for parsing error parsing input tree.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (7):
      dt-bindings: soc: samsung: exynos-sysreg: Add Exynos990 PERIC0/1 compatibles
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1
      dt-bindings: soc: samsung: Add Exynos990 USI compatible
      arm64: dts: exynos990: Add USI nodes for PERIC0 and PERIC1
      dt-bindings: serial: samsung: Add Exynos990 UART compatible
      arm64: dts: exynos990: Add UART nodes for PERIC0/1
      arm64: dts: exynos990: Add HSI2C nodes for PERIC0/1

 .../devicetree/bindings/serial/samsung_uart.yaml   |    1 +
 .../bindings/soc/samsung/exynos-usi.yaml           |    1 +
 .../soc/samsung/samsung,exynos-sysreg.yaml         |    4 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 1419 ++++++++++++++++++++
 4 files changed, 1425 insertions(+)
---
base-commit: 98ee0e036cfedf543c4728a604fd7870d0000efd
change-id: 20250907-perics-add-usinodes-5ee2594041e3

Best regards,
-- 
Denzeel Oliva <wachiturroxd150@gmail.com>


