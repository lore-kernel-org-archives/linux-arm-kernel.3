Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3DEC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9AVvI/rzO1xlw04zuQKTwjeDA+3NqKNZVc0uqJpvu8=; b=wwGO8GTAWzJagZ
	tLAYFbD4GpdjHfxD8eJ/Ojfiz6RkC+bxNxEA70zcROV9MA7ldQDLQ7YCf3rRTa/UkSYIl1yoc2W85
	xGpzoSk39oK1Ravza9wZ0p09juKSv7tdAn87UGuzbCjNhOeEpoil2e7LHRVoshUf4317/m752D5Pc
	hzB8smu/rgDbzube4Xt4vuWz1qTg19nK9Z2mnUJFPmcOd187+rF01gPRpCVF6qPKCQkmONmgjA+Wo
	aaX3SiOMw0qsOvnUscEqfDQz6q0b7BAtExqSqOtfGrqdXbCpiDtQkR9zFsTHKJ5CvM2BaEQGRLMue
	u3dK5wdcTNtLgQCdjDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5Ea-0000000FkA6-49x2;
	Wed, 12 Aug 2026 09:26:53 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5ET-0000000Fk72-2dzy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:26:47 +0000
Received: by chaosmail.tech (Postfix) id 9D3AB1CBF47;
	Wed, 12 Aug 2026 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786526798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f9AVvI/rzO1xlw04zuQKTwjeDA+3NqKNZVc0uqJpvu8=;
	b=ZWIqQpVtS+Atl0Z/sP2B6O3bEQ4MDdjCKBnSy54gc7qKXk28Msr6airV21WeLNnb1YK9Nq
	AU8lD3kUziZhCahn4xPAu7Q8HxkZenQjs1HvbIiYhdw+vC7e7SeyOChsupHArvPQxXQQ6u
	dgGAW0z5VSOGMHMyZFyV5xTzyQjqe7w=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v3 0/2] dmaengine: apple-admac: Add support for M3
 generation
Date: Wed, 12 Aug 2026 11:26:32 +0200
Message-Id: <20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQQ6CMBAF0KuQrq0pQynRlfcwLqZlkBoR09YGQ
 7i7LW40uvzJn/dnZp6cJc/2xcwcRevteEuh2hTM9Hg7E7dtygwEKNFAzYMS1cSxHdBwLLVoEIz
 RtWTp4u6os9OqHU/v7B/6QiZkIjd668PonutcLHPvvxxLLrhC2ZIRUHUCDumb0Q9or9tApmeZj
 /AJ7L4BSABJDVorg7KmH2BZlhc1I2lU/gAAAA==
X-Change-ID: 20260725-t603x-admac-a1b07a2ccb54
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Joshua Peisach <jpeisach@ubuntu.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786526797; l=1162;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=3u3QE19SmPpO/aRh7YhNURUWTLddt0t0CS44cHgFr3U=;
 b=SPFkVGKOfj9cw1v+THOzC4ymtBZRhIOgNqarJLO50npnORVat3BScv3f+tPc2d0rpKu3Etv+M
 6DpKVn4jhJuCsm3YtGfKtA7b5DJhELa7pB0Hr6Z8G/vwnTaAPjqo3K0
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_022646_098348_53CD5485 
X-CRM114-Status: UNSURE (   9.38  )
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

The ADMACs present in M3 series devices (t8122 and t603x SoCs) need
additional register writes in order to function correctly. Add a new
compatible chain for those, and change the driver to do the write.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Use t8013 hw data as default
- Link to v2: https://patch.msgid.link/20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech

Changes in v2:
- Typo fix
- Link to v1: https://patch.msgid.link/20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech

---
Sasha Finkelstein (2):
      dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      dmaengine: apple-admac: Add M3 generation ADMACs

 Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
 drivers/dma/apple-admac.c                              | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-admac-a1b07a2ccb54

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


