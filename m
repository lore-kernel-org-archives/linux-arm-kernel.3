Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EAC9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FD/NU7GMm4Zv7S8veQFrmWmOgLAG1xEI2EsNyDH4suY=; b=UptxWMwcy4WC7zAz14bGmpTRIA
	UUN9LDlj3ObkEsVdXRf3lJNYWo4ftpVlZD4iEfpJ/CtByzltlvd9Hp2vhuaeZEnl5sg28YXkB0FLp
	2as2kb2e4d39VQyMBXySRzXxRs53zK+2YxxU9C93W+NtS+WpRvQPPHWr5B0V3b9d56/34FZxXj9Ux
	ZAlgHimPKPBx1M9Vt1rFhL4VSdIrG1Hhhlu9rfQhXH3ECwIg1p0r/4Xw8yqhkMi5pODmWm/Vrv/2w
	xx1S0OUU59mNS7sNUsrXNb3Kn9i1nAsbCclzEO+TNn0/jGkUNsbpwX7GDmUEjO4oBU5EoiprmcFy8
	Dp8Tf6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBo-00000002bGX-03o4;
	Wed, 01 Jul 2026 16:53:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBk-00000002b9N-1tlL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:53:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 34D944013E;
	Wed,  1 Jul 2026 16:53:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843CF1F00A3A;
	Wed,  1 Jul 2026 16:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782924808;
	bh=FD/NU7GMm4Zv7S8veQFrmWmOgLAG1xEI2EsNyDH4suY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gewQFgd9EqTjsnKYmsow7dg2LZO13Qt3pj+0WPDLrHsyBRgWoo/eFp76FZ2Gi+9Aa
	 sQSHKV+IS6ICHSDSuKQUJSczrVSD3eWaXfUwuA1+NxSA2gj9PE0tGbMbUiSLMZqUwN
	 QyVUSbKjD+Hl9ZxP/q1hYS9b9xfTr2yuoamjfsrn+Ru1d2sCUvlhaI4OMiZOleZSqT
	 8GidHQIIXttjvpS6d6nouGeMgLQLFWKrThtg1UWSZ9is8v/zZnsLGYV2E5vRE8dXWg
	 0fTUvH17/8PdFGtzal0yu8xR+qdrQF/zhgxlJkT4G44wtyD081jmy8ZdrNQAJMSvk7
	 21lj8LxkpHwhw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 01 Jul 2026 17:52:33 +0100
Subject: [PATCH v2 12/14] firmware: arm_scmi: Reject out of range DT
 protocol IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-scmi_core_fixes-v2-12-1f5e85553f73@kernel.org>
References: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
In-Reply-To: <20260701-scmi_core_fixes-v2-0-1f5e85553f73@kernel.org>
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
index ae4b7128276b..f515b192c1bd 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2874,9 +2874,11 @@ static int scmi_channels_setup(struct scmi_info *info)
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
@@ -3341,8 +3343,10 @@ static int scmi_probe(struct platform_device *pdev)
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


