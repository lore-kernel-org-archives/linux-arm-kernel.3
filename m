Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52331C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30vcmK8Kb7EgO69NndpoCL59432NFZcGkb09xNX7nz0=; b=aykO4UowlR2Ofkedczowz/esra
	q84gIH+A5wx9mgbAyIbOLhmUCk5WWv/t/+SaqL5qkOdIQQ9Hka1KoKROZQlP9OhLiGUQ/8hMJ1Gji
	J2BVMfPVFC+9MnL7R0k4YK/w7yCF4Xk0e7iXaIp2UmG1Iwf327iGULKSWAd1gOCx5+Awa2ntXmRqM
	AjD583XTb3tmWknE5y5pdpomcalwtKyIZekBHPNPZQcOxjc7DTsK0iZw24MTFsJG9uvlBhMZBYPD7
	i0eN4GhJwluZjIp8GboMEcUk5avYcLBMDBrTPXIQoYpObSPaAq1G62iX8cyas2uO/BeKSWyf8YwLx
	qDg9wadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZmy-00000006Wuv-3zfg;
	Tue, 18 Mar 2025 16:27:36 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZi0-00000006VqL-0DzM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:22:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39130ee05b0so5747584f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742314946; x=1742919746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30vcmK8Kb7EgO69NndpoCL59432NFZcGkb09xNX7nz0=;
        b=iN2ouV8GDbcz+b9bqysQNvr77vdvkyG2szymGHY+TwUjC+riGHfkJ/iiEmjJriBpOd
         a9dzS9KX/JHb9/iAfZgF5Kid05fJzuNqltEhBgLldkA23ru5/aX0r1IaZzAGnRJFnX9Z
         MwXpsXZoZ7dDrCanI1/PZWXvh4zJsomc6awy3P0GPqqx+Rma+dDd6dOAM6ntzT+gtf69
         L+ZXdnDQlWo7bhrlBHIShEwOZ4FNhC3PvaO4b4dTWhXryK/it8kBHcCh3cBSEP2LYXO1
         fkYhmk7KRUEGZ/rCmh1X41tKliHFiFgvlna0wal4HV0JACtu17FQnypTKsB7fKuiRXYM
         wqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314946; x=1742919746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30vcmK8Kb7EgO69NndpoCL59432NFZcGkb09xNX7nz0=;
        b=JdLbCd+IFye5/M9Nf0HRKQ/Cl1h4hMf+QW4BHGwkvSVFZ6lf47uTyUd8qMkdWcKI3f
         +pQmemMwXfZgFzK5QFIpz06ippDUsTDshmfwDp2q52YxoEMcnE+4Izt+x2d8F24SySxu
         q5zfNsxJdKtmhogVhcjhoImn9gVP/sAtbbux+pmL8bzVzzQjnaDRUPuJTP4jTfj+t524
         /RQ4fGO0pVc5/AhO/JO74qSKnhNsAxSq87mKGw4E9qs8NplQQcBQUR2gUyGNkMl+60Zw
         JFvLVrHrHNP6l43euI5aU20SbIIsQqlALuadHThi/qhbsGMq9WYE6Q0LOfYmtagPcrWn
         ZXtw==
X-Forwarded-Encrypted: i=1; AJvYcCUlzfQITW0PvjdM+Vi2MjywHyAclgdv2RXNL3eZVG3bJb/OwAR1st4Wnps6qQUnaAmO5sL3x1c9XcoyQaDTZlgz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7anOrz/qNUSngRDzCtKOt4IARCSXpwB02sHVVrXxGT9eQ7nR4
	yHXCrjCRrym1IMO5QYcxmyNEXAD49AXnuz7penJuFY+oe3wq2AXt34ioZ6cdtsY=
