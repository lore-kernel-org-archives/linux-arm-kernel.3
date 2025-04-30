Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ACC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QlA0vDaPKeclOPJ7FtRUlOTmr6DtJm3UtUjzHSmGgXk=; b=AxF8UmsMCDLRQ4w8LcrYS36W0v
	JQWMovko4ovPe+rTkWeGGJHca6T/hMCEAqGkvkC0FjvKPdzB3B0h+cCwHTnPpChvaHT/1XmR+OaLL
	UgZ7jxGJxRdhThBLNALACMUFXUvdNdFMQ14LXf4D4KjieIqwFH2sciQ4Yo7AbfQyzoUaRTgjA9MMU
	J6Gf218lHGQtmluYBZEoklzniuKBn4mwOWAIirxQkfD8LxhkU/p8O3XaHuhyks5xrItGnkIK9JYoz
	GpHE5dMEoj2Aud5kZE+/h1zTrbgvtmnzsVQswrRE0c4/nbbxUmbo0+bfVSTsuSLH5taV2IDT/V2vH
	/TQX5kMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7wj-0000000D3pC-1U9m;
	Wed, 30 Apr 2025 13:57:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA7r1-0000000D36j-1PiE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 13:52:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 85E5468409;
	Wed, 30 Apr 2025 13:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 260B7C4CEEB;
	Wed, 30 Apr 2025 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746021122;
	bh=xf1uFp/EVSDzohAXpVq0ni+m7CYH2QXJJpG3H9J9ivg=;
	h=From:To:Cc:Subject:Date:From;
	b=FDrZ5ylVhgyEL2WIZLvXJRJH+61d9KI0jJI03lZum2EuNfKXzS610Xq0f4/u/gMe2
	 tXMBZVomy6mEmBEVXIqOqEOzWIMTe/2H6/a+LyMNU5AhW7nFAZmy9ySN1zPH8Dcuy+
	 OQD0dHPHIBDEwvoBkK5XtFLiqoGGHg9jhw5NsKPK9sa9SVLy7MBHY7lTuR17JwVpZn
	 4XTUoYBCv7QIZ3NfWdaQ9+J6G9MTXPz17fZoZzuRKXUEZyQuD7e63xuaiE026fk38w
	 dYU7Idi8aZMUIfUxLu8CoMAwOKCMiIWtrPupaMCobbh7HHOxNNtNw7ZYcuxSusjUil
	 y7qhhXi7Oci4g==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uA7r3-000000001Lh-2fnM;
	Wed, 30 Apr 2025 15:52:05 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] firmware: arm_scmi: quirk: force perf level get fastchannel
Date: Wed, 30 Apr 2025 15:51:46 +0200
Message-ID: <20250430135146.5154-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Qualcomm SCP firmware in X1E machines like the Lenovo ThinkPad T14s
does not set the FastChannel supported attribute bit for PERF_LEVEL_GET
but crashes when falling back to regular messaging.

Use the new SCMI quirk framework to force FastChannel initialisation for
this implementation.

Note that we can add an upper bound on the version matching when we
learn which version has a fix (or limit matching using a SoC compatible
string in the unlikely event that always enabling FC causes trouble
somewhere).

Link: https://lore.kernel.org/lkml/Z4Dt8E7C6upVtEGV@hovoldconsulting.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

This one depends on the new SCMI quirk framework:

	https://lore.kernel.org/lkml/20250429141108.406045-1-cristian.marussi@arm.com/	

Johan


 drivers/firmware/arm_scmi/driver.c | 8 ++++++++
 drivers/firmware/arm_scmi/quirks.c | 2 ++
 drivers/firmware/arm_scmi/quirks.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 6a18670ea261..eb6bec39c02d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1900,6 +1900,13 @@ struct scmi_msg_resp_desc_fc {
 	__le32 db_preserve_hmask;
 };
 
+#define QUIRK_PERF_FC_FORCE						\
+	({								\
+		if (pi->proto->id == SCMI_PROTOCOL_PERF &&		\
+		    message_id == 0x8 /* PERF_LEVEL_GET */)		\
+			attributes |= BIT(0);				\
+	})
+
 static void
 scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 			     u8 describe_id, u32 message_id, u32 valid_size,
@@ -1920,6 +1927,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
 
 	/* Check if the MSG_ID supports fastchannel */
 	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
+	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);
 	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
 		dev_dbg(ph->dev,
 			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 120ac933ed2e..48bf45b8bcf9 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -168,6 +168,7 @@ struct scmi_quirk {
 
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
+DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 
 /*
  * Quirks Pointers Array
@@ -177,6 +178,7 @@ DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
+	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 7fdc496c94c7..a71fde85a527 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -47,5 +47,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.49.0


