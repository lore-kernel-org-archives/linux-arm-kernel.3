Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C9FCD98DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 04:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=; b=yueFHu4dgiqy8/7lbK/TKM3bnz
	xKRTM4YzmjoAjK4Aep/KADgsG2Pbk71OF7KzMYWYpZVmn5XSgwpspdK8aqrGzW7IjNzwxrePl+8a5
	lgw/8JIoc/D1UGu6uRrgswdJqdEx8ic5mTtqnhFZ/jOsbXq8zQWS8oR2lR5OXobi8lFmanP8HfqMs
	vjS2W22wqv5uHIYsln5lrIbOq/Et3U5zK9DK86l8zejM4fogJVdFY2Gv1n7X90rkSEU6fL8+1+whF
	jvmZW7tfu0HaQ3tRGe0uXX4Tg8ySrEiA90xtSP+SHlpzcu3nH2Q58+81qUq96CMabWVbnlwuqI5oG
	AsV16yNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc1u-0000000ChzO-3COB;
	Sun, 14 Jun 2026 04:01:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc1s-0000000ChyG-1jbS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 04:01:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36d630c0e35so2263285a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409658; x=1782014458; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=;
        b=qCCnUIQmRRvrqOKUHGMCbTCU3HJ3xeqwfxawI0tQetV0TsWSGOkBnHaFJrJ9m5GVen
         vdQvR+SAco+HgWphGe2/k2SqgVEKU97TPimurDMZy/UyMZm/W4xpCrGZBMbj26zrwW4N
         Pr4UyNdKDlYj6DikbC9Laivj+rIbSQeatAiVLYU71pBfFQsCUbrfCbZs9Nl/NNmhhHSy
         xe1eA3bKMGM5pLjiFhADssRY7GATRXZr12G+oRjXOYAOfYUSL0new2PhWD+ICZVTCKIB
         Dtc7IDG9IWJbs+lDFPvUhzZS7GkqInS2z1VfxZdkINAmXKII3LwjN39GknSAdpuKNDOt
         L5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409658; x=1782014458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q49mRONNBYR0JeB0FoFSRUEZksnbOzysOYCNAb9xxlY=;
        b=IsVpXR49VADYdyy3jgT4LGcd7s6cMcH7EJnjdt6ZwlGZGoIKdeHthwBQzlgQgdlL+r
         xDr23zLO1BNd4rswngAuxpMh5GWkuZIK7KtOYusE0iXSxdkRs6uTF5I8q6VMuxsbNsY8
         w681XeYapQoRb+vLjYsNfgaFlMm2QYPtk64Cuz+cGmhIKfpo1Gb3QPl5mwAS2bW/m08i
         JO77jhqXcnkudSOCrvMSjoN5+tnAnfDgxSlDt81SiTeXm2pCeXgYH0RehhQWe74KUTGj
         /HK3EV1pAvoGA7OaWC/LuKe+3onh+xs3L2JbS5c3Y/tKv1NKQ594A9y+xKzG//KV6+Pw
         5oQA==
X-Forwarded-Encrypted: i=1; AFNElJ965Hxc4EXSCrwnDokUUzYcbndf0uRn/gF2bhRv8S5HGoz5EirFawwQHq1l2AsaqCvB6bR5Ce3JcTc4FI9KGI41@lists.infradead.org
X-Gm-Message-State: AOJu0YxUBbmo3ruJsDX8EfTaQKiDQgiBJabPZsbxPqdDYr/K3uQqyqQe
	lVcCdN07+YGLfErXqZG7NpuMsOOgWJmJwdlfrARlBKWJSnYeaO5E9zm5
