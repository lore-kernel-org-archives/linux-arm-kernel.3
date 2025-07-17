Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED73C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 07:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9XS7wArp4qrBgUCHq+rBYzs6XXcf8oPSL+2Ok8Li+g=; b=cXxTG/4BOqUUSp
	8/0up5IeHJQ/xH4qfGCm8dwhqEBXMqNNy4mB66brmei9b/m1OcYPtgwiD78/e4sFZU0qsnRAvQVoB
	SsmrQtenV+hI+xVrtPFTNp7nkLxSKtvE1LYUGVQu4hW2HlxQYll5PxiFbg9MxnAdKCAWTsekeeyKC
	Ebq9TfMjb+WQmmv9sog9S7/RiVoeAMGhg/wSDQiDi9ejj9prnHHzhMijz5MVtr5bLoqO6Q3pZHyeD
	3OUe5zbooROMJD3q6yjg4f+lPjv84tfpWvHuk0CtqB6CK0Tc+GJHX8ntKcS2r+t2RcND2qUPLnMxU
	VziehLyAZ+iONOmF8CkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucId6-00000009MiK-1bpN;
	Thu, 17 Jul 2025 07:02:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIZI-00000009LZB-0miT;
	Thu, 17 Jul 2025 06:58:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7818EA5772C;
	Thu, 17 Jul 2025 06:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A348AC4CEE3;
	Thu, 17 Jul 2025 06:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752735491;
	bh=DTAc1QH2SG3wBIaDqh/zWN6e5pCpQY2YlQrMVLcHS5I=;
	h=From:Subject:Date:To:Cc:From;
	b=OFtfpfXcIQiBCe61xRDUOlE+OyqUKE3/2zysnAzg4uwVKvXYg9yMZT2Zjc74s1Guh
	 uLB/CQ0TP7E7m7H1ZUUkFelcKsrVRayDJDDnVHvAbv9s/mVcrZUiQnZOH7KvECCJXU
	 e7RNwPgMvZlYzdbQSvkOvPuGyDkzRvHbq2ge1adI/YdhuquPbNl3e3YTKf6F0rjecy
	 Z4NoK8IJmf+54AytWdILySv7EsuFl93VH2j0OCHThnbbz9cxEclPVQFpgY30PXi1zn
	 xFPQX4qM8LSlBMAZllksPfLRp3MGag18cSRe6A17jAAYuQaSMa14n1xwVRLYqv0tna
	 W2mnLSzgleaAA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v4 0/7] net: airoha: Introduce NPU callbacks for
 wlan offloading
Date: Thu, 17 Jul 2025 08:57:41 +0200
Message-Id: <20250717-airoha-en7581-wlan-offlaod-v4-0-6db178391ed2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOWeeGgC/33OQQ6CMBCF4auYrq2ZtkCLK+9hXAwwlUbSmmJQQ
 7i7hcQEY8Lyn8X3ZmQ9RUc9O+5GFmlwvQs+RbbfsbpFfyXumtRMgsxBg+DoYmiRk9e5EfzZoef
 B2g5Dwwtdlw1aazKtWALukax7Lfj5krp1/SPE97I1iPn6ZeUWOwgO3IACKDVApczpRtFTdwjxy
 mZ3kGsr37RkslRtldQmJ2XEn6VWlsg2LbX8hZUtEKmk7MeapukDMEhRYl0BAAA=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_235812_365947_875E8C9F 
X-CRM114-Status: UNSURE (   9.05  )
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
the MT7996 driver in order to enable the offloading.
MT76 support has been posted as RFC in [0] in order to show how the
APIs are consumed.

[0] https://lore.kernel.org/linux-wireless/cover.1752505597.git.lorenzo@kernel.org/T/#t

---
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
base-commit: cd031354087d8ae005404f0c552730f0bd33ac33
change-id: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


