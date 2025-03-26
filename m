Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2554CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8ajkpiQTqtR9VJRMGj5F4HjopRvHwcyjLs80bQ1Ix0=; b=boQwCpkVWnX+p4IzqJ68fY7BUp
	6ayZRalVeRUfb2inNegI8pQcZ+KsjWpCzuwOtKUUzV45/NDrWSWeCTCSaBHLr6OR72hXr/4B+dqqZ
	a19WfiktleX8uJjCdqE7F/5JjacI/y3szW1DNvJJtVOTnmAFjUlc2EGO/XcA4Nvv33uJcNokZVygb
	r5VomlUxKv7BwBK35Vy1fbaXf2TQhOatoZOZE7WXLwW4gE0aECQZO/Peg+DiArh6PkBFX9o4RVbwE
	E1vVHsngAkHd1suK2ftxivBL2IYDQsIklBnaXq798LEGmnjEwcE4Mvde6WZrBZEQvuhDMt9jrRd2U
	2blRv+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPBJ-00000008OOP-31fS;
	Wed, 26 Mar 2025 11:44:25 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP6F-00000008Nfs-0nES
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:39:12 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3912d5f6689so3597631f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742989149; x=1743593949; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8ajkpiQTqtR9VJRMGj5F4HjopRvHwcyjLs80bQ1Ix0=;
        b=1QaLVYJT/x0vbwIV65yurqenm5MaLZzzML2SWB2dOvtraXoRcP0Qzx3OshhGfkzql1
         PFBuRPMRCohj0nDRXY6o50DraozGvo3tbYzTkEvOYsdk04HdjRJux9UHHJvl46RaLXpu
         D3CjNEBrCuHsAz1okI6VWKtHe+cEYWuA/LWk8utQRZCEA6Hr+dUN4LNxX8bUH0q+Ab+o
         2DqXNMo/tfEGCjKsee5fbz5Z/CnZDkKqUTTD70b+AefKv40r0K+9XvGBp3pcLWTyzX9t
         mbaWxm30a8G98odPeLogLGRKiWNdimvtxs3DtLixtULOH82mUIv/O9CDAr7ApHG4v+cX
         QmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989149; x=1743593949;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8ajkpiQTqtR9VJRMGj5F4HjopRvHwcyjLs80bQ1Ix0=;
        b=jutl2rlKqBUnjUoYeNLQuL0z6m9EORGNxmepNKzU6lVcYOQB2bAyVdtTZLjvnS1sDP
         33VBDXLiZFx78fT04aEK7bAs87wcL1eXdJWWNd6ZITsnqZYKYH8hQrTeapy9w5iDm9Rr
         tesgVzkpEXOIxj43PTBHyP/Jv5pmH4c8CY30c8G/AFhHmlfWDyNZVoMnGATjstj/AvOG
         QQNfQR3wt7zIv+m+kSgbmxO/sxT+9LRufza3UyRxA9DFWoay7JcdATIqp8cF5qhp9MUJ
         AuuO+TkfmBbSq1oJXXM/JftOBmzWrrgHpkMUlALg6rkm127DUgKI5D/VP4pOinPIS7e8
         +e9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdJG1anad7b4gFoVMXzUuJG7NWzo3CzxCJIuPlncZGoncAtdiuaW6PdCpAjrqq8Ez78+8YThhClWsEc6U+r3Sm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3pNoSx0iSxOsS2dslP4Zu8+EBsb6LCnDtwAZx//hctTrt9J/o
	Vap1HstD9eU2j6aNamoIolpj8shLd5U+5iPpLCLv9b9LSTolOMu8NtO1K9ce0vJLXxmnuk7/CVI
	i/B4AnN+0tOn0nnFu/gOdpOiVqw==
X-Google-Smtp-Source: AGHT+IGt24UV1F1gn3DBiJA89bM8xyxzcFBTUpe7uN0vVj4Q/IEqACUFIlVuS9cdYKWGLRea4OJ8IMRq4qWmWhdzPh4=
X-Received: from wmqe22.prod.google.com ([2002:a05:600c:4e56:b0:43d:8f:dd29])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1882:b0:391:12a5:3c95 with SMTP id ffacd0b85a97d-3997f91202dmr20021811f8f.22.1742989149185;
 Wed, 26 Mar 2025 04:39:09 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:39:00 +0000
