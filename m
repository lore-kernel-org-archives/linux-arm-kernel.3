Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC68FCC056
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=on2bJXzG7VhknnVi3RS1//dvdy30GtppvlJb/YQMk+0=; b=zs7NDeeDlfrQ9Ylj9FkCl1pGvG
	5528W+0GnLwDXfIQkygQanR4EiZEJOvNKdX9YM/duuK9smkCmDsf8OJ77cmifcKgxraPdQdYqZ8Xi
	/HKLW72FQlZjh5Z8Ac0a8bstR97f6ZYjNa5NzFBtgtvLdKhm9INp4CKRXAdjcFiGKGLHyJCHEKa6M
	e8mNNkyZJx9v5Q60b5JfdIaRiX9a51yf1V5yPMhw9sEsg+q0QnnBnb6CN42iFuPA391SCmE5cjoVU
	hMZiFwWc2fi7LOjZmoCMmxfAbjffWaCf04TET19OKP1euYswFa0+Og2GXm2nkLhwxqbWyZu3cwXez
	KmagEHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZtd-00000004JyQ-0UYI;
	Fri, 06 Mar 2026 18:27:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyZta-00000004Jxx-2rW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 18:27:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06195497;
	Fri,  6 Mar 2026 10:27:23 -0800 (PST)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AAA93F7BD;
	Fri,  6 Mar 2026 10:27:28 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 0/3] v7.0-rc2+ Fixes for mpam driver
Date: Fri,  6 Mar 2026 18:27:15 +0000
Message-ID: <20260306182718.150569-1-james.morse@arm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_102730_763354_78C61387 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi Will, Catalin,

How do you want to handle fixes for the mpam driver? Currently its hidden
behind CONFIG_EXPERT as there is no user-interface to it yet, but these are
the issues that can be hit with mainline today.

The first fixes a dereference of an uninitialised variable when restoring state
following cpuhp. The other two are warnings in the kunit code. (which I wouldn't
send now without the first one).


If its helpful, there is a signed tag with some verbage here:
git://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/fixes/v7.0-rc2
---
mpam driver fixes for v7.0
 - Fix dereference of an uninitialised variable when restoring state.

 - Fix a pre-empt warning in kunit tests.

 - Fix a sparse warning in kunit tests.
---

Let me know if a proper pull request is the right way to go.


Thanks,

James


Ben Horgan (2):
  arm_mpam: Fix null pointer dereference when restoring bandwidth
    counters
  arm_mpam: Disable preemption when making accesses to fake MSC in kunit
    test

Krzysztof Kozlowski (1):
  arm_mpam: Force __iomem casts

 drivers/resctrl/mpam_devices.c      |  2 ++
 drivers/resctrl/test_mpam_devices.c | 22 +++++++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

-- 
2.51.0