X-Gm-Gg: Acq92OGIpHVs2h7kfGZrBU1nh3KTJUJPenPUecrJrHNFDM+pJYvU2c8d1jQM7x1dT9A
	MbkF0GyRsl62C6fldPZUUPl4uyFZ9Weg4UE+UqTvIZDusDDb5+uXP9/tM6Uxr5ndD+Q3giuzHBA
	KR5s5XQd8JSrjHkBz+YDtrZ+A4pGRCEe7EMFKzZ4bqBwW4x4+FrVJLJBmfCzqRJxuvH4Fn7FwZ8
	FmfK57TU1jiCwEnEB4riJ9LXwZSluSe5er38+g/exWtUWt53/E5Ey+VEcVAJ7og46LuY3OlkvFx
	cDAPnuzsIVhl+oLAy/7vEo3NxGyP4JG0N/hh106+BqTWiQqsbbAW2VydldpgGHi7qg7iipEDVMY
	t2mm7NE5DE9K2u2AXYQMEylqplFGyCjOg1uc4QnVuUZB6M0qqOeHNRPfHD9u03tbXwoZJcFHdLe
	ib/4+c/HGqrKQaKJZI1tC1B7tTyoFXSQ==
X-Received: by 2002:a17:90b:5588:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-37c2bd79bc6mr5257855a91.25.1781409658385;
        Sat, 13 Jun 2026 21:00:58 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:00:57 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 0/7] net: airoha: add EN7581 SOE ESP packet offload
Date: Sun, 14 Jun 2026 13:00:25 +0900
Message-ID: <20260614040032.1567994-1-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_210100_453215_4B9800E2 
X-CRM114-Status: GOOD (  14.64  )
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

Add Secure Offload Engine (SOE) support for the Airoha EN7581 Ethernet
driver. SOE provides inline ESP packet offload for native ESP and NAT-T
traffic, with the Ethernet/QDMA path used to submit packets to the SOE
block and the PPE path used to bind eligible ESP flows. NETIF_F_GSO_ESP
and NETIF_F_HW_ESP_TX_CSUM are intentionally left out for now and will be
revisited separately for feasibility.

This is posted as RFC because the code was originally developed and tested
against an OpenWrt 6.18 Airoha tree, not against the current upstream
net-next driver. The original OpenWrt commit used as the source for this
RFC is available at:
https://github.com/hurryman2212/OpenW1700k-test/commit/7c1b5e662f7790b3d23ed143beadc1dcbf6d15f7

The SOE part is intentionally linked into the airoha Ethernet module
instead of being exposed as an independent crypto or platform driver. The
user-visible ESP offload control is a netdev capability: xfrmdev_ops and
NETIF_F_HW_ESP live on the target netdev, and the feature can be controlled
through the usual netdev feature path. SOE also shares the FE/QDMA/PPE
datapath, private queues, DSA conduit handling and netdev lifetime owned by
airoha_eth.

Patch 1 adds xdo_dev_packet_xmit() because the existing XFRM packet
offload transmit path does not provide a hook for hardware whose ESP engine
is reached through device-specific packet forwarding. SOE needs to consume
the skb, add a hardware hop descriptor, steer it to a private QDMA path and
return the final transmit status. Drivers that do not implement the
optional callback keep the existing XFRM output behavior.

Jihong Min (7):
  xfrm: allow packet offload drivers to own transmit
  dt-bindings: net: airoha: add EN7581 SOE
  arm64: dts: airoha: add EN7581 SOE node
  net: airoha: add SOE registers and driver state
  net: airoha: add QDMA support for SOE packets
  net: airoha: add PPE support for SOE flows
  net: airoha: add SOE XFRM packet offload support

 .../bindings/net/airoha,en7581-soe.yaml       |   48 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/airoha/en7581.dtsi        |    6 +
 drivers/net/ethernet/airoha/Kconfig           |   13 +
 drivers/net/ethernet/airoha/Makefile          |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  668 +++++-
 drivers/net/ethernet/airoha/airoha_eth.h      |   40 +
 drivers/net/ethernet/airoha/airoha_ppe.c      |  606 +++++-
 drivers/net/ethernet/airoha/airoha_regs.h     |   16 +
 drivers/net/ethernet/airoha/airoha_soe.c      | 1896 +++++++++++++++++
 drivers/net/ethernet/airoha/airoha_soe.h      |  126 ++
 include/linux/netdevice.h                     |    8 +
 include/linux/soc/airoha/airoha_offload.h     |    5 +
 net/xfrm/xfrm_output.c                        |   11 +
 14 files changed, 3342 insertions(+), 103 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,en7581-soe.yaml
 create mode 100644 drivers/net/ethernet/airoha/airoha_soe.c
 create mode 100644 drivers/net/ethernet/airoha/airoha_soe.h

-- 
2.53.0

