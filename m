Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A87FF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37ktmasb681CRyG97WnpidnnCe/DQCpoBfdiqKxdAvw=; b=hBK2qR0snmNOSn14xwGUa9iWsZ
	C3QXvvVpp09aZ55HGFi1A7Hrz+abbZk0hIWJmFT8cmTh3L9sxyTIwI74fkDObSu0WASBTbEYrT9o5
	kkQ1ZdiNEN4Q/g/cz+vKtL9PX6t78B/jelHELZIthXO4By8Bix2gatKbFZGkVBNkwOPdWO45hCCGL
	zde4qA2lwXWSi2PLcA5yPW4lCt8PFYfQzqGalYXIG+5ooczyrKv4b+89p2YISg1n9H4wNF/37JLkK
	1/Wr7utzjKrgQHMcVkHkSXv3iFozuXKUCWNgBc6p/oIcnR3UbYhMw6nWm46D023/W0lNR1JlyLmr5
	W/Q+Unsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHosT-00000002QAj-2qUd;
	Tue, 28 Apr 2026 20:17:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorn-00000002P3j-3Ho5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:17:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 546781C0A;
	Tue, 28 Apr 2026 13:17:05 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10D3E3F763;
	Tue, 28 Apr 2026 13:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407430; bh=6nEFcFhdP808ZVtmXdMcMA3pZOK4Wb1QnGW2QZeFifA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ar26XeqfQe/6RVcliRdSrSnj7NmY5hVXRpqHsifVOXS1jPW9CABFa6omEunngt+Nq
	 JNq0FAv/a97S3Ggrp7XEHuJKtGjsqoreSJ9tsiFIUTiZ5sIhxya4ZHSCsMqZ9Lecbk
	 g/yv+7IQWsLIec9WncInr/I/ZcbY1+8Mctb5fYaE=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 12/15] firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
Date: Tue, 28 Apr 2026 21:15:19 +0100
Message-ID: <20260428201522.903875-13-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_131712_030096_DFA7CE90 
X-CRM114-Status: GOOD (  12.92  )
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

From: Geert Uytterhoeven <geert+renesas@glider.be>

The documentation speaks of the "iter_response_bound_cleanup()" protocol
helper, while the actual helper is called "iter_response_cleanup()".
Settle on the former name, because the helper is only needed when using
bound-iterators.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Cristian: removed Fixed tag referring the same series]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c    | 6 +++---
 drivers/firmware/arm_scmi/protocols.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index fd031a8d40df..57785c0c0424 100644
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
index e2ef604c16ef..15ad5162e37a 100644
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
2.53.0


