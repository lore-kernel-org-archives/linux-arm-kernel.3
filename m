Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08760C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 15:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pf36wxJupHA4Xe6B/0FbJUyw03mQL+xsO5YFqwowTBc=; b=vxD/O9v3NH1ChcaHGiaEDkluoe
	fzZUhHuhHrshvwIaQCJ5cZfyMdE0lRl/Lme259TwUjBnJomsyA6MMl5gkSaC66nNNg42ljVdqsE+t
	ax3l66zf7BdGt2rdm471a+I5S/cMjrb6T/0D05IR/EM1TqR6aqbVLcu27l4u7ep4HGLjlBZIE6oJF
	++AYuTskrO2XIiUkSbpabTdjG5tM2BvE9QfjbndaQ/UGJIopMBXKzQt/4eYxRPgLcvqE3qlASFgjs
	WsnAjS75N9BTV5gmyzFEcpHNYkIWoURBahVceYr7k0pFItSQGzwTJrp4gLQIQygsIN0/02LmZ2VBL
	HZ6EuBaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff4R-00000007Id9-0t7z;
	Fri, 03 Jul 2026 14:40:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff4Q-00000007Icu-0H11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:40:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6AE2560051;
	Fri,  3 Jul 2026 14:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D70B1F000E9;
	Fri,  3 Jul 2026 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089645;
	bh=Pf36wxJupHA4Xe6B/0FbJUyw03mQL+xsO5YFqwowTBc=;
	h=From:To:Cc:Subject:Date;
	b=U2CiCfqCnNyy/YHBAdxdljAnfG3k7NegO4Wn7foBU7NR2aRSeV3pX1zV1NVr27gd0
	 hpsTxJRicXbv7EH0SpA7q9DxAljSe+tBnLWujFOmDKA7z80mIpBpx3NthgNVJFoiIo
	 1w2KyP1Txy5TxIU2c1EIy+66F6MpRG76hgAQM6K3mMoek9qROuMT+BATVvbHkOQcNt
	 g4ucBImatA1y2kGPWq7dHp+Rptk185M0K3kMxL406SKp9EEbD3JuiwmpmcqZCNg86W
	 gqvRoh/0bnOn7rOlRnOorKgBKjmRkuPcwXNxjJmrOpCW7Z7L+Q7UKaMsFgZqU1ijva
	 wMXRIwOci8Sqg==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] soc/tegra: pmc: Fixes for v7.2
Date: Fri,  3 Jul 2026 16:40:35 +0200
Message-ID: <20260703144042.1190046-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 2cee7da9743396aff1fd13124109c78975c92ad8:

  soc/tegra: pmc: Add Tegra238 support (2026-05-31 07:21:15 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-pmc-fixes

for you to fetch changes up to 813e034925814858cc52e7de321ec4848314e15d:

  soc/tegra: pmc: fix #ifdef block in header (2026-06-22 08:52:46 +0200)

Note that this contains a patch for the Tegra DRM driver that I'm taking
through this tree rather than drm-misc because the commit that it fixes
came in through the Tegra tree as well.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: pmc: Fixes for v7.2

This contains two fixes, one for a bad error unwinding path and another
for an #ifdef block that wasn't covering all the combinations correctly.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc/tegra: pmc: fix #ifdef block in header

Christophe JAILLET (1):
      drm/tegra: Fix a strange error handling path

 drivers/gpu/drm/tegra/sor.c | 6 ++----
 include/soc/tegra/pmc.h     | 5 ++++-
 2 files changed, 6 insertions(+), 5 deletions(-)

