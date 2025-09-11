Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37540CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AoDzDDeFAu0T7rQrl/SCrZ9CnyE8PsQTVoWXffSCjiQ=; b=OjhNdq7kaak8q8ex9TdYZWF8mu
	DmQZuFervGONeqlDlWlnFGgPdFnWyzky6N3KxG9tMWLpnQRuWG6Ll1CJJu6lHUpKPgxx2AS5Wb2TI
	OIy218O4dT9bz7/aTZwRsOvgzisIkUrTDJ1iWdq+Dfq/Th3h9HeN55K8fW0327ElhcmOOHaK4AVmv
	TP6E5FgrCooQopUsBiR3HXa6X8lMOeJIUhucUmBSFowfKjL+rvCCL0givCO24OiXlE775qhL024VK
	JmJGm0pAA2uLMCK7E8CvIdt+XmHfeE5hthf6TSe6h+TXjfwKTcIMP1rLtavH56QQf0PIGBA8hZNYk
	sADmGMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcad-00000001nDD-15YE;
	Thu, 11 Sep 2025 08:23:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcaY-00000001nAu-21cV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E5D1449CE;
	Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C25C4CEF1;
	Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757579009;
	bh=1NTqCYvC1K8jjPMv2VYdraK1iRDgvz7FsY1W+cOys54=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tozocLldwSOpQgbhOhuvt904CuPrNKqz+MyiPtI+nj9sGun7ieVcxmDeSsvZdBjfE
	 DLC53avdIrGgvbJ7sYRUGgMdyO5pDjfLUmKKhASmcFSxQsv4LthlyehDTGPFBOJyFE
	 LWECmeFEORqBI6+cZlkendWmxSj4/qKrNl9EJ87Db8k6v49PLB2my6YBkHqNGOavIZ
	 /NF0Ecd/e1bXoBZaP1lNhSBIoZtyF0KfALdU7cr7WYkNc/bpQEfZujDShE7nrw67h/
	 8yQ53MOPF1dkpX+X/zg3sSrpVvWb7nNLUq9i7dqyb7Wo6CWHDHTMLXyr1rKSB1cLyV
	 mBubwOsiRx0CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F6CCAC58D;
	Thu, 11 Sep 2025 08:23:29 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net 0/2] net: stmmac: Minor fixes for stmmac EST
 implementation
Date: Thu, 11 Sep 2025 16:22:58 +0800
Message-Id: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOKGwmgC/x3KSwqAIBRG4a3IHSdo2HMr0cDqr+7ESkOCcO9Jw
 49zXgrwjEC9eMkjcuDDZehC0Lxbt0Hykk2lKivVaS2vKcqVHwRpLGqzoK2BhvJ/evwh7wM53DS
 m9AHmLbwtYAAAAA==
X-Change-ID: 20250911-qbv-fixes-4ae64de86ee7
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757579008; l=729;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=1NTqCYvC1K8jjPMv2VYdraK1iRDgvz7FsY1W+cOys54=;
 b=/0L8KgDwlzFCr8RVOL5SgK/pXkurP0ELzcipg5jz0KqFqfz7OjcBHkJi9PknfxYLHM1GdYnME
 v5v0C/w9B7TBnsTcDbFxJQY0Jdl7+CyWmJD9rD5EXlB2gHxKlKOoeeO
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_012330_546709_24E2B99C 
X-CRM114-Status: UNSURE (   6.80  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset includes following minor fixes for stmmac EST
implementation:
   1. Fix GCL bounds checks
   2. Consider Tx VLAN offload tag length for maxSDU

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Rohan G Thomas (2):
      net: stmmac: est: Fix GCL bounds checks
      net: stmmac: Consider Tx VLAN offload tag length for maxSDU

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 ++--
 2 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 1f24a240974589ce42f70502ccb3ff3f5189d69a
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