In-Reply-To: <20250326113901.3308804-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250326113901.3308804-1-sebastianene@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326113901.3308804-3-sebastianene@google.com>
Subject: [PATCH v4 2/3] firmware: arm_ffa: Move the ffa_to_linux definition to
 the ffa header
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, qperret@google.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_043911_228897_F7A1627E 
X-CRM114-Status: GOOD (  16.67  )
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

Keep the ffa_to_linux error map in the header and move it away
from the arm ffa driver to make it accessible for other components.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 26 --------------------------
 include/linux/arm_ffa.h           | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15..3f88509a15b7 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -61,30 +61,6 @@
 
 static ffa_fn *invoke_ffa_fn;
 
-static const int ffa_linux_errmap[] = {
-	/* better than switch case as long as return value is continuous */
-	0,		/* FFA_RET_SUCCESS */
-	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
-	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
-	-ENOMEM,	/* FFA_RET_NO_MEMORY */
-	-EBUSY,		/* FFA_RET_BUSY */
-	-EINTR,		/* FFA_RET_INTERRUPTED */
-	-EACCES,	/* FFA_RET_DENIED */
-	-EAGAIN,	/* FFA_RET_RETRY */
-	-ECANCELED,	/* FFA_RET_ABORTED */
-	-ENODATA,	/* FFA_RET_NO_DATA */
-	-EAGAIN,	/* FFA_RET_NOT_READY */
-};
-
-static inline int ffa_to_linux_errno(int errno)
-{
-	int err_idx = -errno;
-
-	if (err_idx >= 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
-		return ffa_linux_errmap[err_idx];
-	return -EINVAL;
-}
-
 struct ffa_pcpu_irq {
 	struct ffa_drv_info *info;
 };
@@ -238,8 +214,6 @@ static int ffa_features(u32 func_feat_id, u32 input_props,
 	return 0;
 }
 
-#define PARTITION_INFO_GET_RETURN_COUNT_ONLY	BIT(0)
-
 /* buffer must be sizeof(struct ffa_partition_info) * num_partitions */
 static int
 __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 74169dd0f659..cdaa162060f4 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -223,6 +223,9 @@ extern const struct bus_type ffa_bus_type;
 /* The FF-A 1.0 partition structure lacks the uuid[4] */
 #define FFA_1_0_PARTITON_INFO_SZ	(8)
 
+/* Return the count of partitions deployed in the system */
+#define PARTITION_INFO_GET_RETURN_COUNT_ONLY	BIT(0)
+
 /* FFA transport related */
 struct ffa_partition_info {
 	u16 id;
@@ -475,4 +478,28 @@ struct ffa_ops {
 	const struct ffa_notifier_ops *notifier_ops;
 };
 
+static const int ffa_linux_errmap[] = {
+	/* better than switch case as long as return value is continuous */
+	0,		/* FFA_RET_SUCCESS */
+	-EOPNOTSUPP,	/* FFA_RET_NOT_SUPPORTED */
+	-EINVAL,	/* FFA_RET_INVALID_PARAMETERS */
+	-ENOMEM,	/* FFA_RET_NO_MEMORY */
+	-EBUSY,		/* FFA_RET_BUSY */
+	-EINTR,		/* FFA_RET_INTERRUPTED */
+	-EACCES,	/* FFA_RET_DENIED */
+	-EAGAIN,	/* FFA_RET_RETRY */
+	-ECANCELED,	/* FFA_RET_ABORTED */
+	-ENODATA,	/* FFA_RET_NO_DATA */
+	-EAGAIN,	/* FFA_RET_NOT_READY */
+};
+
+static inline int ffa_to_linux_errno(int errno)
+{
+	int err_idx = -errno;
+
+	if (err_idx >= 0 && err_idx < ARRAY_SIZE(ffa_linux_errmap))
+		return ffa_linux_errmap[err_idx];
+	return -EINVAL;
+}
+
 #endif /* _LINUX_ARM_FFA_H */
-- 
2.49.0.395.g12beb8f557-goog


