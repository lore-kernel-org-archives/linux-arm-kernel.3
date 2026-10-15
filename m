Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD5CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/GynnbQk0ORjlmIVBWW4Y0/Gml4epfj5gR5IlEldqk=; b=JIxlJAnp8ZTr2/w39rY95HcCP2
	D/N2l4ZPxFdmB3pNecLgXpU+3PXJfHZAR/wIwNxH6/2C2Ao3vYjdww2rsvBbF9GiEN5X43aY1tubX
	gWFao0LT79vuxdFCaJj3j2iUOANeebraCKu5W2sUb3sIylKx5M5o/3hRtURqHIAZNdAddbTvgajaf
	bp4A0KD3888jimLEGJA7tKHEA5iBrEa0+85/VycwWfbJU3m7ffZvcu3MXw3Cd0FI8eNYnDFRv0BuE
	nGwKUZvmR48pGMkUvU7AHs5heEspZE7xn/aJOrm1XgGyHc7P2mORrNW2jx1h5r6E6aX7pQeWlvztK
	DYaiNwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNkh-00000000ccK-1UUK;
	Thu, 15 Oct 2026 15:52:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNka-00000000caw-02Sb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 15:52:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7400D1516;
	Thu, 15 Oct 2026 08:52:07 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33BFD3F7B4;
	Thu, 15 Oct 2026 08:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792079530; bh=CHzi+P9m5petahE5T3ggExjx5Ji6RcvGl9WKuhEkeQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zt6XUBe/ci7svn8AnMsCYgze34uLuwspaJxCWAaahd+8F8pQ40o0imSWtreKsk4/z
	 uT06yYE30jceNQ3//fFVGQIdIGz5pTWlg5dfIeMe6/yBHaiUUEwqHxihKoWazeMVm8
	 sWesWbxEDr1NDjPkt+srP3cT33eM9IKm3afn21rw=
From: Leo Yan <leo.yan@arm.com>
Date: Thu, 15 Oct 2026 16:51:58 +0100
Subject: [PATCH 1/2] perf: arm_spe: Order padding before publishing AUX
 head
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-add_barriers_for_perf_aux_output_skip-v1-1-5847d0578859@arm.com>
References: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
In-Reply-To: <20261015-add_barriers_for_perf_aux_output_skip-v1-0-5847d0578859@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792079527; l=1283;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CHzi+P9m5petahE5T3ggExjx5Ji6RcvGl9WKuhEkeQI=;
 b=zjQfriJA5axeJt3hkdUHMD+NbBgSFhhvyzlc1ouUkDmp0XbsuJi5uivH3qQil2SWGU2ywrKzt
 /q7Scx5oclzBit9UHnzjuYylGs7J9REnu73XWohJINkUXuCCmBwcUA9
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_085216_096258_0531821C 
X-CRM114-Status: GOOD (  11.59  )
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

The driver fills alignment gaps and calls perf_aux_output_skip(), which
publishes the new aux_head without a memory barrier. A userspace
consumer on another CPU can therefore observe the new head before the
padding stores become visible.

Add smp_wmb() between the padding stores and perf_aux_output_skip().

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Assisted-by: LLM
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index b70f3fedf0282baba1395ce1116272ec5f961ea8..e105462ec5f38eab4776b0a654ba7c8a84f70f71 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -487,8 +487,11 @@ static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
 	u64 head = PERF_IDX2OFF(handle->head, buf);
 
 	memset(buf->base + head, ARM_SPE_BUF_PAD_BYTE, len);
-	if (!buf->snapshot)
+	if (!buf->snapshot) {
+		/* Order the padding stores before publishing the new aux_head. */
+		smp_wmb();
 		perf_aux_output_skip(handle, len);
+	}
 }
 
 static u64 arm_spe_pmu_next_snapshot_off(struct perf_output_handle *handle)

-- 
2.34.1


