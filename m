Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB04EC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=; b=wP8sj+7h9osbTxEhkvp4/joArD
	+7JDaKeZQoEoUtWK2vAsW4ltUCWN2xKk0DkgwztWLe5zBqV70lDKR7SEVqeCdM1PR/thqJ/q0a2vf
	cPLw3LATwRmxcSpL0uip+9Svq3+4x9JqiXmheDOpZcu+LZYol/B7aST2GYpFOlPmXORyJiW19ldt7
	b8l2ynlCVXe6CidzL2j0CiAJQEXuzkYRaxv6yHsQ00tJ0aRP3ARYzPXdH6jBKlNrAMUDV4kJds+b1
	OheP95TGRm9CvRuNOmWyMGD4AyaJJcNqhWSruZhCLQahTgIPrn1Ko+e849mK6hJo0KTzygbzJD3gy
	Df9VZMhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsHX-000000003Vd-0B6X;
	Mon, 21 Jul 2025 15:18:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq2C-0000000HIiF-0hSK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45619d70c72so40370185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102463; x=1753707263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=wVvlpcXiPz3dHQnXBbf84B0LR4+t5PJLkH/WCKcR4G7Bqty6voNZ53LRnJb26LTL19
         0LgjFv1xf+4Z4MmPL8ZWh0kEIzIbHTt/tHi3SCCVl5y40Py8jegrZPtHUlIZVGWWmFqt
         3Z79QFAv0nzGD4LDBMnLHhlIYeIiNSrMQfDWAHFzIT+1JQZHAuRuz5elRX4jRkmGRfdo
         RpYEukwSD4xbUKuzrozOHtvR4U1C/ToP/JSUTH+HezkO1OV5jFRzJMYF5bxMNJZRGHow
         CUNrNpl782g5ScwBDcW6UviMB9atcHPu4drKvIWP1tmyZp1Dz70maI/83iC+rwAfQp7s
         rpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102463; x=1753707263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6klp9EUNzNQb89anQF9S8nNJOTrH6bgf7Ht0lN5b5Y=;
        b=GxetBLxOxL0AAs27LJmk4eX9Y1JxwVELwRaPkDtlzpsaR9BQlMg/l/WDtYXCNOzcvY
         Zp9CiixYAA8EksAzB764cDSe7sKQM6Q+7mWPEI3CAO+C2XcloZX4C/rnPIyuCxVeaNZh
         IH5l7KqCY2IBdiFOwi2mXDHYsJxdS3Dd1bMpLFXHap+xNQhYqwjBV3ft2rLnm1q53xtN
         4BxTsnLifiz0a8bOzTbjJnZ9ZP5x+u7G9TUDNGSNqVTsVV5ZScWz9OGZlNP+vTEKNwwE
         QeMo6AKyRNtrg70hAhd6rxZdq9Gr5cxklc720joiYzLCw+hbDtbXzV9ZXixmC+zU6Tcp
         +jQw==
X-Gm-Message-State: AOJu0Yzqr69MuS67AOYZl0JM2DOy8SglgHB2bD1kFTPlPydh4NrwfJXB
	ZoYI+8CHfCXy7LzwraZvOnaC7ddBdYuA17GlzK+fZhJg9byR9qIRdEyzXsaEQ0Xg1as=
X-Gm-Gg: ASbGncvJgEO2alACbU07vha+22jV6e1ei+/NXccl2lanv9PJfyuJISJ7eRUJf5p3CX9
	Wu6dyEy+4pP4gWcKLrA04PoHFnTL+IQTQ9BepbNym0+3iDb/17IT6N3da6k/ng/FHmaPrwUBrbR
	cbPMPoeBnHUsVDj0Ryli4ZbTaiXRKCqiM3fNG1vquBsAUbwYP9BiAIrizfGgDY/+ELSWhRvZAcQ
	PAKqejCj4shoxy0YN4FcqWTAYiHdINiqMsregLimjl7sIdQsp7mrDnDfxenQ8uv7smg2xpvGD6H
	P6TNe+0FebuggRMemBpejwMAYNFiuie1KxTPZCvB4q14eyI7IFrIxY8BM+eZYkeNkPfQRZCpmnf
	LmytdzX3nKJyI3+8cIrBhKCiuNfV9SpIr06G3lixp3g==
X-Google-Smtp-Source: AGHT+IEKUzmDLNm/S47AjUbVT0TSPyNRSLNS8NrJTl5hmJt7B7yIO3fgiAjEVvKH+pX/3t1gyQ5bcA==
X-Received: by 2002:a05:600c:256:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4563a5416ddmr95607725e9.10.1753102462803;
        Mon, 21 Jul 2025 05:54:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:41 +0100
Subject: [PATCH v4 10/12] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-10-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055424_245888_C479C08D 
X-CRM114-Status: GOOD (  12.27  )
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


