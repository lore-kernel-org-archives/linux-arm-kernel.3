Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF789C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CwBY/hv6JUgerl/VzpODclTJIB9MTuyqkUYxVcyFo8Y=; b=F1JR4M9kCm5H0y
	YHQIv5/29CgCx13OJORWr9gj7vAIEa4EM4xj9DFOxJcQqCvfoCVHU2ZKDpFPGwbZJkGqMNPeVhgVG
	G/W2Vd/1fowARmGzypo7KF/s5VBLAvI3WiYWZQEvF3si5XdDQBu6HECpphl8Hwpao7yXJ6gCd3AYV
	+pdRDJEmGjBHHykqIo17JBAj0mKvYjqnNP0eeh+QCYc0P1ckkBsdjTHkA/PFnZQLfDY/8dK8434uZ
	vKlxU6Lj/b3WvvlHpnjNsHIRVePaw1Cm1iKkM7AkJeitmoORxvn76StwRc5BGueW1UqylFaEK0y8W
	OBRg4N+kKYO9nY4UFtuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubOFW-0000000343E-0MH4;
	Mon, 14 Jul 2025 18:50:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubL3g-00000002f20-3e3x;
	Mon, 14 Jul 2025 15:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FD3461462;
	Mon, 14 Jul 2025 15:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F0DC4CEED;
	Mon, 14 Jul 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752506736;
	bh=YCh066qOSOnzw5puiQyznGUyX8fu8FqZ4e6PkpV2Kvk=;
	h=From:Subject:Date:To:Cc:From;
	b=M/Vs8vV3c8NeRZ67XB+uG0nSpxRlEHQfX4YR95ljNzpd98VVc1hdcwTEFkzibBiZH
	 d59N03CoCbfZ2tHF16BdbTnXuTxEepVfKIhAuZhI51j/vUVVKDTkVouTvdWSP5sTMT
	 H48OdW/Dei/VEdXCWqAzQUTYD6cRCFP5ztMCEXecsyTmWeAtpybNmCywNd7jtODCfM
	 6TSraMYrdEF8swJXNglhpinsZeOl+04haOubgEXcG49rvN4wR+te0druzpJemzIFUP
	 kYLXMzrhDHSXEdXq6WWBJ0FZbeSTJFXvvEvDETpfbfgF6D3a50Kbe01uCUkKpoUhrN
	 /w6anQs06MGuw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 0/7] net: airoha: Introduce NPU callbacks for
 wlan offloading
Date: Mon, 14 Jul 2025 17:25:13 +0200
Message-Id: <20250714-airoha-en7581-wlan-offlaod-v3-0-80abf6aae9e4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkhdWgC/33NQQ7CIBCF4asY1o4ZQIS68h7GBbZDS2zAgKmap
 neXNjHRTZf/W3xvZJmSp8yOm5ElGnz2MZSQ2w2rOxtaAt+UZgKFQo0crE+xs0BBK8Ph2dsA0bn
 exgYOuq4a65zZa8kKcE/k/GvBz5fSnc+PmN7L18Dn9cuKNXbggGBQIlYa8SrN6UYpUL+LqWWzO
 4hfS61aoliydlJoo0ga/mdN0/QB1iVdPxEBAAA=
X-Change-ID: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
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

Similar to wired traffic, EN7581 SoC allows to offload traffic to/from
the MT76 wireless NIC configuring the NPU module via the Netfilter
flowtable. This series introduces the necessary NPU callback used by
the MT7996 driver in order to enable the offloading.
MT76 support has been posted as RFC in [0] in order to show how the
APIs are consumed.

[0] https://lore.kernel.org/linux-wireless/cover.1752505597.git.lorenzo@kernel.org/T/#t

---
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
base-commit: b06c4311711c57c5e558bd29824b08f0a6e2a155
change-id: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


