Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFC1C197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lj8uuu7iWZsAclpHD2qzdXk8KQojj805ab43KuXmCc=; b=lt2Leek03slxrMMjf+6WWCf5NU
	77qmrWs4rW7Zl96gZjj+xReOVuLh6axjptzdjLxq1rL/8UcB7a+X3ltg1gyAoD23u+13awmbHyTzz
	GB4HzKY4DPuDT09CLE467UoNb7VpuTcrB0TVTC7Lhj0CFTHvfL3aBmnrOS923+wJGIrEaJRX7YEfd
	Wo6M8E7vLN3Da6F6F7uxo+4f85nAVk1WtEfgN2pXiaKjHBmoETQfV5En64J2mDznqzb0XxzcmBRUH
	sWM3ESdAaBMcsJCqD7kbslL/xuyC9UkD6fMYg9AD9M5xK7OyLaUONKj8PL6656JW9CU9beJdfspzu
	KrHFzzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjm0-00000008cje-2tEn;
	Thu, 27 Feb 2025 19:42:20 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniSO-00000008JCQ-3DRX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:18:01 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ab456333aso11441495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 10:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740680278; x=1741285078; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lj8uuu7iWZsAclpHD2qzdXk8KQojj805ab43KuXmCc=;
        b=dR+Jnrp1kdkmpLZoJJf6+HcVSByK5Sj4Xs11ESwKE4J+xnXorLAi0rOICIY8oeaaTd
         88rZPutVt+zYn6kQV9YC+ebxzd2FQ9Y6XFeE2w1/z3wlYZ7WQoUoGPbg85Yiz7TswQ63
         rilMH7oYfvl7uuFkDSUD71YrdZ5k2fo1nHYkOr3JrsUXWwsJDWB2bitHneaqbiAviEiK
         J9a1yR7COq83SiaszfVVgpESmO85IIxepNnpXsDDgDLCJmtPshxxfmRhJgSyvaZwYepO
         5QLdPxGEUiStRjGFITUsTm7kIsJ3v9ytWGhLHSgFJg6Xk3rnZ32r+t81cdvtkv6rbpEI
         ZGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740680278; x=1741285078;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lj8uuu7iWZsAclpHD2qzdXk8KQojj805ab43KuXmCc=;
        b=gl8UvZrt8GS4O2m/AA4kOQ+Aty51I292vfPhlMgpCGydtUvaKvvVV3MCeEB8jUF4sP
         nRyOCjH3709drGt4s4C/s5DQqn/hWWA33ZJRB7gZrG/oPcUxgw2QFtJd8ZXiIyNHgtjb
         +9vWEoL6bhppydMxncjGzsjVLJdRkH2DwyiLEBP0OeqN/uDsxiEjO+P/ks6ajMi9EooV
         uXpo6Hbs8crDo5N/fcU1X/xWIAsQCGI41LxGq1J+/ghrn8NrwtlJ5AmfDsJ+JVa3+4C4
         7OQlm3Wukx3ZeKCRUJCUSmVJJ/M4ZsxOaw3w92rlhFEbmB9kDy7sUaBzZLmT3G8dH/Ci
         TrVg==
X-Forwarded-Encrypted: i=1; AJvYcCUo3Egjh9N+CeKUjwvXyl2ZRiP5SmRUsn0FgQwj8w/HUIudZ0xbdr66t5kAyu31nvthtCbKJYpwtlvU8VammEGs@lists.infradead.org
X-Gm-Message-State: AOJu0YxbPKeR/Ki5BS/Iv6IvvUWAhvTER0Z6XTfNlEFQ+XccdLwEQBub
	zS2Nnq5Zn/yNMnCKZfm56lE4KuPiDHzn2PyfLZpmhvW00W/IwR0duYFO+zJS6agrYBTXDfkWnQT
	6QQirNKd1tZsBWgZm0L8hMoklKQ==
X-Google-Smtp-Source: AGHT+IF2Njxm5dDDIzoh690S6dlDK7FR8OBLvtmE8g2ukm7Bwq0tFN/UVviqT95gpNUzFNzheKYgVxT063PkICiN5Uw=
X-Received: from wmqd1.prod.google.com ([2002:a05:600c:34c1:b0:439:65f0:b039])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd3:b0:439:a255:b2ed with SMTP id 5b1f17b1804b1-43ba66e5f09mr2558785e9.9.1740680278652;
 Thu, 27 Feb 2025 10:17:58 -0800 (PST)
Date: Thu, 27 Feb 2025 18:17:47 +0000
In-Reply-To: <20250227181750.3606372-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250227181750.3606372-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227181750.3606372-3-sebastianene@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: Move the ffa_to_linux definition to the
 ffa header
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_101800_801990_27F1034F 
X-CRM114-Status: GOOD (  14.94  )
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
---
 drivers/firmware/arm_ffa/driver.c | 24 ------------------------
 include/linux/arm_ffa.h           | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 2c2ec3c35f15..b02b80f3dfe8 100644
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
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 74169dd0f659..850577edadbc 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -475,4 +475,28 @@ struct ffa_ops {
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
2.48.1.711.g2feabab25a-goog


