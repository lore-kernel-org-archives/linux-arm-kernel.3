Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AD1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 03:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtUU013f6dP5eZfZuSq5QBLDtsPdXuZ2A1s0KNSDmqw=; b=IQTTFRt9SZsCgauiT+PPdij7vJ
	VooCYWvHLoi2IApUhPbGlmX16iUo1RLQlpKxcwBFEEKc6Msk02Gcb4gtxzSW2h3831lH/O+C65hCz
	55y2PgEfdjFNodHVK5zzIibFwNHJTObd1G6fnPgjveZoQuQIhOPWFgtwzikhg80fgq5c3dT7Rvy5I
	MkoFd+Ml63SWSMCq6EhEsE5oDA2agK/Yv6FcYMdER4UKT6N1IQNRWGET5X4AQ2krcWXwbHML4OzbQ
	PHiiyMGgtQWecldnQ9L7mumoZbCNKwuqVhHPpk8NVferdWgwx6HQphrT64oe2aDcaedzBoRwCbQ43
	WeQhfCfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaEt-0000000F9xl-1SXe;
	Tue, 28 Oct 2025 03:19:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDaEl-0000000F9us-2qOF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 03:19:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5501843F10;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26B09C4CEF1;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761621546;
	bh=6Pkx7EpEceX8AGS9kNb6JSNTph9sXRbaGVrP8ohO+QE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=P9oiRTdfca6l0bHZNNRYh402zW5pfWNbzn40lSSEObiA3GpWhHu4R4yhqWlbuLjKl
	 3q27l25EUOwe6cjIAEgKhEmlCa47ySahh3V7oCQIKsg3bae2b3aodk69V+8rJfEAFN
	 tHmU8YQPSOUz6+nToM/ZBVL3Hw4bSJHJfoycgEhct8kFcDKv7HjmRAB/VMfzzgEjAO
	 a9NL/959Yjdjxmw63iO+phnhJjfeHfcmAQAYY0o6QCbI3QOXLxxTCQYgjkB43ZM57K
	 nkSNeqRLi7ddT9sDT04oMoZ13inM5zhdxJcBY1R1Lok4zxcKS1TkpKV6/leh9e1ujd
	 l/gDQSbVXf8wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E1CCF9EA;
	Tue, 28 Oct 2025 03:19:06 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net v4 0/3] net: stmmac: Fixes for stmmac Tx VLAN insert
 and EST
Date: Tue, 28 Oct 2025 11:18:42 +0800
Message-Id: <20251028-qbv-fixes-v4-0-26481c7634e3@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABI2AGkC/23MTQ7CIBAF4KuYWYvhr9C68h7GBYWpJdFWoSGap
 ncXWZgaXb6Z970ZIgaPEfabGQImH/045CC3G7C9Gc5IvMsZOOUVbRgj9zaRzj8wEmlQSYe1QtS
 Q+7eA5ZHrRxhwglM+9j5OY3iW/cTK689UYoQSrBk2VaNtx7qDuUwYzM6O1zKT+JpWa8rf1DZUa
 dG22skfKj6UUabXVGTqhJEcBVdSmS+6LMsLHTpqzx4BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761621544; l=2041;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=6Pkx7EpEceX8AGS9kNb6JSNTph9sXRbaGVrP8ohO+QE=;
 b=h888JNhaD6tt+8BW1WkjUzuWlKSKhGyEh25Z5t6P7ZlUiItvmkAuNr8VSOuHl3pvatHp3vM+L
 MKOtmFc0ofsCBXhuo2MgAO8ib72NbeJxayKeRFNZILGUuxzj5YnXLA8
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_201907_764476_E2A32A24 
X-CRM114-Status: GOOD (  10.55  )
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
Changes in v4:
- Reworked sdu_len check to be done before stmmac_vlan_insert
- Corrected formatting of the if block in the maxSDU check
- Updated variable declarations to follow reverse christmas tree order
- Revised the commit message to clearly reflect the maxSDU requirement
- Link to v3: https://lore.kernel.org/r/20251017-qbv-fixes-v3-0-d3a42e32646a@altera.com

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

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 32 ++++++++++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/stmmac_vlan.c |  2 +-
 3 files changed, 17 insertions(+), 21 deletions(-)
---
base-commit: bfe62db5422b1a5f25752bd0877a097d436d876d
change-id: 20250911-qbv-fixes-4ae64de86ee7

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



