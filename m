Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5BDCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldfXdTVU47tWvWbMJyiK3+mGtcCL/Gxcx9lBUXcC8dg=; b=QDuSuuMW87deQx6kwxKOMoJFye
	ahtiTeTbFi/826qzl7Q5BJDH5vaC/MNY2YXRqYhWI76/VRK+bQUfLkiTa9CJghtRAkuOzoIxUjAF2
	X05E5Zfly7dkjUCDAEoZO0K8+WeTQjyQcS2AdmoZON0Ro6SbmtxjJ751aSbXn/V8SyZrNHC28sVD0
	IhwjrNkmxQ2Qy4qDGcOwSzBfdE4PtO62GL5Qb8MKX/BmEqBfgXVOCkCgfDKHToifJ4f3xU4Osx8aw
	UxLPuHBiIr0Sq49Af95oi3c1oks96ZTLzLA2xWpTMk3iakhdDdRb0HhH5/wS4CERkKWc82hB/3AGB
	2nzEOuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkgd-0000000EQ6R-32mp;
	Wed, 05 Nov 2025 21:04:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGkgb-0000000EQ4t-2mbh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 21:04:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49430409E3;
	Wed,  5 Nov 2025 21:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B89C116D0;
	Wed,  5 Nov 2025 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762376697;
	bh=SYoV9ZciDsKT7uyTlAb1HvnL9v8aWR3nKq+oz55/MdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kItBEaDNwg83NtBZHN0PY2kO9v4qG9+R9UGhFJXkfz3oeoYG2txCyhHm8tQi1BkuD
	 NWItfaf8aoElYQ+RjvhVLcKuuhff34s1plgMvHf/SEFle9YrkEyqQFq6fErNgLNiEW
	 uYEF73IW+07iSZb619oMuwv6PrVbrMjfvyg+P5grwt/pH++e9JAObxCWjuc5mzZKMy
	 aZ1dugkuLqmPVgs+1gxfJiF2/ehXeFrMHeF5pPRKqaxAvbJcpRFu4H4XfmMUY8PXiD
	 CpEWomCTEysE3h4vCqrk/emFOvpj2sqiG0G0gliDyXtIxhlNYCuVzrEsNmaUc2145Y
	 6h2pO0qbg3p6A==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Muchun Song <muchun.song@linux.dev>,
	Paolo Abeni <pabeni@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Simon Horman <horms@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Waiman Long <longman@redhat.com>,
	Will Deacon <will@kernel.org>,
	cgroups@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH 07/31] driver core: cpu: Convert /sys/devices/system/cpu/isolated to use HK_TYPE_DOMAIN_BOOT
Date: Wed,  5 Nov 2025 22:03:23 +0100
Message-ID: <20251105210348.35256-8-frederic@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105210348.35256-1-frederic@kernel.org>
References: <20251105210348.35256-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_130457_738478_4282F254 
X-CRM114-Status: GOOD (  12.48  )
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

Make sure /sys/devices/system/cpu/isolated only prints what was passed
through the isolcpus= parameter before HK_TYPE_DOMAIN will also
integrate cpuset isolated partitions.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/base/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index fa0a2eef93ac..050f87d5b8d4 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -291,7 +291,7 @@ static ssize_t print_cpus_isolated(struct device *dev,
 		return -ENOMEM;
 
 	cpumask_andnot(isolated, cpu_possible_mask,
-		       housekeeping_cpumask(HK_TYPE_DOMAIN));
+		       housekeeping_cpumask(HK_TYPE_DOMAIN_BOOT));
 	len = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(isolated));
 
 	free_cpumask_var(isolated);
-- 
2.51.0


