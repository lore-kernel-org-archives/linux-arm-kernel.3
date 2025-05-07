Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5804CC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qM6MT6DeSdS7exOnWgwuk+Xurm4F1nx95nmeBtoQHnU=; b=xDHMU9y4m+5UcGx7ndLaCiUVpB
	jc1YZ2aPwW7dq9l/KXDFrAhTaszjN9SS8JyUCx+aYP0L8yCokCT5JPEGLu2tlQkQCzEa7kxRkRpQw
	WLzQDUY8omlAYxUqLz26Ii3zd7ryhGJXZiG+ZZsMJDAOjid0+g9sAAJGpcF28MmZMFiDj1lVt0BYz
	iSrFQFELpsKr504t0TxrtzIe/F601qVVi/DgXhTBxwd5/OTDjFk138fjRWa0o2lIrZQGbtMDH4+gU
	h0dkN+XCnCNmCgaBJQZjFbw67WYasgPFxZ1R1qOQUVViM7MG44O4ynDBY1gl8bO6Xje9zW+OhAMxe
	XfU6wljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWY-0000000GHvA-0RsB;
	Wed, 07 May 2025 17:25:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfuP-0000000Fofu-3AI4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:38:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0b9625662so6659f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746628684; x=1747233484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qM6MT6DeSdS7exOnWgwuk+Xurm4F1nx95nmeBtoQHnU=;
        b=O4l2Bvc6+0zhjRpraV+DebX6tGdwL61LQlctuzPM30hBtB7ul7KjXZNlp0e4XqcJZ4
         ry0F752nEWotZ7n0DTlXUykYg2UfYT4Hd30qL9/7dXE1XJa6SRcbeXN2iwjsRL5W2T7w
         8+SZuPo5uL74kUKNx02SknB5Pg1B5ITwxS89YIpKouxQClggyQTmxVJpnyYYU9br7ISD
         OU0GbUzyi0CDUsWz8JAfHIMA9w+Uwgsplq2cOYS7Yq21hGh8S0jKMVbHNEY4eto/USii
         JqxDFGPgFJEhHmD5wpucSI6tTgtsSQ+IX+0WrcVBpNiwjrlXYfd0yecUMw2F1RE5YKKL
         IGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628684; x=1747233484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qM6MT6DeSdS7exOnWgwuk+Xurm4F1nx95nmeBtoQHnU=;
        b=eDyMKTIh3GytLn8NkKvnHZ03qUNL0rgSoBAPKOvsSIJM6yMqsPLlDa6UVqfT6JkjfA
         4q38MGLbMMoe2LB0QuiWd9Y83n37JqQjE+UQSXU4wdtzW5nozcK1g1jbTX/9jX32Ucu4
         4EAhd8CvQWXk4ovQEFajulL1AKa6uyXujFAx58tvKmwIiPMEMeEFJf2OzEsjCKbNeQPx
         ABCBmrgTJUbdY6ql/XvUlz4lgAfFW+RwvTxtVXcijk6jzUYAYBnOUP5dg4dnIZ+E9Kqh
         MimRFxkpsuPD56tO8Jnds9fT+PpCuV5HBAd/TqviHeJ0rlUugmF0d1qGIbpdSRQk2yRv
         3K/w==
X-Forwarded-Encrypted: i=1; AJvYcCUEs+kyaX0U2YIL7sSz57TpZsZrbGkm5XmxY8lYhjybUHMgO2M0PS93Zk80JLl8d5nqRfJaymHZjrP8osU5nyb3@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8F/T7d5Jk71KL2CFDGS7scwJBwS2tV8+HBCFFx3etXMp6Q1uL
	/M5qVAs/zqFO1R5IB16OWGJrAMi1kZf+N12GhgMMAYlgfX3jAOb/4NneHQ==
