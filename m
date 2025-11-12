Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F0FCD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f7cHeyj48y6Jvj7oQh+IhrQ2eaIAgk3d7czkbJdpbg=; b=W8hefuI34HBsbOJQkuprEb4Jsb
	a3PDGHqKnQ+EdDT0VI7CRRpc5erG+/6VWXhW0USxNasSHKzTTrzYfHUJDVktxldXSg5rDKsBtc5xA
	/2XHOdgdcvrJmOH2ZWtMdVGr1ldKE0rM06cDJ21uEUGkJm/HWiSEIIBkASly2NTdh/TKYRNA1jVp9
	sFaD/m2kvzQ29On+7fSPxjfNr3xG/FWSC2TJdHU39hq67rYg3CcXvDNLvHoP7RtGesTGMWMw7t2ik
	80g5P/1MNdGnrFe1mPCH1RGaQ2b3HcCMIq7W17qlA+dmGzX6wD4rUgzjCUom0+zKd4Mk4F9hNOxgL
	A3qn4diQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg9-000000092Jk-2WHe;
	Wed, 12 Nov 2025 15:22:37 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCg6-000000092GW-2RAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:35 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4710022571cso8657445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960953; x=1763565753; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0f7cHeyj48y6Jvj7oQh+IhrQ2eaIAgk3d7czkbJdpbg=;
        b=T0UiYBk+4Lsc+jsLGXOm1tVX4G+97yhpXdzDQ2t31nrhUGmo/yIDkerJdhPJW2aQmY
         hsUyaI9E62L2fonk/qbK83WzAaViwRgGILrDPl2ZiRikh+hxvkvVRmeRFdBgj0bC6FMh
         Su82tLPVA5H4mkuJKoDtGwajU2/tf8On3ztx8QWiLErj0FdOQ3l7aGDpAB6PjlT08aNO
         BYC/I0nSO3BiUn8XU5XxR3nnz5WeAPWA0uoarBH4XxDi+8Xj9FH77yGuvmAmogWq/SIz
         7Z8H7Ny6PIGJuR8iP+QNojM4kZbkQ9fezUMheb8/CoOysLleIlK0stAn6+YgdSgYEbys
         cXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960953; x=1763565753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0f7cHeyj48y6Jvj7oQh+IhrQ2eaIAgk3d7czkbJdpbg=;
        b=Ki6AjN4+QS1sb/XO0EHza/QanUx7JkbsjF8ku8Br8+iF3hnStp9/Xbno1ngwZN1iiZ
         tBgpNIw1vUWGxp0yeu47W/1b8Nh8PA4s8nbO2HZVqcNkFCm5iHHrqtumDQi7NoDrm2pC
         loltUnUaQzkqHXMrKYw27SF+kWKyco4GxzhLRuTxk49Sre/pXuBK1eA45uqP3m+OTOwh
         kRFYznKQVK/+QsZga5/2PNIfDFjgRkROOnk0O0eRrMd1Zi9gFQt0VliXa5ewJ4/ynYpL
         MfYj6WOadDwdrafOW4Ekkt1roIut3U6+CIvZosPZUo+2icz8eGhh3xGqZvrOdtLLSxKT
         OGtw==
X-Forwarded-Encrypted: i=1; AJvYcCUOqkdEQ4FvtKzJKZJGMkePgv68WSBPQYfG3PBBr9cR3R0Q1J5S+soUjHb8gG1ctXbD1HEfuTrHffO5lE6AdLkJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2RQmwFspkN056oNs/T4DZ5yLS47leL7ORjmfrcSMAcUew0hzo
	VpnGxxJd2+SPKMd4ZClwp49NESRM5ohf688m3MqbtzYYZSzttKXX5aKleQEi2MsdkhA=
X-Gm-Gg: ASbGnctJdBQkOaKZUMGoH1OowwL23cPvTBuBlpMgXXuPyKQp1FdWFRkMlbv+BkJJ5ms
	/D7jGN8v2RNAHyCNLqJ2Qlk36uhLSIcBtdtF9iYNGK7WG3qN4Pau/DVpeZJvo+p+GOxbEvyo1y2
	Z2kTkJty3Z+26Lv2nnip3gsirK+6HiuUevRqM/XA6MHyn+T0dWpqjyfaxCwmgZcaiIfqkGDASAq
	CYdmscOdA0mcEfIekuXxnHiFmT4dVvqbwR4VzJqEYwscbchwEXJSSUfLfILc/Hd950nWRAxab0S
	h/VQ5Q29WvcZThQXIFpl7XXMTygiDQ6AXOfAafjked7GMf0dpRENMqRapM61Xy5pzseCnOqTKS1
	jphso341Tax55kAnfICJnKWVERodQ5NkkbJAEKQcNbVeJBy7+TeCiGn2mdWYpUdbtiELD59eKnF
	Q3R35CtMxsGw==
X-Google-Smtp-Source: AGHT+IGTWs97Njo9/LOi7JghZmPdDO+lqDr8Zjnw1ns9XWNM4GTecb2CrtmosaObhr2irKbWuwRS0g==
X-Received: by 2002:a05:600c:1f8c:b0:471:16b1:b824 with SMTP id 5b1f17b1804b1-477871c47b6mr35226945e9.28.1762960952689;
        Wed, 12 Nov 2025 07:22:32 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:10 +0000
Subject: [PATCH v4 04/13] coresight: Hide unused ETMv3 format attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-4-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072234_658717_2215916C 
X-CRM114-Status: GOOD (  12.42  )
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

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..91132abca244 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -106,8 +106,27 @@ static struct attribute *etm_config_formats_attr[] = {
 	NULL,
 };
 
+static umode_t etm_format_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int unused)
+{
+	/* ETM4 has all attributes */
+	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
+		return attr->mode;
+
+	/* ETM3 only has these attributes */
+	if (attr == &format_attr_cycacc.attr ||
+	    attr == &format_attr_timestamp.attr ||
+	    attr == &format_attr_retstack.attr ||
+	    attr == &format_attr_sinkid.attr ||
+	    attr == &format_attr_configid.attr)
+		return attr->mode;
+
+	return 0;
+}
+
 static const struct attribute_group etm_pmu_format_group = {
 	.name   = "format",
+	.is_visible = etm_format_attr_is_visible,
 	.attrs  = etm_config_formats_attr,
 };
 

-- 
2.34.1


