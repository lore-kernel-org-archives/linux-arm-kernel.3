Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64354C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=; b=kIq3rH6wcm8mT6uQoPlOFMhVxS
	LHPuJUVpuPnZZCJQq9OnV1ZdKu0PWJ/N2TOmku2xfzXsCc38GnmseoqmOfw/tnXyYyqZ3DONfaCB9
	K6xg1my4ImsC44Iuot2lzaFt0g3UpKX70/zXeZds13LvC4PThkpZ5uK/pF4efjR/xuZ2tT0Q8bksP
	sDUj8okkqIcrsv64FVNKHbN38Wfp/+a+VEelO7h4UWClgbwTKZTkiQOlLusFrIU9y7FI/ndPf8XJh
	mxvSSW7zRd7QDkAj05onUfWePivmRTXLrBmAj61W6HAUSqrKWjpB0rnofefEbmokjy63s3zgTRuk6
	zi1IGgaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcSa-0000000Fk0J-0edl;
	Thu, 29 May 2025 12:34:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVi-0000000FdER-3Evb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-442fda876a6so7476725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518401; x=1749123201; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=;
        b=nPUONFsCUBclEifImm5oWSekTuiX+G+THmcTfyjCCWj6TLHVtmU4jxtHTpJTO86xfJ
         evtUuyydusmFUPILJ8ZrBrSqrQhQRbDGxJaMA3Sie5ZgCzUXJVhZy+IROaoonixCwWw1
         cyaOkGrkJeLfEOXyEX96eruHp1/8KowLOJ58es0ObtGiB5GL+bg4ONSk+RrTTY/SNTlT
         2PD2rR9N2A/wJhj4MIM2ztpzxyOFLJpLXR5gbKxsm6R+jpSgTdIWuu5tnYj6jFKBvYJZ
         haN++pxD6H3b1SE2JeC2VvPluxYkEzE4Dqe19SkvlOdKCEW0lEyJHryp/+sLMdul7a5S
         wmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518401; x=1749123201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=;
        b=ELo/8hRM2pudfM817njN7lbUPX/CtrTYBXWBe6PlvOwSNnwYJ1XX/MORLJMKlcE+xv
         +4T+WDi0goWCX7yflES5llY+D5aIWXb9Wc3sySk4rN3RfI8oiQdbESmrR9AhAYyd2wm1
         4V4NVDlPOwmuRXWZVi+F60TCccnyTF4NMgLPjXVwv9alozfB/Ant2550GK4eNJL+lspk
         AfEaOcY3tu3/8waNjSxCEmixoJm6gRaxK5Rd+ADLpkQBuTzA84zFfrEkhKv+iiOLch6Z
         jQ6oxlxpazNtKnhhF19yN6I5s8yPpRVIvb7W5gl2DeigPPCpM4wBjyAxYhnZW+uANxZX
         Gv3w==
X-Gm-Message-State: AOJu0YwyuEk8yPivONPOQXm6bWIkMsuvyqu4erTscw3lDbOzqNLTC70h
	Z++qttjGPUyYMa/J/3MeOq4FyvYvxeIdZBPFXUwEX+h/mxdz84HosvTYn34MuhwEgdY=
X-Gm-Gg: ASbGncsjJCxaqEUV45Onb5UlOtOs+ZLbLXDXAh7LujbjIX7xo3gVUQeUug4fz5NEFtt
	skzTVzAbJf4JdWQH6Pm12QiSTIaOjnp/ESKNtxfaDjfyFRQbgeukd9ZDEeUzegXwkraYiccTcyq
	EZIFPJNV2rPpYVaALT4f0j1B+t+32quFuT0bQnfKHLL7jdtjk9LDsj4Fbp/U6EGkbFwlY5pf3VB
	B0SEaQPQxiUNKv9IjuxRUQ+277mibM+v12fcLIS49jDvpw73sIkuzdJ7Mx2Vn1GXZSGncVqZGGh
	0d3pseYp5L47YgC8exlNUkdlAwnER6NhxRi0JQB7AOVXPPrIX10jGVt+IjcW
X-Google-Smtp-Source: AGHT+IHrXdHKaLMm+1yIpS3FqW954SUKKGaokrQq0Fw7uhbVyrwkEnNO9Y6DJeAGvxM0rmC8BWFyjw==
X-Received: by 2002:a05:600c:8411:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-44c91fbb039mr231750785e9.15.1748518401174;
        Thu, 29 May 2025 04:33:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:30 +0100
Subject: [PATCH v2 09/11] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-9-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043322_823505_D394D3DA 
X-CRM114-Status: GOOD (  12.29  )
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


