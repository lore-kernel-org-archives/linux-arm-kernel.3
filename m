Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C32EFED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Message-Id:Content-Type:To:Date:From:Cc:Mime-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RKA/JMZYhDziL6eOGmSREqjLGYKJoQnSLzMtF2VvzKI=; b=3XdQkQxopKgKbNVGMFWvVfO+w3
	VxQ0RU2bKiEOwTOIjwnO8aVDhaO2PHHO4jThKtRgWqQP13Tl5O1xXTb5qsFCXKtLPHAIB/zV6JhuJ
	TLWvhx81VoY9Vbsu18rIYyTwK89LLjzd8vR3bMICY5VvijrDiXmo51KROwfvlh1rvyK/Yk2ZBAy9H
	p4WLuVA1xXi67RFrlT/NyHiqqhcL+9XcwD186r06g9FQ4tRc3ISheNC3AyJ/TMfpxOlESF6OLIRNX
	pU32T0p9TfJeog/7IOEBMxMtbqxf/vwhjTGXqkCuvaOnZ3lVI0C4+zAQuUh/h/wCP4bOfjSjdywcU
	6JLDn8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLan-0000000DfEf-3THo;
	Fri, 24 Apr 2026 18:49:33 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLal-0000000DfEE-2JQ7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 18:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1777056560; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=RKA/JMZYhDziL6eOGmSREqjLGYKJoQnSLzMtF2VvzKI=;
 b=aKAKptg8zulczLBNFV8RCvD7rN1+nfL0LK7P37J6YZlhxU9VpcWr0LSxEMAp60BB9cH1+f
 e5bnk83W7H3W53DF9A0oxVPgsltL8RaphR1UOhWkLdWe+2KT+6qtZ0FCvDBSr9DTw2uQ8n
 MFr3KOceVOC4RrmFZdDx5l3mVa0ztocTQef+TMHrNwIV3UPRqErpxyL6PBvIvMAFgrDqOf
 pam5DyNJofvjk/BupS/qIxc1G/UUegz3+Gj2RHiIt8xFxP+s5e9NEWBaZmuh94WM5+1bUU
 q953WJxW4ikpju5VnzXvFT79KVWj9L1zT+nUHRke7liH9oMzM1s4pIH+MzJdkA==
Subject: [PATCH] EDAC/xilinx: Fix stack off-by-one in debugfs UE injection handlers
Mime-Version: 1.0
X-Mailer: b4 0.14.2
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Cc: <linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, "Shengzhuo Wei" <me@cherr.cc>
From: "Shengzhuo Wei" <me@cherr.cc>
Date: Sat, 25 Apr 2026 02:49:05 +0800
X-B4-Tracking: v=1; b=H4sIACC762kC/x3MSwqAMAwA0atI1gZq/eJVxEWtiQahlVZEEe9uc fkWMw9ECkIR+uyBQKdE8S6hyDOwq3ELoczJoJVuVKVrpNlYjIexG3pmnG70jpCbVpWWqdNFCan dA7Fc/3cY3/cDHjAghWcAAAA=
X-Lms-Return-Path: <lba+269ebbb2e+52f5bd+lists.infradead.org+me@cherr.cc>
To: "Shubhrajyoti Datta" <shubhrajyoti.datta@amd.com>, 
	"Sai Krishna Potthuri" <sai.krishna.potthuri@amd.com>, 
	"Borislav Petkov" <bp@alien8.de>, "Tony Luck" <tony.luck@intel.com>, 
	"Michal Simek" <michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Message-Id: <20260425-edac-stack-off-by-one-v1-1-4b2dd2b9c7df@cherr.cc>
Content-Transfer-Encoding: 7bit
Received: from pve.cherr ([111.42.148.227]) by smtp.feishu.cn with ESMTPS; Sat, 25 Apr 2026 02:49:18 +0800
X-Change-Id: 20260425-edac-stack-off-by-one-f6703cfe8213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_114931_671030_F65DFCFD 
X-CRM114-Status: GOOD (  10.17  )
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

Two EDAC debugfs write handlers copy up to sizeof(buf) bytes into a
fixed-size stack buffer and then unconditionally NUL-terminate it via
buf[len] = '\0'.  When userspace writes >= sizeof(buf) bytes, len
becomes sizeof(buf) and the NUL write lands 1 byte past the end of the
stack buffer.

Fix by clamping the copy length to sizeof(buf) - 1 so that the NUL
terminator is always in-bounds.

Fixes: 3bd2706c910f ("EDAC/zynqmp: Add EDAC support for Xilinx ZynqMP OCM")
Fixes: 83bf24051a60 ("EDAC/versal: Make the bit position of injected errors configurable")
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
 drivers/edac/versal_edac.c | 2 +-
 drivers/edac/zynqmp_edac.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/versal_edac.c b/drivers/edac/versal_edac.c
index 5a43b5d43ca28027c829f53aea50588297484c5c..917d7d1762aa9ec9f752e8419c24fd265048ff28 100644
--- a/drivers/edac/versal_edac.c
+++ b/drivers/edac/versal_edac.c
@@ -856,7 +856,7 @@ static ssize_t inject_data_ue_store(struct file *file, const char __user *data,
 	u8 len, ue0, ue1;
 	int i, ret;
 
-	len = min_t(size_t, count, sizeof(buf));
+	len = min_t(size_t, count, sizeof(buf) - 1);
 	if (copy_from_user(buf, data, len))
 		return -EFAULT;
 
diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
index cdffc9e4194d42d4d11c5218c9f341ac46301a94..048a7b9becd622a5eeebf9c893ffdf9e163f5e9b 100644
--- a/drivers/edac/zynqmp_edac.c
+++ b/drivers/edac/zynqmp_edac.c
@@ -304,7 +304,7 @@ static ssize_t inject_ue_write(struct file *file, const char __user *data,
 	if (!data)
 		return -EFAULT;
 
-	len = min_t(size_t, count, sizeof(buf));
+	len = min_t(size_t, count, sizeof(buf) - 1);
 	if (copy_from_user(buf, data, len))
 		return -EFAULT;
 

---
base-commit: dd6c438c3e64a5ff0b5d7e78f7f9be547803ef1b
change-id: 20260425-edac-stack-off-by-one-f6703cfe8213

Best regards,
-- 
Shengzhuo Wei <me@cherr.cc>

