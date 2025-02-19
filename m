Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD790C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 14:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZKvcBQEXtzYLwxzULGxcQBN8+Iap7g5XTvz9tz2xXL4=; b=jABtRx9Jz4w4aL77fD2ponLKin
	1uCGGLhel2T03hjzJyOHEgvp+RmiNcxJS6pceOkSegCZ6m1HQamSmWim+XOFKMn2w/beeoTcYj4r4
	800Rn0sgcaPpQ21+iUB0yDoClV3+9U2fcEz+VveBoQFRctOJDc404MJRfiLQgqZgiD7GVqEYyA3hV
	TPowngz3vmRvgfS8d/ohNlN7ifjjv65uRLFRDc6peTqh7qHYdG/zkWrqqy1SP86i4tyq15WXLqmT1
	RE1uxeGXkVoz//ijeGvqd46HzqPo7GuIJPdEXcZQiVNDzf+vqXNPpCOPUoghpG+4AT15EcfZiAKhj
	7Q5+HpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklLQ-0000000DMMi-3dwy;
	Wed, 19 Feb 2025 14:46:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklJw-0000000DLt5-14jx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:45:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B28513D5;
	Wed, 19 Feb 2025 06:45:19 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15FE53F59E;
	Wed, 19 Feb 2025 06:44:57 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	broonie@kernel.org,
	mark.rutland@arm.com,
	james.morse@arm.com,
	yangyicong@hisilicon.com,
	robin.murphy@arm.com,
	anshuman.khandual@arm.com,
	maz@kernel.org,
	liaochang1@huawei.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	baohua@kernel.org,
	ioworker0@gmail.com,
	oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v1 0/3] Initial BBML2 support for contpte_convert()
Date: Wed, 19 Feb 2025 14:38:36 +0000
Message-ID: <20250219143837.44277-3-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_064504_354554_9C673480 
X-CRM114-Status: GOOD (  12.97  )
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

This patch series adds adding initial support for eliding
break-before-make requirements on systems that support BBML2 and
additionally guarantee to never raise a conflict abort.

This support reorders and optionally elides a TLB invalidation in
contpte_convert(). The elision of said invalidation leads to a 12%
improvement when executing a microbenchmark designed to force the
pathological path where contpte_convert() gets called. This
represents an 80% reduction in the cost of calling contpte_convert().

However, even without the elision, the reodering represents a
performance improvement due to reducing thread contention, as there is
a smaller time window for racing threads to see an invalid pagetable
entry (especially if they already have a cached entry in their TLB
that they are working off of).

This series is based on v6.14-rc3 (0ad2507d5d93).

Patch 1 implements an allow-list of cpus that support BBML2, but with
the additional constraint of never causing TLB conflict aborts. We
settled on this constraint because we will use the feature for kernel
mappings in the future, for which we cannot handle conflict aborts
safely.

Yang Shi has a series at [1] that aims to use BBML2 to enable splitting
the linear map at runtime. This series partially overlaps with it to add
the cpu feature. We beleive this series is fully compatible with Yang's
requirements and could go first, given there is still a lot of discussion
around the best way to manage the mechanics of splitting/collapsing the
linear map.

[1]:
  https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1-yang@os.amperecomputing.com/

Mikołaj Lenczewski (3):
  arm64: Add BBM Level 2 cpu feature
  arm64/mm: Delay tlbi in contpte_convert() under BBML2
  arm64/mm: Elide tlbi in contpte_convert() under BBML2

 arch/arm64/Kconfig                  |  9 ++++++++
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 32 +++++++++++++++++++++++++++++
 arch/arm64/mm/contpte.c             |  3 ++-
 arch/arm64/tools/cpucaps            |  1 +
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.45.3


