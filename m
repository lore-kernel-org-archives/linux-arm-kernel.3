Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4214ACCFA19
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TOmMRtW5FXW0MAi6xEIHqEbujsChcuuW9+3rNb6Efhc=; b=P/iTWV+e9bc73+
	/pPz0LS0RfQDeVjIk93+UlxSeeTN88gEX+4WTjOg2U0UlLXnS5J0hWCiKacHTND9lks9pj7u3b6SS
	syLxjB2FRjx7g6KoZ9HhkCyE3VXJx8MgrjIkV3RelkMCEypGH/GAZZ+OmYFrgY7+cmHhzM2Mqc/9x
	sW/JdBbw/RVWFkGXW7Egnb/cNe6UQky5/yQdLpfODkN1DTI4cI9x0AHDhdCMb8htE1xkVKUzMuonN
	ru6Vq9J72RnqfxqZtwNZssBnJV3FQbdJF0oMwPirsHv5lgnzDjq0A5EY/t+/Cvo0TI9HHy3CZ7L5O
	VLv2nFwIdR/tWwmbPVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LB-0000000G7uW-1KHN;
	Thu, 06 Nov 2025 19:08:13 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5L7-0000000G7t6-3le1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-64124e430adso151284a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456088; x=1763060888; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOmMRtW5FXW0MAi6xEIHqEbujsChcuuW9+3rNb6Efhc=;
        b=O1Z7VrzPXegsBX8HiP5j5mH1tL6LyV5QThWJJmQOZ2m4SddgIDUixMoeq/+ZpHuyjN
         JDM8o65Eg8UJKoWmGifuHB20lHV0cT2nlNnqyztlFM8NucPdPW0ggsUKG56uU4XsZ0cN
         qweveibqW6LNN60wBYi7zaMRRQFMfdw2djWt6l22081XDnxk87dwr1FTv3hjkQnjF638
         ZwES+saIzwzuYgQjR9RVPzodZZwDJeTm+l62ybQ9pP8M8Zh/Eaa4kJHfrfJhXzzTskDG
         pOg6d5EaZOYEm6oxvgvM9Bj6VJZ+dcE0uWwv7sbeckyZ/HNadMe02+J/ZTBHX5OlAczr
         sOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456088; x=1763060888;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOmMRtW5FXW0MAi6xEIHqEbujsChcuuW9+3rNb6Efhc=;
        b=fIAIj429zC/H2BJa3fzk96K51JRcNk3lT2Jw0YZSrEbmF/9bazyXw8NsBBXkDL6Wcj
         sVjnp3VeVA1dJzQ8VNUsbf9zV7Q4/chaTFLum4EIixjyNiIOhEWvtroJHHSK0ibEyB3B
         laVZ3fpNavOnUVoVqgWZ1Hf8Bz/U1nTJ/b7odamuEAfFl8ec8KvlDmkDX2vyZ6N39APo
         Quma2TAVBa5QIeH11ZyJZHmwFvQBZg05WSgQXbUpMzQFjJyzRbw215aAL3KvUkWlFHGD
         tKlUfl9E1/gFHhwis7YFf8f6OMvGXH9IYdmpFrFyYmzeg5HzCR6zrBJhd4ZUL8vipoE/
         CocQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIkchUN4R0R4V0YVaw9E/WCEFbdvOoyTHyU0vJZqxoWKfGQ/kJLJbaBb+MVtoX66ax/7r5iq1haIYWGeatskCn@lists.infradead.org
X-Gm-Message-State: AOJu0YwAAY1yPFZfehynTAoDEHylI9+ioB2z9W48sH+qBnmBeoBUrPDH
	0PeJ6EhUOZe8tJzUepbcj/9CmiiZIsBsK0G/xfSD/Afz+SE2fXAorSu0QP+Orn6FS9Q=
X-Gm-Gg: ASbGncvx0b9sJDZo82iN8a1sRA9eM6lU4Qnc7rlItLRUy0e+5DrnGfr00QdbvFWq/9H
	Il79zU289vcrO5bMdxH03blyLWpK0B0u1jO+H6gvqqvblRORDGk25xCqjpAyiKosliQYwkYLZoV
	SFAg72jXlnbFa0o6JviuzYtty5pI6f2y+t4jyR6zPixMLPAbUePSEmrYvS3cRLsIUSm4vbCIB6X
	gJH9KV2mp29/NbuQtpjcLQAJIcaJGxGkz4CKzkydJhiyNZ9+su+2UVfrIHwwGKNc7k2AzE8mzQ8
	PO0EEXggzJiYp27FhnEccBRULuYmET34JhK+nxo8/2ya/kdUg5OX7S4Cwy9JKXDmskO/PF3e/mH
	R/GVUdBbWpKtMi00Kb3pAnQkwg7dy2jKLIciZfV5y0DyuL0KrmK9nS2w9qc4Ri5NGzmFLkHCsWj
	/5jV7DIDfTVH+tR48/9LtMpME53Yw=
