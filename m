Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89919CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQI5QQ8BZR8u3xmMC3CUk/nKikH0Qel8i3PONv5lm4w=; b=ZK1GWtvSB9WmMvTGj4br870Xae
	3aDBfyAjp1YGzD7Qm1UMjbWp7MfEasX73VbhiDPI0CbRL89G3UBvF0zPUOd3Oi6TUw19hia0sA2we
	r73iKuXOQBYq7HtcLdK91Sh1QCe5ts//KyPBuaehHRFdtjU9mqT8dKr2PL1BKhUYQqw3GkZ9que/E
	3XyukcfQat99id1Wfgn61UDNwqK2Q8y0MlRAN5XU4UG3mfHsJh7xL9RsA/gAtyhzjrs8ltl7pgZwZ
	ZrDNyrcjdB1rFD+3Cm63+xGS2U3kMSL25DSvfnh+VwB9GVfB598zU8s+23dmRCSnDufrhEXvGd9Bx
	HD82Mg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dCQ-00000009wJr-1Qa7;
	Mon, 22 Sep 2025 09:51:10 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139] helo=cmccmta3.chinamobile.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dCK-00000009wIz-1DRP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 09:51:09 +0000
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee968d11c04268-3331d;
	Mon, 22 Sep 2025 17:51:00 +0800 (CST)
X-RM-TRANSID: 2ee968d11c04268-3331d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee368d11c021c8-9f99b;
	Mon, 22 Sep 2025 17:51:00 +0800 (CST)
X-RM-TRANSID: 2ee368d11c021c8-9f99b
From: liujing <liujing@cmss.chinamobile.com>
To: john.g.garry@oracle.com
Cc: will@kernel.org,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	suzuki.poulose@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liujing <liujing@cmss.chinamobile.com>
Subject: [PATCH] perf sample: Fix the wrong format specifier
Date: Mon, 22 Sep 2025 17:50:57 +0800
Message-Id: <20250922095057.3136-1-liujing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_025104_880909_D6511796 
X-CRM114-Status: UNSURE (   8.86  )
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

In the file tools/perf/util/cs-etm.c, queue_nr is of type unsigned
int and should be printed with %u.

Signed-off-by: liujing <liujing@cmss.chinamobile.com>
---
 tools/perf/util/cs-etm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index 30f4bb3e7fa3..d13575285b19 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -777,7 +777,7 @@ static void cs_etm__packet_dump(const char *pkt_string, void *data)
 	char queue_nr[64];
 
 	if (verbose)
-		snprintf(queue_nr, sizeof(queue_nr), "Qnr:%d; ", etmq->queue_nr);
+		snprintf(queue_nr, sizeof(queue_nr), "Qnr:%u; ", etmq->queue_nr);
 	else
 		queue_nr[0] = '\0';
 
-- 
2.27.0




