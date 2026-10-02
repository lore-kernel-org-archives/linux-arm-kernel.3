Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B86CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cMgf3Fui9Ix2ajtwXUt15vsAOgVEpm/AVvj+X+LKiz8=; b=LtUZaOMdvEN//iRiv9/rjmafa1
	YIU53Pm78aDBvmRzh7Gd1hAyQ3URaZyFBMGwEJk4YoGK1LZ8OTZkYXa1Z0fSjGvhM084Ry2sN43YP
	w1lHA1fgquotRbTBuJlWLdzTXpLZCDK1PgxTWHZjEB4ng5U5Ab/Nuyr4vjo9Pu2CJmW7TQjuiFNbV
	DFIxRiDIFtVzJribFEw5e578xTlcTmDf9lUWq8byt4cGeSkoWy397CgaVfxI46NZimwmY9AzWarK6
	wv0hUkX3SEDghFqD/NY+DP5yjP4M8nVTKm+LBX5PI9nfyJrbFkS3MOkjNFm6kKUfQyDc7yuZstfBq
	XfASnLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeFX-0000000Bm41-1nnC;
	Fri, 02 Oct 2026 14:28:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCeFQ-0000000Bm1k-41Zy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:28:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 97BA71A10B4;
	Fri,  2 Oct 2026 14:28:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 690BC603DC;
	Fri,  2 Oct 2026 14:28:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C157F103281DB;
	Fri,  2 Oct 2026 16:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790951300; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=cMgf3Fui9Ix2ajtwXUt15vsAOgVEpm/AVvj+X+LKiz8=;
	b=Jlmd7t0Ksr8v1Qb0dLbT7iFrN4AKKOWXIWqi32LAo4iTjEQOQkZY/3JVUTAJP/t2i/uUuk
	EoVQ9ipfm85i0zt38mUyUnBwpdg9xN8xHzdgl5na8J8ciaLCpiyqHZuTASsaa+aXFEu0E9
	K2mZlHYUhw6omq0RaX0kZMDjZxCGAd6O3gTLk5LtEyKUPWDeo5qBsuTYtI3eSmqF8QjrxC
	/Q2nASK8YpoS/59jgV5Vtvbj/bZoPd9Ty0FUwkGgdn7J3WEO9jd8vfCW0Frthp8pjSU6pW
	Qfe87rRqfmfP2JzQzLX5ieK5f1ZSs0SkifFY45Wi7itJiqiNKwmbSLCIxLssPA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>,
	Joe Damato <joe@dama.to>
Subject: [PATCH net-next v3 0/3] net: rss: Consider RSS not supported when key and indir sizes are 0
Date: Fri,  2 Oct 2026 16:28:00 +0200
Message-ID: <20261002142806.1299041-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_072829_188324_772084A3 
X-CRM114-Status: GOOD (  10.25  )
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

Hi,

This series follows what used to be an stmmac-only series to handle
devices that don't support RSS but still provice the associated ethtool
ops.

There are a few drivers out there that populate the RSS ethtool ops, but
don't always support RSS. stmmac and mvpp2 are such examples.

Following discussions with Jakub on V2, patch 1 makes so that returning
a 0-length key and a 0-size indirection table means "we don't do RSS".

Patch 2 introduces a helper to check for RSS support in stmmac, and
Patch 3 uses it. Patch 3 has been reworked so I haven't applied the
review tags, sorry about that Joe, Lorenzo and Nicolai :( I've drop the
-EOPNOTSUPP return from the rxfh ops as we return 0 on the sizes.

V3:
 - Add patch 1,
 - No changes on patch 2
 - Removed the -EOPNOTSUPP returns on patch 3

V2:
https://lore.kernel.org/r/20260928145043.1228968-1-maxime.chevallier@bootlin.com
 - target net-next
 - Add a dedicated helper, following Nicolai's review.

V1: https://lore.kernel.org/netdev/20260926093343.292181-1-maxime.chevallier@bootlin.com/#t

Maxime Chevallier (3):
  net: rss: Require indir table size or hash key size to support RSS
  net: stmmac: Introduce a helper to check RSS support
  net: stmmac: Don't set or get RSS parameters when not supported

 drivers/net/ethernet/stmicro/stmmac/stmmac.h         | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 6 ++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 4 ++--
 net/ethtool/ioctl.c                                  | 6 ++++++
 net/ethtool/rss.c                                    | 7 +++++--
 5 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.55.0


