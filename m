Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA05C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=; b=IpzoMY+U1L25KUfl934QLS3DfI
	Nwiepk9PlPZ68GKh5D2J8dgnFqb8GLB9uw0nMdSLcyYIYGrZTdv9QTgjmJfpo3vuy/YBMjzVALoN9
	useVLANt2YqsWOBhI9hwVv6acV/D+Kk/N6NArzBgYnacQHVJvP92lu2bat2wmpvHPibG3zUYxeJJB
	pDi2TBUJAOknib1H8VpYYhxz6XUmV7qgW6zbGtuAQE/YOABZ66tU33IX9T4Joli/ikzFIgvUxmp5G
	b5F+hioIFaZTGY+LDjy+ZxmdjQ/UrM5NZFWhDzIqVxhLk40CX0MT9QVG0JQ1+T8FG/geiskG3YGiM
	ni8G25iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrGC-0000000HTXr-2Uy9;
	Mon, 21 Jul 2025 14:12:56 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCo-0000000HKrs-048p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so3241659f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103120; x=1753707920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=DdxXBtmfgEVZcxUE7w0rfKCtzx1C+kmVWXpnSY+nEu54coS3ZxqYr+h3o0tFwpTGv9
         yH8XeWN741m5r8F6GZnA+AAIIAiA/gfgMir78K1CyN9wg/nGffHUZORsmsTYZZTin7M8
         Yhqyob12rPunXXl1o/lLZZgv/qfeLBpMK86hLuAFZMpVkol7QW5AN/krp1WgMc/Jfia4
         J2/Xu1xgEnvIRLR1SF4CdIfz6YdFDlVfRyQ143wZeNxmozPtSRx1BfnF51LzzTpqYm2n
         5psHB9s3izy3v0Ds0wgI1mxXWF0TklKflcPHF2oE5zx85VG1WLHJHKF/Hz/eqzGX9X7s
         3g6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103120; x=1753707920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=vAQ/ZWRfIrSAvg9q8Wewej7enZ/X5zXF0brpQjrPfv8YCLKsyYW+Dpa6XqHfdESEsa
         FDPDl8ETz31R6un5OWHjdzbZw19F0ZP97gEnyyGtTIuM6MkjBsJ8M34YB5XoAqaqfaK+
         aqJ0t9+NcVKEWBUbP/iTFaKqW2FAZ71N+ym/iF0EsmfUcVjrlqAybFJhj2Q8DR/LeptI
         aVSl/C2oDhVHs57JQ4g/r+UBgqvJkxkgJw+G2h065UL2MRZDRT/vxMQ9fujrij7iQSkh
         46jrrnX4G94urCcVmoxmv0pNOapEt/qRXNmru8eiCZb1+HR22Q/nzNfDYGs+7IXMJgHu
         9UeA==
X-Gm-Message-State: AOJu0YwvhtZ5GQHr892TC2oMhMKxBX+CtxUs/oArRwhrSvtgW1EdYDxl
	/hf1OASbHXZskhQ1idRKgYgN9hSUCCrV2uuoDO98b7Z+TqSUKQQ8r5tRDI8Tf6BCxO4=
X-Gm-Gg: ASbGncsPWdyo+uUtiQDNQwAmtrDKUPgF5uZhGH5gfSLm/WBIU8W1ILoKwGDxneuA9tV
	OPuRm2w0zYF8VrZxgvmSETbUElUDjW+k2thXRuo7f9RO9vePC4VSARhtz40hQir45pUSJdeJm4R
	eUEZ2QSK0C5q6+rcIW/9gWp3+eaFl5Q8f7xcVLwQybFO4AugBwgimIRWaIt9hMgYSAHzWSFw/N7
	+/1czIJz6eJzg8zFdwhgo7nyV2pG/vi8ytDPPbHvRcLc68a/FEaTGUuDlFju0WaPU26l679Kg8B
	WnX2ElUKTalqMXSVS+7ZAM7Pnj/rdGpc8TTYlQfU7W6c5tf+y1caIkdWLcqPD91T2o+4ExL2/Hf
	pKVoqf51utrlm4W2gvT4UDathBvUMSJ0=
X-Google-Smtp-Source: AGHT+IHcC0WWzrKqr8+Igj35NnjWFuFj+8E1KaR+jWoua9xbcKUEBeLY4nnJZlnbhkk4+Th+Kwau9g==
X-Received: by 2002:a05:6000:4022:b0:3a5:300d:5e17 with SMTP id ffacd0b85a97d-3b60dd731c4mr16367288f8f.29.1753103120265;
        Mon, 21 Jul 2025 06:05:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:02 +0100
Subject: [PATCH v5 08/12] perf: Add perf_event_attr::config4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-8-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
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
X-CRM114-CacheID: sfid-20250721_060522_066858_443D3ABB 
X-CRM114-Status: GOOD (  13.39  )
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


