Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A958CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijlTAHCPm96ALlj8X4uVVG+e1GRe0utTeH8fkvrs9R4=; b=OuaR3SM95XwYM7yoajPugJ/z+l
	C7bta1XidJKLSDDLWYTMPbtB2BqppyhTpBnREZ+aKnb2JFi6JWVtPNObjmqQ8YYRSihtgSBl9PeHt
	QlLj30THP2b9jxR7on2gE6mBOFKyFJl06eDERUw/qA5O9Di33E0KzZYU7mPHpfsjp1kU7lRuI6m4A
	noKf9nGbPui02G2c7+KUjCkGJkfM2zIRhKHtpjJ/eX8UxrIOu7LiXwPkYvBl2kzVrpvk/7g3IDn3l
	tjUtXc6ByArzD0dzvoMcp4bRB9kyh3Hma+ew2dxxAxe/f3BCa1OxW/giiw7hL/N13glJikfZAhLbE
	ZMP2sJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCR-0000000A5N9-0AN1;
	Mon, 03 Nov 2025 15:10:27 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwCO-0000000A5Lc-0Lzf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 15:10:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762182619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ijlTAHCPm96ALlj8X4uVVG+e1GRe0utTeH8fkvrs9R4=;
	b=Grc8S/mPFoo6wpRAYoRKJTL7DUbHAIXZxjkJ7xC3OFUXcplja4ZFzoE7QtIRIDJTmYm5eD
	YFQNVluRKo9KLWxZRWW2+bcnvM5/vj6yXKvbkAWK1soSfjYH6mu2ArFNVcCRO8ErNC3+Ls
	ozLuNki345RKzK6wZLfX/7JT7E05eno=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Manish Chopra <manishc@marvell.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v2 0/7] convert drivers to use ndo_hwtstamp callbacks part 3
Date: Mon,  3 Nov 2025 15:09:45 +0000
Message-ID: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071024_324363_E8F10C27 
X-CRM114-Status: UNSURE (   4.91  )
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

This patchset converts the rest of ethernet drivers to use ndo callbacks
instead ioctl to configure and report time stamping. The drivers in part
3 originally implemented only SIOCSHWTSTAMP command, but converted to
also provide configuration back to users.

v1 -> v2:
- avoid changing logic in phc_gbe driver for HWTSTAMP_FILTER_PTP_V1_L4_SYNC
  case
- nit fixing in patch 4 wording
- collect review tags

Vadim Fedorenko (7):
  bnx2x: convert to use ndo_hwtstamp callbacks
  net: liquidio: convert to use ndo_hwtstamp callbacks
  net: liquidio_vf: convert to use ndo_hwtstamp callbacks
  net: octeon: mgmt: convert to use ndo_hwtstamp callbacks
  net: thunderx: convert to use ndo_hwtstamp callbacks
  net: pch_gbe: convert to use ndo_hwtstamp callbacks
  qede: convert to use ndo_hwtstamp callbacks

 .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  | 53 +++++++++-------
 .../net/ethernet/cavium/liquidio/lio_main.c   | 50 ++++++---------
 .../ethernet/cavium/liquidio/lio_vf_main.c    | 48 ++++++--------
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 62 ++++++++++---------
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 45 ++++++++------
 .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  | 38 +++++++-----
 drivers/net/ethernet/qlogic/qede/qede_main.c  | 22 +------
 drivers/net/ethernet/qlogic/qede/qede_ptp.c   | 47 +++++++++-----
 drivers/net/ethernet/qlogic/qede/qede_ptp.h   |  6 +-
 9 files changed, 190 insertions(+), 181 deletions(-)

-- 
2.47.3

