Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01BBCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=; b=gigfdX6YceByF0aHGH+PV3M5Eh
	50eKTix3ql2lRPFlEeJJAOkwxuz0HC4Sr2wUBcu7nRz05DvF2JuuCSaEb/HzXA5MkiEQeqIYCaWLD
	MIAIaF12HqpIKFw2CCP/4z9X7xEiqDl6IOysQrQIo2anAzYne8P9gK50y27W7waU7YPGPG9+QNFl2
	mRuo9dKveW6Lm+MnREysIV7NqmlKcj3YrEuH0RvIWNq5MCGB4kADVoDBGX/FhJQRD2+BXkvM15Sv0
	7xuZS8xxEZaC0H5o+ojdejjaq/s+FP5eELSTNMoboCeL78tryyorJWruktdWjaATduyLoAkC1zUD5
	8UuRuU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOc-00000000FtJ-1zUZ;
	Sun, 14 Sep 2025 06:39:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOZ-00000000Fsd-3NPg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 06:39:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so28046595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 23:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831970; x=1758436770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=;
        b=DA7SbcF/3n6f1xpdGLPQ7Dxgg0O1nNO16SioJtEYytuLhUFrjQp4XkoHjqOKZR3ZnR
         jV+GunJOwxwTNAQs0w60CwERvae13Ps13wh/Z2fIy4yj70o6DzTxP6IBEzRhrcOWCUZm
         z8m71U6xsxWcqsvrXpO6ffn1GvFFMx1RzYKrKdkqdY/P6rIT60KMmMe0Y09kJhDwCxvQ
         u7e3LhqXeeiK8JUT/k2VScdwjq7K8Ko8eNOYBkp/CnrWFML9Tyj/mnJXjxvftgqLVZuq
         DaCtx5sRKHa7yR8kC4iorb/HKZMqtoV5YNAaEQs336FDD6j43UQ4WPdUiKdAmU//NMEn
         8vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831970; x=1758436770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qu2Fy/Koa4ceqWj6i/DQ0jJIb7GQDqAQHuEca7zbCNE=;
        b=f3Tqmyx0qTok6YqiulVPwhUgYbKKhHakNYsSz8+ctmCt2rdUmXXvAgLWq6e5gqGttO
         If7D8/ll8VNtITZQl5KjVA/VddOkVPFEO7qrq1+/vJiP/PoO3yFMpGmfr4oxlbHYHgCw
         jvozzMJaAOMpuKfR7udPdKFqGVg7PBRmvHMnaw9/W7uITFdGWyDmq6QwtAlFuWsYhmHf
         CXORabJtT87Viil6uok87ikRBaHVCoHVDVsnGNz1FdNDiqXdJMFZkZLTVE94gt1ElGM+
         Yuhe4DTvEGMf1GGwu4UWK5i804AyVt9Cdl2uKqZrqeIzXP5BJW0mluMzxaBGNC0kW9md
         /ZLg==
X-Forwarded-Encrypted: i=1; AJvYcCWrmAU5B7CWHh7hVDjS8y3iLlZBOJtNfYefYMasAHewdI3+5n5a3K5uAs3EVaGDvXqR949TR/IHw4pkPAIiJfHy@lists.infradead.org
X-Gm-Message-State: AOJu0YyCzzNKX9dGIble41RM5AJrDdpVgQzesnZKiw7eAvMtRTXxjYw2
	7mRCqD1FCXQ+XX86WcS8pqEmrXCHoEvXxG85rx+ZP8e0uCal9NrFE1f0
X-Gm-Gg: ASbGncs/ecc7KO1XmUTj3+EV73oLbTPznvLpMU/MbsHG7vuiwZ052xpYQKu9pqtFhp5
	gElvv+YQDPKx2+YagOFKqhIEk5wP1lDgoVwDnN3vodCn7cboXIzKlo6HWAb09rfp+K/69YF/mFQ
	MhxKZy/RkQIDVDqE4HqDBwcDIQUd9DNFVF6rIo2kBYnX1bfy8Q+3OCskaBVGPmlP55QlEf7k6KX
	Edp5sy9Dzok5fFlSfYGrtbq7uoWBrWkQay9NM0EIb+P6tzsXYvSykIjGC6v3RNpAVW3FjRD/7g+
	puBOmRr1GbSAaG0GOnISEWErOv86tzMrdKbwZlU9ZfoJtWLTvjtN6vo3ZAa5ovOPcNJaAnpHHnP
	mgpG7Hy754DUItwp7DSjwjjEDI+uPk1bJB9fQIXFOo8YVrxKcytywdZRBGcLN3+Ld699e/vnAiE
	6HS12nyLWenW90v5jNCljt4c6d
X-Google-Smtp-Source: AGHT+IHsVQaLwK9kbPhi5b+T5uL5yRbv3z8nvbXvjRDH7NM+UJPCf41nboJd5RQK8c2xCzYZfBtU9g==
X-Received: by 2002:a05:600c:4755:b0:45d:dc10:a5ee with SMTP id 5b1f17b1804b1-45f212933ebmr70561585e9.15.1757831969491;
        Sat, 13 Sep 2025 23:39:29 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45f2abd2c03sm18404525e9.13.2025.09.13.23.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/4] dt-bindings: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:22 +0200
Message-ID: <20250914063927.89981-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_233931_863214_E5AC10C1 
X-CRM114-Status: GOOD (  11.89  )
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

Hi ARM SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-dt-bindings

for you to fetch changes up to 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.18-rc1

Support for the Tegra264 generation of I2C is documented as well as some
older Tegra devices, such as the Xiaomi Mi Pad and the ASUS 101 devices.

Contained are also some additions to existing bindings for Tegra114 and
a fix for the power supply feeding VI/CSI.

----------------------------------------------------------------
Kartik Rajput (1):
      dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C

Svyatoslav Ryhel (5):
      dt-bindings: display: tegra: Move avdd-dsi-csi-supply from VI to CSI
      dt-bindings: clock: tegra30: Add IDs for CSI pad clocks
      dt-bindings: arm: tegra: Add Xiaomi Mi Pad (A0101)
      dt-bindings: reset: Add Tegra114 CAR header
      dt-bindings: arm: tegra: Add ASUS TF101G and SL101

 Documentation/devicetree/bindings/arm/tegra.yaml            | 12 ++++++++++--
 .../bindings/display/tegra/nvidia,tegra20-vi.yaml           |  3 ---
 .../bindings/display/tegra/nvidia,tegra210-csi.yaml         |  3 +++
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml         |  7 +++++++
 drivers/clk/tegra/clk-tegra30.c                             |  1 +
 include/dt-bindings/clock/tegra30-car.h                     |  3 ++-
 include/dt-bindings/reset/nvidia,tegra114-car.h             | 13 +++++++++++++
 7 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/reset/nvidia,tegra114-car.h

