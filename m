Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1150ACA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sI7dtcdEk0O8YcJDq2/iAdKOjcjxedvITJZ0bHrbDOg=; b=jX2+8J/XaFsCxXxMF4Nu1I64Ks
	K+mS9MeDsVwoscoxDfEzk/09p21JtqirDZ/pBmwjQ3SanglsGIw2SwQWaQKi/ZWoDgru/ugQYpcg7
	8pelsnblBisfexdopo86yJeviM4EzPfKadmEPGogzHbgk6ZHvHmV/YTUoNhLnq59Qcg5KrMv0wA/v
	DzdqpLZqphbU6Yj5slOepW/XWynVfYi97Ugs9fQk4fx6/d+7joI1JgPhdENhB5brWY4rh3yNzoUTs
	DcR8fXHjVb+dRcYyHsm9W5DUQ6Aus47QKzLKWwmvYEhD2/N/bb4BMUx5J8ibQQtmjsERqzdkFzKYO
	sIelF0GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZzk-00000003xme-3bga;
	Tue, 29 Sep 2026 15:43:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZzh-00000003xl8-1faE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:43:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 591221516;
	Tue, 29 Sep 2026 08:43:42 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.78.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B45F3F85F;
	Tue, 29 Sep 2026 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790696625; bh=UZI2uJ0GRKNIwaHhWA+c+1oR+tYQ0JrhA39dRJLy9+Y=;
	h=From:To:Cc:Subject:Date:From;
	b=WgC+CS/i2RyQuA6gDnGFWFZ6FvO1nBPhW5iC3Av2J3IB0cR02EBq5F7Tx2LJg8CU5
	 i2XuG2r3aDMr3tFemxKiz8TJZd/SHPzMNW7fhERB2q35hubBrBngDme045IMqKJ5Tj
	 4dO+Jfaf7nu7H/EaQ/wks73mZ/J0/4cp15zytUJw=
From: Beata Michalska <beata.michalska@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Vladimir.Murzin@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	suzuki.poulose@arm.com,
	James.Morse@arm.com,
	xuewen.yan94@gmail.com,
	seanwang1@lenovo.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: errata: Share broken AMU constant-counter handling
Date: Tue, 29 Sep 2026 17:42:12 +0200
Message-ID: <20260929154325.3416271-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_084349_470102_E7B3BAB5 
X-CRM114-Status: UNSURE (   6.90  )
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

This series factors out the existing Cortex-A510 erratum 2457168 AMU constant
counter workaround into a generic broken AMU constant-counter capability,
then wires Cortex-A725 erratum 3821522 into the same handling.

---
v3:
- splitted the commit and droped changes for cpucap_is_possible
---

Beata Michalska (2):
  arm64: errata: Factor out broken AMU const counter cap
  arm64: errata: Add Cortex-A725 erratum 3821522 workaround

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
 arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/kernel/topology.c                | 16 ++++++-----
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 66 insertions(+), 15 deletions(-)

-- 
2.43.0


