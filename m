Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BF6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z12n6pwBuO+Lp/RU6Y/RGTOaXGSjqsnsbDrc/bXr6NI=; b=ZOYR7XtWxE3Hc8s+y1qpyeXxKS
	G1ffOF/iY/yPnkxddHmD/cL62sPC00/sHl6yt0PRMnAVsgTmqp5LHn+hh5WJSbqTeSYEw8yrKKOsv
	hYrsfj2asziZqc+9M79oJ+F+aw5aOiVtc0rhLKmQPf7wQypv/Zbjzr1lJ592eALodBOSK8tYw7QTU
	TdBfchA/aYyCrCDHZW46avN2Z4nn+WcJhdO/huSH2kYjvzRia2gXIIXka9STv5kfdI/vXCJ/cxoIJ
	Aj1EM2CmiyFRG+CuvuxQYjXlTs9/6vSuayu+bI7wPWNDeF0csGQmqn8kG4UfPT+0KX/5HfEWlHEJo
	cO3qFYXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTki9-0000000DS8n-2mHB;
	Fri, 03 Jan 2025 16:39:45 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTkgw-0000000DRrP-3UiU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 16:38:32 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aab925654d9so2160246166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jan 2025 08:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1735922308; x=1736527108; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z12n6pwBuO+Lp/RU6Y/RGTOaXGSjqsnsbDrc/bXr6NI=;
        b=biKstf2Nffeo6Az6f7ckWmaJegwXsH8lzmQ86xKnzTRMM9stY6kr5ELBQmJGrNP4iB
         IFu5YtVIRJuDZdZe8kP8a8zR3Xmwy2gKTWL49lN8PeWcEhfknmLOxvuVTJGYhZeZn+mk
         j4gTgnXWTTRoDYn+cUf/r/oiNw8zEFSyVPTnLtFyKimKLEFuhA7YSBy4bQXVeHRhLf//
         Z8BNEaTjsBQ6oDtilePCAwKLy/SOB8gkCB/2yqkSs4W6zEpy38y5eB7s5gemXjgo7+xn
         j0N8r9BTOIt/jd2P5YrLwNcL2AIo3neZ3gATFEEQippUJpWscSqy7RDG7QbjAYbyV13Q
         8bEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735922308; x=1736527108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z12n6pwBuO+Lp/RU6Y/RGTOaXGSjqsnsbDrc/bXr6NI=;
        b=Aw6sy0Y/6kxsiSNfRcNUYd595fX+PwTuSts1bs0srjrNSJb1kjiWuln8F5mqyJjobf
         sIOIno7RB2P4SuE0eQYlPQO3bCV0nWxA5vbZT0ugdKH/iYHJjzpUVaFLiXHyiz+BocJh
         W0jdG7H3ABPXtgOuT4lU5q6l8hjJDsvtUMntUn5JYGNip6xSFFtrog6EZw7XbkjThVwL
         4djvkXNBYCbGwTqANLNWuNrWLN/aPHcejEUlNCvEFmKfSgnv6lP9k3EvDPo7JjyQMUWM
         Qp2hGIJVnH/B5Fd2fW3NZ1p7OmCYjrG3ysXDv7o63Clsz+QGzLpPU8YnLYXxGGplZ8eJ
         iixA==
X-Forwarded-Encrypted: i=1; AJvYcCWpDpg1nGvpWeOZB1C3jBxxpyGZa+S7SYUXXsCFuu+ErHBrfvEK0s5LoODrGGtSSbT/lGSQLJkpYgd5GyA4c12m@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1e4YG67vTZq1xig2TUjf0KuClk5rvjXnm5era1rlZnkMWtt2W
	pfs1l3ceE7odEZDK995I2kpYp8V26NROknNbeXM0rv3EGB2REfqSys4quTZVzJE=
X-Gm-Gg: ASbGncvt9dItNHyi9GtZwpzLt8sG5i3XWQKpwk7gcV2m8C8o+Ye9aRjFaGPeL2HqNGT
	yORCN83M+EwkoOxLqPSfFDsAgtWhGRnGACKl5UyJNKIByajZ9jf7toPnttN0ZlFRBWhP9hmLHdE
	kE7IY7ZWW47dzR8qILh8RQH7Rq2XvYG80byOoWdh4YMM7fMYo900jcYynUHz/E3scf+TduY1Bk3
	cMSYgJIAPmQUY/pqjXQMFUHr9VWxUqOQ7ByrynPpa38nC6v5WWouX7RJqdHHvvGVwtH7vLgyMUJ
	TG2nx4m2NYE=
X-Google-Smtp-Source: AGHT+IHvB3jSYSwVEdM8kpizh++WgojhHChTKlXDXhzjvg/G2jGnSPtOR2X4YibeMuE1jT2+Wk3xTg==
X-Received: by 2002:a17:907:7dab:b0:aa6:98c9:aadc with SMTP id a640c23a62f3a-aac2d45fb01mr4593376466b.31.1735922308221;
        Fri, 03 Jan 2025 08:38:28 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e8953b6sm1932984066b.65.2025.01.03.08.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 08:38:27 -0800 (PST)
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
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	ulf.hansson@linaro.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/6] thermal: renesas: Add support for RZ/G3S
Date: Fri,  3 Jan 2025 18:37:59 +0200
Message-ID: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_083831_169192_1B17E960 
X-CRM114-Status: GOOD (  14.11  )
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
- patch 1/6:		adds clock, resets and power domain support for
			the thermal sensor unit (TSU)
- patch 2/6:		adds support for non-devres thermal zone
			register/unregister 
- patches 3-4/6:	add thermal support for RZ/G3S
- patches 5-6/6:	add device tree support

Merge strategy, if any:
- patch 1/6 can go through the Renesas tree
- patches 2-4/6 can go through the thermal tree
- patches 5-6/6 can go through the Renesas tree

Ulf,

I've added you to this thread as well due to patch 2/6 that has a similar
root cause as [1].

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20250103140042.1619703-2-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (6):
  clk: renesas: r9a08g045: Add clocks, resets and power domain support
    for the TSU IP
  thermal: of: Export non-devres helper to register/unregister thermal
    zone
  dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
  thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add TSU node
  arm64: defconfig: Enable RZ/G3S thermal

 .../thermal/renesas,r9a08g045-tsu.yaml        |  93 ++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  43 ++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   4 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 301 ++++++++++++++++++
 drivers/thermal/thermal_of.c                  |   8 +-
 include/linux/thermal.h                       |  14 +
 11 files changed, 476 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


