Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A23C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kzj0fk/cPMNrKTYV5MOF5u7NMggcty/MWwr6k4CAmao=; b=vjmsepMzJ7mJaq
	CwK3i4fU6vlG0vDp6piukbIHV1bcH2mAjG4kLT2lrT0+kD7ogneXmOYP3XsejD77zIKF/fRI0fpcR
	LxWf4JV0R4gFWN04rfmtYAiDV2rFSAxTA3e4gNGfmW+NH7EqDJ8+AeDvU+jEZ4mmmfPuD/FA9OQgv
	K7wOjrPnVS/n9ierBP5KdqtlMDTHhKgScb6SpK036YUbTqcXLlklx7vfiQqKmjp0D1jAWgC9S68s3
	F8cI3jGKZvirZI8o/IRcDER6P6q0IYLkZiDnVhMUh6o+GD8hE2GTkxjwIv5IfB/85ykKcOgivbfRW
	DDaXePVwc9psI3BsF2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqZG-0000000E0fx-3wMI;
	Thu, 23 Jul 2026 10:22:18 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqZC-0000000E0eV-3nZm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:22:17 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso714004a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1784802133; x=1785406933; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kzj0fk/cPMNrKTYV5MOF5u7NMggcty/MWwr6k4CAmao=;
        b=dAfD7SxqQs9MwuQaN0sZuJmxtuC1os6L3+IQuAEQ3Go/u3VGPDz22Pn2Jz8T3YXzcO
         q9RJorIn2M+zX8uLrSSPZALLFwMurEBUpk+E9dBC6IPLlIXRx9ml1EXc3KsmlIXteX7D
         lhnKtV/RG6TGznrhjZ/RP22p6ibEFPDVpO/TYt81PMCde3siulMnFwbnNHNIz2Dpd0q3
         IFJdIW/0QG0AVCf46iGDRGDmnoqJ3RYVYzL73zNid+8J3B9KnzHl/lMxZGto/j3yL+1+
         tnqkA98ZA5J+RG4Lfs5EnWH3VnBjmqIpcX+icKjelDXmhSqhgkXjq3rIIoYkbwP6GdP+
         pKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784802133; x=1785406933;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kzj0fk/cPMNrKTYV5MOF5u7NMggcty/MWwr6k4CAmao=;
        b=ImHJfYxVr0BB2MSzeefbUGFqVehL/5hGrapU7PZzZ+/BUxdpfC/90pbIa7G8JpaJIY
         YSfdzpKZQlRDmP8oXDNTaMwoSRTsnUPyw+bGflRExQOJR3tZk6PZh/ay+Db0erHMiEMf
         DvdLUFETsMHgEzFD5P9Y7kYubkPx5gvs7fmfWYysKGC+cD0FMJkeMLdps3no9p+L2eXh
         jUvqKRsUkOXCnoEnIiyoJSSqwVGm32bg6HSOXEWiWrd7qLRrIBHDv6MuSj2fZJPzafc1
         +Joe0QSemDXUtXKeTdMj+cSF4YUv3Nerb54P93pRFH/RjV5BAmoD9AJ0TY/7kiOnTE7M
         TLWg==
X-Forwarded-Encrypted: i=1; AHgh+Rokx4bQAnkoq0ZsWc3/MBxhAl3soubZaQABSHgZd4/2AqjFEM+gy30WkOy1KR2kpwMn4MB3BOE0ysotdvhJBjNC@lists.infradead.org
X-Gm-Message-State: AOJu0YwoBDYVqaR/oTcnbxazqbY3Jld5qSrcICyjjgfw6R20+bLKwu5k
	AYO356spvN0zU2+ePG3g2gf6/DD7dJw0DYauzTXKuOxpF0BTmO3XLaLkKF3FEjSVDoM=
X-Gm-Gg: AR+sD12CsV43Wb6SKZqCITjKIfjxqKEis2WiTtmg0m9gsmZAIbL4cH6HH4xMN/DR3P2
	5U54oyMEko1kebcDZpw3XWqFZ4EFNmp1jUorRudkCsqvGFZT6J5eU7tyXfT47Hqbww0sL/a2Flv
	R9lP10Ef6bmt9du6m6ED3W3qM/f+gxI4j5kZNoOQdg4E87ZX68cuR3V5qrCadrsa9+RxGVdtHHk
	swxwmjLPOfdi/7Ey2KWhJNo/gyrGBaoh9xjzc8gRs01YY4PqWvbJOmbNQD0xcOyOplvP26/rXjn
	f5ad51Uy30THC4+t3u6qAcfpdY2VWmwWzOvYmLno8uWPjCLtKwJqrl2HxygbYlfiRwp0f2x5DCt
	LQyavZTE/drsgW53BtHbGaTWvFsG6jqWy5rx4r9okjj772WPxhX2qyYopW081rGpolN+Hhdymkp
	GGOAsJ50CxNTk2ry0DsNYhpA==
