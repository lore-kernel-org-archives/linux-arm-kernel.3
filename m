Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c36IJ1pp;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mv0Sh4VD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PA/fmPJB+1WcJ0F4ZZpw0PCjAYENlo82bBuzNSOQBGg=; b=c36IJ1ppgdxKVS
	g2YF2rYS+PgD8GFBGsPuv+PDwYJ+p1HSl1JS+ZTvfwNm4tScQgtcFg0xCzqEWO5g1aMfjsLKz4ADl
	oqq6EudHP+Ix3Hk6uEnNa7qNKbCJDtXV5gpZOJTtAVpkFy8as3w8RX/lysomWczNZBcY91ucjoDAt
	p0vCflMTYxQ3HKxq0Yc8o67i0OYAseMoETtSyTzgYn82wpguQ3A+ZsssNq1wG9ILXsu3DJlCgKcP4
	/oxjAzLM9qNJMwfi+yYXjTMnVils7M1aFf8M+8yz06CUWg3vUf739lFtxf2nAWNz8ywUdHAb46oQ3
	W/TbWZuZ7PW4Bw6cXa5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3L9-000000070iB-3e6O;
	Wed, 28 Oct 2026 13:05:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3L3-000000070fU-3tdp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 13:05:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EED243D6C;
	Wed, 28 Oct 2026 13:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590981F01828;
	Wed, 28 Oct 2026 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192709;
	bh=PA/fmPJB+1WcJ0F4ZZpw0PCjAYENlo82bBuzNSOQBGg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Mv0Sh4VD19aKmjXJVfg+X71t0b4ob8egYaLzKcQI+nnfdMyUP6fN4/C4YEUL2YPGs
	 ps1+0JljDCJUuycdT3RuPdD7HcEBfQINA9civk/rNSlMFvdHGXZcCUSSYXzdhhWNRW
	 ya6woYfThDavbBh4deMAl++/040XyE3hGHFBNUBQJIi3kCxXwbE9kbPLq/CR7q7OQa
	 xX2XonzLcSXp5CHtFFvFlCDLr8UPHHZyEWy+FCx7Qm6WoWrqQ9mrJG4d44b34jSb2v
	 rAdZkAuBg5Cxypax8/42OTTInIzXl5lzP1XxjGh4EjRUoNqCPd9FuQWKACCdufKt2i
	 hiclUdQNaTUwg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control response size
Date: Wed, 28 Oct 2026 13:05:01 +0000
Message-ID: <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028130502.2999676-1-sudeep.holla@kernel.org>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

scmi_imx_misc_ctrl_get() uses @num to report the number of
values returned by firmware, but it did not retain the caller's value
as the capacity of @val.

A response with more values than the caller allocated was copied into
@val unchecked. For example, the MQS regmap callback supplies storage
for one value. Retain the input capacity and reject responses exceeding
it before copying, then update @num only after a successful copy.

Document the in/out @num contract of the exported helper.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c  | 16 ++++++++++++----
 include/linux/firmware/imx/sm.h                  |  6 ++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 0c708b2dd496..f00f7acba845 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -273,10 +273,16 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
 {
 	struct scmi_imx_misc_ctrl_get_out *out;
 	struct scmi_xfer *t;
+	u32 num_values, max_values;
 	int ret, i;
 	int max_msg_size = ph->hops->get_max_msg_size(ph);
 	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
 
+	if (!num || !val || !*num)
+		return -EINVAL;
+
+	max_values = *num;
+
 	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
 	if (ret)
 		return ret;
@@ -290,16 +296,18 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
 		out = t->rx.buf;
-		*num = le32_to_cpu(out->num);
+		num_values = le32_to_cpu(out->num);
 
-		if (*num >= max_num ||
-		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
+		if (num_values > max_values || num_values >= max_num ||
+		    num_values * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
 			ph->xops->xfer_put(ph, t);
 			return -EINVAL;
 		}
 
-		for (i = 0; i < *num; i++)
+		for (i = 0; i < num_values; i++)
 			val[i] = le32_to_cpu(out->val[i]);
+
+		*num = num_values;
 	}
 
 	ph->xops->xfer_put(ph, t);
diff --git a/include/linux/firmware/imx/sm.h b/include/linux/firmware/imx/sm.h
index ba5d93bd6158..0aec7da0ae78 100644
--- a/include/linux/firmware/imx/sm.h
+++ b/include/linux/firmware/imx/sm.h
@@ -29,6 +29,12 @@
 #define SCMI_IMX952_CTRL_BYPASS_AUDMIX	8U      /* WAKE AUDMIX */
 
 #if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
+/**
+ * scmi_imx_misc_ctrl_get() - Read an i.MX MISC control
+ * @id: Control identifier
+ * @num: On entry, capacity of @val in words; on return, words read
+ * @val: Buffer for the control value
+ */
 int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
 int scmi_imx_misc_ctrl_set(u32 id, u32 val);
 #else
-- 
2.43.0


