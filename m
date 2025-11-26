Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6236D10383
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 07:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZUg5fVHFpPZfZY8emFjTkl6G7DcDvmUswjva06YmBGA=; b=eTnwkYHaSXS7Md/8Zorv9Rpv8c
	GZ6nQ4GQfAlOnZODe8sZoIoLL6Wdjr3rYv/StVTRdYGcmsgaWPfibmn1ovfV8KHyQFIUS8Htr/SWq
	orkkRoHr1eKhrQcu+tjWsPdCcY8zFxPrptJES4OVcXmTkA5YNgXzZQJq6eY720H7pYvNLR3IjBE9e
	mmXU7UnWgI73xmDfeCIsGD6d500p+t9UYwC+nT0bklgB1jw995qzUCJBDPLpHfBlQ4OD3CxkGIX2N
	eYzV/g+MTs+nnsdKmS3n1JFMc3ByzOF6fhPryVzx5rifLJtYPntFiCE9FiMt/B1r5NknvlyH3yRuV
	7bAuWuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9dO-0000000ETac-1e5d;
	Wed, 26 Nov 2025 07:08:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO9dL-0000000ETa1-42l2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 07:08:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC73A6013A;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75833C116D0;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764140890;
	bh=spiyEbUBvIz19li1JaK2FG0GzYu6mQaFowCPaGoXONA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=vCdbpRX3vSSHxRcuekatitl4cxaFhRyXvr14Wk2HS/qKEj0lq65c4feoCVAaOh4mX
	 pfPxfpBVW6zWB1Ech5nVWK0OD4TTBRZQfzQmJBthcSjIYifpkojgHtFsCoAQQNFuM1
	 Anh7hMW+0qG2yF5L2/4MqESZ8VLKTHdcieynIn5r0w8JHh9qPjPdi2n9U0A95Ry0Wu
	 xrH0DmsZw2oyS2gy3yR6yej/ykqF7gc8vBE3JDWMKZKS6hMNXC1t3BndBGt/oF1aq9
	 i3MBmahEkjLtVmNwhM4CIH7YqYtuY5QOdaOd/bv52UBwYNDR4Yae0IZpoesJjYY4Kt
	 60Itw4yIxKSzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65316D10383;
	Wed, 26 Nov 2025 07:08:10 +0000 (UTC)
From: Jean-Michel Hautbois via B4 Relay <devnull+jeanmichel.hautbois.yoseli.org@kernel.org>
Subject: [PATCH v4 0/2] m68k: coldfire: Add RNG support for MCF54418
Date: Wed, 26 Nov 2025 08:08:08 +0100
Message-Id: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFinJmkC/43NwQ6CMAyA4VchO1uzlSLgyfcwHoYdsEQZ2ZBAC
 O/u4KQX4/Fv2q+LCMZbE8Q5WYQ3ow3WdTHokIh7q7vGgOXYAiVmSskcKoJnRqQm0MzguwbCq++
 dH0DWXBVMEpXUIt733tR22u3rLXZrw+D8vL8acZv+o44IEupS8anIihSr8jK7YB726HwjNnZMP
 yikX1S6UUR53GTNmH9R67q+AZChXjkOAQAA
X-Change-ID: 20251107-b4-m5441x-add-rng-support-0fdb8d40210a
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764140889; l=1901;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=spiyEbUBvIz19li1JaK2FG0GzYu6mQaFowCPaGoXONA=;
 b=KW1OEEH5eEn82WGsPE5ZXbQTMkHoI1HYZhvoS7o09XY0WJkpJ9ULWzrKgRcgEkFvCT+94hs9j
 vSPNjllFaowCsRDYquAgl7wx7FbXMkqEUoKtBdATzYqXrEjZg9RTll5
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-Endpoint-Received: by B4 Relay for
 jeanmichel.hautbois@yoseli.org/20240925 with auth_id=570
X-Original-From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
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
Reply-To: jeanmichel.hautbois@yoseli.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds support for the MCF54418 hardware random number generator
(RNGB).

The MCF54418 contains an RNGB hardware block compatible with the imx-rngc
driver. This series enables its use by:
- Adding platform device registration for the RNG hardware
- Enabling the clock at platform initialization
- Making the imx-rngc driver compatible with Coldfire's always-on clock
model using devm_clk_get_optional()

Testing on DLC Next board shows:
- Hardware RNG throughput: 26 MB/s
- FIPS 140-2 quality: 0.2% failure rate (rng-tools)
- Boot time improvement: CRNG initialization 7 seconds faster

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v4:
- Postpone const qualifiers for now
- Link to v3: https://lore.kernel.org/r/20251124-b4-m5441x-add-rng-support-v3-0-f447251dad27@yoseli.org

Changes in v3:
- Depend on COLDFIRE is enough
- Split the clock change in a dedicated commit
- Link to v2: https://lore.kernel.org/r/20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org

Changes in v2:
- Split const qualifier changes into a separate patch as suggested by
Frank Li
- Mark all resource arrays (including RNG) as const in device.c
- No functional changes to RNG implementation

---
Jean-Michel Hautbois (2):
      hwrng: imx-rngc: Use optional clock
      m68k: coldfire: Add RNG support for MCF54418

 arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
 arch/m68k/coldfire/m5441x.c       |  2 +-
 arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
 drivers/char/hw_random/Kconfig    |  3 ++-
 drivers/char/hw_random/imx-rngc.c |  9 ++++++++-
 5 files changed, 48 insertions(+), 3 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251107-b4-m5441x-add-rng-support-0fdb8d40210a

Best regards,
--  
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>



