Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA7DCCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XreqbEkjMx7wWtK/YgDE94Oo088cpjk8vUewdbX8Hbg=; b=W9TDUZHEEJdv1L
	bI7QfHfe2cp+rZNgnFmsGzfL1y3hexj5s7CnOMBGPa8IOveTqGZO+xFVhPY/5daGW5MGNIExTjptA
	roy3nOtjb66YzRJBunUgVByKCxQb7m1R1fC3Uo8DG0GDorr0PEYJ7G9pMavY7ybMVCBsN2QkWXNkY
	0kT9XE5LsxGqfG3s6xrUoqh4T0r+5MCI0fQQ+efJ3g8xDQEBBLt7/VJbwePN4AkgI3wXxTlWHBSDH
	SKhcvYwDbRewG/vsdd5Bewz9zGqc7VqXky0HJc8dE107UpG9O80Mhh6xXDHHVmhzEyn28IEdbzyLE
	eEsizS/KuqgSCdtKiWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LDt-00000004Pj8-0CEB;
	Thu, 16 Oct 2025 10:28:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9LDq-00000004PiG-1Z8e;
	Thu, 16 Oct 2025 10:28:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8B8D4A1FE;
	Thu, 16 Oct 2025 10:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD6DC4CEF1;
	Thu, 16 Oct 2025 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760610517;
	bh=7ACd7nRHcRazteVxLXW9lw48ww6CyQ/yAb+kOxQueDY=;
	h=From:Subject:Date:To:Cc:From;
	b=jHciSve+YgrR5ZPP1cvzv1c1Q88lR62qr0SQy/FtXLTg+bkyqTv6sUdBsnsACQHLG
	 dhYAG2tbPPpYnYZ3VbcIJyjzuumV3JzucaMSCOIJw3lbiZNkWFavZy3HjhN+BiEtZA
	 GbTOuDz+gvwsNFnNF7oYk/ppu2Tdg6vASLls6O/No58CV6Yq6zle9CgYiCVVVkU2Rd
	 yA+E7wi5cA8qCWrJkiXLxE2hY/ubTKjiaSUs4VnQDt3Imqlp6pg9laoYoX/GrsIKs/
	 Kv8uz7K4Z8ICsk9LkIPLhy5edltXTol8yMZnmoApliKDGN4v1U7GI3rVIjdb5ID4FM
	 3FUnz2UZgXkGQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 00/13] net: airoha: Add AN7583 ethernet
 controller support
Date: Thu, 16 Oct 2025 12:28:14 +0200
Message-Id: <20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7I8GgC/22NQQ6CMBBFr0Jm7ZhpoQiuvIdhQWSARtM2U2w0h
 LtbiUuX7yX//RUii+UI52IF4WSj9S6DPhRwm3s3MdohM2jSRhFV2LuTaUrkZcb4DMHLgqrXox7
 qqi0bgjwMwqN97dFrl3m2cfHy3j+S+tpfTpl/uaSQkOqqMWYk0+rycmdx/Dh6maDbtu0DZDhTG
 LUAAAA=
X-Change-ID: 20251004-an7583-eth-support-1a2f2d649380
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_032838_455091_6FA833A0 
X-CRM114-Status: UNSURE (   7.99  )
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
Changes in v2:
- rely on IS_ENABLED(CONFIG_NET_AIROHA_FLOW_STATS) instead of ifedef
  CONFIG_NET_AIROHA_FLOW_STATS in airoha_ppe_get_num_stats_entries
  routine
- return number of stats_entries from airoha_ppe_get_num_stats_entries()
  and airoha_ppe_get_total_num_stats_entries()
- remove magic number in airoha_ppe_foe_commit_sram_entry routine
- improve code readability in airhoha_set_gdm2_loopback routine adding
  some macros
- improve commit logs
- remove magic numbers in airoha_ppe_foe_get_entry_locked()
- Link to v1: https://lore.kernel.org/r/20251015-an7583-eth-support-v1-0-064855f05923@kernel.org

---
Lorenzo Bianconi (13):
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
      net: airoha: ppe: Do not use magic numbers in airoha_ppe_foe_get_entry_locked()
      net: airoha: Add AN7583 SoC support

 .../devicetree/bindings/net/airoha,en7581-eth.yaml |  60 ++++-
 drivers/net/ethernet/airoha/airoha_eth.c           | 254 ++++++++++++++------
 drivers/net/ethernet/airoha/airoha_eth.h           |  65 ++++--
 drivers/net/ethernet/airoha/airoha_ppe.c           | 259 ++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c   |   3 +-
 drivers/net/ethernet/airoha/airoha_regs.h          |   6 +-
 6 files changed, 456 insertions(+), 191 deletions(-)
---
base-commit: 00922eeaca3c5c2001781bcad40e0bd54d0fdbb6
change-id: 20251004-an7583-eth-support-1a2f2d649380

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


