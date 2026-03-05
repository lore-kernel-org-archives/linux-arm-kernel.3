Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA613F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Ukn0Yvb5TGeLdfNUGvVVDbAWuNnjNEYtRv3RO9qwKA=; b=EoMlWEImqd5KQ432gSq3TiqntM
	xYQ6sd3hM5mhKs0fgoPww4L15ESidZhCtDrTfqVhFujf0ndyFfYKM/EUUJusJV4zkAX3XsdpqCA4d
	3QSaWdEWmWBuDuzET8LI6yVSnRG4T98CxNy9FZXUoI1zO39DdJe9t3jsrq07yp3t/uyCK702rBkWC
	R2gqbXRzuiaGckpoQaTzPByH2RGh8qe5ZLUyHtsM/AbzYNgmQVz8YZVvFJD9VxJpYW2F9wV+NpupP
	31g5y6wcZ0nbgxg+2MFURLGrF2qQbkuGaxswWJlqHtcni8lhkg5Y4S0WIkQRIc6Mv+0Ysxp3m4kaB
	nDw4PYHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Wy-00000001UJO-3k98;
	Thu, 05 Mar 2026 10:02:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Ww-00000001UID-0uVF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4A726C40410;
	Thu,  5 Mar 2026 10:02:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B54E55FDEB;
	Thu,  5 Mar 2026 10:02:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EB371103683FF;
	Thu,  5 Mar 2026 11:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772704922; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=+Ukn0Yvb5TGeLdfNUGvVVDbAWuNnjNEYtRv3RO9qwKA=;
	b=cz0BjviQaYJ+d9g1FXpkfniB/qlG1QqEPcplCAMwp99Xc5Fq/PhiayYmCKHXQCFbEK+jPJ
	D6CCSX9KL5rMUWp8CFl+OEf8zfAiD+arSephpwuc1SjxTz0BbEEaxro2Z5Xx9DjdLOJrcp
	6bedvuR15cOlrEhQPj6wE+oBwaJaMp3Jjgi/LGS+I3CIdVbQUvj4s1YDnUfkOfMIpnKV3H
	Zr6/MQ69nMGRFbTE9yGcuF3YvzOg5PgmyOJBh+KgbjLSju04lDEEfWcoFdxXG2bdK0XkQZ
	ziVdVsat+ivCfu8SsunRps9LAkTFZBQ1M3s9UvAvgF6aAhtZywyA+FjgP5n65A==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 0/6] mtd: rawnand: sunxi: Fixes user data length for H6
Date: Thu,  5 Mar 2026 11:01:31 +0100
Message-ID: <20260305100137.2558423-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_020206_396322_81612C0A 
X-CRM114-Status: GOOD (  11.16  )
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

This series introduces the correct usage of user data length for
H6/H616.
If the older SoCs must use a fixed value of 4 user data bytes for each
ECC step, the H6 can have a different value for each step.

In the first round, the behavior was kept as the one used by A10 when in
fact the images in the wild with the vendor kernel are using a different
layout.

The first patches are fixes/code cleaning and the last one enables using
a variable user data length for H6/H616

Changes from v1:
- gather Reviewed-by/Acked-by
- rework patch 1 subject (more a code clarification than a fix)
- fix typo in patch 2
- remove patch 4 Fixes since it's not really a fix

Richard Genoud (6):
  mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
  mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
  mtd: rawnand: sunxi: do not count BBM bytes twice
  mtd: rawnand: sunxi: replace hard coded value by a define - take2
  mtd: rawnand: sunxi: make the code mode self-explanatory
  mtd: rawnand: sunxi: introduce variable user data length

 drivers/mtd/nand/raw/sunxi_nand.c | 299 +++++++++++++++++++++++-------
 1 file changed, 227 insertions(+), 72 deletions(-)


base-commit: 11439c4635edd669ae435eec308f4ab8a0804808

