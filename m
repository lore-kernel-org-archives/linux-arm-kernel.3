Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F37EC44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=47IO7E3XFpeQ2RAJZEaWJ3Aj14G7o04TIowegMtmjo8=; b=GnuHQuHkU6gCCom2yIVf6u5jrf
	mAdc5P+utrJ6bkODI6MiO92DktF4StgC/r8PrxfqFFAKBrh9fDJQfdkmQB8n/CDBBBQqCwsIomGnN
	ddSA2pTbpx2obrcWgVZXkWK7iMdB8ZYhyB12oI6Hy0/c5hU3Cp6uMCtm+gwOm0JbsiqvjKcWkL5hY
	jXea0V1DQt5/T4RBsao1KEGGuYr/cQA0REJ51VPu3tXyY8DJ6i6EPsBrBX69+8ImLuSi2MhKv7dGe
	IdD5MWPX4RcxZT/EfBxYzJtA2PT4FJ7ZKKhEyJP7TbbMhJ5AmXQMWGmpX23YV6px26WctwgXiQxBb
	Sb9pu0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuKJ-00000003S2p-2rS2;
	Thu, 09 Jul 2026 19:22:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuKG-00000003S1d-1SnG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 19:22:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B60C524C0;
	Thu,  9 Jul 2026 12:22:18 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DDE53FC81;
	Thu,  9 Jul 2026 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783624943; bh=6fbc1zMOckQ9tYF/nxEIPgsTtwm0FfeMsCMDNf7HVNQ=;
	h=From:To:Cc:Subject:Date:From;
	b=c/735BIYMdsOvnrBi/dVQA1f9+apLmvxS87xrc0TC4U/uhnRbqLX4+qC5j9yqYvRZ
	 Rb8EBQQjhcR44x3qzVB9jBixy3PTNELAR2XqSEhSyVTqbs+u7xCLe4aZ6VyUl8IhGr
	 io5B7ZRQlxgkrpWrWwdD9Yv5sqrFUj1Fk9vTVp7M=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] perf: Support Arm Bus Monitor Unit
Date: Thu,  9 Jul 2026 20:22:06 +0100
Message-ID: <cover.1783439341.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_122224_448354_4045314A 
X-CRM114-Status: GOOD (  11.77  )
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

Hi all,

Here we have the delight of another new PMU driver. While not am Arm
product in its own right, the BMU is found in the latest Neoverse
Compute Subsystems, including the recently-announced AGI CPU.

For now it is expected that BMU users will be ACPI-based (binding in
the latest "ACPI for Arm Components" release[1]), so the token DT
binding is more for completeness and maybe very early bringup hacking,
but there is a chance it may end up being used by more embedded/client-
focused subsystems in future.

And yes, I did initially look at trying to factor out the PMU register
accesses that functionally overlap the existing arm_cspmu code, but it
very quickly became clear that that would end up far bigger and more
complex. This is not a big driver, even with a few dozen lines of
nominally-duplicate (but also simplified since the counter size etc.
is fixed and known) code, so this way it went.

Thanks,
Robin.

[1] https://developer.arm.com/documentation/den0093/latest/


Robin Murphy (2):
  dt-bindings: perf: Add Arm Bus Monitor Unit
  perf: Add Arm Bus Monitor Unit driver

 .../bindings/perf/arm,bus-monitor-unit.yaml   |  33 ++
 drivers/perf/arm_cspmu/Kconfig                |   6 +
 drivers/perf/arm_cspmu/Makefile               |   2 +
 drivers/perf/arm_cspmu/arm-bmu.c              | 538 ++++++++++++++++++
 4 files changed, 579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
 create mode 100644 drivers/perf/arm_cspmu/arm-bmu.c

-- 
2.54.0.dirty


