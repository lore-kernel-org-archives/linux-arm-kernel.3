Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C96CA0EE3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vVTgLcT5IoFf0DgDdDv2GD6JnpUqRszQ9RbVmywYabk=; b=n3LfCDkcuVo2te
	hlysuO+HyySFOC1Xiid5fY36f+2om0m98JnkMNQbUZH3MgW57LG2vs57bc3Lqn8Q8Qa2CbHzOwk7g
	xKN2Oj6v9EbCy8pUQ110gOJp4XDwrtTlYxk1cagH+t9H8hoMAaVxoBFAdpTZA3PiDulTRNNLp6pHx
	qbq8V5aLJsRu7w3wWXi1kyFnPzBxXqMqhK0lucRYGpnBgdVs72h74AZaDKAP32bdMz/jpcWY6OShY
	eZphA4jtCWnqboOvSMSwiegG3fe1peq7aKMTjYbI0GwKUeDl3balMJT0grxVp2STUGnrNsL1gkGRn
	u/oDWkRclBhQllzbrVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTZt-0000000GI9s-3j0o;
	Thu, 14 Aug 2025 08:44:53 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTW1-0000000GHRq-1MnV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 08:40:55 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3B59F14001B4;
	Thu, 14 Aug 2025 04:40:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 14 Aug 2025 04:40:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1755160850; x=1755247250; bh=vV
	TgLcT5IoFf0DgDdDv2GD6JnpUqRszQ9RbVmywYabk=; b=jamsIrHaBsps8Yw1bx
	raYGHW7I75SD7qsxWM4SSRyiWhqhvweu8rxP1BIrqmdP0DBMF2Gy2vXdZ4PowCzi
	GLajaXAtUhaJ2WgAm6oAyKEBm+XJ4ggbajTrI3/d9WknT8uO/bkfEYrc7AtvBKRU
	ho9K97dkK+fWLtUc0vu8f3h8ZoHNn4+4/tCnugLPczqk+kE4zixkmD7/wJneV7XZ
	mexPxQasxSQJOxU9pKucATy67ge0b4hGhO6A698MJeUPK4vPC2dbfCHSALpO/1C9
	1MnbToxyABzjFnShEzEUzgVnjLGuzCRoF5SQX4oyOvBhu9s2/8fTLmAc8MEPp6n7
	1Kdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1755160850; x=1755247250; bh=vVTgLcT5IoFf0DgDdDv2GD6JnpUq
	RszQ9RbVmywYabk=; b=MUwzqnspf82PC87Yp5R0aovZj7msskrjaIeASNmGF1sn
	9i/QcLeEi1LgzadCFD33tDXToj8ZebKdELT5/gCo1Meq+6kqad2RFjGip2s6IA+g
	nTiC6csLAgYTINq0cmRAiQTFsrykRsuraBvt8L5LInHDzc4ZQr9+wZ1R9Q12qP/D
	opIO5yfOj2WqMJP7wRMelUCTWK/+Ez73x0HtQG8a7hsUszG/4K96ULGiYa+N6EIy
	S7T9wXgeIcaQHUfjRk+zk87qNOQXfheoRqsiJsL92oO2Ks4npsctfokv+3u1rGSg
	7BNE94ZD/+gSJrRWX5kSWcDnx+BYuQ/RN0MMrCnFbA==
X-ME-Sender: <xms:EKGdaPkhlJQh62dE6OodIez8UJeXp33Dgjic4ZTrgfTRXQu3S4L4uA>
    <xme:EKGdaIxOFBaW2URHtdczN8iBIlorqL7DNLFTDr4Ltg0YZBJX74toCLWpLRCiKhas2
    Px0P4VKC6Dtj_JbU4Y>
X-ME-Received: <xmr:EKGdaCzZtNulyg04eaIGQ5ueAhdGYymJ4QMmNwTfJiQ8gVxeEJ50h2Qf1Uwth5UevBdL5AEeCD7HsU_6eytegT63K8baltdbmkd9tQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhephfdtue
    duleejffduvdehkeeutdefhfdtvdeiieegheffleefvedvhfeggeegffefnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehiohhmmhhusehlihhsth
    hsrdhlihhnuhigrdguvghvpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshht
    pdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtoh
    epjhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhs
    rdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhm
    phgrrdguvghvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:EKGdaIUKmPxTuOIURS0yoVF5PSqYJ1R_zOe_Sng_hLqB5W3Jn-hcOg>
    <xmx:EKGdaJREdjzSYfD5xoDZ1C9UMNk8ADbLHWsuqIKbsepoP54gWCsCrA>
    <xmx:EKGdaAQOVgpBMUP839qnZVrV-u9QNJMCYcf4viXjthJUODE4HaQLvw>
    <xmx:EKGdaBeDsbgdTpG6P3KZFW1wDVj_eDzL8kdLqx8-OOy-qYbD1q2xyw>
    <xmx:EqGdaC2EAjQZsslXUinEzZDPPAa4TbUIM0wnFZqCEG-a1sqJskyq2lOJ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Aug 2025 04:40:48 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] iommu: apple-dart: Four level page table support
Date: Thu, 14 Aug 2025 10:40:23 +0200
Message-Id: <20250814-apple-dart-4levels-v1-0-db2214a78c08@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPegnWgC/x3MSwqAMAxF0a1IxgasH6xuRRwEfWqgaGlFBHHvF
 odncO9DEUERqc8eCrg06rEnmDyjaZN9BeucTGVRNoU1hsV7B54lnFw7XHCR7dIJrEymqltKoQ9
 Y9P6nw/i+H3C0rOJkAAAA
X-Change-ID: 20250811-apple-dart-4levels-8f9ae8ac1347
To: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1010; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=ZV9g15yATwUQ4KRLeEZL4tJS6hLbRv80h5AbIBbK0Wc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoy5C/m8XQ59ip4p/j33DvepbJ3ftzPmHdcRW39g++EuB
 q2bDDemdZSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZjIZBVGhnMvtWu2vn/ruinq
 /fqnrtNXCFe2X/qy3GtV1/8C1nWZC9sYGfpMuJWFKzQ3FMRxmbJGJgWbqHNemSe2VM3gddA0V8N
 XHAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_014053_873383_0D1CAE3A 
X-CRM114-Status: UNSURE (   5.40  )
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

The DART instances found in T602x based SoCs (Apple's M2 Pro/Max/Ultra)
indicate an IAS of 42 bit. This results in alloc_io_pgtable_ops()
failing as io-pgtable-dart supports at most 36-bit IAS.
The t8110 DART design supports 4-level page tables. Implement support
for this in io-pgtable-dart and mark DART stream with more than 36-bit
IAS as 4-level page tables.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Hector Martin (3):
      iommu: apple-dart: Make the hw register fields u32s
      iommu: io-pgtable: Add 4-level page table support
      iommu: apple-dart: Add 4-level page table support

 drivers/iommu/apple-dart.c      |  47 ++++++++-----
 drivers/iommu/io-pgtable-dart.c | 143 ++++++++++++++++++++++++----------------
 include/linux/io-pgtable.h      |   1 +
 3 files changed, 118 insertions(+), 73 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-apple-dart-4levels-8f9ae8ac1347

Best regards,
-- 
Janne Grunau <j@jannau.net>


