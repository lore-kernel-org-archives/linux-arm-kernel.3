Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEDF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xHFfphqO;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=npeyzLan
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/34PRy7IZamTfvrfBz2SgNlJeG8xvFiKY+9NW4j4T8k=; b=xHFfphqOgeeEGMyWpFDA4CUOAV
	UGYqKpwYFW0FJR8pDqfMpN4o2uPbhiaW/itqBNOXPvWiuQMK1f2lM5BgihCkZ655QThCLyoq20ATl
	N72bUk1yjd8sldXG3uYGeKPNNhNcCqebrSGQ6bSVlbmZ5B/bUkfRE50JY+va3pomoJuIrjPWq95g9
	YgaWRol7bnYD4T92TFesYw2s5azUCIZoJejHYDqxpmynwBPo5ZUDOzHAHIni3pR62bXvWej4KvJo0
	9CKW2wdPWT6sF/zqj3KA51vbY8KijoP+V1pYonwACpsNSsArc6PO54wHvJTUdmRZeGatWtvSCtOfW
	szyceTUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIMF-00000002IiR-3TFZ;
	Mon, 26 Oct 2026 10:55:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLIME-00000002IiK-43aJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 10:55:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6555143AD2;
	Mon, 26 Oct 2026 10:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790A41F01828;
	Mon, 26 Oct 2026 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012114;
	bh=/34PRy7IZamTfvrfBz2SgNlJeG8xvFiKY+9NW4j4T8k=;
	h=From:To:Cc:Subject:Date;
	b=npeyzLanlMaE4+dFPlPllLN0ki3hZb+RfYbqGtd1kqL8Vme5X7HtPm2C1q5Hq+u2Q
	 TfrQVMyPGrRZSiXu8idaQ0MEZFirDkSFYIiA5eTyulmVvyaX1q1V+BC3VOMBUyvCsQ
	 ofEgBmkLA0AMU822onLF6GP+f+a57KuL24O46jCF36Fr023bil45sdZ+pqiN9O+bb8
	 DNTFeKJuYNN0XhX5e04UpqysODIWi+3hRw4gBxCZVcGeZG32MI9JKUkLQpR1uuZnct
	 vXO0vdT1zwkRsNyE7GvWtXdpR6CYdPTfcH+czpCfIZvBkOFOhMFFq7Q0ICHgjkMqdU
	 WN2Wh4tHEQ3zw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH] firmware: arm_scmi: Drop redundant ACPI configuration guard
Date: Mon, 26 Oct 2026 10:55:10 +0000
Message-ID: <20261026105510.1778073-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 98b9bfb659a9 ("ACPI: bus: Use acpi/acpi_bus.h without
CONFIG_ACPI") makes the ACPI bus helpers and their stubs available
through linux/acpi.h for all configurations.

Drop the local CONFIG_ACPI conditional around scmi_acpi_device_hid().
ACPI_COMPANION() returns NULL when ACPI is disabled, so the existing
"unknown" fallback preserves the current behavior.

Fixes: 17b3cdaa7ab4 ("firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 1e6f69b14321..6c6cb7209b13 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3107,11 +3107,7 @@ static void scmi_debugfs_common_cleanup(void *d)
 
 static const char *scmi_acpi_device_hid(struct acpi_device *adev)
 {
-#ifdef CONFIG_ACPI
 	return adev ? acpi_device_hid(adev) : "unknown";
-#else
-	return "unknown";
-#endif
 }
 
 static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
-- 
2.43.0


