Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7158C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 11:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7dkUGDPcIAQTUQFuAd1W5AUK3wwrA36JfPvoQmGdRDA=; b=39SvOzUZkCslW7CX/XbJD3mZ2a
	fzwugME/ETggxTv91gtGXLC0gUB0X+jKIYepXv62Wi2qUF/Ry/vWGDVCg0U5UNfC7rnH++ZcQY/9f
	cBcoL1Xy9dAagdyPMxsJwbKWOGFgUZR4p0nDtTE3wseW+twDnEpF5OgzygLs7XQBDlS8L8bu5ScDq
	pcOCkeVlWlJ3T/sFhaSjfeTKvAUF37VzLrA82quw6VTjsYSl98buXXEpH3hcuSKmQJetuvDX9IBxM
	TVvFKgG8F8s+Ni1ApgH5/7I95pCccGIEqnGZuNoP3H2on+TaR9GOjYMVgk+3NEqP5SDay9lwZJ38t
	VXgIH8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAc6-0000000B2j2-3Hpt;
	Sun, 23 Feb 2025 11:57:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAac-0000000B2U5-2U2O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 11:56:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43948021a45so30917775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 03:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740311764; x=1740916564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dkUGDPcIAQTUQFuAd1W5AUK3wwrA36JfPvoQmGdRDA=;
        b=XCfMKtg53F+aXfj1y1DUK4SeLDak78Jsgspvd+o82NFaFPFMYoSc7aAyQ8ifHTfp5V
         JI041UhRBdDzH9BoccI4b5gvNq0GegFdTjgrNFr/DUwuA6its9cRklf0RY9/Mgn5j2Tm
         I47mk9So3Z3DDmYDF+cOO6T2XMXFVgaRlIMBzMdxBL2h8jg6aSwSAKAZfu2fAtWmoLPQ
         pfMietMrwXHdbC9M6pr3Y7ptmwxzGJzObOvyuFa2ul8WJ4UulU3qv9cZksMD60muVL7G
         P0xE/eWRcmbyiiMPqv6E8y0AmRDdqWP44+luWq+62uNyM2pBUOB7uHvCnmE7RPXTlbpz
         6p9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740311764; x=1740916564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dkUGDPcIAQTUQFuAd1W5AUK3wwrA36JfPvoQmGdRDA=;
        b=dYOuwAVVJSgAIxPxOoHpTTBlc1Ec8vcwz1c2tSWQ9nHQPiTNgEY7Es2nsyg0pe20ZK
         MN2NqIhukuvVCKczJxgEoA9BSoLXI6eNC/+F/00KdWG4hH+D5LsotBRr90ZDBlVyRzj3
         VCr47kkUWZRKI2vQOOiHlU8ODjFkexpkH1lju70oC/918PUqng1XvDoWJykiU/vLmSR3
         BxnBWEWEFb2Q5GdFfkw4WzCE0JP0nEQdvDu63b0xKa2Ndk0jldMZ7DjluY5LeYqUnpte
         SyXoVwqgTQLVZxut6RVNJi+8l0XvpxQtxNd7Gf+NdchSKOkd++5Co2bAADBv/FUFfzXH
         uADg==
X-Gm-Message-State: AOJu0YxGEEwYwkJppFLI2t47Jog0yYl7hHRkcHNlO/gAg6iucB+2xuIZ
	JrG4z52wyuv5+SFuVWJV9GAXiT/D8kik6S3yEV/5dqf1FsiVA0nZAuxm1Q==
X-Gm-Gg: ASbGncuil3XEpea8/MQdYpUrmDmrjPckpv+c/lWw+nMFW9frMpQPrKQiS4fSEB0YGo7
	8ftA5zkhRds4wFK32VD6kel/bSm12PRHx3aVVVbYaWfvOPeG9lO8F/pXENd8puu5Zia7uzJsiAq
	jsS9kdH6ZwSAYTJOu6vHQMr8Icf//l/K0SV9W2ZbUWeT1neVH+yyNiRENTgMexqKnqXm1uM2sti
	cSNGy0sQnDQkPInJWvYhhU2YcZqnTzkQRI2c7lPdDi6c1EM7QW4TA1mfyCnU3gNeinJj2VzbBE7
	ap3/Lk/9fLcZC4u9hSlS8xTO1E96MPJi4HQ/nMqhTDNcs7Io8Aje9Heq8Acy5cTKfATzdKTl+6s
	KVg==
X-Google-Smtp-Source: AGHT+IEBJelpxytybvAH4wRvYLIonv1gCa21WDU2Fk0ndy08HF7fSvxqOW4VcU4PB5k6if1vcmxENw==
X-Received: by 2002:a05:600c:1396:b0:439:6d7c:48fd with SMTP id 5b1f17b1804b1-439ae1d877dmr81819005e9.4.1740311764104;
        Sun, 23 Feb 2025 03:56:04 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8e62sm28861189f8f.71.2025.02.23.03.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 03:56:03 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] clk: samsung: introduce Exynos2200 clock driver
Date: Sun, 23 Feb 2025 13:55:57 +0200
Message-ID: <20250223115601.723886-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_035606_632104_FB6B0C09 
X-CRM114-Status: GOOD (  11.67  )
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

Hey folks,

This patchset introduces clock driver support for Exynos 2200.

It's modelled to take advantage of hwacg (hardware auto-clock gating).
This means gates are not defined, so that hwacg takes care of the
gating, which leads to a smaller and simpler clock driver design.

Gate register definitions are left so that they're documented and
in case a gate needs to be forcefully left open in the future, we
won't have to define the register.

Bindings have been tested appropriately:
$ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j4 dt_binding_check DT_SCHEMA_FILES="Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml"
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.example.dts
  DTC [C] Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.example.dtb

Best regards,
Ivaylo

Changes in v2:
 - unify binding and header name with compatible

Ivaylo Ivanov (3):
  dt-bindings: clock: add Exynos2200 SoC
  clk: samsung: clk-pll: add support for pll_4311
  clk: samsung: introduce Exynos2200 clock driver

 .../clock/samsung,exynos2200-cmu.yaml         |  247 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos2200.c          | 3928 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |    1 +
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../clock/samsung,exynos2200-cmu.h            |  431 ++
 6 files changed, 4609 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h

-- 
2.43.0


