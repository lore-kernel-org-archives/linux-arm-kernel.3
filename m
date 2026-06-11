Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3468CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=8vJeVAj/z4tf6ALczbGi0hk+xhcfHPNc5wF724wvVsk=; b=k+WHF9EGDA+iX2oH0EKizQEBd6
	r/CL0EQ9rpe2wLcDYScRz28pT7SurUu8pIiGJOeWdAW5FFnByS9UI5J2PKEAY51xtrtolIZt6eb5n
	6YuH1bVKWM6isG9Q+2fDJEtPIlV9kaEnHGf0lpvfcF9RYSdLLUvZHB7BD+BQqrP0OIVVxum3qE7fG
	/yII8K5agOU8m4H517cvQYrIOuDsqVi2a25p3jmHrnrVI7nwu2QCcII0Ln7te7bt8va7iD6aVp36C
	L+f9d8mgDDAfEQSVUWG7oKI8n1ZTWfkwUhOIzEvOHDxaqfAWXo/RvNzl4ajLOlUCmwaQgXjDJP4p3
	4TAe+aFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdfr-00000009Jlf-0kYn;
	Thu, 11 Jun 2026 11:34:15 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdfm-00000009JkU-3EW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 11:34:13 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260611113403euoutp017bb4ad10875ba9c3d6a8f223c21b725f~4A6FNWPkO1537915379euoutp01I
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:34:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260611113403euoutp017bb4ad10875ba9c3d6a8f223c21b725f~4A6FNWPkO1537915379euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781177643;
	bh=8vJeVAj/z4tf6ALczbGi0hk+xhcfHPNc5wF724wvVsk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=MNdv0umzypzsIVXa6OLGXAv2/YPAT1p++ZX2Q3ucV5HTcI7TS69Sug/e/jA218Y1T
	 1QkNCbRWz3C6k/AQASY6oWtIB0GFX0TAijBDDKNrJTHeTRTMUVI+M9rvKu4USu9kMT
	 iZDd68kQaJn1EsCr62hFOOMFtYRkHs8NIvkKJDvI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260611113403eucas1p1f4b61896c875f1f6833d6ca136472af8~4A6E3YY0z0769007690eucas1p15;
	Thu, 11 Jun 2026 11:34:03 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260611113402eusmtip20128068a5cba2e17cd8baa05654eb531~4A6EOyVCm3265632656eusmtip28;
	Thu, 11 Jun 2026 11:34:02 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, k.domagalski@samsung.com,
	k.tegowski@samsung.com, Jakub Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net 0/2] net/stmmac: Fixes for maximum TX/RX queues to use
 by driver
Date: Thu, 11 Jun 2026 13:33:56 +0200
Message-Id: <20260611113358.3379518-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260611113403eucas1p1f4b61896c875f1f6833d6ca136472af8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260611113403eucas1p1f4b61896c875f1f6833d6ca136472af8
X-EPHeader: CA
X-CMS-RootMailID: 20260611113403eucas1p1f4b61896c875f1f6833d6ca136472af8
References: <CGME20260611113403eucas1p1f4b61896c875f1f6833d6ca136472af8@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_043412_080015_423D6F03 
X-CRM114-Status: GOOD (  10.18  )
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

When contributing other changes preparing functions for new XGMAC hardware
https://lore.kernel.org/netdev/20260601162537.553512-1-j.raczynski@samsung.com/
there have been reports by Sashiko AI review about pre-existing issues
in the code. These problems are non-insignificant and are 'net' material fixes,
rather than net-next features.
One issue in this patchset was reported by Sashiko AI, while other
technically part of new patchset, but is reasonable related fix.
All of issues are wrong DTS configuration, but kernel needs to handle it.

Jakub Raczynski (2):
  net/stmmac: Apply TBS config only to used queues
  net/stmmac: Apply MTL_MAX queue limit if config missing

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1


