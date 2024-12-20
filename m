Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F85E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HWhUurpsh9uykRZLd2NRHB96G5i8cYPTkYob/the7LY=; b=KzbyW9ezVeeeMeMeeoGX7Q6Aam
	kXiLkQ7bXKj+AkAF+gHODYbDPc2gKOi4H2oqUvAkGR74aA8juonYIqXOiTvpZHjC5W8E9q0pbLlai
	Lv9F2+DDHxuW2JlRmh4lnZBnOj6QDq5F0UNAuCrAJEhyb53X176RPqX8BCT6SyTQsGcfNLx6c+kLU
	yAlAh+4F3bDEeCAW4hIr0f+8FO+X/OP326Y/99qi+i4q8dXe5AmbJxUlOWhtRHzcVUxSBOOYSNLil
	2B6OREbPudbMLQrsdYNvay5MVXlzT4xjY3qJsA11+tF3zdXpZFOl1v2RU/vWSE+l7OAm5LI/5ldmS
	Q+KwiWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeVU-00000005GOs-3eCx;
	Fri, 20 Dec 2024 15:01:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOeUL-00000005G6u-29dI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:00:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725eff44ba5so188724b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 07:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734706824; x=1735311624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HWhUurpsh9uykRZLd2NRHB96G5i8cYPTkYob/the7LY=;
        b=TxbemTOLnvbk9si4hereleRPpqkN11OZpQKc/VeKF4O9sWFxdYSGqUPDkh19EfAYsQ
         GqelzS5EdeMojGC1t8U9+TNIp2jPwUge7osO5EsStzakUtXUH+8mIPAXYqscPsOIp6DY
         M9gTH8uiyClXDG080f/9cNeCqGyYhR/ItPjqo3A6KTBQvS0usAEO6sKt4KIu3WQTsTlp
         /VxQ/BOwTa9HcAN7OpobgEQnzs3oprG0PHOwumhi8lFG6HxMoL7rWPmbY3/T1pnu2mPt
         QeTE/eXOxKsWg/zBDsRZD3esZ9QY/mzjO5d3kjujMi+g4IysXOiCas+W+KQMOH3WM+9m
         QZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734706824; x=1735311624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWhUurpsh9uykRZLd2NRHB96G5i8cYPTkYob/the7LY=;
        b=bBpJamyRs7l+wuJQvaRzm4PN5Dz9+lWSEZKEh1wbvDWOGZs0a2DCDpbrABVMBQn8xM
         7TEOgYaDMBLU2i7hsCJF/OjEuH70jc4TtTBEaXKPeCyaxbF9nL0GiHyGTeNKYpS2EwEo
         upS7OXTGz9ihdAUgz1WAjcx0RctsELhLS/usodoT+bQYhBg3VCvzQlApE1re5gW4HLKr
         DH9hUT+IgY8Jg/37XMX/OZu+hk2vwruPJNl4NQ6nv5CJoTT0JqKXMqwHgckVUvd1Yzwd
         gJvK8Q+i0vylpq+sHcQ0C1b4N8EGMSBe5RgFncar6OFQbc4Foaq/7SroPWg9rSVSwYfc
         csCA==
X-Forwarded-Encrypted: i=1; AJvYcCVPgSgC9r/L+A3idsZoB1NkwNpTDbQiNR+E8PCKBFBkY+x/Uo7poQCOPY7x/yiTlLHE7k5w5FiszOQKIAIUGn4w@lists.infradead.org
X-Gm-Message-State: AOJu0YxY9bIEjIxhROMSAMRocQSn000GOf05V8FLbXp2+G9rTZyJL7VG
	Q1TW51MOjAtdHG0+49uq2JUZFHE2yY6QgEoUDiWA0WI6t5oh77mm
X-Gm-Gg: ASbGncsMO9iWbQur/GzJ2nuJiEFoU47GpsypHEgf+wgn2UNx9ac1NK+pRkDgHiRU1Lt
	dAjjfpXsIDzAWi7xpGIBaTNZ2TMO/Mh3xidmmlxArH5ou799LdibcQDnaT+Rd2ci13sdyrsYf+n
	98YRsF53rGnwjfpZhduucbWPpVxUWDV+1KsbfhIOLh2katqtYuviayq04SRVaRR1HFUtUw4qSdz
	dzrswn8jF0mR/ppAa5oowWWdgOqaURxuTrKkuXm1CPXJmBaEWfeRis=
X-Google-Smtp-Source: AGHT+IF2bFfXBTew+MKhtzu1z+iCeSZfs9wm26pm1urA+Sm+6+rFKbOnmFLphfdDobDOOpSxh2Y2tQ==
X-Received: by 2002:a05:6a21:3283:b0:1cf:4dae:224e with SMTP id adf61e73a8af0-1e5e04503f3mr2084651637.1.1734706823742;
        Fri, 20 Dec 2024 07:00:23 -0800 (PST)
Received: from ice.. ([171.76.86.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b8e867d7sm2957152a12.46.2024.12.20.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 07:00:23 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: john.g.garry@oracle.com,
	will@kernel.org,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	graham.woodward@arm.com,
	bwicaksono@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH] perf: arm-spe: Fix null-ptr-deref in arm_spe__alloc_metadata()
Date: Fri, 20 Dec 2024 20:27:02 +0530
Message-Id: <20241220145659.66066-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_070025_569729_1F73EBD3 
X-CRM114-Status: GOOD (  11.82  )
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

When metadata is allocated using arm_spe__alloc_metadata(), if the
metadata version is 1, metadata is returned as NULL. This value
is dereferenced later in arm_spe__free_metadata() and it can cause
null-ptr-deref.

Modify the NULL check for metadata to return -EINVAL even when
metadata_ver == 1.

This issue was reported by Coverity scan [1].
[1] https://scan5.scan.coverity.com/#/project-view/63616/10063?selectedIssue=1636359

Closes: https://scan5.scan.coverity.com/#/project-view/63616/10063?selectedIssue=1636359
Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 tools/perf/util/arm-spe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index dbf13f47879c..55827d8ce133 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -1497,7 +1497,7 @@ int arm_spe_process_auxtrace_info(union perf_event *event,
 
 	metadata = arm_spe__alloc_metadata(auxtrace_info, &metadata_ver,
 					   &nr_cpu);
-	if (!metadata && metadata_ver != 1) {
+	if (!metadata) {
 		pr_err("Failed to parse Arm SPE metadata.\n");
 		return -EINVAL;
 	}
-- 
2.34.1


