Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77491E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmWclsqjoRWfqPrE0WD8+jPpX9G+TTRqhb+EOtWuV1I=; b=Gdin0PRK9pmBL/BQXv7jLfedla
	StJN1ZgdkqmEc0P6WL8Td12Gk1hfHpkl11MdoviGtzJy9b8K9cuD2xzcWRQDMmvdxEAIdwrwQhN6J
	TVutO5WgTvn5ZUSwqmN5O+nRFoMUrVhEN7c9l6DEJ4kwIrbozGuFViUnwXgnAAwQUA6e48y0jIXI8
	irDCi6shKOov57ezqjUtNkiYlK4BdiDqsCVZY1o4qINPbB4WkQS8pGW+phXwu95E2QCrBkEF4XGGf
	FfxoL9Wj52CQNHV/haklsBGaD51IzHPiptCK72eDjV8AD7RtRXvGkbSmbxjLbygM+UmGJYLO4Jsde
	QHCnD7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2Ur-0000000BoLC-1ERz;
	Tue, 24 Dec 2024 10:50:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2P8-0000000BnCb-39xX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 10:44:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385dece873cso1929637f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735037085; x=1735641885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmWclsqjoRWfqPrE0WD8+jPpX9G+TTRqhb+EOtWuV1I=;
        b=OBN9a6f3s+BOMrUs3Q4xATvxC5HIGeJq7ECprL3X68//eBroUo0LZ7i3uq2AnkWL9D
         JZFbUBnF662bP4hU5K2aj4PFm0BxjxbHysfQ48mKEuAnDRwuTvf7gDdlUClbxcvEkJrx
         Bi8zxOHAeZQEsJKmMMr6tfcRTrDBVN+g7tRpkKa6Q182o4+UlMiK3KD8+GjKQhDt1Uvh
         jHy8I18zcDxRIpdZ7TX0dJUQLP076Mq1Vlfl6HXM95nNGbhNI+rTN+UiAwJhnyQc0D2z
         A4JMPxcCNibvhqH4fotDvMZzSoEgpgrspikfdTpZWgGhnHS93vsY1CpqtsP15BJWOFpj
         0OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735037085; x=1735641885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmWclsqjoRWfqPrE0WD8+jPpX9G+TTRqhb+EOtWuV1I=;
        b=mllMqS4TwbyjmKN4SliN+21L1xfyGBtK4RxloXWQkhQA9IAkD498xhtFhLu0+RWTq+
         nY6EurGVht3H5dJ0WGa1dhbMjAeyParBAOOGTjX01Vou2Pe3g+RPb/wZm/keLThPNSY2
         QQOwIHxN9PSK1XjOG0chIi8qZtPXDSDegpYtd02i9AijkBxu29qVJK3ip8cKsmA45qHf
         n0YwiM4hYPrNAh+L7/3WfS6E/QbtqDrxSKki8JvSd/0to308CfE/+aJHoxIJO18/VUmu
         tHUxl2UdyHS0wua1ljPJmJoGuAMdMQNDpe1gkdFAQ+V42kyWrLe0jZYxZZLxNQnV2pnP
         MbVg==
X-Gm-Message-State: AOJu0Yydnt1267l6hJn22KXzqZUmYQOlFftigd9vnARIeE2r9tto2Hu9
	qZsgqkCtySGaMzupfzztJ2GQVx09l0e9ouMvKKPCoajbbtYXmVQAM+b2T+RQfjLG0tE879pG7uM
	v
X-Gm-Gg: ASbGncuY9L3Xc8ELmD7PYUrzhySoR8B2EpzSCljSRy4UbGl7NhbW0H+WvdIQl8XiJNY
	qKn07nlIYgonYe8lV9Hrpifyy6rNzJqTVDCUGF1KIkpwHi8jwUsggfhYrxIfLdU6FXFA3fXBT7b
	/ozK2wzFOLQqdThpgf2pn40vsrny67qUJAkep7G++c84ARl7UPWbPPaHP/JWouspNEjHSa6h16z
	meAH2IZStDfpbysD6/JeW8Rwn9vFSaoXbs4Gtm4G2OWAqLBhMSwV6Q=
X-Google-Smtp-Source: AGHT+IHaBv3kwmR23DfMiPkW/ULQn6dCN6owu8F2AwgaW5A6C+1/Tsu2gsMP3xZT9UiCfrjTvu25qA==
X-Received: by 2002:a05:6000:490e:b0:385:fc97:9c63 with SMTP id ffacd0b85a97d-38a221f16d6mr14526536f8f.9.1735037085301;
        Tue, 24 Dec 2024 02:44:45 -0800 (PST)
Received: from pop-os.. ([145.224.66.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847714sm13938184f8f.54.2024.12.24.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 02:44:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	irogers@google.com,
	yeoreum.yun@arm.com,
	will@kernel.org,
	mark.rutland@arm.com
Cc: robh@kernel.org,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Graham Woodward <graham.woodward@arm.com>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH v2 3/5] perf tool: arm-spe: Don't allocate buffer or tracking event in discard mode
Date: Tue, 24 Dec 2024 10:44:10 +0000
Message-Id: <20241224104414.179365-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241224104414.179365-1-james.clark@linaro.org>
References: <20241224104414.179365-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_024446_803833_0D826A98 
X-CRM114-Status: GOOD (  13.69  )
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

The buffer will never be written to so don't bother allocating it. The
tracking event is also not required.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm64/util/arm-spe.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64/util/arm-spe.c
index 1b543855f206..4301181b8e45 100644
--- a/tools/perf/arch/arm64/util/arm-spe.c
+++ b/tools/perf/arch/arm64/util/arm-spe.c
@@ -376,7 +376,7 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 			container_of(itr, struct arm_spe_recording, itr);
 	struct evsel *evsel, *tmp;
 	struct perf_cpu_map *cpus = evlist->core.user_requested_cpus;
-
+	bool discard = false;
 	int err;
 
 	sper->evlist = evlist;
@@ -396,10 +396,17 @@ static int arm_spe_recording_options(struct auxtrace_record *itr,
 		return 0;
 
 	evlist__for_each_entry_safe(evlist, tmp, evsel) {
-		if (evsel__is_aux_event(evsel))
+		if (evsel__is_aux_event(evsel)) {
 			arm_spe_setup_evsel(evsel, cpus);
+			if (evsel->core.attr.config &
+			    perf_pmu__format_bits(evsel->pmu, "discard"))
+				discard = true;
+		}
 	}
 
+	if (discard)
+		return 0;
+
 	err = arm_spe_setup_aux_buffer(opts);
 	if (err)
 		return err;
-- 
2.34.1


