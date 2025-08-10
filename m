Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E618C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 12:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L4RjcnrIZ+W5L3kUceF7GfLbbqAQQYw2hpKEnRdHMMA=; b=DJAHxpim+Il9tTl4F+1Fc7MsjT
	eB/msGukWoZ0QTVZsoN4GdM9o9EW4ZuudJisEqa7pe8jWBgpfN2ixf0m2hH6k+rp54I/f+CHTerTA
	hTODRJJ9XF42qUtq/wHT7rQcqL8QO21nCdNyV7F1RQP3F0NUsRueoifX23pTp1Pno9mlHQ4tA1NTn
	5oobPWQ9v1X4M77b/xt0a/UkXxszL+9u+BxWdzq4BM0YykeWsoIGzEanehBJVVqngJXKdKP3/BoS1
	QCKeNbtaF2Wl6I896CpE5rvXrSEXf9hr2aPMYNPVZvJ/75QyOGa45vDDnPR4JOnVOgsZlE/0rvAxG
	Hjsem8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul560-00000005aJq-3iaK;
	Sun, 10 Aug 2025 12:24:16 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul53U-00000005a2T-2mQk
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Aug 2025 12:21:42 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so2137696a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Aug 2025 05:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828499; x=1755433299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4RjcnrIZ+W5L3kUceF7GfLbbqAQQYw2hpKEnRdHMMA=;
        b=N0X5rMftYd+xNkrFIb5wgZIYvQGb8iIVAIrez0mH6uWIxqAE51dy2H6dRYFyVSUE4J
         NT2nmtXe0fO60uVR6dZqJEeSVJvPL61SzdNdC4uTWW4sZUX2a2f89VwE9ToxdGu6GkPQ
         9yoVOL4kPloYSdGrxZpp+mzYHVBdlTM81nzw7LX3k3lkPqe19qvUpfQt35iYT0UDHRwv
         fMuxiRmAPo3UrIvqAtKX+2+MObSTHvdPPuzCIA7wY7BEehYuBG5ICABPEnl7v+zSzOv0
         7eVvAjAo+isgX3Sp3evwp06u9Xm5jiH1CUDQZST1z2LSmoj+FGYmgfiSX7sVogRmnnDW
         HoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828499; x=1755433299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4RjcnrIZ+W5L3kUceF7GfLbbqAQQYw2hpKEnRdHMMA=;
        b=fIUpW9klCHekT573ILAnXuTxg9ptn3jaHREzcO02UzcHdqi9rHq4lhXU3RAaD6fUc8
         xbA5nCM8G2etzY8g463h14XHAcwuoDyluE/Gw6d4miyVt45yQrxAlpcLrPGVv+sKox1P
         T0U7cKDwkUuNT69ucMoPE/ZZOFfj2+ksCuV8kgoUCBG3X/0hijCx3eV592oF0wIdEzKB
         qUPPEJ6gLfppvHq9/zZbpWO+bTEDczZtIer73LlTa85jbBE5BJygQW9uelY4tB9jmPim
         PVLXmy5WcZNJn7mtdXm4VrP94i4k57FKjp5UJQZjTqxe7Mv7APq8oVL4eecWLNrRZzlM
         qSlA==
X-Forwarded-Encrypted: i=1; AJvYcCVRYhR7fCyuBug4L61bO/7Kvdwo6dWsSt6CrbfTsmcGTu2eP6PkgB5GgPRpWfHMJUgqBcYbJ0xZbu4ZYS/wvPL3@lists.infradead.org
X-Gm-Message-State: AOJu0YzXSVygmEqmqxX0pymwEnJrRwIDuzcRfGGwpz7ddJiAeBgXyqUt
	7OJ83DZkuSHUwq00eVUD3dWGAX7rXy2hEIs7s7unul8wzPyTRLUPC/bCSih9cCzZ2kE=
X-Gm-Gg: ASbGncsC3Ie+eBhDOyAPxOZI+FeITMwQ4fHsB5sdMi5+TxQrPWxaDgMINSf0clV/497
	e2utQ7kUYMYfRdJsnpBUa/2CNaHPApN4eYjfTQD21IuX687rwMnBY5GUrYwXcP9SbBekIEMN1jo
	3lzdm8+fyikcefk43oWymfgYypRadXcNLjn8hPeRyfwiE1FtjEynLPqAp0ODRPrVK49gAfwGSKp
	2eKyws3xwqtGmEUj2t4RECSFyX7asQiHXKr1OrIQZIaeTvBdnCQcH549Ogz+z8UCko8HJwZsQra
	d8fI6cnA1BjXkfMCBJlh+xjTU2tKiu8Jg002IJEFTMBm8EJpp/icz5bRObV+Bep238cyBsxpNWW
	IX2wA8rts7GSPq8WEMmmxyoNOBtHYacI9g5ErnHo8hv7wH0+IBJGp
X-Google-Smtp-Source: AGHT+IFSeAF9Fk04n1puF8WCTjGoIhixSoOG8oLkqqtM+6CY0pS9xTvj6pKvC1KxF2I94fi8T7M8qw==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-617e2e5311dmr8217507a12.19.1754828498757;
        Sun, 10 Aug 2025 05:21:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:37 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/4] thermal: renesas: Add support for RZ/G3S
Date: Sun, 10 Aug 2025 15:21:21 +0300
Message-ID: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_052140_767940_8B95802F 
X-CRM114-Status: GOOD (  17.20  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

This series adds thermal support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patches 1-2/4:	add thermal support for RZ/G3S
- patches 3-4/5:	add device tree support

Merge strategy, if any:
- patches 1-2/4 can go through the thermal tree
- patches 3-4/4 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- dropped devres group
- fixed compilation error on arm32
- use div_s64()
- dropped pm_runtime_mark_last_busy()

Changes in v3:
- drop runtime resume/suspend from the temperature reading function;
  this is not needed as the temperature is read with ADC; this is
  confirmed by the HW team
- use dedicated function to open the devres group in probe; in this
  way the thermal probe code is simpler

Changes in v2:
- dropped the already applied patches
- dropped patch 2/6 from v1 as the devres_open_group()/devres_release_group()
  approach was implemented in this version (similar to what was proposed in
  [1])
- collected tags
- added a passive trip point not bound to any cooling device, as proposed
  in the review process
- decreased the trip points temperature
- convert the temperature to mili degree Celsius before applying the
  computation formula to avoid losing precision
- use int variables (instead of unsigned) for temperature computation

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (4):
  dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
  thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add TSU node
  arm64: defconfig: Enable RZ/G3S thermal

 .../thermal/renesas,r9a08g045-tsu.yaml        |  93 ++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  49 +++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 272 ++++++++++++++++++
 8 files changed, 430 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


