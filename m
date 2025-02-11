Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956BFC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=; b=1un6AciYGhLTqQauF2dae8uEUA
	tXyTLZZqhmlhSGd/k9ybYPe6eTKDS7k5PAQTYoEDDQqxWX6J1cPC0dCUU6RtKOq6Vg+R4VGQAvCZa
	xGi4YQhxyVaUzx5qIc+Jr+k3GtRxDca6rwoHRX/cGd0ieMHAeG2hQmKV/OoGi3owCxWT+LBA1HgbB
	7fBKuwtQf6/NOSDkOCcr+zsYcUNDOUMuequX1z3CDkGGYxe7mGcc8lylTA7Cy2gNRaFn8JM61jics
	a9CHnA5HWrLe9GXDOxX0og5KwOLifoPp6wU9cpynjjrm5cKtgAKCMdLwbkQgcaAaAjlRVIliiW+H9
	20PfTmEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnqC-00000003Q84-0sFX;
	Tue, 11 Feb 2025 10:50:08 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnh2-00000003NvF-3U7V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so53406665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270439; x=1739875239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=;
        b=eqGWkm5z5Bb7C2L31i/c8Gkrzc6Z3Wq7Agn99F2uNSkmcAGN0O+r9sGOeAr3Z0Acrh
         Wlg1yGJIMD2ePzoZLbBay5WlX8oveyUKuNcqYT3jSSy7a/0HMPggUjUZuVj1SFZ5C/bx
         BQbUh8+n4vuj0HuJD8/QuyWhjuVCYoOYx/7YUW/vPn7eCtF77MHPNeN83zhh1j8elTum
         HAJuZShiMhLFhNWxQ+LXxhaEnd9yx2oKbnLqkLv4/ccp/J+XLsNb69+ANybnewRVGbGo
         L8rIQIrn9YQ85IRoZG9k2E+6pZPkC9aLGakTeJgUy6vhtt0k0RU6c2tMAjWxifqXFBTp
         zrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270439; x=1739875239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKjlxs2/NLZM1oTa5EiDclwanqKKN/FNJx7pDcED3LQ=;
        b=Re0QlLQFCvE4nabvGJJU8VJdMVi60rljta278xx0lWGjGDZeWZnXYYl/fK5vIq32YV
         pZqBFeUZ8wlnvRjsrbSfb2Qr7WqACSLuKn3Av27qLNLCtv3dzmbsf5fHEVNESGSLjalE
         zLYsFpzuliM9OJ4Kc2LD0UyZNz9TpxO4LZCg951r8HfzY802z293zGv7z9yCkBQ96qgz
         ujNcphcMg8E8byOMfJylq2Vq8G8qKuwW0lhev5A2VVWW8PTyLS7UiNrnUuF+6KHuM6pS
         j2l9ReHDxdYzwJMMbuoakOFkTXSFADZdo/ztKQ4TJH399OF82h92lyDXxibYnSWCq0vo
         0gsw==
X-Forwarded-Encrypted: i=1; AJvYcCWLVN5JwtRE6g2tl5CLl/+1IseRDKnER3namYfux51rdRxY4y7a5EQx8ODQ5f6nwbrIeHbzxCkmoPSEQVBmJAnR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+D516WSy+s8PvhDsgx4aUvcYTERD+cX60RE+SRAe7CEqVFkV
	XLJAztyQOby6ccVhcQ5SWxI0aeL9RBrw7UTYqv6Qpt3S53UochWUJVZ8mSEoWRA=
X-Gm-Gg: ASbGncvO5fIYkchmiwQt5N55EhFdx0YtyAionp2zIhr0I3Lsbgb4TA5j1qmyUWvnNEN
	5Ox2/xAufU1msDJFPYY2BHeXdVPxUQPMv396ppP5fUw0rGmZlstWEXXcONp625vNWJjqewsdqAI
	WmhsuNbISgeJqBRI6OAIKpD1CTPwt5WeOH7/gaKFrp1PiKjCCa1DLuWt8tcUyEWvpRrvMHcyE2o
	bFa0e0+QXnnenRNAOK9bk9Ug6tJx8ZDUvFxndet5S34+zdNxK/qxjBDPb2+rS0EtFVq4B6JnRaM
	VXMsZxr0/2o/
