Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7203BC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 14:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7wrnpvlRo7ZrS4SCXZw5XRzZPMOW57pJM9b/u98SiOg=; b=kpxm+Xd6yqiNN84zUL4hej5l8Q
	D7mx9p5HNGUYHwPlsKP5y4xbO+zZ1LYG5glUOLg0iXaMKHheV+bxTky2bTT1BZow9T0CchJzEFb5U
	CRl6A95Ngcn4jhbeOcVO6kfwzM7vzgRzW0RIiC6nv2nB2HtoIqOvMj95V76uTHThNvCm53iJzM2l2
	qyoD72MSdFgb0iN2wcAKWiM74NsHdL0LDbWEtCi3cKUffYGXldUV28eeP0bd7Pse0s3HJspJI9BId
	5LKPPgIsIWhS9+S4papWJJ5DiLtGJbrBZXsAQlhE5OQ7/X4+Afh4wSPPSmp60HwvGwsW3XzKARCbe
	LgbhLFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnFx-0000000BrQP-42Bi;
	Thu, 26 Jun 2025 14:07:13 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnDf-0000000BqxK-2hsV;
	Thu, 26 Jun 2025 14:04:52 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ae0df6f5758so70591666b.0;
        Thu, 26 Jun 2025 07:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750946689; x=1751551489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7wrnpvlRo7ZrS4SCXZw5XRzZPMOW57pJM9b/u98SiOg=;
        b=SSYb2IIfL8eeYO6JVQ3NL2/g7PkwtwPFa20s67mDvHgL7usBLM/m41k2QzggxNfLNn
         8yDr5jwMcNK631ptIxo3Hp5/RrZyOTmQmhOY/IhxmSDYU7yOoP78mFXrHDiAn5c1T40P
         LAu3LiDijU/aLziIvuxWQuS7NAgDQlGo1ozVP1tDuhDQPwzIMi8nHWfbt+uNvJNdwD9Q
         XqeCnzxNgQ4qRKG+K/D7WBvLFQky+nbxJMX4JuGINrJGm/U69+e0Z01yKYuuGw+wk8H5
         +IXLoq80Rwj4SWlJWbc/McEnoK0BCSXy6XxCVqEMTOUuWYY3r0JCBRAmBnGHoEIWpyCw
         x/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750946689; x=1751551489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wrnpvlRo7ZrS4SCXZw5XRzZPMOW57pJM9b/u98SiOg=;
        b=thWyZUwdxnOd4ZO9iVaX4IHey5hSPMegRzBLS/l/mqDKEC1dKHNDqgFCr87t0/pFjA
         g10H8M9XqzbibKuYyrK0JZ8NhIKjfrGE1KIila2pVU7Ibd+ZXFXXXaIxjJhEyz1bngNU
         vcoZKBGB2+tgK/syB4RKEWMDEoxKFrhdhIHnR8yJBQ0Ky9hZd1yPWWDahylNNukMZrrH
         2STugkzDOet6QNEwJ5lUTFoXJ0Z6tzFKtxJyS990GHbVUMq7y0pMd9bsBoVlRCAQLKHZ
         pZj3nzFEB7iY5QrFtSCJSt0spY+R/hUwBggmgNxQzvHLyNWCjxSQ1nLoqhsxCOhHQFA4
         kpXw==
X-Forwarded-Encrypted: i=1; AJvYcCW+ToRfCTDQTnd8/cIwSsm+mMok8ZCp/zkmDksO+w9W9r9fxwHRvGzo3h8xsCCT11Tu6Hif9NBo0huLPzAWRizO@lists.infradead.org
X-Gm-Message-State: AOJu0YxtgVca41JZ9PueV6EaZ8PJ0PNet/nMKIZUyNhv9Nj6zOU1l+wP
	9gZ8LngUu44C1EGWsX0fbaxMKvR3vgbk3iQ9UMypNc7+6Ir6mG3mD4ePvwpt70rWbDVwYw==
X-Gm-Gg: ASbGnctdkxuKFV4UWwQ2NRe7aMRnkG6R0m/P73TSYssn16K+uoZFAi6/zCmZaq9FemE
	14k6bpQm2cJ++34gPP8HpTLv315tjqjo7Cbdz7p7iv1xQoXQkpPl5lTPZjHtz/dO72ofUIfOH9W
	CG2kLmeNe+7JklVacsI5yLMSRLdl3yO+CrTI8YQRcxhS4SMAv582Qyqzr00fGksatC3HURlbsW+
	xDLQYA/Yvh1XyncuJXmZtcyV5FNZqZOc33N5za5YkPBjW1L9RUJvzUE7CK6kGmpIxsuCLWhtDGt
	deA6F+oShVSsQhlrbEFQe/GymmVUoSf0+gj0sKQSigADVlvASXBZNyLldcFwRDozZGj5d0IEjP/
	f+BP5jVsEMt/E6YBqMgHdEA==
X-Google-Smtp-Source: AGHT+IHgNpaXb9XxhY9t9BM84ENlKwWGN7WwcauV0meDMTnYk2b4LuOUVV7KJXeM9LLAWq4Jo/qbgA==
X-Received: by 2002:a17:906:478d:b0:add:f0a2:d5d8 with SMTP id a640c23a62f3a-ae0be7fc1bemr729925366b.11.1750946688831;
        Thu, 26 Jun 2025 07:04:48 -0700 (PDT)
Received: from localhost.localdomain ([176.227.88.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae2143d928dsm3958266b.107.2025.06.26.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:04:48 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH 0/5] Add Khadas MCU and fan control support for Khadas Edge 2
Date: Thu, 26 Jun 2025 17:04:27 +0300
Message-ID: <cover.1746518265.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_070451_681327_9ED8055D 
X-CRM114-Status: GOOD (  11.64  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

This patch series adds support for the Khadas MCU and fan control for Khadas Edge 2 board.

The first patch updates devicetree bindings for new cooling-levels property.
The second mfd patch removes unused nvmem code.
The third patch adds the Khadas Edge 2 registers to the mfd driver.
The fourth patch adds support for Khadas Edge 2's new fan control registers to MCU thermal driver and the last one adds the Khadas Edge 2 device tree node for the MCU and fan control.
And the final patch adds the Khadas Edge 2 device tree node for the MCU and fan control.

Muhammed Efe Cetin (5):
  dt-bindings: mfd: khadas-mcu: add cooling-levels property
  mfd: khadas-mcu: drop unused nvmem code
  mfd: khadas-mcu: add Khadas Edge 2 registers
  thermal: khadas_mcu_fan: add support for Khadas Edge 2
  arm64: dts: rockchip: add Khadas MCU and fan control nodes

 .../devicetree/bindings/mfd/khadas,mcu.yaml   |  9 ++-
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 59 ++++++++++++++
 drivers/mfd/khadas-mcu.c                      | 19 ++---
 drivers/thermal/khadas_mcu_fan.c              | 76 ++++++++++++++++++-
 include/linux/mfd/khadas-mcu.h                | 25 ++++++
 5 files changed, 170 insertions(+), 18 deletions(-)

-- 
2.49.0


