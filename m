Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DC8C021AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 21:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPNPqntBbp+b0D9/qTKpllndvpVxiL3sfdbmY7Rt9jw=; b=m1jdQ7UtRww9nS4IYLGd8P4eTz
	0CanaLwrL5uMS2JXWQ1k17Xb3UElBAKLYy6UNtOYJJVuAWFwT2B64YNxciDDSSjBY+mJRB0/8NbHH
	9oH/zoytqzh6qX3DD7JrmCcLE7iYaCs+XBMN6q/DdpWzoNtsT5wvE/RvbFGoX7AhAJbMVVoLJa9Nn
	eanc6yeeQbacR+rbzDktzAZVYeuDc9GZboUP5MvKEkcZNPHXQhCing8CgZT+eqUtDql6NBDUGyfcx
	v+zThQJjZcl9A8q0fioHTenE0BSHXjIESvzNOrtJaKkfsTFS4m1qBH+g4LVvZ5vrwCnoP1XDze+jJ
	Cun1PgtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUnM-00000009viU-0QUg;
	Tue, 18 Feb 2025 21:06:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOd-00000009oih-1GDQ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 20:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=NPNPqntBbp+b0D9/qTKpllndvpVxiL3sfdbmY7Rt9jw=; b=fARnjMWlt9EEJYczXkFdq8gWbY
	52olDW5/YlIkbp04u0Z+Xd/GW2n628rSmv9BuqHJo4YdCf0H/+7+MgzT6/GHOQry5IgFPIWdVAXq2
	E060tzhLUeTb97AI48CDvDxuB9sihbMJuKtx0+YGRklKE0jc6X3ZORTGEn5ByZ8NEN7THcKSqJDQ5
	51ATp64IIVxQMBcipCz/csIXIpQBYE+HNpa9QjsSlS5RYUzS6sMocOMDTTBOdRmm1K6kM1IHhQ7o8
	fpGRSjc03pIE828BXACAuvoO3yqGz49Gh5v89lML2ruVYmTXkJxkXCIXXRgbah+fdHSq+jFFrlDQP
	GUJ+krjQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUOZ-0000000234i-1zAZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 20:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E2C7A414DD;
	Tue, 18 Feb 2025 20:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89F9C4CEE2;
	Tue, 18 Feb 2025 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739911242;
	bh=fpChsUtgUFClO1jwmD1KdQQIXH18jEDefaEwkn8anB4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=miI8w+LTAJVgF0A3ILJStDlifRnPr8aBRiSP1mWCoe8sl1zyfap/SL9nhxWkd7oXW
	 CfEq+g3aANGwyrp2w5SMUw2MRQX4xuRSF50bc+3/Xn4YCgJdtONe0zxQFhRV3PCFM4
	 9QDv+PU8AOhFKYbK7XdfdYN/VRhQw6cMKed3cqJIpW6QurkvbrSCuruCuBt/QeQSzf
	 SNtbPx5+MrSe7J/ghjZeDj9c7qlfnoK8p544W62RfKBfUOMqcqZGiTuFmBQ338r0xJ
	 G6cpBSLEOFsuuOq9C8KoAfwJbMtzm5Rj1yBHk/lsJKBGZ6O6pF17iF/hQ2HoxY3fFM
	 GThKTaQ8ZIEsQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 18 Feb 2025 14:40:00 -0600
Subject: [PATCH v20 05/11] perf: arm_v7_pmu: Don't disable counter in
 (armv7|krait_|scorpion_)pmu_enable_event()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-arm-brbe-v19-v20-5-4e9922fc2e8e@kernel.org>
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
X-CRM114-CacheID: sfid-20250218_204043_802777_638EEA2C 
X-CRM114-Status: GOOD (  10.49  )
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

Currently (armv7|krait_|scorpion_)pmu_enable_event() start by disabling
the event counter it has been asked to enable. This should not be
necessary as the counter (and the PMU as a whole) should not be active
when *_enable_event() is called.

Signed-off-by: "Rob Herring (Arm)" <robh@kernel.org>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 drivers/perf/arm_v7_pmu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
index 7fa88e3b64e0..17831e1920bd 100644
--- a/drivers/perf/arm_v7_pmu.c
+++ b/drivers/perf/arm_v7_pmu.c
@@ -857,8 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
 		return;
 	}
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We only need to set the event for the cycle counter if we
@@ -1450,8 +1448,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We set the event for the cycle counter because we
@@ -1762,8 +1758,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 
-	armv7_pmnc_disable_counter(idx);
-
 	/*
 	 * Set event (if destined for PMNx counters)
 	 * We don't set the event for the cycle counter because we

-- 
2.47.2


