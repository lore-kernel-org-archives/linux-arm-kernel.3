Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717ECCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 07:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/APWJChxO3f/NgknNL6ouQSuo/7qzkz8dw1G4+J11DM=; b=NpcoF46pKf+X9R
	GKdovXyT42OHQsqS6WnAUDMVkyO8+FDHPxUUny8BGri+MBgvZqP96aWiOCb3zR42FA2cc156hdytt
	9sEkUM0SuAgKDKidXTWaM41NOWC2axfk8XhPWSZRWFA3puZ4z0j1yLX+HkCHriw0XzH3Bh9dGgJlu
	HNL8I9N/hTldp/OnL5XG5fsIKnyaYnQMybray5/R4VVTlBI1/eOgRgzLA/kOSUvLQEjzn2BKHVlE8
	Ux6a3h8szS4DVmuW0bOrSC24u29ftpyFEXTJ+D2IU+5FAaKQ5JrEmWoHkcN0r/iVT5gmVtX2bdtTN
	gDQ7niuzLqqnAanwObmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjR-00000000gM3-2R2Q;
	Wed, 15 Oct 2025 07:15:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjP-00000000gKf-244L;
	Wed, 15 Oct 2025 07:15:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 10C6943829;
	Wed, 15 Oct 2025 07:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6913DC4CEF8;
	Wed, 15 Oct 2025 07:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512529;
	bh=V/D5+RxaBaTzRsVlk1fFmdDyl83zpQXVdvRBYnoOhmM=;
	h=From:Subject:Date:To:Cc:From;
	b=dICxFa+GPIJOZ3a70/jcdGo7dRL8wG48FRX7kXjLFdvYKIlwtnqvYflb7M6uJqZu3
	 88qyPfBwtLxn1Bjy6++unULjt33dtylgm+wjqQGL0M+tM31HFHvdRCTod7I+1ZgtiY
	 qXOLweshOvMUtR2FBWTHTCTVkrPU2B7NFWOedH+M60ED8t90ZeLbdHoWiEIzFu9A1A
	 t+JCOC1U5J3FBhTVwR/G666ME7cApkLrvMlBKUo2J7Jxi0XlLplUqp60KZyz3KmpZ2
	 Ah6Nn8q8oC59jahC7zO1eGrinp8AiCa1sLVWB01P8RuAe0umGfPvIPgkrXtrF1F7CR
	 Uaa6dR4QcqGtg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 00/12] net: airoha: Add AN7583 ethernet controller
 support
Date: Wed, 15 Oct 2025 09:15:00 +0200
Message-Id: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVJ72gC/x3MTQqAIBBA4avIrBtQs9+rRAupqWZjohZBePek5
 bd474VIgSnCKF4IdHPk0xWoSsByWLcT8loMWupGSWnQuq7pa6R0YLy8P0NCZfWm19YMdS+hhD7
 Qxs8/neacP1uDB71kAAAA
X-Change-ID: 20251004-an7583-eth-support-1a2f2d649380
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_001531_578007_ED0AD048 
X-CRM114-Status: UNSURE (   7.01  )
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

Introduce support for AN7583 ethernet controller to airoha-eth dirver.
The main differences between EN7581 and AN7583 is the latter runs a
single PPE module while EN7581 runs two of them. Moreover PPE SRAM in
AN7583 SoC is reduced to 8K (while SRAM is 16K on EN7581).

---
Lorenzo Bianconi (12):
      dt-bindings: net: airoha: Add AN7583 support
      net: airoha: ppe: Dynamically allocate foe_check_time array in airoha_ppe struct
      net: airoha: Add airoha_ppe_get_num_stats_entries() and airoha_ppe_get_num_total_stats_entries()
      net: airoha: Add airoha_eth_soc_data struct
      net: airoha: Generalize airoha_ppe2_is_enabled routine
      net: airoha: ppe: Move PPE memory info in airoha_eth_soc_data struct
      net: airoha: ppe: Remove airoha_ppe_is_enabled() where not necessary
      net: airoha: ppe: Configure SRAM PPE entries via the cpu
      net: airoha: ppe: Flush PPE SRAM table during PPE setup
      net: airoha: Select default ppe cpu port in airoha_dev_init()
      net: airoha: Refactor src port configuration in airhoha_set_gdm2_loopback
      net: airoha: Add AN7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  60 ++++-
 drivers/net/ethernet/airoha/airoha_eth.c           | 247 ++++++++++++++------
 drivers/net/ethernet/airoha/airoha_eth.h           |  58 +++--
 drivers/net/ethernet/airoha/airoha_ppe.c           | 256 ++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |   3 +-
 drivers/net/ethernet/airoha/airoha_regs.h          |   5 +-
 6 files changed, 443 insertions(+), 186 deletions(-)
---
base-commit: 6033d2a2468e07ec90bb153ea7c6c3bc2170c1e0
change-id: 20251004-an7583-eth-support-1a2f2d649380

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


