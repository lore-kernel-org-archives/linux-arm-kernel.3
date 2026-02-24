Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E398BF3C986
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZ0XT8CClTVl4GH1aholNqdl4xTunfuNXXEQGvRxkwg=; b=jNuRIgi4dTZ5c9
	u+1NYTQRsVdQyzeT5ApQG/7nKfUklCTdJpQBSjWee0uqx5FUDffo5FDGBzmzpjyPAK1eTzEeDdpKR
	OmMPcFUpEHBufxDXF6tNuX+rY9NcX7/+4OK9LSM9BAXJyUKedQJ5p8toA8Dnq2StWJ7hNUtnpBwOd
	RrE7hztFgTMEu2b7JrKC/L2qtPVwbtYe0yJcWbvxjBLcnKh0D7R+qX1tvXZgsJBKpNfD4A5YUjhZ+
	mfU9D8yewOV5XMv5CFdo1GvD2ZXsMLGhoxNG4Cow3NFxuZ8HlCIVPGarGMn72n3BM93LBPlvxf21i
	1apxJFeZM4kqCmXjPnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgh-00000002GCy-3Uy5;
	Tue, 24 Feb 2026 14:46:59 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutgf-00000002GCX-0Wna
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:46:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82310b74496so2878850b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771944416; x=1772549216; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ0XT8CClTVl4GH1aholNqdl4xTunfuNXXEQGvRxkwg=;
        b=naErXr0AB3fxOlg2wsmo2RzuCI2NVTIv+Bh3LBg3paotJVsOHJ7rf8PBC/YqY7bUqU
         BWX9PZBVR96N0Ljr5aDWyWgPmAsw3kSf1cQzQnJXRIhSDfmBfSGMXNnVaqK4KvVCLMYe
         8BlsiPEA1QMN9m0pYlz+yMmUsarbm1MfzFTM1dPgnSL1aU2l6FhilyR0KXiMXtz8iIG+
         UZbxXebfdD9d2Erf8wUSgufiZI+Mgihdp+fw5LXMkDY3SBcLWds3HQsOWVLW1dK36Oin
         NcEvxu0kBGUqn1sqcISY82FXs908EsnLH+HJ8C9mb5u0VKxsTa1a0KfXLbB8xx1mzKBF
         9Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944416; x=1772549216;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZ0XT8CClTVl4GH1aholNqdl4xTunfuNXXEQGvRxkwg=;
        b=n80uiuuEVSud4pVawCqUaP6sPT00uc4gWprqenNBwKL7oEBe/X/SdFnUV31g5t1ocM
         4JbTjLzOf+IG6+6ZRCQFgFtAc6VoVzU09LNz7hvVFM5C3/beRgtPFHi8H7TCWgdbQSSw
         SQfRbKc/alYx+Ia2AfJrtYMxFS/Xgt0KJ0Hago7vIYZE/fiv/cj+jUmlnn45H61W8y6g
         rCNYxf00O+VYoOP0BoGkYoWOFTAdqClqqvNqgfanhuihIk3FunAQi28J/PiR6/1Kghq7
         qk9qFKP+X+t4C4E18nVPqhgx96lKa3ZteW0KVOE57TMsYqy4YRFGu4zmHnCrAu0NrvZv
         Ho0A==
X-Forwarded-Encrypted: i=1; AJvYcCVUCLdNmxOTjAirWtGHOg1VeFXfFv5hKVoaVYvfVb2pGCxI7FwpLJlrjBQAbSoycAlt1MelNepL8DRPDoUmiRlC@lists.infradead.org
X-Gm-Message-State: AOJu0YzR+6I5OLJizGW+7RWfXRWQtLhnH5cAHJYPSN8jd73vHTyMlVx4
	AGdlbYrHFrQJnzfOgX65uJXxkUbRShC4I+WxaI4JAyPfeEw5k1Bx8dZf
X-Gm-Gg: ATEYQzwMuVqkaAWJtN0e1FOz3K6ADuoT2F1UkRaOT4MmNIZCYTr4UtUhRSrJ0u2yOVF
	NjCKA/A+ug++iuW53f80iLSOZOXLSPg5SWwj/afwiLD2U7BXmCyWmMmFrkPehGpKxE7cTqe1yb/
	J2MFlNcDTZSUN1uqoMvu4XZPtXgiW5HNdAFkdojMKh56uxAXkWWf03PIo31tO8BoFAm4RwGLISO
	cGb5d4rrL2zSTLsgZjtAYAeqvkCAlMTXxQEWhcYV22u2/DEjwznAyTeWS69s/+CLhhUjSeFgTJR
	/IUaoupu6Tcbsu6P5BWEEhXrJ7sNWpFLD5t6rX/j2g4pHoHU6Yb4TcDN1Txkui3s745zUI9fgZH
	qaHG0R+cgAc+mPCfKYDv5pgWTqDrnP9IU7eUfl0TUe+ymSNfwuxueuEoQwJ3beTfIxgLL79f9AY
	Sn3iKXqKinFxYpsRkbVowWDH+ABhbvboq3DOCzFFX9/yu87VKka+5seX24LIQ=
X-Received: by 2002:a05:6a00:3a04:b0:81f:45a2:cbda with SMTP id d2e1a72fcca58-826daa8a1bfmr8436121b3a.66.1771944416190;
        Tue, 24 Feb 2026 06:46:56 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([122.168.64.105])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-826dd64367bsm11149895b3a.4.2026.02.24.06.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:46:55 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Subject: [PATCH v2 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Date: Tue, 24 Feb 2026 14:46:45 +0000
Message-Id: <20260224-arm-microchip-v2-0-8bedacd2cdcb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANW5nWkC/13MQQrCMBCF4auUWRuZRNOqK+8hXYTp2AyYpiRSl
 JK7G+vO5f/gfStkTsIZLs0KiRfJEqcaZtcAeTeNrGSoDQZNi9qclEtBBaEUycusCAmttmiO3EL
 9zInv8tq8W1/bS37G9N74RX/Xn2R09yctWqFybIczdqyRD9cxOHnsKQboSykfhdGq+6oAAAA=
X-Change-ID: 20260128-arm-microchip-c0c0515024e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu@tuxon.dev>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_064657_170443_44C5056A 
X-CRM114-Status: UNSURE (   7.78  )
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

Convert various legacy .txt bindings for Microchip (formerly Atmel) AT91/SAMA
family system peripherals to proper YAML schemas. This includes:

- CHIPID (SoC ID register block)
- PIT (Period Interval Timer, old style)
- PIT64B (64-bit Period Interval Timer, newer parts)
- ST (System Timer, including watchdog subnode)
- RAMC/SDRAMC/DDRAMC/UDDRC (SDRAM/DDR memory controller

Signed-off-by: Akhila YS <akhilayalmati@gmail.com>
---
Changes in v2:
- Change email for maintainers.
- microchip,sam9x60-pit64b: modify compatible and clock-names in properties.  
- Link to v1: https://lore.kernel.org/r/20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com

---
Akhila YS (5):
      dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
      dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
      dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 +++++++++++++++++++++
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 +++++++++++++++++++++
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 ++++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 68 ++++++++++++++++++++++
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
 6 files changed, 290 insertions(+), 48 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260128-arm-microchip-c0c0515024e6

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


