Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4D3C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYN8MRS1RnP1foydPVEerv8n1UG6uH1Hz3MnU6KlRGQ=; b=mI2nSgfkJP+SS2dWGIRG5W+J+/
	k06h+DbcxUVyxYS421amzbZKooJ05Qvp/m4GBGLBqJcs9Vw/qLk/3Rrm811+GVHpZTjPbtw/gS6Xg
	acHqSnJmP9MCLih2VFujGWPRWaw0HqKAEqMR6LzNIGKPZQ/V/w/JcwY6tosfT0ZhgjZzNM8Z/2oEi
	Qx/AgiEIV+IlLi322kazpHu7bLa8YHMWuf35wmJfj8tX9Oc84LBAXq7OMrxZ7OAfcYmEkCVippKI3
	XGism4im7ysCLxuzkDlYR2abMhUa4kzdbNtshgmcnoXhVxYWkeysIvZgxarii+ibr3dL3ncp01aXY
	8NKCLvAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8gh-000000078cn-0b2U;
	Tue, 21 Jan 2025 07:28:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8DD-0000000732V-2vvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:58:12 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166f1e589cso126959715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 22:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737442691; x=1738047491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYN8MRS1RnP1foydPVEerv8n1UG6uH1Hz3MnU6KlRGQ=;
        b=nAQAmX2I0ji3qge3bGz8nj09cbdyQQoRhAnP86N2/NVE2QY3RA3nYqvXQJRRO+JLLw
         bzCX0YHQwNUKZnjVOEMhq+WvVh8eNVKpdz3tSomXrJMQFzIrPZie03ubEojN/3wMnwHp
         QJwDWoMqloVep+PgQ7rqggvBU8mr25SVZFMnDH267+lsd6aHxj9VyF2zm2KYAVm5kcBC
         Md0Rog8T9tLkOIANeOs1rsXxASOCO8XeogTandyOZCdgqPaa2NOfjf7Mv2i3mixQYhh+
         5Ovb85K8+Fmls1IiWHAcbEydVc/3ewScu7RcLvjwSKMk9cEmene/cqmEF6YtBqCf3U05
         Ws7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737442691; x=1738047491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYN8MRS1RnP1foydPVEerv8n1UG6uH1Hz3MnU6KlRGQ=;
        b=h+TyZxf8vygF8jElYSzdFo5e9SlXjFq9kSEACsQTUG8gnPoYkQiUdQyDnfos+jkTri
         DH72QcCUpou1WvG+rwmu7LdHhxEzGK7Nr6XYSy/vRgDUhe+PvrTz/pMXRDwZRTDcK2nE
         lMZC713ApKS2C6lgZpa54GuhQrKAppPrifPcEOh5Z0kPAZy3q9hiI5PZLPZ0aNUthWJc
         alTWbxzUL6P++tjvTjjhzmUnGrqroTKYI13zVrphCaRlAxjZ3rYZV7yw6prH8IoLL9A4
         L1fPtJUk5L1/kIUvnX2FQCdTzirKseZarpdgOV7wuqUghHcV2mr2BdznAW5Ffx5iymo2
         KOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFIe333DKkrS6cecDsiliOQ1VX6pGUfUhGgyXKXXaaoQiSUo0nkpIlp4n+YDMVNFBMGCl+O7OSD8Sehul7ueoB@lists.infradead.org
X-Gm-Message-State: AOJu0YyINlsSQ98+e6aOL0WDt83HWe+TvahdRhYosR8DixSPe7wKVmC0
	l2bpVa9fFbEmqDa34Dgfao8g1azywfDqjnBQW7lN/zCiFTg4Rp/dUfAHCmjRh0k=
X-Gm-Gg: ASbGncueq4f/KHYST8A9ajji9HB9NhBSSfRs5mECc1Zr6NXhmSgqIrSRG7opBRV0slo
	XLA75I/bA5LzwPeNLKUof5nb7XQhK+Y5Sp591OShElSlO23qWpAGRtBCKMgOefDsWY5ufQJcjOv
	XPNC81MVrKiILcLxsSZpdWWcGyBhWA5KBfq2/0EqhiAOZxnhpI880bty400HEBxgCztO4Qz1VE9
	pnqneXbkamUH++htmy00s95PY3pReuUjOSqsZbzxyuPTYepcsi6tLJJgrhtzgU7EIDhlIWt
X-Google-Smtp-Source: AGHT+IHEiht+oEKSqPdT2N2V7SuEcCXLPs4D/nYxCT06afvzXSDLl1haDMqTZYOsB5wUU2Y3V6I7PA==
X-Received: by 2002:a17:903:32cf:b0:216:5af7:5a8e with SMTP id d9443c01a7336-21c355ec9c0mr238651055ad.26.1737442690920;
        Mon, 20 Jan 2025 22:58:10 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9efd6sm70652705ad.23.2025.01.20.22.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 22:58:10 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] firmware: arm_ffa: Setup of_node for ffa devices
Date: Tue, 21 Jan 2025 12:26:39 +0530
Message-Id: <0e863a4baea59865aff0d1b5657f548bc0aa8d2a.1737441631.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737441631.git.viresh.kumar@linaro.org>
References: <cover.1737441631.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225811_734386_01AFA66C 
X-CRM114-Status: GOOD (  12.70  )
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

Match and bind the of_node for the FFA device.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/firmware/arm_ffa/bus.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index dea3eb741d95..ca526e438e71 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -7,6 +7,8 @@
 
 #include <linux/arm_ffa.h>
 #include <linux/device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/fs.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -187,6 +189,32 @@ bool ffa_device_is_valid(struct ffa_device *ffa_dev)
 	return valid;
 }
 
+static void ffa_device_of_setup(struct ffa_device *ffa_dev)
+{
+	struct device_node *np;
+	uuid_t uuid;
+	u32 val;
+
+	/* vm-id and UUID must match */
+	for_each_compatible_node(np, NULL, "arm,ffa") {
+		if (of_property_read_u32(np, "vm-id", &val))
+			continue;
+
+		if (ffa_dev->vm_id != val)
+			continue;
+
+		if (of_property_read_u32_array(np, "uuid", (u32 *)&uuid,
+					       sizeof(uuid) / sizeof(u32)))
+			continue;
+
+		if (!uuid_equal(&ffa_dev->uuid, &uuid))
+			continue;
+
+		device_set_node(&ffa_dev->dev, of_fwnode_handle(np));
+		break;
+	}
+}
+
 struct ffa_device *
 ffa_device_register(const struct ffa_partition_info *part_info,
 		    const struct ffa_ops *ops)
@@ -222,6 +250,8 @@ ffa_device_register(const struct ffa_partition_info *part_info,
 	import_uuid(&uuid, (u8 *)part_info->uuid);
 	uuid_copy(&ffa_dev->uuid, &uuid);
 
+	ffa_device_of_setup(ffa_dev);
+
 	ret = device_register(&ffa_dev->dev);
 	if (ret) {
 		dev_err(dev, "unable to register device %s err=%d\n",
-- 
2.31.1.272.g89b43f80a514


