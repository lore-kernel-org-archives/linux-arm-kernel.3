Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0708606EEB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aHJBlIml;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bvIGDCoc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=; b=aHJBlIml+RLEVrqbTua9RZDokI
	N7digflfGScW6h3xv2uQwryIjWUkwxyS4hzgkOAh6E4tPoQOiHVF1KAOOspUruGi/K3Og69pdX7T6
	LVTtlz63Iyrmq9IW+ymaWtu54CYJgPgyf6Iqbn3klGQCwkqRpGKvmi8IJ2QmQlQiZ/E9WUzqAwD/E
	cW0zX2Bx3BBrWl+BowqqoKkrd9TFWnbAcihjtoEMu5It7ST0+hsspku/v/iFB1vJ/Ir+ocXOlC7Vy
	NJZCf0RUOvzdGJWmCAv7Y5QoS43huCwWdTIhYe0/mmfcOMvlvhlkPHPIZw3+lp5DnZex5EpbG90/2
	N4m4tr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLL-0000000BZhE-0J2L;
	Fri, 06 Nov 2026 08:30:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLH-0000000BZd0-36SH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso2083695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953833; x=1794558633; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=bvIGDCocZBX1Nkc9yZ9ZcONpngNo1ivdE/dbX1+zz3WbloE+6Nss723RjiWUy7L8j0
         XGBiO1CHUd7nDlld3U2R5HkKu6nqc3QExSucFKJCyK/b6r8g5Kb/Ney6aVTPFES+LO1L
         KmNffth9NO9yoWw/K8uzHpmf0BkcNUXeOw0q2IfFu91vlaBL9tUPkYokwuqby5M9zKtl
         a7FzJk9gY+Q2RJsPwWEPnAcV70bpkGu4iKNBbAMfJS9GQYm/0q95dRoDrGNEFQ9OcHPl
         ujWkkfJe2c2k2jHrgvjJgDEISIjMk0FE4heMz/+n8IEHE/cQBdOqmqKGGPtCgD7xFc26
         Kx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953833; x=1794558633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBvAlTqUUTVWwtpovytt9429b4fXz6tD1BdJt6T8kRk=;
        b=K6BaUlOTKHuA1mvTFpfzwzNjRYLNtYrsFt8aRDF9PpaEd7ceQxdHIU6U8ABrDbbabQ
         /rdLlvg3zq18MebPz/NMxzHtTW7wSs3MrGNeTpS+36nd1C+hmb34nPGAhmSayaJiRUDm
         u3nH+THTNMTuMJj/2okKnCEzhkBclCseiZd3I0HzONmyGhlvJSFC/nApaK+wL+R2pcRn
         iDLeu1JvIp1D16ufsT0q5wvbDbY5d9KJ9LAvzMZrqqRyLMdf8J5qAnzMy+kgWxEutLHf
         rstdYEN4f3ghBmPBGvLwrPReo9snnGtRoNYeJXvbw5R+j7UNPrjf0vDTId5lyGtUCIqF
         UyQg==
X-Forwarded-Encrypted: i=1; AKwUvBzb6FtvJyVaNnESToLHVS/1DQHYmZD/fkf5KZLUlARjMCzRXz03dUM+5BbEV3ipLClLGei1KpMK91hA76DK9PBL@lists.infradead.org
X-Gm-Message-State: APuU4Z8tKYlsHgEyJJbbCj/SfAtUWpoyzUnzIvbJDkjUqck7xizEFaFh
	l40O92qwBoeSxEMPf0I2NK9U22JfDD1TSh8zDxXsYEu20mZ6Sjg/BClpGeLAEY3GBwk=
