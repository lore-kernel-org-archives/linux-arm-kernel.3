Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F03CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jm7AkfNmNQYVF5JRZ3bPI6/IVaf7DuNuingK7BiK/hs=; b=fRyaVR3MigNWABAb08HVXkesKr
	HBbdGizdsd4y/ox0gNqNkPZ5dvdDt5AXJnAXnFjS+GuWntX9lpxFo4GX9Qb0f4atQaC1hm17amIjf
	MVvKNG93lyd8xjgTBhB0qg3abDbMyn521783D6H8u4iF/1XbrdfTkySqlGvYaeBuWzbJ355XR1cQz
	1SyPMIhPKeE8Tca3GViOLrK7YeO9l2FB92yx1TauAmjIlsjEXL+ufNynxdA2NU5R0TQHmBw9GHkbk
	mN1P72fCJvINhWT8MjiTu8vaVtNa+NWyY6NzlPbAeWoacrxDpD9lrXWRK3Ljq++2oajUKOPqi226A
	nPw7hJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmBM-0000000Ca1O-1nwy;
	Mon, 20 Oct 2025 09:28:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmBK-0000000Ca05-36h1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 09:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Jm7AkfNmNQYVF5JRZ3bPI6/IVaf7DuNuingK7BiK/hs=; b=okoIuB53fYO8BqqVpng/DA20Jr
	QlX0h7VyYCh2jc8dK3LxjUmPE3OWJBbokiKInFijcxRxzoea1N+QnUd8gNw9U91bRLZAUTEp8Vx8L
	PTFrkY528iJmBimWeAOeFU+gF+pt1iWcInb3pa0PUC8pyFLirDDsMNF4ZpbzcVzs+xFNmBHwYyxgt
	+mccRMK1BOKYdBfn2Osjy09mrka89PUsN8uo6ddl1kyqm63Iydf1rKW3W/9ZpSwK5Q2WnL0xtpKnt
	evkuovrhIAV2bVSDOl9vXowNjCROnLuRRpZHO0YvqJv6GKNeF5Bm34uoOxCGA5g32Nb3V3lu+BrW0
	l+dVbjyg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmBG-00000009fh4-2o8l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 09:27:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EA601063;
	Mon, 20 Oct 2025 02:27:44 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 640493F66E;
	Mon, 20 Oct 2025 02:27:51 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.16-6.17 0/2] arm64: errata: Apply workarounds for Neoverse-V3AE
Date: Mon, 20 Oct 2025 10:27:37 +0100
Message-ID: <20251020092741.592431-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_102755_299017_7D91F100 
X-CRM114-Status: UNSURE (   7.61  )
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

This series is a backport that applies to stable kernels 6.16 and 6.17, of the
recent errata workarounds for Neoverse-V3AE, which were originally posted at:

  https://lore.kernel.org/all/20250919145832.4035534-1-ryan.roberts@arm.com/

... and were originally merged upstream in v6.18-rc1.

Thanks,
Ryan

Mark Rutland (2):
  arm64: cputype: Add Neoverse-V3AE definitions
  arm64: errata: Apply workarounds for Neoverse-V3AE

 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 arch/arm64/Kconfig                          | 1 +
 arch/arm64/include/asm/cputype.h            | 2 ++
 arch/arm64/kernel/cpu_errata.c              | 1 +
 4 files changed, 6 insertions(+)

--
2.43.0


