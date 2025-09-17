Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B43CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1HMZ8HPzhthwzsrfdYr5/bwWLl4MCWuBGb8vk9/U2Q=; b=qC1+FWDaUwHkUgNbw8E9KJuqub
	HNqrSNyZf90cdy/tL+0DAKFMZ0WKpqUc7JCzxY3jB9cRaK65fGLvdCmvuR5emgY5zms4y777kxRRD
	CXc2TsoilVn9tYc2qoCT/niNZeuSFB+Vx/kdyyDoWOns+35Ako+/pxv8EtBZ/0vmIXwGxf36O+Efl
	HjzZb846eOtzD4Y9vQY9rSB5BylrcKypgCVsEFVyTaiS7nbM9rmMGTH7ER00pmwUSYBLYTvPXUSLL
	dbExrxqDEEC6LyteBasn+QtXJdjr6wM0Wkt/T2to8sCWGX3OZM56CJSuf63ds0TIau7jlxaLt8fI5
	1rsNu5fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywAY-0000000Dg8M-0kIb;
	Wed, 17 Sep 2025 17:42:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uywAS-0000000Dg2E-0HOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:42:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D86E726BC;
	Wed, 17 Sep 2025 10:41:58 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D3803F694;
	Wed, 17 Sep 2025 10:42:05 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 17 Sep 2025 18:41:39 +0100
Subject: [PATCH 2/2] perf: arm_spe: Prevent overflow in PERF_IDX2OFF()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-fix_aux_trace_index-v1-2-e36a76ac6292@arm.com>
References: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
In-Reply-To: <20250917-fix_aux_trace_index-v1-0-e36a76ac6292@arm.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758130921; l=1032;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=/9UdUZ9OJII8IHbRr4Maef/QuxaY9QyUmTQxAX7pvqg=;
 b=x0p7c5gNdLZczsCfpgoOfdRVsyQTPiTO8a7q3eclGz88s9gvUi3g63j/BIGmu+UrjcROmjZ+6
 UCpvygM7/WrALEAZljLPsga55AGq0wDkfpn8JHk/HzPcrAAruaPZDGS
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_104208_151390_F516C50B 
X-CRM114-Status: UNSURE (   8.79  )
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

Cast nr_pages to unsigned long to avoid overflow when handling large
AUX buffer sizes (>= 2 GiB).

Fixes: d5d9696b0380 ("drivers/perf: Add support for ARMv8.2 Statistical Profiling Extension")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_spe_pmu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 369e77ad5f13ffb490bf8f128fee5180d1254bc6..8f14cb324e018349fbe19c5c20d92a9cdcfd2e73 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -97,7 +97,8 @@ struct arm_spe_pmu {
 #define to_spe_pmu(p) (container_of(p, struct arm_spe_pmu, pmu))
 
 /* Convert a free-running index from perf into an SPE buffer offset */
-#define PERF_IDX2OFF(idx, buf)	((idx) % ((buf)->nr_pages << PAGE_SHIFT))
+#define PERF_IDX2OFF(idx, buf) \
+	((idx) % ((unsigned long)(buf)->nr_pages << PAGE_SHIFT))
 
 /* Keep track of our dynamic hotplug state */
 static enum cpuhp_state arm_spe_pmu_online;

-- 
2.34.1


