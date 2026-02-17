Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7179E9A020
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lvvufgkhUDdE/Bqpji9LIc9wg44ul+E6WiDw+AU4u0U=; b=Hj+A8yW9Rfn/05
	QImSRwZxrQsW5BR3JNni8dW3R+F/n4ZodQW70Uka3bgYjEZKTXyrFoKyMI92g4VCi2eetz3U4omiM
	U9MYImwm+seNBiU6j/8IRdIj37zZItmVpzOytGf6f3/Mu2dRbD1f1mF27W5W74WlrTjvwZHCWyATn
	qMY5yhXoDPhmy0s9nbSLCiKaSjR1oWYm0yrL8h888Yl3Hj1aXl4nXAuw1A3Eh/Bz7NnNQqQg9tLA6
	MlvXg4S1HvFUTB4MxFYBB3NjkVf6F6icoGsdxl6J8WY1COns90NqBc117OauXgMOaiycXVzW1rQLE
	LgX9UEXxwGLwMOL3WbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoK-00000008ePS-3Fex;
	Tue, 17 Feb 2026 17:24:32 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsOoI-00000008eP6-1Xh6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 17:24:31 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a95de4b5cbso40957195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771349069; x=1771953869; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvvufgkhUDdE/Bqpji9LIc9wg44ul+E6WiDw+AU4u0U=;
        b=Xu+Xl8N4sDe2Q81MqDFhnPYYUy3RII6FUdZQzd/pFSRTuE7OJ88WT6JvpVd7RpsaVJ
         OhtXMXk2oOPqhMqJPk9GXfSmsmZukFUikWUH9mmXJdyva8WnfxDTJIRC6n0TTLVlhqsS
         a06rlkhjEckb4yASNofhaKtOO2etqADO5UYGcV214YRHdmg5KtKH6BoNyghqEdpRp5Sh
         DMEBl0WYhKDmd/hVXsbM02Xkg9W1M2/TXQHjfAp3+QnwXSOhlKL3CexBRATq9281adfF
         6T2TaxRRh896BvetmOXPROLncqZTE+QIF3mg2u30QnFi1f/Jj6u+V/S5G1ejuTZ49J5F
         TMQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771349069; x=1771953869;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvvufgkhUDdE/Bqpji9LIc9wg44ul+E6WiDw+AU4u0U=;
        b=xFt8ZaNLCXcAFdfBCIkIEQQGvtAy+PrdTQPeqMct3bEPpm72E87Nf5OoWrS9/BFjp5
         Yva2njkplM7ckE2gTmEWZ6w1LIXSEcu2rmL/j4Qlrg1MPj8DyYGA9U0248mKwFjcGQtk
         A4ORVyW+rU2Dr9VtmOgXlaa1TWH1muMe/iwcDMh/K3CYDQT4Zj5CoFIPNcMEZ+XMOtNa
         iMtkeaZC/yDAZZ34EUx3nZl34fbXrbJice2oHlgX720M35iG+Q/XpIUnYJYhKMNecvep
         7dgour3OKKgZe37gnIBkvCnhtyU0nh4vBSPO7Ac1M+Qb39lz9QnZym0O5QoFddIrgNlB
         arew==
X-Forwarded-Encrypted: i=1; AJvYcCVQT6OY5cSRBUrM+TcCtGTb3dS4kOFkJYmjZUJm/Tsr+OX11wlmFCI98nJnASc98XnDOOGbX2nnG+vX9Pam+l6E@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4E1OwkOA9DGfmgSoziNyM+QFLYQHpD2Z1418RVct4inNMlsKn
	XGjodtmwGXnx7R9qTPY5ku326qd5A6+2oIbLlNVhNJxe48Sk2llTsmtv
X-Gm-Gg: AZuq6aLDDVcDNUSXxwgrx8FzRuEC8IxOfV0WRqmUiAECjlBsNmVY/jaMdIr6uyVHxHN
	LcRPapGyWTVqeVXVjhPO61bqdXFu/5XznFApZ4PgRvJdkODDIlmvCsewYmQHUouK5kf9IMrR61b
	jYHRc+6mWB+NEI72C9J2tJxqDFugkUT0qBs+nPT/fGLOnvjIVGVnT0GudWZKx8UsqjjAKYYwoL3
	Yu7R8JpgeQdhnt8kI5zyIPw2Wk+D/b3M6r6mu1042z6UfplcRowVyMkW3Ym8zznLlQ42OvU1K+8
	QDiE5pZ2VQdYxX9zlbKoTuahpZiR11SpwcsGv6iIslyKYo/iFYsKS/Y7DMYZ3R+FqfAjSub3VCg
	29qFfXPZH8PEXlDCsp5pC1Dw6lp4wdVsC8ChGrEA/9NctHthysRWzPDebCo1WeZkVIg9O75qhbz
	u75R1QE46/jrf7U7mn0/wwITMTuFbW309WlYOnq/UjjtcJLF4O
X-Received: by 2002:a17:903:2f85:b0:2ab:333:22e8 with SMTP id d9443c01a7336-2ab4cfbc6b7mr142195775ad.24.1771349068951;
        Tue, 17 Feb 2026 09:24:28 -0800 (PST)
Received: from LAPTOP-872M7T80.localdomain ([223.181.109.65])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2ad1a7145cbsm146880305ad.30.2026.02.17.09.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:24:28 -0800 (PST)
From: Akhila YS <akhilayalmati@gmail.com>
Subject: [PATCH 0/5] dt-bindings: Microchip/Atmel AT91/SAMA system
 peripherals: convert to YAML
Date: Tue, 17 Feb 2026 17:24:18 +0000
Message-Id: <20260217-arm-microchip-v1-0-ae5d907e10e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEKklGkC/x3MMQqAMAxA0auUzBbSoiJeRRxKjDZDq6QggvTuF
 sc3/P9CYRUuMJsXlG8pcuYG1xmgGPLBVrZm8OhHdH6yQZNNQnpSlMsSEg5uQN/zCK25lHd5/t+
 y1voBLIErF18AAAA=
X-Change-ID: 20260128-arm-microchip-c0c0515024e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Akhila YS <akhilayalmati@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_092430_439045_5EBD46BA 
X-CRM114-Status: UNSURE (   7.48  )
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
Akhila YS (5):
      dt-bindings: arm: microchip,sama7g5-chipid : convert to DT schema
      dt-bindings: arm: atmel,at91sam9260-pit: convert to DT schema
      dt-bindings: arm: microchip,sam9x60-pit64b : convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-st: convert to DT schema
      dt-bindings: arm: atmel,at91rm9200-sdramc: convert to DT schema

 .../bindings/arm/atmel,at91rm9200-sdramc.yaml      | 67 ++++++++++++++++++++
 .../bindings/arm/atmel,at91rm9200-st.yaml          | 65 ++++++++++++++++++++
 .../bindings/arm/atmel,at91sam9260-pit.yaml        | 49 +++++++++++++++
 .../devicetree/bindings/arm/atmel-sysregs.txt      | 48 ---------------
 .../bindings/arm/microchip,sam9x60-pit64b.yaml     | 71 ++++++++++++++++++++++
 .../bindings/arm/microchip,sama7g5-chipid.yaml     | 41 +++++++++++++
 6 files changed, 293 insertions(+), 48 deletions(-)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260128-arm-microchip-c0c0515024e6

Best regards,
-- 
Akhila YS <akhilayalmati@gmail.com>


