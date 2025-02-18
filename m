Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2767C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWwbAbB4bTRfP8B1lD2T48kRs+vb3FvqI84vaYqVcjU=; b=EqNMGWENc2ERTD8O6CfnJvH7u9
	AEoPuD8ZsOlXHb5zfZ/gBV2FH3gTD89ja8g34SJhRqBtdWEuWHXQLYyqZuATx6IhrGq67fl6NOVnf
	isAbHAuXhAu6ewfBoC2AGvqS0GHlVrIgJIH1/28TMKCrga/7wndhdA+I7KFd2Gb2jFsRGymAtxXLe
	Nk7lvYKnzfoKbWaZNrqow/riPVlT4ir7ty56k0TMpC4V+QUc2aqgGSv+5MvEPFFv7t1j+oIheBF1b
	5Z4ICMyYJfLmczhIVo+iHM8Pg3/bxpHAbOqMF2MjlDHVoWF0ih5lUtl5NrZK5gmk/HMekvIqMPpei
	J36qUumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkVAV-00000009zwK-0sIA;
	Tue, 18 Feb 2025 21:30:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOW-00000009of4-1h3Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 704475C5AB9;
	Tue, 18 Feb 2025 20:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20BABC4CEE2;
	Tue, 18 Feb 2025 20:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911239;
	bh=DFruu6M6LuyMFhOcYMVY3k7q3IHlAshlqt8WjYP/+dM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s/GRhmpbbtmzWA6zPT8aWKbbG3tGtdsk00aNPFP6V/Tw33q3a9zCAz49rMyqX3Ey4
	 oL3xsUlQfRy08APXbG6t0C2tm6zP1AqzlbrIgwuAssg83ZzTqGduEb83+lzO1M1JX5
	 MLu3wztsI3u9UQr4IPc67SPbXvi4eF9haJWJNOMgjnEoneW8Ju6tnQA8VkXyMpxOA5
	 2fcoBrsYbSOj3KOu6vU+m0pOK+eTBXnlaHNgcwWRE3Zx66EhgPPwzrMutsNy+HS2bp
	 FOP+rH3BeLoFS+GQVH1d8jds4bWv7p4CUNKDoyyHhnYo59F+52YfhX8tpC6jZ8DXyE
	 YJ6M9AeOguHsQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:39:58 -0600
Subject: [PATCH v20 03/11] perf: arm_pmuv3: Don't disable counter in
 armv8pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-3-4e9922fc2e8e@kernel.org>
References: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
In-Reply-To: <20250218-arm-brbe-v19-v20-0-4e9922fc2e8e@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_124040_490591_24874613 
X-CRM114-Status: GOOD (  11.41  )
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

From: Mark Rutland <mark.rutland@arm.com>

Currently armv8pmu_enable_event() starts by disabling the event counter
it has been asked to enable. This should not be necessary as the counter
(and the PMU as a whole) should not be active when
armv8pmu_enable_event() is called.

Remove the redundant call to armv8pmu_disable_event_counter(). At the
same time, remove the comment immeditately above as everything it says
is obvious from the function names below.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/perf/arm_pmuv3.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 9ebc950559c0..5406b9ca591a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -795,11 +795,6 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
 
 static void armv8pmu_enable_event(struct perf_event *event)
 {
-	/*
-	 * Enable counter and interrupt, and set the counter to count
-	 * the event that we're interested in.
-	 */
-	armv8pmu_disable_event_counter(event);
 	armv8pmu_write_event_type(event);
 	armv8pmu_enable_event_irq(event);
 	armv8pmu_enable_event_counter(event);

-- 
2.47.2


