Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD89C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QbOV3QZD0GW4oDlvtbd47RUfYokiKQ6TvK1Q7vUQ2Os=; b=IahPZBJbzC8/dA0w8Pg4PBK9Nl
	wMuk0LYADVTSgrg1iwdvJp33BDr6lCE41itBX4QEqAqVKXXQAk/3rcSHarTPVAIo1yNM76kdRCt6K
	Zeo/5aN+wtRqmugSPE+B7er4VGwwbHYbh8Xla/xiDTPGp2JnYT9smwbUH+9979osySPwiNqmZqiNw
	/kdxSzRbLMa0yO38ZAEEoyTyW5HRQSM/aII403plvCZ2dJmTuAsYRIx1HLhvF+qUm9hcRprCwcvew
	mZXKyRXifdd3KYp+Pcj9ImPdjQAwgbl1BVqkE1kmi+H1uA4WbbLd8xsXcPE3Vdn7qMIRIJWh7uRYq
	7LOJFhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixem-0000000Awy6-3sOE;
	Mon, 04 Aug 2025 16:03:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixWl-0000000Atd0-1EqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-af96fba3b37so170540666b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322905; x=1754927705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QbOV3QZD0GW4oDlvtbd47RUfYokiKQ6TvK1Q7vUQ2Os=;
        b=kPL/SkhIMO+qw1nAk9PvbQTAo+0xpygmVUIGCQ13sJ/beYjxmioAYkCPPw0abncWU+
         yzqPRLMBeR9AAT+IKpqNMoCmxLcu5J9ifgXniKUeFCIC0+3fnqlwzyjDzJogIzIYG7Ol
         dgORKM5UvOdVXYLlyNmgtzJh9FFTnnYt1nQ9HRA+f1kM4JOHm9+Fe9tFGUYVU/QIg8YC
         abRfWZAOx2aQz/q57PPYqrjDO0Isbe71jvEZW8gKRltS+h04xxJ5TOHBuS8d8I2clGS2
         LOgI/XWERvXUx5MeUQYrtemcCH3I/GV6IVRz6I20Mh1iEw4yx1x5fDH0fkGuwZLwb1Pr
         FbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322905; x=1754927705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QbOV3QZD0GW4oDlvtbd47RUfYokiKQ6TvK1Q7vUQ2Os=;
        b=qkIYk2Fkxc14TPj2tCR524hOY89j80LgDDaPbUuE2s+mxDYBY4/VS2M4GL24Gi80IW
         qZqB5kZClTLfIkufi2JbKeish4jedk58SgQwvuEw2KZ84qZB9RpovYVW/G51hECjlcdh
         kICws4P2h7tLeNDHUNPOjUOPEr+rt7LdXhjDL+02yHULqRuSuM83jLuXChZPzcPmGVhQ
         5qKy3iXrOVVbBZDuXAAsKyVNXdWDhRWn9YdaIzMJyTfNjLONwHIlW4aCn81a/PJNc92q
         /8ht9cOYIoEeBzo9L8NJikP1zSVIQdtdMdFYChvBMTmZkzWPSUUxpp2rbscqz3PAMBmd
         721w==
X-Forwarded-Encrypted: i=1; AJvYcCUcCEDNAzq9XpGRfHlNYee4EKRCaH9l3ZERMbnCkWF7qB1o5lGYSANtwyNbMWPMW2maoNg3hrY0qL6uIKAZcgdD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1PORTZNaMZWkKrwGG2YwOB60tAeOhJc3Gc+VOgBklOIMDhKj5
	vTgkq7cqA/7Eo0of9N3DnJx9k3RJN1u4/ypPYxp7qgXK/N7pyyhcKuAo
X-Gm-Gg: ASbGncutd7Q1i9aPrFhGvd+Oc+uy+e939Iadc4KNeaEQKjh9gvWMk4EzVULOIZLNCZx
	tc2MeRPbgU42HA72hJAUf6cY773iYqk+f6fP13f5qjxI93s3jE0+Zw8a12FwnQb3ra62u18x0uG
	sdBflFeaVARi7H72qlne7AroLMVkOmVpbc707xFis5bpYc1tfM46ZqDiNK9bTHKp7WxrPySksAn
	zM49ks04GjYNk6lpv+lshIk5vlahmz7lYO7lgeB1l0KYpwHGXfbKgWgcIfvDmUbmo2OMMCdHgXx
	Z5inDzQhqdNqenL41YnBZUZJgqY6JFQIrgKQpIKyrEKDPSEGqJi7wjaYp6Oy56zRe87ErpS6f62
	jgAygoaM27/496bsZCwrKukiYx6Fp1gOvTV4B1/wDUi2ZH/uUu5I+HH+ZJ6g=
X-Google-Smtp-Source: AGHT+IHyIOC79MxZuaH2TPvpwT3MuiubkEYDKGpSHW/WfHAFoajW6vgxXCNDRLPV71q+6lpnE/9g4Q==
X-Received: by 2002:a17:906:c147:b0:ae3:caba:2c07 with SMTP id a640c23a62f3a-af9400220ccmr1004902066b.18.1754322905163;
        Mon, 04 Aug 2025 08:55:05 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/7] Add support for i.MX8ULP's SIM LPAV
Date: Mon,  4 Aug 2025 11:54:00 -0400
Message-Id: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085507_343437_4A61F2CD 
X-CRM114-Status: GOOD (  14.85  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
LPAV subsystem, which offers clock gating, reset line
assertion/de-assertion, and various other misc. options.

This series adds support for the IP by introducing a new clock HW provider
driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
allow it to be used for i.MX8ULP's SIM LPAV as well. Since the IP also has
MUX-ing capabilities, the DT node is marked as a syscon, therefore
allowing the usage of the MMIO MUX driver.

This series is a spin-off from [1].

[1]: https://lore.kernel.org/lkml/20240922174225.75948-1-laurentiumihalcea111@gmail.com/

Laurentiu Mihalcea (7):
  dt-bindings: reset: imx8ulp: add SIM LPAV reset ID definitions
  dt-bindings: clock: imx8ulp: add SIM LPAV clock gate ID definitions
  dt-bindings: clock: document 8ULP's SIM LPAV
  clk: imx: add driver for imx8ulp's sim lpav
  reset: imx8mp-audiomix: Extend the driver usage
  reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
  arm64: dts: imx8ulp: add sim lpav node

 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  |  69 ++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  11 ++
 drivers/clk/imx/Makefile                      |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c        | 162 ++++++++++++++++++
 drivers/reset/reset-imx8mp-audiomix.c         |  63 ++++++-
 include/dt-bindings/clock/imx8ulp-clock.h     |   7 +
 .../reset/imx8ulp-reset-sim-lpav.h            |  16 ++
 7 files changed, 327 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c
 create mode 100644 include/dt-bindings/reset/imx8ulp-reset-sim-lpav.h

-- 
2.34.1


