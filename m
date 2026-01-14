Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C610D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxU1vsfrqBADbCFBEcH8TNvakDJOOuWqCmLiru2LKyg=; b=dnZlvhoK67fMPakuEsJ7pL67mK
	wjE+Bly85p6mLA2+D1mCzRJAmXdfWdZTms4tgoA5D1VSed+N0SrpJ1cDovo7JLcnuHYZBpJwHr/Pg
	9lefFmYr3+maNnjaJPiXWck3uyOKG3FCGfHDTDeKJeNFcPea4YDD3lHOSm86MAcQTEyqAhOn2Rh8c
	ZDtCnlceK+bhOeP573Zqc63mB+8ErLCWb+TB5lgAsSQEcwbfgZLkyrQRlqcxOGimopOrWhqijzzOM
	RJnMVyBwKCg8dlLzWSAOSTQQ1I8NzeJT4fhSkZOoIr4DS0pwG/mkSXnyPfu4aWWIyDubpeC52LOlt
	IvkQd5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fu-00000009oGl-0SzG;
	Wed, 14 Jan 2026 15:57:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fl-00000009o6j-1BOF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:50 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47796a837c7so13365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406267; x=1769011067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxU1vsfrqBADbCFBEcH8TNvakDJOOuWqCmLiru2LKyg=;
        b=oyUf9pqWrlgqnCr3wA3R9dsCMDYPMDdhQBLt+uGgPj7nWSXGb1Fn0XyxTVpwGn7NXR
         EKON4Yp3a5f+dg9VsPyh0djEl0LX8mo0MlZcnvPEhunB1U7GLUhzcJKXFsRUzgTruGMF
         Fr0JUKunIfp9LIJ3M2AoZ29Hwsx6cfDFB/ogk1dcUDTuWsPdnxo1gITLvvjaid4+yHOY
         NSDJD7lBXZeeq5CwlqOl+geE8kg/NVOmlQLPuKXf5fM20vKxpjDgkIfP1Ggobf7umgYo
         +dAOCxko959IJuJA1VVghQU0gPOYO81klJD9Z+34AnLaguLhyiTVW6ipPEsa+gOlC8EC
         YmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406267; x=1769011067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zxU1vsfrqBADbCFBEcH8TNvakDJOOuWqCmLiru2LKyg=;
        b=A8bjOOBWN349DDud9gbHX+6NGRS0WzBA5eN0+AOVUBdpz74r8R+ZZnDoDe3dRf4zkU
         +vAb3fs0cpZXo+Y2EWWo+gboM6t8u4Opket4pbA2iOJ2bMg+YppnXk6XvvpdZGaxq927
         WGQi4DcYJb7Lrhgs9f2X92/wSlunW2OGuJN92yJd0BS/OWRi86X5soPChI7pslO9df5t
         VL5LpHfsRm4I5+RvCOoPWntSpx9UIrHobGf9vw+H4HNl/0JvR0btvLlL4fwJlTkeKCkW
         nCD9cTpmJS4+0LJEzcyGNDPIIlRThzy0ZPZ+CcqYOa07eS2xheEG+wh8NfR76LSaXECF
         eqKw==
X-Forwarded-Encrypted: i=1; AJvYcCU6NY7tqcIb0wZUOGf8gH35OAWgxvsiA42Qu9RCXwX4mdc9mtOw9PVyT5vEaK7n3Rfe7JrFGOpfFZeE5UfnToSL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+0mICqA6kTWoDTuN/XpumT3jxY3CaGxxSLhv/5Ux5Lw+nkXmZ
	aK4NQYm6jGt1P+/f9lK7tr4NcXSvZ3vAn0zDkI8zR8u0tC8jy+lkPxJo30om7LLB7v0=
X-Gm-Gg: AY/fxX4pMc1DZUSLRW0+/qd7+oDRqzNnvyCG0ehCnHA6yMNlAWCTzfjJGebnI+clnoZ
	fNVq39sh5R6sQJe9Td09zCu74wcG/9176OLbZe80tsk6uyjb+QuuNGPCV5KsCqn6yacmtqTJWc5
	fRPnkjROI//HamXzknmEj03jqNbioAjLZiKfMVupPBtEEOUl/P3C7n3gx2utNg1uFkz4K/ZCsjM
	ujSQt9tinmnV66oREIk0KkfueWkR3t+nMy/xPMD7oNptOMgtvLWyvzEzPoK1iurehxvNIshFloi
	c7Woj+w2iOo7X2rcesPQhRfMNazFCY0eYqiWUKSoA1pLa2TUMzKC1g7qTg7Vjqdyd190+tnTlUE
	DTNzHK41cRRnMV7xcC2coREeZ002ihfLndn+YmR+DqHXeuud47/EcXpgBH25ddOghpw7lRnEMy+
	t4kFoTyRQSqZTfAjw1DfukYgPSpNzQ+i0=
X-Received: by 2002:a05:600c:3544:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-47ee335494fmr40564695e9.15.1768406267278;
        Wed, 14 Jan 2026 07:57:47 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 14 Jan 2026 15:57:20 +0000
Subject: [PATCH v5 08/14] perf parse-events: Always track user config
 changes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-james-perf-config-bits-v5-8-0ef97aaf1ac0@linaro.org>
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
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
X-CRM114-CacheID: sfid-20260114_075749_347187_F9096377 
X-CRM114-Status: GOOD (  18.47  )
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


