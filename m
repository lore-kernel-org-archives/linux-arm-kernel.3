Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C43CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 09:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PV8rKwcRKEh0b+cTNhRBla7SbKxO8bHXM9Umtgo3gb4=; b=yAqzHvoM80Yd7QObfR/v26i87s
	ZNJQI7NGmLtrxQpyY6NNsziEXLA2Jo7N998XL/2QMETCPLbKqxfdQvPYrnrWkHN4cKG7ci1a4Kudj
	SVUzw/i+RFQ4lpuqfFAOip5O8WD8pJxKBsHrLNtXzUwHiwWohzuGXzmjYBLksPKkKdfLjISWYaKvA
	zNUlaj/1I078k8cdKbvJoUkTJzzkbHVfQAYZzjsslrY6FZmMx44zCJ9Es4y1w9ygcc9zla3qBWe0o
	HZ2Y67/CspSGpCC9f9LAjWVX/lAZb2+ljYAXRXtLDF208mywCeW7NaQBst2ZlVFtW7wreflklGGSf
	UkFBim/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwST-0000000DJGV-1uV0;
	Sat, 03 Oct 2026 09:55:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwSS-0000000DJG9-3Xwk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 09:55:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E90C8602C2;
	Sat,  3 Oct 2026 09:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F381F0089E;
	Sat,  3 Oct 2026 09:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791021307;
	bh=PV8rKwcRKEh0b+cTNhRBla7SbKxO8bHXM9Umtgo3gb4=;
	h=From:To:Cc:Subject:Date;
	b=AmT3xio95qEp8SJcfk3O/P1waMVMB1JfPeSsdq5rBc9nW+Ef3+jjgJyVT6te3/qgQ
	 n4Kfvo3NCqIQxZn3WNSA1vyxjAmLZ3bV0/oIL921ZJfJoJ2mZkPA4YHtPeBHoNGOAU
	 C11JiBJWUlN4d8zv9wsUYBNBVrGBLk3+FU39xEdCAA1jpD0JwKEJTrhp+MQyXzHAeb
	 aaszQqNY2rdGsJqZQEdy+Pw1r6Wave9XKOd7RXdj8CWO4io5XDO/E0cyGzTXCSY2CC
	 Ow1vAds/2DU7a793FnNWe2wFs8UJf++gwoc4ArsFHJNEXmDbTgUjx92XBjUnw32dll
	 Qg7xiAf4TFa/Q==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/2] soc/tegra: Fixes for v7.3
Date: Sat,  3 Oct 2026 11:55:01 +0200
Message-ID: <20261003095505.1369507-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.55.0
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.3-soc-fixes

for you to fetch changes up to c5c95dbdc9011a56359df4dc00be829bbcc0b036:

  soc/tegra: pmc: Fix uninitialised clock rate (2026-09-10 14:40:22 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v7.3

This contains two minor fixes for a missing newline in an error message
and an uninitialized clock rate used during suspend.

----------------------------------------------------------------
Jinhui Guo (1):
      soc/tegra: fuse: Add missing newline to APBMISC error message

Jon Hunter (1):
      soc/tegra: pmc: Fix uninitialised clock rate

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 drivers/soc/tegra/pmc.c                | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

