Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74599C98304
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 00:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JCL53sxKRzp61dtGrnrYmPy4+hTQjDiBDeC0aw2Pc3Y=; b=b+l55iSKzIWFvhmnDKl1b/e96C
	mB5n3uOfyxUpB2vPqmxlTg6S0pKLqDC0XXHkeuEZK1Tu9mP0VRjC2IPNTdavlFK4PhRIkuguwsTZV
	IYLSHYNNZ7kAfTLkrkPkewgtv3GY5iLT+pE/20HPzBs/h36xHH5B1aR6imLmiAruBsAPTmWUJ3P9s
	vyNzjmWEIQVdqwb3PAejEXZoWuDFMQYGBF137r9bRJbZkeN100QqMpnH0gp8JvDJgUebM/mFuiwPf
	4/nuvZisBAtXeHq7P9Jm0OoWxPfRF/RF8GRoPlI0q7zEez+39nTMvMwvnWE3d4rfPu1Hvb7GSIs6w
	8c03tDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9XBB-00000009kKv-3gBb;
	Thu, 24 Sep 2026 00:19:13 +0000
Received: from mail-qk2-x11.google.com ([2607:f8b0:4864:34::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9XB9-00000009kKX-1t03
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 00:19:12 +0000
Received: by mail-qk2-x11.google.com with SMTP id d75a77b69052e-530e28a62abso18294821cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 17:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790209150; x=1790813950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JCL53sxKRzp61dtGrnrYmPy4+hTQjDiBDeC0aw2Pc3Y=;
        b=gm8olykX8n4GnWaGwLUOa2JVnM7iPpZps5kRPCyjCcSP9vasCAWUVg3ePyq0waYCQm
         8/DkSTWoU5MLRTv8+RHYsPrtwsey95A6pa4JVgfjEYq41xvG3ExckWx2LQzzT6cXLLSG
         Phy00MwoezVuX0YuB/mxBGwbXt7qkPfmLkl1byud5lAFin07xXE4D5Z08kqFUmataVHn
         4eFkHcj/QHRGIwOxY59XH+nB/7U/goI3Vd9BTX9HvfY5O4Im6ZAkaJxH7K18WbStAc8J
         tY9XvMJRW8UiyCdHHyxzvmnAjgyVO8DQqTjp3WNNxslV2ZVliCYI52LJHMgC9NyYodHW
         CuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790209150; x=1790813950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCL53sxKRzp61dtGrnrYmPy4+hTQjDiBDeC0aw2Pc3Y=;
        b=n8aqZ8slusqVXGG/yl285e1i7WnXLG3CvuNx7Jp4u+8FImuoajo9sjcAoLf6+MJsMP
         yFhw64VEEiAnrMeG/TdhOmHZmpb3swi+cJwwPd7ml3PCo5Q0XaWd7G5+44fCMTifqfmJ
         hFJV7qtB+23mMqHZoUC/CmRtPGczvbJA6Yg/SDZ14qpg+jBB3wrSlL/JMZDDF0MTO1ra
         ijeepazzvJseSfanoiERcbS5dD7bp8dnhJxNyVPhZqsRXvlM/6Q35OvwjE6YNzE3Ot/F
         rxek9MjMaz0s2SnTtOgZ2RsCT5lOtRp99GKQsX6+1UP/fCANF4VlZsoplF6dH0WlvK8W
         f2Aw==
X-Forwarded-Encrypted: i=1; AKwUvBy3B2WiakhYxFVCpeYDVc7am84qvuYRX3XrWeWqF7BBwZyQminSTJD8z8OJPSeEaJX6zJppGtgojVV0Oth3S07q@lists.infradead.org
X-Gm-Message-State: AFuF++nAxeSlRa8XxDrG0y2402gzZiY7ZcCHQUEIkOwFMQcXWP5Koc03
	teQiDP9uSYsPTrpMTRC9ArlztL2rv49c7Q83NTAARNoWT0kK6XQeXQjP
X-Gm-Gg: AYBFou1phvAitTj1BRbUVp6GEPq6VzodprOWwAhsHc7IBki3PxpnM5G+Q1OPsDnmIQu
	uCn2y0oEDvZoHJyxtFapc0KtRLWazNseCHs+By1Ard9wC1z+QEjrwWh4xI+1HynUB1jSZDpJq1v
	lpIO9JKrUMxCZhDQ6tw+9eNiLB+kEvtRL+DIEUg97fIXtNyMmxnuNQALjV5ItTd8d0h2RQVAVgJ
	WO+MKQw33lW0GMljUrxOpdTkU8jhnvcIx08X5k697pe1+mzt33a5sQUNEw9vWNcNbF7YhHKf8A4
	cY4GVE3ulNTqO6o7Lqk25XywkJSmNwTN1yn9MI1hTYmuehZhNGALWwH70FiBnQCX+YeHSFVdTEs
	MozC552KKxPnK99KEVOEpJzM7gYrVKFd+0uUl57MQttux3wGx4ylA/wYBzACq3Z60hkCIvm27z/
	/0zu/b4jFB/406MWPqznWT37sZRK9By3vZ+A5I7FvL3WAiYDKuwWl13EktOhrR0M4XE5HIFtCUC
	VA2o55wNMW9H9J+Prd3Eg==
X-Received: by 2002:a05:620a:8393:b0:93b:f083:b269 with SMTP id af79cd13be357-93c3642fe19mr48680085a.64.1790209149728;
        Wed, 23 Sep 2026 17:19:09 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e0d771bsm5694546d6.1.2026.09.23.17.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 17:19:09 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v2] coresight: Check runtime PM resume result
Date: Wed, 23 Sep 2026 20:18:56 -0400
Message-ID: <20260924001906.715322-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_171911_499928_2097AC2D 
X-CRM114-Status: GOOD (  13.44  )
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

coresight_get_ref() ignores the return value of pm_runtime_get_sync()
and reports success even when runtime resume fails. A path is then built
and the CoreSight device may be accessed while it remains powered off.

Use pm_runtime_resume_and_get() so a failed resume is reported and its
runtime PM usage reference is rolled back. Drop the module and device
references acquired before the resume attempt when it fails.

Fixes: 32b0707a4182 ("coresight: Add try_get_module() in coresight_grab_device()")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Changes in v2:
- Point Fixes: at commit 32b0707a4182, which introduced coresight_get_ref()
  with the unchecked pm_runtime_get_sync() (Anshuman Khandual)
- Switch to my oss.patchbox address

v1: https://lore.kernel.org/all/20260802232552.593435-1-dbgh9129@gmail.com/

 drivers/hwtracing/coresight/coresight-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 928488a216d4..c492f9082c46 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -843,7 +843,11 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	if (pm_runtime_resume_and_get(parent) < 0) {
+		module_put(drv->owner);
+		goto err_module;
+	}
+
 	return true;
 
 err_module:

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0


