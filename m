Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 00:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m8YGS2ySmkbY6H6MGCzUlZeNWLAE5gNYIvcEQl4fPK8=; b=XZ0J/+jZkMCBbugY7nvWJ6BjLe
	9Nz5nJAre5OOBds8sxbrNX+g3sIV9jnZGfyjIU2qB9p0QI2Sn6ZGxjbuSExiMy3G0YysB/l2eDPoZ
	O8Wrcc2lerOJP7T95KeX+uH561zs8edrg5uKeniPo9tiWcZk+Grc+sZDzKVGmUwF4jUkdDlML3AnM
	g/yBQle+ljpClt4ldr+jyYVSGMArinw9H7xZaYKK9TUHx4u74K3KeKcwodqSXJv8mWxi05ZS7ZyzE
	ryoGNDr9skUO8cB94YeAZ1ykk5qItd79QzEtExCQJnMknlphgQz4vUN88O7vhvfrID+GwYFgekTqs
	ODjwCiTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdHl-00000005Bts-23TD;
	Fri, 31 Oct 2025 00:46:33 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEdHg-00000005BsJ-35VP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 00:46:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761871583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m8YGS2ySmkbY6H6MGCzUlZeNWLAE5gNYIvcEQl4fPK8=;
	b=Y0Q2WgiaKvxjefukVyBjSu/seielsrFiL2apyzJflIYdClgfF2T/NMsD6xwE68wueW1P4j
	R6X9HkCvazs/k0Hk5T6Ds3UsRPBQfn35GK/NeWHnqVUD7eca8jkTgUXyXbSr/nOENzCmP8
	Q7U1yUarEPOWXL919ypsaaNs9KUSEtE=
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
To: Sudarsana Kalluru <skalluru@marvell.com>,
	Manish Chopra <manishc@marvell.com>,
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
Subject: [PATCH net-next 0/7] convert drivers to use ndo_hwtstamp callbacks part 3
Date: Fri, 31 Oct 2025 00:46:00 +0000
Message-ID: <20251031004607.1983544-1-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_174629_671998_443A5F99 
X-CRM114-Status: UNSURE (   4.64  )
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
 .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  | 40 +++++++-----
 drivers/net/ethernet/qlogic/qede/qede_main.c  | 22 +------
 drivers/net/ethernet/qlogic/qede/qede_ptp.c   | 47 +++++++++-----
 drivers/net/ethernet/qlogic/qede/qede_ptp.h   |  6 +-
 9 files changed, 191 insertions(+), 182 deletions(-)

-- 
2.47.3


