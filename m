Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633C1CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 22:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uxwWcUaixcEzrQcRYxa3akAXD2wZt/uU859F838kBCM=; b=KVFSS8ZtMYuCAX
	Vn3UTpXh5Mi8QPEpMzSlPCNzrMwQ466RKNK4Y0asc2rp13QXlE2IUmH9qdpxULouqNOsITBd3sjAW
	RKdbRumdVpvRRmy2fRI85eyCn4OgPkD9Q87Y6/mvZvQ5eOhh37eM4rTqpJ9y5NAN9A3RbQALguyQg
	wDDfP74hxA9thpmpqOyo7idSTa6z4AHbTeo5YLU2dnGdrn5jX7F24dHXh0slxMbRVy67iAcwSTMX0
	sbOtYYm4ZO4RW+H+T1ASxthGHFVhRY7AtVeSE8+1H0QmPCMwULT7tgqbb5nnXvyguAskXl90rYaGQ
	8FNaWiFEA5Un+T+X7N3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpMb-00000005boD-45Rr;
	Thu, 11 Sep 2025 22:01:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpMa-00000005bnO-10cR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 11 Sep 2025 22:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=uxwWcUaixcEzrQcRYxa3akAXD2wZt/uU859F838kBCM=; b=QFEHH62qKWL+rvxb0lIU9thpva
	qc2+JB9JYuqaJrVXEjt9m20eBM5P6jODZLMszB62JljNmE/8unY8hrCPxuMxAK+L0/I3rv+lDrXh6
	MSlBY593d8hOo9T/JCKssQi3ZxKkpuHFEP+dMutib8Bz8imzzypaBBWwpxqmQcMIwjYAEbEZeOLWJ
	n/iuPYkxkAcI13eaCuVJ6HFeTaXldr44J3IHg86EZZfYM9g42lPBiW6q7pBoDjYXeGzXgRizIJ3cS
	5d3rcF//EAkr+dZSc9rmCOH5RKXOKU8WGYCqgQ6ZnlFU+E1r2Qzyif4oq4JfDLdYq0B8fjeQ5w+bg
	EFR/RXMA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwpLZ-00000006BJf-2dS5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 22:01:54 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uwpLU-0005sG-JT; Fri, 12 Sep 2025 00:00:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH 0/2] Add DMA devlink support
Date: Fri, 12 Sep 2025 00:00:40 +0200
Message-Id: <20250912-v6-16-topic-dma-devlink-v1-0-4debc2fbf901@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhGw2gC/x2MQQ5AMBAAvyJ7tsmWEHxFHKpdbFDSSiMRf9e4T
 DKHmQcCe+EAXfaA5yhBDpdE5RmYRbuZUWxyKKioqFWEsUZV43WcYtDuGi3HTdyKRGNDpal0IqT
 69DzJ/Z/74X0/4X5UwGkAAAA=
X-Change-ID: 20250910-v6-16-topic-dma-devlink-00b803c5a803
To: Vinod Koul <vkoul@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jiada Wang <jiada_wang@mentor.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: dmaengine@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_230056_090642_DC791420 
X-CRM114-Status: GOOD (  15.60  )
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

this is a new series which was previously part of [1].

While debugging the i.MX SDMA driver we noticed that the driver doesn't
honor current active DMA users. So the supplier (dmaengine) driver can
be removed before the users are removed. This cause use-after-frees
failures and the whole system is frozen.

To address this the Linux devlink support is added to the dmaengine
framework. This series uses the managed devlink support which ensures
that the users are removed first before the supplier is removed, which
is the main goal of this series.

Managed devlinks require that both link devices are backed by a driver
(of course). Therefore this series uses the dmaengine device as devlink
supplier device and _not_ the dma-channel devices. The dma-channel
devices are virtual devices which don't have a driver.

Frank Li already mentioned that dma-channel devices should be used to
gain a more fine grained runtime-PM support, e.g. to control clocks for
each DMA channel. This would require the devlink to be STATELESS.
Stateless devlinks don't ensure the correct device remove order (main
goal of this series).

Having a more fine grained runtime-PM support (for each channel) is
valid, but IMHO this is rather an addition to this series. The support
for this use-case requires that the dma_devclass implements the .pm
hook. This hook would need to call into the dmaengine driver to perform
runtime-PM on the dedicated channel. This also requires a HW which
supports clock gating for each DMA channel.

Regards,
  Marco

[1] https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20250903-v6-16-topic-sdma-v1-0-ac7bab629e8b@pengutronix.de
- Split series into SDMA cleanup&fixes and this DMA devlink support
- Add dmaegine flag to create the devlinks
- Update the kernel doc
- Update commit message

---
Marco Felsch (2):
      dmaengine: add device_link support
      dmaengine: imx-sdma: fix supplier/consumer dependency handling

 drivers/dma/dmaengine.c   | 15 +++++++++++++++
 drivers/dma/imx-sdma.c    | 15 +--------------
 include/linux/dmaengine.h |  3 +++
 3 files changed, 19 insertions(+), 14 deletions(-)
---
base-commit: 1b6bf726c96272139c2b20db3bee4c22c869a22b
change-id: 20250910-v6-16-topic-dma-devlink-00b803c5a803

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


