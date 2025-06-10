Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CA2C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yDUbD5wlY05H1YMsfp4tAmG5m3CentP5fffLJr58A7w=; b=2yz+IAg/BF0E1VeOZF2PejfAGo
	SLO1z6yR8eTM0xWjym0XCAT6L6ysdug/ZfSy3bmxT7jv2wJllO5rTEyMg8m37hymC6YWdNeIUDLWY
	XLaIYrfKz4cBYyzDu99ZGuUKwuX/I3iwbUJqMvrgd100KwV4p3fCdUg+8JEErIMYDREFUl5BAk/hO
	OIgxCdga6OGGwXfdtdFXhJz/UbnBUfbaCtnp8Vxmbc6LZuCyssQdHL+MPBddBmv/g7hD+GTJuhJNL
	KbvB+jOgkrOH0KhZEKoxY4AXeoEmXJmrZbeD0HjBjddIikBE4p3Mqc9u8LLypbUNDV76iK1igAq85
	SPkzd8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyNr-00000006pH2-1qGI;
	Tue, 10 Jun 2025 12:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxna-00000006jPG-2A7A
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yDUbD5wlY05H1YMsfp4tAmG5m3CentP5fffLJr58A7w=; b=PIcXVHhUJggEpxEDgFXfO477ro
	9gnde/QG8J/tzkhosj5+p5avcw/yJbwZJsLjWuBRGHabCb8wFLFHAdEe/hDJ3nK9yRbBm8+sO+O6j
	vHNgtTg3osgVBP2jJGoU16Ax0EZofoYYpaMAMZjP/PNi7r2+WlhE6mYqtUD9/kr8rTZdP/kWCGIeZ
	6TVwWcBpQNZos8NdTBTcwnIM3h4cr+gXK7lOrx/r6a7phGh79ifuhhNFbdzGprLdrZDBJU4k+8viu
	aGi0PWvPFEKU9JxBSKUSIf+woOs2lwgN9h6W9Klar1O7jCoZ3YsuE+7kxbn5KE/iAQs+BoZAB4/x4
	bSg6fgWw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxnY-00000001nbP-1ReG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3625043470;
	Tue, 10 Jun 2025 12:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523A2C4CEEF;
	Tue, 10 Jun 2025 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749557382;
	bh=upqHnq3wuWArdhJfVH9Zj84u4ZeuZmsrlHOjrFsHPa0=;
	h=From:To:Cc:Subject:Date:From;
	b=ZmlcOPOxmaomHX2ncZCUdccODW6ub8S+E9UPcjklNJ0n9+TI+KGlLnk4yqPScmEAG
	 qgHk9mRV5Suxeet5DheiWtMM/ThTNbFNIyCHponvW0QdtvYYk8NGD2LDO1Hvui+LD1
	 GV2PLDi6FYOMVnVQQDvqTwq2O9FQrR8prgDXJf2+pt48BPdRHUtzxTlWOfMw55vIkf
	 w7KxsOglOCrzfQrrO9dzCYRCNbI97rTCt7TySxEJteYqKXdPqpnsCYzSNZe3K36oiL
	 tuzBSomWwiP/qItDesY20guNVT1WJlgf1nEmzP9cGq/O/lHtjzwceNXfnVt9zLmZXO
	 GlGuWp17EnNbQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst
Date: Tue, 10 Jun 2025 14:09:35 +0200
Message-ID: <20250610120935.852034-1-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_130948_597938_0FBEF25D 
X-CRM114-Status: GOOD (  10.65  )
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

Fix trivial ICC_SRE_EL2 register spelling typo in booting.rst.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>
---
 Documentation/arch/arm64/booting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..ee9b790c0d72 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -234,7 +234,7 @@ Before jumping into the kernel, the following conditions must be met:
 
   - If the kernel is entered at EL1:
 
-      - ICC.SRE_EL2.Enable (bit 3) must be initialised to 0b1
+      - ICC_SRE_EL2.Enable (bit 3) must be initialised to 0b1
       - ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b1.
 
   - The DT or ACPI tables must describe a GICv3 interrupt controller.
-- 
2.48.0


