Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E94C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 12:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+lP5H+LzvBombhuXBM5RzBwxe3kwbgszNKnST0iCYc=; b=ByxYWmfR4NUfdoUgVAjTREYcgn
	eqieaRBoQD/wohN7b8XOY0I+gnsgUJwZyaVJRfthyCncqRLZH6hW2QS05Hip2dHuNwCFeWWiy3ctm
	KgtNcaTrhEb9Xgk94TOkOvGoj2zRfEa+MBP1xMc55qtJpgRXujU5wBB9aTwDYb7JWauEARneLgnaB
	6HS5/N/ZnKRbw3jX6z8o3J/bG/+lv4712+T2w+VX4I9meNzbrD9Matbyt7Ic6J+GWTg0U0Yr0pQRI
	0oxIiDNbSHurUwU31s7l3fst8PlEctTNOSg07xMTSp8hTd2SuNIwsiEjHEjg8tlQANhoM/beQUkd2
	7yhZR3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9L-00000006xxS-0bhe;
	Fri, 03 Jul 2026 12:37:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfd9G-00000006xq3-3P8O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 12:37:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A291F60;
	Fri,  3 Jul 2026 05:37:33 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F7513F905;
	Fri,  3 Jul 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082258; bh=jvjodvs0U4OgJFMqI3b7Qcmm6ZP6cglCkfubUmLkqB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZzJTiBBcV6IOJsbqFRzVQAouJuw477U5sPXHXtMpd6qVs+nRq98ygipBWEl8csgkH
	 euzNZah3h5RkrS3NSMsqBNfnchWJn3GXRLIIgKIVTAVeKTxTarq0J8T1U//Q5OHKgv
	 6yBMzwQ+Ytqk4kqLuBYn6b3flS9Y7WoOFJhqHF/M=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 18/23] firmware: arm_scmi: Expose per-instance identifier
Date: Fri,  3 Jul 2026 13:35:56 +0100
Message-ID: <20260703123601.381275-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_053738_904973_4B2B1952 
X-CRM114-Status: GOOD (  12.82  )
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

When multiple SCMI instances are configured, the SCMI stack probes and
it is initialized multiple times: one core stack for each defined instance.

Each istance is simply identified internally with a number and such number
is already exposed to the user to name the root of the per-instance debugfs
subtree, if enabled.

Expose such unique identifier to the SCMI drivers so that they can use
that same identifier when in need to name their per-instance resources.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 include/linux/scmi_protocol.h      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d54d155e69a8..619d01523729 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3297,6 +3297,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index c932390b9a09..b90913235225 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1109,6 +1109,10 @@ struct scmi_notify_ops {
 /**
  * struct scmi_handle - Handle returned to ARM SCMI clients for usage.
  *
+ * @id: A unique positive natural integer identifying the SCMI Instance
+ *	associated with this handle to be used across all drivers for
+ *	naming purposes: same identifier used internally as the root for
+ *	the debugfs per-instance tree.
  * @dev: pointer to the SCMI device
  * @version: pointer to the structure containing SCMI version information
  * @devm_protocol_acquire: devres managed method to get hold of a protocol,
@@ -1135,6 +1139,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0


