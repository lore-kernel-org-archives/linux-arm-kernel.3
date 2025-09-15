Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D038CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S9faGDZWW2YqAhxLNAxFuEwNHCM0+p4ax/3H4lPoBzs=; b=spLom/q8AxUvvNtoIIarw3JFpM
	YJRpdlskAb6PvWrtVIwuKKNWSohQTsWAS6WHel4b/QbXohNhAxWn0zuntNrwS79AnziSuPhiERmkG
	zWtUirvkCgq4xMpgXAc7DmwKFRXQ+FqATjfUl8x4X87+mV0TMfL7p1YqEPYAZfMy1Geuik/9vzah+
	XVtsq9uPC8/tjzLgiVtEuWIPgnItGUCbGXaCu5nYNG7uWowLs6cjMaE7c+ZCmUm66bp6ol852JbRx
	zlkeFqenRjh1nfd2TBpXD4AJuqucJr4fLr5M/KdmDK+PigkrAEXF6bPvGPWcAjnTIfHy8IrN2bonh
	6l2+eUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Ot-00000003AS6-375L;
	Mon, 15 Sep 2025 08:17:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Oo-00000003AQJ-1Txt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 978DF444D2;
	Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70B48C4CEF1;
	Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757924241;
	bh=F/X+TtZHooGZVCVdoXlX23gyuHCMQDwSSkVtX3di3Hg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GV9RqtAc3SB8pgtHReS7bf1ET/E5vlZUVbYsXHtspijXoI45Txf5P71bCW1PTgJV3
	 ex0yceO9ZS+ovvANqgyEHfA2Qj+1iAM6DXHZrjU8MczOnLdaRHjSKBj3K0rKEz9GQf
	 9krMvdrr8vcMowZZT9Xs7F9IjBlFcNkDW3gwqB4SFlOCoN9qAT5g1NjZfrSVeRdYQx
	 icJL5z60ZHfKeJvQCTjkAo4G5K2VGF+x8qlXmdPuyibktjmqLtE1A3WkITAL3lOGzw
	 QH/EkozVXDMET64a3VJSdExZenU+NQYYtSE6NT693CXgaTgUqea8BcXoX8GKS4+pVr
	 4CPy9LxgzY7IA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E10ACAC597;
	Mon, 15 Sep 2025 08:17:21 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net v2 0/2] net: stmmac: Minor fixes for stmmac EST
 implementation
Date: Mon, 15 Sep 2025 16:17:17 +0800
Message-Id: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7Lx2gC/22Myw7CIBQFf6W5azG9pC9c+R+mC2xPLYlCBUI0D
 f8u6drlnJmcnQK8QaBLtZNHMsE4W0CeKppWbR8QZi5MspZtrZjF+57EYj4IotHomhlDB/RU+s3
 jECW/kUWksYyrCdH57/Gf+FB/rhKLWmBgqFb108LLVT8jvD5P7kVjzvkHWuVGd6gAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757924239; l=899;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=F/X+TtZHooGZVCVdoXlX23gyuHCMQDwSSkVtX3di3Hg=;
 b=bi6AtS44Cm+PAB1TLYBv/5mE8nemeFtjJHyyt2gUpKfTRwLORFKt6gXA8FrQeXWPi9muVBfYJ
 Lh5o/Pnal8SCzk2Xrv11tNs0rwrZbC5HqjijLT6SOGWlDtKX5riau4o
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_011722_418259_FB7FB8FD 
X-CRM114-Status: UNSURE (   7.26  )
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
Changes in v2:
- Use GENMASK instead of BIT for clarity and consistency
- Link to v1: https://lore.kernel.org/r/20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com

---
Rohan G Thomas (2):
      net: stmmac: est: Fix GCL bounds checks
      net: stmmac: Consider Tx VLAN offload tag length for maxSDU

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++++++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 ++--
 2 files changed, 20 insertions(+), 9 deletions(-)
---
base-commit: 5b5ba63a54cc7cb050fa734dbf495ffd63f9cbf7
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



