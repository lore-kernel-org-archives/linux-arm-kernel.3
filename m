Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E3D1D46B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 15:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6TFrsxq28g+eIUA/OdkuizYSekiTlcedOcYb5i+65JA=; b=bk5aMvOjb40YxH
	tnrvNUUQp5PJbpg9aooF8dFZS0coQSgVvN2QPXhy1mas9Sjb5+iKrtD6jx62AoUcLi6wTkrTuCjRC
	tVxQW57HVNy4jTmsy5tLNHj5G5PJa6FYAJTosm0p0uR0vk+iHSRqIQr0axsu76uJYMMCJ3LUXKFKH
	pil0RUe71Gc4fz6naaQ1rjjh5PzO5xIPHUMR/v9svuTP92OKRhMsxPnem8/pwoSDSsw74PRKltFYZ
	TGJbSkGeAOuZU8f4lt6fKezBc0bW+UO+hQDhPXVGfmTPtHRuQasp0cWuVaeNe1XSHf1FymuASLFbB
	VM2UmIHCJK6fxStpzdvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZy-0000000HS3k-37Bo;
	Thu, 08 Jan 2026 15:05:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZx-0000000HS2O-0JRy;
	Thu, 08 Jan 2026 15:05:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A7BC60130;
	Thu,  8 Jan 2026 15:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826B3C116D0;
	Thu,  8 Jan 2026 15:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767884735;
	bh=OhlOQ7KmGY1tCliVjuLQ3JOxdM6RT+MpKjYTQNq49QU=;
	h=From:Subject:Date:To:Cc:From;
	b=aU0hxsE9w6KFlaqb5qfNSIS0DUG+I8lveyFHswoGwf3mTYDYF4JGhjA8Xo4I0ekOE
	 8kTopEsog54rnEv1qIrHiBt0vuUvHR2dG+8Gk83Bh18EKcUMykBLaQz1osIyfDLngi
	 p38i/YgRtfg+jLmOf7ND6ngyruPdVyx5pD2/wcek2KRZpVZGsd5DG4V740o32nXJAN
	 HdInwQJlDhBAkx8NfvXocMYrbSPowlJMVmG5WWIWYyuJ2xvawU4W5EOYSj4SdBEvm2
	 GjM+zSv5WGoIGARX9mctvsvCThR0cBtOovBQpzk4GB2YZ0ijRv/uTdtgmnjp5t+s4i
	 d2hTYJy7un6wA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v3 0/2] net: airoha: Init Block Ack memory region
 for MT7996 NPU offloading
Date: Thu, 08 Jan 2026 16:05:06 +0100
Message-Id: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNzw6CMAwG8FchO1uzP46BJ9/DeBhQYFGYKWbRE
 N7dQmKiBy9Nvqbfr7OYkAJO4pjNgjCFKcSRg9llou792CGEhrPQUudSSQ0+UOw9VB4GHCK9gLD
 jDtiiKfXBOGUKLbh9J2zDc5PPF859mB58vj1Kat1+TPvXTAok2Eo674yreZ6uSCPe9pE6saJJf
 0PuP6QZagpV2rbOc2fUD7Qsyxv+n74tCAEAAA==
X-Change-ID: 20260102-airoha-ba-memory-region-58d924371382
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This is a preliminary series in order to enable NPU offloading for
MT7996 (Eagle) chipset.

---
Changes in v3:
- Add missing minItems for memory-region-names in airoha,en7581-npu.yaml
- Link to v2: https://lore.kernel.org/r/20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org

Changes in v2:
- Remork memory-region entry in airoha,en7581-npu.yaml
- Link to v1: https://lore.kernel.org/r/20260105-airoha-ba-memory-region-v1-0-5b07a737c7a7@kernel.org

---
Lorenzo Bianconi (2):
      dt-bindings: net: airoha: npu: Add BA memory region
      net: airoha: npu: Init BA memory region if provided via DTS

 .../devicetree/bindings/net/airoha,en7581-npu.yaml  | 21 +++++++++++----------
 drivers/net/ethernet/airoha/airoha_npu.c            |  8 ++++++++
 2 files changed, 19 insertions(+), 10 deletions(-)
---
base-commit: fd1de45ad24f24cf0aedee0f64e668674a9bd6c9
change-id: 20260102-airoha-ba-memory-region-58d924371382

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


