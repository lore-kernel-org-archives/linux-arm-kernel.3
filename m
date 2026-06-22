Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651BBCDB46B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 06:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VbFb/6GVKTHYyuv2TspUzd+JHLzdcZvRKyaUrUAD6xA=; b=FIvV5QGQne7q087IBhmpP1PdhV
	GY13HAONAgKENg0Id8Ado9M3bZ1TA07mMY3u7xVq+j/DeyOv4Xdog2923OHDU1M23Y0LfpDI630hG
	wYwOlxlmuE7lr96YZPcLxXxgsy2DMtxtOrbxQuMrFwpSPLO678b2OFKwmcdKCrn0n56Wqsba0+qit
	9cl8Yhb6wWrTnEe8x5GLdpf+NjQsMRkyIEomK1j67uO+HdjSmlQZzJ48LgF2Nw6fHbz0RH0EPaXLl
	DzyCBO36eOP8o/kL8q/2H2LgEfJJt55xHBGnQ9sDjgN4eIbjufPmxQ+GbrpyZbn7HBsifl3mURsGQ
	fEqSPk2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYCx-00000004UB2-1tDm;
	Mon, 22 Jun 2026 06:32:35 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbYCt-00000004UAY-2E6d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 06:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Vb
	Fb/6GVKTHYyuv2TspUzd+JHLzdcZvRKyaUrUAD6xA=; b=anxSwA3F/e+LEI4hE7
	rN0jVqIhPUHAUBFDAE26uQ5HJv88/tHlwH+WEopHXhMYgV8ZEmH+bklyqmLxwS4U
	pG1TOhkgbk252wEWP4sZTvKjOqJ+erx46trWbDAjBJVMMHV8je6MrmGRyt7uqGwI
	WYZAmuXhAnr3FHudt0Hdzz618=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wCnHhnU1jhqLVXCFA--.6100S2;
	Mon, 22 Jun 2026 14:31:50 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] cpufreq: apple-soc: Add missing OPP table cleanup on init failure
Date: Mon, 22 Jun 2026 14:31:48 +0800
Message-Id: <20260622063148.751787-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnHhnU1jhqLVXCFA--.6100S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Wr4xZrWfXF18tw47GF4kWFg_yoW8JF1rpF
	W5Way5Cr95tFs2qws8AF40g3W7tw1Du3y2g3W7Gwsavw1DZF1Fqa4kGFyj9F95CrZ5JF43
	Aryrtay7Za18JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piyE_tUUUUU=
X-Originating-IP: [240e:604:311:e68d:9586:9dd0:bd4b:6902]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxhaTAmo41tYS+QAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_233232_066030_6FCB982E 
X-CRM114-Status: UNSURE (   9.67  )
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

apple_soc_cpufreq_init() adds the OPP table with
dev_pm_opp_of_add_table(), but some later error
paths can return without removing it.

Add the missing dev_pm_opp_of_remove_table() call
to clean up the OPP table on init failure.

Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 9396034167e5..4dae968e84df 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -260,7 +260,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	ret = apple_soc_cpufreq_find_cluster(policy, &reg_base, &info);
 	if (ret) {
 		dev_err(cpu_dev, "%s: failed to get cluster info: %d\n", __func__, ret);
-		return ret;
+		goto out_remove_table;
 	}
 
 	ret = dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
@@ -326,6 +326,8 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 out_iounmap:
 	iounmap(reg_base);
+out_remove_table:
+	dev_pm_opp_of_remove_table(cpu_dev);
 	return ret;
 }
 
-- 
2.25.1


