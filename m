Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A14C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 07:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vFJ2XFLcLsI7FaPifWFCg5HfYwf1SXbceweqbxSkFJw=; b=sCzdgnkucoExuC
	POenDgUHfLEV6WB+DhHb3SwXel+pa7P+vBQfWdOa/KuILNfed97pJ41PGfY7m6qr8hIMW0O2oqbty
	4HAcBBQLcVAN/culyVRIbJ3BE0Kgubbu5kDssT2bdZDNIQ9NTwPnA+8A0U0qb/wvrhtQf8YkrF7uK
	uLxjTxqxWNoyXbf4sb86I+24DYt548Li9s7mrSWhaxLKdQ74R7aMF6NjX5xWV0yu5xKN+2zDiiN7A
	i2h4aCEjuQIMFrNFnDDYdyx2eujyWeNnH3hL13BiD9g4z7L1Mh84JYX4A988/J3UuQB51BHivX8gr
	PK0ubWjBMmO3FF3N83TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdqb-0000000F3Ur-1eBr;
	Wed, 21 May 2025 07:26:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHdh9-0000000F2Yb-44UG;
	Wed, 21 May 2025 07:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6046C629E2;
	Wed, 21 May 2025 07:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AB0C4CEF3;
	Wed, 21 May 2025 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747811815;
	bh=3HyaTn4YnLp/bMKXEE5qeF1LeOW6suSY3fTbxGDD9Vw=;
	h=From:Subject:Date:To:Cc:From;
	b=f33Bb6Ary4twB6XEkk7mxnvbInYROzsV6bpENojZG4tboODFmhhHNfya+4dXtmEmT
	 u3sX5O117acPvattruXan3bNk4xcIOs7swho/CKpWEzGt7ACotkLo97CGR8t2CeOoF
	 O1CcWantWKwmq+wGgC7ejzjP3uBYRwMN2LpXzRgki8mNnFFxe66SujDySlo6WpKnMP
	 i9fadrlegbF+1yIFmftwUozbzUEZF107GCHYUEH/7TGL9kS2Sd/rzcfMzGAFgV4o3k
	 471L66gK+/FQTJIWE3mUxMCWISyOIb2fQG00IBE42OhXYI5hsHWoxmD5QUtjOZFaUA
	 xTBe+OGyaNaPA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 0/4] Add the capability to consume SRAM for
 hwfd descriptor queue in airoha_eth driver
Date: Wed, 21 May 2025 09:16:35 +0200
Message-Id: <20250521-airopha-desc-sram-v3-0-a6e9b085b4f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANN9LWgC/33NywrCMBCF4VcpszaSJr1YV76HuMhl0ga1KRMJS
 um7m3alIC7/A/PNDBHJY4RjMQNh8tGHMYfcFWAGNfbIvM0Ngoua17xlylOYBsUsRsMiqTtzCrV
 E1Rhtash3E6Hzz808X3IPPj4CvbYXqVzXf1oqGWe2Ely2lSy1U6cr0oi3faAeVi6JT6L7RYhMd
 NZIe+BtY53+IpZleQMenWdo9gAAAA==
X-Change-ID: 20250507-airopha-desc-sram-faeb3ea6cbc5
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

In order to improve packet processing and packet forwarding
performances, EN7581 SoC supports consuming SRAM instead of DRAM for hw
forwarding descriptors queue. For downlink hw accelerated traffic
request to consume SRAM memory for hw forwarding descriptors queue.
Moreover, in some configurations QDMA blocks require a contiguous block
of system memory for hwfd buffers queue. Introduce the capability to
allocate hw buffers forwarding queue via the reserved-memory DTS
property instead of running dmam_alloc_coherent().

---
Changes in v3:
- Remove hwfd references in airoha_qdma_struct in patch 2/4
- Split patch 2/2 in 3/4 and 4/4
- For downlink hw accelerated traffic request to consume SRAM memory for
  hw forwarding descriptors queue
- Fix comments
- Link to v2: https://lore.kernel.org/r/20250509-airopha-desc-sram-v2-0-9dc3d8076dfb@kernel.org

Changes in v2:
- fix sparse warnings
- Link to v1: https://lore.kernel.org/r/20250507-airopha-desc-sram-v1-0-d42037431bfa@kernel.org

---
Lorenzo Bianconi (4):
      dt-bindings: net: airoha: Add EN7581 memory-region property
      net: airoha: Do not store hfwd references in airoha_qdma struct
      net: airoha: Add the capability to allocate hwfd buffers via reserved-memory
      net: airoha: Add the capability to allocate hfwd descriptors in SRAM

 .../devicetree/bindings/net/airoha,en7581-eth.yaml | 13 ++++++
 drivers/net/ethernet/airoha/airoha_eth.c           | 50 ++++++++++++++--------
 drivers/net/ethernet/airoha/airoha_eth.h           | 15 ++++---
 drivers/net/ethernet/airoha/airoha_ppe.c           |  6 +++
 4 files changed, 60 insertions(+), 24 deletions(-)
---
base-commit: e6b3527c3b0a676c710e91798c2709cc0538d312
change-id: 20250507-airopha-desc-sram-faeb3ea6cbc5

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


