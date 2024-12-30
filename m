Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6nymlW42hzlkStlOSGgZYNBJ13oXgXCGZxpAoQxRAQY=; b=KxpmjgCahDKTdLrP//imN9E9vr
	Haspskk3MxTV0kNQ5495w2shZB2wDnHPHPMWHUxwCT347KRs+b0PHgSjLSgS09PNmRPKg+DwN9Wjl
	cY3Syla8uQ5V6/1r4KAwZxM29aNMOBlOc21XDSR0QjUNvYTiBG7XsHqAv6qxv6GRc9ImJp6RyV/KN
	Fu+/DgCuolnMG5fxuWf/YDYdKMQLnK/pu037Oex9cDEs5mH0wipVFZvJm0iRQfDjCFeOEIbPoT6Qw
	uL9nPXjqJbctfssFUotdJwvSoa3qz34998woUwJgIAJ3Hip5FMYGOtZpFYao3xw0XD+H75og/pCOi
	/jpgsoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSCB6-00000004x2p-3DHP;
	Mon, 30 Dec 2024 09:35:12 +0000
Received: from ssh247.corpemail.net ([210.51.61.247])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSC8A-00000004wau-2BnS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:32:12 +0000
Received: from ssh247.corpemail.net
        by ssh247.corpemail.net ((D)) with ASMTP (SSL) id BNL00002;
        Mon, 30 Dec 2024 17:32:02 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201602.home.langchao.com (10.100.2.2) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Dec 2024 17:32:02 +0800
Received: from localhost.localdomain (10.94.16.130) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 30 Dec 2024 17:32:01 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <rafael@kernel.org>,
	<viresh.kumar@linaro.org>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] cpufreq: scpi: Prevent null pointer dereference in scpi_cpufreq_get_rate()
Date: Mon, 30 Dec 2024 17:31:59 +0800
Message-ID: <20241230093159.258813-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.16.130]
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 20241230173202c6988a2345bca3e4352598e577134bd2
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_013210_866440_D2EBDC6C 
X-CRM114-Status: UNSURE (   9.23  )
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

cpufreq_cpu_get_raw() may return NULL if the cpu is not in
policy->cpus cpu mask and it will cause null pointer dereference.
Prevent null pointer dereference in scpi_cpufreq_get_rate().

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/cpufreq/scpi-cpufreq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index cd89c1b9832c..c888ed3a0de9 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -30,6 +30,9 @@ static struct scpi_ops *scpi_ops;
 static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
 	struct scpi_data *priv = policy->driver_data;
 	unsigned long rate = clk_get_rate(priv->clk);
 
-- 
2.31.1


