Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B83CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lOAp+5UR+SK7oAZ3rWSUse+h2e6ToNaMpOEv6uQIYMs=; b=LXCFlzHxA7cpbpaMsKC3rC6ud7
	LXWf/pFiMlwN2eP5tT0xyQG+uyOrFmk1mgaXKGmw1ylVRS6ucVsS3+NvDeaoKbgsnzeyf/bqOlxdk
	4NgyEnXi75c97aq6uFDW8E4Buv5nXybSIAndwb+Y+XlermY/gm4d1mxLBjaELt+8ZACqYKxZO42/K
	7c71g6cO79e/85RQqW1gms4GinGFD+jaxKL+16uT8I4LqAT5srA2e+FamFj4e7rHQFJkPvNREn9f8
	E4vb6JegF80/bi3hcnWPirrVO3s1VqFUmYXmK7kXjmGbY5bPLNXJBGumJDfKIPo0xNgbJiJ+FFjCu
	b3GJGE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aS6-0000000FcWL-3VsV;
	Tue, 14 Oct 2025 08:32:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aS3-0000000FcVa-2btY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:32:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 16B1BC09F84;
	Tue, 14 Oct 2025 08:31:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 130B4606EC;
	Tue, 14 Oct 2025 08:32:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2858102F224B;
	Tue, 14 Oct 2025 10:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760430725; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lOAp+5UR+SK7oAZ3rWSUse+h2e6ToNaMpOEv6uQIYMs=;
	b=kRhb9m4+5/rK0ib7LkwRPXBXX5JbTjywCIc/43t3hP1ekvAL1NlGcABwX0r7CbpK5f+WUx
	EmQGmVLXwdGUEFr+v73EEcGSnibLG9hH7XO8rp0FheSKQLeR6w9tM+gGdY8w6cFpnI/Qar
	twM/oCya+dQJtUtd/oeV8ogLokDKbisWwHXJPzyPO13StgyIAclGaDaTefDs//1qv+lAfH
	Lj3txHXwTv9jjRmyWOXmGmg7P6i3zVcvsZ0Q3QilDoW/EkXSZJ/+kbprNmsDI3t+r9wcm/
	nkwFNrcUOSU1V5tHH+UQpugEK0USIeoneterp6tn8e4JnUpKu1/YNWJMOD0JPQ==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Date: Tue, 14 Oct 2025 10:31:47 +0200
Subject: [PATCH] firmware: ti_sci: set IO Isolation only if the firmware is
 capable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAHIK7mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Nj3ZJM3eLkTN3MfN3M4vycxBKgel0z40SLpOQUyxSTVEsloM6CotS
 0zAqwqdGxtbUAMDH+oWUAAAA=
X-Change-ID: 20251013-ti-sci-io-isolation-63a8bcd9d4e9
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_013212_036617_39E69735 
X-CRM114-Status: GOOD (  11.68  )
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

Add the IO_ISOLATION firmware capability, and set IO Isolation during
suspend only if the firmware is capable.

Fixes: ec24643bdd62 ("firmware: ti_sci: Add system suspend and resume call")
Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 21 +++++++++++++--------
 drivers/firmware/ti_sci.h |  2 ++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 49fd2ae01055d0f425062147422471f0fd49e4bd..8d96a3c12b36a908097805b44dc3343172fbbfec 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3751,9 +3751,11 @@ static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	int ret = 0;
 
-	ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_ENABLE);
-	if (ret)
-		return ret;
+	if (info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION) {
+		ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_ENABLE);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
@@ -3767,9 +3769,11 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
 	u8 pin;
 	u8 mode;
 
-	ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_DISABLE);
-	if (ret)
-		return ret;
+	if (info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION) {
+		ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_DISABLE);
+		if (ret)
+			return ret;
+	}
 
 	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
 	/* Do not fail to resume on error as the wake reason is not critical */
@@ -3928,11 +3932,12 @@ static int ti_sci_probe(struct platform_device *pdev)
 	}
 
 	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s\n",
+	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s\n",
 		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : ""
+		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
+		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : ""
 	);
 
 	ti_sci_setup_ops(info);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 701c416b2e78f8ef20ce6741a88ffa6fd4853b2d..7559cde17b6ccfeeb1bc357fce5c5767c3f75c54 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -149,6 +149,7 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_LPM_PARTIAL_IO: Partial IO in LPM
  *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
  *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
+ *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -160,6 +161,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
 #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
 #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
+#define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-ti-sci-io-isolation-63a8bcd9d4e9

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>


