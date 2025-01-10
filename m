Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D878DE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 18:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=; b=UtEJ+bfSrZugEalJjz8/x1GgYk
	xKK4MyV7R/q7HKFrHHaRPdshN+jXdmoV3oOyiT/k7Xxtb6muQYXXrNx3MptE/fCuwS8CTT1nE6P5v
	BB4DHLNtTj3HaMvtQ2yJYnX0aqzSl6QvZ1r8SQf+GdTUaOYvJ0jSp+qOiuW3EGzpxYurhDjTGYIaC
	Kwqjlh7eOXaLhiND7EgCwtOPdGntWHBP8UFIhKu2/i8sE+PnZ4bzIWPyG8lSV3teddpuh3ugMzLy7
	mt/Mtk0LvLlgOTageukjMI8KtMDVhwHquboGsigZchSPtd0EOSoff/W7UPL9jfWQc6xU3ossKQ0rY
	3UDb38KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKCw-0000000Gfuj-05K8;
	Fri, 10 Jan 2025 18:58:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWK97-0000000GelN-0cHd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 18:54:14 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38632b8ae71so1666652f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 10:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535251; x=1737140051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=;
        b=O0tNqBCkVavWQs+xkMv6u3OyI+eoiU2mBQXgnX7BWgVC7vKOHC19bjcZH791lJnKan
         bLby7moHgABkrxWTKRg0pjnuQCczlKFlKbN6g38dXSBk2RvpJJNAyV42DLgB6zWcb/dM
         skpdg5zP4LAQhkfTFu+VirnFh8utUOkY/H0yx/AhfhFPNLQoErLh/KBcifHMuvViw3Qy
         +WTUlivvbEm2c7cCX2JSWa0KlOkOLAQ9v8gN55fTJTeE4UeIlXQyiS1FpmddESmYLFdg
         UTvza7UABs0KQlDoFSLQ347/P2MPVoSJwHfVLH8bZjiFaTCK8mu7SQumZEPxTw3lNizd
         Gweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535251; x=1737140051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=;
        b=aRMqdeXViKXATCphJwHYelIntBGRyM8ra6c8YT1YLGqTS9tPvxkmLMVlVdb2988Tji
         TJ2IWO2+mW9w0r+ZOv7+qDehn09EUMbhinv/cvRyBcVe/2ZMJvnqTenfcovZ/OxIZHk/
         eGEZOeoT5bL33/lCj+IZ8W2woR6XHPPoiF1DkEv3jfwV1DaByc5tYkwzCcSGLdRWbYdM
         kxFPGlherpG/w/NesLBUrTwzDIYNHVtDMnAMq4hPj94Xt8GKWPfsKQAtj92u+IyXOhH7
         GXxfzI1rYgfxq28vnREjP4wmg+/lkwxPyspYqar+vJx4iACAN1307mjzYsy9Jrv5NUvK
         hrSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjJweIVUV8xrKL3zirKZmZMl5U5UltCJuTdyNZdjxZa8QZ9dB3nxQPphwF2rd8W0Nlfh2rnBYh/fiX0ysf7Qai@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi93zjM3qvB0NH7GdIlylHkEBJKiwoBqaY7hTDD8PdkfAvUkAL
	gU3cJEeMxuFjED6Zx0mpsgcx5g2l3h0ITUu3AdJWzC3aV8KbdSgL
X-Gm-Gg: ASbGncsUvbn2larByR7Aw6XsFav4lvZ436aqtcr9SudGMgpzapyedrqbaaeojPkUYPr
	t3MdaEwH5tu4o8STYgIHHggWBzAZVNtDwoD98ZiQJCwCtn8/ZR949L46TRJjYjcPmJ9vONnDK3G
	x5szz19xm9CD9L+7hfep0Kex26InYAq0k340K0Scb0Ey31uDfwP9sFNonWaL/J5ovTvoaJRpiGK
	MfijC7mzvJPdcQDh1AA4bh+/Ue3+1CtQrwYFB6bfV+snsLaqEDxk7mKMDA3n3e2RxV0OU0RTvNR
	lqfZthc0mChkh2d94/olSR3YgqNNmtBnce509i2A8y9PZ2+r
X-Google-Smtp-Source: AGHT+IGL1UNuIWvfIXF5q1ZuB2NL1WSHb5lPRNZ4RnJeqXAHuM/DlevEFHezs0QM4/P/ttrkrToSEA==
X-Received: by 2002:adf:a295:0:b0:38a:873f:e31f with SMTP id ffacd0b85a97d-38a873fe683mr8253747f8f.1.1736535251283;
        Fri, 10 Jan 2025 10:54:11 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc895esm59818695e9.13.2025.01.10.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:53 +0100
Message-ID: <20250110185355.4143505-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110185355.4143505-1-thierry.reding@gmail.com>
References: <20250110185355.4143505-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_105413_183709_04200A95 
X-CRM114-Status: GOOD (  11.66  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-arm64-dt

for you to fetch changes up to b615fbd70fce8582d92b3bdbbf3c9b80cadcfb55:

  arm64: tegra: Fix Tegra234 PCIe interrupt-map (2025-01-10 18:47:01 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.14-rc1

These patches fix up an issue with the DMA support on one of the SPI
controllers, as well as properly identify the SCE fabric and disable
it to prevent accessing registers that may not be accessible to the
CPU. Finally, the GIC's #address-cells property is set to 0 to fix a
problem in the PCIe interrupt-map property.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Fix DMA ID for SPI2

Brad Griffis (1):
      arm64: tegra: Fix Tegra234 PCIe interrupt-map

Sumit Gupta (2):
      arm64: tegra: Fix typo in Tegra234 dce-fabric compatible
      arm64: tegra: Disable Tegra234 sce-fabric node

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

