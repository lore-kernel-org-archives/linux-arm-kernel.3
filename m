Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F5EF483D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=suomFByABbSYF62aoNn7vrWrvWnPTF5tSrxzNimZW4A=; b=KGNHa/ZQ8gz9NoPyLB/865Iau3
	sgwhWbD9d9wSSD95Wt40EGSlUeFNqPzpBFDRvXSOoCR/T9b4fGR8hRfK0M9XOdhP05xLxqFcCGdOO
	NoxVVGoa0bwxzOgDhcH8fAv2T8g+f0XXefgmOUN7IhikPL7CMUaVlsjt1eOhkvguE4QHq5ULsR/n+
	6XFUjPgUykzFlLyuF88RPJvYz9y9vosACdxleIzdmrsaK+eqUePsRYbvq50zchzNUkofT3tViOsIU
	Yh1jrvA35gqrUYzHJn2Chf+GEAyU9YqPfniFkb3gyni61u3ISw8VE2WINnpeHlSXwCThOTGGUN9+N
	JWl3+/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZm-0000000HBDE-3wFi;
	Mon, 23 Mar 2026 16:56:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iZk-0000000HBBf-1E4M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 029E14433A;
	Mon, 23 Mar 2026 16:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFF9C2BC9E;
	Mon, 23 Mar 2026 16:56:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
Date: Mon, 23 Mar 2026 17:56:12 +0100
Message-ID: <fab03f9edfad16c8bba8072874055d1872919498.1774283748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774283748.git.geert+renesas@glider.be>
References: <cover.1774283748.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095624_360593_A561776C 
X-CRM114-Status: GOOD (  13.67  )
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

The documentation speaks of the "iter_response_bound_cleanup()" protocol
helper, while the actual helper is called "iter_response_cleanup()".
Settle on the former name, because the helper is only needed when using
bound-iterators.

Fixes: 13289addf5a52e1f ("firmware: arm_scmi: Add bound iterators support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/clock.c     | 2 +-
 drivers/firmware/arm_scmi/driver.c    | 6 +++---
 drivers/firmware/arm_scmi/protocols.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 623dbc2f1e09303d..0205b37d219a88ed 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -604,7 +604,7 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	}
 
 out:
-	ph->hops->iter_response_cleanup(iter);
+	ph->hops->iter_response_bound_cleanup(iter);
 
 	return ret;
 }
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 03fd7caa8b42a12c..bfcc3e3c931dc9cc 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1875,7 +1875,7 @@ static int __scmi_iterator_run(void *iter, unsigned int *start, unsigned int *en
 	return 0;
 }
 
-static void scmi_iterator_cleanup(void *iter)
+static void scmi_iterator_bound_cleanup(void *iter)
 {
 	struct scmi_iterator *i = iter;
 
@@ -1888,7 +1888,7 @@ static int scmi_iterator_run(void *iter)
 	int ret;
 
 	ret = __scmi_iterator_run(iter, NULL, NULL);
-	scmi_iterator_cleanup(iter);
+	scmi_iterator_bound_cleanup(iter);
 
 	return ret;
 }
@@ -2078,7 +2078,7 @@ static const struct scmi_proto_helpers_ops helpers_ops = {
 	.iter_response_init = scmi_iterator_init,
 	.iter_response_run = scmi_iterator_run,
 	.iter_response_run_bound = scmi_iterator_run_bound,
-	.iter_response_cleanup = scmi_iterator_cleanup,
+	.iter_response_bound_cleanup = scmi_iterator_bound_cleanup,
 	.protocol_msg_check = scmi_protocol_msg_check,
 	.fastchannel_init = scmi_common_fastchannel_init,
 	.fastchannel_db_ring = scmi_common_fastchannel_db_ring,
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index e2ef604c16ef6771..15ad5162e37a90ec 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -286,7 +286,7 @@ struct scmi_proto_helpers_ops {
 	int (*iter_response_run)(void *iter);
 	int (*iter_response_run_bound)(void *iter,
 				       unsigned int *start, unsigned int *end);
-	void (*iter_response_cleanup)(void *iter);
+	void (*iter_response_bound_cleanup)(void *iter);
 	int (*protocol_msg_check)(const struct scmi_protocol_handle *ph,
 				  u32 message_id, u32 *attributes);
 	void (*fastchannel_init)(const struct scmi_protocol_handle *ph,
-- 
2.43.0


