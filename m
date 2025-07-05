Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6DAC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 21:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dMqvztKcH8gFT0oG0FKmYP0NuC6kriORGSSgKYcBMhU=; b=z6msCoQOIzKHn3
	WOrD6O02NMVDeuyXihiPEX0ooEbZT9nsrmEggmxzS3t7YGZa0igXnOXB4f2aF+zOxVGo2LE5Oj/4q
	aMkmvtpd58CxCNnJPNMSyaxGcTymApD2+4Tvt8kZcaeewvJhKiN7cdQbk6cPfa23T39+UqLMJz1M1
	GxLiPJrIer0vz90M+gCse4Nh84zhyiGPvVk29Y8Nv8dbNKKPIqxHSh/o1WaiymP9fC6UfsEQtyax8
	4ScuWH/mutigdJnll4ERLj/itvocdSdukrzzG68THbTvPNxxxuZTjB5Gdr5kRTBLQrpHfK/Mt8Z//
	Vp3A8eYmlzoKudQLXf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYABR-0000000H0rq-3cEB;
	Sat, 05 Jul 2025 21:12:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYA98-0000000H0bn-0QNJ;
	Sat, 05 Jul 2025 21:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6593C43EAA;
	Sat,  5 Jul 2025 21:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB2EC4CEE7;
	Sat,  5 Jul 2025 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751749804;
	bh=n3rcFQ+MPVHTDhl/5n07Sg92l9DRbmRw4++LxHuXcDw=;
	h=From:Subject:Date:To:Cc:From;
	b=GyIZzY/OcIOU6APTBF/8YB0x1W2aljG+aIEkrb08i4ZqK/KsiUytQWa/2g06PX+Dt
	 PgYBtCWrpDGF02CVtMwBCr/smCQh4999kc+G5a//fTI2ub++T3BVjcXIqG2N1xaLYV
	 hd13YXERrd1S1rOkynbbbYYCCezNKRR34TjgHuzVx456IStS0EGI3LR5iNV1WI0OYP
	 6SCw1yUkgq1qbmzYQEj12etkzR4u/nNSeVWOl0aKLXudTiMwjETHVG+p5M/6dMNsw8
	 jrNFAZG3yJLiexc0gDocvIhTFcjNNzXkFhdrsQNeYHxgXU8mtzS2MAPR3I6FnovarM
	 /4c6H7Hydf9zA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/7] net: airoha: Introduce NPU callbacks for
 wlan offloading
Date: Sat, 05 Jul 2025 23:09:44 +0200
Message-Id: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJiUaWgC/33NQQ7CIBCF4as0rB0zUCvUlfcwXWA7tMQGzGCqp
 uHuYhO3Lv+3+N4qErGnJE7VKpgWn3wMJdSuEv1kw0jgh9JCoWpQowTrOU4WKOjGSHjONkB0brZ
 xgKPu28E6Zw66FgW4Mzn/2vBLV3ry6RH5vX0t8rv+WPWPXSQgGKwRW414rc35Rhxo3kceRZdz/
 gBSL4hPxQAAAA==
X-Change-ID: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_141006_168662_A59A7D4A 
X-CRM114-Status: UNSURE (   8.51  )
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

Similar to wired traffic, EN7581 SoC allows to offload traffic to/from
the MT76 wireless NIC configuring the NPU module via the Netfilter
flowtable. This series introduces the necessary NPU callback used by
the MT76 driver in order to enable the offloading.
Subsequent patches will introduce the required MT76 support.

---
Changes in v2:
- Introduce binding for memory regions used for wlan offload
- Rely on of_reserved_mem_region_to_resource_byname
- Export just wlan_{send,get}_msg NPU callback for MT76
- Improve commit messages
- Link to v1: https://lore.kernel.org/r/20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org

---
Lorenzo Bianconi (7):
      dt-bindings: net: airoha: npu: Add memory regions used for wlan offload
      net: airoha: npu: Add NPU wlan memory initialization commands
      net: airoha: npu: Add wlan_{send,get}_msg NPU callbacks
      net: airoha: npu: Add wlan irq management callbacks
      net: airoha: npu: Read NPU wlan interrupt lines from the DTS
      net: airoha: npu: Enable core 3 for WiFi offloading
      net: airoha: Add airoha_offload.h header

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  20 +-
 drivers/net/ethernet/airoha/airoha_npu.c           | 180 ++++++++++++++-
 drivers/net/ethernet/airoha/airoha_npu.h           |  36 ---
 drivers/net/ethernet/airoha/airoha_ppe.c           |   2 +-
 include/linux/soc/airoha/airoha_offload.h          | 256 +++++++++++++++++++++
 5 files changed, 450 insertions(+), 44 deletions(-)
---
base-commit: 6b9fd8857b9fc4dd62e7cd300327f0e48dd76642
change-id: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


