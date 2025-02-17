Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E1BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oEYFSUCFe1XHtjsO3bK+GVD/JoxfCJBrcyddlpVWZg=; b=M96cUNl8WaDv18kUiBR7jbahm7
	Fl42jVDAaXD7r/gXjGrwe1YCPaIe9pzf0rntf0LfDRiFQaIdvZZuOrA4N3r6RCRmkO8q/0juuzwkK
	1W/z+L6wnfqMKg9ijfDLhGMvduFB62Wd4MFm/kkhodha9Lqhq8Xruz4BAatwErJUNpnlQghvZ2Xse
	PN5suPfCU+1Loylp987baC/SEX8uioHbIesCGqocowmZhXwGC6+EayZCCU+W9xZvepqt2rE2r6VDL
	e3BqEixbW0ymuOvRWaXIcbdtbv5WpK1fS2aTVnGjzNKmA8U6qo7D0DmEOqWs2Wll4WuysWSDHJ8zL
	lBi55zVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3cj-00000005CMk-46zu;
	Mon, 17 Feb 2025 16:05:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Dh-000000055Y5-1OK8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 542F61692;
	Mon, 17 Feb 2025 07:40:00 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 703B63F6A8;
	Mon, 17 Feb 2025 07:39:40 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:53 +0000
Subject: [PATCH v3 12/19] firmware: arm_ffa: Reject higher major version as
 incompatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-12-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1654; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=hUYLqZtlRI6Y6zWVPccEHPCN6XfeE5xkOBosV7oWkjw=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gvPBXUm+PU5UaWOx8OeaNF2Sib2Z4JpmBpW
 YHmcXla4vyJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLwAKCRAAQbq8MX7i
 mHtID/42BE/x0L0hVj8+T1jkTQJeIPYpa2lZbI2IUchyI9APrySzXzTdsoGWa0Ybkf9LEt0wOI5
 mW7qVAaxN4tTOPNpP+a7TvyMI/6J6ZDjA57obCdIeG2IvMaMivhpEjKNEPjiwxiNnTe56eyZmOC
 LOCuF76kcXILynWZrA/w68GonydunUrDqxU3mVuegw8E988ew4VNE5UIBeEAyaqM+10EqxlL9FU
 GKbu4TCJqpME7blSpbCpFAiZb4cFF+Pb9ES+T+xgN7MY0dbX6VIuZjmAP98VJ7oXYTQ2SX+jrRH
 usJnh0s/9GfMxGXE81z5GXCssmqjVTFq0pZpUNs+rtG+AyrNhweW3BgpqoWaQBu4bgYC0nzk6XJ
 jL4Xv6vX2/8gN/J3PI4werouYzfNxOfjgWoCmFHECW5LP34LvdHunOXVhwEbAO7EqOIDMgayVoy
 26FYt4Tpu9J2h3WE/qFaZ+Aa074W0fL7Rz01yYoT7SRX+YV6bswsXkMdAr60++izvw67FJwE7aS
 +MvuyeF+sz+gnLSm3zlE0C15ZiYrObOPGJo0cPd285MAQHXX7aO+UeJVePvFy0tox0MZgQgy1zH
 NMNrxEHhVAnYaZb+4PQ8kw9boSB3jpPvHLSrahZn7kuYvuRzl1aAniq7AT8++PtWzKeboKK/EHh
 LJXYECxMv6cXqpA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073941_428508_46D04321 
X-CRM114-Status: UNSURE (   9.96  )
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

When the firmware compatibility was handled previously in the commit
8e3f9da608f1 ("firmware: arm_ffa: Handle compatibility with different firmware versions"),
we only addressed firmware versions that have higher minor versions
compared to the driver version which is should be considered compatible
unless the firmware returns NOT_SUPPORTED.

However, if the firmware reports higher major version than the driver
supported, we need to reject it. If the firmware can work in a compatible
mode with the driver requested version, it must return the same major
version as requested.

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index d8421a32a92fed6d56770cba282ea55b2571b155..ad2f6b410e4431bb133fa0f05dd3eec802f5ee07 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -150,6 +150,14 @@ static int ffa_version_check(u32 *version)
 		return -EOPNOTSUPP;
 	}
 
+	if (FFA_MAJOR_VERSION(ver.a0) > FFA_MAJOR_VERSION(FFA_DRIVER_VERSION)) {
+		pr_err("Incompatible v%d.%d! Latest supported v%d.%d\n",
+		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),
+		       FFA_MAJOR_VERSION(FFA_DRIVER_VERSION),
+		       FFA_MINOR_VERSION(FFA_DRIVER_VERSION));
+		return -EINVAL;
+	}
+
 	if (ver.a0 < FFA_MIN_VERSION) {
 		pr_err("Incompatible v%d.%d! Earliest supported v%d.%d\n",
 		       FFA_MAJOR_VERSION(ver.a0), FFA_MINOR_VERSION(ver.a0),

-- 
2.34.1


