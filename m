Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoyoztEkUCuwtDIJ1oD9VzDkerwNGbAQFP+wps51TRo=; b=22u6Uu+NucJwminYd3wusJw6Fd
	wAfpDgG5i8mPS9Rst7JbkHZHVkSOo5qx4AMhmmWhIQ/QkvDjiMbiIzY7evzEW1QF1GdHrzS2YIEzF
	m0jbQjfbby3ZWxzfJbHroI1HIoR/EepksyXIaQFreCWTC6I7cbEkDF/tNGsFp5oRt5MWIdvXUto39
	bok0gW9/AFUdRqBZFhTlSuDB5xHBZOny7W4qTlby2NutHhoWrtLuopuJqggs5Q5L7PEiqn5tEkZ4w
	vkAib/kXueqIpJrTiVmZnJhDPcDBjmWQUVC98/gyXZ2FNmpdmdPNtShp0d3/V34V5FUYdxRqW2pTm
	dXpxEpHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff4U-00000007Ie1-1HPo;
	Fri, 03 Jul 2026 14:40:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff4S-00000007IdY-3Hpa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:40:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 405FD60051;
	Fri,  3 Jul 2026 14:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F961F00A3D;
	Fri,  3 Jul 2026 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089648;
	bh=yoyoztEkUCuwtDIJ1oD9VzDkerwNGbAQFP+wps51TRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hFbigXIfXd6KA44WVhCvXBpb5mwO73t/qRpQmG61ZcrNxAeAPGAWssa3Q4ApVbcL/
	 vvqLQhnysY1Lc+YsLyNMn5jmjOGD8/UF0rUuOBV+XZN6w91J4/d/5+J0bBfkve0Blu
	 +W5XW/ztYo5jVweSLzPy3tYNYtshxfUpG426lG/W8ClkTEBxow9nuakRC7ifrzwj0v
	 CqIfOHeCopZEmm/9DF2ffLYSI7hquSyOHfuAp9L9GfdLTwMbMQJgFf+yFcvih0Ax2P
	 dolj4B96kcnxH0p03i35ZjCUv/zOZIPBx0rVJThmcLCS672pa/06hAuWkR0EuU7jCV
	 2zrekS0CBdm+A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] soc/tegra: Fixes for v7.2
Date: Fri,  3 Jul 2026 16:40:36 +0200
Message-ID: <20260703144042.1190046-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703144042.1190046-1-thierry.reding@kernel.org>
References: <20260703144042.1190046-1-thierry.reding@kernel.org>
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

The following changes since commit 8b8ee2e56f951ccf41d98eebe73195cea487cd48:

  soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info (2026-05-29 14:42:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-soc-fixes

for you to fetch changes up to 265d5d4032c5f6eb089a6e6241d37fdbde7da180:

  soc/tegra: fuse: Fix spurious straps warning on SMCCC platforms (2026-06-22 09:25:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v7.2

Fix a spurious WARN() that was checking for an outdated condition.

----------------------------------------------------------------
Breno Leitao (1):
      soc/tegra: fuse: Fix spurious straps warning on SMCCC platforms

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