X-Google-Smtp-Source: AGHT+IHoYKN0xK20CRb2BG7n5QKE/mgzwqqJVxGvuUHYmxPDnLSwWVoOeaDFYouJ/QTG+TlYqu4pkQ==
X-Received: by 2002:a7b:cb88:0:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-43924a27b05mr156406225e9.31.1739270439183;
        Tue, 11 Feb 2025 02:40:39 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:38 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 4/7] coresight: Add claim tag warnings and debug messages
Date: Tue, 11 Feb 2025 10:39:40 +0000
Message-Id: <20250211103945.967495-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211103945.967495-1-james.clark@linaro.org>
References: <20250211103945.967495-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024040_867672_451ECF6B 
X-CRM114-Status: GOOD (  16.87  )
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

Add a dev_dbg() message so that external debugger conflicts are more
visible. There are multiple reasons for -EBUSY so a message for this
particular one could be helpful. Add errors for and enumerate all the
other cases that are impossible.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 48 ++++++++++++--------
 drivers/hwtracing/coresight/coresight-priv.h |  5 +-
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 7b53165c93af..7fe5d5d432c4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -133,16 +133,6 @@ static inline u32 coresight_read_claim_tags(struct csdev_access *csa)
 			 csdev_access_relaxed_read32(csa, CORESIGHT_CLAIMCLR));
 }
 
-static inline bool coresight_is_claimed_self_hosted(struct csdev_access *csa)
-{
-	return coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED;
-}
-
-static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
-{
-	return coresight_read_claim_tags(&csdev->access) != 0;
-}
-
 static inline void coresight_set_self_claim_tag(struct csdev_access *csa)
 {
 	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
@@ -169,18 +159,40 @@ static inline void coresight_clear_self_claim_tag(struct csdev_access *csa)
  */
 int coresight_claim_device_unlocked(struct coresight_device *csdev)
 {
+	int tag;
+	struct csdev_access *csa;
+
 	if (WARN_ON(!csdev))
 		return -EINVAL;
 
-	if (coresight_is_claimed_any(csdev))
+	csa = &csdev->access;
+	tag = coresight_read_claim_tags(csa);
+
+	switch (tag) {
+	case CORESIGHT_CLAIM_FREE:
+		coresight_set_self_claim_tag(csa);
+		if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
+			return 0;
+
+		/* There was a race setting the tag, clean up and fail */
+		coresight_clear_self_claim_tag(csa);
 		return -EBUSY;
 
-	coresight_set_self_claim_tag(&csdev->access);
-	if (coresight_is_claimed_self_hosted(&csdev->access))
-		return 0;
-	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(&csdev->access);
-	return -EBUSY;
+	case CORESIGHT_CLAIM_EXTERNAL:
+		/* External debug is an expected state, so log and report BUSY */
+		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
+		return -EBUSY;
+
+	default:
+	case CORESIGHT_CLAIM_SELF_HOSTED:
+	case CORESIGHT_CLAIM_INVALID:
+		/*
+		 * Warn here because we clear a lingering self hosted tag
+		 * on probe, so other tag combinations are impossible.
+		 */
+		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
+		return -EBUSY;
+	}
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
 
@@ -205,7 +217,7 @@ EXPORT_SYMBOL_GPL(coresight_claim_device);
  */
 void coresight_disclaim_device_unlocked(struct csdev_access *csa)
 {
-	if (coresight_is_claimed_self_hosted(csa))
+	if (coresight_read_claim_tags(csa) == CORESIGHT_CLAIM_SELF_HOSTED)
 		coresight_clear_self_claim_tag(csa);
 	else
 		/*
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index cc7ff1e36ef4..a83113225797 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
  * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
  */
 #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
-#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
+#define CORESIGHT_CLAIM_FREE		0
+#define CORESIGHT_CLAIM_EXTERNAL	1
+#define CORESIGHT_CLAIM_SELF_HOSTED	2
+#define CORESIGHT_CLAIM_INVALID		3
 
 #define TIMEOUT_US		100
 #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
-- 
2.34.1


