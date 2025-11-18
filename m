Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A7BCEE338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfMGtwRScvfZlh/XAQooGxUMOnQFy6aFM90lPPS4zWA=; b=MCd4tD8SBrMK0yklNdJjU/Q9E2
	Rjqr4outDK+jFbb3TBY1rYW1/nAvyPkP1er4MyJkyJV86vz/NfaL/lJBQ7uGO3LtbI+pWv3OdQHSc
	Ipvqww4GJT+UVFQJQnD+TkacleqZQNEYfRx97DaMMoDHYdgVSm5jTeCHGcd9ZZmCBgDzwPZIgBJh2
	Brk33gE1WVUsnaIhxp0NL6ai4tUNZbrcTOQiC6PqRVQq9H6J/KQ0pp73gGZXXgAVJduYf/P1YinM4
	9KFgPsjs4Px1EMNwOiyKH/muOdw+kcNvvEPx+PWHVwzcr6/+liBA72vLwZe7ymF+cDgwU+oanr2da
	LEk8HG/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ7-00000000jU7-0LKW;
	Tue, 18 Nov 2025 16:28:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOYz-00000000jNG-3AnT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:18 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477770019e4so61028805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483296; x=1764088096; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfMGtwRScvfZlh/XAQooGxUMOnQFy6aFM90lPPS4zWA=;
        b=sgxm7C4NGfcm/5bQM13rL5R0Ey3mpchV8Ty6cGEIwzNzJUNDe6Uu08kmadh2ujrBv/
         ZPjWPVu3UjpdkHBpdjvyRnEOseoylMlrzbT/IJqYCLolW0eybsG3M/dyX9dX7BdEc9K5
         rFekKFb6TnjIKbG6RX7u7KtbD1nxccext2OMyS3mry6G9c7+I+qbkTal5u0wPi58NTeJ
         atM0/2K2ci1QlvDzuNVBoDn6j12zIZxlH3z3zjwz1yDGq/f8LdSxeghe7l2t0Kho5yT7
         ApQfsr5T+JTmJs3rNFU2fTyVcApOvh06kAW1q+++EZ8Apff7NR7vcEujtucEZGzhL5Ce
         PMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483296; x=1764088096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pfMGtwRScvfZlh/XAQooGxUMOnQFy6aFM90lPPS4zWA=;
        b=WSIRrDmf+Rn4TrFb0F88/jdLWSZ+8PbbyL7/IG1hAV4eOzVSfdWUw3s9afrUg6VvEV
         tLYYqm6L3nMXp0aIORnInamEHmkz2lA1XyJPEJFJRlDeu2YZXGzo2d910xoSHjViMGqr
         zJTSPueEHPxMKEwt0JIktMg0MASiocT9WlfHm4hLi2KbFJAzC6cTZv+LX2oCkHi6Y7yI
         +VCNqMlEhZFCBPPJzhq8eDouXNGX0jdcox7PCTSBcsmkIVUrco4WIJLljcNkdd7pYLtE
         Z6OtGQu9IFiVq2EH+TZACLCgqTaLXSnOnpu8rE2xSSDNyXWQ/N7l41TgSjNSu/8JaFf2
         c4Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVUmY/GCuKkN0CcrGOICs3pKhWk0jHVMHfiYchL0rrAytXRQJpZdZexJUwl91jloaxOUXW1w7Q4a+hcxWIjqS7q@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/vOLRc0cHVPKFuLkZVCJLLc0/TQWcj80kbnqjH6eJsRQ3UiJm
	RfsGrMeBBNQoxKh1iYkv+Z8I5IyoiPcJsVoDglhxQIJljWShPouOeflDwOwM+hGsPznjbUDoYug
	5hgHyJtY=
X-Gm-Gg: ASbGnctIXIDRq1CicfmdTDfyaD462bZtUwEwQe7wcY1T56Ry5enx4upfynuZ5QmdvdP
	L1JxbgCaeE1GgoSXo8s0Vn2xoRpBRao8wqLI/5c9+zim7UwjFRK4BBoZHqRnfL2ya9Cmc/Yx4ZY
	s5wK6ypLROX5pyka+diAh8cFA9lj80FYyqELTtHm5UT7KNt/NwlYjx84w7PWy3C1Mf2sFkW0VTp
	UIzHouRgrHEFKT4NOFK7P0bn00HFJG9ONJ2YmdiGq/J7KPkDz8XySyrZTPM6wFg1+Yzns9KBULA
	EXIKuZeb1gcBOa0mQezzXu6eQq6EeXNADZYgJSdZyplxGdmM/PXUFQ/9tMvqJTgdaTUHu1Shyi6
	m8/A+3CJ+KounxS9jXv74jxMsvuMjpbBoUnfFr+kQW0HdEyPlU6Hyh0RvMxNMNdIPby4KZdD4uM
	l21O/g9AzErj+yqPNmG3t3XlhPlPLgwtc=
X-Google-Smtp-Source: AGHT+IEQ71MCFFHm9PfsuQns+Y6ohbXSLi6ir1YdpoytYc9NNxUeZy72YPAlDScgcglr1n/v1Qdp8g==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4778fe4fdecmr170984385e9.18.1763483295720;
        Tue, 18 Nov 2025 08:28:15 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:54 +0000
Subject: [PATCH v5 04/13] coresight: Hide unused ETMv3 format attributes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-4-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
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
X-CRM114-CacheID: sfid-20251118_082817_812658_C5183D90 
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

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..faebd7822a77 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -106,8 +106,30 @@ static struct attribute *etm_config_formats_attr[] = {
 	NULL,
 };
 
+static umode_t etm_format_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int unused)
+{
+	/* ETM4 has all attributes */
+	if (IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X))
+		return attr->mode;
+
+	/*
+	 * ETM3 only uses these attributes for programming itself (see
+	 * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
+	 * sink, but not used for configuring the ETM.
+	 */
+	if (attr == &format_attr_cycacc.attr ||
+	    attr == &format_attr_timestamp.attr ||
+	    attr == &format_attr_retstack.attr ||
+	    attr == &format_attr_sinkid.attr)
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


