Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F72CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=; b=zIg/4NALMj0Pl8
	Xz/gSHEUkNTccvdKKkk6bdux9NOM6dLWBMyFnyeRGyFmYITBmZoqFktVZk0IiUY+Qqw7T14ymHvPt
	sMe8jCGQsnhaetcwAlP+soqvrb3igL8CxK9wcRXNMH6H//sq+DM7Q/FpkVAbqPj8O3WU9s2XJolmZ
	r3p6DY/OrmLsF6RaYpDtfwDvU14z8vneX98/oKAyTBbnxZ0P+p/lKNsYyQHzEPZH8vcCILvTiLxYG
	tdjFYNSG3kRnnuGUEON7bKmwFnbQrIdaNbMHlp392nzNgSQp5KchNZPONI4ih7dVzSJBp5RidZtUw
	/7/v2n6r4WXyaN9R05uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQk9-0000000ABVo-3ZXn;
	Fri, 07 Feb 2025 15:58:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgQil-0000000ABB7-1jbq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 15:56:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-38dc0cd94a6so906836f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943806; x=1739548606; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=;
        b=d+Ec7lrGtJhV71Y308ptdwxia2OaTDiHyrlNBH18zz3xzUHVQu1khN94bN4qOSA17F
         oY44AupnBaf3ovVGK4XHrANI5ovalFdxsod0D1/EJA5DVZtDL6ZCwVo/f1jYvdf9RQuj
         vu1S5OPRnD9tdBbXu+6ZAVxohaOGvt3oj4wGo1ZikPnRGCB0g+X6182IxO74ZP1198yU
         Tjo1PGFPQxSmb+ajNuQBtLGmwMg8+VUWCN5P8dFvOaCBojhYYMY6E2OJ0pkKCNObfz2A
         3sp1k94CGB+naLciPpfdpoGVEG/pVEBDfCnt1yejVmc+6TZpY56ctb4JAM5B75n7Gkci
         FFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943806; x=1739548606;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4XaH+BkrFcElpValwujf8MTwHDZlLF75VrF7xokMmE=;
        b=YYWcIXuS99CBpdpctR7LX4rVU045xsj3T/kRKu65HqmUaDvnB9QRCLSZyGatHzajeF
         ovpt601hda3ahpuDoKcnPopEMJAWdlbL+14U81RKq9R70RN2i3Vs7+XyR3izhNAOu23o
         PlSjBZaT3z3ilF4YWxo2oVOo0HPRxLlm0AKmJBss3ftqjT9yJJOkeyk8XoWxKDjOi68B
         VFOrWTc/hKBZjlo2BvxxaddZhuFUTVitAOb9cRJfeW8kOtx0pq+h5VU4JCuXtLr3WzAF
         qi99FrH4u7aeWisumAvwiSvq5IcKNpNImjrvNaX9wvJXjW8l6iiPdsKxR/vOUcnjRyYG
         8IaA==
X-Gm-Message-State: AOJu0YzQyFLHgQDPxcI5AyttLoAcsxof7IzkUM6HzWL2pROryktKmFOC
	abGTzBSPc/IIs160j+/Fx5kEkrpdmIRGUSEqcOxEppTL93JoXIMHmpvlz5DueGE=
X-Gm-Gg: ASbGnctQpJwpGoSnTt/wpFYbzLgLPzq8gItAaO8zjTrq2BTtTyMbIUrEDvurXQqE50y
	SVKiK6vZJ9vmeThZIc0Xo6WDYjTg1HGJ4oe7jYsLyBZhittxHFAVXmmn2V/HpddDOiLbYFJLZ3c
	atLEdWqRADvweXoSQucsuba2BhueMFG73Y+hnl5K4hkprunkawLveknnpbGJuB+dbR65IdMn2C1
	Fd3EhVKIeNAeB1w1D2RXmkMcUynTUiqkB43/LTxzP6IQtku7rxITXfejd84cV5gKIcFiZhTguw+
	NmuddaOvROAnuH9PScgbH//ivt0hH+SW9YI8Cb6tMEjQlfQ6r3T3kpDsUH8slx8Z+p2NEGg=
X-Google-Smtp-Source: AGHT+IF1isjfJhpwBwRn2wFIcqnriDpf7RWiylXJF2/fIw66GnlQdlas3grGew4e61BN8nzPIDi9jQ==
X-Received: by 2002:a05:6000:186d:b0:385:e1eb:a7af with SMTP id ffacd0b85a97d-38dc9491e85mr2957542f8f.48.1738943805838;
        Fri, 07 Feb 2025 07:56:45 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:45 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
Date: Fri, 07 Feb 2025 15:56:42 +0000
Message-Id: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADotpmcC/3XMywrCMBCF4Vcps3Ykt2bhyveQLkInpgOalKSES
 sm7G7t3+R843wHFZ/YFbsMB2VcunGIPcxlgXlwMHpl6gxLKSKUEhiKFRDevb6QNLc3kpbWjFg7
 6Z83+yfvpPabeC5ct5c/JV/1b/0lVo0BrFFlDzo0k7y+OLqdrygGm1toXB7I2fKsAAAA=
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1810;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6Pxx6KI65/1OvLcTbyXFy8HVl7tEE5dMXgqx/8YkiDE=;
 b=Ir9PpklqrZfAtoVJ4ojwHmNFqBLoHsRgq7+0zLdvsefNa+gLYJx+ogCrjXkLGQONm2MnOkOCR
 Pdcub+4iX2yCB9rrP6hCk0igolpv9lrMS2AiWNEMmDCo/5o+wqcDM4a
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_075647_455158_8D29B32D 
X-CRM114-Status: UNSURE (   9.83  )
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

Define SRAM, mailbox and ACPM protocol in device tree.
Enable the mailbox and ACPM protocol in defconfig.

Bindings for google,gs101-acpm-ipc are proposed at:
Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4

Changes in v4:
- rebase on top of v6.14-rc1.
- describe in the cover letter where are the ACPM bindings.
- Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org

Changes in v3:
- ACPM: don't specify the channel ID and type in DT: the channel ID is
  discovered at runtime and the channel type is always DOORBELL for the
  ACPM interface.
- mbox: update #mbox-cells = <0>;
- rebase on top of v6.13-rc3
- Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org

Changes in v2:
- update nodes based on the bindings updates
- update mailbox and power-management (mailbox client) nodes to specify
  channel type (doorbell or data) and channel ID.

v1:
Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (4):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node
      arm64: defconfig: enable ACPM protocol and Exynos mailbox

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
 arch/arm64/configs/defconfig                 |  2 ++
 2 files changed, 27 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241220-gs101-acpm-dt-6dcde166530a

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


