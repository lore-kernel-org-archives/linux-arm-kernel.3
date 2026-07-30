Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAEDC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aSKcDr5M1CNrR+um5e88k0c2k5NJ5zx9q4tm7nAqnNE=; b=DvDbh+dK0cuGmLSYI5Zua/q+EI
	+FrkFDF23PqufNQ5PbbvyQ30IfnWC9zQeflLMaet/T6MQWlovNhWM8pm/3x1WOLooeiRS5QNUhw4O
	hkaX+8ElJ/obQKm3ZjwjGnqZwzBygILn2sVaCXG/uKa6CkR/yXP7+1m5CCoNJ5/f8hS/+JNPm7pQv
	/9zKg65JY3a+BLSssbwhl+XyR/ddo6ceIEDC8K9hH+JRVSyRRpynbOks0pCa+iTboLiLMsocC9ZP2
	Xq+2i0Pzt/UVsGKYD82UVvVGDbSp2BLSk7vCktbmYQdnBL61UJCc1zauOjXtaZxOKpqNFM+vEGHL2
	HVOLyzSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQnu-0000000Aazl-0jm8;
	Thu, 30 Jul 2026 13:28:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQns-0000000AazT-2iBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:28:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E09CA600B1;
	Thu, 30 Jul 2026 13:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 493BD1F000E9;
	Thu, 30 Jul 2026 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785418083;
	bh=aSKcDr5M1CNrR+um5e88k0c2k5NJ5zx9q4tm7nAqnNE=;
	h=From:To:Cc:Subject:Date;
	b=Y2S+td6JqhMttboUs7mECY7+fcHhIkyq5Emf5pZyFV8wfxclUx6nd36syF/SFyBOO
	 lFINrjDXwwyX9HG0FR+/PxBDal82NQA8MVQhW9z8NfuZXCPeFQgrHDO20i2aacUZIZ
	 oWE8D/k6jNPsEfw076EMV4fopNwOh3AMZOxHOOodvqozuAMDJO2IVUCSN5lTNQYiyn
	 7D3Nd+ipnIQ4aRJ1voo+kTDbbwNCOie0FRqbvPUAdklOR88ExR3yzv/OCjiYpPpNE4
	 EdPG0+Ez2i7Ymu2ShNkrHr5agbu/tAvkYStYqdPit2kp88QsK/sot2YTdVU+OQZnF/
	 zH1clIMp0Xmaw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2] arm64: cpucaps: Remove stale comment about keeping capabilities sorted
Date: Thu, 30 Jul 2026 14:27:57 +0100
Message-ID: <20260730132758.26039-1-will@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

There is no functional requirement to keep the entries in arm64's
tools/cpucaps file sorted alphabetically and, in fact, they have fallen
out of order over time. Given that only the arm64 tree touches this file
and the perceived benefit of sorting was to help with conflicts, just
remove the stale comment and accept that we're collectively not very
good at the alphabet.

In the limited cases where a specific ordering is important, we enforce
it through build-time assertions (e.g. in can_use_gic_priorities()).

Cc: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Reported-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---

v1: https://lore.kernel.org/r/20260723130233.3123-1-will@kernel.org

 arch/arm64/tools/cpucaps | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd4..3fcac789b0a4 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-# Internal CPU capabilities constants, keep this list sorted
+# Internal CPU capabilities constants
 
 ALWAYS_BOOT
 ALWAYS_SYSTEM
-- 
2.55.0.508.g3f0d502094-goog


