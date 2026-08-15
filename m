Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E111C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QirL5FKN/2t0jHFpC8PFoZ9D0UWW7b92xqp9wz3wT6w=; b=cIjuRSBsDlzkP9
	HQKYcde3ir+xSPs6EXwD6Q2huIOYtpRRaSQpCsdLc185tblgLCqtBB9jgeXkgAnc/bw702xdA4AMx
	MjGcjf4FdhvLvmkInraAg+QdqPRU+41Y2zavtilTSh39MrqK0XXw5mxZ3RfgULM1Ir9y+HPOxtdgk
	xg208WqLD4cjgDDSV5ke3Bi8TP3DzXK77AYkeV/tfRTvhfJDyGnw+j63MErEB1fEpjE1y9LRPQTyf
	BQpXhnYn5nkTPZFisZav4SmBEAuY+OVq5QkQHkDvGu93nKxykClH9WJhnPZoKOc1In66bSkqc79J4
	8on+KrTXxwtF+I7khE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBpu-00000003kkY-401H;
	Sat, 15 Aug 2026 10:41:58 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBpr-00000003kjT-1310
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 10:41:57 +0000
Received: by chaosmail.tech (Postfix) id E76F91C975B;
	Sat, 15 Aug 2026 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786790509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QirL5FKN/2t0jHFpC8PFoZ9D0UWW7b92xqp9wz3wT6w=;
	b=r40Fx8CybGZdbtQlvJRS6vqtk2xzQheD4l/LpCrZyn48Axr/ykokbCq6XEWwqvXa2TCSfa
	WRc4uSrmENuRLgmoc5K1Gag/XsOxKMpqxwVb73JD3/cAnwzXzoSizHBnzjZ0fZJqfqcMWY
	am1qIpPkLGarTKdUSNVYe83UzlWnFEs=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v4 0/2] dmaengine: apple-admac: Add support for M3
 generation
Date: Sat, 15 Aug 2026 12:41:37 +0200
Message-Id: <20260815-t603x-admac-v4-0-1149e342dcb0@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23Oyw6CMBAF0F8hXVvTTstDV/6HcdHHIDUChiLBE
 P7dFhdKZHmTO+fORDx2Dj05JhPpcHDetU0IcpcQU6nmitTZkAkwyFgOKe0zJkaqbK0MVVyzXIE
 xOpUkXDw6LN24aOfLJ/unvqHpIxEblfN9272WuYHH3rY8cMpopqRFw0CUDE7hm9bXyt33PZqKR
 H6AX+CwBiAAKDVonRklU9wExBcoOKwBEQDLSy7ysmAC+R8wz/MbdjY47j8BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786790508; l=1308;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=gUpTW8ChxtDggBwLocbC7PiTUaahIfyT04dtaB20q38=;
 b=tozvc+d4nHbhxUlhjey4KOadNqu1jnonm2ocdhCV+Q1b6haoJDrrIhCERmWAOKiupWpcgCkAa
 frU50DS+KzrCJr+XP6KJwk609S+xThfBfJwqXB2BR2xs8eSMutsdO4m
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_034155_786771_F8608E9B 
X-CRM114-Status: UNSURE (   9.02  )
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
Changes in v4:
- Use the entire hw data struct
- Link to v3: https://patch.msgid.link/20260812-t603x-admac-v3-0-d1f137f803e1@chaosmail.tech

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
 drivers/dma/apple-admac.c                              | 24 ++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-admac-a1b07a2ccb54

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


