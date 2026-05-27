Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2916BCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 10:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GCDBQyOqO+wkKS4SzAvFryKV14tQQLMUO7YZ3xM4bRo=; b=JgL5Nq0FV5bT/l
	1fvWFWNKJvlovJiSg2Pa4q1vQ339qXunBIk9zvOfZ99Ljv6KZSrYQGcL4SCdIEmoK6lNCTYzUWZZU
	BmLhi8SX+/96dRndr1xbfq6Wp17wXs2uvv2DA9wq8ftw0nGYxYWFde4Azfk/yKWbznQn4jxJXBUsS
	wX1xza/pupc3UQlLo4VbNxjR8fQvRYiwqcGAsFMF7+V3R2ul92qNwzfQARzGn0w/gjE3i72cH46md
	XLdG0xu9y2TkvuEVUYQeJB1as339ztX1om52/kk+I6MnTWp+dLXQiLijcD6emLN7NWcSZ30eAn4S6
	XNPKwrFsa+N8QzZej/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBOJ-00000003oTL-0MyZ;
	Wed, 27 May 2026 10:21:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBOH-00000003oSG-46zH;
	Wed, 27 May 2026 10:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CA29600AB;
	Wed, 27 May 2026 10:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3719D1F000E9;
	Wed, 27 May 2026 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779877292;
	bh=GCDBQyOqO+wkKS4SzAvFryKV14tQQLMUO7YZ3xM4bRo=;
	h=From:Subject:Date:To:Cc;
	b=P/NqUaoHvULOOBMbnPno7nkQDdfZa4eFiHLySPdjY4k5Ig7q3Vfdfa8YI5ace68bb
	 nUmhGtar791JCXurQFWy3J+tNQrRDkMqL3Q4RevNgS8TBkCRZmdzR6Acmzccox8vAZ
	 HB6pS0p1O6qK0XOU1uJTozZMmGgzahov4CYS1rH7ZuH6kOXOvxFYkE8GACK7CFNrkd
	 NVePQIO9BlVFfpc7rctOoeja53Wr6ppqdhTjZWv/qsUtQvWO+hagUXDZHuYwATrwTb
	 LuO2dUKgPUElESMTror7TmBzX3lHMmn5jYtqsKCbbPVSBIw7eh3adZhcamiJaCof+4
	 OB7BEQgbq2w7w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/6] net: airoha: Preliminary patches to support
 multiple net_devices connected to the same GDM port
Date: Wed, 27 May 2026 12:21:14 +0200
Message-Id: <20260527-airoha-eth-multi-serdes-preliminary-v1-0-ec6ed73ef7fc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDQAwAvyI5N7AGtdCvlB62mu0GNJbsWizi3
 xt6HAZmDihswgVuzQHGHymyqkN7aWDMUV+MMjkDBRpCT1eMYmuOyDXjss1V0AMTF3wbz7KIRvt
 i31Lo0nPoKI3gJXdJ9v/lDsoVlfcKj/P8AU/XkBx/AAAA
X-Change-ID: 20260527-airoha-eth-multi-serdes-preliminary-51204fb642fc
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
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

EN7581 or AN7583 SoCs support connecting multiple external SerDes (e.g.
Ethernet or USB SerDes) to GDM3 or GDM4 ports via a hw arbiter that
manages the traffic in a TDM manner. As a result multiple net_devices can
connect to the same GDM{3,4} port and there is a theoretical "1:n"
relation between GDM ports and net_devices.

           ┌─────────────────────────────────┐
           │                                 │    ┌──────┐
           │                         P1 GDM1 ├────►MT7530│
           │                                 │    └──────┘
           │                                 │      ETH0 (DSA conduit)
           │                                 │
           │              PSE/FE             │
           │                                 │
           │                                 │
           │                                 │    ┌─────┐
           │                         P0 CDM1 ├────►QDMA0│
           │  P4                     P9 GDM4 │    └─────┘
           └──┬─────────────────────────┬────┘
              │                         │
           ┌──▼──┐                 ┌────▼────┐
           │ PPE │                 │   ARB   │
           └─────┘                 └─┬─────┬─┘
                                     │     │
                                  ┌──▼──┐┌─▼───┐
                                  │ ETH ││ USB │
                                  └─────┘└─────┘
                                   ETH1   ETH2

This is a preliminary series to introduce support for multiple net_devices
connected to the same Frame Engine (FE) GDM port (GDM3 or GDM4) via an
external hw arbiter.

---
Lorenzo Bianconi (6):
      net: airoha: Introduce airoha_gdm_dev struct
      net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
      net: airoha: Rely on airoha_gdm_dev pointer in airoha_is_lan_gdm_port()
      net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct
      net: airoha: Move {cpu,fwd}_tx_packets in airoha_gdm_dev struct
      net: airoha: Rename airoha_set_gdm2_loopback in airoha_enable_gdm2_loopback

 drivers/net/ethernet/airoha/airoha_eth.c | 445 ++++++++++++++++++-------------
 drivers/net/ethernet/airoha/airoha_eth.h |  35 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c |  34 +--
 3 files changed, 297 insertions(+), 217 deletions(-)
---
base-commit: aa064a614efcfa4c300609d1f01134e99a12ad10
change-id: 20260527-airoha-eth-multi-serdes-preliminary-51204fb642fc

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


