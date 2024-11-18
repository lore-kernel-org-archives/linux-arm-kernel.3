Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C506D49231
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r9zSf8R/aKEyWVoCaKzcEWwNEqNOGxtrBPAWaE4ONn4=; b=MGo7F9YPZ1odOr
	qInBNszhRAJLiiXLqDQo4gXYOkGyk9OguAqCag1Bs0TR2Stqxdb4+apt2OEfxkubp9kG5paYvHPCD
	9NKZIiDQ89K8AYCSU/9QvGaDUzEHa5qJyS8mzAT8vPHv7X5qREJdFTOet8TvxMrj9nZiP/nGNMCMK
	XNS/zgV4QZ5Zz0Fy93WOtZ1oeEeRqysMeGofFGA1z7iJzaW9YKFCXZbq0dJrgAwqNwkV//ma/yqr6
	PqZmOncof8Y7EUZyC+sPKNxjdRH88uZetT8XAr7F/KaJ5wYSlNnv1NJfN+W3RDNg4JGhdYaOU/5Sd
	FFmUqsQhOF9DZ/zPfD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3L8-00000009s1a-1JWV;
	Mon, 18 Nov 2024 15:06:58 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3HS-00000009r9k-1DSi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1731942187;
	bh=boi2kWZcFXn1Cqh2sijpEZUtPJc0dsQupk5k+Ae9Hvs=;
	h=From:Subject:Date:To:Cc:From;
	b=Sn+IfcCQSWEi9s1P7hgaX0mbdaYAz1WER/gh71/raMMqJVezGhuKLFSqkF6yxHpxZ
	 jocNYW+XMw7i9f9pRX9copGWGWQlFDwwChewT/3d4eaM2WGJBO7HsKOUJlwSL3TZqe
	 J6jdWgZr1PkuNveXhdgxEQmn9Xx398y/lTEuVg4Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/3] sysfs: treewide: Remove spurious NULL in
 attribute_group definition
Date: Mon, 18 Nov 2024 16:02:46 +0100
Message-Id: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABZXO2cC/x3MTQqDMBBA4avIrDtg/GnEqxQpMR3tbBKZSaQi3
 t3Q5ceDd4KSMCmM1QlCOyvHUGAeFfivCyshf4qhqZvOGDOgHroo+hg0oUtJeM6J3qvEvOHCP1J
 8knXW+q7u2x7KZxP6h7J5Tdd1A6E+lOxzAAAA
X-Change-ID: 20241118-sysfs-const-attribute_group-fixes-6e7a77c40535
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731942187; l=971;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=boi2kWZcFXn1Cqh2sijpEZUtPJc0dsQupk5k+Ae9Hvs=;
 b=Emn70sUKptVLprUGzrGhQIhMws5iTVsZsT6sIXqBblOAwgbP25Li6EdkgS3fIWtyLtapuXhcq
 0WwmEndaw1OCfYMU0kpVxuhdlIu4v6vaoH/X4hetb5kLc7ZybFfpgeX
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_070310_489552_C6B41088 
X-CRM114-Status: UNSURE (   7.51  )
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

Generated with the following coccinelle script:

virtual patch

	@@
	identifier ag, pattrs;
	@@

	  struct attribute_group ag = {
	    .attrs = pattrs,
	-   NULL
	  };

This series is meant to be applied through the driver-core tree.

See also:
https://lore.kernel.org/lkml/71fe4030-d6a1-47da-b8a7-28b899187168@t-8ch.de/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (3):
      perf: arm-ni: Remove spurious NULL in attribute_group definition
      s390/con3215: Remove spurious NULL in attribute_group definition
      cpu: Remove spurious NULL in attribute_group definition

 drivers/perf/arm-ni.c       | 1 -
 drivers/s390/char/con3215.c | 1 -
 kernel/cpu.c                | 3 ---
 3 files changed, 5 deletions(-)
---
base-commit: 5943c0dc7912210be1ab2732e0b663c1082ab543
change-id: 20241118-sysfs-const-attribute_group-fixes-6e7a77c40535

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


