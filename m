Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC9AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=; b=kzOr+RRWI5WZN1mBRpIG1tf7KB
	1usk+45toVoZpf02TuE2l+yMHVFK4JhoL6HSgJgTuNH+6Z0UCDqej0hJwJC/DUaZ2hoxPX4rYz7Ge
	Ai97QOmUPdMX8qDYwoNefFKlDTt+uLo4juoMfubTbJLyeol22Vh8O9JyebdMYmChORpvW1TrpCKDH
	EfsMpWb3JPCJmfYgU7PEiCJPaKC5vIGUSI7xDqpOUCyd0yWAUXf+9qUgTGc3CuO7Tb6YOH0MPcGaL
	D+Uf1cAHkypBIJVwDIJQUBUPwlSfYqfGftwoRy7neknH1bUU+xUiob+zJwDEOdZ3l3qPxP/zrEve7
	qCJFp3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcOM-0000000Fjbj-3BJZ;
	Thu, 29 May 2025 12:29:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVg-0000000FdCr-0WNp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-450d37d4699so1640345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518398; x=1749123198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=;
        b=cy0CqqZhaBg/cXBK7OEN7xujXmbwLYRt8WL23gMJTPy/B/aVlwN/fBF7Vb9ZEPOOtZ
         jw4gw5nqOtkcE6HtfZyIV26aR12mUwyRFt+Eb4o5trjhR5EZ1hSIUky1HQslSSECYkOq
         1eP8PI6gWEhIwjV1V+mM0iYQCWZPdB5MjtmYDtm6Zm6jEB/f7Gppu8snvRR1FjewgFMy
         OrF/T8MDYSb7GeviU6C7pOsKJ0BzMz7q1os1YwdRlKGslzHyhpNh0mS3sVoc4z0ejSzd
         olHIAOgwlj4eDy9IjGeitcMrIAKK1m2Pe9iBXt5Kj5DSnXxzXyetY8zaZzyhx3NSAUQm
         AaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518398; x=1749123198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Q5mn8xtPi9u9sDm1H7ybxkZxNw4efqIccO1SNVExHM=;
        b=PrvHZHyRf/aj1BXC4HzeEJ2DiQLNMsTwss7dsqafjuplLwX8OOUYSL4mlTPMZOnSwS
         k1ujqkuOwvjnDM6ZXtJx6PFeAEU6TGhstm7ReuGH9fA2B40mNa7ZJsKvzqgLTm1WpQS9
         dLyTPunGs+c7vOaBHTC4Ad4CU8FgPmbizjOyntESZeRLzQOSb1cv9hDjmiq8Rf8B371X
         EfmRMpgh7PO2jJ15L2YBbExVV+Zz4K3J2swGBzN+1aLGGHZLJ9xp8m9xH4K0g/5gnZSc
         hefDHAnzPGvC6q5jDJDgWZSpicUV4KLhZ5NTWETBxh7h278bSCVDGJkEBCE6b9XKN9P+
         O6sQ==
X-Gm-Message-State: AOJu0YzX9TlHYXbzLhn4a9WeNz9z3A0McCMNVtX/4mgLcTat8cSXoOCd
	d8QEfcF9CvN7W+/idg47WBZtlpFV7pXwQLAo7UE14VIoKvflO5KhdBFY4YJDGQWZAdw=
X-Gm-Gg: ASbGnctdRgO8+Lob5x2SH8ogJP5hXhJsCpokpG362MBbNfni+Cal5Jif4aXRzAYlFrc
	fnmpUgJWUqPcOUq1/Boz00HlP8Khrt1p/FQt2lNHitM8IhZTE7AlyLKDr6m6cHyZ9yS4dciV9t0
	a/KykdOP66+jFLR96R09MSzuVUQ88v7+tY/7OPYgG9IC7FEwH+GKjoJl5CB49zvuuC6ZFUBdZux
	+r9SmDLN/AWBjXo0y2PY7n7MKEC6JTN4NzWp3ruajB/uPW9Y4CrJhXE7y0AZ8aX4A00z/RiYSy9
	h5/ZtPzltiGE5iDNQqXVpvg0RHL0r84O+a1DQ6hjpL+LlG9vuyORcZTC5p2bJqWX0aJOsxs=
X-Google-Smtp-Source: AGHT+IFacLMgy8Sgufz8crND9drSgOY6qRlCAWckmK5shHNZ9zSnAptuNxdT/H2WMCBvDy1/kfCobg==
X-Received: by 2002:a05:600c:1d8c:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4506b541d07mr59510265e9.0.1748518398270;
        Thu, 29 May 2025 04:33:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:28 +0100
Subject: [PATCH v2 07/11] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-7-a01a9baad06a@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043320_155821_11D350C0 
X-CRM114-Status: GOOD (  13.32  )
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


