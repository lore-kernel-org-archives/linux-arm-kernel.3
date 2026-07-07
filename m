Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97948C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=/V3IDsSnQjAP3/DFshVE1YPFZDzJBaRoz5Q/CBJ2mdU=; b=JNEUWkwoGRWibD0hFUalJV3DbJ
	Q9px/0IfTllF67iBimr3z67cd53n+Yd3daS0mzulAKCl4m3FqqrXHEehWPN3CuX83X2RZi5RK0mum
	flWP1ghjt6pW8b9GydDt+kdrJIIyHfvNwFiGJ7y3coK84QId3Dq/oqk5uvUtvLml3X+P1RiLo2dZd
	Zy7lNb86Hg2+z4alTyfCZRItrYVCBBXDRjoxNVnq+ONh5KFVvcPcvPXWaB2zuN6oSVh0Y2n1zQ7Zy
	6G+9O0f6HvmTmt9aYMyQOiYBeseqeZCir+GnjS1xJaJDpJ4S8oFcqGesGOLNAptN8m5UUWDKcpVaK
	3nUUYHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qd-0000000Fa7E-2grH;
	Tue, 07 Jul 2026 17:44:43 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9qa-0000000Fa5q-29Wb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:44:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174438euoutp02ddba3b3bef512f052d42e9767feffec0~AEvEH-3PP1975219752euoutp023
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:44:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707174438euoutp02ddba3b3bef512f052d42e9767feffec0~AEvEH-3PP1975219752euoutp023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446278;
	bh=/V3IDsSnQjAP3/DFshVE1YPFZDzJBaRoz5Q/CBJ2mdU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=KsmoXaciTtDB6sClKMx7k4Z4SHwRLTGPVL+/+u6L9lm0XADBbKPkwOn6BgeK9PMT1
	 wdh7CHhaqNtdraJ11IukdHnqO27Sf3gh3hU03aSjDEPBqzdOAV6yrpWT3Aa7+5bGnL
	 yhHUMC3VDjFNigem6uE4oD5r+QIK72cm9bcjzz4g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53~AEvDKjXIQ2942329423eucas1p2d;
	Tue,  7 Jul 2026 17:44:37 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174436eusmtip2f88fbdd78f52216b16d2a8d14239ea38~AEvCEQoaf1514515145eusmtip2F;
	Tue,  7 Jul 2026 17:44:36 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net 0/2] net/stmmac: Verify more wrong DTS configuration
Date: Tue,  7 Jul 2026 19:44:29 +0200
Message-Id: <20260707174431.1264520-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53
X-EPHeader: CA
X-CMS-RootMailID: 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53
References: <CGME20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104440_688374_802B3AAE 
X-CRM114-Status: UNSURE (   9.30  )
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

Commit 8a7bca6de6de protected against possible wrong number of TX/RX queues,
which could happen with new XGMAC hardware that has more supported queues than
currently available in driver.
Sashiko mentioned that there should also be protection against zero input
and some AXI related config, as these are possible kernel panics too.
While this series has lower value than original patch, since this
misconfiguration should not happen by pure mistake, there is no reason not
to fix it.

Jakub Raczynski (2):
  net/stmmac: Protect against zero queue DTS config
  net/stmmac: Verify provided DTS AXI setup

 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.34.1