X-Gm-Gg: AYBFou2rTP3riKQI3Buru8LfjZOK0bnv11dDJ+TG/xUoylcRRQ+yfeSaG7/gtStUHSi
	a+yhhUxkjMNJKmZQE3Fxhkm1l95ZMCG3TAXYoRkG3SRk2qwkz97tEYEUBu4eCDfiNKwal2wp4y0
	vqHFRLWugj21sf0lFwbsV41W8q77zaO2oMDsfRTqKfK4kuryCcS2efYLxYHmho0kXaMO+Mxrx8G
	07uH43HzWriwwgRrcTRw/+YdTaGuYdIZTsZ0DnGg4jx3u3rQKvPLAG9A8af8+uvnVYfJWTGCPW8
	XIcQhTFJ4dAXRKU7zCarOqJ3tX0GHLESsn358km1Iy7vzZa/vcLPmSZ297pJfN0gyOs0meLJkOh
	He/ecdYKoCNkX+KRS4i7Xmm9O4h0vdJAbejo7c7tgeB2vlEaTRDCnohqLRCtzKhuydjhXkL5nuz
	7Qn7YAY28fOa+tmRbxC6Nbft+DZelVpKX9Imgca7kasrGFVMta68WTVontXK80CISPm3pHwXZgX
	BLDlkuFtyeYOeXSktAuBJK6zsmdAs811tRrSJxIIqKwW/j4NVfqoMyzxEy8n8hb6ozALmmh9sho
	5YOXFAa2TkADf2OabGjh2wxrpo03nstBfcif8mv/3DzxAq/6+hBR1ZHiVgG4tD11UM9K/p8YqJG
	ZpDhTRnHs4sDMH8z/L5OCPCVKUDTZqTt1DgOi0xzGb9qhwEYu6RVKIa2P5oUFDVaOFto=
X-Received: by 2002:a05:600d:8408:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4b6f7374730mr17693885e9.13.1793953832731;
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:32 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/7] Add Amlogic S7 clock controllers
Date: Fri, 06 Nov 2026 09:30:23 +0100
Message-Id: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDINYtLSguKUpNzNUtNtdNzsnWNU5LSjVLMzY2MzVKUQLqKihKTcusAJs
 YHQvhF5cmZaUml4CMgaooSi0sBVpVAlVWWwsAYXNdmIgAAAA=
X-Change-ID: 20261026-upstream-s7-clk-3fbe6f33652d
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003035_836787_4612F6EA 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the clock controllers of the Amlogic S7 SoC family
(S905Y5, S805X3): the IDs of the clocks the firmware exposes over SCMI,
the PLL clock controller and the peripherals clock controller.

The peripherals controller is close to the S4 one. Two changes to the
common code come with the PLL controller: clk-pll handles PLLs without
a pre-divider and PLLs with an active-low reset, like the HDMI PLL.

The new clock headers are covered by MAINTAINERS once [1] is applied.

[1] https://lore.kernel.org/all/20261022-upstream-maintainers-clk-headers-v1-1-d09dd4db01d6@baylibre.com/

---
Carlo Caione (7):
      dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
      clk: meson: pll: Support PLLs without a pre-divider
      clk: meson: pll: Support active-low resets
      dt-bindings: clock: Add Amlogic S7 PLL clock controller
      clk: amlogic: Add S7 PLL clock controller driver
      dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      clk: amlogic: Add S7 peripherals clock controller driver

 .../clock/amlogic,s7-peripherals-clkc.yaml         |  126 ++
 .../bindings/clock/amlogic,s7-pll-clkc.yaml        |   73 +
 drivers/clk/meson/Kconfig                          |   30 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/clk-pll.c                        |   52 +-
 drivers/clk/meson/clk-pll.h                        |    1 +
 drivers/clk/meson/s7-peripherals.c                 | 2149 ++++++++++++++++++++
 drivers/clk/meson/s7-pll.c                         |  648 ++++++
 .../clock/amlogic,s7-peripherals-clkc.h            |  245 +++
 include/dt-bindings/clock/amlogic,s7-pll-clkc.h    |   42 +
 include/dt-bindings/clock/amlogic,s7-scmi-clkc.h   |   27 +
 11 files changed, 3380 insertions(+), 15 deletions(-)
---
base-commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb
change-id: 20261026-upstream-s7-clk-3fbe6f33652d

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


