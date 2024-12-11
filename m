Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7105E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 06:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9yhG7NQ5PakzlfGn6tuPfeGOn0BZNLHFgd3Qt2b+icA=; b=bwBBCbPv/USB28z/XBV/u1YTek
	ZFBIPvj6MWdOHi/SRUXR4n6ihYFuGu09X6qOWkhl2spaRZ4Cv9m1u3BU9I17IhjO+tUb3CTaxSJT4
	mwvpp1QIpmnI2L/W2BlfN1JnkT+0vQiUsNdzL2Eeg2yNDnTAL1c+evVyDl2XSfqoafVc+6QmxZAvy
	930ajTXQOaW8qhURnsUl+5aV2gPyxHO6faSvSYABhzS8rbJRoawnLH199EemXOMzMDYU5f7hu0H3Q
	OemVKbtV/GUxxSL+5jqyKkPYSiqx2Y9E4c/29Adfgvi7leRnxuA+wAAvLIkWMgp7CojPQnEO4Z4X6
	cie4+Ozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGdK-0000000DzME-1LUZ;
	Wed, 11 Dec 2024 06:55:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGcE-0000000Dz5r-3g8T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 06:54:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86D111063;
	Tue, 10 Dec 2024 22:55:01 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D341F3F720;
	Tue, 10 Dec 2024 22:54:30 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: arm64: Document MDCR_EL3 boot requirements
Date: Wed, 11 Dec 2024 12:24:23 +0530
Message-Id: <20241211065425.1106683-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_225434_952169_74935218 
X-CRM114-Status: UNSURE (   6.46  )
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

This series adds missing MDCR_EL3 boot requirements for debug and pmu
registers that are currently being accessed in the kernel. Please refer
the following link for some earlier discussions on this.

https://lore.kernel.org/all/ZxfOeqyb3RvsdYbU@J2N7QTR9R3/

This series applies on v6.13-rc1

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  docs: arm64: Document EL3 requirements for cpu debug architecture
  docs: arm64: Document EL3 requirements for FEAT_PMUv3

 Documentation/arch/arm64/booting.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.30.2


