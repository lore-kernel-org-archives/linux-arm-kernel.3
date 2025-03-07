Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9226CC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=; b=AKAeK6VtiiGic1PO83V2U+gZLk
	bSmiRj63mmo8o8eC6vWIAcYM+1qoS0v1txVazwZYr+l0XQKB5YMwZPvJUMbcMlEVjST4adWYIx6Qh
	OexvXtQAEVW/kjTKmdD1N8ndzAeiixeWPax8kQx5FKbQQIlW8wCsnI2F06V9BVeU+I2qSWn2elVaP
	xOqiLu4nIT730mquI1S8v8eVWHhD4nKHMR+JS9G0I38wq3LnvtKFDYyOWtS0M+I1pt484Yg4TrKKD
	KFzz0a4dzEZNSSeavsSeCvgemtw6e0Yyk3Opm8i6TlwBvi6vkIe0c2ohQAu/jPztSkXowFEa1DR19
	NzukUJqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcF3-0000000FBtc-2R4B;
	Fri, 07 Mar 2025 18:16:13 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbpO-0000000F6zY-06mT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 17:49:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38f406e9f80so1572956f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741369780; x=1741974580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=;
        b=Ph8CEDdpyvlBhLlv0xurZCqsOxAEB1kZKca4Z2/2d8628BtZCZiKm1WmeavcxWDC+q
         ku5VIWvrGooQ93kQshPTzvf4NS36IM88bVz0gTE9FrDk1HS7o7J9K9PU8Hc0VHkV108r
         zsyq+LPjBMDPXqj3pWMAxgqp/uJgyjPop1oGFSENEWMbabkyPuMBhZflX5vwUiq+lC8O
         DPXRnxQihDMZNx6EGuVnpylvC4IcpcKaHEeZfi3VR3thw3IbD1DFWAlIsnD9HaWtceq0
         Ln4yrzHaQ144/hvVhp5AknGOvpf9E67tOP29qEc9XOCk6IjCy7kaeRbV5MjvrB88G0HQ
         eM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741369780; x=1741974580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J90ROVYIlVunjJAyLM7koC/nUgKephX5yjyqgLDTy/o=;
        b=PTEYfT1HQZk5gkmfU5dDLu/qXXgcRjX2hMIMUHa3NnQ/u2A4Z5U0YZRgRZo7L955ww
         0eDtTASjkvobzdLtV9NUW22xmsG/hNtNiEhbVKs9vrNtDsNUB/FiXC6Kra8LV+pV462j
         11nkmiDFMV9Z7pxhT1IkTHCagDyArIiPA5co+cTpjQmoB/Qyp8nEQ+DPVRClEHkGmSDQ
         wS0iRp1/WjojxokV+d+Q1F508BIddXnI3snjyWU6VjHwhmQgMUKhOc4MEwqIaRrx2TL4
         X7apwaidderaXAlyMPbnHHGMffw4zlLf3fGeDMDLnQ2eJxJBK/YrshgnRdqt+/y0FsNs
         HkcA==
X-Forwarded-Encrypted: i=1; AJvYcCVxcQBeziTXuTBK0XALJi0waJWP1B3Tou/vuwKwrA+8SNq9s9L/iIWZsj55anHa8c0xQZ9vvgyl91CXrXYLOUo1@lists.infradead.org
X-Gm-Message-State: AOJu0YyVitCdR75ujwC/yEIdr0bzKISZOFu1z9wVLHX36inC4nuvIung
	zmP+wvv4AUvscHVmgDz6/jo3e8Fh+r7l6nd0Qfd7EzUKZGxxfqDf5WvcJw==
X-Gm-Gg: ASbGncu3IZVxNuyVgfkqh53wHlkMyquNsWsTkb1AlW30ROT9pITeuBB7WwsDStUdUS1
	9BxUX8ywkTiPQK9ICEruxEa84CvwQhqjUh4AILUBoXMrhvLRC29xZ0XymdWWjOXP19OPfOf7xEj
	iyB8rmj+UiuFXqwx5AYPkSWf4dQsHe6++V/yCHyOqhU/FHS+oyhFwtipGD6oJ90n1m+H+o2B83P
	KT0IjCh+9Sa0ZjzDK1k68ouMyPiqVWtOwXyBxRmsLTDpO25OB3oIgf5IIDy5ljN86Cr1x9p6vs9
	E+bAqd0leDy6u9wXTYF382QiFBhNAcG7Qg+TKcM/jvQY312PQscudw1HyONWUXD7Z/7+RdLzN6W
	vHnGS3KrlGaqF9JkVfrBoZTAJx84j2tYlerlz
X-Google-Smtp-Source: AGHT+IFQwfhw0TWFcyPyKOcZOJGtcyGZ4hJE72wsBJf4kNuTmJUWQ1NzJYzItPPrui90jo20M3KYow==
X-Received: by 2002:a05:6000:402a:b0:390:e535:8758 with SMTP id ffacd0b85a97d-39132d2afc2mr2954780f8f.9.1741369780278;
        Fri, 07 Mar 2025 09:49:40 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bdd8b04casm58181535e9.8.2025.03.07.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 09:49:39 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL v2] arm64: tegra: Device tree changes for v6.15-rc1
Date: Fri,  7 Mar 2025 18:49:37 +0100
Message-ID: <20250307174938.3456275-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_094942_064119_D02FD286 
X-CRM114-Status: GOOD (  10.20  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-arm64-dt-v2

for you to fetch changes up to 65d691a4400e111e8bb2422a5f4f28de34298be7:

  arm64: tegra: p2180: Add TMP451 temperature sensor node (2025-03-07 18:38:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.15-rc1

This contains a patch to remove an unusable key that was erroneously
exposed as well as a fix to support GPUs with a large amount of video
memory on IGX Orin.

Finally, some additional devices, such as a temperature sensor, are
enabled on Jetson TX1, the output voltage of some pins is adjusted and
the VDD_LCD_1V8_DIS power supply now uses the correct enable GPIO.

----------------------------------------------------------------
Diogo Ivo (4):
      arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      arm64: tegra: p2180: Add TMP451 temperature sensor node

Jon Hunter (1):
      arm64: tegra: Resize aperture for the IGX PCIe C5 slot

Ninad Malwade (1):
      arm64: tegra: Remove the Orin NX/Nano suspend key

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi       | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi       | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 10 ++++++++++
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts    | 10 ++++++++++
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi   |  7 -------
 5 files changed, 52 insertions(+), 8 deletions(-)

