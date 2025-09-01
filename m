Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4B6CA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=; b=R+71WVYECeS5UbUFp+UMv+hUUx
	XoCkgkfd+5Pd6/rrjN73Zmsf4dq0ggiGIlSmmL9Wl19pD69dcT+gSmoNmHz9Z34WKbQ4nqICEeX7V
	gMB2/vxBwX45P6wUfTf3simw6Mb+dePaq3LsnSTcVwMbxe/oMwuZdWVKOJrV2Yad8oQ3Uunx1r+TE
	IvSKgFU9hkMOJ4vlsO4wKSWT77l/RaCTYh1CpYoQxwSm86svTGgTU5XR/foqdGjhVQwOVXls5TIox
	MdgRJW8+4/b0HEaa00gWzW7BmocX2TgmwMIwRo9Y+vNqjAn1UgoR68Q/yCDEpl6PDvgrk3oIX3b4l
	1igl8b3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VT-0000000DH0c-0pgl;
	Mon, 01 Sep 2025 16:35:47 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3rI-0000000CZ2A-0G9E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:42:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45b83ae1734so15460615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730523; x=1757335323; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=iNh1LPf0Kjjp7uN935G1/DtvGlQmZMb2vOpYri3iVl7EcUE4YdihNHRMs0X4ZFqbBZ
         wbOuth101zX+i4ECy3FEGOuyMtoJprDu6rRRafARgZzvRC1K2oGta0M+1GLyoBHqWuwo
         sndS0GF2CI2E+tOCVheaRytn0D+BgJHIdjysaabBOj/XOiPnpF1s7/qZ5J8jIaXW4V3f
         v9BBydZb23gyc+pd4rm8QQSLukbRZ52agsS9pEgcU2MeTW6n5OcfmoO6lNzV0pp2gRLI
         UFc8KBkGfhzOWW8inLC94m6ofEbzby7f07MPpoF3sP2n53WFqidzzVSqLZwIYhN3V3sP
         IBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730523; x=1757335323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=qK+TgZhgsSvIGtI+a73LOqCtYnkec1ikhADGHUsGZ3xSj7PgYGtS2I7YIvInPOYDlB
         15wGJBZLNwzcjdN6mmqQmGtxqQa+guVDMYu1umKYHiqMwnXqpr2yV2mKmwJ8VTy6CsqI
         6Zfb1se/8H8db8sOOZPGEtTjf5u8G3oyxGyr/+y1pK/7gZwqPVCrzc9eVQZI+vS3lMlf
         P5oudNejngZ8GYokljWPsJQcG9WPQLpGRNzjaUOSFUDw+HVO2grMEF9mC38bjwEzqtsr
         Q1tGDOkS8rXK4YbwDiVTO68zM/RwTehU3cl6vSHeKNFvgImXUYS8KIKbwtAalu2g/Bs0
         0s+Q==
X-Gm-Message-State: AOJu0Yw0T1c5o1IING5FLop0hIpP5zpFCW0fmuN07LTaq5b+dpZ71cUR
	+RSIvb7d89VBFdCt6mtM0mdGz0JIm6C8C4P9eHF22kHLS0hr04+7gW7tFIIoH/Kj/q4=
X-Gm-Gg: ASbGncvYM6UiBAzHO/aDvOwjMxEOBOL67q5/6mHakibJ0ApNR0+ZFmwvAxNWNsDUgjh
	m8gGFRxuxxYbDOuS4Gu+qvfyr5WeLvO6iItSRJsSRbxfSyH+tnaXUjsl/v20w8JaKp9GIVA4V9u
	Klvcqc4dYlfW0MjMrtGqctHbSeh8nqhFzQK2zjzI5hpmxTX5lFjRL+9PSmC7a7+DkAkJ6z8+9mq
	UgmFmFA6aEOWykr/L6mgKfuf74Hlqam+2w4S2e8IUdLxLOq1FsSxw5PmN093O9nyh7NLhmlU70x
	lbLh6Dz5fugM2oL+LATvv2wVhXMIlDWGY4DeN/Ut9nR6N1+/pkkM84WO9cj/d3ABFig0dQoef8S
	dlGv7VUE4JJ6/vfWudi9FviXa7Gwo+Jc=
X-Google-Smtp-Source: AGHT+IEQj3GrkfSjpxyNOrXOZvvlmQ+TSw4g8/XmWwPgGUWH337/Zp0pT39A7m8T0jFPe3YqQi07Lg==
X-Received: by 2002:a05:600c:46c6:b0:45b:84b1:b409 with SMTP id 5b1f17b1804b1-45b855ad0b0mr80544675e9.30.1756730522690;
        Mon, 01 Sep 2025 05:42:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:42:02 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:39 +0100
Subject: [PATCH v8 10/12] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-10-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_054204_118028_EB16A311 
X-CRM114-Status: GOOD (  13.02  )
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

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1


