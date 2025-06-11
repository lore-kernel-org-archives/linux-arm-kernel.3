Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED6DC71141
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=; b=PoODvJa5RHexJj
	2O5eEkOvfP0RPaphSQmI4rTaexW8uQJozqZaTmefwpDanWPAAtAbl8LUI4J11FLRPqIcHdOF2KzhE
	kXGHmFvj7VMxquUxCASeGz5s5sgai2NUguy4lIuBDC8NAexPnvCrQDXWbwFk/3WxKgYoiEDgScJGI
	qOugRFzHS3OVWvZZWHkro38ob4Ap+jBMbQRXtUGXojelik6k5tg9qDPVVeSe4hWsy9X49TfdcJprF
	pySHGRtuCb5rfoaP0kBBMhr6DIe+QEbSpIepeFVAC/4wWT0LZJkOGiQpUiqbIwLR6qCmwRiSEdjF0
	BlDyITGyQf7A/sM8ZvBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjb-0000000AliA-2ru1;
	Wed, 11 Jun 2025 17:59:35 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKy8-00000009t7i-2kws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so5396260f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646455; x=1750251255; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=GqMVDYHv8/2gij++vD6nvOdqoBIFxnorkD1+9OnATlwSENMnHYhMn7YaUFgP0zJilp
         P9nqzbKvPK0vLUgNGS1FPkXMjuMD/1OEeNCnkgoEc0RPk8ZNZ2/j1KGu0MpFW5ECaJfR
         aUfUAzdqgfOjtDtCJIe+RX8RjjiHYheqsAVKE58yXZJttlZ2vKInDqYXjG5rgfBrtUzD
         AItAArMmlWwc7po8usNhOHjDgahJNiRmTVI9BanYhfvOiIUkSmi8txLXVoeikTamyhiE
         aiJdlgjaIVc9VKvdzVQcp4JKQ2yuGptcHS5Jx/263R0j1EL6L3WjhhOp6Fu2FtxnGhp1
         5UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646455; x=1750251255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=dMsjSVYQrzYJGH/KTYh+mrY6l8DTb7vxGJJDvf0K8khJfPkkpDHPTPmGoqk5O2R3rO
         9uQApLm7p7xttgU2hNbdv4yhE7zv/APpd3GIqVySo7AAdG6ZM3uZlSD4I4xfeDefRXkw
         p7ZPomb/nuI45ASwu02Wkx+MfE3MwR+Qj2s6xf+9IfHjWVxRRj2S3Qac5VkId1EhJn1W
         wuJ8/cceE/C+S5fesaQZhpkTlLtn/ClO7uSHoQVVExQPCFrf5hTKpRr0a2OhU25C6Em6
         lYUL3fFiYf71jTV8xWi0c74Pt8Iubnob2zRdKh8h8awRimtD1xU/M6rsVHa8cq4YG6V0
         rA9A==
X-Forwarded-Encrypted: i=1; AJvYcCX/fgu5TVLUCh4ItBOwj6I7u5JSIX7r5JR9gwsJxTCV3SZAE0rjQ7M4T5fMWCCdscvv5zAXIxUlXYe7j57I4R+D@lists.infradead.org
X-Gm-Message-State: AOJu0YzF/iVH3IgDwfyxDahC/eJz9f1da+7p63y0QzAqZCEZjCWpwi6f
	indqcOqwSnHxQmmCSjhCqBDwF6RsDh7AOyXXlAByYOsxR2V30JsclDd2inZnbKTs+OUSkWULyAv
	2+/jW
X-Gm-Gg: ASbGncsikqjuAF+KHzv00oBdJ1gcaZhVnmHAuo31oNIriYzL9/M5etlhWLUcbSBniW7
	wMk2H+I4ZLUWbLgZJCVfOZtW7ESHhXhy6v2EO0imASGHViX8rWT11hmeIXXWUeYOoJ4z9K4G6T+
	yCcLThc6SXNEqbc4yv4WVUrFpw3f6J/HQEJ5qoh8Wob+6/CB61mU8ttc92qIHNlbccMqAXcMJWD
	v4MmVroAAgQDnBy6CmlFAWBil3+yjJiVHyT4e1gd9aAPcKGY0tv0tJfvBn9yWPEW2saMyBcu+5a
	8Ydt5nkRXHtbufFFWRQDvbpOfGWe/N3CHJTjrnTybjbzC9696PzvcU92QuOhq2f0DXn4yFZjTFQ
	b
