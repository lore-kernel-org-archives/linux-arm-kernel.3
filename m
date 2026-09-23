Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F70BC98307
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9OFgGNXERb3VJQ/3J3tKtQZkWd5zwiTiKIm6bYoF1Q=; b=nS1WKm8i6n+LVT7rGWmA8ocWLc
	fPhg4i+a/Kw01ldMyDGVR767Zu2JMvPvCWDuYPBT8ErhAmKemjlKQBtfw84QnkpOtxOdDmHvhxbn9
	Z72+MikvnhX6Vn1Q0WqwVpSQUert/XHXMdAKegPJs8mXbREszKccpkv3hA0Qhh0WqWskYVgXiTzTY
	y8L5iAryrx6Ez0xxXG925dZbfrnjoFJgYNjkqdCU3GSdv9FXRK0nEOBxye6ra0mi3h4uSiHsthn5n
	/UBYvJJ0vPjQeDSYy8HO+K5imPxkqZuwU1Op4X2AVlxDV8X5rVSQb4Ce+dZlFBodMi/1VdHjMrBqd
	plnwdU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITo-00000007YJB-1lEf;
	Wed, 23 Sep 2026 08:37:28 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITg-00000007YGJ-3B7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152640; x=1821688640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T9OFgGNXERb3VJQ/3J3tKtQZkWd5zwiTiKIm6bYoF1Q=;
  b=XDeofNIJIX4oR6KtwPtB2MsXKOjra4D6ZXUq+xrpq4kBgypc6Wr9JYHw
   xtH2m1Im7hxUe7eqAdJbW/rPUkZD7Z1KzL1pDJ9wus0Yhx+U085+k/hRA
   /wGgoKyUSXcAaNx2Rx4Xp40KhtjmgJYlRn9iDuemPem5dPgeejxTA3UV/
   xaB+Jl1rs2ZYA6scBlxgGFe468mlWj4mNLS6jm9G4RMNHFYdNgWcg9PJm
   VJ7P7W/qa3N8vxg4egVfhAlpwdkY7rZ6tBwfpW/IOQmXbT90/DsMvJf9A
   U8nkbDfF+bHQ4XrjSUMUCiYxoWakFc2cHQAVGU/y9FaGVvMYsaRvE3DX/
   g==;
X-CSE-ConnectionGUID: TdnE58viQGmMC2XHXrftmg==
X-CSE-MsgGUID: qw+WaUgRQ3ezHTfqFhJwuA==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29208085"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:12 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:25055]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id 216cd999-a0c1-4063-8f93-3258ce205892; Wed, 23 Sep 2026 08:37:12 +0000 (UTC)
X-Farcaster-Flow-ID: 216cd999-a0c1-4063-8f93-3258ce205892
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:11 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:10 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 1/4] irqchip/alpine-msi: Use SPDX-License-Identifier
Date: Wed, 23 Sep 2026 08:37:00 +0000
Message-ID: <20260923083703.38974-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013720_842678_E0E63313 
X-CRM114-Status: GOOD (  10.78  )
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

Replace the free-form GPL v2 license boilerplate with the equivalent
SPDX-License-Identifier tag, as preferred for new and updated files.
No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-alpine-msi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 6764d64e7950..0d97abb85e16 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Annapurna Labs MSIX support services
  *
  * Copyright (C) 2016, Amazon.com, Inc. or its affiliates. All Rights Reserved.
  *
  * Antoine Tenart <antoine.tenart@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.47.3


