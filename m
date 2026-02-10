Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6454EA3F3E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5yj4wZBBBzbY5GwW0gijlrfVdaLRczFTHW/kmhaJEWI=; b=2J7reEnnN/PX/7+A+JIeu7xvnB
	jfTSOVWGbpd81Xn7R+7XDE22UWnJJMWgZIVy2yESlnFhphk9QBEoFZ7xtAoHHtHR3zNRzVbnWVLBA
	s3Hmet3MYzQxlfxVIZbqphS9c61L1lm29iEwA6WKwJvBTbBLo38J7WvQbWst9Sfj2qejiPHK9TSRS
	QrE/ORgcgQ5eapFhD96T2MM3G73EaGOog5CITHKagIumgRUfE8XKUWr5ikonXMDSdharlmLUCycXb
	iOUAaybhB748mTLPUR7SFw+Ce57qqxUPuQw7Nn6Kd3IHvmKSYUxxYgnMCi23p2LNkXikG+qT8S4KN
	vEmPdENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplUR-0000000GrdD-18w3;
	Tue, 10 Feb 2026 11:01:07 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplUO-0000000GrcE-2UPQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:01:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=5yj4wZBBBzbY5G
	wW0gijlrfVdaLRczFTHW/kmhaJEWI=; b=jFrrk0uliJtQL3ULoNT/MO/L5cvQdS
	KuaevCFevRkGbG8Im8C5ZVS4AogrsmD9WX/n35o42ETPKSYKIUtA3JSIXz3AL0h1
	+Ua4F9CGag1JtpoNtxrXlTz4JOsQQTrBtHNujnA7dDzWP5tbVjoaD+y3JqUhYuhD
	+Oqqq/woHeZrrE/8yvHVSSY23FBfV2tr3cfjupuiYizMJEE8s1cJwxki7Mo2r+tJ
	Rg2EJl7dIc0/VMkxZet8i6Zv6U/ax0+tlewSb6JAZoiWFqfhmffUqgRCJNK20+FH
	QhzAmkfJ4dfiFFIfZfjd8+27LbwRs9EaQ9MntZ5UDpWQ+Cj//g7wjcYw==
Received: (qmail 353793 invoked from network); 10 Feb 2026 12:01:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:01:00 +0100
X-UD-Smtp-Session: l3s3148p1@V+O1K3ZKmpkujnuT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Date: Tue, 10 Feb 2026 12:00:54 +0100
Message-ID: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_030104_910544_0BFF915B 
X-CRM114-Status: UNSURE (   7.39  )
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

As stated in patch 1, the U8500 driver is clearly unused for more than a
decade. Removing it allows us to remove generic platform_data support.
Both removals make the upcoming refactoring (headers and lock
allocation) in the hwspinlock subsystem easier.

Wolfram Sang (2):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file

 MAINTAINERS                     |   1 -
 drivers/hwspinlock/Kconfig      |  10 ---
 drivers/hwspinlock/Makefile     |   1 -
 drivers/hwspinlock/u8500_hsem.c | 155 --------------------------------
 include/linux/hwspinlock.h      |  28 ------
 5 files changed, 195 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

-- 
2.51.0


