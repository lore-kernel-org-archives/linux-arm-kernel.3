Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892CAC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YtMpol975CvesO8Q6KUokIqjrd11Vgy1F01PUcLSm7w=; b=QTMmePbcEQrP8T38JZ0sYJ4+IX
	5x1ix5MlSdDf/jFNKiffw7br7N2iZomin6oM+HIsnLYXnwlzLZTkGkPHYWDu8QHhYiaKOaBcfwuKz
	vbcMY6gn+8265TP1qd9ugAe9nRohdYV21ExZAAAoh2cV1+4A9Cag9WV/C2t6RSZ63QkyL1epIeeyK
	v/xxBRMfuYiCDDkx9s0+pUj6LMkWLqHFs21Xcu6ouJVAGL5MgqlQUqAoXpvZ2cLCFEQiytHl672g1
	SPSvwdqenTR+1RS3IgjU7q+gRq1JnfqUI1KVK/J2atvtDF5kpcCMeVMMoqHfka6bqSLZKDtJeQvpA
	H+yhMI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaqu-0000000CTev-1DW2;
	Wed, 22 Jul 2026 17:35:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaqs-0000000CTeG-3iqm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:35:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7848341622;
	Wed, 22 Jul 2026 17:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD641F000E9;
	Wed, 22 Jul 2026 17:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741724;
	bh=YtMpol975CvesO8Q6KUokIqjrd11Vgy1F01PUcLSm7w=;
	h=From:To:Cc:Subject:Date;
	b=bPc/t9w8P+EPgdRNVaaddVA7qtlGOaL0rjdlTn1S1BRLkOAvncUpTrxlJK/1/+cBQ
	 4r2fi+0PMG5QDv50Oqqdhx3hRnhAjhVy3tIg7RcaddcI80Ua2aWjbXENPIfBU7FQFX
	 2LkyWyjEvlewNNIYU7V0Lev3TUu9RkPOUA5aC1w8SEFm5k4p81hBhQLFej3NUlr67D
	 c5Lv27ohXE6ZTifH8YBhh39ka971zR6t2E/6SVSWsaRgMjHwm4XGJJqZM55QJaeh1k
	 eHlfMYP1oZWwV/hRnUt7OgGH1LvxLWqEa3E9600B8V4B2FS5DPCGeVLEStmnkt93do
	 zfhwnxbaiJvTw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 1/2] firmware: arm_scmi: Roll back partial protocol table registration
Date: Wed, 22 Jul 2026 18:35:20 +0100
Message-ID: <20260722173521.2184378-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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

scmi_protocol_table_register() can leave earlier requests registered when
a later entry in the same ID table fails. Each request retains a pointer
to the driver's ID table, so a failed module load can leave a dangling
pointer after the module storage is released.

Unrequest only the successfully registered prefix, in reverse order,
before returning the failure. Leave the failed entry and the remaining
entries untouched because matching requests can be owned by another
driver.

Fixes: 2858f6e5f064 ("firmware: arm_scmi: Add multiple protocols registration support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

Hi,

Couple of more issues[2] reported as part of review of [1]. These
are addressing those issues.

Regards,
Sudeep

[1] https://patch.msgid.link/20260722095250.2011630-1-sudeep.holla@kernel.org
[2] https://sashiko.dev/#/patchset/20260722095250.2011630-1-sudeep.holla@kernel.org

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index df396ab638dd..af3d28717cd2 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -135,17 +135,6 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	return ret;
 }
 
-static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
-{
-	int ret = 0;
-	const struct scmi_device_id *entry;
-
-	for (entry = id_table; entry->name && ret == 0; entry++)
-		ret = scmi_protocol_device_request(entry);
-
-	return ret;
-}
-
 /**
  * scmi_protocol_device_unrequest  - Helper to unrequest a device
  *
@@ -191,6 +180,26 @@ static void scmi_protocol_device_unrequest(const struct scmi_device_id *id_table
 	}
 }
 
+static int scmi_protocol_table_register(const struct scmi_device_id *id_table)
+{
+	const struct scmi_device_id *entry;
+	int ret;
+
+	for (entry = id_table; entry->name; entry++) {
+		ret = scmi_protocol_device_request(entry);
+		if (ret)
+			goto err_unrequest;
+	}
+
+	return 0;
+
+err_unrequest:
+	while (entry != id_table)
+		scmi_protocol_device_unrequest(--entry);
+
+	return ret;
+}
+
 static void
 scmi_protocol_table_unregister(const struct scmi_device_id *id_table)
 {
-- 
2.43.0


