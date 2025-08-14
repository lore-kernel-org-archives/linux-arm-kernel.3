Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DDDCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=; b=m1fZltdbGvCHBGhkiDvkSd7q0z
	I8x9CRudB4kzPZieWUVcWr9KPQjtgn69ElN7w+8Ya3O8tEOs0PrKEESWfpxxEhaQD2ia4Iv2Gy8Fe
	x7tz++v7+cFd5H/y6hs9aQohFMJBn+re5Aku5tYPVlw/JYK0BDg77jg6QCc8WZanEVhkrT7CUWD1/
	EFnR+q7DV+6lvCCMzXYNOC8xge53Ws5nS0MYLY9vlep2qVjhkAiks8J24fthS58gRgT1S1KwwZnZ7
	/5i2cV5/2ubek5cDMAULWSMxovOt7a+qlfob3AIlQKfRa/S4zG4u79z4d+AUWUQPMdPDkrx/xPQ0N
	OZm5YaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV8x-0000000Ga3R-4Bmh;
	Thu, 14 Aug 2025 10:25:12 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDs-0000000GOoF-1XvY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so3418895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163571; x=1755768371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=E/PfpBQBuE8d8QAXronChAnkG6T0h+P1KrU3DXh5AULj1+njoijju5sJB2p5ZS6Sbx
         k5J33p/AMsci5Awxhh8b8A8aq5D9q86o7uN9jI6ZvnFyLGiWSvXAdNgG3TRiEk2nUmu+
         TdAwenXyRi+968IpQgyIO4MF1NNgvE2wxlErGtL8rjOxLliGUk4mfJDzsWtGlXLTjE3Z
         WuFqtDIfIJbRVWwpTp/fAOBUgwC6py4g/rac8lZOSXdmnrOhft4axSvscVVyk9xK/AlE
         houXhrXULkBUbIgemhR/ivTq9MSSziT2HVF7ZFSGtu0sk+mGbS86Z/R6VZMbUKMs85hQ
         0g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163571; x=1755768371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=xU40HjVb0F2UYjfCYk7mzCOy1aQUmCuNSQS5iy68q3SS0KkMWMkYayP2Nq+yG9r93O
         L7LwEs4u0EZn5yH/yarToaa1Gpn9HtmgndEk35/4L68y8oML1j7lLdQw1rA9FBJvVXXO
         JBFZyYDGAqwuEb2/aGHG1JgOPnYEBRfPX1RC/aACIAmmvX4UNkINjA8X/14h/M66J6Vd
         d4r5DBk9XSv8fvdl0K9zws9b4iRNvmjySbbNCwFMFyeWbJ4gdQ7sd+ZgobJljBnMvlDK
         QDMfGez78ueolVATilN8HUISVZui6w/vfFYAeVtZxQj9Xg8MPy3NUMX8SxmSkLJvPBVm
         +Wrw==
X-Gm-Message-State: AOJu0YyT3gMsRb5VXW6oTsTTX/+QA1hfZZDgEXpOKQICY1I3ZBu4CjjX
	joUSQ0XuiDNfdC1PWWqmtoqj4m4QhVlMngr9QU0ArczaDwUVkBggyFIz4bgC/MnNyLM=
X-Gm-Gg: ASbGncsQY3YD/tsBJHoSpPvjEyFYnPXPH3CvRKKDj773TLqSFQ00VZxXQ6UdR1PoHPM
	SfZxhR9kbYligoeKBFykIRGyuED/awuxNg5ibJEVua/TQX4JkJ3DsPZ3QxB9UtKD+fkQX8Ohz4T
	olBcQRywxtqNC6gDmvi1INSDQ1WdrMtcha1kAbSqP4Cp8ZWdK7ubCabf0spvLKaOZYmQYYXCFYL
	h2siIZ/juqeJCI2Sxw4hi5kpOGevj+OPN3HvILoMBtvpYzQDIjiOCCsCaYRkavjkdh6mx399czb
	ILQ0eZmmTrcs8N89hopr1oaGP+sBZwGnNdJsg7j7DgjDW3V0YmO5SEMU/2o5Q3m/D9lNDI/pzwH
	+6oRcN8l6g5ToFubv/lBk4kEGT30sLlI=
X-Google-Smtp-Source: AGHT+IHtct+umesyv5x7r2OiRVf/2g4YUX/d+UTbwfLkfG/5sEvYEqn1B72mWCeZftKk8wn55AxWng==
X-Received: by 2002:a05:600c:3543:b0:456:1a69:94fa with SMTP id 5b1f17b1804b1-45a1b628566mr17809305e9.13.1755163570902;
        Thu, 14 Aug 2025 02:26:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:32 +0100
Subject: [PATCH v7 10/12] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-10-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
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
X-CRM114-CacheID: sfid-20250814_022612_414321_EF76A742 
X-CRM114-Status: GOOD (  12.14  )
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


