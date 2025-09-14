Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4EFCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=; b=toZrX/beOdmubA4ACdZl2wMMc2
	XMGBMPZkXTMJ7/Cr7TNCpf3r0+pJcGO2ybnDBz5YvbZQi0g6OZDM40kZljza9GzNpRelKG04l3CzJ
	2tE516hnWRlQF3WbhVPzGg3BpIFk+yln7e5Ql1vIdky/BMZwZ1rb5twXEfsQpqjpmfbMoprxdbRhA
	MToEV5StwCOYkSx2tWrkJr6yDuoKqTC4eEKzVrsknCOKLRi5DCzmFU5oJof13OWcAGXYaFSmrLfOT
	VuKdfwLTGBhbvHVey5YvbraZwTDmi0+mKC5S5gBvfRN2FPywbX9VVIj6P9qmc728XHfU7t/ZrtJJl
	I6PdEx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOk-00000000FxU-0Ebn;
	Sun, 14 Sep 2025 06:39:42 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOf-00000000Fty-07UP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 06:39:38 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so1579335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 23:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831975; x=1758436775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=;
        b=U/HRmg0iQgSRBdq4v5ZHaFIIz544NgNmQhIhxEHbV85LYEytzxu0cK81y85WdgRBiB
         ibJDhTA+JCbl04vkbBGPXMlhzMcoj2hb4MP8lfkOa+X0jJJOIOws7XriDq5cWLegRIxu
         LxCbX7+EJXZ+gNvMaXxoZj8HgYOK8RxYhF0a+OX5mCmC6AoIjl2a4hpfDzHr3hR6M4PI
         W+L6oBYGm1m9GWjXIlyVOFDGmPn6hGVybgL+F9Z0lTCjw4DudskUlGDsfO412BLkabQe
         zu/xLJPe7ZH8BAp1+JPVThR84yRJK1c/6na7muMKa5EGzVfLUVrrHZVQRPcC/NbWXSIS
         sQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831975; x=1758436775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iROJ2tx36gbrZBejvZUL/Zr/rsiyI59LCcbHtmzoHL4=;
        b=KC2faSO9xZR6y9v2i7bbEPjdM4cokxbTpB/UWho3vSRfvR28L26+7cPblRDnlKsCoh
         dlCqAKyoXUQW8z5RTrbOnRhZ6kgjr/g5oJ6xZFkvW1sm65xkOy9i1j1Mxe6e6QFhVNX2
         QV1JQLoxlTTztbFOSzDCZpKCmZKO3h1IJVtSeceav8DthbC1reNf/PexyjQPlUTIcUZN
         MsC7093v/lUw+IaqMAalA11tcei07vngRmyXGBzBT9ojwy955jO2KWOFdgb5SN4qn16x
         dHlK9GqBfOoiiP07L7dIsq+H/PfQrAFFzFyN6bDAzb9Pn98aevetSHrzZeYs2ywHLRP2
         y5yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPHkoDTTQTj0V9x6OXoRQBSRy9ReLx/f6YS9v1X0zHq1iOGjyGv/hiEGEWPUmtYCI/l7uCfABd3NwnDDqsLCR9@lists.infradead.org
X-Gm-Message-State: AOJu0YyO2E76UymcZV6rNII1/z7hWBEdzPZzJgOBUdcI7sVNpsYbkSFV
	iQqJBLROjAweeZGpr+RoJ4rZtTfipZiRzPe+0OVn3G686B5upLSD4BMq
X-Gm-Gg: ASbGncsmwYrDNDo/zbcPXs1FUPUL4p2f5dvBGnE3FDazVUULRzj2xO/oqUuKuvfQQ4O
	LJHwy/teWkAQSfor5pHNxIF1b/thgGNRkobt3Ke6RGy/Lh6jWCF+4Xt/J4L4HLtUYg9lZLSqisq
	4UL8r0t3tedRrogBSRXfUMa8PR0yDZzDUBmHLI/RodGWTUUYgNOv9sZDLMm8Nj7s+an0Relj/HK
	XG8KysY5AcMuU7T51gKwbFaBa4s2677TGzff0b+fKvOFaE1BGO1BFgqwsx4vFfqNwYIQKV/nsKg
	leaSNKTu95EwrqzqfWXredYBqOpWaG46CWpcSuQLsamnmiXtFEpIa6sMfNuxVZcmb2TLQnJIo2F
	Bp9dnqXl3a5OU9eWSJNWvgpL+vBDZitDR7yDA8Lw370acUz6zeenQeOMjR3XjNUFnYlkiIhYEVw
	tOnJd8MhkPIljF7Q==
X-Google-Smtp-Source: AGHT+IFW+rB6aGFLs4VDxuSN9TMDXFvYUKQVvW3JHgJgSZD/moUw8NiHIlbWSVkHBC+L1vElMhYi0A==
X-Received: by 2002:a05:600c:6610:b0:45d:cfa4:ce10 with SMTP id 5b1f17b1804b1-45f2128d4c1mr71751335e9.10.1757831975159;
        Sat, 13 Sep 2025 23:39:35 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e015313a0sm66917115e9.4.2025.09.13.23.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:24 +0200
Message-ID: <20250914063927.89981-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_233937_085988_934B55D4 
X-CRM114-Status: GOOD (  12.02  )
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

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-arm-dt

for you to fetch changes up to 73e23d3bd7220847c3b1554ebe29221f84a01e95:

  ARM: tegra: add support for ASUS Eee Pad Slider SL101 (2025-09-11 18:30:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.18-rc1

Add DFLL support on Tegra114, fix some issues on Transformer and P880
devices and add support for the ASUS Eee Pad Slider SL101.

----------------------------------------------------------------
Jonas Schwöbel (1):
      ARM: tegra: p880: set correct touchscreen clipping

Svyatoslav Ryhel (4):
      ARM: tegra: Add DFLL clock support for Tegra114
      ARM: tegra: transformer-20: add missing magnetometer interrupt
      ARM: tegra: transformer-20: fix audio-codec interrupt
      ARM: tegra: add support for ASUS Eee Pad Slider SL101

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/arm/dt

 arch/arm/boot/dts/nvidia/Makefile                  |    1 +
 arch/arm/boot/dts/nvidia/tegra114.dtsi             |   33 +
 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts    |   61 +
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts    | 1251 +------------------
 .../nvidia/tegra20-asus-transformer-common.dtsi    | 1268 ++++++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts       |    4 +-
 6 files changed, 1368 insertions(+), 1250 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-sl101.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra20-asus-transformer-common.dtsi

