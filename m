Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0137BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYaNQ0DxwlfFsYM4BOfM47oOjefNzM2WJRcEmS9pkWA=; b=LKAEwnOQxFFVy3EHBwwsZpL+6u
	aLnVua8R27cmO8lCqz8kP78cwnDgtwXPaI2iYyIaxvScQiFsAPM+K0VRVJjTyyYuDoZaNyScyYfZZ
	+MCw3BOEPTRpzKopJmHyvMJiwXPmqYAFXYUi/DcBU7glJqVFICEvEd6A8566uEjchA6Ekqsgt+TS3
	HSDoyeXxSTmFMLZ3W694RvWr7KLhEYpaScYw95R3MkXgf3mm3RSj4PYutUPkwI50+B77fzM/TLiD0
	WQzA4wh0p9NES6iur/RyqP4GDYAFqUWKrk+oMRSwxLMNaM7cFujMQQEoflaqbYZ6RkbMmtbxq7gTr
	a3/ud2Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX0-00000001etH-3caE;
	Thu, 09 Jul 2026 08:54:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVF-00000001aXt-1ZLm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18E35418FE;
	Thu,  9 Jul 2026 08:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2CA1F000E9;
	Thu,  9 Jul 2026 08:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587185;
	bh=WYaNQ0DxwlfFsYM4BOfM47oOjefNzM2WJRcEmS9pkWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ELt2Z3c7ElnOvs51pPSUZ4XYDKwAj+7wrPKe5+Cf+9+EJJeImuN+Izp7z6WMGOOzL
	 KHbfkgF2rWl1jOy4PEH0j9jyP8kITg4z0NngtJWKAkw0x4CL0Sz5r6dROmvHWrUqcL
	 znaF2Mj9n1AheFhTLuvvvRnbOoSiU3Ic+MMgwwsv9oNbvDWrg0HEkOUM0grl3FyBBQ
	 OyNopfwYANQo5L3RiPkhhR6gcgoWjGTDsDprxWDBw4vUZDMYr22sFX2GmEwgqn9bNQ
	 R9k17kUAzOLDEoq7RprtRMp55EdNlExInC9rm4j0gke83M/p1qaBlJ86P2DM5FbEOg
	 CrSQOEFMZRUbg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:30 +0100
Subject: [PATCH v5 06/16] firmware: arm_scmi: Reject out of range DT
 protocol IDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-6-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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
index ad4587d75a08..81939309ce7e 100644
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


