Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2563C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vu1I83CnZIHvvoR1PbXWxMi/QaYDMKy7JaNHneju1vg=; b=Fittwz9acKbs+V
	Z754rp36OYj4uzXsQl6xS9xEdbuItiU84cSn2gZEIKxhrFA8bxLHyNezXO9ijUpMvRWKMMLIcRKo3
	u3OHDllADoexwsKdUjKhwE+5PCtqxV3DZ1OHQaaqOa3jWAX3+JjK8yYQVAx6jbB/gSTw2iTymihgG
	o/2AG0AZ+2tgFu9kdIHMIClWHXjFgHQeh74lCLJ/nh9CzYYtVAa485/vDSjHoeij64WF+okNMbjK1
	IUrjpodAfg5p3Khw1L8hgflUrhvs/vyIykPbuMWQHVp6s+jxhDPrBqYD9BqQ2OcdSjfJc+a3bhDIX
	otj88nIp74qaMTmHUdBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMk-0000000044z-1DNl;
	Thu, 13 Aug 2026 08:00:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMh-0000000044C-0bdw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:00:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8695C4E411E0;
	Thu, 13 Aug 2026 08:00:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59D0F602B8;
	Thu, 13 Aug 2026 08:00:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AB5D11C4DA82;
	Thu, 13 Aug 2026 10:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786608030; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Vu1I83CnZIHvvoR1PbXWxMi/QaYDMKy7JaNHneju1vg=;
	b=ufP8VHahpanRL9IaHzNx3fOWYNjS6wwde8X1tPuw+liX071mzngS32gZbGAKOqp/2tjsIv
	tlu8DP/m/xnBCaZpUx3fvnC4HtBPCGoFG+qF7exhA7paGAwcxwl4ovVRBv/y/zd8niGJ42
	0izxhoSNe4xWJL5QohHiCjn/gk4HV/cttL+FY8f3eInzgfs13JmRr7HdsKVLhn5ymEl7jv
	f0GmUTSW2dWBXyHfmib2ek4XtEMy5YpRMFceyQFdrwrD47oTXQJRAIVZqCBZXEH5nsqNYP
	Y/u3lfiUr0GhRK5D98uiaEkGybB85aH5LpFjYJ2qQhwPSAxUJ0LJ4TMNdrZsPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/5] spi: ma35d1-qspi: Improvements and DTR support
Date: Thu, 13 Aug 2026 10:00:20 +0200
Message-Id: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBewLTrxV8YOsUaXg9olKoL47
 xaP7/JOMFZhg7Y4QXkXk2XOcK8C4o/mkVH6bPClr8vGBUystuBEoeodbslWZZrwb0nQxW6IFH2
 o3wQ5SMqDHE/++V7XDfGGanlsAAAA
X-Change-ID: 20260813-perso-ma35d1-upstream-qspi-1cbfcac2367a
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_010039_327984_2EF332E4 
X-CRM114-Status: UNSURE (   6.09  )
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

I am in possession of an MA35D1 NuMaker board. The SPI controller has
been contributed, but:
1- it lacks a DT descriptions [1]
2- it does not work with current clock driver [2]
3- it can be improved
    
Link: https://lore.kernel.org/linux-arm-kernel/20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com [1]
Link: https://lore.kernel.org/linux-clk/20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com [2]
This series is addressing #3 by:
- reusing existing helpers
- refactoring a bit the code
- adding DTR support

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Miquel Raynal (5):
      spi: ma35d1-qspi: Remove redundant reset operation
      spi: ma35d1-qspi: Move speed setting to bus configuration
      spi: ma35d1-qspi: Allow several command bytes
      spi: ma35d1-qspi: Add DTR support
      spi: ma35d1-qspi: Use the existing update helper

 drivers/spi/spi-ma35d1-qspi.c | 108 ++++++++++++++++++++++++++----------------
 1 file changed, 68 insertions(+), 40 deletions(-)
---
base-commit: 1ec281b42ee249cfe9bad52a54149de29ed6aa78
change-id: 20260813-perso-ma35d1-upstream-qspi-1cbfcac2367a

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>


