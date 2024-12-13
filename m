Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oMe35rpj3pGiRrVthFbN55YWzxRRPpFse7Y8Q5/jxqg=; b=Oa3l29nFY7oxzE+RLYza91cNPD
	kYkfWOn2hCBqRODoM/8ez7/aVjWUaaWAYPtgeBmBzfLM86rdGd2PfsjUs3vk1f0JUTxCuVs4G3Jun
	FpWVeBYG/xO5ejf+LnEiuFm2d6gCe+F3UfdcJ8hP9RLoLTfoKRTOHbvOyCfHMuWoTb+MHv84iOLK4
	lkktZHGAMKpnWQyBxic2G2X6plisNmITtdQ7dSNXTG+zRjxJxgMB3Tfvkww057HH3FhEiL/BZ2gNL
	DDJr6iUMc3nr1WpTmmJhzOpDN/J2V0THKSG/36xo+fsh7u8krLtpE+YIyCDpGVaT0TXiScM9ILJCN
	/eqaxlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1dH-00000003BTP-2NUc;
	Fri, 13 Dec 2024 09:06:47 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1cB-00000003BDt-2kqa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:05:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F8BC1BF207;
	Fri, 13 Dec 2024 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734080730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oMe35rpj3pGiRrVthFbN55YWzxRRPpFse7Y8Q5/jxqg=;
	b=JaL5zOhbshsW8+n7cBu7ZUVx3aRCCpSTvbQZkydzCq2K1aFWd/DAM0B9WvMnCmRxwWlzGW
	uh2MRn9ref2MKLQqurotEa+QH2KCG+Uu3eeuFttjFgrLvhOSfRYp4beZ3wkVG9KWiE9NIZ
	73L81hYlOmS9UKYb//0LcyZ6EduS9mtv2kf+3+s2/2+LbYUHiO2GLu6cmIwsjw9ssYfUyI
	/dyp7lG2YK4dY+tpc4C93baFrIL1659QYlw3DbtAFYSp+jL4wC2tSs9S2yFSMGHCedJJ4Z
	o+y/qRFHwI9MmTf5GG8OpMs5Ld8NIXSXeVrHy2QuH5xTykTMUwbRHlP+pRNkCA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] net: stmmac: dwmac-socfpga: Allow using 1000BaseX
Date: Fri, 13 Dec 2024 10:05:23 +0100
Message-ID: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_010539_957534_D92A060D 
X-CRM114-Status: GOOD (  14.15  )
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

Hello everyone,

This short series enables 1000BaseX support in dwmac-socfpga. The support
for this mode is coming from the Lync PCS, however some internal
configuration is also needed in dwmac-socfpga as well.

Patch 1 makes so that we enable the "sgmii_adapter" when using 1000BaseX
as well. The name is a bit misleading for that field, as this is merely
a GMII serializer, the 1000BaseX vs SGMII differences are handled in the
Lynx PCS.

Patch 2 makes so that both 1000BaseX and SGMII are set in the phylink
supported_interfaces. The supported_interfaces are populated by what's
set in DT, which isn't enough for SFP use-cases as the interface mode
will change based on the inserted module, thus failing the validation of
the new interface if it's not the one specified in DT.

When XPCS is used, the interfaces list if populated by asking XPCS for
its supported interfaces. I considered using the same kind of approach
(asking Lynx for the supported modes), but dwmac-socfpga would be the
sole user for that, and this would also need modifying Lynx so that the
driver would maintain different sets of capabilities depending on how
it's integrated (it only supports SGMII/1000BaseX in dwmac-socfpga, but
other modes are supported on other devices that use Lynx).

I've chosen to "just" populate the interfaces in .pcs_init() from
stmmac, which is called before phylink_create() so we should be good in
that regard.

Thanks,

Maxime

Maxime Chevallier (2):
  net: stmmac: dwmac-socfpga: Add support for 1000BaseX
  net: stmmac: dwmac-socfpga: Set interface modes from Lynx PCS as
    supported

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.47.1


