Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2575C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkKcOyZICo08l5q0F5dJW8wCAI/JQBA7W4IQh7k1JQM=; b=x5sMTfZrPzhq2pUKNrNyJLkuc8
	Wdlh+W4xL5Tp2ElhHEWcvLyjlngG3w8M8Qo6G1zmVbPdLyM1qNnaNbFDSH4ITB5n2yMs05PPs6PKj
	cNbJRsQDTa6ReSUEHriaK6sAsGvO3tPY3XzmZx8m6x3ZBfPjl0Wdj/12tYKF/yZGDY80zaN+HGVuy
	pr61DWmLkU/vE8ZPuoL18FWgSyUG5XcNg9f4kZPTEZJp68tDfrneDLMbRI0aae037ipklQAJkV4kr
	PDWfRmPgMOpnyy9XHY0ZMqur3nWMohmfmmaUUe5oNi/JYNRWYnmIJgv0++yoGyBa/yxrZyFSEfsT7
	2X4zENnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcin-0000000C2de-19ns;
	Tue, 14 Jul 2026 12:58:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcij-0000000C2Zz-0Z3v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:58:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B9743404D1;
	Tue, 14 Jul 2026 12:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165DA1F00A3F;
	Tue, 14 Jul 2026 12:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784033924;
	bh=hkKcOyZICo08l5q0F5dJW8wCAI/JQBA7W4IQh7k1JQM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Xfg17pOCKH58qm9QOQp3s/D113V6sEVUxJZ6+29T43uNYoNmOCrRsUAwCOUBFPCkp
	 arVTHe95z5hFReyp2+agYWTPNUN4NQrQP/0It9KOjjtE48NNOuH7VlOyfw/hKp8fYf
	 gRH/rlt7YEl3PIGlPKBKrg0GvtzniOAUGid9O+maO8z8i3QXSfY0w5EXAqqDvb18X0
	 6mxw3l9iFWmvrs7oNXht1U0lx7IndAuHMkTEHXYDUDJ263zGxamkNsc6KgJCWE9/o2
	 JX4VVrVt5iFMvuMJEk9iJvOmYG2ZNNQaqycO/MWQWcb3IyQ9IoFQPneMLIYnAVrn+p
	 24yGKCNKYsjKA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 14 Jul 2026 13:56:26 +0100
Subject: [PATCH v6 07/16] firmware: arm_scmi: Reject out of range DT
 protocol IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-scmi_core_fixes-v6-7-3afe499d46e3@kernel.org>
References: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
In-Reply-To: <20260714-scmi_core_fixes-v6-0-3afe499d46e3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

SCMI protocol IDs carried in message headers are limited by
MSG_PROTOCOL_ID_MASK. The DT parsing paths noticed protocol IDs
outside that range, but only logged an error and then kept processing
the invalid value.

That lets a malformed 32-bit DT reg value reach helpers which take a u8
protocol ID, where it can be truncated and/or treated as a different
protocol.

For channel setup, two different out-of-range values can also be used as
distinct IDR keys while aliasing the generated SCMI protocol identity.

Skip DT protocol nodes whose reg value does not fit the SCMI protocol ID
field before setting up channels or creating protocol devices.

Fixes: 05a2801d8b90 ("firmware: arm_scmi: Use dedicated devices to initialize channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d17559c897a9..0735c6374269 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2873,9 +2873,11 @@ static int scmi_channels_setup(struct scmi_info *info)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(info->dev,
 				"Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		ret = scmi_txrx_setup(info, child, prot_id);
 		if (ret)
@@ -3339,8 +3341,10 @@ static int scmi_probe(struct platform_device *pdev)
 		if (of_property_read_u32(child, "reg", &prot_id))
 			continue;
 
-		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id))
+		if (!FIELD_FIT(MSG_PROTOCOL_ID_MASK, prot_id)) {
 			dev_err(dev, "Out of range protocol %d\n", prot_id);
+			continue;
+		}
 
 		if (!scmi_is_protocol_implemented(handle, prot_id)) {
 			dev_err(dev, "SCMI protocol %d not implemented\n",

-- 
2.43.0


