Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F097D59D66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rYOutVV+nlrAeFTj6aX4/QG8Lfx2y/6jkTrJCZiYXg=; b=hvsUttaXhSFuDgkY00H4pbhhWK
	qAfrHcxxyvAJEqTrAtm6R3pwQvn74pqNauAFE+sY5nS41POsJjjc4cytjy2IPdrz1vwAEesufEdb4
	6je5buNAnRdJ8ct6yz1tiR+Pqjje5lB/gPfAHfOw9snpEdM7xB2iPSNdThZJhXtX4oibFp23o8lYc
	E4zLG82RQfQYLm4qo7Q/uk4UHq+cqaFU1InWelE5Dw8hcCkOK6bBt1Z13SFz+eC0OvASiWwTQUC6b
	NLkQT0exAykW9VWKE1V/cFZLcUq+9+hrVYnehHAdcGf4Xg7ZO6hRQZSCVy0dh2xx3P2HyG21hz+VR
	x6zORu4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58f-00000000jCO-48mf;
	Fri, 12 Dec 2025 15:33:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58a-00000000j6I-07Yg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:32:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so2473156a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553574; x=1766158374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rYOutVV+nlrAeFTj6aX4/QG8Lfx2y/6jkTrJCZiYXg=;
        b=Wys6zP9pC3u4G0CvJbsNj6dXxGoNZ2NGKPlxnqrOKqdjk/7Tg2JC395EYjLWGecfeg
         9KK8tVFdU1YaiNuxYvfWWrhIhlIG+hQS4ookNkA3C5TbHiApZZzLhDrtVoMdUOqdjcY9
         IE9g2gT5zRr76izL4HzXkW4bAvl3SxZ94tLsfOQe9pd2x1bdJNzs3vDivjvlHt2H42Iz
         HKJxLQ95JQnu3vvUdoqbpWCXZeUFLMPIZsrSibPvnZCiivFREIZDRqqFRTFGTrv5mdN3
         dzv9+j2lfcn5MHUZ3FPeEesSgQBqaQBHeKbOM6VSJXTe8iYcJmwUFu3O/XA+oTKW6jnK
         9JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553574; x=1766158374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3rYOutVV+nlrAeFTj6aX4/QG8Lfx2y/6jkTrJCZiYXg=;
        b=j8gNCAs+wavWLuq2GXREcKA0/cLNCU85MHD+5bmatEvWURT2YB/Tz/wqOkzcwoxHcZ
         haoRD24qapgxvf+P3WwLBqTsNFFRaOwP59ruQDrhvs58LNcIz3fDrviRS4mi6ORwdmrX
         zTqiywtzFankIbSNX16TR0+3/+XZ63E0M5zDcXHi9pL+e04VnIE7k49A1ufhNZO/D0Pl
         S5aHBXktxn5hAxrYk18flBjeiU/BO4obg7nBXCsfOc/YmPoEjHnvTug5rgOyXVmrKVzL
         aRC0LFjqsOIJxZ2sUrg8fHBbTjXEL7cXOsyxTx0Ec/IaIc2tpAXe7o/ryeiCCt6LL5lX
         hgyA==
X-Forwarded-Encrypted: i=1; AJvYcCXevZawJWM7oI40ej9ZVjh28FTn6V6Kb/w6G46knJCz05Rrt0EtF7Kvc5GdbtOsL/Ckz+OeE3k3BYZwW3bXsMyK@lists.infradead.org
X-Gm-Message-State: AOJu0YzKBQ0WEUp1z/plN0VYjljr72fv/2LaaTKVhwOJuOasih6Ow1wv
	1LVGJjSujn5tOvL0lDi/HB2K238Ii4D9l3BX5v3f9gFbUO/9Su1XwX6QZ41ahCrGfUE=
X-Gm-Gg: AY/fxX4W5oaLd7x5e3t6/2C2T3zS75malhI6nXA3dOTm/hOwyzsC7q7jDu7Ww/D9H34
	2wL8Msf22X75anjkR3OSd4XMxMaxfNEutv5L4Ng+1mP/gqvbO2VfrN/4+O7iREE5BX3T9Jhhlwy
	NPY0UcFlJYEZuAl4OIji4xAssVpoRFSlM21Tm+HbL3+kt2Mw6wkOaxcWGLMWPt5o3+eWgJXSvLf
	54JSiu1xhg1njISRa5/U0BBt15sy3XiWreUL1+RMNZIJL1KpeghykS3aXy6+fRJxhArX/WzolYE
	SMQJ1Zw4Gpy5jWGor2xsBCAI7phIeNa1po0vxPRU3V09dEWyAKOOfdomBFNG+X0roJ6x38Z/MdJ
	ReqzP3e2fbQkE+Kc3ZZJT23juINFi15WhhtpdMDqDsQzadAkhiC7RMpFd1gHXxYaIEVEIDvyR3X
	1yV/IMWDPif9AphXhj4cy/
X-Google-Smtp-Source: AGHT+IHuBXF9wDV6j0xVcn3kE6xUIeXTjWm8gIVpYwkhI0QrZi9H7M2hxVZUiLHgfc5qp+HHWr/WGg==
X-Received: by 2002:a05:6402:2114:b0:640:947e:70ce with SMTP id 4fb4d7f45d1cf-6499b12ff90mr2515331a12.5.1765553573963;
        Fri, 12 Dec 2025 07:32:53 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:53 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 12 Dec 2025 17:32:23 +0200
Subject: [PATCH v3 06/12] perf parse-events: Always track user config
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-james-perf-config-bits-v3-6-aa36a4846776@linaro.org>
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
X-CRM114-CacheID: sfid-20251212_073256_104137_51A385C7 
X-CRM114-Status: GOOD (  18.39  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/parse-events.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 7ef63b808d0542999fd1303b9f94cae68e38030f..bee9233437753ff706d6b149503a5e660c3972d8 100644
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


