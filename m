Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA0606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OXiE72f9;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dcXxFAfp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=1k/YOFzcHBp/hoasHW07eVZPh9bCyJ8vWurMur7edBQ=; b=OXiE72f9DCVzJWCrMgpx4ODU6A
	xfrAqbaMpUurcwhUcbiiYDbGNm9+zqRFJNlzlAFVSdx3ucV/vC75mc2PCbeBsagb3L5U56np9w/fe
	yShGyeimC9LjikWIQyCP+aaLYoanDBdp3/P14wAHo37lBiiStsYH5Q4AqmwN5xNQzwdMG5VjxHjjw
	lZvb47eBzKf4HPUQ9mHleFojmMv2Glf+hcCNGp3T1+fKPSn4PnBXetAZUsQDIRnGL8YkMmpYiCk8E
	UFuqtMtqoWQhVP42iMHMxaIpy7Q4fX9l3kQPJkzxJQl0xNAg6zFmapUv0hIvq75kyzfmGP5/gfY+/
	1amk6DDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKsRs-00000000piL-1tz9;
	Sun, 25 Oct 2026 07:15:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKsRr-00000000piE-0Xz9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:15:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C104600CB;
	Sun, 25 Oct 2026 07:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE331F01825;
	Sun, 25 Oct 2026 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912517;
	bh=1k/YOFzcHBp/hoasHW07eVZPh9bCyJ8vWurMur7edBQ=;
	h=From:Subject:Date:To:Cc;
	b=dcXxFAfpTp0csq2KMjImqdCCQ2mskRHPrHFEjnm5qSIqR8GvRQrxLMMHceIh1V0po
	 TnNkKvphl7cMQgEVfHoEs4s/6RdDnbc+b3def39JwKEbVceOZQtCUz9ih+dkw+LNlH
	 BN5hLMa3iNwUOWbk8mLRl7veO9XfyPhADjRvyylJhT0uQ19COmozdQ8wojYWsu0wH5
	 zanwNVljUu3UAQJpIPM0OrG/MZezI1ftdmjV86612LM2RBvGdFmmIdMHkEBaNFfrYd
	 dVUVJMw+8dVI8+PVLTiN9CWAs4iz7MabjlyrF/daPPEBcYt3jtZmqEEC2eXyWlsJZw
	 P5W5pwxYDL4zg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 0/3] ARM: bcm: Enable CFE SMP on BCMBCA
Date: Sun, 25 Oct 2026 08:15:11 +0100
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PQQrCMBCF4atI1o5k0jQjrryHuGjaSQ1qWxIJl
 dK7mwqCInT5z+J7zCQiB89RHDaTCJx89H2XQ283or5UXcvgm9xCSWVQIkLLHY8+wtiavTYQ7wM
 kggJCjWA1SSdZSU2lyMIQ2PnxrZ/OuS8+PvrwfI8lXK4fV626CUFCVWKjK9ewruh45dDxbdeHV
 ixwUt8YrWMqY9YZq21B2hr+w4ovTK1/nIqMUb0ndEhl2dgfbJ7nF+XYrsxhAQAA
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
Changes in v4:
- Require cpu-release-addr for brcm,bca-smp and provide a dummy release
  address for CPU0, which is already online.
- Link to v3: https://patch.msgid.link/20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org

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

 Documentation/devicetree/bindings/arm/cpus.yaml    | 39 +++++++++++++++
 .../boot/dts/broadcom/bcm6846-genexis-xg6846b.dts  | 18 ++++++-
 arch/arm/mach-bcm/Makefile                         |  2 +-
 arch/arm/mach-bcm/board_bcmbca.c                   | 56 ++++++++++++++++++++++
 4 files changed, 113 insertions(+), 2 deletions(-)
---
base-commit: 6356fd3dd29d8b5620507a0ce037c644e052b5dd
change-id: 20261011-genexis-xg6846-smp-v7-3-rc1-b470f0e20475

Best regards,
--  
Linus Walleij <linusw@kernel.org>