X-Google-Smtp-Source: AGHT+IFGWzZTlk6Pep5z9JJh/2iQFwbYfqTOhkd0VSyzz3YH59510NL660TZKF8rj5tPeiZrlMyDNQ==
X-Received: by 2002:a17:907:3f24:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b72c0996c95mr16124866b.6.1762456087865;
        Thu, 06 Nov 2025 11:08:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/13] of: Add wrappers to match root node with OF device
 ID tables
Date: Thu, 06 Nov 2025 20:07:07 +0100
Message-Id: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANzxDGkC/yWMMQqAMAwAvyKZDbQSi/gVcYiaagartCKC+HeLL
 gc33N2QJKokaIsbopyadAtZbFnAuHCYBXXKDpWpamuNw4Fw87jyMS4/NQhOfDASOxq8IddYgtz
 vUbxe37vrn+cFIRAvI2sAAAA=
X-Change-ID: 20251106-b4-of-match-matchine-data-4a64bf046814
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2925;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=0/jEOxtSFPK0PmIemOfKHGwBErRDUi05GZgJASgkD0U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIG5LkF6rev9ukV/+9Qtp68gNcluS7tTEY5b
 xPa3VIbKtCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyBgAKCRDBN2bmhouD
 12G3D/9mfBQ7HGLDU/SZRXrLmtiPXCTDREluXdWUYAg8kpONNNEE75+x3up7wKYhs7S49bz7J27
 LN8BPJka1h7vYjEBYECOIAX9bwtTdR1QgpU+tJJRaN37ZNfdhdTG0SRuIbUpU5ONVnCTVbD+yzf
 7zBhrdKxAlht4mclM1I6Gnv97bmFqpGq/Pp5p4YJBGUrlBvuzoL8u9W9CA+xxXjW93uVjGixBu8
 omyiKyhRMdLgPamka6AttrpGLvvpFJVQChi30yQdAEQVdbp+zHnz4jkteGLGPjH6jy4+PLURMgC
 9FJfaviKGJDnBQYR1Vd/kpu9tnP/tW69frilBMHYt5kyIHvL5H31PJaQ+iBNmpavlBaLTjuylT+
 5sTnNNeO2R2ewpIY2kWOYuIrjiGSYc+zeHjf8l/zFKVa3zpvFMpjcomXpu0vHESDLc9qBRt8EG5
 oRhuhAqACjuTy33Nt3xExzTEAmOENK7qDzWl2xWbiFO1sLRbMA2auneH6jgY+Vb9yIqwNUv2zJA
 /jZShiOwmSnJMha7tiydbA6xvwNQhNMBW1Rs5WJzcEmzRwCWNGTqmhZHOSAQsES3xDV/pFdvbJY
 81lzvN3L/XYxoZ0HV75pW19zvzOuwUG+sbhLwIDHO5mlCNQ4qN/lssv+82nTDl+i971szhjo8Kd
 Jzhgda147d1CC0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110809_986613_2CAF0807 
X-CRM114-Status: GOOD (  11.44  )
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

Dependency/merging
==================
All patches depend on the first patch, thus everything could go via
Rob's tree with people's acks.

Description
===========
Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      of: Add wrappers to match root node with OF device ID tables
      cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
      cpufreq: mediatek: Simplify with of_machine_get_match_data()
      cpufreq: sun50i: Simplify with of_machine_device_match()
      cpufreq: ti: Simplify with of_machine_device_match()
      cpuidle: big_little: Simplify with of_machine_device_match()
      firmware: qcom: scm: Simplify with of_machine_device_match()
      irqchip/atmel-aic: Simplify with of_machine_get_match_data()
      platform: surface: Simplify with of_machine_get_match_data()
      powercap: dtpm: Simplify with of_machine_get_match_data()
      soc: qcom: Simplify with of_machine_get_match_data()
      soc: qcom: ubwc: Simplify with of_machine_get_match_data()
      soc: tegra: Simplify with of_machine_device_match()

 drivers/cpufreq/cpufreq-dt-platdev.c               | 15 ++-----
 drivers/cpufreq/mediatek-cpufreq.c                 | 12 +-----
 drivers/cpufreq/sun50i-cpufreq-nvmem.c             | 11 +----
 drivers/cpufreq/ti-cpufreq.c                       | 13 +-----
 drivers/cpuidle/cpuidle-big_little.c               | 11 +----
 drivers/firmware/qcom/qcom_scm.c                   | 17 +-------
 drivers/irqchip/irq-atmel-aic-common.c             | 15 ++-----
 drivers/of/base.c                                  | 47 ++++++++++++++++++++++
 .../platform/surface/surface_aggregator_registry.c | 13 +-----
 drivers/powercap/dtpm.c                            | 16 +-------
 drivers/soc/qcom/qcom_pd_mapper.c                  | 17 +-------
 drivers/soc/qcom/ubwc_config.c                     | 14 ++-----
 drivers/soc/tegra/common.c                         | 12 +-----
 include/linux/of.h                                 | 13 ++++++
 14 files changed, 82 insertions(+), 144 deletions(-)
---
base-commit: e5efebeef746a24f45b98dbdfcf334285848b32a
change-id: 20251106-b4-of-match-matchine-data-4a64bf046814

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


