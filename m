Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D7FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ftpTpUPuup/zc7/H1kJE7NPrluIIdzjmJzVnVd/TRfg=; b=3d5+2He8WBfzcO
	7+JyHNyb+wEc6WVl4ZgrcqrD8xs3L87HyOZtqEi7TlDRd5bSZh49i5Qp67SRm/Fh/BuKB6+f72qpr
	j0c0huAegrgYFi0qpKIbEYbVG0ep2pvHJj0ZVIQkCaoKn3L4Wah/FV+1RX7/uSPhJZUrUxtLgZ5pd
	IybEbvcBbcZwcG9SWaC2qUAvLhG6wGLUIQ0MwpuiQdk5RuvzRWBolpxpk9VFsbiFUrf0yZpewBrvf
	adJSGcnDdcZtyou+gTwLLbt1p4mI1K6EAMoIrP/kc9L6quaa/+Hcs1AJpWIiWyQFMhW9FT9NMSdmX
	T2pnmALz+7ZldA48OoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuj2-0000000F7FY-3ooC;
	Mon, 18 May 2026 09:57:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuj2-0000000F7F7-0dK3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 09:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ftpTpUPuup/zc7/H1kJE7NPrluIIdzjmJzVnVd/TRfg=; b=XqqnBS3/BBddu3pn+9cERsvDMv
	/1uZcCYSuJqbdooWvZJJJupagmUwEW/6Dv74V5pGtI+8XBt4QSf3oWDTUBC9gLRIkBdyVpLVEaiYk
	afftE9x7ZH2r3sMFd1c1gKXqxM0QWwc2dGhzY8hGP+31NbfXtQJVfcICpIcFKQ33i12uI2e0w0nWX
	9lhodef2+mUPuZgNUEB8T9ItxIngIUBHJ/ZSOEoMGiRfryBOFq69Yd+xIYxtzYTO0vWVnQ2AzRSCc
	CUHQRmbPTWHpQskJaLYBHhaCIY4UYyqHiqbi52/p50HNGNRNhrkv3GSRWst4EM+wbdgTLY/3RrEfx
	V23E9dxw==;
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuiy-0000000AfBu-1kEo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:57:26 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 May
 2026 17:57:08 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 18 May 2026 17:57:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
Subject: [PATCH 0/2] spi: aspeed: Fix __iomem annotation and VLA parameter
Date: Mon, 18 May 2026 17:57:06 +0800
Message-ID: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105724_889282_AC3735BF 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

This series fixes two sparse warnings reported by the kernel test robot.
The first patch fixes missing __iomem annotation on an MMIO pointer
parameter, which also caused a redundant cast at the call site.
A VLA function parameter warning is also fixed in this patch series.

Chin-Ting Kuo (2):
  spi: aspeed: Fix missing __iomem annotation in output transfer path
  spi: aspeed: Fix sparse warnings for VLA parameter in calibration
    helper

 drivers/spi/spi-aspeed-smc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
2.34.1