X-Gm-Gg: ASbGncuJfit4Mw8jc4blzu/1YejzQYpCkcRghsku1mbnm3kO1PDCmJUtpjTH4PIAEHK
	xw5fkFMBUn+lJQkBke+JUpdRk/hteVakew2ejl3ohZB3cp0Nl5lyiw7eECrmVbyUTVffH4esWpQ
	gYiBt41aP0oFM0dZPckW3RxUDcZ+loa7b/iZaglL6yi4LjBfJWp5M/hGyY+Zp4KikdFsuzXW15T
	RbG31qIs4SVd2Ec3sPv20z6mmzVhZsRmP2TfIsw1TbreQQmvmNZxLr7O8jED3wHmyvaY7mJLyVp
	Xai5E36VME920cd/dlLF64vKcz/tj43z8gMXpdbsvigZNwdLvSJdgT6qfMcxR2zrrAFtG+pGOYf
	5HIQiVBDGQHzwaRHkOznFvFi27RM240Wf
X-Google-Smtp-Source: AGHT+IEyETzlmmc8y6oYf6siZoCpV9tjgqie+KXvCk4K/EP8txjap0qPuJWbj9Aa2mb1QhqO4UEfbA==
X-Received: by 2002:a05:6000:1a8b:b0:3a0:9de8:8a45 with SMTP id ffacd0b85a97d-3a0b49d2755mr3084623f8f.32.1746628684002;
        Wed, 07 May 2025 07:38:04 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd331079sm3041375e9.9.2025.05.07.07.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:38:03 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/8] Add more Tegra264 support
Date: Wed,  7 May 2025 16:37:54 +0200
Message-ID: <20250507143802.1230919-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_073805_792143_851D5160 
X-CRM114-Status: GOOD (  12.40  )
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

From: Thierry Reding <treding@nvidia.com>

Hi,

continuing from a previous series, this adds more Tegra264 support,
which is mostly device tree compatible strings. Towards the end of the
series, a DT is added for the P3971-0089+P3971-0008 engineering
reference platform. This should be enough to boot to an initial ramdisk,
but patches are in the works to enable booting to a login prompt using a
root filesystem on UFS, as well as other connectivity options such as
Ethernet.

Thierry

[0]: https://lore.kernel.org/linux-tegra/20250506133118.1011777-1-thierry.reding@gmail.com/

Thierry Reding (8):
  dt-bindings: dma: Add Tegra264 compatible string
  dt-bindings: rtc: tegra: Document Tegra264 RTC
  dt-bindings: tegra: Document P3971-0089+P3834-0008 Platform
  dt-bindings: Add Tegra264 clock and reset definitions
  dt-bindings: memory: Add Tegra264 definitions
  arm64: tegra: Add Tegra264 support
  arm64: tegra: Add p3971-0089+p3834-0008 support
  arm64: defconfig: Enable Tegra241 and Tegra264

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 .../bindings/dma/nvidia,tegra186-gpc-dma.yaml |   1 +
 .../bindings/rtc/nvidia,tegra20-rtc.yaml      |   1 +
 arch/arm64/boot/dts/nvidia/Makefile           |   2 +
 .../boot/dts/nvidia/tegra264-p3834-0008.dtsi  |   7 +
 .../arm64/boot/dts/nvidia/tegra264-p3834.dtsi |  30 ++
 .../nvidia/tegra264-p3971-0089+p3834-0008.dts |  11 +
 .../dts/nvidia/tegra264-p3971-0089+p3834.dtsi |  14 +
 .../boot/dts/nvidia/tegra264-p3971-0089.dtsi  |   3 +
 .../arm64/boot/dts/nvidia/tegra264-p3971.dtsi |   4 +
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      | 363 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   2 +
 include/dt-bindings/clock/tegra264-clock.h    |   9 +
 include/dt-bindings/memory/tegra264-mc.h      |  13 +
 include/dt-bindings/reset/tegra264-reset.h    |   7 +
 15 files changed, 472 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834-0008.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089+p3834.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971-0089.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264-p3971.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra264.dtsi
 create mode 100644 include/dt-bindings/clock/tegra264-clock.h
 create mode 100644 include/dt-bindings/memory/tegra264-mc.h
 create mode 100644 include/dt-bindings/reset/tegra264-reset.h

-- 
2.49.0


