Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EB8D59D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfU6zNPFNxu9+V9/OLIYdA0tUQo18HdLl5yljJL+Q8o=; b=ZN9yJ3LJFCjUJwi/lx9vCQXFIN
	Y6lRB/ihanoQzX2J5QCsF8lL+KSVV9dbEGBy1t2s9vm5BHfe46yZTDvNf1wi8CN/lC+32e73iwACR
	zR0N/zBIHkpxdGbxxartEMnW8T/h70QzTwR0f2lUMBdShxSG1au72vlWFs9IcGZSOHD5mIYAuDl8Y
	I+JJwbb6w9vMLgtXScTPWfkjUz4LhiMm3gxhu+Ipun17fiqfrjgOVW901QrbI2DhykI2G6XWBwP8a
	9Ajkv8G3JAsWS/Lsizi6h3Y10m/Y4iNHGB9OIepy7Y7BieZSgvVsFA5Fhj8lRuJMoe28lncEyGesU
	yjfsHnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58T-00000000j4P-3Piv;
	Fri, 12 Dec 2025 15:32:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58Q-00000000j29-3k42
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:32:48 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so2267296a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553565; x=1766158365; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfU6zNPFNxu9+V9/OLIYdA0tUQo18HdLl5yljJL+Q8o=;
        b=Zz/u7q4fqOJYfFlzbUJrU027xJ5i5ZYHIKX539ip1JS9kdx+TyqfQPNcnmgiOgjyDd
         GBn3CDJeRtKwkiLX2ua1pZzi/vtrM/wCEG3hqi0BIylJZlXQ9iMUfVM0DU8vsM6qeZfV
         qc2TZVnC1CoHQke1QHXk/WFn/fEUqaIbNKtHxUkJPiRpppV6uj7r49P0N+YYUYxAevYq
         sisKAYglYG/DT8dKkoirTzg1fma+jB+c2mW2XGw6HARdvXB68ZjJ05euJK5y+h0vycI3
         1Jy1eV/9jcB0XsofeHSgYOdgQcPkxf/ZBnXNH2nn0qoV2mOWoNBHqNu7YixZYwW0Os2R
         TcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553565; x=1766158365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UfU6zNPFNxu9+V9/OLIYdA0tUQo18HdLl5yljJL+Q8o=;
        b=lCdO0aKFedW1f0O+K1PbHIMqBzqeqtBP70pX3bcJ79YO+NN0uKCRXhDN2Xxf+YEhQ1
         Ji6hWzhR28xdhHPX99TI/Rr4jjlqkWX52/ZEPCL9EqjIPGFVZrW8IggpQNVw+sd47nVv
         1dD+iUrLLO2/uqW6A+VPtV7+yhFMWKpRVawQVslIIyKOwngjipLhymsJPh3UBMY/hU9N
         75ljPtOx9vMqy4A640HsjqIJ+8awUKEYPNENXBjN8+N95YV5CoLMa++DXDW2JYpNt3yl
         PoPbf+CjTfQMUU8Q10+Wna8RX/FvjqwCZxwihmMV0YgFvEHa2ebmwZLr34jtH9h2Dtb4
         WeVA==
X-Forwarded-Encrypted: i=1; AJvYcCV/88Jv4E3EFqKe0UY3Yo9VpofsgotCzgMdn7lpkoO3n15eNTUxRkipTed7Acf4GoV4bs3tCaILoTAmYKwQX1l1@lists.infradead.org
X-Gm-Message-State: AOJu0YzkzE/haWvWkpfLKHNZlcvPVLtSYn61Ms5eR+7xO30mXE9XKdOT
	Rcj1KbJbBA6NThnddBaJ6PMFEchkFM+QtpFLZu8ixD33XJ7Ja2sHWBxWmztTGy3aJ7w=
X-Gm-Gg: AY/fxX66y4sSd974fynyj22LkHL/JsK7KEYIMM6hi8/ustbv33op9/69xbj09w71pnp
	Eq05Sv0agm4UhpN/QvAoDrDLd9MkGsFIc8g8nRCWfQSxFtfyDrgbfOyAl8KItVAyscwD3VuXjuH
	Mz8ZOxvuNrxHkMMyPGeOLmI8+648zWUonHwq+O5BhIvAD414gxKBOUyLBAFZgMO+QBogYyuSxK+
	WqRqtSr8vKfqQNZotM65ErRgirgu/pwtkPZ3ZsVmJHh2lrYX8I0tnLQtRHPnQ3mkLSUZwKZd0AS
	xUCDLgXJ/Nxrz55dimdRlNZjYq0VbTIIMUJT9rsgF3w9H6UzQbg7Tm6Q2Rb8YWSinU8F5PrTWIy
	HIAO2GtmPu3/MWw61X5BWDKlM7MdWJUQRh6qcpsNP6Rt4brAF1k7s6L9yrZf7bEiIrCxgVOyqGi
	3FhjSFQVenXwQby9v8SypaslDNCRAFX6U=
X-Google-Smtp-Source: AGHT+IGZdm37HxAqsjhy1/5xDaqN7lUTV358c1EAXqBH9pM4lK4FxazOWjwBlNTx1asu/TcDWqtePA==
X-Received: by 2002:a05:6402:2553:b0:645:d764:3fcb with SMTP id 4fb4d7f45d1cf-6499b1e3610mr2444108a12.28.1765553564857;
        Fri, 12 Dec 2025 07:32:44 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:19 +0200
Subject: [PATCH v3 02/12] perf evsel: Support sparse fields in
 evsel__set_config_if_unset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-2-aa36a4846776@linaro.org>
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073246_951716_1281709B 
X-CRM114-Status: GOOD (  13.52  )
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

Sparse config fields are technically supported although currently
unused. field_prep() only works for contiguous bitfields so replace it
with pmu_format_value().

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 956ea273c2c7805c0cb504fb7dcf996f79f5588d..2c26c8d76bed920c7b5b43beb867e4d1bcaa2970 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -144,6 +144,8 @@ struct perf_pmu_format {
 };
 
 static int pmu_aliases_parse(struct perf_pmu *pmu);
+static void pmu_format_value(unsigned long *format, __u64 value, __u64 *v,
+			     bool zero);
 
 static struct perf_pmu_format *perf_pmu__new_format(struct list_head *list, char *name)
 {
@@ -1381,7 +1383,6 @@ bool evsel__is_aux_event(const struct evsel *evsel)
  * the bit pattern. It is shifted into position by this function, so to set
  * something to true, pass 1 for val rather than a pre shifted value.
  */
-#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask))
 void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 				const char *config_name, u64 val)
 {
@@ -1398,8 +1399,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evsel,
 		return;
 
 	/* Otherwise replace it */
-	evsel->core.attr.config &= ~bits;
-	evsel->core.attr.config |= field_prep(bits, val);
+	pmu_format_value(&bits, val, &evsel->core.attr.config, /*zero=*/true);
 }
 
 static struct perf_pmu_format *

-- 
2.34.1


