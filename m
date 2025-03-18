Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDMdEEdy1VVckNvVv+9Uw4kcuPuHKQ0YP6w02i+CGWM=; b=tfGtxZB5fa2j/YeMQl86Y5ldp3
	Z4PxtKVlFte/DA+X3a28atwEAF11DAMSnfWddU0RB+0XwzOFshzAMLe99i+eyEcWS8bcdxqMyZcWr
	Xc7KaxideZRo6aDSR26QIfP+DDJR1NIcwX0K8+qHnbwNWbGk26j0YVS9NwYqrMGNGIYtF/sSGb0Wy
	Hfxo926qEeI7wYVVLkKyG7BJvwKUevuuVQBb2R8nLb2PYNceMIQ2u9VX6UtDzYp6pfXX0CV6S4SfU
	36cE4A0SBccGyYymRiK+CZaonkmQLD8XOwUwDQpQT16kCl50AoPtw+C8LFHp+nSGuaqQZCOuSqDvy
	p3VG71aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tua1y-00000006Zhm-05tl;
	Tue, 18 Mar 2025 16:43:06 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZl2-00000006WW0-1aYY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:25:37 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so22104215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742315134; x=1742919934; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rDMdEEdy1VVckNvVv+9Uw4kcuPuHKQ0YP6w02i+CGWM=;
        b=qGU9wf3JxJ5T1m+1ikOI6QjuiY/S3Vpn1zGm2nIpJZvZMxqRT4kXGGSDPyxnu/z52d
         KQuY5K9HZu+fo3aF9cPsZb+xYr/Ie1dnbfna95RC+19kDkV2hKsVggtKvIBLWkEihtqf
         VoE22+7bZrqHWZUNOBc6zAF1VE2nKNgsIFch+Cgvj+nS/+XQaw82gZampZFhyvNqbWP9
         yPOWmDzknQepVbV5Y9DLNwHsYFtshOf0/Szk+uasXZd6eHUnaImEUoeHBDQ31FyF8orq
         aeWFTB/U4gFRSLTgSrC7AWb7TciEavsxRTgMt1et3mjrKbZgkDNARAIVneBGgw8euNVJ
         Bu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315134; x=1742919934;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDMdEEdy1VVckNvVv+9Uw4kcuPuHKQ0YP6w02i+CGWM=;
        b=byNRyYGpg4aXth6vOponRjfuEh/eLYTh9ayGZpvN9gFV+DO18cufSNiuONasmznqFA
         dgy2sxTOoBBLAeoNemmY8UcSXC1itkwwLbWJP41U0zSPs4AQEMgOKmatVufEPfhCcIat
         0BQueOIlR2a3ZQvlzHM+d6yz6Qnsqf8ob7Q6IGtIrv+7coX2R/OHHed9ufWCUU9CIbVB
         gjfcF/5Bebu6ciNHRjYgD+BatoaWunLLSR7cR3W7bIGuf5gklGYLKRMsVQ22o5BMyqoQ
         t0zgcRQ5Ie4D/6icldS9WXCH6WOETTx+VDYCg7KUnHIxV4f6tiJzGPZNUnt7XJyiZlQM
         tCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVchbQ8FpDWWaE9JJO1PnqeLoa49CdjaCD+xvgFchIcMvDSTPKsTIo+aIqM8vDqpyVKEzvnuU/D6V7cf+cK5MQ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxRZSgMxlEWumuxYxbWgE2MS778UT9KTYjReiIY9lzi1NBasF/i
	A3r0terfx9SPdim2OLxWYIq6vIDbL/dx+/CpMNQ9AgoneqMouWjwpnX3zWa0Oi8LxiUiC5ydVjt
	cZFZwePbQtxnqpgio5l9Kbmctog==
X-Google-Smtp-Source: AGHT+IGrqCyZAj3WhiZpuq4EomsTyl0s1Z4lp12t9lZvwltIa9qDp+9pdQe/IpL9JiYdK9qni53p5x/BRGVpG+ks5V4=
X-Received: from wmcn5.prod.google.com ([2002:a05:600c:c0c5:b0:43d:1db0:6628])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3584:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43d3ba27a69mr28607885e9.29.1742315134353;
 Tue, 18 Mar 2025 09:25:34 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:25:09 +0000
In-Reply-To: <20250318162510.3280359-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250318162510.3280359-1-sebastianene@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162510.3280359-3-sebastianene@google.com>
Subject: [PATCH v3 2/3] firmware: arm_ffa: Move the ffa_to_linux definition to
 the ffa header
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092536_417871_90527C06 
X-CRM114-Status: GOOD (  14.92  )
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
2.49.0.rc1.451.g8f38331e32-goog