X-Google-Smtp-Source: AGHT+IGrOsdxa4zJCbGnTi4fEsX+7CHAps/JT+rDRqNsXkWOF1cXauuh0d8YfM1q6aZsNyF7ST0Luw==
X-Received: by 2002:a05:6000:1448:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a5586f1905mr2571117f8f.20.1749646454734;
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Wed, 11 Jun 2025 14:53:55 +0200
Message-Id: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGN8SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eScbN3E0gpdA0tDs1QDMwvLJMM0JaDqgqLUtMwKsEnRsbW1AFE
 JXr9ZAAAA
X-Change-ID: 20250611-clk-aux-0916e0689b1f
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxt57wn6gj2MMaDJqXctxiVe/tEY4F+6WgSm
 BnehdmmFCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8bQAKCRDm/A8cN/La
 hV6kD/4mGMjR2Csvf4Ac7+0h9kIkcrt+1BCIsyu7vwlVO5wjBbzWtmF7BE6DQqByhYj1kk2WBcj
 y167kxXU9BFQ41uDY1MCnyPCp3WYUj3c+RR93vorROw+S1ly382yPWEBrE8uhY+rHiiBTrdOwsI
 h/SJbofzfUdCnCYA1Nzj8mbOnR/F0Le8LFdXtcHEjXvHu7tq9YJg64XwjXCQ1NBndkGclowoBQ1
 YXn9L/WM6qXhVilWbeMq4pDMMoE2EKP7gIuj93iNbtuHqqSyTPTJBCbrYCXSVaJ8KOwKRzf/4S9
 KoiKe+nPFlHxM7fCBW65F/BrfxwBqjPhp7epi9iZvqIFg7OlDW69nCy+UogWg1lb62tAIA5lEjT
 kf+omgPU5kR9UgjbG34eKbe30yHput+jherUVzyWZAWJENmL3uEOt4BoTV45navcvdaIBPdJ96W
 8qq8vlmjdnwPqPZDOBj6/tPBre4GYpgxDIwrhlwRiqTrxRKlHe0V8yGGewu5ARh3Zu6oTVZrRCv
 pPJr05s++w6148vJUMNhFcTkuyQpIKBg7Ca+Qyt2Bh0YxKw3m+KF3YCU6Lr14zr6RmYPD1S8pVv
 0+xW+vylPjCd8KSajuG7qkmLX2dzHXoY2NDlPGSG6DcicgVxfEMbtP7apQ358uzjYH1c6uSy0mn
 RNqdkBmE81/FQ+Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055416_934698_2B6B57AA 
X-CRM114-Status: UNSURE (   9.98  )
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

This series is essentially a resend of the clock related changes of this
series [1] sent a few months ago.

The necessary auxiliary bus support has now been merged with
v6.16-rc1, so this change should be safe to apply.

I've included the reset change from Theo. It has been reviewed by Philipp
and it is probably best if it can go along the eyeq clock change to avoid a
WARN() in reset.

[1]: https://lore.kernel.org/r/20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: eyeq: use the auxiliary device creation helper
      clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
      clk: amlogic: axg-audio: use the auxiliary reset driver

Théo Lebrun (1):
      reset: eyeq: drop device_set_of_node_from_dev() done by parent

 drivers/clk/clk-eyeq.c                |  57 ++++-------------
 drivers/clk/imx/clk-imx8mp-audiomix.c |  49 +++------------
 drivers/clk/meson/Kconfig             |   3 +-
 drivers/clk/meson/axg-audio.c         | 114 ++++------------------------------
 drivers/reset/reset-eyeq.c            |  13 +---
 5 files changed, 37 insertions(+), 199 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250611-clk-aux-0916e0689b1f

Best regards,
-- 
Jerome


