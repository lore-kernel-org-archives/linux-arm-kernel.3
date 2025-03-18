Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0186EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gOSFN/1KIzpDFDMtVSThY4tdpbBGk9qFEr0fShnj6c=; b=RBkS+FTLh0E3XSukTo2lcIRlST
	R3eawx3dSaczlxYEye6aAJwBNzYMnzUGYe1wU8q127o9T9W0sSYucyMOTnD2t9aaaXniUiie3+u8c
	sYgEvovfxap1wKcgjOk/DU/jX2al0Rc23tmR0dWM4skC+pbobLX1IHqeRdoRZVh9uAWuzDSxVWQsZ
	9LW6KGgJYxzecZE3yKNV1xeFosMMkkohzWc9xzy7nQ84X+u17mgFExUXcWAIOH0v90BhcZIOqVhBC
	Vkddp6ivcb1opmhOPBSHMI5Wa/XokXk+FQnM+7uKCY4RtiBvsxoecIgkbDOkryUcT8E3q1kjlg8KB
	++YdSD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZlK-00000006WZ4-14pi;
	Tue, 18 Mar 2025 16:25:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZhy-00000006Vpj-3qQN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43948021a45so35708565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314945; x=1742919745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gOSFN/1KIzpDFDMtVSThY4tdpbBGk9qFEr0fShnj6c=;
        b=vf6VYY/3SDIDR+cXQ8CXUuu6NBU1TD2dy9pTK9yztHpwSgv07zjQeROBk+KrSZ5JnM
         m00Fva5ygqRR/wQNEufblbn4CMfFBRlkgYSxMgMYw4DP36mBQusnADaDbIfvt62PR7T6
         SqJQbnIIBJV1MSx4g2J5KCfoutOIc+d94xsNOCdJV/svPv+x/QWB95Ug8J/N3pW9ydMs
         DsWnAlSwrlsxk/t5/kSb89sxmnGY6901aARquCq/G24KARY49anB+Bu8ogTbjlHVzpN4
         9rge259FN3C7f5Z5em+SbGPYtaMw2R9duhBAw548wo7nGsCCqEmpjfzDtcq7/6JCWsZk
         ViiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314945; x=1742919745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gOSFN/1KIzpDFDMtVSThY4tdpbBGk9qFEr0fShnj6c=;
        b=bxqa6JoO08mbI2hgW8m54sxCpHe47m/mCA8YHoOrxXTz2le7rDv2MWsPZMf12BZEJz
         2NlTfSSq5egAPsWs2AYf0f0ToezuY2eo+0VarfHvI2LTUToHSY5SXLz79Xp7r9HmdaiZ
         Ov6vR/Pdx8pM8esWIryLY6WmVlRaogJJ6kJ/1wx91fkA7P3QX9532qbvGYze0gxAkZVP
         +e1dC79Ijs1wdrLu4TOrrAv8ndalfGKOPjQM+4CLJ8QoKP7B1f/EwSkhuXJfBS/LbJmK
         drrMNWGtSBdK+zf8rHXyg+V2RY0zBZLNEN6oE7fD5k2V4CLDKAc6T+GAD4Dfry0oZekT
         XkrA==
X-Forwarded-Encrypted: i=1; AJvYcCVGj3EBDAoyQwGnGe44BVf9aITOKGyXjOLAs87tXDFLEkMx63gAmXojF7h7c/NPRcT28p/HWImEpXeTvAoRN+Uc@lists.infradead.org
X-Gm-Message-State: AOJu0YyjYuzWWRuVum+jDsfD93R6rh2uVrljQTj2eXQvH5tsvyrmMls9
	4QKW2bJNSP9QZWa2XC8yjixr/gw47CTiXjaRnyAjVV5qFhozSDaYM903f5aTG+E=
X-Gm-Gg: ASbGnctkUq8aPej85E4Au3EtR+grLznQ2avPf46uLIoJKb0N5lDcIHKOwhBRfd6cmO5
	TWrXbfKMMHcP/KI3ySufPcLcy1wEDGAHDCCdcPjmWmcyVgrMf1rAEQJTPmOmeE1MjhQOiA/0oW2
	Opdpn83GNTqz8317D0L4rkeJQePcSVjKjp/KWMCW/HntXUluM2U4t9bEBnCVihwv3ff6fcMhH93
	IL/2SASH0Np2FAsB9+LIgGiFt18DZSFaruXCo7ze0qVF5lyB3SMtAA1kW/i2U113UdT6UeAjoQT
	ts8XW38GFvL+fie6C+HLKB4z66iMhCshV36fPiVCrKU69aU=
X-Google-Smtp-Source: AGHT+IHHZ/8jKdHrmeWg2W9ew9ZgBKl+G80VmK6gRjbRZx2tpx7r9TxqGynoIPH3wrYx9//VdC/l2w==
X-Received: by 2002:a5d:47ac:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3971f9e7813mr16838834f8f.47.1742314945185;
        Tue, 18 Mar 2025 09:22:25 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:24 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:55 +0000
Subject: [PATCH v2 1/8] coresight: Rename
 coresight_{set,clear}_claim_tags()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-james-coresight-claim-tags-v2-1-e9c8a9cde84e@linaro.org>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
In-Reply-To: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Suzuki.Poulose@arm.com, 
 leo.yan@arm.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092226_970951_DB3BC0BC 
X-CRM114-Status: GOOD (  12.52  )
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

These look like they set the whole tags register as one value, but they
only set and clear the self hosted bit using a SET/CLR bits mechanism.
Rename the functions to reflect this better.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..3f1c996d668a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -144,14 +144,14 @@ static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
 	return coresight_read_claim_tags(csdev) != 0;
 }
 
-static inline void coresight_set_claim_tags(struct coresight_device *csdev)
+static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMSET);
 	isb();
 }
 
-static inline void coresight_clear_claim_tags(struct coresight_device *csdev)
+static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
 {
 	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
@@ -176,11 +176,11 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_any(csdev))
 		return -EBUSY;
 
-	coresight_set_claim_tags(csdev);
+	coresight_set_self_claim_tag(csdev);
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
-	/* There was a race setting the tags, clean up and fail */
-	coresight_clear_claim_tags(csdev);
+	/* There was a race setting the tag, clean up and fail */
+	coresight_clear_self_claim_tag(csdev);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -201,7 +201,7 @@ int coresight_claim_device(struct coresight_device *csdev)
 EXPORT_SYMBOL_GPL(coresight_claim_device);
 
 /*
- * coresight_disclaim_device_unlocked : Clear the claim tags for the device.
+ * coresight_disclaim_device_unlocked : Clear the claim tag for the device.
  * Called with CS_UNLOCKed for the component.
  */
 void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
@@ -211,7 +211,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_claim_tags(csdev);
+		coresight_clear_self_claim_tag(csdev);
 	else
 		/*
 		 * The external agent may have not honoured our claim

-- 
2.34.1


