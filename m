Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925F1CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=; b=vT1kPWOXHlZ2WUnJNkzeCnz0uN
	IvNYbudI4OMUYMlY08oH363TxAtVFbMGrZR2/tO22nsQknleM8I+SfhbzNw3+TpWEPbOezh33HV1L
	U0zMIE68QGjpRNb0DyLlTl0MGftjBzDvEvZEWowjxJkHbkxgacN9EfjsgawZxZ6/rpilfPLl0qGvc
	LYTd/961BRHXl+IvG3Y20lGTZGHb42cmZ7jqjvweHKhye81+2VkYEKoVq21vYuFoO81KCQIgJzUW6
	p79XngnjDliETa9x83JzLKMG4P6j1xMJIljbRTFBgXO4QaG925fZadPlG63dXs0CZb4yfcOahSxX6
	wgTC0WUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhu-000000075JO-16rg;
	Tue, 11 Nov 2025 11:38:42 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImhn-000000075Di-0mMj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:38:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4775895d69cso21297335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762861113; x=1763465913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=jy7lYI9kFGwtsr1EiIMvn2bQClDCKzp7mily57kmnjYpNVtY0kMhcviKN/iMEGk1tq
         qmvyWGRy9Ndg1OZb6wzsfENbflFoUKWz21vxBNlYPyIIjmySol9JWDDjcEWHfaErcZGX
         DbB7RRX7cqGbaAzxwN7Q83bXQqHftwHjI5jCjDX3ztIUD7tokXH/O7tHtBhMZNEqbHDQ
         5nLoBYs5hQwdUrsm8GdAYm/33j6IFYON/8Uibv7ojIEJXxEaC5oxiFERB/cIi+e2hKJm
         Wcq9IM3UrYKPwwJ0C67Eg//nlDYEMIgH23x2AMfb+AmH/eemJAquWFviGMedIZ6UO3i0
         Dz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861113; x=1763465913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=qDtbKWcgs9VzxtK1EIs88hNTe0ZwNy7Y97Ifx+9/I6zgVYrnaAz/wkjTkgY+TVlUVZ
         ioLu4FJHVbzBZezLTFocN10Hb9J+5jzDgTWrqsPEKdyMEtv10527fPqrLbLIMmMOH8fK
         j/wqqD05qbW+eU9+5GNVLcOBvX787rAjh8A+jFuKuJKjgqBbB7BvWH8PzZ45E+4tXC9k
         +8po9+0Nf8cyvFWcD0Dfos134Dw3mRNjWBixTZrfj631/fzZgyh6Dxeqd1R1eAi6h5l8
         KTm/Y0bdSi4niruTtpydlTjZkfqr1rFL1LZCsOyFUdn29uenwYA0sUVBKgPioV+I12Io
         bKZA==
X-Gm-Message-State: AOJu0YwADlaApAsej7Zgn0HhsswO60HXyoXswkmYH4s1w8UqRnkhHNq3
	k1frPSmZQzblq0LNSX4dlxWp67O04wHfTBGm0++pRHl1Nvp+v9aA1zn7JSA3GbGpFjU=
X-Gm-Gg: ASbGncvKMqoSJ68WhFL+dEZYtT62SJOxXPHmZyEHqRkkMJVEfCuEJH+2WNNNLClyBE3
	jeBABn81fVRdfXRBRv97Ps3Wm1Br8dKkyZ6OhnN627lklHiF/1P57Yill69E7kXLj9m3UMMO5LV
	KD+fQV6QcJt2emgd6H8bo7XrSzgAnPgJMqUiWqGJjrJW+9fs5HRms9pWSm3vNyDF0g5vHcvW70L
	3hLk3xh3RSnoavXi2B3dhG4ooPkYZpTJtthkGRFeYCRydPxG70krPJ4Pbc6mjlRaAgr2LarZYJr
	YDKAOqn+tjUqC+fP1FRFoiMkOFRGsyR8QVpJAnlURcdrcPnlRa2MAUpCKLrvoYwl0yzeOJUAbXA
	Vd34kNIzc/G7eLhT+hYA0Wjd+FpOQjDZzWVN0riTydn+Wi3zyArvFpLbvbx9ZGDT9Yw7y81XEV/
	MSH+cyzjo1/fHm/2OvfC0O
X-Google-Smtp-Source: AGHT+IHHKYLRfVgN/W/e843ki5ckqj4gtDXuwTA8cbEV+6RFtEvcngH3q04dA3ZvJO4NaiMzNyBD6Q==
X-Received: by 2002:a05:600c:1c14:b0:46e:4246:c90d with SMTP id 5b1f17b1804b1-4777323ed28mr117807465e9.11.1762861113334;
        Tue, 11 Nov 2025 03:38:33 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm28133486f8f.22.2025.11.11.03.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:38:32 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Nov 2025 11:37:57 +0000
Subject: [PATCH v10 3/5] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-james-perf-feat_spe_eft-v10-3-1e1b5bf2cd05@linaro.org>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
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
X-CRM114-CacheID: sfid-20251111_033835_244409_C548F8C7 
X-CRM114-Status: GOOD (  12.15  )
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


