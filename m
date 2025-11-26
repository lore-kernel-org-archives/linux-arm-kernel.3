Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A434ED10F23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUVV/T8T4EDM+0Q4tOFA1c2x/rxW95efuxR6QK7Q7kM=; b=3gJMbOaT1sPTqwfvHNSZfb5UH6
	lrN3/4noht1qXfP+pnRazyMKLHYT2p0BokPIUYyY7RMRpmq5MoWmnisVHHm26myNTk+4iuEhS8SUp
	Awlud5V0D7dGk7vWDkVDlI70gPMaAIlOSLuj19rDKyowig1Mbs/8u+ygQA6g4F7yYAnqpPSismRvE
	TTtCKRAtqQGsluwtYTqEPv73VGZ4+NHwzJtXb761YoOfTNmAqv1FoLgHoKZzBbdR7M+BVSLHfJE4+
	RwFxgI1R8Gs4ndRAivtRGHLBm1CysYFdZBRGUQ8he6CydCXP30YojlOqiG7MXBfUgtE27luMo5b51
	5/x16Omg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE1-0000000ErIa-3LlJ;
	Wed, 26 Nov 2025 10:58:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDi-0000000Er2r-3m0M
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Nov 2025 10:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HUVV/T8T4EDM+0Q4tOFA1c2x/rxW95efuxR6QK7Q7kM=; b=UPBQYXg+uoVT9fO0so+Buaq0IK
	DNFyzRshSPyaggVEG7Fm8CicEzjz1L9FnMzmvt0EPMLnw0yktCNZ84KWmY920bxTM20WIjZzxwqQR
	hsa42pch7YyPBwbgLNGUNd2GbIF1+GgGjGr//77A5DHnvSXg+hEn3caIPh98dNtDX8to0XJA/gYgG
	FbsUczWXmNJUXiEa1SJOQLphU5lHBmq2faxIqOlz1MgiPgz6hItFYAGYiYKEl+BHjQZiimADyxdcI
	P6gFiJq0A8IvJYgP8162FnP4iW5tLGalD3P0LHQU60IlgPqumXhCsQC4TRwZ/KiNy//YGEEwS+PY1
	W/DK4BjQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOCLz-00000007luO-1Mq1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:02:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so37551345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154668; x=1764759468; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUVV/T8T4EDM+0Q4tOFA1c2x/rxW95efuxR6QK7Q7kM=;
        b=NbhetCw7lrNtjtl+EB/dD/jOMhPpYoTJg7xd+unJOiCqEkFYirBWPMGD6D94skvRNE
         xM1oRFgJHyQKXFQwDUWSdtxLfYdtOs620tQLimuLbKvaXfKNQGv8KNP2Eh3c2v5SNy6W
         seKEPc/gCza3RHWWx4CdYvjlfsrUEvFwsKtibEq5WQjWhkdkrvPx+7+P7xCJPA7DZsBj
         VlrFchiA7OtsNdNJ55/x5Av7FMc55PplVo8/zhycwU5U6uc+41lc/wjeJjzya3c1WXeJ
         o+4myvlloc5YLJ1Krtzvnft5ycgo9wMzlryQUOWIP0676woRK1UBA4v5c9Yi1qy2w3CB
         boww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154668; x=1764759468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUVV/T8T4EDM+0Q4tOFA1c2x/rxW95efuxR6QK7Q7kM=;
        b=aLQE1pptvabNKCWQuE+pwlxya8Bg5z76UjUdTHTufo1F9VDDxF0eE0erCxRI7CnVAK
         9/J1kAnwkR9N2bfENXZQO29kOJOskgH1h52DgbqYlRJkOzmYxI/ZRZnTgHkj1Ep5KSH6
         7d3nBRD6Ghk7KAKNBokfmGD08jFqJ6ELdeHon3wyoBHeoBhsAPlq8XjZ0u3sVXG5nwJ5
         EnzXwvY7fNG6/4ajzCcc+6s15RmK4LUV9Tzf0oJQm17wsY+5bB71m4u1IT8672lKjqDU
         VkdxvkP7lqvQTPJ5QzWL8EJwos9rbsR7uqK6Zn1VNI1s9lWL/AOVujUw4eb280TGvZO0
         s/AA==
X-Forwarded-Encrypted: i=1; AJvYcCWt3NkBgBUF8Rlfp0Vdaj5cVAl5CMEyYumfAFy4ExMe8hbfEvAoMJR+aMwQ6q8U5dDUlha4Bokt3mlMxomV09sb@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2GV5lomnmNnTFwQ9AEofRFAR98irwYhaXsrm0xx5+SDofov0u
	wTIOaSEn97GMMDexGKf5r012Pt3T3A2FMJ2nQ3Vt34nNiYrB9AfNbyky6L9KxJfD9m4=
X-Gm-Gg: ASbGncsuci6tCLhZZIik0bTjevR2MmOnhlEogLxFWh9W4qxbweRfw4xTDEpZWZL02xs
	pIyyjYjmyciYZqFKN9i7+0ELhZ5z6IIIFWMs1qoixUek4d03ET4Olfk5R7Fguk9hZz+++wMaaNR
	S0QazoqkgkrHjXg1pbvtk535wbZbtrG/tF32JYrhX3sYPZtRzO/+9EgiuIITbskheb9uU26ZqRo
	RR7sv+DmoMTB+GgHbLmJQVUt1fGy0OJ+03Tmgzx/I46NvRSqcx4r0hHcDu3dyV0yhIuFGmWXN0u
	mXi+htFuW6Y6GCFwt1Awi1b+L1kFfNPT6l3PR3QJ0tD15QM7u6aDlhmrpAJKZ/gej00wvIxPGKT
	AwTXlw0/8/QHjdD+wkgcAULgQCDpp/oqEK+UuE0M/si9zvkPIKpEdihqdRZFF2XdmadNK5+o8S5
	mpm72mHCEAU+YFZwWdP4XFeYGba6H50vo=
X-Google-Smtp-Source: AGHT+IHr9OD/bYa7kCE9wYLO/nvBpjL2TDJwlh9xxTIxpSRsCk2PvkdlXc82doB+y4Iey6KXw6usdw==
X-Received: by 2002:a05:600c:3b11:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47904ac464bmr56206475e9.7.1764154668436;
        Wed, 26 Nov 2025 02:57:48 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:36 +0000
Subject: [PATCH v7 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-7-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_100231_066838_EE13B06A 
X-CRM114-Status: GOOD (  11.94  )
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4511fc2f8d72..584d653eda81 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (config->mode)
 		etm_config_trace_mode(config);
 
-	/*
-	 * At this time only cycle accurate, return stack  and timestamp
-	 * options are available.
-	 */
-	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
-		return -EINVAL;
-
 	config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))

-- 
2.34.1


