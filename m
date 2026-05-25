Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DF0CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJLkAaWkaR/u6MnpMROmXCnK0KgC4u6HMrcHQXc6x1s=; b=RCvQtPluhyKzLJqZN/4kcAEFlR
	9I1jIIJkJ4kBCZLTQH57hYGPFyEjtk58nlypsM/gFbx0r7B2EXhbh+t6kY9jARXud1pjyF/n5bv7I
	3bmg6cIKFLppg/gtjgTeZyxgVfFKrYsuNa2E2HA32umvPmdoOq41WT4G9rdkt4/O+7FfpDTrmPjhL
	P1avFuKEg7SRL1tuAGi1uzbtDT2YBw8Tx7xuR//F1bPtFDreGJ24BzmfHQxImLH/psWMv/Y9rQLXg
	WrThaExt12v6w74FlPCI5EnMD5VZN9yG225HlBI2X7iI3nddGPHk98w8YOvG3AcX4Q5zdB9WyxwuL
	1fEMqBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWaM-0000000HRYG-3Tfs;
	Mon, 25 May 2026 14:47:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWaK-0000000HRXq-0kj6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:47:17 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-365cae89bf5so4235194a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720435; x=1780325235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJLkAaWkaR/u6MnpMROmXCnK0KgC4u6HMrcHQXc6x1s=;
        b=ZhCNot9a10/+ag+zrvBSiEkpWuN/e+fqZAbGKHcrdSXiQNZ1ZBjsrOrTbxr2cnOV5l
         QzXYrxd7+9ozGn/1sTp51DeYo0by6Czb4KyqA1UaMOPaFE7EXhF19MmIfLiczO4uLhCV
         F45Dk736/E811wgJSI7uvM3UPZ1Y7coZdvQW8xpAPYevNGsuTKr0pYFqTDv4W9dvSefQ
         7dPxgNXhf5BZ7mVgcFovz8HWLC6xI+jdZOge8DoLBoxYK2h8JPm5qeDdwDDLq6u9VfKL
         Iqcfj5nE/fU1xmmpJ5qjDqKJU1WRrWRNe5cEyIz5/kzgsDTQnrmooIHVmjWqnCpMyD1s
         I6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720435; x=1780325235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJLkAaWkaR/u6MnpMROmXCnK0KgC4u6HMrcHQXc6x1s=;
        b=R1E3Fg2x2cktBMfBDEoVHA1ExpwbN96h8QdUhTqmbnl2T/iqCqLBSjUgsNIrY/vzzj
         zrPkph+dxM9XYQk5thoe8X7nUgJ5Qtmpoe3BsKljSUcIW+VDjEjzwVMnv3ghLFqiUTW+
         zMp4fd0xOuDTEsrVjBahnjH5D1D8UK9HGnUYG+E9N8hVTiQxbcbb/I68gp6hgQxRzsAk
         Gv7gpBdV+fW5Oylguu6PiLacdmMksXYWKkZ28a4XwrWLkX0h+iip0MEqdszKC/RkTfbZ
         1e+TwJ4UHD9cWr4IIR1VWxKfcca4nkFADrw7ME0m38NjVUAdFuXlm25wBP4JXWyeB14V
         ypJw==
X-Forwarded-Encrypted: i=1; AFNElJ+ccCpQ7X5nr0VGnOBrxDmdZRc0fPjdF5z4lkwN+2yC/4SvRC/TDTh6csbJDTkthZhrgwDVBNwJ50InT4fMiegg@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJlUXtUn3Jkf+se71O5drO3n3i5uY9jvyliiuVQccPShSE4no
	Zkh8jngqhR3cEeWQVQWFdp8/V7WffFSU/Xsno6yjGdD6tSoPTM6c34ak
X-Gm-Gg: Acq92OHGHH3XiB8mAVXeZqANs5ugtLzKr8YhAK3066kjuqJwFhQJUb5fH28krxEfToM
	AR2w7FljXKYtfSnKY17rFANm6SSJqzDLaK+LL+wxLR9YyhDEkYYC9drOpEBg7/xnIdWCabsjC8G
	2Bb4QNvg8iMmeZUU+cW1OaRIHhiVNvTBFUCjYgWOlgCPons4L67oyZND2TZXQ6LjoQyRAncy5T1
	ovgP3iLaVjUmLZSF9dTeJMdnT2Rxmd9DjXrhdGKPes8H43fbxS1oOqfR3XtK6eoJqRIvqvtzCNu
	8Tt2EKXPJDCsYN3oVrbDvGvkY0lwPk3+4j7nHlwyyKkNpRZkQ5TQOm+5t2cpU1I/awXYz8I3u/O
	Q6OZnpH1c+3fhVs6Uz3tUoRLgWxaNzfGV64Masnq/JOhPLZiaPHhE+ifH2/GTwAy3PRJb3XddB7
	prDHNQsWDYt3iAYUrXye+bVovlQpLT3xim4fbyMOA=
X-Received: by 2002:a17:90b:1909:b0:368:433:b697 with SMTP id 98e67ed59e1d1-36abe37ef9cmr4093720a91.19.1779720435013;
        Mon, 25 May 2026 07:47:15 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 0/6] leds: is31fl319x: Fix shutdown GPIO and update DT bindings
Date: Mon, 25 May 2026 22:46:06 +0800
Message-ID: <20260525144629.498630-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074716_220520_A5C00E01 
X-CRM114-Status: GOOD (  10.18  )
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

This series fixes incorrect shutdown GPIO polarity and improves
shutdown-gpios description in DT bindings.

Patch 1 adds detailed shutdown-gpios description and fixes example
in DT bindings.

Patch 2 fixes shutdown GPIO initial state and removes redundant
startup toggling.

Patch 3 adds fixup to force consumer active low for legacy device 
trees in gpiolib.

Patches 4-6 correct shutdown GPIO polarity in board DTS files.

Changes in v2:
- Add comments explaining the reason for this GPIO line level.
- Add fixup to force consumer active low for legacy device trees in gpiolib.
- Link to v1: https://lore.kernel.org/all/20260508152435.21389-1-jerrysteve1101@gmail.com

Jun Yan (6):
  dt-bindings: leds: issi,is31fl319x: Update description for the
    shutdown-gpios property
  leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
    startup pulse
  gpiolib: of: add quirk for IS31FL319X shutdown line
  arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
    polarity
  ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
    polarity
  arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
    GPIO polarity

 .../devicetree/bindings/leds/issi,is31fl319x.yaml     |  9 +++++++--
 .../boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts   |  2 +-
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts  |  2 +-
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts  |  2 +-
 drivers/gpio/gpiolib-of.c                             | 10 ++++++++++
 drivers/leds/leds-is31fl319x.c                        | 11 ++++-------
 6 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.54.0


