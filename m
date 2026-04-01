Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37637D3514A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k6ZXB2M93bA5FIUMoEbLvEJgGSE4j7dc243fvIGTs2E=; b=r6hK3dAHBZp7gQJxzOMjqTr58G
	VyQW22cFEQ8IVB/72qUKVyNgM7DkWxhMKAHTMHYYfV/A0EwuK5WINJdLopUEcLJrlsPKTrYWjY3vg
	AHNKefkFh3aArmqTLw4YZQDFIUbyMosSnbGAQ2xuFBcu+ZN/HwDSbyFniVKfQcIgLcGYl5Jy1mM7B
	BTPhN+zKdIgWAItFljHMQ6A7KLV3ZYZMfq8vLZ8ZKrPssyqCfhBZ5fyuY1IvtA0AGQCN0/989ab/+
	qWeH5PhD16YixKFhQn5B80yg8fx7UWM1R3I1dWYOWnY2XQnNxYkK17Yw3THpviW2/L6YKfIZ2w3gv
	GNofzUTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pk1-0000000EAxk-0dXA;
	Wed, 01 Apr 2026 07:11:53 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pjy-0000000EAvs-0rn1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=k6ZXB2M93bA5FI
	UMoEbLvEJgGSE4j7dc243fvIGTs2E=; b=jyLoxiU5gnq1phyRSrJAWGeWE+zbKR
	mK6N7hF4cTPldW8NC55hZOu9zCCYdcUV0Hltb7PHSA+NZu0xuZEZR5EodlVg3Z8K
	NQV9ay7CyevldB1cMGHcCO8NGBFfv+SXY89hsygCkytHK4w0X5xTfsDVyqc5uBTa
	yukqUaOa8mW0jRYuh+3htW8gbEnzbN2YmkU+g0kUt9jC2E1Kl3OmC2auQyvcQl7H
	/dJ8zNg/Tx+6NpjfO4lX87qwI0Q0rnTv3mizPxrdf2zLHlBSZD+rwKyEtIj0GU3X
	zYfr+0WtnKsGWCOYuGSBdXHP4d2mVxDKRD5y+A35kY4JRNJcRdy+jtzQ==
Received: (qmail 1986474 invoked from network); 1 Apr 2026 09:11:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2026 09:11:43 +0200
X-UD-Smtp-Session: l3s3148p1@Qp/Jy2BOTtEujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Date: Wed,  1 Apr 2026 09:11:38 +0200
Message-ID: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_001150_909966_4A05242C 
X-CRM114-Status: GOOD (  12.12  )
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

This series removes the use of platform_data from the hwspinlock
subsystem. First, the last user is removed because it turned out to be
obsolete. Then, platform_data support is removed from the header.

This has been in a larger refactoring series before. But this
refactoring turns out to be a rabbit hole where more and more fixes are
needed before I can do the actual refactoring.

These two patches are quite independent from all of the other needed
changes, yet the platform_data removal simplifies further actions.

So, I hope we can still have this in 7.1, so I can base further work on
it. The ack from LinusW as the driver maintainer is already there.

The only change since the last version in the refactoring series is that
I also removed the Kconfig symbol in u8500_defconfig.

Please apply.


Wolfram Sang (2):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file

 MAINTAINERS                      |   1 -
 arch/arm/configs/u8500_defconfig |   1 -
 drivers/hwspinlock/Kconfig       |  10 --
 drivers/hwspinlock/Makefile      |   1 -
 drivers/hwspinlock/u8500_hsem.c  | 155 -------------------------------
 include/linux/hwspinlock.h       |  28 ------
 6 files changed, 196 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

-- 
2.51.0


