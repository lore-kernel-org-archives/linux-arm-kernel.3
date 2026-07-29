Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E38C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TJlUQBhAC6aUWtVfrdOpWDSFGGPM9jrCv1lIW27G7s8=; b=vASZV9m6LteAtO
	Ie/tx6T2rmY6q5LXkJxSesuttfLrljZyajP1Hy/PnoRg4OkdfwQLOA/CRDbMp7qpC5S+cALbYn3mN
	bzSp8BA4U8Lz/1C36bpVSYmXmjBshCicu1yUMyTrMiu376PAPIUGSsEK+CADeDSZ1hZKMRPERT0LY
	1wutzF5V2A2YaizOLnItvARmU0lYrsT7KHAnPXLvWZGXT0neFzWghnpHXGplh8VIVD/AO58+OTGk9
	2EceQEJeNLldLiGWyoJA7gRL0N8jkce4n54WNHzYGhKqJvVZQbnDkMy5z1MBQEjOdfIOI1iFUbb8O
	zwaxS9JUIYPeR5HahF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2kQ-00000007mCB-3i3d;
	Wed, 29 Jul 2026 11:46:54 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2kN-00000007mA9-0Ykc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:46:53 +0000
Received: by chaosmail.tech (Postfix) id 2066E1C87FF;
	Wed, 29 Jul 2026 11:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785325604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TJlUQBhAC6aUWtVfrdOpWDSFGGPM9jrCv1lIW27G7s8=;
	b=wtrklbkInNY2O2TVvp2pOaOLP9KUojp0be8GPyab+8DDL+3xTZEvqSMZCKDnam1BqyCTBW
	ROlAZG6gk5j5AyknbHiufxAXuTie+2boU9s0khsXPnc7gRlsVEot87Kn3si1kC8zA31fqr
	htNJjAYlWpYE1we48BeJbs+j/SZ7GW0=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH v2 0/2] dmaengine: apple-admac: Add support for M3
 generation
Date: Wed, 29 Jul 2026 13:46:33 +0200
Message-Id: <20260729-t603x-admac-v2-0-e4b2bb6ca45e@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OSw6CQBBEr0J67Zim+SWuvIdh0QyNtBEwMyPBE
 O7ugFuXL6l6VSt4cSoeLskKTmb1Oo0R6JSA7Xm8i9E2MhBSiRUVJpSYLYbbga3htMGKydqmyCE
 2Xk46XQ7brf6xfzcPsWFX7IlefZjc55ib0z333zynBk3JeSsWKeuQrvHN5AfW5zmI7aHetu0LI
 34JkL0AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785325604; l=1027;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=txob3eI5nMEhztwuDOLSLuf2Y6RtnMZ3xqeQjq/S33U=;
 b=R1Zy7hMrACQDUbNj7a7ttlnRCZvyupAqNMGtL61vQLDG/OKvHimLs8au9952OgHa657pgGrqW
 y5tt9YYkhqVAYRSufJRMQ7vXlFbiEUppT8cmJ1m0EprMYGTCxQVGs8O
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_044651_651667_53F0F9F8 
X-CRM114-Status: UNSURE (   9.06  )
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
Changes in v2:
- Typo fix
- Link to v1: https://patch.msgid.link/20260725-t603x-admac-v1-0-6a4dec023f02@chaosmail.tech

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


