Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BD1CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=My1yIkC1RJo1zKMLmycZq4qTbNn4VrI/ADVVk2bdGW0=; b=H0Zv0ADYkQHVoXgRUkdcrH6oZd
	rzARulP7Dfz7veNVxRrdqVNAEgfzErS0+qGuNB11GxLYL7In3iNcLZeI10rujSsmAJFYzfNqpwM6F
	ZZMrd7Iee43Cee8dctOC5W55CTVnPVFawHvCiGgCUMpZ0/D+vmLVZfknPzxsu9QfpogZqOr5Lq2ya
	duPeUm334MPtk7CacIJlYg/BFK6TBY9nuCntpiD3QSV1GEiEoUwfk/ZnKLmE+NS8pKg3PTP/2w/e+
	803tNX6lVMx+rdjnNGRKAUl74ZBZpxXRWWzlSZG1tiOOteNgw1Rfk5SDFBSs8oCDAHe/zVL419kUB
	VdMxq7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZQ-00000003EWR-1vZI;
	Fri, 19 Sep 2025 14:58:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcZP-00000003EVp-09x5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 14:58:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCE9C169C;
	Fri, 19 Sep 2025 07:58:33 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00DA3F673;
	Fri, 19 Sep 2025 07:58:40 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] Workarounds and optimizations for Neoverse-V3AE
Date: Fri, 19 Sep 2025 15:58:27 +0100
Message-ID: <20250919145832.4035534-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_075843_112010_531D92F1 
X-CRM114-Status: GOOD (  11.73  )
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

I know it's late in the cycle, but I thought I'd try my luck at sneaking this
in.

Neoverse-V3AE has a different MIDR value to Neoverse-V3, but qualifies for the
same workarounds and optimizations ("SSBS not fully self-synchronizing" and
BBML2_NOABORT) so this just adds Neoverse-V3AE wherever Neoverse-V3 appears.
Details in the commits.

The last patch adds Neoverse-3VAE to the BBML2_NOABORT allow list. That will
conflict with the patch you have already queued to add AmpereOne, and with the
patch you said you would do to remove X4. But this is a one-liner so trivial to
resolve.

Applies on v6.17-rc5.

Thanks,
Ryan


Mark Rutland (2):
  arm64: cputype: Add Neoverse-V3AE definitions
  arm64: errata: Apply workarounds for Neoverse-V3AE

Ryan Roberts (1):
  arm64: cpufeature: add Neoverse-V3AE to BBML2 allow list

 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 arch/arm64/Kconfig                          | 1 +
 arch/arm64/include/asm/cputype.h            | 2 ++
 arch/arm64/kernel/cpu_errata.c              | 1 +
 arch/arm64/kernel/cpufeature.c              | 1 +
 5 files changed, 7 insertions(+)

--
2.43.0


