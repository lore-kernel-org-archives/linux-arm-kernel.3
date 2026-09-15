Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CDEC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYOBTKc2c4pciTJc8P5nxnI7c1PuGom4F7lXTau/qJ0=; b=VJQqaMYh83s5ZBf/Gh0q6d6lwg
	+uo6vMfZrc6T8Id3oFOHbF1RcGjrVxo+pdx9hXhE1wDdPYx8fu35eSL13je8gUBasN+Fv6slOZJDT
	N6T5lYC2WzAuBOD8xLHuMjFQ1hLeReKw2uMnLHhZouYTOQ1oWyks0zGdRdEU0xj3h6NCb0dR1UOcT
	oclSjPtsF8B4hjqLIpL46yttPZkKwCEcpIxDQEGwz2rX444JhpemZp0Wk+IFKr0eKWa4EuP7Zkuf+
	WlOTLg6z3E3k43BU494MBnRAtPQ08gcK/WnSbhiROFRIgs3Psv0Ck+CqPeiJoTRHafp1dv2wiAbfv
	wrgVBmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPX-00000007HmN-35DV;
	Tue, 15 Sep 2026 15:49:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VPI-00000007HgH-19Sf
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XYOBTKc2c4pciTJc8P5nxnI7c1PuGom4F7lXTau/qJ0=; b=BoVEcQDcqS/LnHYRyEL5d0gcr3
	03aiR2E989H9al9SWvc8LjWx73IgVGna0wrhyB3MlqhdJSldiDJQTE7fj6Zs5XQ4Xw9OmJCkUrs2U
	NmBSkd5NoNaZ6gOsfs5dFLZNQo5huiRL/QGCmpQbJ63iKm5N8CP/4/xTwn69kAEbe54vYwduwe8kw
	8O/6mHu5a6LeyiX6LkNzqkHWOKcaRZbq/Ty8RYuKgK4c8vVg+3r5ZP7rGz1DvjBMYWPmr6xiAdD9c
	RN1hdkHO2FoGOuZgqG5svjjxKHP/bxkIKy2a9wxCk1P6Jnrs8V3Mvbm9vNDE4oQ5FFZcfjri3AcsE
	dkD6qM5Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VPF-00000006yQT-1zrC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:49:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00A121570;
	Tue, 15 Sep 2026 08:49:08 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 343C43F882;
	Tue, 15 Sep 2026 08:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487351; bh=uKAFRhyIt1gjtBPb9l3BgDILFBey3jhPAZxBylli1AA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hIhsgwZtsfBg4lWL2UBv9c04SkNq7BCDILiHgCNpigGvMpYsS0/cOpbvpb2/CpdJw
	 5FPWNBpQVsV/fD7bdfDP3YL3vJWY6CEXk7BVlP+EIvW53kY8y7DpAHqRPO7M4uY9Jp
	 4MyMcvT8AfsUcHCrCPzLUKwtz3WsI6oCZXjK2s7c=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 15 Sep 2026 16:48:49 +0100
Subject: [PATCH 03/25] perf/core: Export output copy helpers for CoreSight
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-arm_cs_support_aux_sample-v1-3-35cf6f297d20@arm.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789487340; l=1214;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=uKAFRhyIt1gjtBPb9l3BgDILFBey3jhPAZxBylli1AA=;
 b=nIQGJIWpljvvO37hFp25/Y01Ze6az87G38R0IwB3bG0xzjOIw6zkAlRH6Nr8s2RA0pY8VTFQh
 O8+3/fLPJSkBbThxx66yZ+dakd5DQG4o+8YWP1jB846bHezSmX2V0KT
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164913_752432_A438E0F1 
X-CRM114-Status: UNSURE (   9.69  )
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

CoreSight AUX sampling needs perf_output_copy_aux() to copy trace data
into samples and perf_output_copy() to prepend zero bytes when the
available trace is shorter than the requested snapshot.

Export both helpers so the CoreSight snapshot_aux() callback can use
them when CONFIG_CORESIGHT=m.

Assisted-by: Codex:gpt-6
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 kernel/events/ring_buffer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
index 1b1ffe0533e58a9d976d0eb0fc23e09d5936da2b..e69ea5b077a5e94b5b6bb1f4c6f0ca5b8a94a6cc 100644
--- a/kernel/events/ring_buffer.c
+++ b/kernel/events/ring_buffer.c
@@ -298,6 +298,7 @@ unsigned int perf_output_copy(struct perf_output_handle *handle,
 {
 	return __output_copy(handle, buf, len);
 }
+EXPORT_SYMBOL_GPL(perf_output_copy);
 
 unsigned int perf_output_skip(struct perf_output_handle *handle,
 			      unsigned int len)
@@ -617,6 +618,7 @@ long perf_output_copy_aux(struct perf_output_handle *aux_handle,
 
 	return len;
 }
+EXPORT_SYMBOL_GPL(perf_output_copy_aux);
 
 #define PERF_AUX_GFP	(GFP_KERNEL | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY)
 

-- 
2.34.1


