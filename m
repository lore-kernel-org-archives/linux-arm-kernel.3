Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2008CCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q0T7hn6Hcmn3O8L+5taIn5LeZC4gA5j0z2NoJeNKgXA=; b=pr4pjV3yfkWJ0GwOfhVAeVlc3X
	S7BTqsw3yvTkbnEaaGPE9FU0pg46DaYyA/4AKvgfBHTPr9HGKRO+1iAWdYaJannAyP5iEO/SWbgLm
	PpOxkvQTfvA0ml8iEhOik89bLDlPhklfRg8T71vY7xP1UnbA3Y9/+buDrSVgekbjrwFbLtTaxoax4
	u3NgHHSysLGYiUqeZVsvP42LdIMiAVutI6X2FQE47izUDNBsbaxlQoBrrUXPifMc5TsgAz6Ds9uAr
	MZZ0EqZfmB6CvTkej/DWPHWpCGkazx+GS8gGcyG00itYnmbKzox3sZ/plSlSM/6ytP7tgZOKGDqJA
	R6advLxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfme-0000000G95U-3MOB;
	Mon, 05 Oct 2026 10:19:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfmd-0000000G94o-0ote
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:18:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C71B6022E;
	Mon,  5 Oct 2026 10:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F5E1F000FF;
	Mon,  5 Oct 2026 10:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195538;
	bh=Q0T7hn6Hcmn3O8L+5taIn5LeZC4gA5j0z2NoJeNKgXA=;
	h=From:To:Cc:Subject:Date;
	b=ShZffjXDsuNkZKUOtCz86ZrMIla94P3kgz06VtnYyCdV/W1h4Dp2Lt29/eZ5W8iC6
	 GcUIwygMqbssnFyhk1kFkeLFHDiWoVT7+5egNZwsUwGoqoxehnsC2BoWzYfwnzs9cN
	 ziMQhTDJv1QwT5W/JPI8yFCwEzXjIy7ySupHcj5K1fOP/rgY8JgjMT7NE35uheAe6d
	 91ay1dcn/IGlTi+KuUcYuQJPXc11s9ElbfntetAnlC4eY/xx8oe4l2PZO5HU3DpuHW
	 tlzcFIKzPPy37U7c2OusEl/HCZcsrSWrfeHdRdd/FmoCO9tKTL1d3EnkqFt8qyaV7c
	 4qqVp4VycOpGw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/4] samsung: drivers for v7.4
Date: Mon,  5 Oct 2026 12:18:44 +0200
Message-ID: <20261005101845.34752-5-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=krzk@kernel.org; h=from:subject; bh=ZftMu76KaHNP7B4Xyu0nBI4Qta+mZSrB0c5A0NrcFG0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqw3mFBIH/JtDcr8Tk1xgaJPkGXfBBfsBvDusP/ WXljWjA0nCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCasN5hQAKCRDBN2bmhouD 1w95D/sExJoblMPqtEXVQz6hsbKoP2qjUjecn6JVUeoF1eCHu2zfNILG1Y0tJFs/MFHlwDE5wHh AwENCtNaG0HBt6snipr/ZGu412nJ3paTRb2jV1jQTgOGW8TJneVpPbE0H8jNZHv4Fpejqrfzpus fJWdX7RpQG960mM2P3cLAU2nTRQHrOiC4TrCf4DkDYWM3j/3n8tMF1+Gwrj9bo+A4YfmOIXWtF/ KgHwMX+pBevmIGMhvooVd+s4G1TFfpGNIb2tr6Pmqva7aV2NDCvZ69qvWDwhHX85o1e8eGeF/Ze YMDPnuhCJ6YKHYNx2l63peMbwSEWrRgPsNib+rF8iUL/y1L1ftvEgw1DeAfSSBWAxbT7+GZfYKg rklOi4GULlVHOd/dQGiQaah87meL8ATN0Lp7RfeGdIq/fDHduUn+xxPBna9KLt/YGd0GY+vO4Y8 gxaO5maO7VHxDf7UbpFK9qSJj79cP/lxxjnhIbgjOhRfo9dpVXTIj2PVUxSJNdqrcw/7sR3d8ef OMfdcyf8JoDNyEWiF22gwslXBCN94fJ+WEDQL8KsUi1PZ8BbATWsxxUpqYPbc4T9+ocuOYvWhkF t6bgBvKfdyqLWuGErTAXI438x2guYvVdZJwYot/+Q+6xyjMGCYkV61XLv5YA42+IdKRZ7lsnhPP FBWpt+DLl0lVbtg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-7.4

for you to fetch changes up to 682df6e2330123019fcdb9f6122f34a395082356:

  soc: samsung: exynos-pmu: order pmu_base_addr before the pmu_context gate (2026-10-03 15:45:52 +0200)

----------------------------------------------------------------
Samsung SoC drivers for v7.4

1. First driver patches for Exynos5515.
2. Fix error paths and possible probe-ordering issue of Exynos PMU
   (Power Management) driver.

----------------------------------------------------------------
Aiden Isik (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Exynos5515 compatible
      soc: samsung: exynos-chipid: Add Exynos5515 SoC support

Alexey Klimov (2):
      dt-bindings: sram: Document samsung,exynos850-acpm-sram
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup

Jaidev Shastri (1):
      soc: samsung: exynos-pmu: order pmu_base_addr before the pmu_context gate

 .../bindings/hwinfo/samsung,exynos-chipid.yaml     |  1 +
 Documentation/devicetree/bindings/sram/sram.yaml   |  2 +
 drivers/soc/samsung/exynos-chipid.c                |  1 +
 drivers/soc/samsung/exynos-pmu.c                   | 84 ++++++++++++++++++----
 4 files changed, 74 insertions(+), 14 deletions(-)

