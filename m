Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930EACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 06:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f9x6g3CmXGPdXLBVzIP7IcA2lq/Hc9bJCZLF/pixolw=; b=nTasZoc3Ft1VggjMlWJh/5rfet
	NHYTtX3goVi9OPh7NwOMVagQzIo2HWk4m09KQzoXQmx3lPjFqf4XfE7G2YNwY6HX4hSkEu8+N/X9K
	s1/ih7cstMJ+Kp5V2TcPpa7p+0QotZsz9OQtz6rbJrX0N0C0xSrZD2p1gSafaEfUwhhxT7cSG8fFG
	HrALp6ZdvNI0Vy9/+6AbZo9pBXTN2D9gqCHGWYhT0sswk32fMulAfwqnaxiIT/+hwTH3u5cA1WWUs
	BSPJYpDFYOUt3URrvLllG3GIBEVLKQhEoVe7OTuIjj78f/dhAzJtxhsLsV6UMNYgyVOJDrfODozNQ
	57eKzFaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dgi-00000006hjI-43Sw;
	Fri, 17 Oct 2025 06:11:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9dgb-00000006he2-2iOS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 06:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8B294332E;
	Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D742C4CEF9;
	Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760681492;
	bh=cErZl+Aef5mADFNSRF/CqGvdSUgsvsLw4QmBcD8g+xk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=MT6cKJFYzJ3pBJEuKuESMxdf7EH9u5wfrYkkU+lKVz8703gzHd+LUzyk5lM7+NmNt
	 f0i1MO+wMJNzdPas6FAmlNm1rPHsYmJxjJpKhz7kOcl/8NHhQtjQbvzyXJZh3sDql1
	 C8gtV7BMUIyjV8suK0sw0PoxdxWFJhmxn6EY+l5JOWgXc1mnbahErLXgOnc2NYqOxi
	 7QuxMVknIysqBGwqOVB0Jaks4is7of1j7INOjcgMv32PvsSXXHFBnm0B9PsX982MkT
	 HvXic2raDBD8IYHdoLEYcNW/5BqMP/s/V+vY8jEgAhSUjgKGjiRcpWFnZVcvsfwpuM
	 FAAusoxikX8ag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F4DCCD195;
	Fri, 17 Oct 2025 06:11:32 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net v3 0/3] net: stmmac: Fixes for stmmac Tx VLAN insert
 and EST
Date: Fri, 17 Oct 2025 14:11:18 +0800
Message-Id: <20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAbe8WgC/22MSw7CIBRFt2LeWAzQD8WR+zAOKL21JNoqNETTd
 O8io5o4vJ9zFgrwDoGOu4U8ogtuGlMo9juygxmvYK5LmSSXFddCsGcbWe9eCKw0qMsOTQ0oSv+
 HRx7S/UwjZrqkcnBhnvw7+6PI0x9VFIwzNAK60sr2oj+Z2wxvDna6Z02UW7TaovKLWs1rVbSt6
 sofdF3XD9HhEPXjAAAA
X-Change-ID: 20250911-qbv-fixes-4ae64de86ee7
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 Rohan G Thomas <rohan.g.thomas@intel.com>, 
 Boon Khai Ng <boon.khai.ng@altera.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>, 
 Matthew Gerlach <matthew.gerlach@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760681491; l=1667;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=cErZl+Aef5mADFNSRF/CqGvdSUgsvsLw4QmBcD8g+xk=;
 b=tRc0k49q8CDclLGLO8HNDIxA1auXJjd1G977SPRKTM0FDT3tlempIlYU7PezAgMqrysJSBVVv
 sqfIJaS6wkUDmvWgknuvKjgJnkl44nHVL3pEswrkq2bEt3YogBF5+rW
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_231133_740750_0A53C67C 
X-CRM114-Status: UNSURE (   8.75  )
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

This patchset includes following fixes for stmmac Tx VLAN insert and
EST implementations:
   1. Disable STAG insertion offloading, as DWMAC IPs doesn't support
      offload of STAG for double VLAN packets and CTAG for single VLAN
      packets when using the same register configuration. The current
      configuration in the driver is undocumented and is adding an
      additional 802.1Q tag with VLAN ID 0 for double VLAN packets.
   2. Consider Tx VLAN offload tag length for maxSDU estimation.
   3. Fix GCL bounds check

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v3:
- Commit for disabling 802.1AD tag insertion offload is introduced in
  to this patchset
- Add just VLAN_HLEN to sdu_len when 802.1Q tag offload is requested
- Link to v2: https://lore.kernel.org/r/20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com

Changes in v2:
- Use GENMASK instead of BIT for clarity and consistency
- Link to v1: https://lore.kernel.org/r/20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com

---
Rohan G Thomas (3):
      net: stmmac: vlan: Disable 802.1AD tag insertion offload
      net: stmmac: Consider Tx VLAN offload tag length for maxSDU
      net: stmmac: est: Fix GCL bounds checks

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 37 ++++++++++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c |  2 +-
 3 files changed, 19 insertions(+), 24 deletions(-)
---
base-commit: cb85ca4c0a349e246cd35161088aa3689ae5c580
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



