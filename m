Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A19C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0GJ+WQOsBm0PgevzAY/fXGyrYkWmJ95vbTAUW144ysA=; b=vpxK8C/fgby1/uMGxNKUelDaBA
	IHnbxiZGWTtSGZM4pqyaEg0FfsMZZ36szaqEMyI76JQjRvHu3FZnKzVC0exPViVvnMx+Ir99fd8ZB
	XbgDu2by6y8tnZp9fm3FaBAKaHMOuEHJeRpRWTZnmWCyU/kiW3eSuGvA4lzGlKKQoa5W1vpqXMHbV
	pfkd+wBF0v88IWdHqQvmEKZ05L/P5u8qln/ZjaqO6DB7dJGLZW/Up4opmY81aXhOdLolFBw22eYnk
	9rRHOyrGui6wrN1RlU++qTP8LSGZXSdkrqnmaLxR4/K+QsivYAPbpabw8FzbpzUV+sXtYiOBzmqhN
	0zAdiq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNlb-000000000Ji-49Jm;
	Thu, 16 Jul 2026 15:12:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNlY-000000000Hb-3su9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:12:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3419E1476;
	Thu, 16 Jul 2026 08:12:43 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A8933F66F;
	Thu, 16 Jul 2026 08:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784214767; bh=riNgHQn3hQVJcEeEO/u7syMJef1+ZO+8QXz6OJzfZO0=;
	h=From:To:Cc:Subject:Date:From;
	b=uJAM+XmYcM21K0hI8+6LuZWyxmhvSCMpYMdH/LKunRHvJF5idzMDKBU9Rf8JSpStq
	 fpuapCdtMhX4QruFEOR8P8qNdS1mOy6EPiQPsK9OTcdbCOw/lAgG6aC5PxyyVgjrMm
	 6G2f8yjiBcbUB3W/0/FMECKf2muMYTsR30SAVfZU=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: devicetree@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] perf: Support Arm Bus Monitor Unit
Date: Thu, 16 Jul 2026 16:12:38 +0100
Message-ID: <cover.1784214112.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_081249_003750_187C8654 
X-CRM114-Status: GOOD (  11.98  )
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
binding is more for completeness and maybe very early bringup hacking.
I've kept it here for the sake of discussion, but the only requirement
on me for now is to get patch #1 landed.

And yes, I did initially look at trying to factor out the PMU register
accesses that functionally overlap the existing arm_cspmu code, but it
very quickly became clear that that would end up far bigger and more
complex. This is not a big driver, even with a few dozen lines of
nominally-duplicate (but also simplified since the counter size etc.
is fixed and known) code, so this way it went.

v1: https://lore.kernel.org/linux-perf-users/cover.1783439341.git.robin.murphy@arm.com/
v2: Fix valid Sashiko nits, separate DT support

Thanks,
Robin.

[1] https://developer.arm.com/documentation/den0093/latest/

Robin Murphy (3):
  perf: Add Arm Bus Monitor Unit driver
  dt-bindings: perf: Add Arm Bus Monitor Unit
  perf/arm-bmu: Add Devicetree support

 .../bindings/perf/arm,bus-monitor-unit.yaml   |  41 ++
 drivers/perf/arm_cspmu/Kconfig                |   6 +
 drivers/perf/arm_cspmu/Makefile               |   2 +
 drivers/perf/arm_cspmu/arm-bmu.c              | 538 ++++++++++++++++++
 4 files changed, 587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/arm,bus-monitor-unit.yaml
 create mode 100644 drivers/perf/arm_cspmu/arm-bmu.c

-- 
2.54.0.dirty


