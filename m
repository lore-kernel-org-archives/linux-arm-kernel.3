Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ADAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/aMdmdeuG4GwO+gqHcxrSjamR9dGEFQfEwNfU4KLuoQ=; b=pBdhZagK9sin4cdAYaGUORcIip
	mKQVSblgI+p+lv7reATxV/mkFJ7rO3Vvckcr4KHLZYuV7jIK2Q/6cFU4P+kVLy9wup18C7Hnw/WOY
	xHF/ujfeioJq2LoOsiAOPC2W/ORK1cDfKYSRz7QiNi3IfHPuSILa7ACeiHnG1LzIoLUKwcK3OePYP
	g352AVHxR2Jnt8s8uU5gOK3rHy5yF4ujXdss9VkGPbz8Irs9X4Ayp8G+Ddt7XOM2vPWL6VlGs5Ls3
	vh/BslqtNRZhIAYgBgr1zDgnVQRjdEVpjGgsERk/bb+3Nz1VZ0t9eXlLHR/T+NRipEps5gmH9BJ9n
	D573qDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3bJ-00000005C4p-1RAc;
	Mon, 17 Feb 2025 16:04:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3Dg-000000055XP-1Gan
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 15:39:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E086152B;
	Mon, 17 Feb 2025 07:39:59 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0AB3F6A8;
	Mon, 17 Feb 2025 07:39:39 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Mon, 17 Feb 2025 15:38:52 +0000
Subject: [PATCH v3 11/19] firmware: arm_ffa: Upgrade FF-A version to v1.2
 in the driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-ffa_updates-v3-11-bd1d9de615e7@arm.com>
References: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
In-Reply-To: <20250217-ffa_updates-v3-0-bd1d9de615e7@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=hSnmX8m0IsvUg6QjDxQaXp5gbNOPxEHIjGzf5RS8CBA=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBns1gutymg8h1/T86Z4nSr1TM+hJU4oaA7tvNo7
 9DWTozgOcKJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ7NYLgAKCRAAQbq8MX7i
 mMPdEACymHmnWTf7JKO7Y7K3csg+AiOXdSGzbiUCwVe6V+Fa8bQ5plLUh5t9vUjPJvUraFC4/Ac
 rvwwJ9BYf6CrurMqCa9hgnDrehOdAlMObRIkCZpWDh/2s48+p+mJkOvnHGLCc/7efYK/vzrOpiS
 3bfCcFbRoUZqOPs6Gwnxjkh2ZqfECWCIBJquk+QYhqiXZTjkmuYsXQeyKUP6vCdt4n5ICCL/w4o
 WY6DWVlhC9bpkKJVbooYdRFAv9SyqCj3jT+TokwlHRVkSmdyhzmeOsS9B5+EaNQaQSPGBb4K90k
 Mj52pChrkVJKpwRll1T5BnCj4047Ikn0/q30pmCud/i7S4wTgS0x/KXv9vb4ri6vrtSwu6RLQLo
 +ppQ0JBgB+/0wqEQUmzNYfG+UhgAol+tSY9xPQuXvM+Fpdstbe5OApqAqi5x7wzgIJUhQ50Zliv
 F/y+7bWSGemN7DO5ZNPjQVvRi4Wv1AIVZ1393mu8gjamsk3kbnFt8JEW/6Lm3AgoJ+Bl7K9xwoW
 jCJfY1MQPttLpG6CBoogCSzsxSOvrkPA6qa+5ZMSKD86s7ZRenSIRulIMSxZvXxwBNNPWw7C65Q
 gN53nGe4vZIl9VPdts7ZrpWKrjkENfwWJly5HXaJ8CsfyrUJmQkG5e3jM/GlsRRe1wtFDX4bz0L
 GCbcHhIQ4XaXSdg==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_073940_385187_7B7F1429 
X-CRM114-Status: UNSURE (   9.56  )
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

The basic and mandatory features of FF-A v1.2 are all supported now.
The driver supported version can be bumped from v1.1 to v1.2

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 include/linux/arm_ffa.h           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 545b1772df0095787b20332a7d5189c71bd5cacd..d8421a32a92fed6d56770cba282ea55b2571b155 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -44,7 +44,7 @@
 
 #include "common.h"
 
-#define FFA_DRIVER_VERSION	FFA_VERSION_1_1
+#define FFA_DRIVER_VERSION	FFA_VERSION_1_2
 #define FFA_MIN_VERSION		FFA_VERSION_1_0
 
 #define SENDER_ID_MASK		GENMASK(31, 16)
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index bd78deeff284e2f46d42cfc7af218f4a0f3d1478..4fcbdc70cbc985eabb90733329c974384d229053 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -112,6 +112,7 @@
 	 FIELD_PREP(FFA_MINOR_VERSION_MASK, (minor)))
 #define FFA_VERSION_1_0		FFA_PACK_VERSION_INFO(1, 0)
 #define FFA_VERSION_1_1		FFA_PACK_VERSION_INFO(1, 1)
+#define FFA_VERSION_1_2		FFA_PACK_VERSION_INFO(1, 2)
 
 /**
  * FF-A specification mentions explicitly about '4K pages'. This should

-- 
2.34.1


