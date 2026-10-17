Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9B8CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 07:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uos9h2nhlqX1b6lCVgLo7T0zLRlH7JLBNl1Frq1snAA=; b=zb+FWtEREuvVhX
	YWsokgQZdxLyYKhzmCZZjwsDglj93zi9OIevhaul/yLARQTwDyeYTFwPwQtjbx+M/yXaTnF7qt21Z
	5xH7EEduro1Z7l8lCOXoRmcLFSoSDKORSa7DKglqEZhmI6NXUnvPKNUoi8Bzz+Px727dp8BrXgZhD
	V3xfM9galcZbpeQk5ByLtYwFNg/P3WJ37eVK6Z7SVxkLyxt3Q1RNj6q9q81irkDqLDzSWeNpi68cm
	MSatbU0GPyft9D5glh/gQbFrrD0ktQMjyNg2PvY1KLMiiDW8Z7tGPcPdCsMeAuVjYPwGj76JsWuYj
	TTIx8j0ptvCXJUzfSsfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8W-00000004Y2b-3Lsr;
	Sat, 17 Oct 2026 07:47:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHz8V-00000004Y2V-19BC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 07:47:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BA2B2439C2;
	Sat, 17 Oct 2026 07:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D7C1F000C4;
	Sat, 17 Oct 2026 07:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792223242;
	bh=uos9h2nhlqX1b6lCVgLo7T0zLRlH7JLBNl1Frq1snAA=;
	h=From:Subject:Date:To:Cc;
	b=nnMyPnwM6pAaiHx/6A2mSFvL4y4dtXOyO0LNc7J72oSBMRyD6flwD9yEpoYA7Ax7v
	 mfwChS+/G8q8qUeaevIVOVNN1VC1uW8A5nk1RSOfgJDOfbbZTwgAnlGQWPbYZmMNEJ
	 eY4hqRTrcoFgY+03htsFXsRk8wsUNJbRi6dtorEanFITwGLblerPFkUBMkDAUugf3H
	 ELHwB1WKx9CAaM99niYxxqfSi4vTTDJLHM2GEoaVyPZl5+XScR4q6GRCAafzn+HX5j
	 cuyBP+TT+SBs4TaxoJFNRIsXHeMr7WGK5By8zRk9QXa/VtPG00O24z4ASfFD6OoLUv
	 Z/8zt3Wpr8N6Q==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/3] ARM: bcm: Enable SMP on the Genexis XG6846B
Date: Sat, 17 Oct 2026 09:47:17 +0200
Message-Id: <20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrh3TqYUaV97DsKgwlIlayNQ0G
 MLdrSZuXf5v8b1VJRKmpE7VqoQyJ55iCbOrVDf6GAi4L62MNg1qRAgUaeEES2iOtoH0mCE7OIB
 0CFfr9KDJaOtqVYRZaODlq1/a0iOn5ySv71nGz/pzzV83I2jwNfbWDz1Z7843kkj3/SRBtdu2v
 QG4TR47xwAAAA==
X-Change-ID: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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

When booted through CFE and mainline U-Boot, the XG6846B has no PSCI
provider. CFE powers up CPU1 and leaves it waiting in a holding pen.

Preserve the holding pen, add a board-specific SMP method using CFE's
GPIO mailbox and a wakeup IPI, and disable the inherited PSCI setup.
Tested on the XG6846B with both CPUs coming online.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v2:
- Read the CFE mailbox address from CPU1's cpu-release-addr property,
  as suggested by William Zhang.
- Link to v1: https://patch.msgid.link/20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org

---
Linus Walleij (3):
      ARM: dts: broadcom: Preserve the XG6846B CFE holding pen
      ARM: bcm: Add CFE SMP support for the Genexis XG6846B
      ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B

 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 16 +++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 65 ++++++++++++++++++++++
 3 files changed, 81 insertions(+), 2 deletions(-)
---
base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>


