Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46PB+xLeWIZgW8wabRzUgV3uo3VbAtq2fOdXgx19RiE=; b=Z0JLV9MEEIfsBKMc5nlRH8H2Pi
	2i/sJjUUYszcpx9RPi4+5Q71yMLAN0q1ZvsvGMZy6jU4gl9lBsizMwzl4UqmlHrJxqoSDhbGrlewH
	pHQPhCQHpjWDrw9YFBEX1otjD3xpFVPVr0Ng9ugmvdCuz6Jp7RHakN7xvOfEFp7NQwWrbxwxeWAV0
	dvKysNf29VNjd8ljhxh3L87DGiqzxJOAqwPQ+qhj3m/5ZYSVoCN9l9Ytt7A2GDbnRQjrqtuxYYF0U
	B2fECHIbl5g89Xhp7pmBN2CRLG02Ku5fj2HImsHupknWHw4bXVeg23qh57Ty/m3S4XYnDzqWhSMjw
	y0fvHXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYmDq-00000002bno-0NE6;
	Mon, 07 Jul 2025 13:49:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4f-00000002ZvQ-3QP2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Jul 2025 13:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=46PB+xLeWIZgW8wabRzUgV3uo3VbAtq2fOdXgx19RiE=; b=UaqYix2IBh/ySOILKumiIlgvbk
	e2U0IT6UoRVsDcpkazT0VGljYMkzSe9U5w0mjzMIuACi6g7T6zcVBkamsEXbciWpGXLjTFmoXWCGt
	05qgRx3ebQkolSmMY9K7qdUsTkydvrLgoljSRqLBxnHJozJa0Ff1ry7eiJz8JW84MqDieFV2dv/Nz
	PuU+4G0VKM6FGC+6WkQaVl6oS+4vcFS/EKOXaHZYNsqBtFWNs6lryOiYm3cHFyuaK3EqgCZMNj6r8
	Yu7BXiLow9973V2XylaDXVZCSN8scDQfh6I9jnTXLea6lGLOOK8gHZdg7BCvWbHv4L894+mMp4LDO
	/ODTObdA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYm4c-00000008VLM-1sHK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 13:40:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A28241BCB;
	Mon,  7 Jul 2025 06:39:43 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FA303F6A8;
	Mon,  7 Jul 2025 06:39:54 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 07 Jul 2025 14:39:24 +0100
Subject: [PATCH v3 02/14] perf arm_spe: Correct setting remote access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-2-33ea82da3280@arm.com>
References: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
In-Reply-To: <20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 German Gomez <german.gomez@arm.com>, Ali Saidi <alisaidi@amazon.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751895589; l=852;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Z1YwAQtlPaqPhy06Cikq4OmxWx4nI1SYRBIjUV0ECcA=;
 b=BQWVSXQrpdWwj2oqVM0fB0WoZbpRpnD+ZKi2sENP1jo8zBRkH4EVoPk6+4xm0gUb1RctNqzqb
 k7R2KVPeYp/BsqC7UFVG4WD0Gc01IGGMH1urYcef1c/98ax4Sze9eyy
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_143958_777777_CF8C71BC 
X-CRM114-Status: GOOD (  10.88  )
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

Set the mem_remote field for a remote access to appropriately represent
the event.

Fixes: a89dbc9b988f ("perf arm-spe: Set sample's data source field")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/util/arm-spe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index d46e0cccac99a36148b4daa37f2bf2342e6b47ef..fdef6f743cf3c76b1dcdd57f5a2c297642fdd21a 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -839,7 +839,7 @@ static void arm_spe__synth_memory_level(const struct arm_spe_record *record,
 	}
 
 	if (record->type & ARM_SPE_REMOTE_ACCESS)
-		data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
+		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
 }
 
 static bool arm_spe__synth_ds(struct arm_spe_queue *speq,

-- 
2.34.1


