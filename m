Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AD8C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 00:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zc6W1LqWhosxLy6inD+3Mw6xi1MjCToPHphw8hvqQkQ=; b=tYzbsA/aSzRsZEBmEZUgW6goxc
	sQUJRQicu9cth/nRCKlCJb2b/wwwukewRlwMe8TYdes64WNxxSj9huKwe4dus5ncRRwu9TNZYgdKq
	T9l3dFsavKW67uymd83KjaTrCmoAQfoZWON7lfqIxrPgC3WmYThGqNGZiZBrvbQB5GOFOT2rHcttR
	TLRrKbKrBo6bzE9e3sf5Y6paFUZ0ZkpvpHr7terJgTmzpWgkkvmujrpOXaVvH3kW2juSaojbZ4Lnz
	7gSfzUbuzn7lRDkFASwJutEvnZQtg4tlclaojI2jsMwsvUgKIMfkbNEH/7uZvBTZuW5CKM0awcrWC
	TUH5IitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpd0-00000006RXt-102v;
	Wed, 16 Jul 2025 00:04:06 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubpaY-00000006RCv-0dZl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 00:01:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752624090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zc6W1LqWhosxLy6inD+3Mw6xi1MjCToPHphw8hvqQkQ=;
	b=TxwBT1eaS2c9mz51J1mXjV4Nx+b/d5R9SKThusI7I+QKlZwzbwvHUzbdDXdN0iu5BY+jqW
	KkK49bWAWz+bvPDIjmEDw7HVvaS0Hnq2U2t1fvQwlJy2avkzw3FwBJ1sfxHhqhKyhmJgib
	MOgX6hzT+p5l2Mx5CAUA5wqCi5ID2po=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	linux-kernel@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Ira Weiny <ira.weiny@intel.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net v2 0/4] net: axienet: Fix deferred probe loop
Date: Tue, 15 Jul 2025 20:01:06 -0400
Message-Id: <20250716000110.2267189-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_170134_725752_AC73C102 
X-CRM114-Status: UNSURE (   6.23  )
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

Please refer to patch 4/4 for an extended look at the problem this
series is attempting to solve.

Changes in v2:
- Add example log output to commit message
- Fix building as a module
- Expand commit message with much more info on the problem and possible
  solutions

Sean Anderson (4):
  auxiliary: Support hexadecimal ids
  net: axienet: Fix resource release ordering
  net: axienet: Rearrange lifetime functions
  net: axienet: Split into MAC and MDIO drivers

 drivers/base/auxiliary.c                      |   6 +-
 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 422 ++++++++++--------
 .../net/ethernet/xilinx/xilinx_axienet_mdio.c |  31 +-
 include/linux/auxiliary_bus.h                 |   4 +-
 5 files changed, 263 insertions(+), 201 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


