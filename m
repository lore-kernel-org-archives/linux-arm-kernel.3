Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF68CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 11:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=; b=I2UsCRiXpiLrYq
	VzL5HarsRnG9WqxVYd+iQoAL4K29+oylIXmJ3ag6QLdawlh0EYhfOO59zC4YOg2elBnKNtZ6qPPCG
	xS1hynkFvjbuyEBK90xaOP+GTty5IYPGQTS8eZ6L5VAdj+eO1v3q1BxBDjKlJcgbkbujx9KBcwFfN
	uFRRAxVrWKuYddWDwh7hzgwt51i0AFyk28hJcI/SZ+vK0Quoo7/x1DVqC6l6dGVeZ/9NPpY27oxut
	3CvyxKMsxSiffe7vyYm/0fk+yACZeMVlPLZjVocKihtT5JoHW4Dw0KaN7mzmkXzwhbi95p74UNzmB
	Y5ceTNcUAKoVH2RAIg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab6-00000000eNb-3OXy;
	Wed, 06 May 2026 11:39:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab6-00000000eN3-0Nem
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:39:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43d73352cf2so5781700f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067562; x=1778672362; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=;
        b=wkqQ+IwJzgvsM4cIfRkWfZCHyZgHfllpgz1FN+hdbAvBZns6ZIeOzM4kmHQF4y8DVV
         +PqhHj2FI2s1gJQjpObp40PSRL9wxkY+NnjitHi0ee9zx6j21oWc3mrC4ttj71/EEagS
         R+vLabNNDzqEI8NBQwmQXBOLl8yo9V0YZOy3VTFCobdxrq8l4BWtMZMTFmhItpA09gKL
         Ot3zIC5SDLWkX0lcK2BlwiimnU0uUNkcAF8JuVttRABbfND+C9sC2MHjkZWO+N3qlAW7
         +nqR0Qyu3PElKZb3U2/nTpoWjJfXqba6jk12Tm5LuqP8ldLgnGO+1HKK8z/fHS8700Kx
         IyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067562; x=1778672362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVj1fWCL5+lK+iedLmeQpkoKIZN4NJDvNvjAcGI6dJ4=;
        b=ndzTaPKx8DgK4+wj0UTyJ0tnKcc7f10pKcMTsGAOE4QCezmpDoEFtcqqOyTjL4rv8b
         s3Fb0fU6fzayZZ/C6hppx3QfgGwY6spZY2jLV+iiHxianiI/Ts1xUc3Yn0pqHTRpP+Jg
         bgtdOKnOVUmpkIb027hctQJQk7remdaCGzEkehwoSeYENWuG/BMzsTve6p2WBZzed9Jk
         lsF7OD0x895KyDVFLpFysjGUVk9RzR787Y+GjDyfRTEjhWA5zGPDCQvsysmjiwMmwx6G
         Ntd/VIxg1KZwBd5p2x35SM2rsT6nOo1nvWAJ5JEnD56rwl+33oBPPHKfzkiUyQpTG56e
         w+Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/JDavq2W75QlmRM8paRkoBUJlTqDj9Ue09J8HAg7qbegb4csGIE0zBmGihg02zUAT+C26BKPTQU22NexySANu7@lists.infradead.org
X-Gm-Message-State: AOJu0YwyKH/xuHuwW7GesghZJMEh6RSFH2CMkjGttxCkVPWCCayXew2V
	+NvqNhM+HLIEg5ZSBKeem4Jc4Jf0rMYbaUHjG1JI4Kevdp28jNEeANnVmHq9Vy1qCEA=
X-Gm-Gg: AeBDievNJnclSoI/El7Iy761ozMFc2xGzrLMx8zcfv6rvgjH/Y9IyNAuuHke4SN6Dcv
	BCsjIbBcgb3QT/+dUb7rmh0nNk6muxSsoYcYIIb4pI15TSbe+O+DXK8WRpOLgSsaYvUzyIj8Lud
	fRprozUYwp90flOrWYwmt9jyvH/NXI5gc7INtRkYuwaRxeDdI3Ybzkn7nlGQ0Sd9EKqrlViwnvg
	rSl8PWIoFMyruhzhe+VFqglP4Io9y+h6+KI9EKo4K5OIP0/yAhZqdvHw+vkxJV15eFlvF/v3F9h
	DsZpYvNN9uDJZHNQkwMZV//qFnDOO3JqnI3DgukcwekUXfzGJTPf5pLBT7LD3bD9I28Y1LjdL4W
	s4ObUldaxLGJdtOUojEUSaIrX9cfPRpV3nRYHeKX6unM+fK9HC33NDo9zK+4eFJsuRG30LriDat
	AFddN3QAKdbcA69NqpKvFDqStYTVpcB6Tuwg5/CYNSggtNNtvZxKtzHeTtfFjXZo0GqEa5mrs4y
	lnH/1wue2eR1Ie8yg==
