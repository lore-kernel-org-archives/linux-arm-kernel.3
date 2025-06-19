Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CA5C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/g9Vf6hGrZ0hKeM12773wdkTtg+QQVjZhEkToI9s24=; b=0z3LNviiokXbFPDMmyDH0h1O1Z
	hxhU9QQXbeiwV0C+2E8FJmroyQL+/oDxZsptHTJtvySkipFNSizrdg6JiTUg4KH0WLh9aLCsOC+qb
	2SoO0xHChUaiKbt6rfOWSSCzLcK2AIal4eJh71t19h3vyk00bCdmq4uNOwSE/GnqCgQNmLoEBLxzR
	gzqm4meR590xbpKZpX8xMLpqObpLmX4OsCBwWYjs4c0my4tj8VILu+FK6tRZ+KrkvwCOryQYNMLKO
	QINes3TshFtcIKbNYKfMrBDH9+4cUvnjNEkYxJwAxy1EpW5JXEs2zI4Qqm9mq7Bhb+uFOfRtJsWZ/
	hZaTE40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSM15-0000000EEVx-1XpV;
	Thu, 19 Jun 2025 20:37:47 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLWF-0000000EAyu-3Bjl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 20:05:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750363552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M/g9Vf6hGrZ0hKeM12773wdkTtg+QQVjZhEkToI9s24=;
	b=vmxbdvok0oeIu97UhN4ME1QvM59me5wXNZCvXxVOLMEyru5H2xj63UFPBnjg7S260w2yeM
	L2bT/Q5tVHE8qNB+5LOuztv+X02i+Qyj72yK6m6qhK+5QW0jvnCiqNPJ0bH6oakg+TEBn5
	z5wsdIUGSpiCEB95IaI/p4j5Q/DTsmQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH net 0/4] net: axienet: Fix deferred probe loop
Date: Thu, 19 Jun 2025 16:05:33 -0400
Message-Id: <20250619200537.260017-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_130556_004334_EB04BDC9 
X-CRM114-Status: UNSURE (   5.92  )
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

Upon further investigation, the EPROBE_DEFER loop outlined in [1] can
occur even without the PCS subsystem, as described in patch 4/4. The
second patch is a general fix, and could be applied even without the
auxdev conversion.

[1] https://lore.kernel.org/all/20250610183459.3395328-1-sean.anderson@linux.dev/


Sean Anderson (4):
  auxiliary: Allow empty id
  net: axienet: Fix resource release ordering
  net: axienet: Rearrange lifetime functions
  net: axienet: Split into MAC and MDIO drivers

 drivers/base/auxiliary.c                      |   6 +-
 drivers/net/ethernet/xilinx/Kconfig           |   1 +
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 391 +++++++++---------
 .../net/ethernet/xilinx/xilinx_axienet_mdio.c |  32 +-
 include/linux/auxiliary_bus.h                 |   4 +-
 5 files changed, 234 insertions(+), 200 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


