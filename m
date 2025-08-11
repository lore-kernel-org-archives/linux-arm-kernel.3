Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44978CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KPGBI2bkhf/am7EGN9J5YiDxCkJNuS1Z8cIR/YZnh3U=; b=wtMdmrDtxiaBUN
	fEq2RDvq/sE1dVohTTogMtVytbgViLrMt8Eaf1yl1i5DH4nvwlYna5Y3iD437OG+toyj3qBOgbmcv
	uXEtfDDfpJqgRtEMEs4Tmzj7NouIf7pnf56x8qACLg46ihdClcuD3LENY4ft63OV5LMxjhdadZGCo
	+y5j7323E9e0HJ2gUyVlgB/IlYIGzvh+kPuxvs/moXTcUkY8lJe/3fnpB/D6szyWRcyuvYJjeM8Xq
	wCJs+MD8Y1Dmb5sqjBw4fBAvupvzIA+j/MDgTF8y0VkoOrZJlG4eYdqu080APDV+ELn7Fe0enhCem
	yzI46j3xVTpe2cDve/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulX2m-00000008kUk-0TLu;
	Mon, 11 Aug 2025 18:14:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUVI-00000008Cxu-2WOP;
	Mon, 11 Aug 2025 15:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BB545C5531;
	Mon, 11 Aug 2025 15:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDD1C4CEED;
	Mon, 11 Aug 2025 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754926323;
	bh=6q79iZqgmRYKyPHnlMqwPzEGP8FF+iIXD11AwfalVcU=;
	h=From:Subject:Date:To:Cc:From;
	b=aABcN5QmeJa0Pmwl9RL6gqihtSfKmm+rxMX8XRsLUt9rXTP55OGJKwPyHWndGnyEc
	 DCx7XTUyKQFeZ3G9tyuEWX0qBwpmDwPKnvJnVPPS/X/oJc/DSakUN3SnYB7r9fd+PQ
	 ut85ODRKfp0xlJHm9QYgAkOOFk4TC9n7ged34geRH51FAIK1TpRCWHIvwGYgEMTla3
	 gblEoctGffVSVWPvMtU4gw8OVhrlfxm/jepuUKFeMPIrUuawCbCxbkXvLt7h9AohW0
	 OAUFbao4LnXkU2AvSaY0z82+tOIO03JN7UxSxlyT9ijjs5BwxcjEXTsaRO1moBVA9Y
	 6cfWjSAeVaL1A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v7 0/7] net: airoha: Introduce NPU callbacks for
 wlan offloading
Date: Mon, 11 Aug 2025 17:31:35 +0200
Message-Id: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANcMmmgC/33Oy2rDMBCF4VcJWldF90tXfY/SxdgaxaLGCnJxU
 oLfvbKh4GLQ8szim/9JZiwJZ/J2eZKCS5pTnuqwLxfSDzBdkaZQNxFMaGYZp5BKHoDiZLXj9D7
 CRHOMI+RAje19gBidspJU4FYwpseOf3zWPaT5O5ef/dfCt+sfK1rswimjjknGvGWsk+79C8uE4
 2suV7K5izhaummJask+SmGdRun4yZIHi6umJfcu6KIBQI/qZKmjZZuWqpYJHbdOeo5BnCx9sIR
 sWrpaAbxAFl2vvD1Z5mi1u8zWBRGCN9Bza/5Z67r+Ahk49ehBAgAA
X-Change-ID: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083204_728884_D8475DCF 
X-CRM114-Status: GOOD (  10.39  )
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
Changes in v7:
- Rebase on top of net-next main branch
- Link to v6: https://lore.kernel.org/r/20250727-airoha-en7581-wlan-offlaod-v6-0-6afad96ac176@kernel.org

Changes in v6:
- Fix wlan_mbox_data message size
- Make NPU memory regions optional in NPU dts
- Link to v5: https://lore.kernel.org/r/20250723-airoha-en7581-wlan-offlaod-v5-0-da92e0f8c497@kernel.org

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

 .../devicetree/bindings/net/airoha,en7581-npu.yaml |  22 +-
 drivers/net/ethernet/airoha/airoha_npu.c           | 175 +++++++++++++-
 drivers/net/ethernet/airoha/airoha_npu.h           |  36 ---
 drivers/net/ethernet/airoha/airoha_ppe.c           |   2 +-
 include/linux/soc/airoha/airoha_offload.h          | 260 +++++++++++++++++++++
 5 files changed, 451 insertions(+), 44 deletions(-)
---
base-commit: 37816488247ddddbc3de113c78c83572274b1e2e
change-id: 20250701-airoha-en7581-wlan-offlaod-67c9daff8473

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


