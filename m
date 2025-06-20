Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0EFC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbJHVcoq7NiQABs8ZlPrmxzrxAeRD2HALcHntXvIP84=; b=NlG+eHlYKMP7n2wufM5093vO7N
	wajWW22DvF+3sx5B0UAMBAjeBtirH+INPhxqpKbpnd54d+fLKAAyuwfjjhpb/G3KxJr3J6N0vgUSQ
	qpXZrs7hi+ItcG9sQHQGEHtRU5aZEEBtplazPf98QSfVsQWtDL4ymdnc9uCZnaoFYdxJ96JcB1uW8
	EQHFuUhAVOcvGN29Kh4J7dGjysMY2sEQ6/EG/PRqdC0JUeUM83kw9kVWUxMcIOwrqU+rMOfGAXs9I
	eF34KfMhvx4ov8s7fVNtie0jUKm8FV4+yxRIhRNG2BU/uyp1IyuRDvX8dx01pvPoMvaiQP3vbMCLa
	BMbYVDIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaIf-0000000FVcK-0myX;
	Fri, 20 Jun 2025 11:52:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZi5-0000000FRRV-2QZD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:15:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A86D95C46ED;
	Fri, 20 Jun 2025 11:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B40FC4CEE3;
	Fri, 20 Jun 2025 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750418103;
	bh=fHGPT6U5lkOL40pG3L6uGrMxMnoD5rKHLmnMjGJM4HY=;
	h=From:To:Cc:Subject:Date:From;
	b=uGab8+3sBVTk65V/vppELrITzxhLlKqt/PCYK2f5nMEGtMUyW+WIkJqwPgnLVFOyD
	 0fOKKPXlQl2KqwX26lksY/qNWuHp64d58okXUTeKO05KvGbmxfxtujqIg7djsQItzi
	 X/UCt4M8DmP71vRTg/TgUNm3J0KZ/Ha5+XWyfIdRrErxW4igRLUx073rB392UUO+Q7
	 BqLkXJWXWW8bkrS+QlHFwcj25XZECy2qpTtzvpB8exo60fWc736uctEizzutPd5tvj
	 DNmipNK8nm9LkGqS4yzR1xjYBgdOqe4pWSX9mdNFpOYuTbW/3q2qerphMxmEB3CxcZ
	 khkyzLPXi98Ew==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jacky Bai <ping.bai@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: armada-8k: make both cpu masks static
Date: Fri, 20 Jun 2025 13:14:53 +0200
Message-Id: <20250620111459.3366195-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_041505_659609_5FA72226 
X-CRM114-Status: GOOD (  13.19  )
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

From: Arnd Bergmann <arnd@arndb.de>

An earlier patch marked one of the two CPU masks as 'static' to reduce stack
usage, but if CONFIG_NR_CPUS is large enough, the function still produces
a warning for compile testing:

drivers/cpufreq/armada-8k-cpufreq.c: In function 'armada_8k_cpufreq_init':
drivers/cpufreq/armada-8k-cpufreq.c:203:1: error: the frame size of 1416 bytes is larger than 1408 bytes [-Werror=frame-larger-than=]

Normally this should be done using alloc_cpumask_var(), but since the
driver already has a static mask and the probe function is not called
concurrently, use the same trick for both.

Fixes: 1ffec650d07f ("cpufreq: armada-8k: Avoid excessive stack usage")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/cpufreq/armada-8k-cpufreq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpufreq/armada-8k-cpufreq.c b/drivers/cpufreq/armada-8k-cpufreq.c
index 5a3545bd0d8d..006f4c554dd7 100644
--- a/drivers/cpufreq/armada-8k-cpufreq.c
+++ b/drivers/cpufreq/armada-8k-cpufreq.c
@@ -132,7 +132,7 @@ static int __init armada_8k_cpufreq_init(void)
 	int ret = 0, opps_index = 0, cpu, nb_cpus;
 	struct freq_table *freq_tables;
 	struct device_node *node;
-	static struct cpumask cpus;
+	static struct cpumask cpus, shared_cpus;
 
 	node = of_find_matching_node_and_match(NULL, armada_8k_cpufreq_of_match,
 					       NULL);
@@ -154,7 +154,6 @@ static int __init armada_8k_cpufreq_init(void)
 	 * divisions of it).
 	 */
 	for_each_cpu(cpu, &cpus) {
-		struct cpumask shared_cpus;
 		struct device *cpu_dev;
 		struct clk *clk;
 
-- 
2.39.5


