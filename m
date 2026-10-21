Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BF5606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cEh5xqTD;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c1mmn+KZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ooClIQJea+34VK5wiBtJlCaB6JuJ+2mJGcxE8LJ7b9g=; b=cEh5xqTDLYqvra
	zcZ5ZgWnn14C6rPPrmbPnRPVsEV08R6Z5NdAlImu/UvnTmSqBmCMyziSeUbMZL2NPKfeOs8JQjBo5
	WCOgvY4ewkMaW7qS5lhO7Uf2x0TUp1rcRrPa13MyHiV4W6mqy3LnwVRmXyjLw0pCSU0lTACwuD3Qr
	5RGTKDu8M513BLrMXMMeh5fKigXpbeaWdQjc4lkW/upkbXrsWcYblapLc5W9UBLPkkqZtTbW4appv
	0b/gyOz5SYhpcbuMC0hafebtURxwDD1ilADuogxEET5FyCMpFciEdOEe6/9h//Sk3m0p4alnQZ22G
	5mVXIcnY79aMWzoPlI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXx7-0000000CD0P-2FcX;
	Wed, 21 Oct 2026 15:10:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXx6-0000000CCzy-2tvi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 15:10:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB27D43C49;
	Wed, 21 Oct 2026 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF4D1F000C1;
	Wed, 21 Oct 2026 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595402;
	bh=ooClIQJea+34VK5wiBtJlCaB6JuJ+2mJGcxE8LJ7b9g=;
	h=From:Subject:Date:To:Cc;
	b=c1mmn+KZaKLgYOnXQqI0JmUvUVMH7MO+7WWZauNJe2G5RJvpLBDQRVa11tcrbcxjY
	 hKnkRbjc37UNOeMOh6oK3l7eds1teyzcoabGpdiZRkO9CK+c2j+I6wX53ciSBhMob0
	 8cl99D6mmCnI5I8vXuqcJnPa3BTv6nYExc949C4HzUBu0MDbAEH0MMCqEbS6FZWr8d
	 KAc7MG9GdBIVtodCS/UmR+ZYfT/I4O/IQyz4apVpESRAx9eFAgBthqGPzeaDMwY+rk
	 AHN5T2DKqAUGMrLkykeQnyMhW3epOSKPllVGFFtAkSxX+zD/lGpmCnk8AhE/pvsSDX
	 kVUNaNULAbe3A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/3] ARM: bcm: Enable CFE SMP on BCMBCA
Date: Wed, 21 Oct 2026 17:09:51 +0200
Message-Id: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NsQ7CIBSF4VdpmL0GKAXj5HsYB2gvlKi0AUNqm
 r67tImJLh3/M3xnJgmjx0TO1UwiZp/8EErUh4q0vQ4OwXelCadcMsoYOAw4+QSTkychIT1HyAp
 qiC0DIxS1FDkVqiFFGCNaP2369Va69+k1xPd2ltm6fl2+62YGFHTDOqFth0Kryx1jwMdxiI6sc
 Oa/mNrHeMGMlUaYWgkj8Q9bluUDZ6+AzhQBAAA=
X-Change-ID: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When booted through CFE and mainline U-Boot, the XG6846B has no PSCI
provider. CFE powers up CPU1 and leaves it waiting in a holding pen.

Add a BCMBCA CFE SMP method selected by enable-method = "brcm,bca-smp".
It uses a GPIO mailbox and a wakeup IPI, with PSCI retaining priority.
On the XG6846B, preserve the holding pen and disable the board's inherited
PSCI setup.
Tested on the XG6846B with both CPUs coming online.

These patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Use BCMBCA naming for the CFE SMP implementation.
- Add the brcm,bca-smp binding and select CFE SMP through the CPU
  enable-method, retaining PSCI priority.
- Squash the holding-pen reservation fix into the CFE bring-up DTS patch.
- Boot tested successfully on the XG6846B.
- Link to v2: https://patch.msgid.link/20261017-genexis-xg6846-smp-v7-3-rc1-v2-0-bf6b4b374b6e@kernel.org

Changes in v2:
- Read the CFE mailbox address from CPU1's cpu-release-addr property,
  as suggested by William Zhang.
- Link to v1: https://patch.msgid.link/20261012-genexis-xg6846-smp-v7-3-rc1-v1-0-a51d4afde4a7@kernel.org

---
Linus Walleij (3):
      dt-bindings: arm: cpus: Add brcm,bca-smp enable method
      ARM: bcm: Add CFE SMP support for BCMBCA
      ARM: dts: broadcom: Use CFE CPU bring-up on the XG6846B

 Documentation/devicetree/bindings/arm/cpus.yaml    | 36 ++++++++++++++
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 16 ++++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 56 ++++++++++++++++++++++
 4 files changed, 108 insertions(+), 2 deletions(-)
---
base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>


