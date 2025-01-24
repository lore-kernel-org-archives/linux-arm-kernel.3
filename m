Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FEEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 09:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlOzh0yVdNtO9Xo4eTT0ptUq5hK7+DDJWK0WMdAATE0=; b=ak+bRDjlNTXfszQcLi8LLINg/o
	tjGJNwGT0r8HW8YIliRScVTrTjG2msdp+XUdQYdmIR7C8qrgQEl3DiHU9sISDCLJmyqYaHTfn609I
	DfcRvOOdF5LzdzFnqFJrft0puzgWNfmjNZ4yXce/BhxOvyz07UTPTPcnUWQrRkrVK6K6L+K0CkLvW
	i4P4HT1hj4JM1WVS3RkJF6776yCjF3Et7uH9UJeNMeIwrU08UHvsNF25iET8f9tRkAT+QljD6KF/h
	XC8+l2VjBQkeh4WzOo9SbydR2SvFiv+1bVBjcaUeT/5nqxWM/ortWIm6UkbyuzSMWvQKoJwqF6YwK
	WjmYinZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFY5-0000000EJ7R-3toR;
	Fri, 24 Jan 2025 09:00:21 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbFUm-0000000EIU9-3Uab
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:56:58 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 836E3A09FF;
	Fri, 24 Jan 2025 09:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZlOzh0yVdNtO9Xo4eTT0
	ptUq5hK7+DDJWK0WMdAATE0=; b=g7rLjC7w1RWLE5CXrEPJAknMGKmzbtUJde/P
	EOew21O+3aI3OSgdhlz38WMoJdJNw6DfoiAPVpLFB9ZsULv8zLLwwh8gamVjrrqD
	gXazlAdLmKevEOFooxcn86Pvwl6Zr7dgXBvdnnUDc8oNk6tGMeeczHTZZDuXwMCA
	oXLLdORXZkS5o+atOk7SUL0q0rJieS8zbA6UFmHu9Ehj2wM8rEzPwF2oFFPIEWBI
	tT8lakaDiPUMdSG4oNW6p0Sclmkv10z9EnqXDDhUQYWJahYT0J9kN7NkBmefAPr6
	xC6fCtcpLEgYs9mOYlHKmSVQhzO5JNxm2KdnRocHYNJrhqHR+zmuJECHgizGw0Kb
	ZezsjwDdP2tgs4XQgWnRnIGCKTF+WnWzi6byuUdQgvo3+V9R1YoG4zJ443bEfrTD
	t7UyfrZ1stEVqhK+3IJ21+/omyu1k9buRONbsLvygY0bfza6Ypdk3AHFFP3D2hUJ
	zfafYq+wSH5agjXRBCcPDBpOd+3Rkn9fa2RiSllG00LgBABCl6K3aSaca7Q4cxkF
	0oYHWRctUCaAU174CKNd1DnvvEMblOEzN7MvV9uS19L7ws0T3g7eO9yCa1fMhMcj
	LaIYEamaYI8ccVYa2svsDosOaa68e66fiN2MjZgjzFxGTVneb9oDQm65hFRAQRvN
	ajDlf74=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>, Mark Brown
	<broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <dmaengine@vger.kernel.org>, "Pavel
 Machek" <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/4] pm: runtime: Add new devm functions
Date: Fri, 24 Jan 2025 09:52:22 +0100
Message-ID: <20250124085221.766303-10-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250124085221.766303-4-csokas.bence@prolan.hu>
References: <20250124085221.766303-4-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1737709014;VERSION=7984;MC=2223755251;ID=70500;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94852677063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_005657_039356_4C92CAA8 
X-CRM114-Status: GOOD (  10.43  )
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

Add `devm_pm_runtime_set_active()` and
`devm_pm_runtime_get_noresume()` for
simplifying common use cases in drivers.

Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/base/power/runtime.c | 36 ++++++++++++++++++++++++++++++++++++
 include/linux/pm_runtime.h   |  4 ++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 2ee45841486b..f0a6c64bec19 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1545,6 +1545,24 @@ void pm_runtime_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pm_runtime_enable);
 
+static void pm_runtime_set_suspended_action(void *data)
+{
+	pm_runtime_set_suspended(data);
+}
+
+/**
+ * devm_pm_runtime_set_active - devres-enabled version of pm_runtime_set_active.
+ *
+ * @dev: Device to handle.
+ */
+int devm_pm_runtime_set_active(struct device *dev)
+{
+	pm_runtime_set_active(dev);
+
+	return devm_add_action_or_reset(dev, pm_runtime_set_suspended_action, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_runtime_set_active);
+
 static void pm_runtime_disable_action(void *data)
 {
 	pm_runtime_dont_use_autosuspend(data);
@@ -1567,6 +1585,24 @@ int devm_pm_runtime_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
 
+static void pm_runtime_put_noidle_action(void *data)
+{
+	pm_runtime_put_noidle(data);
+}
+
+/**
+ * devm_pm_runtime_get_noresume - devres-enabled version of pm_runtime_get_noresume.
+ *
+ * @dev: Device to handle.
+ */
+int devm_pm_runtime_get_noresume(struct device *dev)
+{
+	pm_runtime_get_noresume(dev);
+
+	return devm_add_action_or_reset(dev, pm_runtime_put_noidle_action, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_runtime_get_noresume);
+
 /**
  * pm_runtime_forbid - Block runtime PM of a device.
  * @dev: Device to handle.
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index d39dc863f612..d7eca86150b8 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -93,7 +93,9 @@ extern void pm_runtime_new_link(struct device *dev);
 extern void pm_runtime_drop_link(struct device_link *link);
 extern void pm_runtime_release_supplier(struct device_link *link);
 
+int devm_pm_runtime_set_active(struct device *dev);
 extern int devm_pm_runtime_enable(struct device *dev);
+int devm_pm_runtime_get_noresume(struct device *dev);
 
 /**
  * pm_suspend_ignore_children - Set runtime PM behavior regarding children.
@@ -276,7 +278,9 @@ static inline void __pm_runtime_disable(struct device *dev, bool c) {}
 static inline void pm_runtime_allow(struct device *dev) {}
 static inline void pm_runtime_forbid(struct device *dev) {}
 
+static inline int devm_pm_runtime_set_active(struct device *dev) { return 0; }
 static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
+static inline int devm_pm_runtime_get_noresume(struct device *dev) { return 0; }
 
 static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
 static inline void pm_runtime_get_noresume(struct device *dev) {}
-- 
2.48.1



