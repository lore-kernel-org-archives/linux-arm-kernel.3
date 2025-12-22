Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F37EE677E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxU1vsfrqBADbCFBEcH8TNvakDJOOuWqCmLiru2LKyg=; b=AJhrmdiKx4jRNnns0tPNoajx+L
	vhHm2ozodKATd25s5fUMjIFC96VBONLXVQFin096ZQMTP88KHidtKD+h1twnBCUnuzCTt0coYNnhk
	UN5eSwP7KijIqohp5nH9PBGH3MJWh0Xq4CC2j+Efp72VIgah9Hmw/cdmVxbc1ENgSNRdMWor0BWQi
	fe2bdObN5TDO6R6sQM/cUwFZuWbDKKaBBOfopxgdsOKrEvcY5Jdxf40UxnxludGy2oD/aiQuc9R/M
	Z/+S7baJhg6Pv5YGALhCf4sJ+DXyILzOBRKxrMtkHRtE35YbHiqMNr1zfqYTHt0MN4XMKV1K56Hxd
	2wvAu6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhct-0000000Dttt-3P1w;
	Mon, 22 Dec 2025 15:15:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcf-0000000Dtiw-2epy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:15:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so2064920f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416496; x=1767021296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxU1vsfrqBADbCFBEcH8TNvakDJOOuWqCmLiru2LKyg=;
        b=szSdbwmtIjpqKAMrpEqdBIFr8tV2/URj4y/H1nnkSMOagSts3YruASA2yRjrmS8H/m
         Qj2fOrTfDaa10JPXLwewE/0a+Bi90TErhSVMEIAbMR3D++HBye2tF8fBvl+fu7t/DDc1
         oS7EFVgOiGH/fTehGnQZDsq4w9pUqZc8i1XLNMi16EjAW4V4OgglcXSe7nzvuatmyid7
         /fzJikb8D7ljb/8peIYPFBYHLJquuLM9j85VHzULsYTtMCNNIaU8mdlUfegnht/IZ5W8
         T27PO2YDyfuwzkOkpdPuqc2E+jtvWn0LPEy7pJssCB4/hA+8XQb7pey426RigBxrz10P
         6y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416496; x=1767021296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zxU1vsfrqBADbCFBEcH8TNvakDJOOuWqCmLiru2LKyg=;
        b=tC/subG47mnqRzlMgj13XfMZHmc7qZDiOFhDFo1grZ4NbTmphmZNHeQmJodJOq778H
         fTNuT3Wy+/eL/u18j19OFJtkhwb6ZZ064gBmrJoUMNvk1aa/hRSTsbN8ihZx1hS7sax5
         pFsgoWVDYg3Cl/09wVVMS6xJr/2E6P++zzurxoNmUgwgeEVR9hcFrRlt+ajCNE7RHls+
         uxQ1xCsP1QYyRzOeYmIxkkW+CsEdGDrOpolSSUSJ5C8fgGDl1HbEmePea1RfXXSMOD/H
         NZ2+RuGB026wOIc5HIkD1KKEAx6XmKjIpYyFjhGLcRd9PuClG7JQ0AKHUCXfsRcpJwV4
         h/ow==
X-Forwarded-Encrypted: i=1; AJvYcCXLeskysVjySgucHpAyHPx+q30GMG3sJJRNMBgdQUAAZxGa1gk/VJK7lxeF8dB5hpI9r0iY8h1sA2rhvLZJMs0Q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmf6CXpjXTZnYT7Z0vV/6flvM8rJu5dg83Rmrd6RJ4L9vV6zZW
	xOv6gtq2KUouEBBbXK/Nkj4nXlWSsDs3IH2Q5HQ92uF3GJmtyGbbgFR7yfWn6NUxmPihGsuT15Y
	Vr2SzWUo=
X-Gm-Gg: AY/fxX7jRacXZ0ry6r12xZNzJm3OkXDd/LWh7xRWTcuKWkrRlRxE4Prx5+6FoODfAeH
	luZmbaFr4ymNk9DpiBl6afwAd+HJIBDbCVn91dz8gAom55wopthAvJnuFTTD2mmSpG0AV6I9Cbx
	J1sVUwy9/Ou2xNGngM8PJD77tBTt+BXG2MUv1NNf4p07nqcfcc+15AUh1VH6xzYLYesMLxZI2Hd
	YFDiS/WpwFVbCGQcIV6gtHkqv3tTOWX4UHVDGYYt6XVtJ4IKfIQCCrDZJCIWZb35YmpZQTDZjRo
	m5aBVZJdYLIqJcTT0HAHWzvGbn/jA9ZgsCAcTlys4j242vN3E8atjinYvx9PvsG17iyc0jembLF
	dBUT3DQGJkZFGaAUkIlCCyaDXs9pDLRCAC8ieluwf0ic/kO/KGrY/TrnR5k+2dzf3KOLhHXazUL
	rgdchZ28twhFcfh/a481TA0jvCpXT1uBE=
X-Google-Smtp-Source: AGHT+IFfTabNMYMJBYLmezzBRrk87qgMJIlKZFfgncn3j2IGaAmUdNJuFWzm+rqM2oVLN7iElkhpjg==
X-Received: by 2002:a05:6000:22c4:b0:431:9f1:e4c7 with SMTP id ffacd0b85a97d-4324e4c9d76mr12946406f8f.21.1766416495549;
        Mon, 22 Dec 2025 07:14:55 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 22 Dec 2025 15:14:33 +0000
Subject: [PATCH v4 08/14] perf parse-events: Always track user config
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-james-perf-config-bits-v4-8-0608438186fc@linaro.org>
References: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
In-Reply-To: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
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
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_071457_716775_9BAA749F 
X-CRM114-Status: GOOD (  18.76  )
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

Requiring the 'pmu->perf_event_attr_init_default' callback to be set to
track user changes is a bit of a trap to fall in. It's hard to see that
this is required when depending on the user change tracking.

It's possible to want all 0 defaults so not set it, but at the same time
still do some programmatic setting of configs with
evsel__set_config_if_unset(). Also if a PMU reverts to 0 defaults and
deletes its existing callback, it will silently break existing uses of
evsel__set_config_if_unset().

One way to fix this would be to assert in evsel__set_config_if_unset()
if the changes weren't tracked, but that would be a possibly untested
runtime failure. Instead, always track it as it's harmless and
simplifies testing too.

Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/parse-events.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 1f6e2213326d..c8f2962a06c7 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1528,12 +1528,8 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 		return -ENOMEM;
 	}
 
-	/*
-	 * When using default config, record which bits of attr->config were
-	 * changed by the user.
-	 */
-	if (pmu->perf_event_attr_init_default &&
-	    get_config_chgs(pmu, &parsed_terms, &config_terms)) {
+	/* Record which bits of attr->config were changed by the user. */
+	if (get_config_chgs(pmu, &parsed_terms, &config_terms)) {
 		parse_events_terms__exit(&parsed_terms);
 		return -ENOMEM;
 	}

-- 
2.34.1


