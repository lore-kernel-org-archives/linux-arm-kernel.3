Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81368CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=; b=fVQgULdyHhlwwyLlPuVQRbEheU
	YZeCugRj37xEvj+kESdEpgyDIRG/sq+mb4LVIMjvM7TsUbrSZhAhnCBBoUfB846Mvio5M7N0uXulh
	ApwuOJStXFaEe8MTXtsFO6QvwfeSH2qqn+TarKSzdSghXZVcEpbkUE027e2zPxcaauMRd+nn9I/IV
	15fCLfenbVPANWhm9Q0bewq8aPZjWsMxwoQoJZysQyT4fyFaXPCoGXyY/TDDJQa9PsUuZpQobvdOk
	RiYYzDan8tU6gjswjSliswninBaHAPemDeT1IkQwsoMGGIaapqrFRm0aCUc1uevPCUJFas9wvdJAf
	a3acFlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Ns-00000001qzW-3afp;
	Wed, 29 Oct 2025 15:46:48 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nm-00000001qux-01iI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:46:43 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47710acf715so20237785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752800; x=1762357600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=LQ1gSj0P48v/KUvulfBe73QC0mo38GDB73voYzHmoGBMm2bN6p/PSPddOM3KOSJcmr
         WBOiQSmIfQnWJu7D2TpnAahhMJ6nDjts/qQEraZyYdxsl8RfwR/NyYXU9OmbeBK5gjKt
         7N+oCkTfM7qklt7cTjNPIiOtkNh7KIoViVhH4dx00lZoLwfO7q9zSk4vZoT10foGsEX/
         K6hGatgQqfVkPFWK2g7SH+Y6RSv52OikRM1wMUr4GTc6fpiRJjEtm8pFWrj/F/ZBGYt6
         GMHkeao9oRDlDx+V4OmmHTQrhGPz+fvmustXOkycZLnwnD2dGoIshLEWov9lzEdmTOOp
         KyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752800; x=1762357600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=sL5zWESrfjJN+K11jQvzSzSaBKzRJtL0g/oTbsiehX/RadwHcZ65e+w+7T9YsUIuyB
         Stj01ZTzAbSyrXLu41o1EpDS1uWnHQ3G+VVlk5jSz7ftcHp/x6NbB1O5J7mt3oepvgdD
         Zj6S64uEpQhj1dVgXDbTl63HmYHPx+JzO5TeZCMJ3keRGIMOeEHFRD+a8vYUrBV42ZmV
         ekr2xNmWeih4E3IV6JRD79CZ8QKpk6RvV2ocRvyIBEESkYHmxXEnYWWk2iOTxYN+hggi
         wKsyk5ANfaUgky9xAby4hJWz8Ydi/+KXrGg0SFqfdqoQ5Qnr3ziJPixkyyyx/Kf7LfoK
         DPyw==
X-Gm-Message-State: AOJu0Yz5f451r9942pC15PyW0h9VHqHYn6imnXTiwiCrTYrVCCCy7Q8O
	GooG6MqDvg89vc27QzImQFI8ENtfRGeTdKVnw67hpqBibSHBRJntojPALozF5Y+wdJk=
X-Gm-Gg: ASbGnct4mtVjqbcfoJgtXiV+TZDg18QMwMGBbeDJDijQ4kd/9NDBSQQmXP1BKfy5JbP
	i+cLUVpq/imrteK97MtD5qmqdwsYgTCF2Vt7kD7o9SLEyziTWY+2ZT3b5iD0L4qC0uZVps1y5oI
	LtzIyp6cq/5R3u/lYFbTmuhhH224dXsopSxQU8bNBF/pJQK7Q5Nms8Sq388EDWU5u/hrLWM4NBL
	VkeyZ9EtzcCIcaaFonzeBZFkjS2ax1FUELub3WQHqO9MXE8EhZ7jG7mRAk2GHwGiY2GtYZJQsbP
	cQKUh+yDKdD2WjUDGLSUn44zW9KKF0zkDx7PGB3bSr7N6NwwimHW+B1Fo6cbPbJKTTP67bFDomn
	lfnk87NBNF6vdF10mxIp/BgCI7FeInAnKaG2tXbdbZTfx1uclFI5JGWxtojJmunRADiabnSb/8+
	MkPBJqXLPkvg==
X-Google-Smtp-Source: AGHT+IFr7xoJyrWL0httFE1U9OU6ySb/0qu1huluXCe0kPZLPOso65sDtiDjLwsED64lDMpKMdKhUQ==
X-Received: by 2002:a05:600c:8484:b0:46e:442c:f5e1 with SMTP id 5b1f17b1804b1-4771e24b0a5mr30445885e9.35.1761752799881;
        Wed, 29 Oct 2025 08:46:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 29 Oct 2025 15:46:01 +0000
Subject: [PATCH v9 1/5] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-james-perf-feat_spe_eft-v9-1-d22536b9cf94@linaro.org>
References: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
In-Reply-To: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
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
X-CRM114-CacheID: sfid-20251029_084642_067751_3056BB70 
X-CRM114-Status: GOOD (  13.49  )
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


