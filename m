Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952BACA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=; b=rK3k/RmrIrL6sIZVsx/qT2pUhf
	Uq0v3ybn5ccMcXtINLBooJ2vmCEqBHbldljfjAiWhO1wEJ656xvoj35cCzucpSF6OgDbdXy7bxzXD
	xDCTlfQR8r4KX6WRyOWeaVgfSoSQkkTjN5hTLpbI2Te1ZmZ3Qe6FBRfe5qN6kCgbdhBI0MmbWr9u2
	zDBgQH8NAoM4y685qgNWXelAJprFKzx5bKb+k5cg/hSFLEkZ5bAX1ZTAvFEql5mdcwpUBrYcduN3O
	O2KTkDL3/cqYzUIaDc7xjnTYJVoYetG16ntNvsamkq2CuXGZUdskxkTflri//LYItqSaNanG2yXsX
	pWDzHAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VR-0000000DGzR-43Uv;
	Mon, 01 Sep 2025 16:35:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3rF-0000000CZ0q-22Zw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:42:02 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b7e69570bso20253945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730520; x=1757335320; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=zkD+n3r0ZjDglEGZMvqMx3vXi6NNKIlarL3IulTx7zGbA+3JBIXSrpmHlP6M7xs4c1
         5eeucs4ruQrlLtwnitIvC7m3g81Mor3F0tWjKSEqKvdtySN58PzgVE+4bhS9qGJGkGwA
         xXcWlc0fcEJqgBD7VoS5qc1crFegYcHcU5W5cppujENCGtzZxUsg9KB459j+bZfrnRDr
         CpqzliFTBybpz40HwAPRKfi6BLVXtVot32xGA0fA3h1w4bVZ3w8qI6kc8DzDcgjnpzsA
         3NpAybGKli9zHOsK99ZeMcjG2gK+8+fy2z3AoUEmChtNXsjh/TInzVbF0KKpjW1oGFWE
         N30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730520; x=1757335320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=ozzjExW8WKf17q/RVWrXcoovCoYfXrCHMnwVvkEqU0q/V8AFLxwr95FN+HBdkq13uN
         D3wgmU6j1WP9QPDwe+pMSb3bSk1/noACOYs6wlHJnrPEfUng6fxAKJQQ0xrcPuPXMTkq
         oKQP0DtGZBAnCb+6U33TXHn2npYV21xC9e4+oUM2C3MQ534QnmdsYYZY0zypiZVl2mkg
         wGuMSJHXAD5hzYRApVAhFQLwLYLVaeMV3OqrzuCSYbL/QFipL6yF4Ez4lFr2URzYx5R6
         NAkCRQaX0vp8Z7MDDA3il5iD1YOyG3KsqdbbvZxL8du3iGjCsI1wB4r/r3Cs6N2xVooV
         twEQ==
X-Gm-Message-State: AOJu0Yw42d9mSHs0kGzC5vf3KZRho25fjm73ZcnDNiL7G8pr7zUDX6Os
	zkBGCVS2XiowbdPAtzP32pniWGwJvvbqHeOSZ+F2MOK8WUuuaELuWbwxtmjG00KfdZw=
X-Gm-Gg: ASbGncu7NCLJ3ZWj8ytsWIkPRKrUTzACZPIibg8ibHtFYd/vN0EjFghfZi3vRHRfRjn
	75K9587BVmvv2Wnv/MbRcdIf0Av1JzUSy9lUemRzPLdVuDQCggEWGYxBEXSSkxmmJAxXGVl4nG4
	yHnHl7/NkpCwJ8WZmcyyEmSOZn2RWmXioWvL0YydVCZB+fz9VbgdcrlL+OeEyEnEkfjoSY98p02
	1kK/URoIMmSLQoHHQzNScFU8KF+KkP5Neim7yxuSJ8UDShqyialoK7lnGF6BGdHv698kTIWV6R/
	+ppKtStnhLL+NIiCI8C+JIHsEPt/yl7ktWPk4lRJHZrL2ypia5RIupPdKDnGKVmy1XOzvYoVAbz
	F8S1HY+dRuZSEsRjACDwEm+/ngWCqgYIuY9B2T8IvPQ==
X-Google-Smtp-Source: AGHT+IFPTd5JV8rlNw+el2iMeq4VwQ39O/JeQnoM1FnI5OWoImn9QUGVjCoJJX8IN0HGzcTQOolA/Q==
X-Received: by 2002:a05:600c:4f89:b0:45b:8d2a:cce7 with SMTP id 5b1f17b1804b1-45b8e2ee782mr21104445e9.15.1756730519938;
        Mon, 01 Sep 2025 05:41:59 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:59 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:37 +0100
Subject: [PATCH v8 08/12] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-8-2e2738f24559@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_054201_535430_F0E390DE 
X-CRM114-Status: GOOD (  14.04  )
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

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
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