X-Received: by 2002:a05:6402:360f:b0:698:4291:b85c with SMTP id 4fb4d7f45d1cf-69f6b62e844mr1014125a12.8.1784802132716;
        Thu, 23 Jul 2026 03:22:12 -0700 (PDT)
Received: from alchark-surface.localdomain ([193.32.126.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f35020dcfsm1944928a12.20.2026.07.23.03.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:22:12 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/2] Fix RK3576/RK3588 fractional PLL rate calculation
Date: Thu, 23 Jul 2026 14:21:57 +0400
Message-Id: <20260723-rk3588-fracpll-v2-0-3adfb9dda235@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2Rpa1BZO/ofhAGUrqwSaLRIN6
 b9b8OxhDi+ZebNCQCYMUGUrMC4UaBoTqEMGtm/GOwrqEoPK1SXXSgp+FmdjhOPG+mEQ7lRobTu
 Tl6aANPKMjt678Fb/OLzaB9p5s2yNnsI88Wd/XOTW+ytfpJCiVaZsndQ25eoG8h75OOIMdYzxC
 87QhPjAAAAA
X-Change-ID: 20260721-rk3588-fracpll-f4377cd80983
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Elaine Zhang <zhangqing@rock-chips.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Sugar Zhang <sugar.zhang@rock-chips.com>, YouMin Chen <cym@rock-chips.com>, 
 Wyon Bi <bivvy.bi@rock-chips.com>
Cc: Dragan Simic <dsimic@manjaro.org>, Liang Chen <cl@rock-chips.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=alchark@flipper.net;
 h=from:subject:message-id; bh=vnZAqLwPovH/ju9j2Cyh+UYxWO+gHOZuE8JwAskYk/k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQlvvZSt3l+8tDEaeF+5ZclWoXF4mTeHPNpu6nBsnjpi
 xfn3mTEd0xkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDV7RIMf7gCWNtZbgd/bo03N2560bkzYeHSyfVvQjtDO8y2xFuVCDAy7Ju+aX5
 2xjVn98mXPH5nlqbvvFez5/WkKznH/7yfL/9MnhMA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_032215_013704_31786B4E 
X-CRM114-Status: GOOD (  15.54  )
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

Fractional PLL rate recalculation for RK3576/RK3588 doesn't correspond to
what the hardware actually does due to two issues: wrong denominator for
the fractional component, and wrong signedness of the fractional
component. The result is the kernel-visible PLL rate being off by about
2 MHz for the two affected PLL rates vs. what the hardware produces.

While this fixes a real bug it's not a regression, as the issue was
introduced in the same commit that added the RK3576/RK3588 support.

Note that there is a separate unrelated issue with the rate table, namely
the 2256000000 Hz entry currently leads to a VCO frequency of 4512 MHz,
which is just above the TRM-stated maximum of 4500 MHz. Also multiple
entries in the table end up with Fvco < 3 GHz, which according to the
TRM leads to a PLL period jitter of +-2% vs. the +-1% for Fvco > 3 GHz.
To be revisited and optimized separately.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Changes in v2:
- Split out the denominator fix into its own patch (thanks Heiko)
- Reword the commit description for clarity (thanks Quentin and Sebastian)
- Add relevant clock derivation formulas and key constraints directly into
  a code comment for easier future reference
- Link to v1: https://patch.msgid.link/20260721-rk3588-fracpll-v1-1-b289bf17cf17@flipper.net

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Wyon Bi <bivvy.bi@rock-chips.com>
To: Finley Xiao <finley.xiao@rock-chips.com>
To: Liang Chen <cl@rock-chips.com>
To: YouMin Chen <cym@rock-chips.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Dragan Simic <dsimic@manjaro.org>

---
Alexey Charkov (2):
      clk: rockchip: pll: Fix the fractional part denominator on RK3588/RK3576
      clk: rockchip: Fractional PLL coefficient on RK3588/RK3576 is two's complement

 drivers/clk/rockchip/clk-pll.c    | 16 ++++++++++++----
 drivers/clk/rockchip/clk-rk3576.c |  4 ++--
 drivers/clk/rockchip/clk-rk3588.c |  4 ++--
 drivers/clk/rockchip/clk.h        |  8 ++++----
 4 files changed, 20 insertions(+), 12 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260721-rk3588-fracpll-f4377cd80983

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


