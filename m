Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623F1CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 06:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEQdMvhQaZH+w/Xip+f4KJnuDYLdQkH56ziSK2nQiBo=; b=eM7720dHEFNRQ/pcUdJklIyZCN
	5JHfTmzLC5uEiJ8UepwI3PGrkVZ/JJELhYaksg32DSNd2Pp1u/bkUBtGsKT7ONRoKelZnDUwx2rSQ
	OQXGDSiw13tP/i6FwyUkKO1R+g21fyR2RSKb9ksmADraktHgsVwIPsPp73076ErVPiSJm88leMk9L
	jx9S/EfuDSF2hcNIta64EZKEsrNd35Wx3le6B0TtCCSGPTKSuA9iQUuYAcR5JeiW0xM7o99ZG/TMF
	CsF3XeGKKW/pbh4Uvq6Fq0YiVlerao0Pb5/N0uWifU40cf7JtxIDp7Bakitdi6U3H/P5h1pUFEIJQ
	8atmHj+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLk-00000009H6b-30lU;
	Sun, 31 May 2026 06:08:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTZLh-00000009H66-2329
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 06:08:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB5EE60139;
	Sun, 31 May 2026 06:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBF91F00893;
	Sun, 31 May 2026 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780207716;
	bh=fEQdMvhQaZH+w/Xip+f4KJnuDYLdQkH56ziSK2nQiBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZBQFc99rVeEuolU/v41n34dpXjjOijgAlp/iKxFDbCglH2f/22mx8zlyfkTtSQYZD
	 K+CHYHOUa4susBQUDr04Lpuo5EEoZOTOIvQe0wG3cxcACqhoddHIaD+tooE5TdNlhA
	 51OiXNCz9ptMq7JuLKsCJYtAVyiiqINyNay3MIfhsR5HlAPuBCMTMfwGrPzT//IL4+
	 FKKAwV8lV8himzVPFEYcxCYl/Ocjh4DN4bFnIMbEnP3kMy3kz19e6TOqrjwjhWdGRg
	 FmOwi17YTXbLWxhK0UU75B1h/GeCbvVQ+JnBDBnhL6Y/jgfdHLF4JOTMFycVJKY7Hs
	 ykE1JaVHVk2dw==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] soc/tegra: pmc: Changes for v7.2-rc1
Date: Sun, 31 May 2026 08:08:20 +0200
Message-ID: <20260531060825.1855391-3-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260531060825.1855391-1-thierry.reding@kernel.org>
References: <20260531060825.1855391-1-thierry.reding@kernel.org>
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-pmc

for you to fetch changes up to 2cee7da9743396aff1fd13124109c78975c92ad8:

  soc/tegra: pmc: Add Tegra238 support (2026-05-31 07:21:15 +0200)

I've split this out into a separate branch (it would typically have been
part of for-7.2/soc) because it contains cross-subsystem patches, so the
separate branch would make it easier if it ever needed to be shared.

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: pmc: Changes for v7.2-rc1

The bulk of these changes converts existing users to the modern variants
of the API that take a PMC instance as argument. This completes the
transition to multi-instance support, which then makes room for cleanups
and restricting the remaining legacy APIs to 32-bit platforms.

Some changes in this set also clean up powergate debugfs and restrict
the power-off handler to be installed only where appropriate. Lastly,
support for Tegra238 is added.

----------------------------------------------------------------
Diogo Ivo (1):
      soc/tegra: pmc: Restrict power-off handler to Nexus 7

Jon Hunter (1):
      soc/tegra: pmc: Populate powergate debugfs only when needed

Prathamesh Shete (1):
      soc/tegra: pmc: Add Tegra238 support

Thierry Reding (9):
      ata: ahci_tegra: Explicitly specify PMC instance to use
      drm/nouveau: tegra: Explicitly specify PMC instance to use
      drm/tegra: Explicitly specify PMC instance to use
      media: vde: Explicitly specify PMC instance to use
      PCI: tegra: Explicitly specify PMC instance to use
      usb: xhci: tegra: Explicitly specify PMC instance to use
      soc/tegra: pmc: Create PMC context dynamically
      soc/tegra: pmc: Remove unused legacy functions
      soc/tegra: pmc: Move legacy code behind CONFIG_ARM guard

 drivers/ata/ahci_tegra.c                           |  17 +-
 drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |   9 +-
 drivers/gpu/drm/tegra/dc.c                         |  14 +-
 drivers/gpu/drm/tegra/dc.h                         |   1 +
 drivers/gpu/drm/tegra/gr3d.c                       |   9 +-
 drivers/gpu/drm/tegra/sor.c                        |  16 +-
 drivers/media/platform/nvidia/tegra-vde/vde.c      |  15 +-
 drivers/media/platform/nvidia/tegra-vde/vde.h      |   1 +
 drivers/pci/controller/pci-tegra.c                 |  19 +-
 drivers/soc/tegra/pmc.c                            | 648 ++++++++++++---------
 drivers/usb/host/xhci-tegra.c                      |  38 +-
 include/soc/tegra/pmc.h                            |  81 +--
 13 files changed, 507 insertions(+), 363 deletions(-)

