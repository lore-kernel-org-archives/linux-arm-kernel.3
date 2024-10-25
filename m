Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9894D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NjNHunCnOdN+Wqqw9EShNJBoIyMpofWELciNyHFIroY=; b=vuj0LKnLyznuRBNHZYsIbE9kRB
	bp0kgrxfvoCzHIChhIYu5YDjIPNyP/txmIeiox6TF2lNFT2BWe2Oy50lXgnqJ/7rBVuqFstMFKfoZ
	8uw7xvGFWee41YMkK5blAvBql+T351MWKJK21kgqEp4ujXcQ2hhDTw9LUKt2cI9UATy3uepREIssz
	GvvWiAEZrMh366AlMRdDaIcOeGvPoJwRCORWhQKtq67h4I2xktc/25zRFoNX5qneAFrVr7N1pQdhp
	ZOQfgAeo2Ravl7eRuyd8ghXgsIlJU5HeldqQInYjfbpXLQpts5/VH8Cfj5nbxbXpTA8Bz/7K4z0At
	GSBazC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MIK-00000004Fza-18Qs;
	Fri, 25 Oct 2024 15:32:08 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lt3-0000000492X-2seI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:06:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d4fd00574so1341242f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868760; x=1730473560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjNHunCnOdN+Wqqw9EShNJBoIyMpofWELciNyHFIroY=;
        b=SswuOcjea701Hwld4hrr1Oo87b624phaDyaDoilBDuXJCgOMf+bgDNADK6Ozh+gZTc
         eI5wgalU+1PEaxKzlXkexv6a5a1zpt31SMQNAunRag8dr7DtWdW8cK0bRXP5HJNIz4tD
         6u8vXN7dz+Gb9MtIyEn6vFVHAprpGjt+wKka4QKp8CgT4NK/y8u9im65xCn5nBaw/jO/
         Z4fqqnBymX1m27L+ZWZot2g5l47+/LF4cEvh5tDh8M1CTVlv7GY6gPMJB8ogUi7PeyVj
         34juhWrQt/+chQZdDTbXN3fUPeJfU708DFeNoscBtI2bmPjv6aEXojU9XlB1pKZY6cno
         hi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868760; x=1730473560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjNHunCnOdN+Wqqw9EShNJBoIyMpofWELciNyHFIroY=;
        b=DN1ODU0mD1pn8GCvZ4W5HEN9mfwZYrueqaa6/X1u8cZu+Xsk2HLzN8ucY9TMfYyaFf
         JquJwnsxkvuhaQ5iOihUX/GOBUhSTLASvW1G1KUZiO3r/vr+wi3kXPDl5aUr60NnliU3
         5Gj9oiZWNM93YvqBht5adljrYWDmcRh5h8r6SNdkFVQ03ZEs+yTYLMKXyACa+nHVHQlc
         0W9c/sqPCc7Rd4gVW43FLgLe+71G/vORtD4bTR3GxnSGMB5eg3RMw5Vipdu4AW0eQ8pO
         Twfs++Lhae5ZTXimyeemod4uvW8epeDiqDL0HSiwXjo4wCTP9ukkR+wlLSj7SvaUV0aq
         ajOA==
X-Forwarded-Encrypted: i=1; AJvYcCWZTAS1s1ZrllbMZpJ9TvqmBvrZFcDkwok29urVUiBi3aJxMt3NmK6gG04hUVB9D32E2T1t1ZLf6ChX3IsEE7FV@lists.infradead.org
X-Gm-Message-State: AOJu0YxwBTXdHa9FOkOPfyjCHg7lUxeon+j4ji93IonA9tXNMZW9cdEi
	ydFY1Vl2KgH+XCQQEVd8YUQu/48hHKuGKvt5fPnJRkVZYIp4jjMc
X-Google-Smtp-Source: AGHT+IHf8K+VrApDwK2P3P4VzLDOtAw06mB6pfqZu+1G2ln33vZP4xxaLpqz2VXts9l5TmzwFrO2TA==
X-Received: by 2002:a05:6000:1a54:b0:37c:f561:1130 with SMTP id ffacd0b85a97d-3803ac0c1cbmr4825990f8f.18.1729868758329;
        Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b91f43sm1741743f8f.92.2024.10.25.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:53 +0200
Message-ID: <20241025150555.2558582-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025150555.2558582-1-thierry.reding@gmail.com>
References: <20241025150555.2558582-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_080601_776356_BA0E9FED 
X-CRM114-Status: GOOD (  12.90  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-arm64-dt

for you to fetch changes up to 2433e22233f07b2e03034fffcbaf6c26b5838bb6:

  arm64: tegra: smaug: Declare cros-ec extcon (2024-10-24 19:23:01 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.13-rc1

Changes in this batch add an device tree file for the industrial module
version of the Jetson AGX Orin Developer Kit. There are also some fixes
for the Jetson TX1 and new features such as touchscreen, temperature
sensor and USB-C extcon support for Smaug (a.k.a. Pixel C).

----------------------------------------------------------------
Dara Stotland (1):
      arm64: tegra: Create SKU8 AGX Orin board file

Diogo Ivo (2):
      arm64: tegra: Add SDMMC sdr104-offsets for Tegra X1
      arm64: tegra: smaug: Declare cros-ec extcon

Jasper Korten (2):
      arm64: dts: nvidia: tegra210-smaug: Add touchscreen node
      arm64: dts: nvidia: tegra210-smaug: Add TMP451 temperature sensor node

Tomasz Maciej Nowak (1):
      arm64: tegra: p2180: Add mandatory compatible for WiFi node

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  27 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   2 +
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 544 +-------------------
 .../dts/nvidia/tegra234-p3737-0000+p3701-0008.dts  |  11 +
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 +++++++++++++++++++++
 7 files changed, 591 insertions(+), 543 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi

