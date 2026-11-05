Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D99606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G2fphaeY;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=qKk3HxH0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3+Md6IS5qsGquLQY5PzCkVhG7iMrdpAy4cpRkavqmhk=; b=G2fphaeYyYwff2CupZ4BrDHK5f
	EyCCYRio1lNiNiOqQa938mP6tmVbcys/1LurU0h4XotodajSgOC01dW1IVM13WlTwWU/lb50Oldzy
	cSrXG1qjkieN836RItc/fxgE50Bew6aWK4Lli/+b6k/TwfGqMF9pzkb9kcYG7vobZQ6lFUoKVk/qc
	NkTswpOpdxci1+c7OHkTbHkvQI5Gn1PFvb/YOxzGpjkqnGQ9PZVPvUtVNVRmFGshqiV0p9LcK1JW8
	6UnfupxLawHwvGkdVPQELHIhB597cppVkDH43IOXI116Zgln8i9JKL72+HfhP0Lz45q99PYwXkPgs
	gEquQXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11X-00000009olQ-1EGy;
	Thu, 05 Nov 2026 17:13:15 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP11E-00000009oXd-0z1j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:13:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0FD4AC6915C;
	Thu,  5 Nov 2026 17:12:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 813085FF43;
	Thu,  5 Nov 2026 17:12:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B639D10329258;
	Thu,  5 Nov 2026 18:12:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793898769; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3+Md6IS5qsGquLQY5PzCkVhG7iMrdpAy4cpRkavqmhk=;
	b=qKk3HxH09x1pQmKLG+wolNzp5jIkLcU1OiTumONkT/QdWFKInuy9NY/5/zWzCr3y1Fn4i7
	cN5gtGgw5t6H3yPk08PmHKPF5hLz047oc2Lq9KKGDUzjP/nkNhaZAJ4D8k4go3AjYzNG0H
	B7v9kGvelImPEikBMrw1DmViLDs4I8mnUWzAkvUPBdEaQJxWdx2C3uixe6bZ8dy8SWFzt8
	tzG04ciK51dAx0N7q30KFyviB5m5QOEX2kXY9uLMgiegIBMN/PhSjPrWUOrFaLjhGqvbQR
	YeV0pDw5u+gLyFAdPfq/lU9UY9CRDgqaXUDWthl687/XzX1RO3nZvoat+dlu0Q==
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>,
	Stefan Agner <stefan@agner.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>
Subject: [PATCH 00/12] mtd: Remove #ifdef guards for PM related
Date: Thu,  5 Nov 2026 18:11:46 +0100
Message-ID: <20261105171158.399247-1-paul.cercueil@bootlin.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_091256_479875_B5DADF02 
X-CRM114-Status: GOOD (  10.06  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This patchset updates the MTD core / NAND core as well as several driver
to get rid of the #ifdef CONFIG_PM guards.

Instead, the code that depends on PM or runtime PM will be
garbage-collected by the compiler automatically if this config option is
not set.

The rationale behind this change is that in general conditionally
compiled code is a bad choice, as code behind a rarely-used config can
get broken without anybody noticing.

Cheers,
-Paul

Paul Cercueil (12):
  mtd: Remove #ifdef guards for PM related functions
  mtd: rawnand: vf610: Remove #ifdef guards for PM related functions
  mtd: spear_smi: Remove #ifdef guards for PM related functions
  mtd: physmap: Remove #ifdef guards for PM related functions
  mtd: maps: pxa2xx: Remove #ifdef guards for PM related functions
  mtd: nand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: fsmc: Remove #ifdef guards for PM related functions
  mtd: rawnand: hisi504: Remove #ifdef guards for PM related functions
  mtd: rawnand: mtk: Remove #ifdef guards for PM related functions
  mtd: rawnand: omap_elm: Remove #ifdef guards for PM related functions
  mtd: rawnand: r852: Remove #ifdef guards for PM related functions
  mtd: rawnand: txx9ndfmc: Remove #ifdef guards for PM related functions

 drivers/mtd/devices/spear_smi.c     |  6 ++----
 drivers/mtd/maps/physmap-core.c     |  6 +-----
 drivers/mtd/maps/pxa2xx-flash.c     |  6 +-----
 drivers/mtd/mtdcore.c               | 10 ++--------
 drivers/mtd/nand/ecc-mtk.c          |  8 ++------
 drivers/mtd/nand/raw/fsmc_nand.c    |  6 ++----
 drivers/mtd/nand/raw/hisi504_nand.c |  7 +++----
 drivers/mtd/nand/raw/mtk_nand.c     |  8 ++------
 drivers/mtd/nand/raw/omap_elm.c     |  6 ++----
 drivers/mtd/nand/raw/r852.c         |  6 ++----
 drivers/mtd/nand/raw/txx9ndfmc.c    |  6 +-----
 drivers/mtd/nand/raw/vf610_nfc.c    |  6 ++----
 12 files changed, 22 insertions(+), 59 deletions(-)

Cc: Stefan Agner <stefan@agner.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: Maxim Levitsky <maximlevitsky@gmail.com>

-- 
2.47.3


