Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901AAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ihDa/cNJFbG0zeJ+FzaSg54i+a3X421t5V9aok1W3xs=; b=ZXi5SursM/FaUs
	4c6gzLQORyJUsmTjI5OEq837U5G4CirK0aQJaKwgOCVAdlU7c8w4UpkA2mJ5UuIIh5PcRK2ki4wX5
	VI+219oIfY8xR8XTrGuA0Yzgttb1tmVD0xcTg2X9L4w+3585Be0VeQffZu+VDbRkTORTAvTqcG4sP
	v8ymC3/whbs3wBbW8Pi6pfp0E6SNC7PUxBRYNTy2K7VFAszsxheZVTS+Ju+vjvXvN7aOIjsxFFH4x
	u1hr391LNHGl5FAEPU0LFyzVQ1a51N1L25U6xLQJlLkYExS5qJwunXahvYC33s1NtSRLDpnhNKy2Y
	mcfG9yQ4mDWvL9VzBP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedAs-00000005aa2-1QR6;
	Wed, 23 Jul 2025 17:22:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued8Q-00000005a3I-0hGI;
	Wed, 23 Jul 2025 17:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B91D5C4B5E;
	Wed, 23 Jul 2025 17:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85E0AC4CEE7;
	Wed, 23 Jul 2025 17:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753291204;
	bh=zp+jX/kXfpkO7Tu8Jj84eW8FHZ9VneOw13Yz+OEtiW8=;
	h=From:Subject:Date:To:Cc:From;
	b=m6IixJ8I44Vn0PM8TJaI1DRBt9HlAW+TtStOnYhvTFtnhT6eLX2Z9CNXrzXLQFHvp
	 HsmBn4TiFUVaSNXURh8Gg7dA9z6kjNRFWIGcSWL1E8rWzNGcZ4A4unK5jhIK9Rh+RM
	 rFH7ldtrYelnpaHAzZ9DtK1iA9H6/cmdRU5iJoTMpR6fvvFMfmsxjy4TMl2QPqTRpY
	 mtS2ZelfScivkcZS095Xwr+CK6MpLal3ny+ceNw9t0YKsZ3W0jfbqM5cQSb4aIfPHW
	 wDKKpBzIIGfqjnj324O9sueI1hT1qL0WVS1rSQzcGWviQbblFjz7k45ZHv0qXMZw4f
	 5YSFUnJoPEBZw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v5 0/7] net: airoha: Introduce NPU callbacks for
 wlan offloading
Date: Wed, 23 Jul 2025 19:19:49 +0200
Message-Id: <20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYZgWgC/33OwYrDIBDG8Vcpnteijkazp32PZQ+TODayQYtZ0
 i4l714bKKQUcvzP4ffNjU1UIk3s83BjheY4xZxqmI8D6wdMJ+LR12ZKKCOskBxjyQNyStY4yS8
 jJp5DGDF73ti+9RiC0xZYBc6FQryu+PdP7SFOf7n8r1uzfFyfrNpjZ8kFdwKEaK0QHbivXyqJx
 mMuJ/ZwZ7W1zK6lqgV9AGWdIXDyzYKNJfWuBetf2IUGkVrSb5beWnbX0tVqfCetg1aSVy/Wsix
 32QBQPKkBAAA=
X-Change-ID: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_102006_306827_30A488AF 
X-CRM114-Status: GOOD (  10.31  )
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
the MT7996 driver in order to enable the offloading.
MT76 support has been posted as RFC in [0] in order to show how the
APIs are consumed.

[0] https://lore.kernel.org/linux-wireless/cover.1753173330.git.lorenzo@kernel.org/

---
Changes in v5:
- Rebase on top of net-next main branch
- Link to v4: https://lore.kernel.org/r/20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org

Changes in v4:
- Improve commit messages
- Link to v3: https://lore.kernel.org/r/20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org

Changes in v3:
- Rename 'binary' memory region in 'firmware'
- Do not make memory-region-names property required
- Link to v2: https://lore.kernel.org/r/20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org

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

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  19 +-
 drivers/net/ethernet/airoha/airoha_npu.c           | 180 +++++++++++++-
 drivers/net/ethernet/airoha/airoha_npu.h           |  36 ---
 drivers/net/ethernet/airoha/airoha_ppe.c           |   2 +-
 include/linux/soc/airoha/airoha_offload.h          | 259 +++++++++++++++++++++
 5 files changed, 452 insertions(+), 44 deletions(-)
---
base-commit: 56613001dfc9b2e35e2d6ba857cbc2eb0bac4272
change-id: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


