Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337FEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MAMhGQcXRx7cKlxVffpyHtEYp5ldRUfPjumpHdSAoxM=; b=xebQkbCGaIGvPa
	UMTAz7mJf/U5POUngxSryAoYRArtjuaWX85fIZYn7mZ/igKb7qgSz3R0hvhsGwH/Uq3YH9cDnsJ8V
	CfYn2Nhix7OmUUHJlHe3741Qt2F/esB4J8W+Wm4MCkkDCmyRezLAX2wC/jClg2jqCs79gbOrZfm49
	5mXVeo5zaYK1UbY73tY1zgOfjjCvmQjPWS5HNILTvlSps1fjOTbcNUeYUOERsM9dXHFcP/LF/EAwG
	Cg/5DOccbsWF4/ZQYUEi0ZkrMJRmHuvaWL6rL14+G15VNsscOOBlj+ZbJ56rg+vQKAyQrAyrQfw8y
	xMt2W4aJuqhJ96onGVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7ox-00000002Bp3-2j5V;
	Mon, 17 Mar 2025 10:35:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7lD-00000002ASG-2mCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD36C13D5;
	Mon, 17 Mar 2025 03:32:01 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7813F673;
	Mon, 17 Mar 2025 03:31:52 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH v2 0/5] firmware: arm_scmi: Minor cleanups in the scmi bus
 layer
Date: Mon, 17 Mar 2025 10:31:20 +0000
Message-Id: <20250317-b4-scmi_minor_cleanup-v2-0-f4be99bd9864@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPn512cC/4WMQQrCMBAAv1L2bCTZJiV48h8iJd1Gu2ASSTQgJ
 X83+AFPwxxmdig+sy9wGnbIvnLhFLvgYQDaXLx7wWt3QIlGjgrFokWhwHPgmPJMD+/i+ynszRp
 Eu+rREPR24/JK+fPbVtVx+XeoSkhBE9JEi1ZKubPL4UgpwLW19gWkmlv0qAAAAA==
X-Change-ID: 20250312-b4-scmi_minor_cleanup-8f85228d435c
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=IUn41wpwB6Ut021pQ0AAYrXTN0TJ/XChzgyacyEtQ34=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBn1/oXaDGN0xKyCAakLAoBoWCVwZiExl6isfuWO
 OQjILk4GcKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ9f6FwAKCRAAQbq8MX7i
 mClYEACvKqWTyVSt/b39v3moa7E010DqEePFSkO7uiDpd8PlKxTx6DglEENRaXtVBTVawTmx2ZA
 6bNaDfrnSyS1rplH/OPPkamMsGpKb5E8UkpcSkdTRnbXp+YhTJWEX5VJRw+IaGmpaaPI0Ax3F3J
 22ri1p1SIVCp9qPNhx+hdFBmbBVm2aEnGWioJaZqe1q39Mvev6hmWkkWkBBq0UQdHfcFCGsR/Y4
 iIai5nu9EduHuXLLtGiWOHFjqm3RU6fVdZy0GrP3xcrbcz8Dcn/0QwuUJ3ZSc6vWmu7xPXyWoL3
 YBR3xUtDZPrbgHLAmzkA2qPfnYvWhpa88WLbKQ9b+DOrbRQUSD5JXfM+MLK2eJz2zi9jAkEdO2v
 Pmg6ggORd5l9rTJgrsS6ST5M0nqOPGJnaIY6d/YrOnQMbV/aDY2C7cXd+Y6YkwTIeYDIm41QZj6
 K0jP+zxz6eRKlV+jY/oj2AGmJb16ockfUUFIxS3u+mZpUpkdyYBSaO5ugs12rDVW9/qTgqVWrVJ
 LrIlRZiaHYT8eTSn4ztoWwxy+paAJtNdJhozKkB26As5WXcE0bs3ixSkRh2EfCidaYwAGvrCNVH
 8UKFOfFDFiuDKx17KSDp/ki5S/HtO2xuJsoG1qaxZAGvhpbRG+oqr2SZEyyR5XLHr0g336eY793
 i8QxJFCuGMVz7tg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_033155_761410_15D89431 
X-CRM114-Status: UNSURE (   6.72  )
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

These cleanup centralizes error logging for SCMI device creation into a
single helper function, _scmi_device_create(), consolidates the device
matching logic into a single function, and ensures that devices must
have a name for registration, removing support for unnamed devices while
matching the devices and drivers for probing. It ensures the transport
devices are excluded from the bus matching and the correct assignment
of parent device for the arm-scmi platform device created in the
transport drivers.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
Changes in v2:
- Added exclusion of transport devices from bus matching
- Added correct assignment of parent to arm-scmi platform device
- Link to v1: https://lore.kernel.org/r/20250312-b4-scmi_minor_cleanup-v1-0-c62c6cb4111a@arm.com

---
Sudeep Holla (5):
      firmware: arm_scmi: Ensure scmi_devices are always matched by name as well
      firmware: arm_scmi: Refactor device matching logic to eliminate duplication
      firmware: arm_scmi: Refactor error logging from SCMI device creation to single helper
      firmware: arm_scmi: Assign correct parent to arm-scmi platform device
      firmware: arm_scmi: Exclude transport devices from bus matching

 drivers/firmware/arm_scmi/bus.c    | 79 ++++++++++++++++++++------------------
 drivers/firmware/arm_scmi/common.h |  1 +
 drivers/firmware/arm_scmi/driver.c | 13 ++-----
 3 files changed, 46 insertions(+), 47 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250312-b4-scmi_minor_cleanup-8f85228d435c
-- 
Regards,
Sudeep


