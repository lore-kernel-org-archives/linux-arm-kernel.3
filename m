Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675C9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 10:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hu2+yVKnmbYY76ubDKe4TZIEaFUT33RqyEjKMDK9jok=; b=bUutOElQO4hxpSM3pD9UvMlxhC
	gYIB1BjW54a/Tim4NZnjTJpVVqTt9iDlp8ly1J7bwLDil1W/Vi2gHuEh+WKd88M/Qv5ngPa+ylMZw
	DrgIkbhFV0VZrdB5mGgVHtagboiuTjUVQMBiSR+xkJ9PLWshGUbwky7C3inUc5WC8Pv2rrU2HW+tw
	xlKGQ+XiaKeQ+5d300KBr3pLIpjjeikizJhU9GXHNVd9m+FQMSjLuGSE3hCN+yeuvfb66IBIXSVAt
	i2jtvHMW+j2azlEEp2+BAIayMBe+NvcrT7SmD7cTZNDCjaCpIeEVE24EjOwTLyAkCdnyOCHcxROoG
	YpNhAZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNr5F-00000001Ytf-3Lwy;
	Sat, 07 Jun 2025 10:47:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNqyo-00000001YOa-2204
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 10:40:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 806F74A66A;
	Sat,  7 Jun 2025 10:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5708FC4CEED;
	Sat,  7 Jun 2025 10:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749292848;
	bh=ef31vX4ZI8kPgs7vAl7HCXkoyt819zKF3g5fNgJGYMk=;
	h=From:To:Cc:Subject:Date:From;
	b=oICauUShArLFizqhXtMXaVpnVTAONNxzqZfXVDxQQ3i3zqU9tG4zUcUYc7p6dyHX/
	 LLP0oiGFpEI84v8JGJjSqqMtBPGzJxPuaHxsVSySO5t360ZRztO530ytrNf/FYuox+
	 pDU1GLLc/z3hRljV6r9d98wFMSwlhcjcOadGm7Qz1YRsY4DVA9gF7hMmRPwE1Thc83
	 oa8zQBD6EsGObWGRRo7fbWRpX6FLS3P/MyR0BUuMVkt1a85rleB0USNiXAdqoGzrdj
	 5XLNvjotIgBOIZXfHXqUOpRzROwEqL+3FJzgXwGT6JDUIljxH7FHWrFGExNjN0K3UL
	 kcX1FJ08VqZMA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uNqyk-004o03-As;
	Sat, 07 Jun 2025 11:40:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: [PATCH 0/2] arm64: Drop more workarounds after binutils bump
Date: Sat,  7 Jun 2025 11:40:39 +0100
Message-Id: <20250607104041.1406771-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, ardb@kernel.org, arnd@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_034050_592105_D02913CF 
X-CRM114-Status: UNSURE (   9.21  )
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

Now that binutils 2.30 is our base-line, drop a couple of annoying
workarounds that we have been carrying for some time (I have some
history with the .inst one).

We *could* also start dropping some of the SVE macros now that gas is
known to support it, but I'm not convinced we want to go there yet.

Marc Zyngier (2):
  arm64: Remove .inst workarounds after binutils bump
  arm64: Restore UL() use in alternative macros after binutils bump

 arch/arm64/Kconfig                          |  3 --
 arch/arm64/Makefile                         |  4 ---
 arch/arm64/include/asm/alternative-macros.h | 39 ++++++++-------------
 arch/arm64/include/asm/sysreg.h             | 21 -----------
 tools/arch/arm64/include/asm/sysreg.h       | 21 -----------
 5 files changed, 14 insertions(+), 74 deletions(-)

-- 
2.39.2


