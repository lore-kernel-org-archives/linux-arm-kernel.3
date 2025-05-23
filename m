Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D116C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b/iL7Qv7n+PdIUdNdFD1qH+oWQJFlnFOOHOkCjyu7t0=; b=Q3d4Okn1SMp5ut
	mGhvrmlMfkO6VaUZWeyLIowF/PqJrYv1L/DJLXgzfv6M8g7OiOeMS2TLLB05njslMituz6GwqD5RF
	PJkE5IpyLItLbIB0Wr1YqluWR78ueedZxqQ97IXwv71fyWwYaYGDe4MmMEmM0KCHnCYkLHvymE3vo
	nvQKiEi9tYUw3N6M58CBIFSe0MaE5Ti+5XF//LsEhpjgM8+7aW2DgZEHh1GwXMumVEl/bmfRlTl1N
	pMTotH1OjqslVaNYJQBgUPtsV/wdbIIwDcwhc+qfm71t+nAbpRgph2QQgQ0mH13RFy8R6GJoIdvUA
	mLL+Wisjm7vE3n38ljKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIY5G-00000004ne2-0mXb;
	Fri, 23 May 2025 19:29:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIXzm-00000004n0y-2d1v;
	Fri, 23 May 2025 19:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FFA45C5CFE;
	Fri, 23 May 2025 19:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1788C4CEE9;
	Fri, 23 May 2025 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748028232;
	bh=bdiHYolmlYqocA9ieRjL4GeZn3an8qacr7vPZxo9G7g=;
	h=From:Subject:Date:To:Cc:From;
	b=hu8+ACfTLtm8AVoFaZBwSIcFzZN89A43iMqJM/hk4x9WJ++btChu+YgZtBX7ie5KE
	 8NUyKhOgSEBREQ2CkyS8KLa3U0NrtkhWQ1Ur2TYh2IXrQY8WO0W51Cyg1/EVMC4BDY
	 fnUePUTEwNjyWQbaIcFtqSHZiaEprCcKuo2M0qx3FOcWpeJbIA0zSv2dv+0kysiyYY
	 9fT/cORhmQvMwCEoHEbjJEkWrnKfujrChSmJJNRvBfMQ2YVXkrLOUyr9zO5xn7Xlne
	 X0QOy5tCzDKEZ7AsZ18fywaTGeO+KAene0JE1SzHwO1nBkL9X8QAn+2F5/+xwzBu9P
	 L6UMk6pGC5Evw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Enable hw acceleration for PPPoE
 traffic
Date: Fri, 23 May 2025 21:23:29 +0200
Message-Id: <20250523-b4-airoha-flowtable-pppoe-v1-0-8584401568e0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADHLMGgC/x3MQQqAIBBA0avErBtQy4VdJVpMNdZApGhUEN09a
 fkW/z+QOQln6KoHEp+SJewFuq5gWmlfGGUuBqOMVa1ucGyRJIWV0G/hOmjcGGOMgdFM2jlvlXV
 MUPqY2Mv9v/vhfT+sc81ZawAAAA==
X-Change-ID: 20250413-b4-airoha-flowtable-pppoe-2c199f5059ea
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_122354_718471_DD9B3CDB 
X-CRM114-Status: UNSURE (   5.93  )
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

Initialize PPE UPDMEM source-mac table used during IPv6 traffic hw
acceleration.
Introduce flowtable hw acceleration for PPPoE traffic.

---
Lorenzo Bianconi (2):
      net: airoha: Initialize PPE UPDMEM source-mac table
      net: airoha: Add PPPoE offload support

 drivers/net/ethernet/airoha/airoha_eth.c  |  2 ++
 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_ppe.c  | 60 ++++++++++++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_regs.h | 10 ++++++
 4 files changed, 60 insertions(+), 13 deletions(-)
---
base-commit: ea15e046263b19e91ffd827645ae5dfa44ebd044
change-id: 20250413-b4-airoha-flowtable-pppoe-2c199f5059ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


