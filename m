Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F1CA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C71mH9r2Zjiq+f9iy2hKkziUuHqZUZoIU/DMegtKaDk=; b=eMpg6S11eMbrLg
	C7IC51Y/F9l7G8+oGzVvE5P9FW0b3oU4exGYe74WR+0WHxr0GAMZAV/zAPWtZwfgrCmqjZsFyyGYF
	wSIRyoZIReGBv0t01sIDBu4gsD4LeV2EyIumOXM9eIWix+hrtBgaEq11Xe0gKmacTpdLRi0hhhUbd
	EDESsa7j/4PRIXmjSj2oN7GkuBLAcMwv2AU68PEFLzlV7iRjEIfcCOKWCbmZsFUKl8XozW8CqieDl
	44Q2fgpFY4eNfAyDziK4iqNEOXbrs22sha+SIqdbm8SllCCPrpLw/hesrnBdEc1okG6vZzAl/Ox2/
	phBQj4+ZGSaDCMXKGDDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB0R-00000009t5E-134g;
	Mon, 12 Oct 2026 08:03:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB0Q-00000009t50-0OES
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:03:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8AE5D43779;
	Mon, 12 Oct 2026 08:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4391F0089B;
	Mon, 12 Oct 2026 08:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791792213;
	bh=C71mH9r2Zjiq+f9iy2hKkziUuHqZUZoIU/DMegtKaDk=;
	h=From:Subject:Date:To:Cc;
	b=YasOW+GAf3lJcroYG5qLCUz8wNkrR/5ln2KR9HXZznqbcXBKyC+TTQy2x92hJtI8y
	 HvhrJwhfsSoHZNvYJw6G6g/MptX8JHkJdvw+Wb1gONGR8Y39XMN4MpUv4D/8ASCCgi
	 +hThpl5GpcL1jH2t6CCNUohDj3meDAZkG8HjfAl2bTRgrawW2PqYM2NoxY22CvpVqd
	 iSeW6hgRgR2VWzrPsWQhYkGBcgMeX4vkC1Uky/wAVofiGvZCKYSDP7GMS3oTwD8OGQ
	 npdCFzxWMDfgLSpy+zSg2/s7SY6FL6KLo8ujbmO6/kD4wELmp2EKvQptz+UU9NwTWj
	 sMTm/gffALksw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] ARM: bcm: Enable SMP on the Genexis XG6846B
Date: Mon, 12 Oct 2026 10:03:24 +0200
Message-Id: <20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBdIatcOf2V4UBe7HFalASmI/
 27Z8V3eCSZFxWDoTihyqOmWG/jRwfKdchLUTzM4coGJGZNkqWpYU3j5gPbb8YjYY1kYZx9pJXH
 k4xPasBdZtf7393hdN4Z45BttAAAA
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
Linus Walleij (3):
      ARM: dts: broadcom: Preserve the XG6846B CFE holding pen
      ARM: bcm: Add CFE SMP support for the Genexis XG6846B
      ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B

 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 15 +++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 53 ++++++++++++++++++++++
 3 files changed, 68 insertions(+), 2 deletions(-)
---
base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>


