Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B24CFA460
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 01:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z0lB3o3SwbOYKkV5Q0JuzwgjnjNnSnFiQ4AX0Mcpicc=; b=YhZNtTxLRlIt4I1ebbkxd5Rno+
	wgcT+keb+nZ5EPQ2688oIhl61VHrKqk0A31B7DjsbGce1KMt+apl4h3G2GeZrATO27v1YzyXrlZdR
	Uoqz2mCsww/Sh7fANynV/m1bnnfiQH593yMhhMsFw6WDI6GRr3wIrTsV8G8igG1h+AJxPRH5rdjCC
	Q81fI5+2cLhynpyU6NfRtr2Q3yOZs/6AuZpueSbwkT07AaLe8SouZ8inaR7AqJGqO7n/hlpJS0Nip
	2UPXVGbtPGnPPkUH+NbuioYly6UyU0bJP4sBNSF4mxXvkqBAMnzHQ9XHUnGc/L0GUiJKW9xbL0DTp
	pGhy2o8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMFdk-00000007dZE-3zoj;
	Fri, 21 Nov 2025 01:08:44 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMFdh-00000007dYD-3av8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 01:08:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1763687318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z0lB3o3SwbOYKkV5Q0JuzwgjnjNnSnFiQ4AX0Mcpicc=;
	b=hr1YTfTGgd3PUDkIDH8vn+xaYQpiQITjQ3PP0CMHGeD8WcxNAvTZrwlOMVZrQhzR4Uxv90
	gGgxueXVuH+AaZpaDdFgwVyiGuC0a2Lndd0SgjdVFVkc7u2sQiXYAse8bePoDwLcusu8kf
	5OAoB0LOJOlNr6V7k2ztBBiQ15XZnMc0pJNOQBHKLXzkAtK6aTm4QI6mh12j2EmJxiSXUj
	l4OUqwpovtt1127jPykIjltcD2WfJNpTWlEue++3PxNUDRjh3+OIOS48xlHLt2ZqfND+1v
	lXNQJ/gYNQyEvlwJvVcKfgVoS/LEdfO/nnhTcCeDNFyfh4+/StvL7uttO6SI4w==
From: Val Packett <val@packett.cool>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Val Packett <val@packett.cool>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpuidle: warn and fixup on sanity check instead of rejecting the driver
Date: Thu, 20 Nov 2025 22:06:25 -0300
Message-ID: <20251121010756.6687-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_170842_165951_A5F82A3A 
X-CRM114-Status: GOOD (  10.60  )
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

On Device Tree platforms, the latency and target residency values come
directly from device trees, which are numerous and weren't all written
with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
trips this check: exit latency 680000 > residency 600000.

Instead of harshly rejecting the entire cpuidle driver with a mysterious
error message, print a warning and set the target residency value to be
equal to the exit latency.

Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and target residency")
Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/cpuidle/driver.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
index 1c295a93d582..06aeb59c1017 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_driver *drv)
 		 * exceed its target residency which is assumed in cpuidle in
 		 * multiple places.
 		 */
-		if (s->exit_latency_ns > s->target_residency_ns)
-			return -EINVAL;
+		if (s->exit_latency_ns > s->target_residency_ns) {
+			pr_warn("cpuidle: state %d: exit latency %lld > residency %lld (fixing)\n",
+				i, s->exit_latency_ns, s->target_residency_ns);
+			s->target_residency_ns = s->exit_latency_ns;
+		}
 	}
 
 	return 0;
-- 
2.51.0


