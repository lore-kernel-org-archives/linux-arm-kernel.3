Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ABEC36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 01:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3yUz8B8UOwQKdx+ikShwAoRAzuYVj/mGC57kza1e97Q=; b=cDXgx/xvq1Kvk0vh9TA4lQThyC
	PXqJ4rWhT99zXTrcmoPXZyL95xNA9+7sBiAuIw26LuzdbZpeCMI1NCVc2PpX+cCWr8nwjUKaMpTIU
	B8UfNmKklxZ86i9I5oKMwnc3/tXb1WouES6+T3z4A1an5dOVYvV8Mc4KNQKm5tw+zRuDdumWDYCVT
	ObM0Fz3pNr8oG0TGWc43VRAUirvKR6RWonhxTweF5uF2lJwyH+rOkTBDVp0GmhcHl2iDVzSutVADx
	EgATCpVRUQQHJx2KGPLCZPmH2gQ8qCO30C85I6FN7/Mqe6NLsQLiLXXUlLsmO3PFe5h0yrs1ao7gg
	/TN1G7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmqQ-00000004pot-1UTG;
	Wed, 02 Apr 2025 01:24:42 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmla-00000004p6V-13Zd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 01:19:43 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff8a2c7912so608701a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 18:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556781; x=1744161581; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yUz8B8UOwQKdx+ikShwAoRAzuYVj/mGC57kza1e97Q=;
        b=arBUgT1tNC20vBIOCNmM6YlumjSdesI9JMo3Xl/6EOPNzELNrZKHa1yhJt+92sRpH2
         8F6QXFvoaNh/a/nSlS3gJp1RpLor6f7wVxSwO8PQYoS6cu34VCoYxxvcj6Xtsv5Ll94O
         vK8Zj8ESQ8zu78qEB1ic0+FfrHgT1enuixkMKuidfWGJksriBud6O5OW8/B+y5tyGZoO
         K2MnQZKdUNmofSTfXzU66+7xQAAEgCgRMsZZuwm7/gezqa8gVnZtSSKcrpg7S7krO8n+
         GQmjg7oDGPwPxKAfYCFIRUQLESrn59hIwg2t3B19p/iXZkf9RtyPq2ahnmhflshJqocG
         dQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556781; x=1744161581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3yUz8B8UOwQKdx+ikShwAoRAzuYVj/mGC57kza1e97Q=;
        b=ukdNP5WS+QXERb/EmUkw52WizqzGZlPY+nq580y+THgR5dFwF2x+vqxz153et61G8Y
         oCaZJj2bTblu/pvdo9OmmhlaZl0Xju0aW6AKTYze4RE5nHbLC2FvDUQFXBKZdf5vYAOo
         9GnWPPFI8f+miNYaApcUw4dhboI6ZlT7E2nJ2GN2FJVLbgVwk7xVBzXj+zleMUW6E5Sm
         kZy+Gd+7TUV7drg+JTZatIhiuUl/QP1HLViB35TQucTV3CnxmEaemneTo95opEQ1a6bs
         N6XIv+vDvTICbZO5xKg05Vwb2FZNpLpYh9hAeT6T8YTTynLPxGkuKtVnNsyt8auabmWl
         SwqA==
X-Forwarded-Encrypted: i=1; AJvYcCXDbaqrVwmfa5BD4egwJUNXvTtlR+lF0RDT8bOygoTSUC9W+lrelCWP66SY3L1lWqfIl844XjOm+PuqutxV587/@lists.infradead.org
X-Gm-Message-State: AOJu0Yww8FWQy6zJ4AmQ8MJyYOiIrYTlJ8iFuC+p9MBy/+7sQww7EIJj
	aFSzJQpMQU5zXVNQ545pAFRx7ZdKuBMFU8uvl4irVTJm0f0Am/yE5AVKGg9K0oqOk9e2/KWRNkB
	9
X-Google-Smtp-Source: AGHT+IF2odUx6KL5NWFPqm5G8r/6pPbHDFTjru8tv1QaI+AKSymC55lai62Y/Vh/TzF1U2eaSauiAA7d+M0=
X-Received: from pjbpl10.prod.google.com ([2002:a17:90b:268a:b0:2fa:15aa:4d1e])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:538f:b0:2ea:8aac:6ac1
 with SMTP id 98e67ed59e1d1-30572609c09mr225709a91.15.1743556781014; Tue, 01
 Apr 2025 18:19:41 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:31 -0700
In-Reply-To: <20250402011832.2970072-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-3-yabinc@google.com>
Subject: [PATCH v2 2/3] coresight: catu: Prevent concurrent PERF and SYSFS
 mode enablement
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_181942_370962_556777CD 
X-CRM114-Status: GOOD (  15.75  )
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

A CATU device can be enabled for either PERF mode or SYSFS mode, but
not both simultaneously. Consider the following race condition:

CPU 1 enables CATU for PERF mode.
CPU 2 enables CATU for SYSFS mode. It only increases refcnt.
CPU 2 enables ETR for SYSFS mode.
CPU 1 fails to enable ETR for PERF mode.

This results in a CATU being enabled in PERF mode and an ETR enabled
in SYSFS mode, leading to unknown behavior.

To prevent this situation, this patch checks enabled mode of a
CATU device before increasing its refcnt.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: James Clark <james.clark@linaro.org>
Suggested-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c | 6 +++++-
 drivers/hwtracing/coresight/coresight-catu.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index b1d490dd7249..0caf3a3e75ce 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -466,7 +466,10 @@ static int catu_enable(struct coresight_device *csdev, enum cs_mode mode,
 		CS_UNLOCK(catu_drvdata->base);
 		rc = catu_enable_hw(catu_drvdata, mode, data);
 		CS_LOCK(catu_drvdata->base);
-	}
+		if (!rc)
+			catu_drvdata->mode = mode;
+	} else if (catu_drvdata->mode != mode)
+		rc = -EBUSY;
 	if (!rc)
 		csdev->refcnt++;
 	return rc;
@@ -499,6 +502,7 @@ static int catu_disable(struct coresight_device *csdev, void *__unused)
 		CS_UNLOCK(catu_drvdata->base);
 		rc = catu_disable_hw(catu_drvdata);
 		CS_LOCK(catu_drvdata->base);
+		catu_drvdata->mode = CS_MODE_DISABLED;
 	} else {
 		rc = -EBUSY;
 	}
diff --git a/drivers/hwtracing/coresight/coresight-catu.h b/drivers/hwtracing/coresight/coresight-catu.h
index 755776cd19c5..ea406464f0a8 100644
--- a/drivers/hwtracing/coresight/coresight-catu.h
+++ b/drivers/hwtracing/coresight/coresight-catu.h
@@ -66,6 +66,7 @@ struct catu_drvdata {
 	struct coresight_device *csdev;
 	int irq;
 	raw_spinlock_t spinlock;
+	enum cs_mode mode;
 };
 
 #define CATU_REG32(name, offset)					\
-- 
2.49.0.472.ge94155a9ec-goog


