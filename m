Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF8C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAsi3cGu3TI2BDEMG0McW5k+U5cb9+s/V5vDEJqx/gQ=; b=KEVn6NIKdT823nHMHGIezLSxp9
	uKnqFpxuS9oZcyjs8R9S04GUpddCqTAVxYuOr5rL/L4kqob18DQv6H5bMlZQJgxW9/sju5ruMhSWs
	tH9JBdMG6t1cmpittgTPz2skLmhFP1pw5KK92mt5vFC7oW9kxv6tP6iwyk4lANCGAAGSXz3GwbERA
	ScxPDqRkCyoKlWlH/XwHovnjuG6xsG7a2CVtfzOPad/CtNzkRAbEfm9DZPBphwx64McjUbs+i3dHv
	2DKLWaqfVdmrzoaU5xrKeXafxxCCnfv98Np8rbVRKDs8DhtT2kfQQM9n6xnudbfjpB3Xp3w5zh4sz
	eMnm+KBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gUT-0000000EkkO-0RNQ;
	Thu, 10 Sep 2026 15:15:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gUH-0000000EkYz-1fGO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yAsi3cGu3TI2BDEMG0McW5k+U5cb9+s/V5vDEJqx/gQ=; b=meUhi6aTkx5GTTKfPoZQYOBTQ1
	dpFJhp5oL3wUDkSKOMIoIgCl89+JGHS+7Dy5jMmpMy5cE5JqF68EXqYfA7rH8dV6+hUrDH4yTnpGU
	jNhoYfnrkN0pK+yXrkeZB8CX7lVE4pOfnC9d62pZ9w4UnljvnvKVMzxtRZ6Xt3OId6+Yp2aiE52I0
	99cTAprrXR7JQFceYNzWWYsD0uB1dg4PX7Y90/etxAD9TNsVR6kejmadAHHCSVecJxizS5Z1YUXIO
	qERbspV+rFETC0NaIu+3IRREPdtcTt1SGP/6uQjhOah0n8imJPEjChwlYoPFPYKVWhlsUXijO7Q5Z
	rzdIQ1rw==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gUE-00000002ezX-0hIW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:14:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51574C653E5;
	Thu, 10 Sep 2026 15:15:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9C425FA2F;
	Thu, 10 Sep 2026 15:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD77D11C7926E;
	Thu, 10 Sep 2026 17:14:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789053287; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yAsi3cGu3TI2BDEMG0McW5k+U5cb9+s/V5vDEJqx/gQ=;
	b=Ejt7K3OfGInw+hfhX6r+/ekZZwYvgCR7ywEG9UdyAexrsSGT3SFgn0qpvOrlv1cpOE6Xx5
	PXA9EOZCiVipYDw6OUmhBZSbf9KfuahmG0Qrw2I6ukfaZ4IEs/sI6rE8AM7/ddlQSoCx7b
	1Bua3KlVnCTwNF/DzAJo0QMGUML4zaSkBtBhtu2Ww0FfYw98GLFGuMcgtsI0FC5GysxLTo
	Vq5q/oIrh4VR95gU+jgw7IGtUPLL5yaxJ7eCsBwhFl4EodqdT54NQ8zixsqmX6m2bq1XFC
	uJc/+vtjhgbjk2Y6QsqQUKZMP/qqJ/ciMiSlC91Q1L7XgKSpluH8yo64pmJtEQ==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Jose.Abreu@synopsys.com,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	PKneuper@dspace.de,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH net v2 6/6] net: stmmac: selftests: Account for alignment shift on dwmac1000 for Jumbo test
Date: Thu, 10 Sep 2026 17:14:03 +0200
Message-ID: <20260910151404.976753-7-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_161450_346310_1BDBD8F5 
X-CRM114-Status: GOOD (  12.65  )
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

On dwmac1000, we currently only support single-descriptor frames. The
Jumbo test started failing when NET_IP_ALIGN was added to align the IP
header, as this tests tries to send the biggest possible frame.

On dwmac1000 the DMA transfer is aligned on 4-bytes, so adding a 2-byte
shift at the start-of-buffer address means it takes a whole extra 4-byte
DMA burst to receive the Jumbo packet, causing it to spill over the next
descriptor.

This doesn't seem to happen on dwmac4 and xgmac that appear to correctly
handle unaligned xfers (only tested on dwmac4)

Let's account for that in the Jumbo test, reduce the size of our big
packet by the align size.

Fixes: 23680bf5f8c6 ("net: stmmac: restore NET_IP_ALIGN in the RX DMA offset")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index ec56ee0031ab..fc8d69260f43 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -1776,6 +1776,9 @@ static int __stmmac_test_jumbo(struct stmmac_priv *priv, u16 queue)
 	struct stmmac_packet_attrs attr = { };
 	int size = priv->dma_conf.dma_buf_sz;
 
+	if (!dwmac_is_xmac(priv->plat->core_type))
+		size -= NET_IP_ALIGN;
+
 	attr.dst = priv->dev->dev_addr;
 	attr.max_size = size - ETH_FCS_LEN;
 	attr.queue_mapping = queue;
-- 
2.55.0


