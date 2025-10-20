Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0DBCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jujjS3lwB6N81z0ck49yRqklSI1LQL/A/rK9Hu4HyeY=; b=qh9lfnD9a2QRHjVrJnz58DKsk2
	gCok/137R+NU2PAmQNfpXGnmEBiH8cI1QM0r+8eopsRnfRpjuAoeUBbufqGkaMTHEBmQjR5vLqfek
	u8wxapQaSVHSaoAh+Yhlmm83EMhnYVNktJ/vQIwBYIVwyzlVyZNNJ6fK9AF18dU5uYwW4H+oOYIFC
	7oRH8utpgGAiOQCzeLBolomIBvn3LrSxhKKInaj0lToVX2Sr+e51n3+8UzzejdKvyJv4c4aH4Y9EZ
	PxGClkDDU5o3bA0aqvE+vUl4JIEzCeBwi03qXUdN1M9IHw2auf6Kf1+xhQTgDCtR9V7q9XDp8Lcvi
	30wVwAxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAm9g-0000000CZGE-290S;
	Mon, 20 Oct 2025 09:26:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAm9Y-0000000CZDd-0EVO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:26:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DE341063;
	Mon, 20 Oct 2025 02:25:58 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 126FE3F66E;
	Mon, 20 Oct 2025 02:26:04 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.4-5.10 0/2] arm64: errata: Apply workarounds for Neoverse-V3AE
Date: Mon, 20 Oct 2025 10:25:51 +0100
Message-ID: <20251020092555.591819-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_022608_157835_EDE598DD 
X-CRM114-Status: UNSURE (   7.64  )
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

Hi All,

This series is a backport that applies to stable kernels 5.4 and 5.10, of the
recent errata workarounds for Neoverse-V3AE, which were originally posted at:

  https://lore.kernel.org/all/20250919145832.4035534-1-ryan.roberts@arm.com/

... and were originally merged upstream in v6.18-rc1.

Thanks,
Ryan

Mark Rutland (2):
  arm64: cputype: Add Neoverse-V3AE definitions
  arm64: errata: Apply workarounds for Neoverse-V3AE

 Documentation/arm64/silicon-errata.rst | 2 ++
 arch/arm64/Kconfig                     | 1 +
 arch/arm64/include/asm/cputype.h       | 2 ++
 arch/arm64/kernel/cpu_errata.c         | 1 +
 4 files changed, 6 insertions(+)

--
2.43.0


