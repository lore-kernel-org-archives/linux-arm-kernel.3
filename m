Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C954CD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vqEVtc+uhqyRZSMr4I20ikMC6TiX58Bd/7jTlBDcGyQ=; b=tGeInCZdg/c/M4
	6N9wRfZXM0GlOEhCPoppNG7EeSS7F3yjXU31DQyxhjkSgQ742PwnFOpgJZUnF5nWC2vxrvmaHmSNU
	zeFfVlRKraz89NYqWNLV2babnma04VwSRU++Wy6ikzP4MuAQowPX1W/W4Z4l1UWw3Dl4ZALKl9vzC
	LF+82QG76NSPPrTkHqwnOtYmhUYz9eqY06ILAz+v+g3ISeng1Dz2Oh6N/jfcA5EX4vjzMsFbqNabE
	hlkuIlTL937PBAK2r0O7IzXHpATWQPkUf9g4lA6jom/R06r/OB8nf9JtN5sMbNxjX8Ei/ghR0nah8
	s1eWw6fniDwcK6Yx4wVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK7Z-0000000A3U7-09kY;
	Fri, 22 May 2026 07:16:37 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK7X-0000000A3Sj-01ip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:16:36 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 22 May
 2026 15:16:21 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 22 May 2026 15:16:21 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<david.laight.linux@gmail.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/2] spi: aspeed: Fix __iomem annotation and VLA parameter
Date: Fri, 22 May 2026 15:16:19 +0800
Message-ID: <20260522071621.102507-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_001635_043332_98D35DD5 
X-CRM114-Status: UNSURE (   8.17  )
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

Changes in v2:
  - Add parentheses to row-major index for clarity.

Chin-Ting Kuo (2):
  spi: aspeed: Fix missing __iomem annotation in output transfer path
  spi: aspeed: Replace VLA parameter with flat pointer in calibration
    helper

 drivers/spi/spi-aspeed-smc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

-- 
2.34.1