X-Gm-Gg: ASbGncvpXGIR/pnES3hXdBHLrpiNIrriiuPpAkQCqIfcyVS95GMEUSudC9SZRApbCqw
	4Ya0lqQ7o4QbDGzQN/CNQ9QqAMG85mwL4S4QjSNB0p5ToYSTdmrT10Py/8uX3Xfc+DeI1SE3xXP
	AMu+vqV8bdAbA8ZWUVt56/HIIe0SP0iFY6ZMr0FvNuAfBe1rx6Kum/eXCYBwbLl0Zzc2Dd9V/IA
	lk/B1+6YPb0ZIgqD5zXyV3so6esj7u9ln+lKsQ7sWktkjQQYoZz6GObl9aNvcf9jTUyrQ+oAhsP
	f3j0vlNdqyiGLqZiARBr1Abp3ib4ymhcHYisiEtrvdVJwSY=
X-Google-Smtp-Source: AGHT+IETiy237nAdexxdqvMHP+odcdjCXjFhjN9Ayys4lYn4AXHoxQDsgrwFoHMV7AdF0nuLdpHD2g==
X-Received: by 2002:a5d:47ac:0:b0:391:13d6:c9f0 with SMTP id ffacd0b85a97d-3971f9e7813mr16838898f8f.47.1742314946529;
        Tue, 18 Mar 2025 09:22:26 -0700 (PDT)
Received: from pop-os.lan ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975ae2sm18914732f8f.51.2025.03.18.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:22:26 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Mar 2025 16:21:56 +0000
Subject: [PATCH v2 2/8] coresight: Convert tag clear function to take a
 struct cs_access
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-james-coresight-claim-tags-v2-2-e9c8a9cde84e@linaro.org>
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
X-CRM114-CacheID: sfid-20250318_092228_103449_A4827D4B 
X-CRM114-Status: GOOD (  13.77  )
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

The self hosted claim tag will be reset on device probe in a later
commit. We'll want to do this before coresight_register() is called so
won't have a coresight_device and have to use cs_access instead.

Also make them public and create locked and unlocked versions for
later use.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-core.c | 17 +++++++++++++----
 include/linux/coresight.h                    |  3 ++-
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3f1c996d668a..9ff601e2415a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -151,12 +151,21 @@ static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
 	isb();
 }
 
-static inline void coresight_clear_self_claim_tag(struct coresight_device *csdev)
+void coresight_clear_self_claim_tag(struct csdev_access *csa)
 {
-	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
+	CS_UNLOCK(csa->base);
+	coresight_clear_self_claim_tag_unlocked(csa);
+	CS_LOCK(csa->base);
+}
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag);
+
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa)
+{
+	csdev_access_relaxed_write32(csa, CORESIGHT_CLAIM_SELF_HOSTED,
 				     CORESIGHT_CLAIMCLR);
 	isb();
 }
+EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
 
 /*
  * coresight_claim_device_unlocked : Claim the device for self-hosted usage
@@ -180,7 +189,7 @@ int coresight_claim_device_unlocked(struct coresight_device *csdev)
 	if (coresight_is_claimed_self_hosted(csdev))
 		return 0;
 	/* There was a race setting the tag, clean up and fail */
-	coresight_clear_self_claim_tag(csdev);
+	coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	return -EBUSY;
 }
 EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
@@ -211,7 +220,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
 		return;
 
 	if (coresight_is_claimed_self_hosted(csdev))
-		coresight_clear_self_claim_tag(csdev);
+		coresight_clear_self_claim_tag_unlocked(&csdev->access);
 	else
 		/*
 		 * The external agent may have not honoured our claim
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index d79a242b271d..00134a80d358 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -685,7 +685,8 @@ extern int coresight_timeout_action(struct csdev_access *csa, u32 offset,
 
 extern int coresight_claim_device(struct coresight_device *csdev);
 extern int coresight_claim_device_unlocked(struct coresight_device *csdev);
-
+void coresight_clear_self_claim_tag(struct csdev_access *csa);
+void coresight_clear_self_claim_tag_unlocked(struct csdev_access *csa);
 extern void coresight_disclaim_device(struct coresight_device *csdev);
 extern void coresight_disclaim_device_unlocked(struct coresight_device *csdev);
 extern char *coresight_alloc_device_name(struct coresight_dev_list *devs,

-- 
2.34.1