X-Received: by 2002:a05:6000:22c4:b0:43d:1c21:ead5 with SMTP id ffacd0b85a97d-4515ce1c6bcmr5425016f8f.22.1778067561946;
        Wed, 06 May 2026 04:39:21 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:21 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/6] firmware: samsung: acpm: TMU support and cleanups
Date: Wed, 06 May 2026 11:39:02 +0000
Message-Id: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFYo+2kC/0XNQQ6DIBCF4asQ1p0GqKjhKo0LxLGSFqGAponx7
 qW66PKf5H2z0YTRYqKKbDTiapP1cwl+IdRMen4g2KE0FUzUTDIJ2gQH2S0w4StgTFAZqUeGYmS
 NoWUWIo72c5D37uyI76XI+Tz+YUUOthK3kz12kHSa7NNDxOBjTqBRtH2Ng5QtV6v8/eh1QjDeO
 ZsVWZsrh2g47fb9C9kMBjfQAAAA
X-Change-ID: 20260505-acpm-tmu-helpers-4c5af0e2f07c
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=3632;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=9wjIXq96Ye0zgM2I0ds4oYNVzLtE1yAQNKLV1EIU9V8=;
 b=r8xf8GxAIL1BdWW1vT0QMZLJ3de6b9Cpy9hf2Hon4GLaqnK6iD4XK7jpdzHllGv0zilynV9Wm
 nlU05KGBnMgAK9cl50FBjPbEhD8d5fkX9k59ZWvBPIxJDpcyysnx9mP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_043924_184313_CB7E6AFA 
X-CRM114-Status: GOOD (  15.04  )
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

Hi all,

This series introduces protocol support for the Exynos
Thermal Management Unit (TMU) to the ACPM driver, alongside several
cleanups.

These patches are split from the following set:
Link: https://lore.kernel.org/linux-samsung-soc/20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org/#t

Dependencies
============

Please note that this series is based on top of the ACPM polling and
LKMM fixes series:
Link: https://lore.kernel.org/linux-samsung-soc/20260505-acpm-fixes-sashiko-reports-v5-0-43b5ee7f1674@linaro.org/

The MFD and clk maintainers are included because of the cleanup patches
(3 and 4). ACPM updated some structures that the mfd and clk client
drivers are using, so these patches shall naturally go via the Samsung
SoC tree.

Note that when compiling with W=1 one will see the following kdoc
false-positive warning:
  CC [M]  drivers/firmware/samsung/exynos-acpm.o
Warning: drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'
Warning: linux/drivers/firmware/samsung/exynos-acpm.c:118 struct member '__counted_by_ptr(cmdcnt' not described in 'acpm_rx_data'

This is not a dependency per se, but wanted to let you know that
I proposed the following patch to fix it:
Link: https://lore.kernel.org/all/20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org/

Cheers,
ta

---
Changes since 20260113-acpm-tmu-27e21f0e2c3b:v4:
- reword commit message of first patch emphasizing there's no
  functional change (Krzysztof)
- remove static keyword from `static void acpm_set_xfer`
- replace for loop with memcpy in acpm_tmu_set_threshold()
- update kernel doc on devm_acpm_get_by_phandle()

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
Tudor Ambarus (6):
      firmware: samsung: acpm: Consolidate transfer initialization helper
      firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_ptr
      firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops members
      firmware: samsung: acpm: Make acpm_ops const and access via pointer
      firmware: samsung: acpm: Add TMU protocol support
      firmware: samsung: acpm: Add devm_acpm_get_by_phandle helper

 drivers/clk/samsung/clk-acpm.c                     |   8 +-
 drivers/firmware/samsung/Makefile                  |   1 +
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-pmic.c        |  20 +-
 drivers/firmware/samsung/exynos-acpm-tmu.c         | 239 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm-tmu.h         |  28 +++
 drivers/firmware/samsung/exynos-acpm.c             | 113 +++++++---
 drivers/firmware/samsung/exynos-acpm.h             |   2 +
 drivers/mfd/sec-acpm.c                             |   6 +-
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  32 ++-
 10 files changed, 397 insertions(+), 72 deletions(-)
---
base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


