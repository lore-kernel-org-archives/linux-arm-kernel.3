Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E507CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g3O6VY/Nevx6g2ejwZoojhEqbniWpYQSomIXS5UwdQk=; b=JMBZjiEqjvrVu14J/v6usUxI+w
	DHg5zdsNKht99xkEXEaSsemXvIakiVpmJMR0tBIWjxTmxqo2IUl61Db4gTnKl+kYEuWiiyA9yeg1G
	ybnsgsD47PkGORGF9V3nPaSM9+9IWp/OEKQnS8jVdEOjkhZHLl7/fCESec2wBXWrZAFRooeyI0eAm
	ecgwkUEMQ58L/lXHTyy9QjgNcMnEe/1iT4CJ6F6g56YVb7VrT/N8D4NtH/Z7mI6PvkVRiI+cGTVrb
	v9kz/UNHoUSRiJJm+WCw+BKzqemiFxIUc4r3Ss2PDFM1BOmRt9DtIPNaSPkWYNzivYYKKdOjvyXnN
	2LWetXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Lu9-00000004WtJ-2Tuv;
	Thu, 16 Oct 2025 11:12:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Lu7-00000004Wrg-12JS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 11:12:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C14631688;
	Thu, 16 Oct 2025 04:12:09 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D5E33F6A8;
	Thu, 16 Oct 2025 04:12:16 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5.4-6.17 0/2] arm64: errata: Apply workarounds for Neoverse-V3AE
Date: Thu, 16 Oct 2025 12:12:04 +0100
Message-ID: <20251016111208.3983300-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_041219_319889_2F7C46FE 
X-CRM114-Status: UNSURE (   9.34  )
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

This series is a backport intended for all supported stable kernels (5.4-6.17)
of the recent errata workarounds for Neoverse-V3AE, which were originally posted
at:

  https://lore.kernel.org/all/20250919145832.4035534-1-ryan.roberts@arm.com/

... and were originally merged upstream in v6.18-rc1.

I've tested that these patches apply to 5.4-6.12 without issue, but there is a
trivial conflict to resolve in silicon-errata.rst for it to apply to 6.16 and
6.17. Are you happy to deal with that or should I send a separate series?

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


