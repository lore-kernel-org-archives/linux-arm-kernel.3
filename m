Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7463CD68BCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X5FKveEGFoRtJToEkzkSd7Mwk8gc6fAM/LYYJdowFdM=; b=0tfA9YhbpTgngdluyFBQarsSpP
	2STdq0Q4Vq7fZRzoil0IWq+/lnMnyZaUz8bmJnSNoQ9EbOjvEK0jX6JhrLwwoKqxp78o54zKGpJIP
	Ap5m9uWGwks5VaPr+kS/80B88bF4VATY589cVvuUklLX9cq1vzic+tqLIs5i6JLyja2y6OU6s6xld
	ITcaSKRYDvuBfZCkRIPGC9ZjPNlnVVtZSobpWPkCgn2owcgYW2uzMelNr+CvGmoXreGyh5cNeZ3fQ
	ad65eO4MB9F24A6iGRWjuVBMLZsWN81X41NOkOrKgSDbC/E5n4wMZrRU2Mt+8nBM1cnYn5p7Gq9Tg
	+eqjGGBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzLj-00000003Nv6-482L;
	Fri, 15 Nov 2024 16:39:11 +0000
Received: from mout.perfora.net ([74.208.4.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzKg-00000003N0N-35I5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 16:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
	s=s1-ionos; t=1731688682; x=1732293482; i=parker@finest.io;
	bh=X5FKveEGFoRtJToEkzkSd7Mwk8gc6fAM/LYYJdowFdM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GpvnL11htK1cwtfT46yWvOtnwbWZzHXvvzYdAboHvlQMugZpNl76evj6B3grSQCc
	 W/cwS7bULfD1ocbLIdbsQ9vqyKhKjvleHRi+7G2HqIU00tlCiJWDITZaREz/mub89
	 jqK1GN7mzligoMSU+YSA/mVVwHtxNKFb/5tDDu1TnKrv52Q6R5gRqKoQyP9AbMxkq
	 7VCJso36HlMDHDrH+4byi4mKRKpJ/iaUaIjIIDWmtK+qpuGmfdjrzqygD/LwMvPjX
	 mABC4hEU9ctXDvK8b7wXNvAU1gWjrdgOzZro5R/Ki/HQVBN7IPCEApIm4ax0rgkvx
	 zV2x8B5lEmH59j5DLA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from finest.io ([98.159.241.229]) by mrelay.perfora.net (mreueus002
 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MDzNh-1sz0p93pR1-00GdLZ; Fri, 15 Nov
 2024 17:32:05 +0100
From: Parker Newman <parker@finest.io>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Parker Newman <pnewman@connecttech.com>
Subject: [PATCH v1 0/1] net: stmmac: dwmac-tegra: Read iommu stream id from device tree
Date: Fri, 15 Nov 2024 11:31:07 -0500
Message-ID: <cover.1731685185.git.pnewman@connecttech.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VmMzWfMuiUIonudG8UECAGKTtEGicIuJhmmOO1QaBA8Qx1KyLJB
 wEy22iYL30pHd39L68ZkWkpgK3f91L6r7nr17yp6487cxmF8x797lm+/A2kSN+nUJeDFU0f
 TUu07BRkGBlZRFr92mVbbQt0b42wwSutsA6gHHnyYkhIdLRDQCmtwivXqtNG4TKsA8V7eWZ
 vWDhDZwGpz4iZXHdUFetQ==
UI-OutboundReport: notjunk:1;M01:P0:k+zCuu5Wkrc=;9QzRlWQgP9IpFhY3gK78X3Lxg3T
 311E3KflXFR3ZRfNrPHXnGDrql7kPvEPyL5NTqx8hGDC/5xLfKtzCkciZhjD4yE6xAsnUOhqw
 KN2mc07wHTNmS65MrTvryBMbwyBygk5WbEJfEFb9sOMn6kFvMHie1usZSWjwVik/vB+kg41+w
 0xrZBsD8rvWiaVHY0PF6RaEysBdFPGmuHgV07d3DEOdBvJQLhtc5ICYXaJ9FwuAeJamCySMAS
 NmPV8P0woCT30f+HfO5h2iERJr6AihArnhWtuC+MWYVNWAcbbjST0Ym2GXk6aCFlXu8GWDdii
 x/ajXVDkUuwcv6nnbK8WcVTFdB0aAuc9qHx7hzKrzInPnP1mAVtSEyBTc4cf7kuuqmtXFh8dw
 IONkO1PZYb9zHw4ruNXvaJeeMLHBNzc6JLr+ojqX2dNlnt4K7iOh4qshnJSv6QzE3hiZO5YGb
 rUAIA7taTFirSQGRwMtn8gxOXanlKMd9pdKS3TZM32PPgLikYbHg+XP/ZZiM5WvXhfQiPdpq7
 V+H6RyPOof8btmldM8CpxGDfYTRsYitqnwAZoW2pFdQGdnAy2HEPRfeH0kiYq6QYjKAtJbqAd
 wMzgKUOwrsvuzmWwjiF6rTP7F92jwxRdOFf/lIEqqrWrPmEMZhI0MgQnPyC4dsH6pdv9L3MlE
 imBt7VixF0FctBOv82HzHDl6qQtb0d8cZsKyVJUEr8pddv7ttcxk9/xoXi8jGUpGot0mH4bMO
 VV+sJpOmkXncApwj83PMUXHNWzrh3DBOaolSmuieJASUrcrwOIwcEILOuI4lZKS+wx36aM89y
 HMVv4Fe28PtSwbSUDAMgXehD02Kd/rrcvUZnfWqsG3UfqsPJY8p7Vi8eA/69xSDOmQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_083806_890481_7FADFB7B 
X-CRM114-Status: UNSURE (   7.19  )
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

From: Parker Newman <pnewman@connecttech.com>

Nvidia Tegra MGBE controllers require the iommu "Stream ID" (SID) to be
written to a register for proper operation.
The current driver is hard coded to mgbe0's SID, causing the other mgbe
controller instances to not work.

This patch enables the other mgbe controllers by reading the SID from the
iommus property in the device tree using the existing
tegra_dev_iommu_get_stream_id() function in linux/iommu.h.

Parker Newman (1):
  net: stmmac: dwmac-tegra: Read iommu stream id from device tree

 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)


base-commit: 37c5695cb37a20403947062be8cb7e00f6bed353
=2D-
2.47.0


