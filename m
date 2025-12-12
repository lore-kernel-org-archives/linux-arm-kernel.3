Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F44D43369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 04:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n8na/ke9IE9q1bAVsI7+ErdZjhBbX1mnOYIQbX9UWUE=; b=oW3L2sL8px0WwfnQXt2p43jwmr
	HTIUOritfqSl54EJ+tV4WYy3v22sLqsRxXvbavXw5Yfq4XozAPTL3XZHKKC/KpYkRpX3TJp4sWYf6
	VQD+qaCPkpPDfxVuNdIjQY9+71gq2o+13Bv292qjSDtK2dbjLU58ZqKFjB6ZDiYebDENtr1P8NTzZ
	i9Twj3fX9Gpj42QVt9TN4brZFfK6xCXHYk15RnnfaGdPz+lJt6LESEdVEO6uXwcaiQsMoGvmVfQb6
	CXQ9Gj66PrOirhsp2f86GjECFAi3gMX8N/Anfl/cmN+/IzyNrq2jUSqHFqibhw4wrQAhi3BzZouao
	Yf2OlWUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTukV-0000000049d-15fS;
	Fri, 12 Dec 2025 04:27:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTukS-0000000049D-0qGw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 04:27:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 516231063;
	Thu, 11 Dec 2025 20:27:08 -0800 (PST)
Received: from MacBook-Pro.blr.arm.com (MacBook-Pro.blr.arm.com [10.164.18.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD4853F762;
	Thu, 11 Dec 2025 20:27:09 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	akpm@linux-foundation.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	cem@kernel.org
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
Subject: [RESEND RFC PATCH 0/2] Enable vmalloc huge mappings by default on arm64
Date: Fri, 12 Dec 2025 09:56:59 +0530
Message-Id: <20251212042701.71993-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_202720_279073_2D838656 
X-CRM114-Status: UNSURE (   9.33  )
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

---
Patchset applies on Linus' master (d358e5254674).

Dev Jain (2):
  mm/vmalloc: Do not align size to huge size
  arm64/mm: Enable huge-vmalloc by default

 arch/arm64/include/asm/vmalloc.h |  6 +++++
 arch/arm64/mm/pageattr.c         |  4 +--
 include/linux/vmalloc.h          |  7 ++++++
 mm/vmalloc.c                     | 43 +++++++++++++++++++++++++-------
 4 files changed, 48 insertions(+), 12 deletions(-)

-- 
2.30.2


