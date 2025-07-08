Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07280C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uuu8lpFeY80ClgGsq/Km2nu3i+uX/eGJHhg+l4rKngw=; b=SfLBCnrRFIw03lzS7H4C2Vxoup
	/nVH+qVz/rdlxuy9eKbjKeMfJ9vTWXTok4DOxF6okh9c9lM05NbOyUHAvGQA0ipRg9gLxajse8bsQ
	rU+s2MYtjuFopa9+By2fupBNq2BrBq8JhIUawbpJFTrqz2qj46VT43PjLhdtu5+Y4v+gMjNGDXM9o
	RazOOsS53wSAOEIGQxN46mFph4a38oq+LR8CJpZOYJG6iOdPfOgyQQNT9W/NX2Klf+W6ZA3xufg2G
	b1kCAo7XrLLRVHkdwltxXwGtb1ZTcBuINcufvUqjZGLAt6MwDhymplogNEVPu6h+fr3gRcEKCRPe3
	UnunJFCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3lh-00000004lGv-1LFM;
	Tue, 08 Jul 2025 08:33:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3gc-00000004kNu-29Vf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:28:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a54700a46eso2115174f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963301; x=1752568101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uuu8lpFeY80ClgGsq/Km2nu3i+uX/eGJHhg+l4rKngw=;
        b=WYc5CE2+wsp7WraSwv2B8e/eokNneWljmKbdWtD0up0cH17JdJ77tND5DuMkjE+Kdc
         vst9316fNkLivgCNz5bucw2TYrDj68veQpKrE+jN58Xzf/MIXYa8XIp7Rdu2Zk/7Z6UK
         F3CQ6niTh2Ij7mzuxyWlHqvTtwvMOxezvg9IjBiIOKr3ZyoCF8XaomtjQ9YOTHtClQzL
         tP3kjWmbS68kpZVCVC9tVrf4+fCdRHKFnZNVdprW7cLxem3wUyGcwcgHi3LQE9XKb8J3
         VtGK6NR9U7DBWWHFydOxrcYhymRreUuacPyYMduHng/NiNmvaI0irYF7bvngYrP8wz/P
         qEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963301; x=1752568101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuu8lpFeY80ClgGsq/Km2nu3i+uX/eGJHhg+l4rKngw=;
        b=WXGpZ3U23HabTjvaFpm+5y/kykGoeBMHoeC/PSa06Rni50onO+QnuscB5biOrlW1/5
         aGxKhtbR5szRw+oVg6UJtc8GZjVQgLE5FSa/4a1lALDwJuPRwZKT7NqK965MbYSigYvO
         UzIN2bXgpQv730z8cOcC6hIceiH6xCr4oQYY1ET4aiYTBzgNkOzDUBlp5AMftO5AZJQK
         KXx+zDx060WPrBG5dCWVXTPE/DCyHbllZot/lMz0GCo9+z9MiX2BquvOaHiljMSXF+4w
         W+U/pRviYpHTTxklMQ1C6F6trBORzKdPiqCmxlmrPPqkYn5g1bOTCeMV2KN/1smCyNV/
         9s7A==
X-Forwarded-Encrypted: i=1; AJvYcCVdOLLfcL51tUrvkOHZq2DS29IbVWxijsRI/3h8AncWAB3aE8G0AGRMENbZQatnsGEO5ydt1ngFeIy7ZHf6uqfh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gfsN0BOIdiS+zsedqFkw4sG3nssIQKtrzBwtFTh7pghRMW7t
	b3bGkwOXc2JdHUJXXw+xVcyIJ3RIjY/5O3NHWQr2ryzw6HjspX5EJ8Nuyb+exQ==
X-Gm-Gg: ASbGncv0o0T6CNVhRcnOJ9aLSpakI2cTr2iE7skRNM6EAGridRayoecFo5klROFayCn
	zO6CTB+O6JRG4cBIDemrQaTLyF4ka+tumzjqHgSS77OMLMWoZkWFc/RI3ndJrLRF13ouMASsyMg
	lZQy9yWvsfwQe1US8XwQheahWGaKCW+3g/9C3DCDiopC04YDuV8Nbxrc5C9lULP+zWj/oaS+0jp
	auyOkSx+yi2a9VKxKoqb6uQpjRL8aEfTclMHO7ZFT3gy1gfPgrJIgSB1nRPtwhScaOmeyHSXFsg
	GDOq/WK3yTY8yk3EId9xrLzE8jWqv9gKlUm9RuZPBaCriuewKDLc942QosLxVrAJaIfyfA6sKOY
	p2GIJrGGNi/qLsPqet5+MiPWsl7VuQAbr9EEwEOHeMRQHya0KteYJIA==
X-Google-Smtp-Source: AGHT+IEMixIAPuGtPEDuQ4OfLFoWm2PdLTuS6TyGGJxnF1mVvyiT8xcKYff9ghRZA8Ouj+E6IW2n6A==
X-Received: by 2002:a5d:5c11:0:b0:3a4:dd8e:e16b with SMTP id ffacd0b85a97d-3b5dde9588amr1635900f8f.20.1751963300788;
        Tue, 08 Jul 2025 01:28:20 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c9f9sm12515888f8f.93.2025.07.08.01.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:19 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] firmware: tegra: bpmp: Add support for Tegra264
Date: Tue,  8 Jul 2025 10:28:09 +0200
Message-ID: <20250708082814.1491230-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012822_550217_A0586BD9 
X-CRM114-Status: GOOD (  13.06  )
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

This extends support for the BPMP to the Tegra264 generation of chips.
Most of the BPMP is similar to earlier generations, but new features are
added and old ones deprecated, so a new DT compatible string is added.

Note that this series is a more logical regrouping of patches sent out
earlier. Patch 1 was already reviewed, but I've included it here for the
sake of completeness. Patch 2 addresses review comments from Krzysztof.
Patches 3-5 contain some minor Kconfig issues as well as the Tegra264
support in the driver.

Thierry

Thierry Reding (5):
  dt-bindings: firmware: Document Tegra264 BPMP
  dt-bindings: Add Tegra264 clock and reset definitions
  firmware: tegra: Fix IVC dependency problems
  firmware: tegra: bpmp: Add support for Tegra264
  arm64: defconfig: Enable Tegra HSP and BPMP

 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/firmware/tegra/Kconfig                |   5 +-
 drivers/firmware/tegra/bpmp.c                 |   6 +-
 drivers/soc/tegra/Kconfig                     |   9 -
 include/dt-bindings/clock/nvidia,tegra264.h   | 466 ++++++++++++++++++
 include/dt-bindings/reset/nvidia,tegra264.h   |  92 ++++
 7 files changed, 568 insertions(+), 13 deletions(-)
 create mode 100644 include/dt-bindings/clock/nvidia,tegra264.h
 create mode 100644 include/dt-bindings/reset/nvidia,tegra264.h

-- 
2.50.0


