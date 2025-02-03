Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2699DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 00:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Y4iNFh+3dDGie0OwTLt82DgO1PmCLLgNQwwku0BIR4=; b=E/KhQkmatraJAIsTTEhTh6b6Su
	CGysjLJ5ZanrIbFnUDFdgB1MRKo+E0Pu0FGTZBB9yGC1vpymWpdQV/M8UEytEOhtLgQ5CFWNbCctg
	S3M92h4OBkUm01C2D955BxqRVYkb0jUfKPXy0G6vL5aeEOmX3CfrC8S910U6aYguLNF2wRkQbbGam
	WXrFMmuzp62JLvzCE6qkQRhmLTGGZoQcMkSKJXcboJRP0gjXOnFoNYlky62gW0cYrrvj9Ie9h17AB
	DNHhmgn8u5qX4mVuZZBU8XfzdNFe8J2jppuHUzWl5PRy9rzsilAyKaB2zy9v5iyuOgNbCOQgXFrEL
	O2vOip/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tekdm-0000000EMEb-1z5p;
	Mon, 03 Feb 2025 00:48:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tekYc-0000000ELKF-2Dh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 00:43:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B9F15C61FF;
	Mon,  3 Feb 2025 00:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927BBC4CEE4;
	Mon,  3 Feb 2025 00:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543401;
	bh=hL4f+39bFU/TAP2cUriOWdCrZC1hK76nhw254DfXqIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F01lE8v49YhXEBYpLYUpEr2BoB2gLc1++0P10dPiCFD7g9dDpq9gHtI0gGxmq1igE
	 mMik0x7uqdc8VWRE+ECksRqEkGk/mH1XlcKY3pYeyD9Y0gYC0YPLXDtoEfi8vuWFgK
	 j8UUUrCkjuEEbiruLsq3ALFPIN9daTdiv+n7n1QefvaL5Y2KuUDNsdDEFtSSdUKnxJ
	 WcKrZ5MpRmIt8yYYx+8IciFVbZbpolLQOblj5U2eg177dboUPbO066fPfXqN9DwAx7
	 ZFVIy6chz16ML/+i8RF+Pwq+xJM52Uicl6YE3YqaUFeqTlhhNA3zaIC0t/h3+brq2+
	 57cGYVwRyK5+A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 02 Feb 2025 18:42:57 -0600
Subject: [PATCH v19 03/11] perf: arm_pmuv3: Don't disable counter in
 armv8pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-arm-brbe-v19-v19-3-1c1300802385@kernel.org>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
In-Reply-To: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_164322_615094_B4D44FEF 
X-CRM114-Status: GOOD (  11.48  )
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
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
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


