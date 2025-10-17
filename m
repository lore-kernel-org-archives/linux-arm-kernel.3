Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B72CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOY0HlZua3GidJxnHggJk6iRCxBwJVFjZRBfILYXvSY=; b=bPaUhvKSiuLk9fhD1GSTFPJaKs
	hNzJPDkXhdaug2A0YehY19fWCLj57fxLrkoMfuETByf2+6iwJ7XfR3XTcdkmPhcoz8XkFH/dHvffT
	Istl6a+ix5MRwMGbrKxfbIVLipiHJ5O+Hy0lDDLzbanuDhSS8yEIFo6O2+vy9choKzG8Sd5HVnspP
	Z35YS9EXYwBbv2hhvHjwvmQGtRBdynSWsCVxyawWCsYOTloe80lSa1ek0hO54Tb9Gm4c0Au2Wn6rL
	cJAj05ZZANW63XGyJbv5DbZfXRrmOeRuCNabrY5bciDIbe0oriqPPE0KfneDIr+fsJkwufPL70NwA
	9p8moocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRR-00000007uRu-1fTk;
	Fri, 17 Oct 2025 13:24:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRN-00000007uPs-3Tew
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 13:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=sOY0HlZua3GidJxnHggJk6iRCxBwJVFjZRBfILYXvSY=; b=MoHVeTa4IUQGrEvyOzq9r7yWlP
	M0QPLhynlSoJoQ08V8ndTOGNcKxN48tCdj9tif8zAi27+qFIjMxwX7/f6SnCBEroWD+gQrcbv4UH7
	VsU3EvoJlWWW4+DKko4R4R2tpClbk7ZAwmzk47rXD1aL6kEvOAWsBo3qOkOg6Mu+n/BErRwkYuSlG
	U6MtoDZ9UTyiopiQrd8jecbpVdbY1WELj9xLNrUoPq04Gp68i4M/QLXMQDuwwGrk9YUXaqT7AMvfI
	eCYpfgA9/ZFqZXmr+eHD7Ch+eifZCMjzX/LHdQKbCXvkShV3o57y1rZ1N+CptkGKObq+dfWTVumqX
	xJdYFQqQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRL-00000007c0b-0DjG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:24:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4995C1C2B;
	Fri, 17 Oct 2025 06:24:06 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7928E3F66E;
	Fri, 17 Oct 2025 06:24:13 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:47 +0100
Subject: [PATCH 4/8] firmware: arm_scmi: Fall back to ACPI HID when
 "compatible" is absent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-acpi_scmi_pcc-v1-4-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_142415_330441_723912FA 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

scmi_debugfs_common_setup() previously called fwnode_property_read_string()
without checking its return value, which could leave c_ptr uninitialized
and lead to kstrdup() on garbage.

Handle the failure case and use the ACPI HID via acpi_device_hid()
using ACPI_COMPANION(dev) as a fallback for ACPI-described systems.
This ensures dbg->type is either a valid string or we hit the existing
error path cleanly.

This improves robustness on non-DT platforms where "compatible" is not
present.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index bc5fea11b5db..148b9a13d43f 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2988,8 +2988,9 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
 		return NULL;
 	}
 
-	fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
-				    &c_ptr);
+	if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
+					&c_ptr))
+		c_ptr = acpi_device_hid(ACPI_COMPANION(info->dev)) ?: "unknown";
 	dbg->type = kstrdup(c_ptr, GFP_KERNEL);
 	if (!dbg->type) {
 		kfree(dbg->name);

-- 
2.34.1


