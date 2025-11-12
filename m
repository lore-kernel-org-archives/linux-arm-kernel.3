Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AE0CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2kO2vWIGsxvP5jIy7quJYT/UfLR+pgK9lzFV+ZhbJnU=; b=YQeNs/RYakdMCBTl9Sdmj2j6Ka
	4PAus2AqbkficCJ61QHXuCi2JGf/sWMTfnzg65jUmIlW2aVjmSO4Mxx7tVQu47ejVHnB6Twd+LVdh
	FXDU2EsLnFKX+uGJ3thTNETXBGcEsTWXIPjKY06Ffyz6+sMDY0tAol8qa7R6y+4XVg0k2Xie2PHtT
	aaf4bvgcACb4vD5truUX6kbrXq33gVc6cAM0BcgCuB3fvrB9/fMhKi/KZXmDIrAFBINeI1kF7noi3
	D6ApKigbMceeOQQO2tn2YeXpMkhTINbgWE3jdozkPT99dXxDYyepBzL1d+YY0GjUiesJkisND353M
	fc8drVUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8i4-00000008dxY-2t4n;
	Wed, 12 Nov 2025 11:08:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8i2-00000008dwi-3q6H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:08:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6F31515;
	Wed, 12 Nov 2025 03:08:10 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com.com (unknown [10.164.18.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD24E3F66E;
	Wed, 12 Nov 2025 03:08:12 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	akpm@linux-foundation.org
Cc: ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	npiggin@gmail.com,
	willy@infradead.org,
	david@kernel.org,
	ziy@nvidia.com,
	Dev Jain <dev.jain@arm.com>
Subject: [RFC PATCH 0/2] Enable vmalloc block mappings by default on arm64
Date: Wed, 12 Nov 2025 16:38:05 +0530
Message-Id: <20251112110807.69958-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030818_993911_F27D01CA 
X-CRM114-Status: GOOD (  10.15  )
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

In the quest for reducing TLB pressure via block mappings, enable huge
vmalloc by default on arm64 for BBML2-noabort systems which support kernel
live mapping split.

This series is an RFC, because I cannot get a performance improvement for
the usual benchmarks which we have. Currently, vmalloc follows an opt-in
approach for block mappings - the users calling vmalloc_huge() are the ones
which expect the most advantage from block mappings. Most users of
vmalloc(), kvmalloc() and kvzalloc() map a single page. After applying this
series, it is expected that a considerable number of users will produce
cont mappings, and probably none will produce PMD mappings.

I am asking for help from the community in testing - I believe that one of
the testing methods is xfstests: a lot of code uses the APIs mentioned
above. I am hoping that someone can jump in and run at least xfstests, and
probably some other tests which can take advantage of the reduced TLB
pressure from vmalloc cont mappings.

Dev Jain (2):
  mm/vmalloc: Do not align size to huge size
  arm64/mm: Enable vmalloc-huge by default

 arch/arm64/include/asm/vmalloc.h |  6 +++++
 arch/arm64/mm/pageattr.c         |  4 +--
 include/linux/vmalloc.h          |  7 +++++
 mm/vmalloc.c                     | 44 +++++++++++++++++++++++++-------
 4 files changed, 49 insertions(+), 12 deletions(-)

-- 
2.30.2


