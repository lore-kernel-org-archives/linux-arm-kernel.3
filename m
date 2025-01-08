Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B24E77198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 01:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tqd+1cGHPrlBvYanevBgNpqOS63DSGTtWvcDTpfRh2k=; b=Xqcean7iwrByyoeDLDmbmaJYfK
	6IjE5L/cQJyQvPVoB6DhPnflhRvSGh+1obAIDka1RCGJlJbvkAGtxmRnl5sVvigpjj+4Jz1LPE0Le
	gtQeJTlxfazsBpOoZ3sKQdJsWX9qeAiOpbtAbEuiHwqixpwT0l4ZSmCaw1D581v58XEihGQv7KzjQ
	2Tp7MKC1i8nUYGdsCwinkXA2FVqx4+ZzhwyLhKRKBhKm5BShZGFNyTG78xVJbZrXAKgxK/XhfSb/v
	m271IQamjsmjJ/QRAWFFHYsNED12zy4kUUk4lgDym6tR79KKZwD5Z3FVkkIHx7V6oWXeSC52BXw+V
	zSbSuEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKta-00000006kGL-1C7r;
	Wed, 08 Jan 2025 01:30:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVKsM-00000006jyJ-0vD0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 01:28:51 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso18818563a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 17:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736299729; x=1736904529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqd+1cGHPrlBvYanevBgNpqOS63DSGTtWvcDTpfRh2k=;
        b=mOXKh5ImgIuqc5xMqiNEJyla9HxA/BadX59KXWouwlVey+qMZdnDipUTz4vh/UvjKW
         jDdsddDnhFnUrw6utiuFPDpBAFjGJCVosVjtLGtLb20z9ac6pA2+CrHF5TRmWT61jLR9
         WFpv02vilYPr0Twq8U3hVS5mHSo6g/wHsgaKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299729; x=1736904529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqd+1cGHPrlBvYanevBgNpqOS63DSGTtWvcDTpfRh2k=;
        b=fNMP0tapDY5ijwcBAdENGq/BJm4NzwbamgFz6+3eMl/e9mktiVktuRnUVp5zKz87/z
         NCjZc1rW4qG9NYSe29aEM6UDu1eKecD3AjRfKGB5WGab7boZEkM3zUmYzgZOQXD6gQeB
         AGNzv79aNtUSu3TgYSLykBgSSktJVEsNPshSUidpKPVIBTyptBIUA7647s26Csb00GWr
         U6I4gXa+plvrVqHHh0HRFm+jO/ZH+/FUlBjN+G7fMrrFwdRAKUvZxjKme6ERQlB2DqCt
         ITe2TipL3so3j32EvjeQXLcXtiW/vpNLeSU1D9ycAEnmqAut7P0IT/st/Rtn5Y6VUFI3
         Ns6A==
X-Forwarded-Encrypted: i=1; AJvYcCVocbhChgUL1t78IQi+En9WDgTmgLxMX6ekYKnDUg7GjMoKL0LXSGBDpdTAcJYxjiJ5Z7Z5n95WkPkadjMylBdB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy10so119ulp/XWMhjVpBg/6BIuwyXCSr4G6dV2n8FtfR6th2lS
	hiprk1ya298BiTO+fd7XocFPuKElareCAexfIFCJdtVmgr1eKa7/uE2oTn60Pw==
X-Gm-Gg: ASbGncuKXGGixW2CY9/iyqD7eKBFPK5xPKEN9sjvEypcAR3Jo6phM3cvkQPZ8RX4MZX
	iU0oIGv7hIE4oxiMZkCt5I2IlqnJeU4V1pej0upvnpD78kNkcEoc6pjgxsm+NaoUhBI9sIouAmq
	g6V5Hk/gJfm4Q6WIZYpKld6/IMykfrF4DkUiUzpl6gquQadsKlmzBIkadY2Dcatqs2kyzhlOKxq
	/FxyWxUmDBX8I8SaX7CujwqhO6josVs+PobmW0Fk6nvsX/tVQ9qbVHVPI4nZ3JdOM1OVbN1jkAY
	948lI5DoGwN2eWAKt8Gw
X-Google-Smtp-Source: AGHT+IGLMAn658p03PrE1F/SvBkX0kJr3VIC8TJvPQU2lqUj87YfRHHuWKXhHHpqPyBEZ+g+tphMPA==
X-Received: by 2002:a17:90b:5448:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2f548f1c430mr1421193a91.27.1736299729083;
        Tue, 07 Jan 2025 17:28:49 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2f54a2d43dcsm225080a91.38.2025.01.07.17.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 17:28:48 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [RFC PATCH 0/6] qcom: Add an SoC PM driver for sc7180 using PM domains
Date: Tue,  7 Jan 2025 17:28:37 -0800
Message-ID: <20250108012846.3275443-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_172850_283636_30122D7C 
X-CRM114-Status: GOOD (  14.80  )
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

This series implements an SoC PM driver for Qualcomm's SC7180 SoC that
creates devices for the nodes that make up the soc node and attaches PM
domains to those devices before the devices are added to the platform
bus. The overall plan is to remove power management logic from various
platform drivers and consolidate it into this SoC PM driver using PM
domains. This series isn't there yet, as I haven't had the time to do
much beyond this starting part.

This is a followup to my presentation at OSSEU in 2024[1]. I'm sending
it out so that the early pieces can land while we work through the PM
domain parts which I worry is going to get annoying rather quickly.

TODO:
 * Populate more child devices and attach more pm domains to test out
   more stuff
 * Set power state of PM domains to match on/off state of resources like
   clks, regulators, etc.
 * Investigate setting runtime PM state of devices before they're added
   to platform bus
 * Remove PM code from drivers using the platform_data non-NULL trick
 * Make multiple domains? Perhaps clk domain, regulator domain,
   interconnect domain, etc?
 * Provide a way for runtime active devices out of boot to be powered
   down when a driver isn't attached

[1] https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google

Stephen Boyd (6):
  bus: Extract simple-bus into self-contained driver
  dt-bindings: bus: Add qcom,soc-sc7180 SoC
  bus: Add basic sc7180 bus driver
  of: Extract alloc/add functions from of_platform_device_create_pdata()
  bus: qcom-sc7180: Attach pm domain to watchdog device
  arm64: dts: qcom: sc7180: Add SoC specific compatible to soc node

 .../bindings/bus/qcom,soc-sc7180.yaml         |  76 ++++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 drivers/bus/Kconfig                           |  26 +++
 drivers/bus/Makefile                          |   6 +
 drivers/bus/qcom/Kconfig                      |  16 ++
 drivers/bus/qcom/Makefile                     |   3 +
 drivers/bus/qcom/qcom-sc7180.c                | 173 ++++++++++++++++++
 drivers/bus/simple-bus.c                      |  79 ++++++++
 drivers/bus/simple-pm-bus.c                   |   2 +
 drivers/of/platform.c                         | 130 +++++++++++--
 include/linux/of_platform.h                   |  14 ++
 11 files changed, 511 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/qcom,soc-sc7180.yaml
 create mode 100644 drivers/bus/qcom/Kconfig
 create mode 100644 drivers/bus/qcom/Makefile
 create mode 100644 drivers/bus/qcom/qcom-sc7180.c
 create mode 100644 drivers/bus/simple-bus.c


base-commit: 3c48780d48df029cf9d5f42b8971663e6fb975ae
-- 
https://chromeos.dev


