Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EE0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 01:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSlxqnwG66RpI4NydmFyMljcKVBEXuzMCiirmmrdybk=; b=V9b/AmscVxbATP8a1aG4k+oKwW
	T6H0zbt+n/xDF/WklwmNkzqt71PmrDf+1NdO7npT5OoW51FCyKKeC8s6A8+j/feOo6Ywlcfu4qTv7
	JUjfpodN7NpfaAT6ZFFJyEK/nxd/AQTACvl7MTIxFT3YtaDIGbu0Km8Hw2Fy13Tedn+tLA+rNSnR2
	HmA6o+/0ZVlsl1bfjNaPDis6R+j9gI1sa5ZbYX/34eG8w03GiP4SxBnIydBcXxd6mXa+L6WfK1ZsC
	6LUtDbtZ+k1aimQlUAkm/lDYx53SHWAGyYwrN8YmpA5IiVhsP1BPw0V17KrAV2UsV4WnbQwLFsyhF
	CRjrZjTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzms8-00000004q0c-0W8J;
	Wed, 02 Apr 2025 01:26:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmlg-00000004p7U-08EE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 01:19:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso11580855a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 18:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743556787; x=1744161587; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSlxqnwG66RpI4NydmFyMljcKVBEXuzMCiirmmrdybk=;
        b=qRIQMOfLxGzdgHrP+8/YUf8ltHgI3PQxSIc0C18Rm+foTJam+r3WO4rc3SoSJpUVfQ
         JizMsNTdybi7FaT0ZZwashaf16z87bik6nx55+sofGZFLL/1bqvuCAqumOYIhhuEBp2d
         pLMwTRaez/xMwImelG+67BcDiImgKlwf3DAaZg/rvtLnnGI8ewzfNcTClK/Y7t0Pu/Dh
         zD1RP9QyIgPgHiF6PW8K+GzWqqjcfxdJIfD+i7S0WPng7NHwIgHNaEBHptElIF+phYp4
         Eyd9r+SjmZZ09vMyOh8YOPMONg1SUq8z9OPi4WOnSf5WLe+jJ1KDOzkNuRVpyttD9roI
         mg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743556787; x=1744161587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSlxqnwG66RpI4NydmFyMljcKVBEXuzMCiirmmrdybk=;
        b=NBDV2pe/DKOmxmLBR2jM2vRSVCuJ8bJYyFRJL1ClLwyJiP8AwsqvfP7IvmJ3s58sg8
         aG9b4523WkkI8YSrTaSvZsXXSFG/zIxTwWz0gQ2DcMxvZJsZJZ00WWLm9tGdTEubiK5m
         LG71hTgQcSf5nehWL9XjHZAMFCRZqVKgnraMiZDSp7uW0zpF8iqI5wrFjoN0NWSlio1c
         bxkErCJSBH39kyQu+eJKz4a4AQJy9M7NO4u0+eBFAHLq0rxUCQ8r9uImGisELOwHEBnx
         PYxbwylK27LHpk5DZgpmDmA2hHEla+1WL8veMd0zHxYYOVMAKAW/5C+NdObMutLsGXIa
         fD5A==
X-Forwarded-Encrypted: i=1; AJvYcCWoSwLDPgsNc0fAO9/pKqusawJbfW4OHeSZKXP4f6V1W1ss1v1/0CbLqapzMI0CjyUrVWbKiMImhAMr9lwQ7VlB@lists.infradead.org
X-Gm-Message-State: AOJu0YySOPxaMIhTeUDto6BCLpuBURxQNSQgNMB4awVynufg3bWosfmj
	6Z+QdchY+gcEwmd6S4AzEbPOa8yAYgURA2WIj/oV8n/XyF8+Vl+vOHYSDCaafumf0JANKR8Rz0v
	s
X-Google-Smtp-Source: AGHT+IHJEWX5SyKsMBVrfD11mTlu3gj1TMgPFW597EbBGHguuUgIjtgGC2kPgrrqDa/yLFsO+hpRhNIFFa8=
X-Received: from pgax9.prod.google.com ([2002:a05:6a02:2e49:b0:af3:da1d:452])
 (user=yabinc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3a8a:b0:1f5:520d:fb93
 with SMTP id adf61e73a8af0-2009f639283mr27306581637.24.1743556787109; Tue, 01
 Apr 2025 18:19:47 -0700 (PDT)
Date: Tue,  1 Apr 2025 18:18:32 -0700
In-Reply-To: <20250402011832.2970072-1-yabinc@google.com>
Mime-Version: 1.0
References: <20250402011832.2970072-1-yabinc@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402011832.2970072-4-yabinc@google.com>
Subject: [PATCH v2 3/3] coresight: core: Disable helpers for devices that fail
 to enable
From: Yabin Cui <yabinc@google.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_181948_113898_950A5273 
X-CRM114-Status: GOOD (  14.05  )
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

When enabling a SINK or LINK type coresight device fails, the
associated helpers should be disabled.

Signed-off-by: Yabin Cui <yabinc@google.com>
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..e3270d9b46c9 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		/* Enable all helpers adjacent to the path first */
 		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
-			goto err;
+			goto err_helper;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -480,14 +480,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		switch (type) {
 		case CORESIGHT_DEV_TYPE_SINK:
 			ret = coresight_enable_sink(csdev, mode, sink_data);
-			/*
-			 * Sink is the first component turned on. If we
-			 * failed to enable the sink, there are no components
-			 * that need disabling. Disabling the path here
-			 * would mean we could disrupt an existing session.
-			 */
 			if (ret)
-				goto out;
+				goto err;
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -507,6 +501,8 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 out:
 	return ret;
 err:
+	coresight_disable_helpers(csdev);
+err_helper:
 	coresight_disable_path_from(path, nd);
 	goto out;
 }
-- 
2.49.0.472.ge94155a9ec-goog


