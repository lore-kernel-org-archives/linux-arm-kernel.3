Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B18CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 20:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXMzcWrYKrTC5Q365x9L7GaV+mSlqCEeHNu3LG/Kads=; b=sqOL0/Fn6eVnEkoy0zrNa6PSDX
	CcX6ttOVN8FIPiuC+GuIxlznf4SevonmPiqMnYmSk5D6RDgqjKKZzNZyin+2ginKLruCbqN71+C9J
	cZYwt9dyc+5QB3mk2cOfZnwSZaoZZR0wuyoPIAulwJC+KwwQ1bUm5yqMZA5r9YTXl6D+K7F8HfOeM
	iGj+jHuJStDl0CDC1LG41WY3+tDIHPYGGLtLBdYfXj5YWZ+eoLJQB5yFp/uXlYwN/RkwE7szhb8a7
	ftYijv2Y42X3VAuCHqdYt9nEZ/biFt2huPH3n2K8bMa/p5fLbO5OfMEBtW8po16zahaCpDJay6ZVY
	ehMHq1ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoScA-0000000BV8o-24mT;
	Tue, 19 Aug 2025 20:07:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQST-0000000BA2Q-33lx;
	Tue, 19 Aug 2025 17:49:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E877152B;
	Tue, 19 Aug 2025 10:49:06 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 475103F738;
	Tue, 19 Aug 2025 10:49:10 -0700 (PDT)
Message-ID: <cdb7b1e7-6e51-4c0e-bffb-b0d4b654a623@arm.com>
Date: Tue, 19 Aug 2025 18:49:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] perf: Garbage-collect event_init checks
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dmaengine@vger.kernel.org, linux-fpga@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org,
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com,
 adrian.hunter@intel.com, kan.liang@linux.intel.com,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org
References: <202508190403.33c83ece-lkp@intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <202508190403.33c83ece-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_104917_878778_F810A49C 
X-CRM114-Status: GOOD (  17.93  )
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

On 19/08/2025 3:44 am, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:
> 
> commit: 1ba20479196e5af3ebbedf9321de6b26f2a0cdd3 ("[PATCH 19/19] perf: Garbage-collect event_init checks")
> url: https://github.com/intel-lab-lkp/linux/commits/Robin-Murphy/perf-arm-cmn-Fix-event-validation/20250814-010626
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 91325f31afc1026de28665cf1a7b6e157fa4d39d
> patch link: https://lore.kernel.org/all/ace3532a8a438a96338bf349a27636d8294c7111.1755096883.git.robin.murphy@arm.com/
> patch subject: [PATCH 19/19] perf: Garbage-collect event_init checks

OK, after looking a bit more deeply at x86 and PowerPC, I think it
probably is nicest to solve this commonly too. Below is what I've cooked
up for a v2 (I'll save reposting the whole series this soon...)

Thanks,
Robin.

----->8-----
Subject: [PATCH 18.5/19] perf: Add common uncore-CPU check

Many uncore drivers depend on event->cpu being valid in order to look
up various data in their event_init call. Since we've now factored out
common PMU identification, we can factor out this check in the correct
order too. While it might technically be possible to hoist the general
task/cgroup check up here now, that would be horribly messy, so for
clarity let's keep these as distinct (albeit related) concerns.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202508190403.33c83ece-lkp@intel.com
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  kernel/events/core.c | 12 +++++++++++-
  1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 5f7eb526d87c..ddf045ad4d83 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -12562,6 +12562,11 @@ static bool is_raw_pmu(const struct pmu *pmu)
  	       pmu->capabilities & PERF_PMU_CAP_RAW_EVENTS;
  }
  
+static bool is_uncore_pmu(const struct pmu *pmu)
+{
+	return pmu->task_ctx_nr == perf_invalid_context;
+}
+
  static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
  {
  	struct perf_event_context *ctx = NULL;
@@ -12571,11 +12576,16 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
  	 * Before touching anything, we can safely skip:
  	 * - any event for a specific PMU which is not this one
  	 * - any common event if this PMU doesn't support them
+	 * - non-CPU-bound uncore events (so drivers can assume event->cpu is
+	 *   valid; we'll check the actual task/cgroup attach state later)
  	 */
  	if (event->attr.type != pmu->type &&
  	    (event->attr.type >= PERF_TYPE_MAX || !is_raw_pmu(pmu)))
  		return -ENOENT;
  
+	if (is_uncore_pmu(pmu) && event->cpu < 0)
+		return -EINVAL;
+
  	if (!try_module_get(pmu->module))
  		return -ENODEV;
  
@@ -12990,7 +13000,7 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
  	 * events (they don't make sense as the cgroup will be different
  	 * on other CPUs in the uncore mask).
  	 */
-	if (pmu->task_ctx_nr == perf_invalid_context && (task || cgroup_fd != -1))
+	if (is_uncore_pmu(pmu) && (task || cgroup_fd != -1))
  		return ERR_PTR(-EINVAL);
  
  	if (event->attr.aux_output &&
-- 

