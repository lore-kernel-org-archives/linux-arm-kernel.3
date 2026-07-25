Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5042CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 12:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gFJh3NjTJMaox2+ypOqsAApzXWebSJmYXYJ3y7rrITw=; b=prUqHBR8ejI9LC
	nLFCuX/eQppy+1ixk0OUZ2fasmaJkSKRXTCmLzUF5Yxlbk2RoEO+tm45iq15/IUjSYAJq54gJ5Jy0
	0dL3K/1o7uxxINGLkFc3eZtlpJ+rXO8RzkfnVyz3dG2BipPJfBPPcNnOXCZBNanILWuiQKG9QIlP9
	ESZKOxjd2PoqmEKO7OSlDR7tqbjGT8BUkOdJktP9MWWrH5w3EfDKMcniIGMFnUoYWHNSgjvv+dd7k
	sNtV8rddVytxPGxg+QG0orrM1VZYAhaRPMPBu1PbiEggydpQF0sx8TaUxaSRwriccKbh7eGdPpM6u
	kS0ywWwmaDr3w5pIpWew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbSN-00000000L0b-2sir;
	Sat, 25 Jul 2026 12:26:19 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnbSK-00000000KzF-0KTk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 12:26:18 +0000
Received: by chaosmail.tech (Postfix) id 099351C867B;
	Sat, 25 Jul 2026 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784982369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gFJh3NjTJMaox2+ypOqsAApzXWebSJmYXYJ3y7rrITw=;
	b=VEefaWNYJY/QC6elDXmRWcvVzTm4TRhGFTWVouKhcCWOPH86wTCsaXt/aLQ6lbPBZeuuev
	yWNUqCz8YVdt9fsxepscrT1hKru10b0YownvOyF8ifIJgLdtZ2tnV0obrHTixL1jTv3W7g
	N04YSffuBKUNQ/quPKVqaeraKreJg1Q=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/2] dmaengine: apple-admac: Add support for M3 generation
Date: Sat, 25 Jul 2026 14:25:55 +0200
Message-Id: <20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQqAMAxA0atI1hZqncCriIs0Ro3gQKsiiHe36
 vIt/r/AsxP2UEUXOD7EyzIHJHEENODcs5I2GIw2hS5NrrZCp6fCdkJSmFhdoiGyeQahWB13cn6
 3uvntdzsybe8C7vsBoyEfJW8AAAA=
X-Change-ID: 20260725-t603x-admac-a1b07a2ccb54
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784982368; l=898;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=7EeCEmZ4bq+PYKDjHXdTwNvCZhBJvKw3SGWs3Ys7fr0=;
 b=kiTk1Ew7+hmnffjQ7TcQmgvpzug51KIryezg96SJgX0fZGsg8ltjcTanfqfXFYIhzKIyOWgT+
 C7yMFlXqw5ODIBbzwg1EiMuiNR0b1dI3G8I/C2tmS+8fLY9YlujpIii
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_052616_582654_1DBEF190 
X-CRM114-Status: UNSURE (   8.36  )
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
Sasha Finkelstein (2):
      dt-bindings: dma: apple,admac: Add M3 generation ADMACs
      dmaengine: apple-admac: Add M3 generation ADMACs

 Documentation/devicetree/bindings/dma/apple,admac.yaml | 10 ++++++++--
 drivers/dma/apple-admac.c                              | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 4 deletions(-)
---
base-commit: 0ce37745d4bfbc493f718169c3974898ffec8ee7
change-id: 20260725-t603x-admac-a1b07a2ccb54

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


