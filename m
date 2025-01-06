Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CE3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyZ7wmu4kV9rVhQbBxzSf+OE3ubAppsrT+cnU3G/b6w=; b=BhArncaS1HJ+SRqzunfB847C0m
	EgIFHUHwbGFzICrHiVIqdEBZKZ8Qp6JPfdf5Apawe/pQmfBl70zvCkkJz6PhvqRwIKeIjQCKWmSJz
	iAfpYhufzybx20IXd7xy5PR4H7PnlRR4nbE5/d63Ayvftx0u/VzmEj13DMdGNKcEm1rExmotJ239Z
	8g6/qAaOSINlX7zGFh/4JJsR4SLy0qEZ1ecsa7gaZ0wb7p1EqmGnL30VInRkdpxseKg71/TiPQdhS
	krBIjHOaAdDR1j6fmzl6JyPP5n/vbOEk5/WJT7mHjS2lhuRvkVrCux3GGhJFY2Qnud9MAaUueHZHh
	5FYllYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoHS-00000001c3P-0Stn;
	Mon, 06 Jan 2025 14:40:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2k-00000001Z2c-3NEg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-436249df846so99948295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173521; x=1736778321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RyZ7wmu4kV9rVhQbBxzSf+OE3ubAppsrT+cnU3G/b6w=;
        b=Mc3S6eoo2DvQBj3LMyP1IxPuHe7NljfdhPEKBcIMVXk9TATtKRrCBKly5AHVFK9sFT
         McZDoDdq0651/HW75V8pu5fHdsqEZyThdOBPOrUWWLhiBztoF2cR6qYX4bpwOxeDYJle
         jlfywACczlJoht/fB5XPRsN0ZJthRcIWEjThnyYrDdBlUzAz/azk4TYH3cX7R7McGsVU
         1F/1R9jWmQEh2DL1lh/wlHQSkbdo7wu9gUBYd3TqhNr/NLdT7gMok4l2tJSqYU7uYOXI
         IaUOFLdYn3Rd+67gezBsJVbQD0BsPrPdQpJA1i7rWwheigJ1u3178dkix8IDWrkmDf/1
         fQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173521; x=1736778321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RyZ7wmu4kV9rVhQbBxzSf+OE3ubAppsrT+cnU3G/b6w=;
        b=U82Pim8B1wF5vbh8JJTMFuULtXo9dF69+fBIP7rsQaEYXDDQSstC5rb4P1w8MlI23a
         iYUjSM6oMvn3Uz/sHDNICEnebA0WVqBN30Zgs4JPiqBFR4us4grV1/67+GmnKgvzBp18
         5lIn/x4WAypQXyNji+uYiE2prpT6ad42wkcXzyykeXe0+IrzcBELQ/Y+7PRzejx6hVFc
         4IEcEeZeRfYAAfDEQ425Xsyr2ea5uWL63o1KDZTPQFYoU7qEyox0i5rBsJ+UsgizujUR
         y5YbIAx49z1baSXy4LU9Zlt7E3mJePq8Pi/wCWaPXJhIs6vvKyjm6PcBmGG/Pyah5gQA
         A7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUzn+SuthjaeFopaRZqceaP7t/RDzyFOL3waKWhz6brR9cJJNn6cFsxRW8Jy+/KiMx39+Xfb6HakaPxrRZdIrVy@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6FKO9ds9qYd0ywkxw9HtCqx8Am2vyJoEs3+yjiexyRCz+HcYs
	Sg/rN8M+KQHN+TZX5nlV0fD7d52wQEdYwYauQ1u7cY45uFAbFRtraaZyIjPaMho=
X-Gm-Gg: ASbGncvVSDwBpLzNBJg/U6BZZJRbQXkOWLnc+TEML1/cHHHjuMv+UREkzOWFsXlW/TQ
	ApjGF4LcaYQb4RV2CzbZ6VPYfbwYhh/pJ2zVrmTpKQqL9W4eix40rQhUXsJDdJO1vGJA7kLoMey
	sz5PmgiG20edc+7zSxptsxfmxS04rxV6JenTxSWToTacpChBATenR1xY7h/iI31it8TxC4HgNyc
	GijuOEKg8gAoU8F7cYvA6kGpkutvPIcc4hLBQRRVM2kuBqqKmglf03M
X-Google-Smtp-Source: AGHT+IGCQC1ROdlgyRjosoLzlDCaOKhnwgRBpfjpCc9aRQvwJaTQPlLkjI1ZckCY76Q0lC+lhk/kwg==
X-Received: by 2002:a05:600c:35c9:b0:434:f5c0:328d with SMTP id 5b1f17b1804b1-43668b4999fmr438349285e9.23.1736173520936;
        Mon, 06 Jan 2025 06:25:20 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:25:20 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	James Morse <james.morse@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/7] coresight: trbe: Remove redundant disable call
Date: Mon,  6 Jan 2025 14:24:39 +0000
Message-Id: <20250106142446.628923-5-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106142446.628923-1-james.clark@linaro.org>
References: <20250106142446.628923-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062522_843423_C3F72F5D 
X-CRM114-Status: GOOD (  13.45  )
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

trbe_drain_and_disable_local() just clears TRBLIMITR and drains.
TRBLIMITR is already cleared on the next line after this call, so
replace it with only drain. This is so we can make a kvm call that has a
preempt enabled warning from set_trbe_disabled() in the next commit,
where trbe_reset_local() is called from a preemptible hotplug path.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 919804b12a67..03d3695ba5aa 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -253,8 +253,8 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
 
 static void trbe_reset_local(struct trbe_cpudata *cpudata)
 {
-	trbe_drain_and_disable_local(cpudata);
 	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
+	trbe_drain_buffer();
 	write_sysreg_s(0, SYS_TRBPTR_EL1);
 	write_sysreg_s(0, SYS_TRBBASER_EL1);
 	write_sysreg_s(0, SYS_TRBSR_EL1);
-- 
2.34.1


